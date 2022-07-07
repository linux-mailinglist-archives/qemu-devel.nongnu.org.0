Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C29569AC6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 08:53:41 +0200 (CEST)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9LOO-0002iB-Fk
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 02:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1o9LKx-0001Dt-L3
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 02:50:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1o9LKu-0004hZ-84
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 02:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657176603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HYZD4q4Ogs5GuDxKzq0/L+o14kQz1mG01BvbbrR5ci0=;
 b=SFJcMgNKc3W+BRcAcpzddV0rnBSgeucR2fjgVMW+MiLzmP4O/Dr4M9ySMUql2Kb0L3yavZ
 B/f2QDVQOWcZMWtaDmmS6C1vtifIdoobecKGqviQWuSaRcsTl9eEJ5iMyV6J5bpLgvaC9u
 JhVrZUeH0i6vSu8wlK+RtFWViKYy0xA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-b6Piq-n4MDGPC5WNZGixOQ-1; Thu, 07 Jul 2022 02:49:56 -0400
X-MC-Unique: b6Piq-n4MDGPC5WNZGixOQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o7-20020a05600c510700b003a18addaaa9so9649825wms.4
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 23:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HYZD4q4Ogs5GuDxKzq0/L+o14kQz1mG01BvbbrR5ci0=;
 b=JAPAOpBI0qtUgb8/HA4oM8sFe0EaJksfCoNMA+t/yPCquFxNq3QF9XCtVIM9ZMi7HA
 iRDBdHMWSPC2An2UsDR2VtMjMqtLVr4OYgp02pIwikn6eNGJMd0INiZzmxuRmwLXjxCs
 pu6XZbOBzvmS/+valQ9R+lz2qqlQLFBCeHHW4Tw7Yb4UFWWj/E/0W1hJ31zVrhVE8CCo
 yufROtSAwniLd4UZa63VAqKj7eNZC/FvYmppng3y1KZNSFXMle4nsuOw15iEpVXFn57V
 p+putSws23LI9FjJqNYmnfW1/GdoXQdZF+4UKJYShtUQaaS33FiegB9e1+spEjcjbzZH
 ONiw==
X-Gm-Message-State: AJIora9ElFbUn9Rt8v77S3qYnt6Pla8N5SYIMrC+N1msD5Vj4MaVnRfx
 GE1zq63NJ41VSgJNK/y6nUnsmaFYoHIs1b98PnvAa6QFx9bawQilySUQJ2zwParX86z3cCejo7y
 HRhRV7fZJXySvzqE=
X-Received: by 2002:a05:600c:19ca:b0:3a1:9897:410e with SMTP id
 u10-20020a05600c19ca00b003a19897410emr2716717wmq.88.1657176594939; 
 Wed, 06 Jul 2022 23:49:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uhxDLphwpTjG9A0FPpu2g8fUCqrgz3DHWimoLqG1EAt00D65GydoXcyS4TVAxtTziWUhQy1w==
X-Received: by 2002:a05:600c:19ca:b0:3a1:9897:410e with SMTP id
 u10-20020a05600c19ca00b003a19897410emr2716683wmq.88.1657176594610; 
 Wed, 06 Jul 2022 23:49:54 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-206.retail.telecomitalia.it.
 [79.46.200.206]) by smtp.gmail.com with ESMTPSA id
 q4-20020adff944000000b0021b956da1dcsm37476981wrr.113.2022.07.06.23.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 23:49:53 -0700 (PDT)
Date: Thu, 7 Jul 2022 08:49:44 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Subject: Re: [PATCH] block/io_uring: clarify that short reads can happen
Message-ID: <20220707064944.i2tf2arfgx4xbuei@sgarzare-redhat>
References: <20220706080341.1206476-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220706080341.1206476-1-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

On Wed, Jul 06, 2022 at 09:03:41AM +0100, Stefan Hajnoczi wrote:
>Jens Axboe has confirmed that short reads are rare but can happen:
>https://lore.kernel.org/io-uring/YsU%2FCGkl9ZXUI+Tj@stefanha-x1.localdomain/T/#m729963dc577d709b709c191922e98ec79d7eef54
>
>The luring_resubmit_short_read() comment claimed they were only due to a
>specific io_uring bug that was fixed in Linux commit 9d93a3f5a0c
>("io_uring: punt short reads to async context"), which is wrong.
>Dominique Martinet found that a btrfs bug also causes short reads. There
>may be more kernel code paths that result in short reads.
>
>Let's consider short reads fair game.
>
>Cc: Dominique Martinet <dominique.martinet@atmark-techno.com>
>Based-on: <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> block/io_uring.c | 8 ++------
> 1 file changed, 2 insertions(+), 6 deletions(-)
>
>diff --git a/block/io_uring.c b/block/io_uring.c
>index b238661740..f8a19fd97f 100644
>--- a/block/io_uring.c
>+++ b/block/io_uring.c
>@@ -73,12 +73,8 @@ static void luring_resubmit(LuringState *s, LuringAIOCB *luringcb)
> /**
>  * luring_resubmit_short_read:
>  *
>- * Before Linux commit 9d93a3f5a0c ("io_uring: punt short reads to async
>- * context") a buffered I/O request with the start of the file range in the
>- * page cache could result in a short read.  Applications need to resubmit the
>- * remaining read request.
>- *
>- * This is a slow path but recent kernels never take it.
>+ * Short reads are rare but may occur. The remaining read request needs to be
>+ * resubmitted.
>  */
> static void luring_resubmit_short_read(LuringState *s, LuringAIOCB *luringcb,
>                                        int nread)
>-- 
>2.36.1
>

Thanks for fixing the comment!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>



