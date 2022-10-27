Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956560F12B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 09:33:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onxIm-0003fx-7X; Thu, 27 Oct 2022 03:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onxIc-0003fg-46
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:27:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onxIa-0002tu-Ee
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666855651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=orbDL0zxPjlAhUsTZrpfm9zt/QYdqQBvCF1itnniZjc=;
 b=LcCxXW7RE9HxvU/rY1+2Yxb4VtFyhFz1g3bXEgmjnLuKsdRWVZLFXAUVKrPZQ8RWSqeXal
 UrtN3yaJjAPqe4v+WssAVxDPf9ND4odPFAxZFrdUZ9DzVA7hULIQ8m3yhEmc5ASPo7T6qz
 R3VIhQ568mDsNzuOeAT8v0HpBBznJVc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-J535_yxBMjiUuhfudn_8ag-1; Thu, 27 Oct 2022 03:27:29 -0400
X-MC-Unique: J535_yxBMjiUuhfudn_8ag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 806421019C8A;
 Thu, 27 Oct 2022 07:27:29 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC8F840C6FA0;
 Thu, 27 Oct 2022 07:27:27 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH] block/block-backend: blk_set_enable_write_cache is IO_CODE
Date: Thu, 27 Oct 2022 03:27:26 -0400
Message-Id: <20221027072726.2681500-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

blk_set_enable_write_cache() is defined as GLOBAL_STATE_CODE
but can be invoked from iothreads when handling scsi requests.
This triggers an assertion failure:

 0x00007fd6c3515ce1 in raise () from /lib/x86_64-linux-gnu/libc.so.6
 0x00007fd6c34ff537 in abort () from /lib/x86_64-linux-gnu/libc.so.6
 0x00007fd6c34ff40f in ?? () from /lib/x86_64-linux-gnu/libc.so.6
 0x00007fd6c350e662 in __assert_fail () from /lib/x86_64-linux-gnu/libc.so.6
 0x000056149e2cea03 in blk_set_enable_write_cache (wce=true, blk=0x5614a01c27f0)
   at ../src/block/block-backend.c:1949
 0x000056149e2d0a67 in blk_set_enable_write_cache (blk=0x5614a01c27f0,
   wce=<optimized out>) at ../src/block/block-backend.c:1951
 0x000056149dfe9c59 in scsi_disk_apply_mode_select (p=0x7fd6b400c00e "\004",
   page=<optimized out>, s=<optimized out>) at ../src/hw/scsi/scsi-disk.c:1520
 mode_select_pages (change=true, len=18, p=0x7fd6b400c00e "\004", r=0x7fd6b4001ff0)
   at ../src/hw/scsi/scsi-disk.c:1570
 scsi_disk_emulate_mode_select (inbuf=<optimized out>, r=0x7fd6b4001ff0) at
   ../src/hw/scsi/scsi-disk.c:1640
 scsi_disk_emulate_write_data (req=0x7fd6b4001ff0) at ../src/hw/scsi/scsi-disk.c:1934
 0x000056149e18ff16 in virtio_scsi_handle_cmd_req_submit (req=<optimized out>,
   req=<optimized out>, s=0x5614a12f16b0) at ../src/hw/scsi/virtio-scsi.c:719
 virtio_scsi_handle_cmd_vq (vq=0x7fd6bab92140, s=0x5614a12f16b0) at
   ../src/hw/scsi/virtio-scsi.c:761
 virtio_scsi_handle_cmd (vq=<optimized out>, vdev=<optimized out>) at
   ../src/hw/scsi/virtio-scsi.c:775
 virtio_scsi_handle_cmd (vdev=0x5614a12f16b0, vq=0x7fd6bab92140) at
   ../src/hw/scsi/virtio-scsi.c:765
 0x000056149e1a8aa6 in virtio_queue_notify_vq (vq=0x7fd6bab92140) at
   ../src/hw/virtio/virtio.c:2365
 0x000056149e3ccea5 in aio_dispatch_handler (ctx=ctx@entry=0x5614a01babe0,
   node=<optimized out>) at ../src/util/aio-posix.c:369
 0x000056149e3cd868 in aio_dispatch_ready_handlers (ready_list=0x7fd6c09b2680,
   ctx=0x5614a01babe0) at ../src/util/aio-posix.c:399
 aio_poll (ctx=0x5614a01babe0, blocking=blocking@entry=true) at
   ../src/util/aio-posix.c:713
 0x000056149e2a7796 in iothread_run (opaque=opaque@entry=0x56149ffde500) at
   ../src/iothread.c:67
 0x000056149e3d0859 in qemu_thread_start (args=0x7fd6c09b26f0) at
   ../src/util/qemu-thread-posix.c:504
 0x00007fd6c36b9ea7 in start_thread () from /lib/x86_64-linux-gnu/libpthread.so.0
 0x00007fd6c35d9aef in clone () from /lib/x86_64-linux-gnu/libc.so.6

Changing GLOBAL_STATE_CODE in IO_CODE is allowed, since GSC callers are
allowed to call IO_CODE.

Resolves: #1272

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index aa4adf06ae..ade4da55e0 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1946,7 +1946,7 @@ bool blk_enable_write_cache(BlockBackend *blk)
 
 void blk_set_enable_write_cache(BlockBackend *blk, bool wce)
 {
-    GLOBAL_STATE_CODE();
+    IO_CODE();
     blk->enable_write_cache = wce;
 }
 
-- 
2.31.1


