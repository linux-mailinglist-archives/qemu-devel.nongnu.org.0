Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D7967E94E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:18:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSj-0006Zi-LU; Fri, 27 Jan 2023 10:16:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSY-0006MW-28
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:10 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSU-0007k1-30
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:09 -0500
Received: by mail-wm1-x32e.google.com with SMTP id j17so3712022wms.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aRqhAb+yUzRoO2LrJ58otGlbRPLN5rD92kUg8QGKXw4=;
 b=lYZEeYHwrIIra3dNBZgCV34hHx3UOlynnjp5FxQko22E+CRXOsHBsWZh+E0ueUzICr
 XfuOtDFInunehgPdj42FlY0URJmVg5iptpqVH5woWrhqJNFIzypWypGjUoXwZN5MFKyJ
 Ltgc/q3IxkFoQEjICtF2kmwiNfgwj047hehYU0rAMssRO/XivwqDcIG1CFMlOHtEw9aM
 JZyRtzN55s2x+Kv306C7aoxeaJfOzasMM2L0uJk81PFgYQsHkhOj1X1wyjX542D/yT3X
 3clfnr+1uaGh/VAfVrwm92BJIrypJbdbdIma4uqgOEA3ok8CFno+WUzjM35dO37Xfy4e
 6rfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aRqhAb+yUzRoO2LrJ58otGlbRPLN5rD92kUg8QGKXw4=;
 b=voCc9W4/7UvbHpcJy+QMkzwfhvetuJjXIxxJe8BHE01T4XuhSBNpJ8NN6xYABtfLlw
 BW1IclmK4u5NHBWT5e1aj/TezUOmDebfupkBZoGmjmNmnU0yn5nroom3D7n/wDgdofuQ
 wj7y5a1noO8jHRL3SZBVWDMnszrfqxKKanP5pHpRoGTemmjHu9GhquXXdc8VHpl6MJHr
 0kXvsTpipGMB+TtNBrhzVSULgx9wQYhrnN0xt32PGl0UbFdA8Umsi/YLKhuuxIFLrz8c
 8KZdVoVlfeBu5HgGJlaG21oobHl817TzYLUdp27LdrgTJkbAoud5thzkQIuGuyT4DXwW
 LMew==
X-Gm-Message-State: AFqh2koAfSNWqBVwCPDuhGpc1rbttYiGE4lE2w8OXG5K2zzV8FzDC7Y/
 s+VR9Yw0TFHn8B3xw3m0tOQSiMAuGkcxIPUvFOIWLQ==
X-Google-Smtp-Source: AMrXdXvpII8mh+keiDYkiX2HMz2ZdhohTLNeZvUUmnYpNPwpbuEe17sZiE16QDkHSoVzHfHMzySt/A==
X-Received: by 2002:a05:600c:540c:b0:3cf:7704:50ce with SMTP id
 he12-20020a05600c540c00b003cf770450cemr38573643wmb.38.1674832564397; 
 Fri, 27 Jan 2023 07:16:04 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:16:03 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 11/16] target/arm/kvm-rme: Add Realm Personalization Value
 parameter
Date: Fri, 27 Jan 2023 15:07:24 +0000
Message-Id: <20230127150727.612594-12-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32e.google.com
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

The Realm Personalization Value (RPV) is provided by the user to
distinguish Realms that have the same initial measurement.

The user provides a 512-bit hexadecimal number.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 qapi/qom.json        |  5 ++-
 target/arm/kvm-rme.c | 72 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 87fe7c31fe..a012281628 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -862,10 +862,13 @@
 #
 # @measurement-algo: Realm measurement algorithm (default: RMM default)
 #
+# @personalization-value: Realm personalization value (default: 0)
+#
 # Since: FIXME
 ##
 { 'struct': 'RmeGuestProperties',
-  'data': { '*measurement-algo': 'str' } }
+  'data': { '*measurement-algo': 'str',
+            '*personalization-value': 'str' } }
 
 ##
 # @ObjectType:
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 3929b941ae..e974c27e5c 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -22,13 +22,14 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_PAGE_SIZE qemu_real_host_page_size()
 
-#define RME_MAX_CFG         1
+#define RME_MAX_CFG         2
 
 typedef struct RmeGuest RmeGuest;
 
 struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
     char *measurement_algo;
+    char *personalization_value;
 };
 
 struct RmeImage {
@@ -65,6 +66,45 @@ static int rme_create_rd(RmeGuest *guest, Error **errp)
     return ret;
 }
 
+static int rme_parse_rpv(uint8_t *out, const char *in, Error **errp)
+{
+    int ret;
+    size_t in_len = strlen(in);
+
+    /* Two chars per byte */
+    if (in_len > KVM_CAP_ARM_RME_RPV_SIZE * 2) {
+        error_setg(errp, "Realm Personalization Value is too large");
+        return -E2BIG;
+    }
+
+    /*
+     * Parse as big-endian hexadecimal number (most significant byte on the
+     * left), store little-endian, zero-padded on the right.
+     */
+    while (in_len) {
+        /*
+         * Do the lower nibble first to catch invalid inputs such as '2z', and
+         * to handle the last char.
+         */
+        in_len--;
+        ret = sscanf(in + in_len, "%1hhx", out);
+        if (ret != 1) {
+            error_setg(errp, "Invalid Realm Personalization Value");
+            return -EINVAL;
+        }
+        if (!in_len) {
+            break;
+        }
+        in_len--;
+        ret = sscanf(in + in_len, "%2hhx", out++);
+        if (ret != 1) {
+            error_setg(errp, "Invalid Realm Personalization Value");
+            return -EINVAL;
+        }
+    }
+    return 0;
+}
+
 static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
 {
     int ret;
@@ -87,6 +127,16 @@ static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
         }
         cfg_str = "hash algorithm";
         break;
+    case KVM_CAP_ARM_RME_CFG_RPV:
+        if (!guest->personalization_value) {
+            return 0;
+        }
+        ret = rme_parse_rpv(args.rpv, guest->personalization_value, errp);
+        if (ret) {
+            return ret;
+        }
+        cfg_str = "personalization value";
+        break;
     default:
         g_assert_not_reached();
     }
@@ -281,6 +331,21 @@ static void rme_set_measurement_algo(Object *obj, const char *value,
     guest->measurement_algo = g_strdup(value);
 }
 
+static char *rme_get_rpv(Object *obj, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+
+    return g_strdup(guest->personalization_value);
+}
+
+static void rme_set_rpv(Object *obj, const char *value, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+
+    g_free(guest->personalization_value);
+    guest->personalization_value = g_strdup(value);
+}
+
 static void rme_guest_class_init(ObjectClass *oc, void *data)
 {
     object_class_property_add_str(oc, "measurement-algo",
@@ -288,6 +353,11 @@ static void rme_guest_class_init(ObjectClass *oc, void *data)
                                   rme_set_measurement_algo);
     object_class_property_set_description(oc, "measurement-algo",
             "Realm measurement algorithm ('sha256', 'sha512')");
+
+    object_class_property_add_str(oc, "personalization-value", rme_get_rpv,
+                                  rme_set_rpv);
+    object_class_property_set_description(oc, "personalization-value",
+            "Realm personalization value (512-bit hexadecimal number)");
 }
 
 static const TypeInfo rme_guest_info = {
-- 
2.39.0


