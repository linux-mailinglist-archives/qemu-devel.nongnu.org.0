Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEFC55FAF9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:49:37 +0200 (CEST)
Received: from localhost ([::1]:39240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6TOC-0003Yi-M3
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o6TL1-0001Vr-0q
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:46:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o6TKy-0002mI-7p
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656492374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZFMYvDzdVngl+CImbZCohMW7QyESDxBIQ3mQ8wZXIyg=;
 b=I+HDe6w2rW/GJ9eiBLQGBtVd+SIMTBrYIgFzHAxPNRxEVjPi6Sm5R9Fazgb3XrLR1IkuM/
 nPI+RTgfRptjBQntsp/bJNeY8CvZSm+cuoqnGCeb5O72vuKjzwgLben9e7NugrfS0GCmXf
 5TmdMgs78j64B2oh0vAHa+iwMdenze0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-w2PmR0CLNgy17-7ZcgWhnw-1; Wed, 29 Jun 2022 04:46:11 -0400
X-MC-Unique: w2PmR0CLNgy17-7ZcgWhnw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D22463833288;
 Wed, 29 Jun 2022 08:46:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F0509D7F;
 Wed, 29 Jun 2022 08:46:09 +0000 (UTC)
Date: Wed, 29 Jun 2022 10:46:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] io_uring: fix short read slow path corruptions
Message-ID: <YrwRUEP0FktTmuX0@redhat.com>
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
 <20220629052316.2017896-1-dominique.martinet@atmark-techno.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629052316.2017896-1-dominique.martinet@atmark-techno.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Am 29.06.2022 um 07:23 hat Dominique Martinet geschrieben:
> sqeq.off here is the offset to read within the disk image, so obviously
> not 'nread' (the amount we just read), but as the author meant to write
> its current value incremented by the amount we just read.
> 
> Normally recent versions of linux will not issue short reads,
> but apparently btrfs with O_DIRECT (cache=none) does.
> 
> This lead to weird image corruptions when short read happened
> 
> Fixes: 6663a0a33764 ("block/io_uring: implements interfaces for io_uring")
> Link: https://lkml.kernel.org/r/YrrFGO4A1jS0GI0G@atmark-techno.com
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> ---
> Forgive the double mail if it gets to you twice: I missed Ccs on the first
> try, I should have known better...
> 
> I just spent a couple of days on this bug, will follow up with kernel to
> see if we can also not get rid of the short read but perhaps a warning
> should be added the first time we get a short read, as it's not supposed
> to happen?
> Well, slow path now seems to work (at least my VM now boots fine), but
> if the code clearly states it should never be used I assume there might
> be other bugs laying there as it's not tested... That this one was easy
> enough to spot once I noticed the short reads was its only grace...
> 
> Thanks!
> 
>  block/io_uring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/io_uring.c b/block/io_uring.c
> index d48e472e74cb..d58aff9615ce 100644
> --- a/block/io_uring.c
> +++ b/block/io_uring.c
> @@ -103,7 +103,7 @@ static void luring_resubmit_short_read(LuringState *s, LuringAIOCB *luringcb,
>                        remaining);
>  
>      /* Update sqe */
> -    luringcb->sqeq.off = nread;
> +    luringcb->sqeq.off += nread;
>      luringcb->sqeq.addr = (__u64)(uintptr_t)luringcb->resubmit_qiov.iov;
>      luringcb->sqeq.len = luringcb->resubmit_qiov.niov;

I see this a few lines above:

    /* Update read position */
    luringcb->total_read = nread;

Doesn't it have the same problem? Though maybe getting two short reads
is more of a theoretical case.

Kevin


