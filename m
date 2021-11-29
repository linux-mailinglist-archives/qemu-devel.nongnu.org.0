Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DF946171A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:55:41 +0100 (CET)
Received: from localhost ([::1]:58552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrh88-0000NO-OV
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:55:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh3r-0003OA-Et
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh3p-0002zB-DE
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638193872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N5K2k3q0Eo2Jy2p/psCpdv+cQiRiNwsxEPx+PrsAvqg=;
 b=U9e0brAX6VIBUb1JNB77Wb0DTO76j7dyp2Twiha6M1L1qrVfz1hNUoqUB0XKgezJdpLsjb
 zPzXJU5TZw7hDVHp/bX89bd8NhWsGWsRXF216RkWRx4s6B0whoRZHfuchxQrKdqsltN9tQ
 V+Lx/8U9uDEId/4uXdspbFyMZSNrN4E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-RqPE7zXZOkWLCppxRUfM-g-1; Mon, 29 Nov 2021 08:51:11 -0500
X-MC-Unique: RqPE7zXZOkWLCppxRUfM-g-1
Received: by mail-ed1-f71.google.com with SMTP id
 v1-20020aa7cd41000000b003e80973378aso13732035edw.14
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:51:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N5K2k3q0Eo2Jy2p/psCpdv+cQiRiNwsxEPx+PrsAvqg=;
 b=xmZUuO39IDOSjkkSU5HrrH3TLcF/sWX1aonX1dC1NzXqzpGtiUCFOYvbB566vzTHw8
 sKmmseuPKWYmPMsFoMdOgc+yWr7jtcDtvcW05W+S7u2fygUHIZCX2d2xdomqGyLlc4hk
 QIOB8DvunT/kf8T9mIeQ1SVwgvr9hyKK3tq3cv0krLfre0TBnAhjPD/0yf8wEhIimlVr
 LnhB4a9+zK4uHzAZKIG2R5a27aDJNyq0GeS9kiFfpmm+pAzsqHxAv7eHZynTEuELv7KD
 pR9S4aySds/160wJ4l3Ve9FoE2qEADaiER0elqRInzcKY41doGMqeoM3ouHwbwVIPdDN
 DqbA==
X-Gm-Message-State: AOAM532aFbF1rm0C+q0OJvBIakBZ6R66iuZC3sxDP5qAUs2+Wo2wf/37
 ulAK55qYqrdd3GEPZFwNiHKh5dOEtnHQWa3HHGpkd8rHvnObQXR4zrUQRYu/tf7Z/2eFuEFWhNI
 22ITFkPe1c5E4ZemzrDfp4MC4f3YlQ7DIMrLI8r5xfmSk8djQLEZI51XL+umi
X-Received: by 2002:a17:907:2454:: with SMTP id
 yw20mr60743884ejb.428.1638193869947; 
 Mon, 29 Nov 2021 05:51:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyn9amtWBrvEH29E6qrxygAttv8TNOMaG4An+53m98jeickEwg+zUPo8vsvzO8J7+oHIOeqwQ==
X-Received: by 2002:a17:907:2454:: with SMTP id
 yw20mr60743855ejb.428.1638193869661; 
 Mon, 29 Nov 2021 05:51:09 -0800 (PST)
Received: from redhat.com ([45.15.19.35])
 by smtp.gmail.com with ESMTPSA id qb21sm7589942ejc.78.2021.11.29.05.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 05:51:09 -0800 (PST)
Date: Mon, 29 Nov 2021 08:51:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] virtio-mmio : fix the crash in the vm shutdown
Message-ID: <20211129135053.560225-2-mst@redhat.com>
References: <20211129135053.560225-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211129135053.560225-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

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
Message-Id: <20211109023744.22387-1-lulu@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


