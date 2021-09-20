Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A2410F1B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 06:48:35 +0200 (CEST)
Received: from localhost ([::1]:53732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSBEI-0005K7-25
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 00:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSBD8-0004en-AE
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 00:47:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSBD4-00084a-H7
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 00:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632113236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jxsVjGAvuJSX7vAe8a6z4f9CpaqwuOw01xugjSFrmWY=;
 b=b9shgCf3Kt1izECuCuc2KlHvvD+Vc9nacKZQ8ZFP/djxMICbQ3wV2Z4sCCGk6busfIB+Nn
 nJrRdrR3vDKiwsYd7fOHJV9vuUMyds6SOEWLffHq7Lei00lDnsqaIOuZPmSdtp3cUabb0M
 tRsalN6roAu9o7JkTWqyGWPMdIldBZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-q8h3VSwkMc-P002WIvBL_g-1; Mon, 20 Sep 2021 00:47:13 -0400
X-MC-Unique: q8h3VSwkMc-P002WIvBL_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44E501006AA3;
 Mon, 20 Sep 2021 04:47:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3D6A6B54B;
 Mon, 20 Sep 2021 04:47:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 636AC113865F; Mon, 20 Sep 2021 06:47:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: lishan <lishan24@huawei.com>
Subject: Re: [PATCH] block/file-posix: Limit max_iov to IOV_MAX
References: <20210918040658.19484-1-lishan24@huawei.com>
Date: Mon, 20 Sep 2021 06:47:10 +0200
In-Reply-To: <20210918040658.19484-1-lishan24@huawei.com> (lishan's message of
 "Sat, 18 Sep 2021 12:06:58 +0800")
Message-ID: <87lf3rn99t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: qemu-devel@nongnu.org, eric.fangyi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

lishan <lishan24@huawei.com> writes:

> AIO read/write. The size of iocb->aio_nbytes in the kernel cannot exceed UIO_MAXIOV = 1024.
> max_segments read from the block device layer may be greater than UIO_MAXIOV,
> this causes the ioq_submit interface to return a -22(-EINVAL) error result.
> ---
>  block/file-posix.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index d81e15efa4..137e27e47b 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1273,7 +1273,8 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  
>          ret = hdev_get_max_segments(s->fd, &st);
>          if (ret > 0) {
> -            bs->bl.max_iov = ret;
> +            /* The maximum segment size allowed by the kernel is UIO_MAXIOV = 1024. */
> +            bs->bl.max_iov = MIN(ret, IOV_MAX);
>          }
>      }
>  }

I didn't check your assertion we always need to cap at IOV_MAX.
Assuming you're right, why not do it in hdev_get_max_segments()?


