Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727F165DD4D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 20:57:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD9sS-0003qM-K3; Wed, 04 Jan 2023 14:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pD9sQ-0003px-CE
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 14:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pD9sO-0002If-Nh
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 14:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672862199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pQDPRATtfcNafo+n62ehA7nBxE5sPbtRPAVQT6ntAqQ=;
 b=IG2BlnWg8gO3MaIMPiFdR1lxYHddfmVJ6olSaGXLKYkjqjp3qT8rzIQBZ79QU6py8W3LTy
 WUcNGaxM3TPHYL4faQ17JqrIVbfTyAl3zgDt/TEISF+keViCemMmTl7V0Eq8rg7Iax8ETD
 SJsEYd3ynXWj4LA9N+Ktfh2fL1h0oxI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-yXA65Gh8OLyGpaGEd6fRSg-1; Wed, 04 Jan 2023 14:56:36 -0500
X-MC-Unique: yXA65Gh8OLyGpaGEd6fRSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05E7E101A521;
 Wed,  4 Jan 2023 19:56:36 +0000 (UTC)
Received: from localhost (unknown [10.39.193.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65E811121314;
 Wed,  4 Jan 2023 19:56:35 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Qing Wang <qinwang@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH] block-backend: fix virtio-scsi assertion failure with
 blk_drain_noref()
Date: Wed,  4 Jan 2023 14:56:33 -0500
Message-Id: <20230104195633.86143-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

scsi_device_purge_requests() is called from I/O code by virtio-scsi TMF
emulation code. It must not call Global State APIs like blk_drain()
because that results in an assertion failure.

blk_drain() is a Global State API because it uses bdrv_unref(). Actually
ref/unref is unnecessary in device emulation code because the drive=
qdev property holds the reference.

Introduce blk_drain_noref(), a variant of blk_drain() that is
IO_OR_GS_CODE() and doesn't take a reference to the BlockBackend.

This fixes the following virtio-scsi IOThread assertion failure when
hot-plugging scsi-hd devices:

  qemu-kvm: ../block/block-backend.c:1780: void blk_drain(BlockBackend *): Assertion `qemu_in_main_thread()' failed.

  #0  0x00007f4b6a0a154c __pthread_kill_implementation (libc.so.6>
  #1  0x00007f4b6a054d46 raise (libc.so.6 + 0x54d46)
  #2  0x00007f4b6a0287f3 abort (libc.so.6 + 0x287f3)
  #3  0x00007f4b6a02871b __assert_fail_base.cold (libc.so.6 + 0x2>
  #4  0x00007f4b6a04dce6 __assert_fail (libc.so.6 + 0x4dce6)
  #5  0x000055c811253ac0 blk_drain (qemu-kvm + 0x808ac0)
  #6  0x000055c810ecb951 scsi_device_purge_requests (qemu-kvm + 0>
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^
  #7  0x000055c810ed6ab8 scsi_disk_reset (qemu-kvm + 0x48bab8)
  #8  0x000055c8111dc908 resettable_phase_hold (qemu-kvm + 0x7919>
  #9  0x000055c8111db7f0 device_cold_reset (qemu-kvm + 0x7907f0)
  #10 0x000055c8110bb1a6 virtio_scsi_handle_ctrl (qemu-kvm + 0x67>
  #11 0x000055c8110d458f virtio_queue_host_notifier_read (qemu-kv>
  #12 0x000055c811404a73 aio_dispatch_handler (qemu-kvm + 0x9b9a7>
  #13 0x000055c811405743 aio_poll (qemu-kvm + 0x9ba743)
  #14 0x000055c81121d532 iothread_run (qemu-kvm + 0x7d2532)
  #15 0x000055c81140926a qemu_thread_start (qemu-kvm + 0x9be26a)
  #16 0x00007f4b6a09f802 start_thread (libc.so.6 + 0x9f802)
  #17 0x00007f4b6a03f450 __clone3 (libc.so.6 + 0x3f450)

Reported-by: Qing Wang <qinwang@redhat.com>
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2155748
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/sysemu/block-backend-io.h |  1 +
 block/block-backend.c             | 23 +++++++++++++++++++++++
 hw/scsi/scsi-bus.c                |  2 +-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 7ec6d978d4..f73db1f77c 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -73,6 +73,7 @@ void blk_iostatus_set_err(BlockBackend *blk, int error);
 int blk_get_max_iov(BlockBackend *blk);
 int blk_get_max_hw_iov(BlockBackend *blk);
 
+void blk_drain_noref(BlockBackend *blk);
 void blk_io_plug(BlockBackend *blk);
 void blk_io_unplug(BlockBackend *blk);
 AioContext *blk_get_aio_context(BlockBackend *blk);
diff --git a/block/block-backend.c b/block/block-backend.c
index ba7bf1d6bc..20914bae7b 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1815,6 +1815,29 @@ void blk_drain(BlockBackend *blk)
     }
 }
 
+/*
+ * Same as blk_drain() but the caller must hold a reference to blk. May be
+ * called from Global State or I/O API code. Device emulation can call this
+ * because the qdev drive= property holds the reference.
+ */
+void blk_drain_noref(BlockBackend *blk)
+{
+    BlockDriverState *bs = blk_bs(blk);
+    IO_OR_GS_CODE();
+
+    if (bs) {
+        bdrv_drained_begin(bs);
+    }
+
+    /* We may have -ENOMEDIUM completions in flight */
+    AIO_WAIT_WHILE(blk_get_aio_context(blk),
+                   qatomic_mb_read(&blk->in_flight) > 0);
+
+    if (bs) {
+        bdrv_drained_end(bs);
+    }
+}
+
 void blk_drain_all(void)
 {
     BlockBackend *blk = NULL;
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index ceceafb2cd..110fd85106 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1663,7 +1663,7 @@ void scsi_device_purge_requests(SCSIDevice *sdev, SCSISense sense)
         req = QTAILQ_FIRST(&sdev->requests);
         scsi_req_cancel_async(req, NULL);
     }
-    blk_drain(sdev->conf.blk);
+    blk_drain_noref(sdev->conf.blk);
     aio_context_release(blk_get_aio_context(sdev->conf.blk));
     scsi_device_set_ua(sdev, sense);
 }
-- 
2.39.0


