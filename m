Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E1967E950
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:19:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSW-0006JQ-4Q; Fri, 27 Jan 2023 10:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSQ-0006If-HC
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:02 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSO-0007gB-Ax
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:01 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so5633383wma.1
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jk2tLu9B17fWWaJQH7+8AxbE3Z51YlONgr1eX8RlPmA=;
 b=YR2pHhtCWTabUWyx4wGPji42cH3bijA219lxLRX76etzS5d+t1Iys0bExlCBzyX/d0
 V/sDAa3LzKBOkJFr8dc0GzozxgFKKDwTp+Jq9MW4YsPD7FJFYIBdl2za2R+yALaNr8w4
 BsQw0LIqM/xrdjyE4VM5D96LMd6ZeDoBhDzgclFGcYMe3NKcNxTwIq5QXI6UogEhcBxN
 gmhXU9Z/BKIKpNnUmmmtBUZxo0lSfTUjLrw0JWZdZbtA5wvreKW2Na4sxsfCwEnwDPgC
 lDUqRiv3XM1SWHOlb53aZMTCDdQb9U6aIJC3MnQodS+03JpcS3BNvSbBavChFX8hgSWn
 bunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jk2tLu9B17fWWaJQH7+8AxbE3Z51YlONgr1eX8RlPmA=;
 b=LsAFSUN5Hevh61BeNcPzUsQ8jvJBf1IuSxLSEJFcUhX5GRuGcBqBoM0+mYA5crK5sz
 m49oxi/wltF4f3bCr/bwev5OOUip57Vj4WI204uu8vvANPRBy+sCuQ3Kov5/uiD6dQfu
 GpWjsfSlz0ccimWXB16x5nc2WcJh+3UjD/0vK2OaBxDrqzutoRb8Z6pApAYJiSbRQl6w
 DVnmewm2JmXqLi+EqDPNhrEgG0vpCIfQx7rSd8Z2vgUosiJxjzgl1fxdUtA/Q4XK7R21
 newdjRHQPlYQC+y8eMU24ivkH3iwKgmikF3GTvptYSIJTehiH5j9i9rlf3H8xq561kbC
 NWhw==
X-Gm-Message-State: AFqh2kpKMz44n0aWkw2v0/SOJXM6tWUL5UxvJ+YQDpYnyEufUFgFNRIl
 SSBYz16ypWyupIh2lB/OYiHmlQ==
X-Google-Smtp-Source: AMrXdXuASuHeTvXSRwW9m0uVw498DxUoKkpkFbPvwHp6LvuduXtXzDXNCjIlbDCzKAer0RwL85iGeg==
X-Received: by 2002:a05:600c:a690:b0:3d5:64bf:ccb8 with SMTP id
 ip16-20020a05600ca69000b003d564bfccb8mr38582020wmb.12.1674832558525; 
 Fri, 27 Jan 2023 07:15:58 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:15:58 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 03/16] target/arm/kvm-rme: Initialize realm
Date: Fri, 27 Jan 2023 15:07:16 +0000
Message-Id: <20230127150727.612594-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x330.google.com
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

The machine code calls kvm_arm_rme_vm_type() to get the VM flag and
kvm_arm_rme_init() to issue KVM hypercalls in the required order:

* create the realm descriptor early,
* finalize the REC (vCPU) after the registers are reset,
* load images into Realm RAM (in another patch),
* activate the realm at the end, at which point the realm is sealed.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm_arm.h |  14 ++++++
 target/arm/kvm-rme.c | 101 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99017b635c..00d3df8cac 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -369,6 +369,11 @@ void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa);
 
 int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
+int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp);
+int kvm_arm_rme_vm_type(MachineState *ms);
+
+bool kvm_arm_rme_enabled(void);
+
 #else
 
 /*
@@ -443,6 +448,15 @@ static inline uint32_t kvm_arm_sve_get_vls(CPUState *cs)
     g_assert_not_reached();
 }
 
+static inline int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
+{
+    return 0;
+}
+
+static inline int kvm_arm_rme_vm_type(MachineState *ms)
+{
+    return 0;
+}
 #endif
 
 static inline const char *gic_class_name(void)
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 22aa3dc712..d7cdca1cbf 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -25,6 +25,107 @@ struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
 };
 
+static RmeGuest *cgs_to_rme(ConfidentialGuestSupport *cgs)
+{
+    if (!cgs) {
+        return NULL;
+    }
+    return (RmeGuest *)object_dynamic_cast(OBJECT(cgs), TYPE_RME_GUEST);
+}
+
+bool kvm_arm_rme_enabled(void)
+{
+    ConfidentialGuestSupport *cgs = MACHINE(qdev_get_machine())->cgs;
+
+    return !!cgs_to_rme(cgs);
+}
+
+static int rme_create_rd(RmeGuest *guest, Error **errp)
+{
+    int ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                                KVM_CAP_ARM_RME_CREATE_RD);
+
+    if (ret) {
+        error_setg_errno(errp, -ret, "RME: failed to create Realm Descriptor");
+    }
+    return ret;
+}
+
+static void rme_vm_state_change(void *opaque, bool running, RunState state)
+{
+    int ret;
+    CPUState *cs;
+
+    if (state != RUN_STATE_RUNNING) {
+        return;
+    }
+
+    /*
+     * Now that do_cpu_reset() initialized the boot PC and
+     * kvm_cpu_synchronize_post_reset() registered it, we can finalize the REC.
+     */
+    CPU_FOREACH(cs) {
+        ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_REC);
+        if (ret) {
+            error_setg_errno(&error_fatal, -ret,
+                             "RME: failed to finalize vCPU");
+        }
+    }
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                            KVM_CAP_ARM_RME_ACTIVATE_REALM);
+    if (ret) {
+        error_setg_errno(&error_fatal, -ret, "RME: failed to activate realm");
+    }
+}
+
+int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
+{
+    int ret;
+    static Error *rme_mig_blocker;
+    RmeGuest *guest = cgs_to_rme(cgs);
+
+    if (!guest) {
+        /* Either no cgs, or another confidential guest type */
+        return 0;
+    }
+
+    if (!kvm_enabled()) {
+        error_setg(errp, "KVM required for RME");
+        return -ENODEV;
+    }
+
+    if (!kvm_check_extension(kvm_state, KVM_CAP_ARM_RME)) {
+        error_setg(errp, "KVM does not support RME");
+        return -ENODEV;
+    }
+
+    ret = rme_create_rd(guest, errp);
+    if (ret) {
+        return ret;
+    }
+
+    error_setg(&rme_mig_blocker, "RME: migration is not implemented");
+    migrate_add_blocker(rme_mig_blocker, &error_fatal);
+
+    /*
+     * The realm activation is done last, when the VM starts, after all images
+     * have been loaded and all vcpus finalized.
+     */
+    qemu_add_vm_change_state_handler(rme_vm_state_change, guest);
+
+    cgs->ready = true;
+    return 0;
+}
+
+int kvm_arm_rme_vm_type(MachineState *ms)
+{
+    if (cgs_to_rme(ms->cgs)) {
+        return KVM_VM_TYPE_ARM_REALM;
+    }
+    return 0;
+}
+
 static void rme_guest_class_init(ObjectClass *oc, void *data)
 {
 }
-- 
2.39.0


