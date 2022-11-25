Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9DC638C65
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:40:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZrS-0000cM-Dr; Fri, 25 Nov 2022 09:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyZrG-0000Wc-2n
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:39:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyZrE-00037S-K7
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669387151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fs85U69IRKNA4arYUvUFJSFq369RRgnafMplgvg3Rkc=;
 b=Abql1rs1txLPfN3IUULdjr+uOuLiVlhlgvDLfaEey1k6NYhpuuBoccmUfvdTQ+VqMAxb6O
 t0H9smiYeZeFlnARWomQk+c6n9hGu4/I2norsaUcazfhBQ2bJzY1t2SlJISEoab3ms32/6
 d0TGdMKwuLO9RTPrbeNfUZO6vbTB8vY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-8QKqIZaAMaiUZ1-HB0nXLA-1; Fri, 25 Nov 2022 09:39:08 -0500
X-MC-Unique: 8QKqIZaAMaiUZ1-HB0nXLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F9AB29DD9B9;
 Fri, 25 Nov 2022 14:39:08 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D25F2028E94;
 Fri, 25 Nov 2022 14:39:05 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Cindy Lu <lulu@redhat.com>
Subject: [RFC PATCH 1/3] virtio_net: export
 virtio_net_guest_offloads_by_features
Date: Fri, 25 Nov 2022 15:38:57 +0100
Message-Id: <20221125143859.2211494-2-eperezma@redhat.com>
In-Reply-To: <20221125143859.2211494-1-eperezma@redhat.com>
References: <20221125143859.2211494-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

vdpa NIC can use it to know if it needs to restore guest offloads at
startup / migration.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio-net.h | 1 +
 hw/net/virtio-net.c            | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index ef234ffe7e..491eafef16 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -221,6 +221,7 @@ struct VirtIONet {
     struct EBPFRSSContext ebpf_rss;
 };
 
+uint64_t virtio_net_guest_offloads_by_features(uint32_t features);
 size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
                                   const struct iovec *in_sg, unsigned in_num,
                                   const struct iovec *out_sg,
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index aba12759d5..87eb086dee 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -845,7 +845,7 @@ static void virtio_net_apply_guest_offloads(VirtIONet *n)
             !!(n->curr_guest_offloads & (1ULL << VIRTIO_NET_F_GUEST_UFO)));
 }
 
-static uint64_t virtio_net_guest_offloads_by_features(uint32_t features)
+uint64_t virtio_net_guest_offloads_by_features(uint32_t features)
 {
     static const uint64_t guest_offloads_mask =
         (1ULL << VIRTIO_NET_F_GUEST_CSUM) |
-- 
2.31.1


