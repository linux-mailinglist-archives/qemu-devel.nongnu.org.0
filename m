Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C80567E953
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:19:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSj-0006Zk-7D; Fri, 27 Jan 2023 10:16:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSa-0006OI-8t
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSV-0007ef-Fv
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:11 -0500
Received: by mail-wm1-x335.google.com with SMTP id m15so3677728wms.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OVsmj85ALmOgtCiDtTlLrbkojrzYJRmCVUkA1PDs0hI=;
 b=pSdn30aUderHGq2l+XKDB7XFOzcA6XvNVG0TE4pbtfSq3Nv01Qf8usjCWUh1YfzZMD
 a8T4a9YeQdEeYHZpsi4AISoFNJMW24EOFuvBiHNlp1lQEIvqL3nEOiX91DsvxW8omtwq
 AxILQURVQitF6+6aYOItxcR1siQbDYtyd2Gl9aSd5xjZ6J9hKombHzZ3ZofC40LMK5t1
 JZFDsh5MiY6Mgyor4E8gBWWkIqckipAzSmVcjXWYleUalvax9bdp3YHbVoxdVMwqa0Gc
 tuQ6Upwt53NFaUGC7rdYoE0ZbJiwUvpXlIvntGkZF5GSnZSLq0h+uZsl8kvQp6YW9KIn
 BiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OVsmj85ALmOgtCiDtTlLrbkojrzYJRmCVUkA1PDs0hI=;
 b=qVQwjSdIxEGF1XQNSmS9Ln9SLu9bLrHob43a7FWy6YS/lV7+fDjthNu0ioOW7ThhSd
 0D/L/7dRwUtOIZCc8mG8B9HUZ0yJdg8795fTyDVniF692bYkDfz6a8k2v4mnO9P1JJJ1
 K3oirYdXc2EgFAzwOI9aS1lFb0F7BD9ymnQHLGN0Fn1GVwMQxM5VRSAwpqDZZZ2q4q5c
 qEKJ+xrtXwoZiJgTo8NTHA6+6xQwCuSi4M7CsfnnO8zvbiTIEP+XbJDkNNvY0Nv3qvnG
 68XYSJYNNjoNCywLklA3gWywMQKWqUYqa3Q7m1eHNminV141eeY4a0UB7VPngPhIAm0b
 4Hsg==
X-Gm-Message-State: AFqh2kq7Uk7SeW3jFZJm3LwlmrK5dEPrnJ3AEVW3SCNQ301ePiwxKtxo
 BUoLND8bJAMisT/GpHpvsJpLdA==
X-Google-Smtp-Source: AMrXdXvCyrrdBD4txmyM1581ANSCEcootkshX6S5ODTUKCWuBV6wWHsSOnDVnc556NQ4gvwBSGQDXw==
X-Received: by 2002:a05:600c:4d93:b0:3d9:efd1:214d with SMTP id
 v19-20020a05600c4d9300b003d9efd1214dmr39903164wmp.25.1674832566675; 
 Fri, 27 Jan 2023 07:16:06 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:16:06 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 14/16] target/arm/kvm-rme: Add PMU num counters parameters
Date: Fri, 27 Jan 2023 15:07:27 +0000
Message-Id: <20230127150727.612594-15-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Pass the num_cntrs parameter to Realm creation. These parameters
contribute to the initial Realm measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 qapi/qom.json        |  5 ++++-
 target/arm/kvm-rme.c | 21 ++++++++++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 86ed386f26..13c85abde9 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -870,6 +870,8 @@
 #
 # @num-watchpoints: Number of watchpoints (default: 0)
 #
+# @num-pmu-counters: Number of PMU counters (default: 0, PMU disabled)
+#
 # Since: FIXME
 ##
 { 'struct': 'RmeGuestProperties',
@@ -877,7 +879,8 @@
             '*personalization-value': 'str',
             '*sve-vector-length': 'uint32',
             '*num-breakpoints': 'uint32',
-            '*num-watchpoints': 'uint32' } }
+            '*num-watchpoints': 'uint32',
+            '*num-pmu-counters': 'uint32' } }
 
 ##
 # @ObjectType:
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 3f39f1f7ad..1baed79d46 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -24,7 +24,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_MAX_BPS         0x10
 #define RME_MAX_WPS         0x10
-#define RME_MAX_CFG         4
+#define RME_MAX_PMU_CTRS    0x20
+#define RME_MAX_CFG         5
 
 typedef struct RmeGuest RmeGuest;
 
@@ -35,6 +36,7 @@ struct RmeGuest {
     uint32_t sve_vl;
     uint32_t num_wps;
     uint32_t num_bps;
+    uint32_t num_pmu_cntrs;
 };
 
 struct RmeImage {
@@ -157,6 +159,13 @@ static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
         args.num_wrps = guest->num_wps;
         cfg_str = "debug parameters";
         break;
+    case KVM_CAP_ARM_RME_CFG_PMU:
+        if (!guest->num_pmu_cntrs) {
+            return 0;
+        }
+        args.num_pmu_cntrs = guest->num_pmu_cntrs;
+        cfg_str = "PMU";
+        break;
     default:
         g_assert_not_reached();
     }
@@ -378,6 +387,8 @@ static void rme_get_uint32(Object *obj, Visitor *v, const char *name,
         value = guest->num_bps;
     } else if (strcmp(name, "num-watchpoints") == 0) {
         value = guest->num_wps;
+    } else if (strcmp(name, "num-pmu-counters") == 0) {
+        value = guest->num_pmu_cntrs;
     } else {
         g_assert_not_reached();
     }
@@ -410,6 +421,9 @@ static void rme_set_uint32(Object *obj, Visitor *v, const char *name,
     } else if (strcmp(name, "num-watchpoints") == 0) {
         max_value = RME_MAX_WPS;
         var = &guest->num_wps;
+    } else if (strcmp(name, "num-pmu-counters") == 0) {
+        max_value = RME_MAX_PMU_CTRS;
+        var = &guest->num_pmu_cntrs;
     } else {
         g_assert_not_reached();
     }
@@ -456,6 +470,11 @@ static void rme_guest_class_init(ObjectClass *oc, void *data)
                               rme_set_uint32, NULL, NULL);
     object_class_property_set_description(oc, "num-watchpoints",
             "Number of watchpoints");
+
+    object_class_property_add(oc, "num-pmu-counters", "uint32", rme_get_uint32,
+                              rme_set_uint32, NULL, NULL);
+    object_class_property_set_description(oc, "num-pmu-counters",
+            "Number of PMU counters");
 }
 
 static const TypeInfo rme_guest_info = {
-- 
2.39.0


