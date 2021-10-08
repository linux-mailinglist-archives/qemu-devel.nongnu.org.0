Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47BA426E2A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 17:54:53 +0200 (CEST)
Received: from localhost ([::1]:58348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYsCz-0001Ot-0d
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 11:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYsBt-0000if-Mv
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:53:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYsBp-0005yG-JS
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:53:45 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k7so31041545wrd.13
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 08:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4qGb+0mHOFYHxpWDZgBrGHZYGZWNFNDtMTgokCRZz4Q=;
 b=uiOwGoCwcf/0sm6v2AEl8dqHtSQcMS43ZHMthO127vPPhgKOCrhgaruXgnJvvvJ1Un
 e72KLEfVdpw2vY+6rCnglYLqSKLU7o09ZkXZtFMn/2wPoqoZfe8O0edi4e7iVnm0w5o1
 7aeCj62DVrqC2Z7fp2F8QaT1HnO96xWEhistTEVrmN5bxjNiCX1mpf3jpBD9n86NMANK
 F+Pz9sDZGfHWypv/T3kaFJPbQ9OMw1GyprW8Y17fto0wCY2CeepFdTU4uchgbhvku7UO
 fJgDvLPO2Wl90xF5sZE3a5T7tgbhPcukd+BFNR3q3sYEJ+uSDOD6i3it4A8Lej/4bUr+
 5Cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4qGb+0mHOFYHxpWDZgBrGHZYGZWNFNDtMTgokCRZz4Q=;
 b=3oedB9LDqpsqJxArl5njkrQ2nR21JrLu6jyCgYf+fP7M2Xa8P8KZUjrrdJtjpvDjV3
 Wf1COVbAMzGJlP+Tugvxb9d/wK04MUcabWKQUr9hwv2ZoTi76x/3xCZzmMoheycgoLIu
 Qg1Iixp/qk6oQVg2Y0TXBtKejDPcqmYzV23gvCiWnfjG/nGh8OQcvnMA+b9cwfAQlq06
 6Yv95yKSqFexsAfn+23m7Sm4HJF43zbmMgNGsuIpHdHAbm9mKTgW7ulCTaFWDaRjLAe8
 uQ9O1mAWOIyjWKErfautURgRTe2oRrj0F4tt98n7ddPC4yLh8Evf1reW3p4c+rXfFLXe
 WcaQ==
X-Gm-Message-State: AOAM5336Gf39MQchfo3fZg0CvC8Xspgz+gXFkMf7vM0NopVAkRLIoPVT
 Ksyj3DLnI2Cnw7QgdylZtG0evw==
X-Google-Smtp-Source: ABdhPJwfSLmgcurNnvddsWw9p4hYCAqbaW5L2dZaM1KIAJt8bms5A67OVLd7hvLcmK3f43BNqIB2Jg==
X-Received: by 2002:adf:b34c:: with SMTP id k12mr4973302wrd.1.1633708419293;
 Fri, 08 Oct 2021 08:53:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 73sm3091234wmb.40.2021.10.08.08.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:53:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C2231FF96;
 Fri,  8 Oct 2021 16:53:37 +0100 (BST)
References: <20210810134844.166490-1-ma.mandourr@gmail.com>
 <20210810134844.166490-3-ma.mandourr@gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 2/5] plugins/cache: implement unified L2 cache emulation
Date: Fri, 08 Oct 2021 16:44:49 +0100
In-reply-to: <20210810134844.166490-3-ma.mandourr@gmail.com>
Message-ID: <871r4vcy2m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexandre Iooss <erdnaxe@crans.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> This adds an implementation of a simple L2 configuration, in which a
> unified L2 cache (stores both blocks of instructions and data) is
> maintained for each core separately, with no inter-core interaction
> taken in account. The L2 cache is used as a backup for L1 and is only
> accessed if the wanted block does not exist in L1.
>
> In terms of multi-threaded user-space emulation, the same approximation
> of L1 is done, a static number of caches is maintained, and each and
> every memory access initiated by a thread will have to go through one of
> the available caches.
>
> An atomic increment is used to maintain the number of L2 misses per
> instruction.
>
> The default cache parameters of L2 caches is:
>
>     2MB cache size
>     16-way associativity
>     64-byte blocks
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  contrib/plugins/cache.c | 256 +++++++++++++++++++++++++++-------------
>  1 file changed, 175 insertions(+), 81 deletions(-)
>
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index a255e26e25..908c967a09 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -82,8 +82,9 @@ typedef struct {
>      char *disas_str;
>      const char *symbol;
>      uint64_t addr;
> -    uint64_t dmisses;
> -    uint64_t imisses;
> +    uint64_t l1_dmisses;
> +    uint64_t l1_imisses;
> +    uint64_t l2_misses;
>  } InsnData;
>=20=20
>  void (*update_hit)(Cache *cache, int set, int blk);
> @@ -93,15 +94,20 @@ void (*metadata_init)(Cache *cache);
>  void (*metadata_destroy)(Cache *cache);
>=20=20
>  static int cores;
> -static Cache **dcaches, **icaches;
> +static Cache **l1_dcaches, **l1_icaches;
> +static Cache **l2_ucaches;
>=20=20
> -static GMutex *dcache_locks;
> -static GMutex *icache_locks;
> +static GMutex *l1_dcache_locks;
> +static GMutex *l1_icache_locks;
> +static GMutex *l2_ucache_locks;

Did you experiment with keeping a single locking hierarchy? I measured
quite a high contention with perf while running on system emulation.
While splitting locks can reduce contention I suspect the pattern of
access might just lead to 2 threads serialising twice in a row and
therfore adding to latency.

It might be overly complicated by the current split between i and d
cache for layer 1 which probably makes sense.

Otherwise looks reasonable to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

