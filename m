Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3BB56729C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:29:08 +0200 (CEST)
Received: from localhost ([::1]:60274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8kU7-0002JR-Dk
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8kSj-0000oy-IA
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8kSh-0005ll-7b
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657034858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9azJ5VbY5mxi+1ZO6UTql5tK+Hu0EOFrBdGZNFOcV3c=;
 b=VxNbTfS8oQeg4nK4xqnQt8WaoP5dsValhmJCV4FNybQfdCJJ2v58oSm5g2aoIrkEURua6Y
 LuBjmnyw9cw/Yx3i22AJMDhxgzEcdzDSfN3SX9IaK/OPY8vSeqZEyY9zKd5kM+a2rqpEon
 4Wh3PADtlcxcY1kPSOTa9m8oLuH7HaU=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-3M3WIW5bMyCD7nSrUwCeRw-1; Tue, 05 Jul 2022 11:27:36 -0400
X-MC-Unique: 3M3WIW5bMyCD7nSrUwCeRw-1
Received: by mail-il1-f199.google.com with SMTP id
 x11-20020a056e021cab00b002dada9d2a50so5986570ill.15
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 08:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9azJ5VbY5mxi+1ZO6UTql5tK+Hu0EOFrBdGZNFOcV3c=;
 b=g6JWVbyU8Jo8e+VTnKXoy90Do7BYdntuByW9cUvRFstSB+O3l3yKhUUXUmTqqjFUMg
 GeLOyQURvYGDINQMjeU1EegcAlRjW+vOf4vbuztz4AmUDsxrdcir5aq+EUhHx5uea0Km
 ETCjwApvllk4owo1eQ/wlseHloUXIjl9kDrK1JhGMsyW2g0LykdWPmRhgXJsWJBVu6dG
 wyC5Jn04eWJ4UZz6IBN8R3MWubxaDSNZeAQ/zvStkUbGxiqQQwosSVPiqWvbOUMfsVFZ
 nqUkVdeveGtRCSvEFjvvbOwNbYjkHQUaKthiCHIKnF+CCeUAneUmKT9dtTGvPIGmpqMk
 G16w==
X-Gm-Message-State: AJIora+T+aMVZ1jFkjlbW0pEdSBowyyco706IUcbc9Iv/9XvN/QAe/sw
 XWGKZEhF5otdC3bSJeb9ihMf/q+2EbhAMVz7q6HPg6VOkMqGaVFH2NWcMv+wa8HLfcGEcqs/isc
 jmjuYhwMoTMnsCBe2hCHQIpT/szonwes=
X-Received: by 2002:a05:6602:2e0c:b0:669:b7a8:fb0a with SMTP id
 o12-20020a0566022e0c00b00669b7a8fb0amr18103018iow.121.1657034855768; 
 Tue, 05 Jul 2022 08:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sFYEbnAPacOnMaJVKSUs5FdxlRhfhEQIx9usW3t74p8rduFk/NP81/4TXn9uERq2BkAG9sAggjND69a0iGgwU=
X-Received: by 2002:a05:6602:2e0c:b0:669:b7a8:fb0a with SMTP id
 o12-20020a0566022e0c00b00669b7a8fb0amr18103006iow.121.1657034855561; Tue, 05
 Jul 2022 08:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-6-afaria@redhat.com>
 <4f584014-8bcc-6a84-36f8-93ce595a133f@redhat.com>
In-Reply-To: <4f584014-8bcc-6a84-36f8-93ce595a133f@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Tue, 5 Jul 2022 16:26:59 +0100
Message-ID: <CAELaAXwKA0ALAa_CZVFW60PJEHPXhxcoDO8HMQ+3qP6308q3Xw@mail.gmail.com>
Subject: Re: [PATCH 17/18] block: Reorganize some declarations in
 block-backend-io.h
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 5, 2022 at 10:18 AM Hanna Reitz <hreitz@redhat.com> wrote:
> This moves blk_co_copy_range() from the =E2=80=9CI/O API functions=E2=80=
=9D section of
> this header into the =E2=80=9C"I/O or GS" API functions=E2=80=9D section.=
  Is that intended?

Oops, thanks, it wasn't intended. Will fix.

Alberto


