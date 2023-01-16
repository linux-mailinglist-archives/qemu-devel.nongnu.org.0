Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD6A66C9CF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:56:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSmB-0000L6-Sb; Mon, 16 Jan 2023 11:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHSmA-0000Hs-56
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:56:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHSm7-0006RA-Hx
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673888158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=++wJY7ZTpxvy49HFUkos994FCHaO0ZF4E8rTr8a4lnM=;
 b=DgJ+bxSxJ48nvZWsBi/qf4hzPBtlpe0YP3cP2tiegXSJJLLw/AbrU7KHh9Tb/C5y53N+D5
 O9r3lJSvierZL1ijWX1M35h2V//RbpcughhNGdfY3epT2mUEbt3j5PTn9AlQO/2hgOq72l
 +BrH1Mu70mwDWE39D8V8/rt8p/TyCUs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-6dxh4NNCP7C05xmVLpNmMg-1; Mon, 16 Jan 2023 11:55:56 -0500
X-MC-Unique: 6dxh4NNCP7C05xmVLpNmMg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E05A43C0F66A;
 Mon, 16 Jan 2023 16:55:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18A5F492B00;
 Mon, 16 Jan 2023 16:55:54 +0000 (UTC)
Date: Mon, 16 Jan 2023 17:55:53 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, eesposit@redhat.com
Subject: Re: [PATCH 11/15] block-backend: make queued_requests thread-safe
Message-ID: <Y8WBmVJRA1+hCz6B@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
 <20221212125920.248567-12-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212125920.248567-12-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 12.12.2022 um 13:59 hat Paolo Bonzini geschrieben:
> Protect quiesce_counter and queued_requests with a QemuMutex, so that
> they are protected from concurrent access in the main thread (for example
> blk_root_drained_end() reached from bdrv_drain_all()) and in the iothread
> (where any I/O operation will call blk_inc_in_flight()).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/block-backend.c | 44 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 627d491d4155..fdf82f1f1599 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -23,6 +23,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-block.h"
>  #include "qemu/id.h"
> +#include "qemu/thread.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/option.h"
>  #include "trace.h"
> @@ -85,6 +86,8 @@ struct BlockBackend {
>      NotifierList remove_bs_notifiers, insert_bs_notifiers;
>      QLIST_HEAD(, BlockBackendAioNotifier) aio_notifiers;
>  
> +    /* Protected by quiesce_lock.  */
> +    QemuMutex quiesce_lock;
>      int quiesce_counter;
>      CoQueue queued_requests;
>  
> @@ -372,6 +375,7 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
>  
>      block_acct_init(&blk->stats);
>  
> +    qemu_mutex_init(&blk->quiesce_lock);
>      qemu_co_queue_init(&blk->queued_requests);
>      notifier_list_init(&blk->remove_bs_notifiers);
>      notifier_list_init(&blk->insert_bs_notifiers);
> @@ -490,6 +494,7 @@ static void blk_delete(BlockBackend *blk)
>      assert(QLIST_EMPTY(&blk->insert_bs_notifiers.notifiers));
>      assert(QLIST_EMPTY(&blk->aio_notifiers));
>      QTAILQ_REMOVE(&block_backends, blk, link);
> +    qemu_mutex_destroy(&blk->quiesce_lock);
>      drive_info_del(blk->legacy_dinfo);
>      block_acct_cleanup(&blk->stats);
>      g_free(blk);
> @@ -1451,11 +1456,25 @@ void blk_inc_in_flight(BlockBackend *blk)
>  {
>      IO_CODE();
>      qatomic_inc(&blk->in_flight);
> -    if (!blk->disable_request_queuing) {
> -        /* TODO: this is not thread-safe! */
> +
> +    /*
> +     * Avoid a continuous stream of requests from AIO callbacks, which
> +     * call a user-provided callback while blk->in_flight is elevated,
> +     * if the BlockBackend is being quiesced.
> +     *
> +     * This initial test does not have to be perfect: a race might
> +     * cause an extra I/O to be queued, but sooner or later a nonzero
> +     * quiesce_counter will be observed.

This is true in the initial drain phase while we're still polling. But
generally this is not only about avoiding a continuous stream of
requests, but about making sure that absolutely no new requests come in
while a node is drained.

> +     */
> +    if (!blk->disable_request_queuing && qatomic_read(&blk->quiesce_counter)) {

So if no other requests were pending and we didn't even call aio_poll()
because the AIO_WAIT_WHILE() condition was false from the start, could
it be that bdrv_drained_begin() has already returned on the thread that
drains, but another thread still sees the old value here?

Starting a new request after bdrv_drained_begin() has returned would be
a bug.

Kevin


