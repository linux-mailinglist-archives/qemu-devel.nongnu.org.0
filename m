Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BD34F95E4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 14:35:16 +0200 (CEST)
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncnpc-00079a-0O
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 08:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1ncnj8-0001mk-0G
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 08:28:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1ncnj6-0008WH-7p
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 08:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649420910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zleluUqSDZ2kUtluqs0feIxnpU+msTT2TSh4UAgP4fg=;
 b=DFFutrZZAq9LzZqvcgA+TM4Bp3roVJPHYyJic9yEqHosSbx6EpSyny7/ZuVwip/f2eNdcs
 8iIkeJ2IJz84QRVasBfhRyfO9JqtBdkZJR5jX3/ATlCtxAvib0DlqY6agMLYfnXG9grSHP
 hIazEXNI/MpJCwCe67UxXghBUhGYpHI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-aGnCSZFBNQSQy_8Zkur1xg-1; Fri, 08 Apr 2022 08:28:27 -0400
X-MC-Unique: aGnCSZFBNQSQy_8Zkur1xg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71E4738149A7;
 Fri,  8 Apr 2022 12:28:27 +0000 (UTC)
Received: from max-t490s.redhat.com (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FD25145B97F;
 Fri,  8 Apr 2022 12:28:25 +0000 (UTC)
From: Maxime Coquelin <maxime.coquelin@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 andrew@daynix.com, yuri.benditovich@daynix.com, dgilbert@redhat.com,
 quintela@redhat.com
Subject: [PATCH 5/5] vhost-user: add RSS support
Date: Fri,  8 Apr 2022 14:28:13 +0200
Message-Id: <20220408122813.1357045-6-maxime.coquelin@redhat.com>
In-Reply-To: <20220408122813.1357045-1-maxime.coquelin@redhat.com>
References: <20220408122813.1357045-1-maxime.coquelin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=maxime.coquelin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: chenbo.xia@intel.com, Maxime Coquelin <maxime.coquelin@redhat.com>,
 dmarchan@redhat.com, ktraynor@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements the RSS feature to the
Vhost-user backend.

The implementation supports up to 52 bytes RSS key length,
and 512 indirection table entries.

Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
---
 hw/virtio/vhost-user.c | 146 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 145 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 6abbc9da32..d047da81ba 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -81,6 +81,8 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
     /* Feature 14 reserved for VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS. */
     VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    /* Feature 16 reserved for VHOST_USER_PROTOCOL_F_STATUS. */
+    VHOST_USER_PROTOCOL_F_NET_RSS = 17,
     VHOST_USER_PROTOCOL_F_MAX
 };
 
