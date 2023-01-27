Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0551467E952
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:19:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSj-0006Zo-LJ; Fri, 27 Jan 2023 10:16:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSX-0006Ld-5V
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:09 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSU-0007fg-1L
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:08 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso5622205wmc.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bbNu19WMzaLjGCFMUQxiaofERC3jNZB3M13lh/rHhCc=;
 b=vDHzIbbuzPY93SJqQ9+D1zj6THNjFE1vI5VlQp8/B6ZdwPY4v/VTMav34LqWWspTT7
 8zc9ZQ/wsV5LG5aUByL4MPYDTDsAxe/hw5PIrArUWs0USenyEQ2hKpToh4G27Xm3yf5a
 /6C+7aWL0ndySonLO9cOxjTBY98cK1mMEhQRbynORjLyNV4umS1I2aIpslp20SgUFGOB
 t9Ks65xBBgiR2VRjwPTHNmEkUVtrKmtAUm+jkAM4kU+HQAGhZIY8ETk+YAWFzwGOtre1
 93j28ER1xvvWFXI87o3oEmI28qAf0f2aeI473xtOhxccc80jyD10y5QibYZe37rmrcg5
 8gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bbNu19WMzaLjGCFMUQxiaofERC3jNZB3M13lh/rHhCc=;
 b=wBLCCvqij2wmkrbNaNBzGrWM7rGr2LEYxkPZmOvW4C/tAhk2YpKGxRt8vT33P3iMKu
 CWAXICO5dsdOal68Y4U5UlEBbIb9XTW+QaIf+IcBb/Ci8Zy/8uue2HCWDwTmO+g0vsxK
 mcyXAR3HBsKll6pMnsagTzMIyMtaX/FgNXQkw4r7OiB7Wme2tOkfefLvVtYnODgNQmlG
 r/SupFjZKOKUMWBavHsJy5hb4WE09Yl2tyccv9wnI56R/GbFYEpLNHFkM/15tFkkITj6
 eeGQ5P7mVUkmbENzBzlTZh1VwFFGJ3/KR+Rmgt/iz7ytfAUaHkwQz8InE51VHVAv+if0
 8H3w==
X-Gm-Message-State: AFqh2ko+2OSo4vbe07vYITUhLHySSaM63nbfH1j/KEFDcLXjnI2nyogv
 3f98TwVYcISkwaBSrNZbpDObLdZSeEWyn4NRf+0aBQ==
X-Google-Smtp-Source: AMrXdXuioK3g8AxkNhRgcCktwITCMg5N3XY8tLCe+7NRJIyk+QjMeNA3taCtZTXPnYGDCzaXt6hLXA==
X-Received: by 2002:a05:600c:43d3:b0:3da:fbcd:cdd2 with SMTP id
 f19-20020a05600c43d300b003dafbcdcdd2mr40652021wmn.9.1674832563598; 
 Fri, 27 Jan 2023 07:16:03 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:16:03 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 10/16] target/arm/kvm-rme: Add measurement algorithm
 property
Date: Fri, 27 Jan 2023 15:07:23 +0000
Message-Id: <20230127150727.612594-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32d.google.com
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

This option selects which measurement algorithm to use for attestation.
Supported values are sha256 and sha512.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 qapi/qom.json        | 14 ++++++++-
 target/arm/kvm-rme.c | 71 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 7ca27bb86c..87fe7c31fe 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -855,6 +855,17 @@
   'data': { '*cpu-affinity': ['uint16'],
             '*node-affinity': ['uint16'] } }
 
+##
+# @RmeGuestProperties:
+#
+# Properties for rme-guest objects.
+#
+# @measurement-algo: Realm measurement algorithm (default: RMM default)
+#
+# Since: FIXME
+##
+{ 'struct': 'RmeGuestProperties',
+  'data': { '*measurement-algo': 'str' } }
 
 ##
 # @ObjectType:
@@ -985,7 +996,8 @@
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
       'x-remote-object':            'RemoteObjectProperties',
-      'x-vfio-user-server':         'VfioUserServerProperties'
+      'x-vfio-user-server':         'VfioUserServerProperties',
+      'rme-guest':                  'RmeGuestProperties'
   } }
 
 ##
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index c8c019f78a..3929b941ae 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -22,10 +22,13 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_PAGE_SIZE qemu_real_host_page_size()
 
+#define RME_MAX_CFG         1
+
 typedef struct RmeGuest RmeGuest;
 
 struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
+    char *measurement_algo;
 };
 
 struct RmeImage {
@@ -62,6 +65,40 @@ static int rme_create_rd(RmeGuest *guest, Error **errp)
     return ret;
 }
 
+static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
+{
+    int ret;
+    const char *cfg_str;
+    struct kvm_cap_arm_rme_config_item args = {
+        .cfg = cfg,
+    };
+
+    switch (cfg) {
+    case KVM_CAP_ARM_RME_CFG_HASH_ALGO:
+        if (!guest->measurement_algo) {
+            return 0;
+        }
+        if (!strcmp(guest->measurement_algo, "sha256")) {
+            args.hash_algo = KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA256;
+        } else if (!strcmp(guest->measurement_algo, "sha512")) {
+            args.hash_algo = KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA512;
+        } else {
+            g_assert_not_reached();
+        }
+        cfg_str = "hash algorithm";
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                            KVM_CAP_ARM_RME_CONFIG_REALM, (intptr_t)&args);
+    if (ret) {
+        error_setg_errno(errp, -ret, "RME: failed to configure %s", cfg_str);
+    }
+    return ret;
+}
+
 static void rme_populate_realm(gpointer data, gpointer user_data)
 {
     int ret;
@@ -128,6 +165,7 @@ static void rme_vm_state_change(void *opaque, bool running, RunState state)
 int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
     int ret;
+    int cfg;
     static Error *rme_mig_blocker;
     RmeGuest *guest = cgs_to_rme(cgs);
 
@@ -146,6 +184,13 @@ int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
         return -ENODEV;
     }
 
+    for (cfg = 0; cfg < RME_MAX_CFG; cfg++) {
+        ret = rme_configure_one(guest, cfg, errp);
+        if (ret) {
+            return ret;
+        }
+    }
+
     ret = rme_create_rd(guest, errp);
     if (ret) {
         return ret;
@@ -215,8 +260,34 @@ int kvm_arm_rme_vm_type(MachineState *ms)
     return 0;
 }
 
+static char *rme_get_measurement_algo(Object *obj, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+
+    return g_strdup(guest->measurement_algo);
+}
+
+static void rme_set_measurement_algo(Object *obj, const char *value,
+                                     Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+
+    if (strncmp(value, "sha256", 6) &&
+        strncmp(value, "sha512", 6)) {
+        error_setg(errp, "invalid Realm measurement algorithm '%s'", value);
+        return;
+    }
+    g_free(guest->measurement_algo);
+    guest->measurement_algo = g_strdup(value);
+}
+
 static void rme_guest_class_init(ObjectClass *oc, void *data)
 {
+    object_class_property_add_str(oc, "measurement-algo",
+                                  rme_get_measurement_algo,
+                                  rme_set_measurement_algo);
+    object_class_property_set_description(oc, "measurement-algo",
+            "Realm measurement algorithm ('sha256', 'sha512')");
 }
 
 static const TypeInfo rme_guest_info = {
-- 
2.39.0


