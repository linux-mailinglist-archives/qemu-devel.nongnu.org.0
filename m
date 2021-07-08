Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8F03C163C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:45:31 +0200 (CEST)
Received: from localhost ([::1]:48438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WDS-000594-Fb
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnA-000198-QX
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:21 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:45658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn8-0008KO-P1
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:20 -0400
Received: by mail-ej1-x632.google.com with SMTP id hc16so10254123ejc.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T3FgzYC2xuHjCE/ambPxsRjySSaIwBV2XzEZCQs8ny8=;
 b=LoG8LbNuQsuk+L7eXL/isBDNTALy9DyUcExePzFZLYi/gdR2mRMf0iSJWIFREHF9w9
 r3JkHKnioixk206LBnvr5KKS9tFcGc/A2+cH7vVZQy7cjLAv+ZlAhD9NzC/qyENDQO5n
 jqxqWUUp/rnpQApKUyJo34mV0mR2Is3JJQ91E7Jbmos3+dO8ALOV2Y+rB3A6rBCOQlqo
 fB+StdoZ3v9XAg8ksEaOSkv74AaGHpIFbXHe4OxQ45v54OHKx0Vu9//JqYhOl4j1rwwK
 PlRDYtAZGSx12tXQ5RBz28zPgDKdWVe+R3knV/lYXDPNyWc+yPkzDHQu9VaAeQdajDMm
 YefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T3FgzYC2xuHjCE/ambPxsRjySSaIwBV2XzEZCQs8ny8=;
 b=Xccvff4W5vu2DdC5DldvJGP7OIA6vcZtd39w1kI1j39KXHqgyGMdFR1GUJzcGDCwR3
 wugeOG182ByhQDNmA4LqYZXLVSTkMVCyz7j4C0xdGS/ZWgWJ9qVVhGz7n6FLBJtlRClL
 fDAySXS5idZbysnHxl3HhOidVInXfvXfG6L01fixDd3OK4ST+kzREcsKVfN2a/4wf0pd
 +pgkhL9efiDT855fxvmLNDmd0b3D3OOKHi7bC41Fcfkj2E1/jkkqtVwkq+M4gTfaq3d/
 4plAV9uIWVA1xYJcabfnlmF/X5xIO+mygaUg5uO95l6Y2mkq8lUMT4LvTfH0v5g5McE2
 /9XQ==
X-Gm-Message-State: AOAM5329jKpHoxWgwD6/m4dPa9Htv86w7Gr+lje20zg8FF3DpGjRUNNY
 SmlGKFumAPqQlk6TTW7oZpiKJL+ik5k=
X-Google-Smtp-Source: ABdhPJyWmBGZ4cg5IcU1H3fdtdgeOiswPS+gPUoff1FVOi9+DPfDkRsT36Ch5cPzEnZfphzpaPskag==
X-Received: by 2002:a17:906:1dd2:: with SMTP id
 v18mr22745341ejh.322.1625757497498; 
 Thu, 08 Jul 2021 08:18:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 39/48] target/i386: Added MSRPM and IOPM size check
Date: Thu,  8 Jul 2021 17:17:39 +0200
Message-Id: <20210708151748.408754-40-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

The address of the last entry in the MSRPM and
in the IOPM must be smaller than the largest physical address.
(APM2 15.10-15.11)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Message-Id: <20210705081802.18960-2-laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/svm.h                   |  3 +++
 target/i386/tcg/sysemu/svm_helper.c | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/i386/svm.h b/target/i386/svm.h
index 5098733053..adc058dc76 100644
--- a/target/i386/svm.h
+++ b/target/i386/svm.h
@@ -137,6 +137,9 @@
 
 #define SVM_CR0_RESERVED_MASK 0xffffffff00000000U
 
+#define SVM_MSRPM_SIZE		(1ULL << 13)
+#define SVM_IOPM_SIZE		((1ULL << 13) + 1)
+
 struct QEMU_PACKED vmcb_control_area {
 	uint16_t intercept_cr_read;
 	uint16_t intercept_cr_write;
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 1c2dbc1862..fa701829e5 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -68,6 +68,7 @@ static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
 void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
+    X86CPU *cpu = env_archcpu(env);
     target_ulong addr;
     uint64_t nested_ctl;
     uint32_t event_inj;
@@ -159,6 +160,20 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     asid = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
                                                           control.asid));
 
+    uint64_t msrpm_base_pa = x86_ldq_phys(cs, env->vm_vmcb +
+                                    offsetof(struct vmcb,
+                                            control.msrpm_base_pa));
+    uint64_t iopm_base_pa = x86_ldq_phys(cs, env->vm_vmcb +
+                                 offsetof(struct vmcb, control.iopm_base_pa));
+
+    if ((msrpm_base_pa & ~0xfff) >= (1ull << cpu->phys_bits) - SVM_MSRPM_SIZE) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
+
+    if ((iopm_base_pa & ~0xfff) >= (1ull << cpu->phys_bits) - SVM_IOPM_SIZE) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
+
     env->nested_pg_mode = 0;
 
     if (!cpu_svm_has_intercept(env, SVM_EXIT_VMRUN)) {
-- 
2.31.1



