Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0186554552C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 21:56:05 +0200 (CEST)
Received: from localhost ([::1]:47526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOGC-0007Pb-Hg
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 15:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nzMEF-0006Lp-9K
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:45:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nzMEC-0007Rt-1C
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654796750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xstsOmmVWmoruCaRCLedKFvz4w5GEslPuKWfCCAa4k0=;
 b=dkbl7VEJuvJKVN0w2GP/yrsvCs6RXFsOOkEsBeqzSv8WAfRcW8oS2eP2Dr3N8ikGaLXa0R
 2XpRgED8ADWuLjcjFKI4GQRdXEhzy/fUzkewcizhxlcg/azuacNOhs4UoRh7rwBp/R+A5+
 QeJ+Z7XEDeFNjsJhDR16TvVbaeQbctM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-kgKiotgoPBSiZ61OIECa0A-1; Thu, 09 Jun 2022 13:45:49 -0400
X-MC-Unique: kgKiotgoPBSiZ61OIECa0A-1
Received: by mail-wm1-f70.google.com with SMTP id
 z13-20020a7bc7cd000000b0039c4a238eadso4175953wmk.9
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 10:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xstsOmmVWmoruCaRCLedKFvz4w5GEslPuKWfCCAa4k0=;
 b=5lBNCRpGUmB9pqrPuFb3wzgHMErxBpgs3xTQUP6160idXS7kWyHIuMZA6d4CCxmStk
 G0OqwRRBapa8jWzcQwFo0GsyZDLbUXYwXnpPWAUe4thNgZIfJjnqPK3JFnC833jHhrkD
 WNC2UxBmNyn+OwVS1ij6OXYK3Ob7s9UzDIK2JfJx1MjXoIOPjFg7ehrIq9tXYrrnju6O
 UKz1bmzxgTITfDhHON0DrLNIewHB2K+CLKuxbaTgTZyOqZrblTJiRHMHJeNidA3iJMxs
 rvGEd9Jb+ZFO09rzj/7cVz+HiqccexaoTdy5r2IpSShcWCK6bZbOArSvvAbw71dlXydY
 eB3w==
X-Gm-Message-State: AOAM53332jbz7oXPqKp+ZpQcNOSbGPkLMado42u5255k1kE6/tiixCvp
 SOkptvL8IgKcxBhF2o12NPYk49iC507E03dT7QlifES59pKUo1q3i2gMtxSNwQdQgEnHsoluMMx
 iG/pueKkS1vcCWxE=
X-Received: by 2002:a05:6000:1a89:b0:216:8bf8:ff90 with SMTP id
 f9-20020a0560001a8900b002168bf8ff90mr28470043wry.546.1654796748367; 
 Thu, 09 Jun 2022 10:45:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAcVQADVDdJFekBFlgV/KBS+HY5hz6g/xvymjsnkA8Ckn7qTIYJq2UKVTxAP5QEjoxR5rdjw==
X-Received: by 2002:a05:6000:1a89:b0:216:8bf8:ff90 with SMTP id
 f9-20020a0560001a8900b002168bf8ff90mr28470022wry.546.1654796748095; 
 Thu, 09 Jun 2022 10:45:48 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-40.retail.telecomitalia.it.
 [79.46.200.40]) by smtp.gmail.com with ESMTPSA id
 o34-20020a05600c512200b003944821105esm31440026wms.2.2022.06.09.10.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 10:45:47 -0700 (PDT)
Date: Thu, 9 Jun 2022 19:45:44 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 qemu-stable@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Nikolay Tenev <nt@storpool.com>
Subject: Re: [PATCH 1/2] linux-aio: fix unbalanced plugged counter in
 laio_io_unplug()
Message-ID: <20220609174544.atwsgrmgla3gd7m5@sgarzare-redhat>
References: <20220609164712.1539045-1-stefanha@redhat.com>
 <20220609164712.1539045-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220609164712.1539045-2-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Jun 09, 2022 at 05:47:11PM +0100, Stefan Hajnoczi wrote:
>Every laio_io_plug() call has a matching laio_io_unplug() call. There is
>a plugged counter that tracks the number of levels of plugging and
>allows for nesting.
>
>The plugged counter must reflect the balance between laio_io_plug() and
>laio_io_unplug() calls accurately. Otherwise I/O stalls occur since
>io_submit(2) calls are skipped while plugged.
>

We can add a Fixes tag:

Fixes: 68d7946648 ("linux-aio: add `dev_max_batch` parameter to laio_io_unplug()")

>Reported-by: Nikolay Tenev <nt@storpool.com>
>Cc: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> block/linux-aio.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/block/linux-aio.c b/block/linux-aio.c
>index 4c423fcccf..6078da7e42 100644
>--- a/block/linux-aio.c
>+++ b/block/linux-aio.c
>@@ -363,8 +363,10 @@ void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
>                     uint64_t dev_max_batch)
> {
>     assert(s->io_q.plugged);
>+    s->io_q.plugged--;
>+
>     if (s->io_q.in_queue >= laio_max_batch(s, dev_max_batch) ||
>-        (--s->io_q.plugged == 0 &&
>+        (!s->io_q.plugged &&
>          !s->io_q.blocked && !QSIMPLEQ_EMPTY(&s->io_q.pending))) {
>         ioq_submit(s);
>     }
>-- 
>2.36.1
>

Thanks for fixing this issue!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


