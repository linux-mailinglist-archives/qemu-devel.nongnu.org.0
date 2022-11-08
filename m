Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31414620832
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 05:20:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osG5U-0000Ez-Jn; Mon, 07 Nov 2022 23:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osG5P-0000Dv-FU
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 23:19:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osG5N-0004M0-SA
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 23:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667881180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJ+OeiGs3+ijV+rxOtwuQqouyqdAF7TkTFYOUvVh7eM=;
 b=jCxF10gVGeC0vG/nIgU9DBDmDiN9vooVijxOJSlwqsyABviOzdYYAd5Fyg21o0Bmfqg2XL
 ZXMyo91NQ1Pc6nuTlFC1II4hDxmfYHN2RsKEz2L0viUQpTtJbNeNErnV6JKHvIF9g/eQeG
 weaszO9eXIOXddcc+xlGnkAf6prtDG8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-NWTW4WHuPtir7X0AmyXGsA-1; Mon, 07 Nov 2022 23:19:36 -0500
X-MC-Unique: NWTW4WHuPtir7X0AmyXGsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53D53811E67;
 Tue,  8 Nov 2022 04:19:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-19.pek2.redhat.com [10.72.14.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BB78112132D;
 Tue,  8 Nov 2022 04:19:33 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com
Cc: qemu-devel@nongnu.org, Si-Wei Liu <si-wei.liu@oracle.com>,
 Eugenio Perez Martin <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 1/2] vhost-vdpa: fix assert
 !virtio_net_get_subqueue(nc)->async_tx.elem in virtio_net_reset
Date: Tue,  8 Nov 2022 12:19:28 +0800
Message-Id: <20221108041929.18417-2-jasowang@redhat.com>
In-Reply-To: <20221108041929.18417-1-jasowang@redhat.com>
References: <20221108041929.18417-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

From: Si-Wei Liu <si-wei.liu@oracle.com>

The citing commit has incorrect code in vhost_vdpa_receive() that returns
zero instead of full packet size to the caller. This renders pending packets
unable to be freed so then get clogged in the tx queue forever. When device
is being reset later on, below assertion failure ensues:

0  0x00007f86d53bb387 in raise () from /lib64/libc.so.6
1  0x00007f86d53bca78 in abort () from /lib64/libc.so.6
2  0x00007f86d53b41a6 in __assert_fail_base () from /lib64/libc.so.6
3  0x00007f86d53b4252 in __assert_fail () from /lib64/libc.so.6
4  0x000055b8f6ff6fcc in virtio_net_reset (vdev=<optimized out>) at /usr/src/debug/qemu/hw/net/virtio-net.c:563
5  0x000055b8f7012fcf in virtio_reset (opaque=0x55b8faf881f0) at /usr/src/debug/qemu/hw/virtio/virtio.c:1993
6  0x000055b8f71f0086 in virtio_bus_reset (bus=bus@entry=0x55b8faf88178) at /usr/src/debug/qemu/hw/virtio/virtio-bus.c:102
7  0x000055b8f71f1620 in virtio_pci_reset (qdev=<optimized out>) at /usr/src/debug/qemu/hw/virtio/virtio-pci.c:1845
8  0x000055b8f6fafc6c in memory_region_write_accessor (mr=<optimized out>, addr=<optimized out>, value=<optimized out>,
   size=<optimized out>, shift=<optimized out>, mask=<optimized out>, attrs=...) at /usr/src/debug/qemu/memory.c:483
9  0x000055b8f6fadce9 in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f867e7fb7e8, size=size@entry=1,
   access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x55b8f6fafc20 <memory_region_write_accessor>,
   mr=0x55b8faf80a50, attrs=...) at /usr/src/debug/qemu/memory.c:544
10 0x000055b8f6fb1d0b in memory_region_dispatch_write (mr=mr@entry=0x55b8faf80a50, addr=addr@entry=20, data=0, op=<optimized out>,
   attrs=attrs@entry=...) at /usr/src/debug/qemu/memory.c:1470
11 0x000055b8f6f62ada in flatview_write_continue (fv=fv@entry=0x7f86ac04cd20, addr=addr@entry=549755813908, attrs=...,
   attrs@entry=..., buf=buf@entry=0x7f86d0223028 <Address 0x7f86d0223028 out of bounds>, len=len@entry=1, addr1=20, l=1,
   mr=0x55b8faf80a50) at /usr/src/debug/qemu/exec.c:3266
12 0x000055b8f6f62c8f in flatview_write (fv=0x7f86ac04cd20, addr=549755813908, attrs=...,
   buf=0x7f86d0223028 <Address 0x7f86d0223028 out of bounds>, len=1) at /usr/src/debug/qemu/exec.c:3306
13 0x000055b8f6f674cb in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=<optimized out>,
   len=<optimized out>) at /usr/src/debug/qemu/exec.c:3396
14 0x000055b8f6f67575 in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=..., attrs@entry=...,
   buf=buf@entry=0x7f86d0223028 <Address 0x7f86d0223028 out of bounds>, len=<optimized out>, is_write=<optimized out>)
   at /usr/src/debug/qemu/exec.c:3406
15 0x000055b8f6fc1cc8 in kvm_cpu_exec (cpu=cpu@entry=0x55b8f9aa0e10) at /usr/src/debug/qemu/accel/kvm/kvm-all.c:2410
16 0x000055b8f6fa5f5e in qemu_kvm_cpu_thread_fn (arg=0x55b8f9aa0e10) at /usr/src/debug/qemu/cpus.c:1318
17 0x000055b8f7336e16 in qemu_thread_start (args=0x55b8f9ac8480) at /usr/src/debug/qemu/util/qemu-thread-posix.c:519
18 0x00007f86d575aea5 in start_thread () from /lib64/libpthread.so.0
19 0x00007f86d5483b2d in clone () from /lib64/libc.so.6

Make vhost_vdpa_receive() return the size passed in as is, so that the
caller qemu_deliver_packet_iov() would eventually propagate it back to
virtio_net_flush_tx() to release pending packets from the async_tx queue.
Which corresponds to the drop path where qemu_sendv_packet_async() returns
non-zero in virtio_net_flush_tx().

Fixes: 846a1e85da64 ("vdpa: Add dummy receive callback")
Cc: Eugenio Perez Martin <eperezma@redhat.com>
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index e370ecb..6811089 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -210,7 +210,7 @@ static bool vhost_vdpa_check_peer_type(NetClientState *nc, ObjectClass *oc,
 static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
                                   size_t size)
 {
-    return 0;
+    return size;
 }
 
 static NetClientInfo net_vhost_vdpa_info = {
-- 
2.7.4


