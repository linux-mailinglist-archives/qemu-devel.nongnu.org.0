Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094CC6DF9B8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 17:20:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmcFU-00013N-Vm; Wed, 12 Apr 2023 11:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmcFR-00012w-5B
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 11:19:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmcFP-0002Bo-Ls
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 11:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681312735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0LueBI/qIOF7SrvJibqQQzaqHi8X+jPq1DvsOXWO83U=;
 b=XlZzoUzuDWQxlJrBawkSWyZTpAMYjZyPC64k1yPTxuVGe6LhtGcnXlfppRXT+mjF7oc9lJ
 yRtTryebCQz0ZsPLuIH/44oJ0u2MwOS+PK4v54BZDwcyW6S6ZiQTVJVhtESDBwmdsAcQKP
 HU7HTLwLhFzKCalhkMr+/E4pz1RD8fQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-p3tzULcHP1ehQMULl_gYIg-1; Wed, 12 Apr 2023 11:18:53 -0400
X-MC-Unique: p3tzULcHP1ehQMULl_gYIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08A4485A5A3;
 Wed, 12 Apr 2023 15:18:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72DB247CD0;
 Wed, 12 Apr 2023 15:18:52 +0000 (UTC)
Date: Wed, 12 Apr 2023 17:18:51 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH 8.0 regression] block/nfs: do not poll within a coroutine
Message-ID: <ZDbL2w2O/hCxaCS3@redhat.com>
References: <20230412112606.80983-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412112606.80983-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 12.04.2023 um 13:26 hat Paolo Bonzini geschrieben:
> Since the former nfs_get_allocated_file_size is now a coroutine
> function, it must suspend rather than poll.  Switch BDRV_POLL_WHILE()
> to a qemu_coroutine_yield() loop and schedule nfs_co_generic_bh_cb()
> in place of the call to bdrv_wakeup().
> 
> Fixes: 82618d7bc341 ("block: Convert bdrv_get_allocated_file_size() to co_wrapper", 2023-02-01)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nfs.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/block/nfs.c b/block/nfs.c
> index 351dc6ec8d14..417defc0cfef 100644
> --- a/block/nfs.c
> +++ b/block/nfs.c
> @@ -726,10 +726,8 @@ nfs_get_allocated_file_size_cb(int ret, struct nfs_context *nfs, void *data,
>      if (task->ret < 0) {
>          error_report("NFS Error: %s", nfs_get_error(nfs));
>      }
> -
> -    /* Set task->complete before reading bs->wakeup.  */
> -    qatomic_mb_set(&task->complete, 1);
> -    bdrv_wakeup(task->bs);
> +    replay_bh_schedule_oneshot_event(task->client->aio_context,
> +                                     nfs_co_generic_bh_cb, task);
>  }
>  
>  static int64_t coroutine_fn nfs_co_get_allocated_file_size(BlockDriverState *bs)
> @@ -743,15 +741,19 @@ static int64_t coroutine_fn nfs_co_get_allocated_file_size(BlockDriverState *bs)
>          return client->st_blocks * 512;
>      }
>  
> -    task.bs = bs;
> +    nfs_co_init_task(bs, &task);
>      task.st = &st;
> -    if (nfs_fstat_async(client->context, client->fh, nfs_get_allocated_file_size_cb,
> -                        &task) != 0) {
> -        return -ENOMEM;
> -    }
> +    WITH_QEMU_LOCK_GUARD(&client->mutex) {
> +        if (nfs_fstat_async(client->context, client->fh, nfs_get_allocated_file_size_cb,
> +                            &task) != 0) {
> +            return -ENOMEM;
> +        }
>  
> -    nfs_set_events(client);
> -    BDRV_POLL_WHILE(bs, !task.complete);
> +	nfs_set_events(client);

Tab damage in this line.

> +    }
> +    while (!task.complete) {
> +        qemu_coroutine_yield();
> +    }
>  
>      return (task.ret < 0 ? task.ret : st.st_blocks * 512);
>  }

With the indentation above fixed:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


