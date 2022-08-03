Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E6E589071
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 18:30:34 +0200 (CEST)
Received: from localhost ([::1]:34340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJHGU-0005AA-2H
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 12:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oJHEW-0003YA-9P
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 12:28:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oJHEU-0002h7-4K
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 12:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659544108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xMduuNP20sQn4CBJUiKl5egYQj2uuTKiAFvPELEQ0m8=;
 b=V2SgzwVMu7vBBxItfM/GwZ3R52YIzGr4auoxNkdcPG6ujiQux2SqCnwhBkgb2nQaQQI2pi
 eQKY7j0iQFU1kuX2GjWoLEUMm8G/26rY1kDA7rwlmit4vgdfRmcGBxlFt8BaxUOHRa565B
 eysGSN1XkDFwjAKW08nvvkhw+LX9JB8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-a-2wdCfzPIGiHfgrbevHSA-1; Wed, 03 Aug 2022 12:28:27 -0400
X-MC-Unique: a-2wdCfzPIGiHfgrbevHSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E41A101A54E;
 Wed,  3 Aug 2022 16:28:27 +0000 (UTC)
Received: from localhost (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EC4FC28125;
 Wed,  3 Aug 2022 16:28:26 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: sgarzare@redhat.com, kwolf@redhat.com,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Qing Wang <qinwang@redhat.com>
Subject: [PATCH] virtio-scsi: fix race in virtio_scsi_dataplane_start()
Date: Wed,  3 Aug 2022 12:28:24 -0400
Message-Id: <20220803162824.948023-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

As soon as virtio_scsi_data_plane_start() attaches host notifiers the
IOThread may start virtqueue processing. There is a race between
IOThread virtqueue processing and virtio_scsi_data_plane_start() because
it only assigns s->dataplane_started after attaching host notifiers.

When a virtqueue handler function in the IOThread calls
virtio_scsi_defer_to_dataplane() it may see !s->dataplane_started and
attempt to start dataplane even though we're already in the IOThread:

  #0  0x00007f67b360857c __pthread_kill_implementation (libc.so.6 + 0xa257c)
  #1  0x00007f67b35bbd56 raise (libc.so.6 + 0x55d56)
  #2  0x00007f67b358e833 abort (libc.so.6 + 0x28833)
  #3  0x00007f67b358e75b __assert_fail_base.cold (libc.so.6 + 0x2875b)
  #4  0x00007f67b35b4cd6 __assert_fail (libc.so.6 + 0x4ecd6)
  #5  0x000055ca87fd411b memory_region_transaction_commit (qemu-kvm + 0x67511b)
  #6  0x000055ca87e17811 virtio_pci_ioeventfd_assign (qemu-kvm + 0x4b8811)
  #7  0x000055ca87e14836 virtio_bus_set_host_notifier (qemu-kvm + 0x4b5836)
  #8  0x000055ca87f8e14e virtio_scsi_set_host_notifier (qemu-kvm + 0x62f14e)
  #9  0x000055ca87f8dd62 virtio_scsi_dataplane_start (qemu-kvm + 0x62ed62)
  #10 0x000055ca87e14610 virtio_bus_start_ioeventfd (qemu-kvm + 0x4b5610)
  #11 0x000055ca87f8c29a virtio_scsi_handle_ctrl (qemu-kvm + 0x62d29a)
  #12 0x000055ca87fa5902 virtio_queue_host_notifier_read (qemu-kvm + 0x646902)
  #13 0x000055ca882c099e aio_dispatch_handler (qemu-kvm + 0x96199e)
  #14 0x000055ca882c1761 aio_poll (qemu-kvm + 0x962761)
  #15 0x000055ca880e1052 iothread_run (qemu-kvm + 0x782052)
  #16 0x000055ca882c562a qemu_thread_start (qemu-kvm + 0x96662a)

This patch assigns s->dataplane_started before attaching host notifiers
so that virtqueue handler functions that run in the IOThread before
virtio_scsi_data_plane_start() returns correctly identify that dataplane
does not need to be started.

Note that s->dataplane_started does not need the AioContext lock because
it is set before attaching host notifiers and cleared after detaching
host notifiers. In other words, the IOThread always sees the value true
and the main loop thread does not modify it while the IOThread is
active.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2099541
Reported-by: Qing Wang <qinwang@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/scsi/virtio-scsi-dataplane.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 8bb6e6acfc..a575c3f0cd 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -66,6 +66,21 @@ static int virtio_scsi_set_host_notifier(VirtIOSCSI *s, VirtQueue *vq, int n)
     return 0;
 }
 
+/* Context: BH in IOThread */
+static void virtio_scsi_dataplane_start_bh(void *opaque)
+{
+    VirtIOSCSI *s = opaque;
+    VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
+    int i;
+
+    virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
+    virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
+
+    for (i = 0; i < vs->conf.num_queues; i++) {
+        virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
+    }
+}
+
 /* Context: BH in IOThread */
 static void virtio_scsi_dataplane_stop_bh(void *opaque)
 {
@@ -136,16 +151,18 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 
     memory_region_transaction_commit();
 
-    aio_context_acquire(s->ctx);
-    virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
-    virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
-
-    for (i = 0; i < vs->conf.num_queues; i++) {
-        virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
-    }
-
     s->dataplane_starting = false;
     s->dataplane_started = true;
+
+    /*
+     * Attach notifiers from within the IOThread. It's possible to attach
+     * notifiers from our thread directly but this approach has the advantages
+     * that virtio_scsi_dataplane_start_bh() is symmetric with
+     * virtio_scsi_dataplane_stop_bh() and the s->dataplane_started assignment
+     * above doesn't require explicit synchronization.
+     */
+    aio_context_acquire(s->ctx);
+    aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_start_bh, s);
     aio_context_release(s->ctx);
     return 0;
 
-- 
2.37.1


