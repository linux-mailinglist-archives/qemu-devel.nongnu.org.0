Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE7167E94D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:18:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSh-0006YR-6N; Fri, 27 Jan 2023 10:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSW-0006LI-7W
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:08 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQST-0007j2-Tg
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:07 -0500
Received: by mail-wm1-x335.google.com with SMTP id q8so3675901wmo.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iNHpXIOZPTIR743s4/nV/ldq35abX9mbN8ZYO5pEXmY=;
 b=Qx8daHeXglt4t84zNhaUtZ+Pu5Sx6Ro+Sm3/MapxEJq3Vawt9leb1dPkFEwE2X3lHZ
 ahCjUP3+B4UypURa5IuCE4zkccVUFGDu3zpcEJ7VfMKjf1mvi5WkcjPi0I0LkQPTXq3s
 SXF8/VJVvmyUPEVuXT6ovMT1IYrGdurQO7K7aGh/7eqjdODHg8a1iCaSXnIo0VWLhe17
 jhTL2+yNI06IvLdT3RGhDqsPmcfhNogIinOYHOft7ux2DypHo4GYDUUYdtHDSmSAAYJd
 aru6Y6BUVoJ1m4u/Uy9816Ol2HSYRCP8VA+OsLDtxd7TvrXOKMzFfb0FVCNdrOZ8LquW
 htTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iNHpXIOZPTIR743s4/nV/ldq35abX9mbN8ZYO5pEXmY=;
 b=Wb2rCSJEUfQokNtSFPawGFRmpQnWpI8x41MeXidcXp4rnlzwDPtIz33Yqp1hfiY2gq
 4Nz/9dJ7yAqpaP38rz48bmxnkYCQf9qbh+7aeypm5a9qeBGu0FPyPBt8clObml/Xiz5j
 cJfgBpgk3HE4TkwVWAsMwUi+/lg9gFeQNiYuP+XkC5XXBsM6MjDcL8GqJg09tscIPlUq
 Qnza1nXUGt47UwqlOuCJ4MSOQaFY+w9srXpUlnJlwd+KWPxHDuWo8UT0DJS1nNtoaG1h
 fSbCsWIgNxPRJJc5x4eU6pb2LBBN8CnTpW0mCw1SKjwrUThw6SkjPuIXx6EITTjTChhQ
 ITWw==
X-Gm-Message-State: AFqh2kqUiLF0dJUPdQU466N1joGQTLh5QRFLxOC2R4FKr4jP807aydF3
 xvUSiZ9ED7WAqSwFAc0klJVxgQ==
X-Google-Smtp-Source: AMrXdXv25K5niC7lUq9pW0hiOwDCbWTGzTk+UKhoOAOIMuy+Tx2ZIx2kNFqhqa8pDHSzkIpFVStcjw==
X-Received: by 2002:a05:600c:5386:b0:3cf:9844:7b11 with SMTP id
 hg6-20020a05600c538600b003cf98447b11mr41938022wmb.23.1674832562206; 
 Fri, 27 Jan 2023 07:16:02 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:16:01 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 08/16] target/arm/kvm-rme: Populate the realm with boot
 images
Date: Fri, 27 Jan 2023 15:07:21 +0000
Message-Id: <20230127150727.612594-9-jean-philippe@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Initialize the GPA space and populate it with boot images (kernel,
initrd, firmware, etc). Populating has to be done at VM start time,
because the images are loaded during reset by rom_reset()

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm_arm.h |  6 ++++
 target/arm/kvm-rme.c | 79 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index e4dc7fbb8d..cec6500603 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -371,6 +371,7 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
 int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp);
 int kvm_arm_rme_vm_type(MachineState *ms);
+void kvm_arm_rme_add_blob(hwaddr start, hwaddr src_size, hwaddr dst_size);
 
 bool kvm_arm_rme_enabled(void);
 int kvm_arm_rme_vcpu_init(CPUState *cs);
@@ -458,6 +459,11 @@ static inline int kvm_arm_rme_vm_type(MachineState *ms)
 {
     return 0;
 }
