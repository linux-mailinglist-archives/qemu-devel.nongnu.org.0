Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545FE44A4CE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 03:38:51 +0100 (CET)
Received: from localhost ([::1]:55036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkH2A-0007OX-0d
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 21:38:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mkH1M-0006k9-9b
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 21:38:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mkH1I-0003xL-6G
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 21:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636425473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y3uG1QAC8DB6Cz/eH20tvwgy4XDMp0TTadmN8MEH1S4=;
 b=Hppl76ubAoXSiuVKwYlY9YYzSPi7gzlGZVr3e4LydeA0x5o2jfksUL+9ciG3/1ZB1Noa8h
 dpMRqe3YdNfO1pJ4X0Bs82FfYCnbpk57eFln+AVwDifgF+ijV0opepwyjijmUhu7OOpS3i
 91BYoDAYPHS/BVkggiUowpbDO1/MGzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-BuKtW4TlMk6lYjLNVj27gA-1; Mon, 08 Nov 2021 21:37:51 -0500
X-MC-Unique: BuKtW4TlMk6lYjLNVj27gA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11589102CB79
 for <qemu-devel@nongnu.org>; Tue,  9 Nov 2021 02:37:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-34.pek2.redhat.com [10.72.12.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C04F35C23A;
 Tue,  9 Nov 2021 02:37:46 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH] virtio-mmio : fix the crash in the vm shutdown
Date: Tue,  9 Nov 2021 10:37:44 +0800
Message-Id: <20211109023744.22387-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The root cause for this crash is the ioeventfd not stopped while the VM stop.
The callback for vmstate_change was not implement in virtio-mmio bus

Reproduce step
load the vm with
 -M microvm \
  -netdev tap,id=net0,vhostforce,script=no,downscript=no  \
  -device virtio-net-device,netdev=net0\

After the VM boot, login the vm and then shutdown the vm

System will crash
[Current thread is 1 (Thread 0x7ffff6edde00 (LWP 374378))]
(gdb) bt
0  0x00005555558f18b4 in qemu_flush_or_purge_queued_packets (purge=false, nc=0x55500252e850) at ../net/net.c:636
1  qemu_flush_queued_packets (nc=0x55500252e850) at ../net/net.c:656
2  0x0000555555b6c363 in virtio_queue_notify_vq (vq=0x7fffe7e2b010) at ../hw/virtio/virtio.c:2339
3  virtio_queue_host_notifier_read (n=0x7fffe7e2b08c) at ../hw/virtio/virtio.c:3583
4  0x0000555555de7b5a in aio_dispatch_handler (ctx=ctx@entry=0x5555567c5780, node=0x555556b83fd0) at ../util/aio-posix.c:329
5  0x0000555555de8454 in aio_dispatch_ready_handlers (ready_list=<optimized out>, ctx=<optimized out>) at ../util/aio-posix.c:359
6  aio_poll (ctx=0x5555567c5780, blocking=blocking@entry=false) at ../util/aio-posix.c:662
7  0x0000555555cce0cc in monitor_cleanup () at ../monitor/monitor.c:645
8  0x0000555555b06bd2 in qemu_cleanup () at ../softmmu/runstate.c:822
9  0x000055555586e693 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../softmmu/main.c:51

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-mmio.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 7b3ebca178..72da12fea5 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -817,6 +817,17 @@ static char *virtio_mmio_bus_get_dev_path(DeviceState *dev)
     return path;
 }
 
+static void virtio_mmio_vmstate_change(DeviceState *d, bool running)
+{
+    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
+
+    if (running) {
+        virtio_mmio_start_ioeventfd(proxy);
+    } else {
+        virtio_mmio_stop_ioeventfd(proxy);
+    }
+}
+
 static void virtio_mmio_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *bus_class = BUS_CLASS(klass);
@@ -832,6 +843,7 @@ static void virtio_mmio_bus_class_init(ObjectClass *klass, void *data)
     k->ioeventfd_enabled = virtio_mmio_ioeventfd_enabled;
     k->ioeventfd_assign = virtio_mmio_ioeventfd_assign;
     k->pre_plugged = virtio_mmio_pre_plugged;
+    k->vmstate_change = virtio_mmio_vmstate_change;
     k->has_variable_vring_alignment = true;
     bus_class->max_dev = 1;
     bus_class->get_dev_path = virtio_mmio_bus_get_dev_path;
-- 
2.21.3


