Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358151EBA53
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 13:24:42 +0200 (CEST)
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg529-0003oe-0Q
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 07:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jg512-0002i3-0S
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 07:23:32 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46930
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jg50z-0002As-4b
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 07:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591097005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WGk1tC7qnH7nYU05249E3LupTPwIgztrAb6BXmc7Agw=;
 b=LL3pbRxCMW8J2cKFHaa8jgAwZR7JGLI828me9ntGeDZ+7a4MUmxyj3e98IANodtQ8WMFSj
 eLXK6VkzUiIz41rhpFDFGbOiCDUxAwDxcpkPG7JxMdiFHbhHY7rn5OopOuyng4aafzUBVL
 92kUUFYu6HybEOZJr9O0xWu2C585w3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-QD_vVaKoM4iZeLZYrxSRYg-1; Tue, 02 Jun 2020 07:23:23 -0400
X-MC-Unique: QD_vVaKoM4iZeLZYrxSRYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E4A8185694C;
 Tue,  2 Jun 2020 11:23:23 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-75.ams2.redhat.com [10.36.113.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 083BA78EFC;
 Tue,  2 Jun 2020 11:23:16 +0000 (UTC)
Date: Tue, 2 Jun 2020 13:23:14 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH] virtio-blk: Disable request queuing while switching
 contexts
