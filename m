Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE65397FB2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:51:20 +0200 (CEST)
Received: from localhost ([::1]:53426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHuZ-00068e-1h
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1loHs9-0007hu-8q
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:48:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1loHs7-0006ux-OO
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622605727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0QJF2dgoyJUzIYJvDnAloImFPWh7+izxFpQ+sV9WmCw=;
 b=COSvDTTyEG+fn+06x/YfOFYk1Yoas292NbO5RTcAk1KtG9WzYr8ryWKkU7MHNKhsHWTCCh
 bUkqtpvlJFJDNdcbikG9Ko90iUuwK7gpuWKqVNMtARXC5ODGRRoE8iAh3a+49WMLfCGM4A
 Ed14rlcOMCZ6dRfk9k8Id6gofZMlnR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-mPj_Gi9EPz2iRwi7Zshplg-1; Tue, 01 Jun 2021 23:48:45 -0400
X-MC-Unique: mPj_Gi9EPz2iRwi7Zshplg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1FA0101371C
 for <qemu-devel@nongnu.org>; Wed,  2 Jun 2021 03:48:44 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-199.pek2.redhat.com [10.72.13.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E2975D6D5;
 Wed,  2 Jun 2021 03:48:43 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v7 10/10] virtio-net: add peer_deleted check in
 virtio_net_handle_rx
Date: Wed,  2 Jun 2021 11:47:50 +0800
Message-Id: <20210602034750.23377-11-lulu@redhat.com>
In-Reply-To: <20210602034750.23377-1-lulu@redhat.com>
References: <20210602034750.23377-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During the test, We found this function will continue running
while the peer is deleted, this will cause the crash. so add
check for this. this only exist in  machines type microvm

reproduce step :
load the VM with
qemu-system-x86_64 -M microvm
...
    -netdev tap,id=tap0,vhost=on,script=no,downscript=no \
    -device virtio-net-device,netdev=tap0 \
..
enter the VM's console
shutdown the VM
(gdb) bt

0  0x000055555595b926 in qemu_net_queue_flush (queue=0x0) at ../net/queue.c:275
1  0x0000555555a046ea in qemu_flush_or_purge_queued_packets (nc=0x555556ccb920, purge=false)
    at ../net/net.c:624
2  0x0000555555a04736 in qemu_flush_queued_packets (nc=0x555556ccb920) at ../net/net.c:637
3  0x0000555555ccc01a in virtio_net_handle_rx (vdev=0x555557360ed0, vq=0x7ffff40d6010)
    at ../hw/net/virtio-net.c:1401
4  0x0000555555ce907a in virtio_queue_notify_vq (vq=0x7ffff40d6010) at ../hw/virtio/virtio.c:2346
5  0x0000555555cec07c in virtio_queue_host_notifier_read (n=0x7ffff40d608c)
    at ../hw/virtio/virtio.c:3606
6  0x00005555560376ac in aio_dispatch_handler (ctx=0x555556a857e0, node=0x555556f013d0)
    at ../util/aio-posix.c:329
7  0x00005555560377a4 in aio_dispatch_ready_handlers (ctx=0x555556a857e0,
    ready_list=0x7fffffffdfe0) at ../util/aio-posix.c:359
8  0x0000555556038209 in aio_poll (ctx=0x555556a857e0, blocking=false) at ../util/aio-posix.c:662
9  0x0000555555e51c6f in monitor_cleanup () at ../monitor/monitor.c:637
10 0x0000555555d2d626 in qemu_cleanup () at ../softmmu/runstate.c:821
11 0x000055555585b19b in main (argc=21, argv=0x7fffffffe1c8, envp=0x7fffffffe278)

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/net/virtio-net.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 02033be748..927a808654 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1397,7 +1397,9 @@ static void virtio_net_handle_rx(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
     int queue_index = vq2q(virtio_get_queue_index(vq));
-
+    if (n->nic->peer_deleted) {
+        return;
+    }
     qemu_flush_queued_packets(qemu_get_subqueue(n->nic, queue_index));
 }
 
-- 
2.21.3


