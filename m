Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C56A5EF9DC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:11:14 +0200 (CEST)
Received: from localhost ([::1]:49380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odw81-0008Lr-4P
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1odvUp-0001C7-KC
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:30:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1odvUi-0007zJ-MF
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664465435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=esc/h55JVyjgVZjCnllpxXSaIdj25L7MQqEGyWG65Gw=;
 b=P0PL2HJVxE0xDKnjs5e/gLxiSDNhhf5qXE18X341EYD9gR/kzHCCU99j8j6u/iBb6N041z
 xPasYcifPgI8rK2GC1w+/1/ZecMicqlER5GvS5MYyGRIokwP/iOvsVjBRsF/juswXJOLyb
 vhNEEMdhVdBNPI498wkJudAwDB7OaGQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-Vp1RVQPvOVuEDXEt4mS_7Q-1; Thu, 29 Sep 2022 11:30:33 -0400
X-MC-Unique: Vp1RVQPvOVuEDXEt4mS_7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAE9786C041;
 Thu, 29 Sep 2022 15:30:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 848E02166B26;
 Thu, 29 Sep 2022 15:30:31 +0000 (UTC)
Date: Thu, 29 Sep 2022 17:30:30 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] thread-pool: use ThreadPool from the running thread
Message-ID: <YzW6FkfT9LT7aE7d@redhat.com>
References: <20220609134452.1146309-1-eesposit@redhat.com>
 <20220609134452.1146309-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609134452.1146309-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.06.2022 um 15:44 hat Emanuele Giuseppe Esposito geschrieben:
> Remove usage of aio_context_acquire by always submitting work items
> to the current thread's ThreadPool.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

The thread pool is used by things outside of the file-* block drivers,
too. Even outside the block layer. Not all of these seem to submit work
in the same thread.


For example:

postcopy_ram_listen_thread() -> qemu_loadvm_state_main() ->
qemu_loadvm_section_start_full() -> vmstate_load() ->
vmstate_load_state() -> spapr_nvdimm_flush_post_load(), which has:

ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
...
thread_pool_submit_aio(pool, flush_worker_cb, state,
                       spapr_nvdimm_flush_completion_cb, state);

So it seems to me that we may be submitting work for the main thread
from a postcopy migration thread.

I believe the other direct callers of thread_pool_submit_aio() all
submit work for the main thread and also run in the main thread.


For thread_pool_submit_co(), pr_manager_execute() calls it with the pool
it gets passed as a parameter. This is still bdrv_get_aio_context(bs) in
hdev_co_ioctl() and should probably be changed the same way as for the
AIO call in file-posix, i.e. use qemu_get_current_aio_context().


We could consider either asserting in thread_pool_submit_aio() that we
are really in the expected thread, or like I suggested for LinuxAio drop
the pool parameter and always get it from the current thread (obviously
this is only possible if migration could in fact schedule the work on
its current thread - if it schedules it on the main thread and then
exits the migration thread (which destroys the thread pool), that
wouldn't be good).

Kevin


