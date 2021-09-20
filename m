Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0634A4110E1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 10:23:38 +0200 (CEST)
Received: from localhost ([::1]:47036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSEaP-00020T-1s
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 04:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mSES3-0005nr-O9
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:15:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mSES2-00083u-6m
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632125697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k4zig1haLJYBP4XD1brPOhOE3YsKZl1LMURyGuAnRmA=;
 b=EIHgBlaryJ+ISA9ZqdXicdOG01wYNJlRwKJXNdCqJ5+NBAOSbqMttJ4HDxrwdYsLNLmEPA
 yhXEKXzxnh91g4l6Li+EbrxBAy1MegfQjbYXlkTaZV3LuRiFVL3oz8cBgmkPhPebNCuDZf
 GaggCFugEp3+ziAzS+T+URfgNH/1Ip4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-co_2MPB7OYykAMpKQ5jaIQ-1; Mon, 20 Sep 2021 04:14:53 -0400
X-MC-Unique: co_2MPB7OYykAMpKQ5jaIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D23D41800D41;
 Mon, 20 Sep 2021 08:14:52 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DE131F436;
 Mon, 20 Sep 2021 08:14:28 +0000 (UTC)
Date: Mon, 20 Sep 2021 10:14:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: lishan <lishan24@huawei.com>
Subject: Re: [PATCH] block/file-posix: Limit max_iov to IOV_MAX
Message-ID: <YUhC4pvNdlmnMzsh@redhat.com>
References: <20210918073300.30224-1-lishan24@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210918073300.30224-1-lishan24@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: hreitz@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 eric.fangyi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.09.2021 um 09:33 hat lishan geschrieben:
> AIO read/write. The size of iocb->aio_nbytes in the kernel cannot exceed UIO_MAXIOV = 1024.
> max_segments read from the block device layer may be greater than UIO_MAXIOV,
> this causes the ioq_submit interface to return a -22(-EINVAL) error result.

You need a Signed-off-by line so that a patch can be accepted.

But Paolo intended to send a better solution anyway (splitting max_iov
into two separate limits). Not sure what the status is there.

Kevin

>  block/file-posix.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index d81e15efa4..27ab8d8784 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1273,7 +1273,8 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  
>          ret = hdev_get_max_segments(s->fd, &st);
>          if (ret > 0) {
> -            bs->bl.max_iov = ret;
> +            /* The maximum segment size allowed by the kernel is UIO_MAXIOV = 1024. */
> +            bs->bl.max_iov = MIN(ret, bs->bl.max_iov);
>          }
>      }
>  }
> -- 
> 2.19.1.windows.1
> 
> 