@@ -126,6 +128,10 @@ typedef enum VhostUserRequest {
     VHOST_USER_GET_MAX_MEM_SLOTS = 36,
     VHOST_USER_ADD_MEM_REG = 37,
     VHOST_USER_REM_MEM_REG = 38,
+    /* Message number 39 reserved for VHOST_USER_SET_STATUS. */
+    /* Message number 40 reserved for VHOST_USER_GET_STATUS. */
+    VHOST_USER_NET_GET_RSS = 41,
+    VHOST_USER_NET_SET_RSS = 42,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -196,6 +202,24 @@ typedef struct VhostUserInflight {
     uint16_t queue_size;
 } VhostUserInflight;
 
+typedef struct VhostUserRSSCapa {
+    uint32_t supported_hash_types;
+    uint8_t max_key_len;
+    uint16_t max_indir_len;
+} VhostUserRSSCapa;
+
+#define VHOST_USER_RSS_MAX_KEY_LEN    52
+#define VHOST_USER_RSS_MAX_INDIR_LEN  512
+
+typedef struct VhostUserRSSData {
+    uint32_t hash_types;
+    uint8_t key_len;
+    uint8_t key[VHOST_USER_RSS_MAX_KEY_LEN];
+    uint16_t indir_len;
+    uint16_t indir_table[VHOST_USER_RSS_MAX_INDIR_LEN];
+    uint16_t default_queue;
+} VhostUserRSSData;
+
 typedef struct {
     VhostUserRequest request;
 
@@ -220,6 +244,8 @@ typedef union {
         VhostUserCryptoSession session;
         VhostUserVringArea area;
         VhostUserInflight inflight;
+        VhostUserRSSCapa rss_capa;
+        VhostUserRSSData rss_data;
 } VhostUserPayload;
 
 typedef struct VhostUserMsg {
@@ -2178,7 +2204,123 @@ static int vhost_user_net_set_mtu(struct vhost_dev *dev, uint16_t mtu)
         return ret;
     }
 
-    /* If reply_ack supported, slave has to ack specified MTU is valid */
+    if (reply_supported) {
+        return process_message_reply(dev, &msg);
+    }
+
+    return 0;
+}
+
+static int vhost_user_net_get_rss(struct vhost_dev *dev,
+                                  VirtioNetRssCapa *rss_capa)
+{
+    int ret;
+    VhostUserMsg msg = {
+        .hdr.request = VHOST_USER_NET_GET_RSS,
+        .hdr.flags = VHOST_USER_VERSION,
+    };
+
+    if (!(dev->protocol_features & (1ULL << VHOST_USER_PROTOCOL_F_NET_RSS))) {
+        return -EPROTO;
+    }
+
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = vhost_user_read(dev, &msg);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (msg.hdr.request != VHOST_USER_NET_GET_RSS) {
+        error_report("Received unexpected msg type. Expected %d received %d",
+                     VHOST_USER_NET_GET_RSS, msg.hdr.request);
+        return -EPROTO;
+    }
+
+    if (msg.hdr.size != sizeof(msg.payload.rss_capa)) {
+        error_report("Received bad msg size.");
+        return -EPROTO;
+    }
+
+    if (msg.payload.rss_capa.max_key_len < VIRTIO_NET_RSS_MIN_KEY_SIZE) {
+        error_report("Invalid max RSS key len (%uB, minimum %uB).",
+                     msg.payload.rss_capa.max_key_len,
+                     VIRTIO_NET_RSS_MIN_KEY_SIZE);
+        return -EINVAL;
+    }
+
+    if (msg.payload.rss_capa.max_indir_len < VIRTIO_NET_RSS_MIN_TABLE_LEN) {
+        error_report("Invalid max RSS indir table entries (%u, minimum %u).",
+                     msg.payload.rss_capa.max_indir_len,
+                     VIRTIO_NET_RSS_MIN_TABLE_LEN);
+        return -EINVAL;
+    }
+
+    rss_capa->supported_hashes = msg.payload.rss_capa.supported_hash_types;
+    rss_capa->max_key_size = MIN(msg.payload.rss_capa.max_key_len,
+                                 VHOST_USER_RSS_MAX_KEY_LEN);
+    rss_capa->max_indirection_len = MIN(msg.payload.rss_capa.max_indir_len,
+                                        VHOST_USER_RSS_MAX_INDIR_LEN);
+
+    return 0;
+}
+
+static int vhost_user_net_set_rss(struct vhost_dev *dev,
+                                  VirtioNetRssData *rss_data)
+{
+    VhostUserMsg msg;
+    bool reply_supported = virtio_has_feature(dev->protocol_features,
+                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
+    int ret;
+
+    if (!(dev->protocol_features & (1ULL << VHOST_USER_PROTOCOL_F_NET_RSS))) {
+        return -EPROTO;
+    }
+
+    msg.hdr.request = VHOST_USER_NET_SET_RSS;
+    msg.hdr.size = sizeof(msg.payload.rss_data);
+    msg.hdr.flags = VHOST_USER_VERSION;
+    if (reply_supported) {
+        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
+    }
+
+    msg.payload.rss_data.hash_types = rss_data->hash_types;
+
+    if (rss_data->key_len > VHOST_USER_RSS_MAX_KEY_LEN) {
+        error_report("RSS key length too long (%uB, max %uB).",
+                     rss_data->key_len, VHOST_USER_RSS_MAX_KEY_LEN);
+        return -EINVAL;
+    }
+
+    msg.payload.rss_data.key_len = rss_data->key_len;
+    memset(msg.payload.rss_data.key, 0, VHOST_USER_RSS_MAX_KEY_LEN);
+    memcpy(msg.payload.rss_data.key, rss_data->key, rss_data->key_len);
+
+    if (rss_data->indirections_len > VHOST_USER_RSS_MAX_INDIR_LEN) {
+        error_report("RSS indirection table too large (%u, max %u).",
+                     rss_data->indirections_len, VHOST_USER_RSS_MAX_INDIR_LEN);
+        return -EINVAL;
+    }
+
+    msg.payload.rss_data.indir_len = rss_data->indirections_len;
+    memset(msg.payload.rss_data.indir_table, 0,
+            VHOST_USER_RSS_MAX_INDIR_LEN *
+            sizeof(*msg.payload.rss_data.indir_table));
+    memcpy(msg.payload.rss_data.indir_table, rss_data->indirections_table,
+            msg.payload.rss_data.indir_len *
+            sizeof(*msg.payload.rss_data.indir_table));
+
+    msg.payload.rss_data.default_queue = rss_data->default_queue;
+
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
+        return ret;
+    }
+
+    /* If reply_ack supported, slave has to ack specified RSS conf is valid */
     if (reply_supported) {
         return process_message_reply(dev, &msg);
     }
@@ -2555,6 +2697,8 @@ const VhostOps user_ops = {
         .vhost_migration_done = vhost_user_migration_done,
         .vhost_backend_can_merge = vhost_user_can_merge,
         .vhost_net_set_mtu = vhost_user_net_set_mtu,
+        .vhost_net_get_rss = vhost_user_net_get_rss,
+        .vhost_net_set_rss = vhost_user_net_set_rss,
         .vhost_set_iotlb_callback = vhost_user_set_iotlb_callback,
         .vhost_send_device_iotlb_msg = vhost_user_send_device_iotlb_msg,
         .vhost_get_config = vhost_user_get_config,
-- 
2.35.1


