Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962C467E93F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:17:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSh-0006Yx-L1; Fri, 27 Jan 2023 10:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSZ-0006Nn-Ew
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:11 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSU-0007fB-UP
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:10 -0500
Received: by mail-wm1-x333.google.com with SMTP id l8so3681534wms.3
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V2C8ym8is1CPYbe6HBHqeDtoLk1afh8VUgAOi79KyjA=;
 b=s7mwAN6iwR1Yf/RhvBpaZy7wHKwUfdOmrONVLHMtlMQ9jpePl/3OubN4tVZkAB2ntH
 UmqzkbSf6+HRcCSwxA8Eh1Yfkrx65L11zu0AzegLZ06x/A29sSkCsA+2kHgVCoJPmiqg
 AANnok2MzEDg134sXcVtijtQyp/Tn28+oj/wlqNbwHJMc5v4Oe7VETLN77Azfo42ss+0
 ENVO+dG6ZGtiEun3UaB6clmmQF+DYu814B1D2NlfOvXDKLABSKoV7Zeyrp/UTaCJ6wFF
 9JllU7HlhyCYry7q39UkzwfdTmlUspKXhZJpys9/l9gDhhEylzPYeCD/QkD6SRV0LYCW
 28aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V2C8ym8is1CPYbe6HBHqeDtoLk1afh8VUgAOi79KyjA=;
 b=GW54vZNTsf45QGoeWY3qH7bV+KLBmCbwTeNu2JIYV99WxPmWSziBH4rjrbIB13P/CK
 gQsoWupAUJKmeg1A427rU9TKQYHlUj10iZ+qHPkJVGZoOR6/4c6g3ah5TEtUrK0aRG1W
 wmKDtcRFYDbFBGTkDWZmB4axK/y3/NeBErBWO8eFxKjr6QJezXGlYmZW6n+I2RAnXoyM
 tX77BKIsyP9OUh+MdKRy9yAXWHAzqBuoCV/VEHLbKReY0iR9NpTtF+4ZdeDT4dHeCcOH
 JYs5VJvMzwMenL4EDQ70ktN0199L8x8dOBAWwId8tjV310IHz4hXAi6Vf6D0uFZgCl3N
 ktVg==
X-Gm-Message-State: AO0yUKVmBuzUW1ShjT6cacJenqbZZfQ1EH9JidWtpOHM3ghrBer9zSW8
 dZ4Lw7XNEt/8B0nlKEmSB6IYSirdl2Qi9Sjp6nowwg==
X-Google-Smtp-Source: AK7set/q19d4BBJOiVPaxHB2Y4QlBcQjF6fwBnxYMemjW0hkO6/cTM6gtypfWGJ7NyKxDqXtET9E8A==
X-Received: by 2002:a05:600c:1551:b0:3dc:18de:b221 with SMTP id
 f17-20020a05600c155100b003dc18deb221mr12053778wmg.21.1674832565936; 
 Fri, 27 Jan 2023 07:16:05 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:16:05 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 13/16] target/arm/kvm-rme: Add breakpoints and watchpoints
 parameters
Date: Fri, 27 Jan 2023 15:07:26 +0000
Message-Id: <20230127150727.612594-14-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x333.google.com
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

Pass the num_bps and num_wps parameters to Realm creation. These
parameters contribute to the initial Realm measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 qapi/qom.json        |  8 +++++++-
 target/arm/kvm-rme.c | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 94ecb87f6f..86ed386f26 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -866,12 +866,18 @@
 #
 # @sve-vector-length: SVE vector length (default: 0, SVE disabled)
 #
+# @num-breakpoints: Number of breakpoints (default: 0)
+#
+# @num-watchpoints: Number of watchpoints (default: 0)
+#
 # Since: FIXME
 ##
 { 'struct': 'RmeGuestProperties',
   'data': { '*measurement-algo': 'str',
             '*personalization-value': 'str',
-            '*sve-vector-length': 'uint32' } }
+            '*sve-vector-length': 'uint32',
+            '*num-breakpoints': 'uint32',
+            '*num-watchpoints': 'uint32' } }
 
 ##
 # @ObjectType:
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 0b2153a45c..3f39f1f7ad 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -22,7 +22,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_PAGE_SIZE qemu_real_host_page_size()
 
-#define RME_MAX_CFG         3
+#define RME_MAX_BPS         0x10
+#define RME_MAX_WPS         0x10
+#define RME_MAX_CFG         4
 
 typedef struct RmeGuest RmeGuest;
 
@@ -31,6 +33,8 @@ struct RmeGuest {
     char *measurement_algo;
     char *personalization_value;
     uint32_t sve_vl;
+    uint32_t num_wps;
+    uint32_t num_bps;
 };
 
 struct RmeImage {
@@ -145,6 +149,14 @@ static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
         args.sve_vq = guest->sve_vl / 128;
         cfg_str = "SVE";
         break;
+    case KVM_CAP_ARM_RME_CFG_DBG:
+        if (!guest->num_bps && !guest->num_wps) {
+            return 0;
+        }
+        args.num_brps = guest->num_bps;
+        args.num_wrps = guest->num_wps;
+        cfg_str = "debug parameters";
+        break;
     default:
         g_assert_not_reached();
     }
@@ -362,6 +374,10 @@ static void rme_get_uint32(Object *obj, Visitor *v, const char *name,
 
     if (strcmp(name, "sve-vector-length") == 0) {
         value = guest->sve_vl;
+    } else if (strcmp(name, "num-breakpoints") == 0) {
+        value = guest->num_bps;
+    } else if (strcmp(name, "num-watchpoints") == 0) {
+        value = guest->num_wps;
     } else {
         g_assert_not_reached();
     }
@@ -388,6 +404,12 @@ static void rme_set_uint32(Object *obj, Visitor *v, const char *name,
             error_setg(errp, "invalid SVE vector length %"PRIu32, value);
             return;
         }
+    } else if (strcmp(name, "num-breakpoints") == 0) {
+        max_value = RME_MAX_BPS;
+        var = &guest->num_bps;
+    } else if (strcmp(name, "num-watchpoints") == 0) {
+        max_value = RME_MAX_WPS;
+        var = &guest->num_wps;
     } else {
         g_assert_not_reached();
     }
@@ -424,6 +446,16 @@ static void rme_guest_class_init(ObjectClass *oc, void *data)
                               rme_set_uint32, NULL, NULL);
     object_class_property_set_description(oc, "sve-vector-length",
             "SVE vector length. 0 disables SVE (the default)");
+
+    object_class_property_add(oc, "num-breakpoints", "uint32", rme_get_uint32,
+                              rme_set_uint32, NULL, NULL);
+    object_class_property_set_description(oc, "num-breakpoints",
+            "Number of breakpoints");
+
+    object_class_property_add(oc, "num-watchpoints", "uint32", rme_get_uint32,
+                              rme_set_uint32, NULL, NULL);
+    object_class_property_set_description(oc, "num-watchpoints",
+            "Number of watchpoints");
 }
 
 static const TypeInfo rme_guest_info = {
-- 
2.39.0


