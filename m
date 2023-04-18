Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7C96E65B8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 15:22:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1polH9-0006zr-51; Tue, 18 Apr 2023 09:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ray90514@gmail.com>)
 id 1pokzJ-00016b-PQ
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:03:15 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ray90514@gmail.com>)
 id 1pokzI-0003qf-1m
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:03:13 -0400
Received: by mail-pl1-x62a.google.com with SMTP id la15so4670375plb.11
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681822990; x=1684414990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kqt9SyJasoobR7gcykpiH3H5RDBRw7sAuIS3kccezRo=;
 b=GRJAPLXgwN1RjzNlTYTkNjyZTeXJZs9HD0O2Nbp8XfkS8LcF2f8OoM5tOsHCGUrNOM
 6Cu1VPKnFA/M0+BksK7vOqr2tEmUzXGSHhzxVi+2J3Pxac9ZugzJRBp5JgAuNzIwrU7+
 PnOnV2SQ/Uen6WteUByYQz9ZR29W4t/SRVPy1AdiEaim1c6oK6ewwGe9HKeI9+BX1fXt
 jPL9q1AoBhRJFXRiXNmBK+KJbhOiQaiZyyGez8KeeIcHIJoC3uQ45ohWxti8t0lULlhj
 xdBq1e3tGrU2sEu9SIOP4WmClXHtjXtKQvvy5SJ9dvJF90n6mqGCDDTYVJaTX/aadoUe
 BzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681822990; x=1684414990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kqt9SyJasoobR7gcykpiH3H5RDBRw7sAuIS3kccezRo=;
 b=K7EoHr9UheezE8o5W343pDdp5rVaRCwRdJkdjgnaj6A2y8ZNaJn8CUuhyw10f1LTGU
 P8XBf33dSo/7ABK48FeOUGSYwEhiToO3dhFXMnV2btyjaNEo4Zcs6jLdydWeP34G8pgT
 C8YsqG0J4B07dcQ0rY2HI1ZcKDhYh/LmYav1wkCBdC0y0tgZ+K8s6oaF0d9gL9fZal39
 TVu4XM7AiTiCuzC6gwKSUO5VzQ95Q9gLLyOUD5EvXlphkp0NN55NcdmPUMVD8fulN939
 iewkRldSnkA8bb9xG5rZZO9Hipi99j6PWNA+QN4cAIx+3kqd+lR7je3phUHZ6DSeUz/L
 lisA==
X-Gm-Message-State: AAQBX9dwVzKcv3lPbh/6KviKFrzxgH9jhgEh22wIubVt6ZuhPU51dztH
 HXL0IVvi7G3NlKX1q2UTlK0=
X-Google-Smtp-Source: AKy350aqwFIATA7UEn008Oxx/tSy+LUgPPMACTqXAzor4le4qAnYH9m7zjB6e35Xl8xIxd2W3U2IlA==
X-Received: by 2002:a05:6a20:4414:b0:ef:f7a4:a67e with SMTP id
 ce20-20020a056a20441400b000eff7a4a67emr7576075pzb.0.1681822989867; 
 Tue, 18 Apr 2023 06:03:09 -0700 (PDT)
Received: from localhost.localdomain
 (2001-b011-e009-51d6-c0ea-8cf7-d394-c0ac.dynamic-ip6.hinet.net.
 [2001:b011:e009:51d6:c0ea:8cf7:d394:c0ac])
 by smtp.gmail.com with ESMTPSA id
 v26-20020aa7851a000000b00637b0c719c5sm9287275pfn.201.2023.04.18.06.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 06:03:09 -0700 (PDT)
From: Shao-Chien Chiang <ray90514@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Shao-Chien Chiang <ray90514@gmail.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v1 2/2] vhost-vdpa: cache device config
Date: Tue, 18 Apr 2023 21:01:07 +0800
Message-Id: <5c10e79c26b8dda38ebeba6bcafb8bc650f6a588.1681819697.git.ray90514@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1681819697.git.ray90514@gmail.com>
References: <cover.1681819697.git.ray90514@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=ray90514@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 Apr 2023 09:21:36 -0400
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

