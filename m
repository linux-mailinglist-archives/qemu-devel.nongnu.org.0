Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D759C2F70F6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 04:30:13 +0100 (CET)
Received: from localhost ([::1]:49386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0FoS-0000tf-VZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 22:30:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1l0Fln-0006Ft-SW
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:27:27 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1l0Fll-0000iu-C5
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:27:27 -0500
Received: by mail-pg1-x536.google.com with SMTP id n10so5118178pgl.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 19:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kOtGR0l9culuvWtAiNHBapDt7mXNg97Y6uu3/6Dz/7U=;
 b=GPnylN9A1FyxFKOSNxWSHtagPQlW9mmCwTJ/LdLniGMwS+xmZ03Q7HeopyosJIGUou
 YgFraWluaO152KqbsEIoue5LERtDIy6Jww+ykzkWKnYSfzj4hCCXY20l4VU6i1CACVBf
 UUyaSBTQ7Tdsn+a5T/4+T9HaV1/HPjdRGjnq0+ugFVFX59XaY2/YCy8Va6gVXumgtuxK
 FfsrtJ2duGn4D48vTn3x3DIKx5ppXOy/t6jQr1Kv+witH/03vvbhD6ajMkf4nCLo5ytb
 o66rU80+Q9Rl/oaZePVzUlxHhQRhJniEJa60PBEoqBEQe34OP5rXLMnK8BiWbc/HDFCV
 YhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kOtGR0l9culuvWtAiNHBapDt7mXNg97Y6uu3/6Dz/7U=;
 b=a88WOeGeDIWgZ6lYfZBJyi9y4EcfveuZfelt4zvG+iLsflk9mTIFWAk0SiS7AnBngq
 nGtBtd3F381rj7fHUO0/CtV4DciGA6ULbmwrdBvNe3R5TbUVCQQ5x3Y9ci3jhzudA81y
 G71bOt9sO6Q2Gi0UGkLJwTOk2+ILzWMu2QURjMCNDOech7XtG5EihM/mlRuj8sivVG5w
 NviuvxD4Ur4dxrpyvrZVY5h5aRzRtnd/yJUFfBWNsNNjbGW9JRb4rRed9EbZEIacK7OY
 iXbbah5KQwqZcGpXi3eBLhdpXub6NDuQeY8WxVV5Zx15HKHLaBwxU0QHjIwzvf8Wdcp7
 /9Zw==
X-Gm-Message-State: AOAM531uykwUg8AJBRYkVHKl3hL+pWYNYfSI3DBvyh7zJA3IEv4Pbkqu
 8KORFRQ4dNBljdENjiIjOE3ang==
X-Google-Smtp-Source: ABdhPJwM9rsXFl56F70SLLbwFly9oNAr1XoYTMCwyQ3mxdwpQfAkQJlFAgTjoiTIOTepHk0P1+bYKw==
X-Received: by 2002:a62:5205:0:b029:19e:a0f:2c81 with SMTP id
 g5-20020a6252050000b029019e0a0f2c81mr10568707pfb.50.1610681244181; 
 Thu, 14 Jan 2021 19:27:24 -0800 (PST)
Received: from always-libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id j16sm6583662pjj.18.2021.01.14.19.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 19:27:23 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org, its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
Subject: [PATCH v4 3/3] hw/blocl/nvme: trigger async event during injecting
 smart warning
Date: Fri, 15 Jan 2021 11:27:02 +0800
Message-Id: <20210115032702.466631-4-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115032702.466631-1-pizhenwei@bytedance.com>
References: <20210115032702.466631-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: zhenwei pi <pizhenwei@bytedance.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During smart critical warning injection by setting property from QMP
command, also try to trigger asynchronous event.

Suggested by Keith, if a event has already been raised, there is no
need to enqueue the duplicate event any more.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hw/block/nvme.c      | 48 +++++++++++++++++++++++++++++++++++++-------
 include/block/nvme.h |  1 +
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2d71ebeb30..f72a30b499 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -980,6 +980,35 @@ static void nvme_enqueue_event(NvmeCtrl *n, uint8_t event_type,
     nvme_process_aers(n);
 }
 
+static void nvme_smart_event(NvmeCtrl *n, uint8_t event)
+{
+    uint8_t aer_info;
+
+    /* Ref SPEC <Asynchronous Event Information 0x2013 SMART / Health Status> */
+    if (!(NVME_AEC_SMART(n->features.async_config) & event)) {
+        return;
+    }
+
+    switch (event) {
+    case NVME_SMART_SPARE:
+        aer_info = NVME_AER_INFO_SMART_SPARE_THRESH;
+        break;
+    case NVME_SMART_TEMPERATURE:
+        aer_info = NVME_AER_INFO_SMART_TEMP_THRESH;
+        break;
+    case NVME_SMART_RELIABILITY:
+    case NVME_SMART_MEDIA_READ_ONLY:
+    case NVME_SMART_FAILED_VOLATILE_MEDIA:
+    case NVME_SMART_PMR_UNRELIABLE:
+        aer_info = NVME_AER_INFO_SMART_RELIABILITY;
+        break;
+    default:
+        return;
+    }
+
+    nvme_enqueue_event(n, NVME_AER_TYPE_SMART, aer_info, NVME_LOG_SMART_INFO);
+}
+
 static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
 {
     n->aer_mask &= ~(1 << event_type);
@@ -3238,12 +3267,9 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
-        if (((n->temperature >= n->features.temp_thresh_hi) ||
-             (n->temperature <= n->features.temp_thresh_low)) &&
-            NVME_AEC_SMART(n->features.async_config) & NVME_SMART_TEMPERATURE) {
-            nvme_enqueue_event(n, NVME_AER_TYPE_SMART,
-                               NVME_AER_INFO_SMART_TEMP_THRESH,
-                               NVME_LOG_SMART_INFO);
+        if ((n->temperature >= n->features.temp_thresh_hi) ||
+            (n->temperature <= n->features.temp_thresh_low)) {
+            nvme_smart_event(n, NVME_AER_INFO_SMART_TEMP_THRESH);
         }
 
         break;
@@ -4360,7 +4386,7 @@ static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
     NvmeCtrl *n = NVME(obj);
-    uint8_t value, cap = 0;
+    uint8_t value, old_value, cap = 0, index, event;
 
     if (!visit_type_uint8(v, name, &value, errp)) {
         return;
@@ -4378,7 +4404,15 @@ static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    old_value = n->smart_critical_warning;
     n->smart_critical_warning = value;
+
+    /* only inject new bits of smart critical warning */
+    for (index = 0; index < NVME_SMART_WARN_MAX; index++) {
+        event = 1 << index;
+        if (value & ~old_value & event)
+            nvme_smart_event(n, event);
+    }
 }
 
 static const VMStateDescription nvme_vmstate = {
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 520bc2e4cf..0adccaf5b4 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -784,6 +784,7 @@ typedef struct QEMU_PACKED NvmeSmartLog {
     uint8_t     reserved2[320];
 } NvmeSmartLog;
 
+#define NVME_SMART_WARN_MAX     6
 enum NvmeSmartWarn {
     NVME_SMART_SPARE                  = 1 << 0,
     NVME_SMART_TEMPERATURE            = 1 << 1,
-- 
2.25.1


