Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B950F653196
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:22:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ynh-0006MB-QD; Wed, 21 Dec 2022 08:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yn9-0005np-Jh
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yn7-0004KF-JM
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xECyqVik+yG36oYBQGaIgMBSKyX51JqxFZ1W9WtYqUM=;
 b=Is4JIPuS1YYiKP+taM0Kh/e737knNeiyIftO0/NNAI9mHOYkkNAo0iREa2KJknV+CiPAn4
 rF+0bbdPVZ6fbFk1at9CFgQRaypebsL0plWDxGgKXeYaBm+FDsdMxUFiPgQqx/i2OCXuSY
 83PD1ieaRUcbb6b35JfTFyFwiq+BrWE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456-_9iovp5RM1e-axklwUXK3Q-1; Wed, 21 Dec 2022 08:05:46 -0500
X-MC-Unique: _9iovp5RM1e-axklwUXK3Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 a7-20020adfbc47000000b002421f817287so2865338wrh.4
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xECyqVik+yG36oYBQGaIgMBSKyX51JqxFZ1W9WtYqUM=;
 b=4s9wg7i4VXO/KW+VS9LVZRGr4BVlwTkwr3UVOjK4JPLm31r/7iVQDaFCVsTagaDDqV
 4yYkQR9qPFBD0L7FCJiV9tbt8QGt26jkoWt05fqYNMcT0TSHI1iiihU5Rm+X1xYrjVL9
 bAH2FddDRxdMHWVPdTGG9P4bKpdPlBetlkwS1578ip6jl9nJooC+Mg6m4DJABIU9pQ1i
 h/sdD4+/CyIqRJuPlwXRSjesVVWu+0e8X/IiOqYoun/8ZU5qDNDN/8S1QoOoob9qaNPB
 E/o+fsw7gprq+1+eUIEQI2sy2cpZnx5sOzYfvPF4eB+WTfefFQX8G07RheQXsAujRxQo
 yVcA==
X-Gm-Message-State: AFqh2koRR7Sr4S/tfPEJS7S7uCa0zvmOIRDmxTuZ0p6xF2yIATAnrVw8
 N9M5Pt46NJqqocIprNgqI60jSNx4MHKoOLUYhZ+MlIShL2VhUEAOdLIHRG0zC0vuAg0qHnCLQy0
 pzHSx5a5js/ZWx3PwlqFAz0ybr+5MbZrJuRGv/jAnQYi2QrkKw1YFJTZuMarK
X-Received: by 2002:a05:600c:4e08:b0:3cf:a41d:844b with SMTP id
 b8-20020a05600c4e0800b003cfa41d844bmr1603933wmq.5.1671627944205; 
 Wed, 21 Dec 2022 05:05:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv3fSxfBzRUDl7MI27xid0Q5ePNOwYZoU+O89mPIsW14DJJlFXgd8llOepWBg9eEvHYgJ0RAw==
X-Received: by 2002:a05:600c:4e08:b0:3cf:a41d:844b with SMTP id
 b8-20020a05600c4e0800b003cfa41d844bmr1603920wmq.5.1671627943970; 
 Wed, 21 Dec 2022 05:05:43 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b003cf71b1f66csm2686648wms.0.2022.12.21.05.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:43 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 22/41] vdpa: add shadow_data to vhost_vdpa
Message-ID: <20221221130339.1234592-23-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

The memory listener that thells the device how to convert GPA to qemu's
va is registered against CVQ vhost_vdpa. memory listener translations
are always ASID 0, CVQ ones are ASID 1 if supported.

Let's tell the listener if it needs to register them on iova tree or
not.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221215113144.322011-12-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h | 2 ++
 hw/virtio/vhost-vdpa.c         | 6 +++---
 net/vhost-vdpa.c               | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index e57dfa1fd1..45b969a311 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -40,6 +40,8 @@ typedef struct vhost_vdpa {
     struct vhost_vdpa_iova_range iova_range;
     uint64_t acked_features;
     bool shadow_vqs_enabled;
+    /* Vdpa must send shadow addresses as IOTLB key for data queues, not GPA */
+    bool shadow_data;
     /* IOVA mapping used by the Shadow Virtqueue */
     VhostIOVATree *iova_tree;
     GPtrArray *shadow_vqs;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index beb6368e40..20d9575e4f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -224,7 +224,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                          vaddr, section->readonly);
 
     llsize = int128_sub(llend, int128_make64(iova));
-    if (v->shadow_vqs_enabled) {
+    if (v->shadow_data) {
         int r;
 
         mem_region.translated_addr = (hwaddr)(uintptr_t)vaddr,
@@ -251,7 +251,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
     return;
 
 fail_map:
-    if (v->shadow_vqs_enabled) {
+    if (v->shadow_data) {
         vhost_iova_tree_remove(v->iova_tree, mem_region);
     }
 
@@ -296,7 +296,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
 
     llsize = int128_sub(llend, int128_make64(iova));
 
-    if (v->shadow_vqs_enabled) {
+    if (v->shadow_data) {
         const DMAMap *result;
         const void *vaddr = memory_region_get_ram_ptr(section->mr) +
             section->offset_within_region +
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index bff72717d0..710c5efe96 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -573,6 +573,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->always_svq = svq;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_range = iova_range;
+    s->vhost_vdpa.shadow_data = svq;
     s->vhost_vdpa.iova_tree = iova_tree;
     if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
-- 
MST


