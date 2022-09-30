Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FDC5F0F36
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 17:48:30 +0200 (CEST)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeIFY-0007uU-Q6
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 11:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeICW-0005yz-IY
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:45:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeICS-00038H-5H
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664552715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ipg29oJtSkG1hEnFiYnHAybzxojw5PEbuYbR76GI0bA=;
 b=b00on5f6+H2da4kI/ZSqKX1dQjFbp/5Ds3ZKsnJaovPr+45r7v1iXUfBO7pDj7ADqW2bud
 OpV4OYG6yVjn5CWBT0HfRSxqElpZEKVeZOr6W6Y4R9TL6djmOl2OlB9SPOhwPJaqDxn9TZ
 EluVpUGzH0MmnNiz5Ok1BFTgDYPyRkc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-dUiH4g8oPdi7FpJZ8kinmw-1; Fri, 30 Sep 2022 11:45:11 -0400
X-MC-Unique: dUiH4g8oPdi7FpJZ8kinmw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7425A38012DA;
 Fri, 30 Sep 2022 15:45:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33B47111E3FD;
 Fri, 30 Sep 2022 15:45:10 +0000 (UTC)
Date: Fri, 30 Sep 2022 17:45:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] thread-pool: use ThreadPool from the running thread
Message-ID: <YzcPBFcf3idA4MLH@redhat.com>
References: <20220609134452.1146309-1-eesposit@redhat.com>
 <20220609134452.1146309-3-eesposit@redhat.com>
 <YzW6FkfT9LT7aE7d@redhat.com>
 <29c33add-81ca-5a16-a02a-d2a0c5bfaf88@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29c33add-81ca-5a16-a02a-d2a0c5bfaf88@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30.09.2022 um 14:17 hat Emanuele Giuseppe Esposito geschrieben:
> Am 29/09/2022 um 17:30 schrieb Kevin Wolf:
> > Am 09.06.2022 um 15:44 hat Emanuele Giuseppe Esposito geschrieben:
> >> Remove usage of aio_context_acquire by always submitting work items
> >> to the current thread's ThreadPool.
> >>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > 
> > The thread pool is used by things outside of the file-* block drivers,
> > too. Even outside the block layer. Not all of these seem to submit work
> > in the same thread.
> > 
> > 
> > For example:
> > 
> > postcopy_ram_listen_thread() -> qemu_loadvm_state_main() ->
> > qemu_loadvm_section_start_full() -> vmstate_load() ->
> > vmstate_load_state() -> spapr_nvdimm_flush_post_load(), which has:
> > 
> > ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
> > ...
> > thread_pool_submit_aio(pool, flush_worker_cb, state,
> >                        spapr_nvdimm_flush_completion_cb, state);
> > 
> > So it seems to me that we may be submitting work for the main thread
> > from a postcopy migration thread.
> > 
> > I believe the other direct callers of thread_pool_submit_aio() all
> > submit work for the main thread and also run in the main thread.
> > 
> > 
> > For thread_pool_submit_co(), pr_manager_execute() calls it with the pool
> > it gets passed as a parameter. This is still bdrv_get_aio_context(bs) in
> > hdev_co_ioctl() and should probably be changed the same way as for the
> > AIO call in file-posix, i.e. use qemu_get_current_aio_context().
> > 
> > 
> > We could consider either asserting in thread_pool_submit_aio() that we
> > are really in the expected thread, or like I suggested for LinuxAio drop
> > the pool parameter and always get it from the current thread (obviously
> > this is only possible if migration could in fact schedule the work on
> > its current thread - if it schedules it on the main thread and then
> > exits the migration thread (which destroys the thread pool), that
> > wouldn't be good).
> 
> Dumb question: why not extend the already-existing poll->lock to cover
> also the necessary fields like pool->head that are accessed by other
> threads (only case I could find with thread_pool_submit_aio is the one
> you pointed above)?

Other people are more familiar with this code, but I believe this could
have performance implications. I seem to remember that this code is
careful to avoid locking to synchronise between worker threads and the
main thread.

But looking at the patch again, I have actually a dumb question, too:
The locking you're removing is in thread_pool_completion_bh(). As this
is a BH, it's running the the ThreadPool's context either way, no matter
which thread called thread_pool_submit_aio().

I'm not sure what this aio_context_acquire/release pair is actually
supposed to protect. Paolo's commit 1919631e6b5 introduced it. Was it
just more careful than it needs to be?

Kevin


