Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B96F062E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:50:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps145-0001qB-41; Thu, 27 Apr 2023 08:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ps13y-0001pl-Oo
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:49:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ps13x-0002qo-7C
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682599767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FzEIXM0FRcqwdSc97dOurxFLcCuILNq6nPn2lvdOKnE=;
 b=WxcedY5Vvcgf3mdJprzgtkgIsqvQeJKWrLvXC5Vcv5vfyfvIxUxeCEOkiRyE+j3b+4/aMK
 7y1Wbnjz9n/McYw/OpE0RU0GvphL/EoBTxpWwe0LoCVQ6yWT+5IipG4jstd5JvdKvwKNXJ
 t0rYN26P31xwh2ri+t+bFsCiESn4XWU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-DxK3nxbRNd2l392Fu-JRvA-1; Thu, 27 Apr 2023 08:49:24 -0400
X-MC-Unique: DxK3nxbRNd2l392Fu-JRvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EA3C185A7A2;
 Thu, 27 Apr 2023 12:49:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BB25C15BA0;
 Thu, 27 Apr 2023 12:49:22 +0000 (UTC)
Date: Thu, 27 Apr 2023 14:49:20 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] block/nvme: use AIO_WAIT_WHILE_UNLOCKED()
Message-ID: <ZEpvUDYCw4iyCWff@redhat.com>
References: <20230404112044.427062-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404112044.427062-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 04.04.2023 um 13:20 hat Stefan Hajnoczi geschrieben:
> A few Admin Queue commands are submitted during nvme_file_open(). They
> are synchronous since device initialization cannot continue until the
> commands complete.
> 
> AIO_WAIT_WHILE() is currently used, but the block/nvme.c code actually
> doesn't rely on the AioContext lock. Replace it with
> AIO_WAIT_WHILE_UNLOCKED(NULL, condition). There is no change in behavior
> and the dependency on the AioContext lock is eliminated.
> 
> This is a step towards removing the AioContext lock.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/nvme.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index 5b744c2bda..829b9c04db 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -512,7 +512,6 @@ static int nvme_admin_cmd_sync(BlockDriverState *bs, NvmeCmd *cmd)
>  {
>      BDRVNVMeState *s = bs->opaque;
>      NVMeQueuePair *q = s->queues[INDEX_ADMIN];
> -    AioContext *aio_context = bdrv_get_aio_context(bs);
>      NVMeRequest *req;
>      int ret = -EINPROGRESS;
>      req = nvme_get_free_req_nowait(q);
> @@ -521,7 +520,7 @@ static int nvme_admin_cmd_sync(BlockDriverState *bs, NvmeCmd *cmd)
>      }
>      nvme_submit_command(q, req, cmd, nvme_admin_cmd_sync_cb, &ret);
>  
> -    AIO_WAIT_WHILE(aio_context, ret == -EINPROGRESS);
> +    AIO_WAIT_WHILE_UNLOCKED(NULL, ret == -EINPROGRESS);
>      return ret;
>  }

Wait, do we hold the lock in this piece of code or don't we? Either the
old code was buggy (then the commit message should be explicit about
it), or the new one is.

It seems that in practice, it doesn't matter much because this function
is only called through .bdrv_file_open, which I think always run in the
main thread for a protocol driver. I believe that we generally don't
hold the AioContext lock there, so it's the old code that was wrong?

Kevin


