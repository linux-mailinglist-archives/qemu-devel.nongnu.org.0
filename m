Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0C23BB8DA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:20:35 +0200 (CEST)
Received: from localhost ([::1]:37810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0JqD-0008Jq-SE
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m0Jo2-0006LZ-7t
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:18:18 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m0Jnx-0005a2-7n
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:18:17 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t15so17618829wry.11
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jc5fRlM98XeH9zkOM8OwG3gCInHFoUKjTnZ/ZTtg08s=;
 b=CY2TFHGaKIYuvky/Hjo+BhsWWoLUBXjHW5LHoNBOSTINEEF3HzjywrRZzSQ8BPZgFM
 HQrtphK2rPff8YyzH4iH3m2rj9TuL0Pd1mIToAm1BOS9iCmPzzyzawsenfwlN3SDIlzq
 RZgKL7tVxzYUOwmRei4+vKtanW1H6svh4YeGwJj4IH4q74S1o3DvX18d6AwXGqKD5/o2
 lhLJBgZkIvFl2T0GfkeM0PMzDRwqQoXAiNgmaS6W01zXDKKuUEOomhGfub3Q7HIQN+E9
 8rKBfuk4yr/LK8PEXP82MBgV51+fipHrWdwLD70v3AnpE0z7tFydGZ2ulq3rE+FTmDCa
 x64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jc5fRlM98XeH9zkOM8OwG3gCInHFoUKjTnZ/ZTtg08s=;
 b=l+VqBmxh2sU4eZTLNKu47pYlJlbtUQKpDYS8TaSN58RPx8DTEx9MqMJKDuMGa84F2f
 m67mZxC84/O58DxaxHYKXJ99PBQDKScTr0q6y+ir/H33S0Fphj99FYVzYOiOvqhvRJgQ
 dIbDF5sn3yBvXzNetvT29t2FQNLENlcN7zGfgWjZuW6anoprDIFhShgpMl1lsp+aro8f
 xXNxOJOHUrxGhZVEh3jyg059dVG5qq4pGWt5DsewOpXLNcqzC+u6CNdpDxMbGDHx752t
 BRvrpgYCa/Dvs75FkcCo+279Y9dgachcoVkvSeW2uyVLiayvmMbOrU5bqz+tDVBaNGmV
 EIXg==
X-Gm-Message-State: AOAM5320+eyVV2i5vEPZHvD3WoqO863Ya3xJArK6UTfDYFez1TuCOa6R
 QAkyHUpGRmPDhBjqxbEl/YjEjhB+g6mrGg==
X-Google-Smtp-Source: ABdhPJzgNSw7BFxzDNVwAlGSY8B94KxkaSwZ6hKteD2ENThmw9dalU5G3aJGrvmF3WFIGz9wXGRzFw==
X-Received: by 2002:adf:d212:: with SMTP id j18mr14363300wrh.150.1625473091558; 
 Mon, 05 Jul 2021 01:18:11 -0700 (PDT)
Received: from localhost.localdomain ([37.160.151.142])
 by smtp.gmail.com with ESMTPSA id n5sm3662014wri.31.2021.07.05.01.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 01:18:11 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/i386: Added MSRPM and IOPM size check
Date: Mon,  5 Jul 2021 10:17:59 +0200
Message-Id: <20210705081802.18960-2-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210705081802.18960-1-laramglazier@gmail.com>
References: <20210705081802.18960-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=laramglazier@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The address of the last entry in the MSRPM and
in the IOPM must be smaller than the largest physical address.
(APM2 15.10-15.11)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
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
2.25.1


