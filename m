Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B3B67E947
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:18:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQT5-0006b0-TU; Fri, 27 Jan 2023 10:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSY-0006MV-1q
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:10 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSU-0007fC-3i
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so5643991wmb.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/yCr2nbr6Ow8T/NrICHyB/xhB72u1bVIcflvvLmkcxM=;
 b=CNt6aTHjGeoDde9QzjkVmzl1CKstQnOSjr0QOvjCKdOzGl8r2NY7C+OMzvqcPJBsui
 a/xTBYuqto0qtHdsw0bVaJPHV+3d45MrCzw9LA2WvSjJksydPpUVEUqAnxhhPGmsFlzE
 vyw0kj9UDuA5CDEMoWvvAufC3aqMgaV/yaPdx/FpJyIg2elCKL60vFcM9T/cF3G129Mu
 0ngFiigLk9WO7q4n4ebEQTk2gmTfzT0IP5IHpXS3J/B1OdqgDpj33XvaRBefKfmvP/3p
 4J3x0AU5o1MEr8K9Sc7ecgQzYhpbpsZQgSSVvAbtNyKMf53y3vT9mYSqCC9IJOfBd/3C
 PEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/yCr2nbr6Ow8T/NrICHyB/xhB72u1bVIcflvvLmkcxM=;
 b=BXSt12jQg8cJnFBPP54Xx8sVn7zy007mWeG4BTCQKHCRQchcpQp3ujierdj/4Iht9/
 0y9xdXaKC3Z+PNZ8v/1hRM8ixReIf52uIGF0Yp1IIP9l3XXTUlAv8nbL80MXpvyk5aaN
 tJCPMguIj5/TxynjwwunAzWkzDxPPuRZJW4hO15TUOcNYjWqtHpssBxdC7xDja0g/teb
 r9iYNidpTuEXCducroPg//Z/AYqmbGSYSf7NIKBuJ9cP9dFT/+WvD72rZpNjiqtmFIx7
 YNnDgT+w3fnW54DNMrJPz7e491OiJhvAlh3i2Exp9f1XOOKwvDXMuTwsaLYiquXfs+Ag
 vKiw==
X-Gm-Message-State: AFqh2koL6yT8eOTV4d1DHWgEexlLocjhOdOfQiEnM65Xl7Yu4ooX/iNI
 yumfH/y3nrmSQ/uAnYDqlENfyw==
X-Google-Smtp-Source: AMrXdXv3QtlxQ+gf+hUERFL5yHKdS6vvVDRQi+5gQuQEKsme6aTFAvNeh2NA8GVZA57aOwFXs3PqPA==
X-Received: by 2002:a05:600c:1e08:b0:3da:f443:9f0f with SMTP id
 ay8-20020a05600c1e0800b003daf4439f0fmr41032630wmb.18.1674832565225; 
 Fri, 27 Jan 2023 07:16:05 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:16:04 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 12/16] target/arm/kvm-rme: Add Realm SVE vector length
Date: Fri, 27 Jan 2023 15:07:25 +0000
Message-Id: <20230127150727.612594-13-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32a.google.com
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

The Realm configuration takes a SVE enable and vector length parameter.

We cannot reuse the -cpu SVE parameters for this because that
information is needed at Realm Descriptor creation which must happen
before VCPU creation.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 qapi/qom.json        |  5 +++-
 target/arm/kvm-rme.c | 68 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index a012281628..94ecb87f6f 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -864,11 +864,14 @@
 #
 # @personalization-value: Realm personalization value (default: 0)
 #
+# @sve-vector-length: SVE vector length (default: 0, SVE disabled)
+#
 # Since: FIXME
 ##
 { 'struct': 'RmeGuestProperties',
   'data': { '*measurement-algo': 'str',
-            '*personalization-value': 'str' } }
+            '*personalization-value': 'str',
+            '*sve-vector-length': 'uint32' } }
 
 ##
 # @ObjectType:
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index e974c27e5c..0b2153a45c 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -22,7 +22,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_PAGE_SIZE qemu_real_host_page_size()
 
-#define RME_MAX_CFG         2
+#define RME_MAX_CFG         3
 
 typedef struct RmeGuest RmeGuest;
 
@@ -30,6 +30,7 @@ struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
     char *measurement_algo;
     char *personalization_value;
+    uint32_t sve_vl;
 };
 
 struct RmeImage {
@@ -137,6 +138,13 @@ static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
         }
         cfg_str = "personalization value";
         break;
+    case KVM_CAP_ARM_RME_CFG_SVE:
+        if (!guest->sve_vl) {
+            return 0;
+        }
+        args.sve_vq = guest->sve_vl / 128;
+        cfg_str = "SVE";
+        break;
     default:
         g_assert_not_reached();
     }
@@ -346,6 +354,52 @@ static void rme_set_rpv(Object *obj, const char *value, Error **errp)
     guest->personalization_value = g_strdup(value);
 }
 
+static void rme_get_uint32(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+    uint32_t value;
+
+    if (strcmp(name, "sve-vector-length") == 0) {
+        value = guest->sve_vl;
+    } else {
+        g_assert_not_reached();
+    }
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void rme_set_uint32(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+    uint32_t max_value;
+    uint32_t value;
+    uint32_t *var;
+
+    if (!visit_type_uint32(v, name, &value, errp)) {
+        return;
+    }
+
+    if (strcmp(name, "sve-vector-length") == 0) {
+        max_value = ARM_MAX_VQ * 128;
+        var = &guest->sve_vl;
+        if (value & 0x7f) {
+            error_setg(errp, "invalid SVE vector length %"PRIu32, value);
+            return;
+        }
+    } else {
+        g_assert_not_reached();
+    }
+
+    if (value >= max_value) {
+        error_setg(errp, "invalid %s length %"PRIu32, name, value);
+        return;
+    }
+
+    *var = value;
+}
+
 static void rme_guest_class_init(ObjectClass *oc, void *data)
 {
     object_class_property_add_str(oc, "measurement-algo",
@@ -358,6 +412,18 @@ static void rme_guest_class_init(ObjectClass *oc, void *data)
                                   rme_set_rpv);
     object_class_property_set_description(oc, "personalization-value",
             "Realm personalization value (512-bit hexadecimal number)");
+
+    /*
+     * This is not ideal. Normally SVE parameters are given to -cpu, but the
+     * realm parameters are needed much earlier than CPU initialization. We also
+     * don't have a way to discover what is supported at the moment, the idea is
+     * that the user knows exactly what hardware it is running on because these
+     * parameters are part of the measurement and play in the attestation.
+     */
+    object_class_property_add(oc, "sve-vector-length", "uint32", rme_get_uint32,
+                              rme_set_uint32, NULL, NULL);
+    object_class_property_set_description(oc, "sve-vector-length",
+            "SVE vector length. 0 disables SVE (the default)");
 }
 
 static const TypeInfo rme_guest_info = {
-- 
2.39.0


