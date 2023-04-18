Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5521B6E65B9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 15:22:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1polH8-0006zL-IB; Tue, 18 Apr 2023 09:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ray90514@gmail.com>)
 id 1pokzF-00013U-L9
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:03:10 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ray90514@gmail.com>)
 id 1pokzE-0003q8-0J
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:03:09 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b64a32fd2so2052885b3a.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 06:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681822986; x=1684414986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eh4Lot7DMkLHm5/KjndeBxBnpW6gcYESQtX9BT0zWlY=;
 b=fOZntvhvp3qTvxdYOdbdb3hzNGQK1i/2FfmT/ScfVACO7vYEacfzLLVlofQ6QruItH
 kYHkS8OzWwtNK9T2yI4Q2AZ5gT42ddnA7kyqcA1B5MqiBArVV273dDvrY46RJtTd4eyh
 Ufvasn/PoJJamYY3WFUH7Ux1DcgEsZSszY5M619Fpf15uBxqxGn5noUSlS/Od5/TDQz5
 M8oRY2hdLSp8925P59fcMAPl2RW6P+XlH82RveYRGxasDhWotNENYegsLmPzlBg6N7qi
 eJJ10uYXC2IefYuzSzhCb0wcid5976EJwtfrP+Fq+sDWIb6CT5Vq0krqEOxzEUay873H
 YsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681822986; x=1684414986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eh4Lot7DMkLHm5/KjndeBxBnpW6gcYESQtX9BT0zWlY=;
 b=HHJvpOYUyh6zs5a4WrWvV0VndQ724f8JsfcAy1Nnn7FA84nNFnHK5vaLz2xUlPQY6p
 nXYThSjYd0nCH720uDaw309qKP/tMT8vPi3VW9vHvtmynVJE7XtYWmz4rnCtE87okZrg
 IKHohDkLKDBWE3x0K9Y4sl+L54jUEHPZDkPt9FFfU7UzVQPf+5Zn6obK7ashgrfK0aO0
 WsJYMaOVCkyPNXJUJ+1FUtVgCUOyC0oYCXRlyqvfrEMFqIqFHvg83F5E2lLMkuYSCuUg
 DZlnIqRp+vI1AoF2APF0Raz0Gg0galgvvS6OrhQxXLTQpsCjcsnV2Yidrj37zVjbKQw7
 OIAg==
X-Gm-Message-State: AAQBX9diLVJQYclKuKh6SwbohjYJEL1Vl7BqVQC/dLRYHxMAscN9laV5
 HMCqWOmoW+n6CwMLtHPDJP0=
X-Google-Smtp-Source: AKy350Z5ZORhJFZPOOEYfmt2qqjkXVG2izUzNuZsm+4427YUODAYixbhDYZPSy1UK0JWXhK5sA3ucg==
X-Received: by 2002:a05:6a00:1509:b0:63d:43bd:8444 with SMTP id
 q9-20020a056a00150900b0063d43bd8444mr165638pfu.33.1681822986449; 
 Tue, 18 Apr 2023 06:03:06 -0700 (PDT)
Received: from localhost.localdomain
 (2001-b011-e009-51d6-c0ea-8cf7-d394-c0ac.dynamic-ip6.hinet.net.
 [2001:b011:e009:51d6:c0ea:8cf7:d394:c0ac])
 by smtp.gmail.com with ESMTPSA id
 v26-20020aa7851a000000b00637b0c719c5sm9287275pfn.201.2023.04.18.06.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 06:03:06 -0700 (PDT)
From: Shao-Chien Chiang <ray90514@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Shao-Chien Chiang <ray90514@gmail.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v1 1/2] vhost-vdpa: cache device status and features
Date: Tue, 18 Apr 2023 21:01:06 +0800
Message-Id: <b9a88776ff1f7bc94ff0df9dd99b799ebd1e6d54.1681819697.git.ray90514@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1681819697.git.ray90514@gmail.com>
References: <cover.1681819697.git.ray90514@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=ray90514@gmail.com; helo=mail-pf1-x42f.google.com
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

After caching the device status and features, the latency is reduced by 0.059 sec.

Signed-off-by: Shao-Chien Chiang <ray90514@gmail.com>
---
 hw/virtio/vhost-vdpa.c         | 16 ++++++++++------
 include/hw/virtio/vhost-vdpa.h |  2 ++
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bc6bad23d5..ccde4c7040 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -350,14 +350,11 @@ static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
 
 static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
 {
-    uint8_t s;
+    struct vhost_vdpa *v = dev->opaque;
+    uint8_t s = v->status;
     int ret;
 
     trace_vhost_vdpa_add_status(dev, status);
-    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
-    if (ret < 0) {
-        return ret;
-    }
 
     s |= status;
 
@@ -374,6 +371,7 @@ static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
     if (!(s & status)) {
         return -EIO;
     }
+    v->status = s;
 
     return 0;
 }
@@ -436,6 +434,8 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     dev->opaque =  opaque ;
     v->listener = vhost_vdpa_memory_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
+    v->status = 0;
+    v->features = dev->features;
     vhost_vdpa_init_svq(dev, v);
 
     error_propagate(&dev->migration_blocker, v->migration_blocker);
@@ -456,6 +456,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
             return ret;
         }
         vhost_svq_valid_features(features, &dev->migration_blocker);
+        v->features = features;
     }
 
     /*
@@ -718,6 +719,7 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
     trace_vhost_vdpa_reset_device(dev, status);
     v->suspended = false;
+    v->status = 0;
     return ret;
 }
 
@@ -1294,8 +1296,10 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
 {
-    int ret = vhost_vdpa_get_dev_features(dev, features);
+    struct vhost_vdpa *v = dev->opaque;
+    int ret = 0;
 
+    *features = v->features;
     if (ret == 0) {
         /* Add SVQ logging capabilities */
         *features |= BIT_ULL(VHOST_F_LOG_ALL);
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index c278a2a8de..d563630cc9 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -39,6 +39,8 @@ typedef struct vhost_vdpa {
     MemoryListener listener;
     struct vhost_vdpa_iova_range iova_range;
     uint64_t acked_features;
+    uint64_t features;
+    uint8_t status;
     bool shadow_vqs_enabled;
     /* Vdpa must send shadow addresses as IOTLB key for data queues, not GPA */
     bool shadow_data;
-- 
2.25.1


