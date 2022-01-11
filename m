Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5893048AE6C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:28:17 +0100 (CET)
Received: from localhost ([::1]:49114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HCC-0001q7-4x
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:28:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1n7Ghg-0006pW-GE
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:56:44 -0500
Received: from [2a00:1450:4864:20::134] (port=44971
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1n7Ghd-0004jb-Bx
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:56:44 -0500
Received: by mail-lf1-x134.google.com with SMTP id o15so2891989lfo.11
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 04:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IwbPFgfm+iJu8MSZKZHgQ/Z3nc8LfbAYbsUaIby8k5I=;
 b=OkjgSGCf6ypDihJh4UGY1V0SY8w3QbVQ16vBr+GjR0EQ4C+AaH4sr8PrUqonwGo2Lq
 8NJme8GITiDNhx9VDVl+Rt3THVhp9s++stsQ4aoN3d1nVf2GsVWWyOPz7dFXECVxjrVe
 YKixCtoDHq8JnMqyCgcFnxAVSW05qEMguXuJt4++4bukiJKg146X1ldyeSSmiDS6Fe3R
 tueem5cqs4nhIJAW2xk0MQGZz594vU3y4bRu6U/dtX4I53KukIX1LKR3pSJfc5lslSNP
 Lws73Wg/a1Gbvp6MpVGx7cPqKYefo8v8VAeB0JvsdGHhveuEOsEjqP4a0bq/EbvEa/c0
 LFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IwbPFgfm+iJu8MSZKZHgQ/Z3nc8LfbAYbsUaIby8k5I=;
 b=z3k9ovY4vK+QrRxeowQVKcZ8rtnKitS6i8qejwEut5YleCuzqi+cIMDPezfZxfq5Zr
 uLWisLa3W3ssN1QmkpCphbGBLAXHZ9qImM93vJqcsebRLkJKUOFTsXZxLVoPwLTjk4JF
 fgeXFMNHjJd9MzxAF//tpVUqgjklaPxP2UNv3gnMgqAGUDh0xGunYRUYrAUSMW3Mj04i
 cb7kE8ZnU5EgAgJ9Y6G0xv4Grtdcrc5do7BahePtdUlG/6BGHBcDb8/H4BNGM44XsGIv
 wSzm1YjiEMwHd4NY85Eyvuq7WF7ehQsFQiNsi9gn7/J+4qQ1SqiGLUbdPpkPpag++QcH
 UJTA==
X-Gm-Message-State: AOAM533TKR6GFxlIazkVDCi0u9P8qzKi7D1hUmsjPq5Uv2o2RgGnniGc
 d/Q6a9U1DqQQkpU4wdz1W1UkJDFborSxZSluUKzDDg==
X-Google-Smtp-Source: ABdhPJwHLNNcaquHl3y1tNfEIiwAXB33x9Qax48iw7la50ylYuu/dK3bfbNxyvmMmxAmbTv+98bL06bbupwra4u8BGQ=
X-Received: by 2002:a05:6512:6d3:: with SMTP id
 u19mr3607789lff.310.1641905795626; 
 Tue, 11 Jan 2022 04:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20220111120830.119912-1-david@redhat.com>
In-Reply-To: <20220111120830.119912-1-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta@ionos.com>
Date: Tue, 11 Jan 2022 13:56:24 +0100
Message-ID: <CALzYo313D++5d3QBee56qspcgDHLqGuu4a+RA99KLtrw7hhGKg@mail.gmail.com>
Subject: Re: [PATCH v1] util/oslib-posix: Fix missing unlock in the error path
 of os_mem_prealloc()
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::134;
 envelope-from=pankaj.gupta@ionos.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michal Privoznik <mprivozn@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> We're missing an unlock in case installing the signal handler failed.
> Fortunately, we barely see this error in real life.
>
> Fixes: a960d6642d39 ("util/oslib-posix: Support concurrent os_mem_preallo=
c() invocation")
> Fixes: CID 1468941
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta@ionos.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Michal Privoznik <mprivozn@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  util/oslib-posix.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 9efdc74bba..ac0dbc2adc 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -683,6 +683,7 @@ void os_mem_prealloc(int fd, char *area, size_t memor=
y, int smp_cpus,
>
>          ret =3D sigaction(SIGBUS, &act, &sigbus_oldact);
>          if (ret) {
> +            qemu_mutex_unlock(&sigbus_mutex);
>              error_setg_errno(errp, errno,
>                  "os_mem_prealloc: failed to install signal handler");
>              return;
> --

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

> 2.33.1
>