+
+static inline void kvm_arm_rme_add_blob(hwaddr start, hwaddr src_size,
+                                        hwaddr dst_size)
+{
+}
 #endif
 
 static inline const char *gic_class_name(void)
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 3833b187f9..c8c019f78a 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -9,6 +9,7 @@
 #include "exec/confidential-guest-support.h"
 #include "hw/boards.h"
 #include "hw/core/cpu.h"
+#include "hw/loader.h"
 #include "kvm_arm.h"
 #include "migration/blocker.h"
 #include "qapi/error.h"
@@ -19,12 +20,22 @@
 #define TYPE_RME_GUEST "rme-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
+#define RME_PAGE_SIZE qemu_real_host_page_size()
+
 typedef struct RmeGuest RmeGuest;
 
 struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
 };
 
+struct RmeImage {
+    hwaddr base;
+    hwaddr src_size;
+    hwaddr dst_size;
+};
+
+static GSList *rme_images;
+
 static RmeGuest *cgs_to_rme(ConfidentialGuestSupport *cgs)
 {
     if (!cgs) {
@@ -51,6 +62,38 @@ static int rme_create_rd(RmeGuest *guest, Error **errp)
     return ret;
 }
 
+static void rme_populate_realm(gpointer data, gpointer user_data)
+{
+    int ret;
+    struct RmeImage *image = data;
+    struct kvm_cap_arm_rme_init_ipa_args init_args = {
+        .init_ipa_base = image->base,
+        .init_ipa_size = image->dst_size,
+    };
+    struct kvm_cap_arm_rme_populate_realm_args populate_args = {
+        .populate_ipa_base = image->base,
+        .populate_ipa_size = image->src_size,
+    };
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                            KVM_CAP_ARM_RME_INIT_IPA_REALM,
+                            (intptr_t)&init_args);
+    if (ret) {
+        error_setg_errno(&error_fatal, -ret,
+                         "RME: failed to initialize GPA range (0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
+                         image->base, image->dst_size);
+    }
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                            KVM_CAP_ARM_RME_POPULATE_REALM,
+                            (intptr_t)&populate_args);
+    if (ret) {
+        error_setg_errno(&error_fatal, -ret,
+                         "RME: failed to populate realm (0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
+                         image->base, image->src_size);
+    }
+}
+
 static void rme_vm_state_change(void *opaque, bool running, RunState state)
 {
     int ret;
@@ -72,6 +115,9 @@ static void rme_vm_state_change(void *opaque, bool running, RunState state)
         }
     }
 
+    g_slist_foreach(rme_images, rme_populate_realm, NULL);
+    g_slist_free_full(g_steal_pointer(&rme_images), g_free);
+
     ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
                             KVM_CAP_ARM_RME_ACTIVATE_REALM);
     if (ret) {
@@ -118,6 +164,39 @@ int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
     return 0;
 }
 
+/*
+ * kvm_arm_rme_add_blob - Initialize the Realm IPA range and set up the image.
+ *
+ * @src_size is the number of bytes of the source image, to be populated into
+ *   Realm memory.
+ * @dst_size is the effective image size, which may be larger than @src_size.
+ *   For a kernel @dst_size may include zero-initialized regions such as the BSS
+ *   and initial page directory.
+ */
+void kvm_arm_rme_add_blob(hwaddr base, hwaddr src_size, hwaddr dst_size)
+{
+    struct RmeImage *image;
+
+    if (!kvm_arm_rme_enabled()) {
+        return;
+    }
+
+    base = QEMU_ALIGN_DOWN(base, RME_PAGE_SIZE);
+    src_size = QEMU_ALIGN_UP(src_size, RME_PAGE_SIZE);
+    dst_size = QEMU_ALIGN_UP(dst_size, RME_PAGE_SIZE);
+
+    image = g_malloc0(sizeof(*image));
+    image->base = base;
+    image->src_size = src_size;
+    image->dst_size = dst_size;
+
+    /*
+     * The ROM loader will only load the images during reset, so postpone the
+     * populate call until VM start.
+     */
+    rme_images = g_slist_prepend(rme_images, image);
+}
+
 int kvm_arm_rme_vcpu_init(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.39.0