The config caching is disabled when starting config interruption.
If we could know whether there is a config interruption, I think we can
invalidate the cache at that time instead of disabling the caching
mechanism. 
After caching the device config, the latency is reduced by 0.066 sec.

Signed-off-by: Shao-Chien Chiang <ray90514@gmail.com>
---
 hw/virtio/vhost-vdpa.c         | 44 +++++++++++++++++++++++++++-------
 include/hw/virtio/vhost-vdpa.h |  2 ++
 2 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ccde4c7040..92bb09ef4d 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -436,6 +436,8 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     v->msg_type = VHOST_IOTLB_MSG_V2;
     v->status = 0;
     v->features = dev->features;
+    v->config = NULL;
+    v->config_cache_enabled = true;
     vhost_vdpa_init_svq(dev, v);
 
     error_propagate(&dev->migration_blocker, v->migration_blocker);
@@ -748,8 +750,16 @@ static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
 static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
                                        int fd)
 {
+    struct vhost_vdpa *v = dev->opaque;
+    int ret;
+
     trace_vhost_vdpa_set_config_call(dev, fd);
-    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, &fd);
+    ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, &fd);
+    if (ret == 0) {
+        v->config_cache_enabled = false;
+    }
+
+    return ret;
 }
 
 static void vhost_vdpa_dump_config(struct vhost_dev *dev, const uint8_t *config,
@@ -769,6 +779,7 @@ static int vhost_vdpa_set_config(struct vhost_dev *dev, const uint8_t *data,
                                    uint32_t offset, uint32_t size,
                                    uint32_t flags)
 {
+    struct vhost_vdpa *v = dev->opaque;
     struct vhost_vdpa_config *config;
     int ret;
     unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
@@ -783,6 +794,11 @@ static int vhost_vdpa_set_config(struct vhost_dev *dev, const uint8_t *data,
         vhost_vdpa_dump_config(dev, data, size);
     }
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG, config);
+    if (v->config_cache_enabled && v->config != NULL) {
+        if (ret == 0) {
+            memcpy(v->config->buf + offset, data, size);
+        }
+    }
     g_free(config);
     return ret;
 }
@@ -790,17 +806,29 @@ static int vhost_vdpa_set_config(struct vhost_dev *dev, const uint8_t *data,
 static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
                                    uint32_t config_len, Error **errp)
 {
-    struct vhost_vdpa_config *v_config;
+    struct vhost_vdpa *v = dev->opaque;
     unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
     int ret;
 
     trace_vhost_vdpa_get_config(dev, config, config_len);
-    v_config = g_malloc(config_len + config_size);
-    v_config->len = config_len;
-    v_config->off = 0;
-    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_CONFIG, v_config);
-    memcpy(config, v_config->buf, config_len);
-    g_free(v_config);
+    if (v->config_cache_enabled && v->config != NULL) {
+        if (config_len <= v->config->len) {
+            memcpy(config, v->config->buf, config_len);
+            ret = 0;
+        } else {
+            ret = -EINVAL;
+        }
+    } else {
+        v->config = g_malloc(config_len + config_size);
+        v->config->len = config_len;
+        v->config->off = 0;
+        ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_CONFIG, v->config);
+        memcpy(config, v->config->buf, config_len);
+        if (!v->config_cache_enabled) {
+            g_free(v->config);
+            v->config = NULL;
+        }
+    }
     if (trace_event_get_state_backends(TRACE_VHOST_VDPA_GET_CONFIG) &&
         trace_event_get_state_backends(TRACE_VHOST_VDPA_DUMP_CONFIG)) {
         vhost_vdpa_dump_config(dev, config, config_len);
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index d563630cc9..60374785fd 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -41,6 +41,8 @@ typedef struct vhost_vdpa {
     uint64_t acked_features;
     uint64_t features;
     uint8_t status;
+    struct vhost_vdpa_config *config;
+    bool config_cache_enabled;
     bool shadow_vqs_enabled;
     /* Vdpa must send shadow addresses as IOTLB key for data queues, not GPA */
     bool shadow_data;
-- 
2.25.1