Message-ID: <20200602112314.GF5940@linux.fritz.box>
References: <20200602081112.32426-1-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200602081112.32426-1-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 03:23:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.06.2020 um 10:11 hat Sergio Lopez geschrieben:
> Disable request queuing while switching contexts on
> virtio_blk_data_plane_[start|stop](), preventing requests from getting
> queued on the wrong context.
> 
> Placing requests on the wrong context may lead to them being wrongly
> accessed in parallel from different threads, potentially leading to
> multiple issues.
> 
> For example, stopping and resuming a VM multiple times while the guest
> is generating I/O on a virtio_blk device can trigger a crash with a
> stack tracing looking like this one:
> 
> <------>
>  Thread 2 (Thread 0x7ff736765700 (LWP 1062503)):
>  #0  0x00005567a13b99d6 in iov_memset
>      (iov=0x6563617073206f4e, iov_cnt=1717922848, offset=516096, fillc=0, bytes=7018105756081554803)
>      at util/iov.c:69
>  #1  0x00005567a13bab73 in qemu_iovec_memset
>      (qiov=0x7ff73ec99748, offset=516096, fillc=0, bytes=7018105756081554803) at util/iov.c:530
>  #2  0x00005567a12f411c in qemu_laio_process_completion (laiocb=0x7ff6512ee6c0) at block/linux-aio.c:86
>  #3  0x00005567a12f42ff in qemu_laio_process_completions (s=0x7ff7182e8420) at block/linux-aio.c:217
>  #4  0x00005567a12f480d in ioq_submit (s=0x7ff7182e8420) at block/linux-aio.c:323
>  #5  0x00005567a12f43d9 in qemu_laio_process_completions_and_submit (s=0x7ff7182e8420)
>      at block/linux-aio.c:236
>  #6  0x00005567a12f44c2 in qemu_laio_poll_cb (opaque=0x7ff7182e8430) at block/linux-aio.c:267
>  #7  0x00005567a13aed83 in run_poll_handlers_once (ctx=0x5567a2b58c70, timeout=0x7ff7367645f8)
>      at util/aio-posix.c:520
>  #8  0x00005567a13aee9f in run_poll_handlers (ctx=0x5567a2b58c70, max_ns=16000, timeout=0x7ff7367645f8)
>      at util/aio-posix.c:562
>  #9  0x00005567a13aefde in try_poll_mode (ctx=0x5567a2b58c70, timeout=0x7ff7367645f8)
>      at util/aio-posix.c:597
>  #10 0x00005567a13af115 in aio_poll (ctx=0x5567a2b58c70, blocking=true) at util/aio-posix.c:639
>  #11 0x00005567a109acca in iothread_run (opaque=0x5567a2b29760) at iothread.c:75
>  #12 0x00005567a13b2790 in qemu_thread_start (args=0x5567a2b694c0) at util/qemu-thread-posix.c:519
>  #13 0x00007ff73eedf2de in start_thread () at /lib64/libpthread.so.0
>  #14 0x00007ff73ec10e83 in clone () at /lib64/libc.so.6
> 
>  Thread 1 (Thread 0x7ff743986f00 (LWP 1062500)):
>  #0  0x00005567a13b99d6 in iov_memset
>      (iov=0x6563617073206f4e, iov_cnt=1717922848, offset=516096, fillc=0, bytes=7018105756081554803)
>      at util/iov.c:69
>  #1  0x00005567a13bab73 in qemu_iovec_memset
>      (qiov=0x7ff73ec99748, offset=516096, fillc=0, bytes=7018105756081554803) at util/iov.c:530
>  #2  0x00005567a12f411c in qemu_laio_process_completion (laiocb=0x7ff6512ee6c0) at block/linux-aio.c:86
>  #3  0x00005567a12f42ff in qemu_laio_process_completions (s=0x7ff7182e8420) at block/linux-aio.c:217
>  #4  0x00005567a12f480d in ioq_submit (s=0x7ff7182e8420) at block/linux-aio.c:323
>  #5  0x00005567a12f4a2f in laio_do_submit (fd=19, laiocb=0x7ff5f4ff9ae0, offset=472363008, type=2)
>      at block/linux-aio.c:375
>  #6  0x00005567a12f4af2 in laio_co_submit
>      (bs=0x5567a2b8c460, s=0x7ff7182e8420, fd=19, offset=472363008, qiov=0x7ff5f4ff9ca0, type=2)
>      at block/linux-aio.c:394
>  #7  0x00005567a12f1803 in raw_co_prw
>      (bs=0x5567a2b8c460, offset=472363008, bytes=20480, qiov=0x7ff5f4ff9ca0, type=2)
>      at block/file-posix.c:1892
>  #8  0x00005567a12f1941 in raw_co_pwritev
>      (bs=0x5567a2b8c460, offset=472363008, bytes=20480, qiov=0x7ff5f4ff9ca0, flags=0)
>      at block/file-posix.c:1925
>  #9  0x00005567a12fe3e1 in bdrv_driver_pwritev
>      (bs=0x5567a2b8c460, offset=472363008, bytes=20480, qiov=0x7ff5f4ff9ca0, qiov_offset=0, flags=0)
>      at block/io.c:1183
>  #10 0x00005567a1300340 in bdrv_aligned_pwritev
>      (child=0x5567a2b5b070, req=0x7ff5f4ff9db0, offset=472363008, bytes=20480, align=512, qiov=0x7ff72c0425b8, qiov_offset=0, flags=0) at block/io.c:1980
>  #11 0x00005567a1300b29 in bdrv_co_pwritev_part
>      (child=0x5567a2b5b070, offset=472363008, bytes=20480, qiov=0x7ff72c0425b8, qiov_offset=0, flags=0)
>      at block/io.c:2137
>  #12 0x00005567a12baba1 in qcow2_co_pwritev_task
>      (bs=0x5567a2b92740, file_cluster_offset=472317952, offset=487305216, bytes=20480, qiov=0x7ff72c0425b8, qiov_offset=0, l2meta=0x0) at block/qcow2.c:2444
>  #13 0x00005567a12bacdb in qcow2_co_pwritev_task_entry (task=0x5567a2b48540) at block/qcow2.c:2475
>  #14 0x00005567a13167d8 in aio_task_co (opaque=0x5567a2b48540) at block/aio_task.c:45
>  #15 0x00005567a13cf00c in coroutine_trampoline (i0=738245600, i1=32759) at util/coroutine-ucontext.c:115
>  #16 0x00007ff73eb622e0 in __start_context () at /lib64/libc.so.6
>  #17 0x00007ff6626f1350 in  ()
>  #18 0x0000000000000000 in  ()
> <------>
> 
> This is also known to cause crashes with this message (assertion
> failed):
> 
>  aio_co_schedule: Co-routine was already scheduled in 'aio_co_schedule'
> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1812765
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  hw/block/dataplane/virtio-blk.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
> index 1b52e8159c..f1c7ba69c0 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -214,12 +214,17 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
>      vblk->dataplane_started = true;
>      trace_virtio_blk_data_plane_start(s);
>  
> +    /* Prevent requests from getting queued on the old context */
> +    blk_set_disable_request_queuing(s->conf->conf.blk, true);
> +
>      r = blk_set_aio_context(s->conf->conf.blk, s->ctx, &local_err);
>      if (r < 0) {
>          error_report_err(local_err);
>          goto fail_guest_notifiers;
>      }
>  
> +    blk_set_disable_request_queuing(s->conf->conf.blk, false);
> +

Why are we even getting new requests that could possibly be queued? This
is in virtio_blk_data_plane_start/stop(), so clearly the device should
be idle and the virtio queues shouldn't be processed at all at the same
time?

blk_set_disable_request_queuing() feels more like a hack that hides the
bug instead of fixing it.

Kevin


