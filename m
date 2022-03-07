Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B5E4D0673
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:24:28 +0100 (CET)
Received: from localhost ([::1]:34904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRI1z-0008Sa-Uz
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:24:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuh-00013S-N2
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:55 -0500
Received: from [2a00:1450:4864:20::529] (port=43874
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005Mg-4v
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:55 -0500
Received: by mail-ed1-x529.google.com with SMTP id f8so21137164edf.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5dbaBdYAMjhrYbiwidflPhtFdmpOVM1ditmWCxx0uo=;
 b=SiSxul6XasWX2ziARjKwzxPd0DsfCqMhPX935iuIMhFWnu9WUkkpxySr41w4nkzZIp
 0Os9UISV/nGe6Jqx5zPujm8Xo9qkrfmsAjVUd//kQWCUT2RYvDr44L7LnjKffXp8L5fy
 FWCi6cfO3NnGY0qzdWC35xSIaSYTED2xIMMQiQ0OnPBEnqeEzqFVSgnP0YMRgfj7hQkK
 SAxkKawVF7bSd2f5Hfamhqn+HkldilDTuv29/eStPO0ylgsfizcp9OjgaLvneWbhTjsb
 Woxxsgf7nN/5rXTy8m6DHRpAI+QgWuDeOxrcMZkhbW85JmpzzdTGSEELAfZlfVRQsCHO
 cJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M5dbaBdYAMjhrYbiwidflPhtFdmpOVM1ditmWCxx0uo=;
 b=Ca/Anrsfr6H/s0YKtqg1vLqcmGtFxtD0dNcWvh1IL39ePE1eSIh99ra+cWIgQGwNss
 l/0IpN59Mg5GBaDm/hdigIfBK4Sy7nqZBYYRzlJ/MJCkK2ZEsQfMeEFRMxFeUOkgr6nc
 ROgVu6zXnIf/YKfSKIGQoykKQ7s8+VRlLmqVi5ty8agqhQAbW5V06A5AM1LnOGbD+NYs
 ekhi+2qw2wnB1zRxIgR8/y0Co63zIKetPZBN9RkbPdeIpZO8lcvinFGzroy++3qefBFm
 vWe2MC1fNk6Is5iNDalUcuK5RVQuzFZwFglFVyeKWL7U+Ywd0hmlPeZ7rBlbmTLCxrum
 Qwuw==
X-Gm-Message-State: AOAM530wwbAG2lYxUHK5GpY+StrEQthxOMkYVMR4Q08GEQjUObtrQeoH
 BefK4HzHli4HOgVN0FNBSeDb53KcsPM=
X-Google-Smtp-Source: ABdhPJzYo2PvMFqn9Il0OdymtvoBnmvN4ErK12UiQope5a7PArsLCEtWr5gg0iLp+k0S2b1t0hovfA==
X-Received: by 2002:a05:6402:1941:b0:413:2b5f:9074 with SMTP id
 f1-20020a056402194100b004132b5f9074mr12253622edz.414.1646676997137; 
 Mon, 07 Mar 2022 10:16:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/23] whpx: Fixed incorrect CR8/TPR synchronization
Date: Mon,  7 Mar 2022 19:16:12 +0100
Message-Id: <20220307181633.596898-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Ivan Shcherbakov <ivan@sysprogs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ivan Shcherbakov <ivan@sysprogs.com>

This fixes the following error triggered when stopping and resuming a 64-bit
Linux kernel via gdb:

qemu-system-x86_64.exe: WHPX: Failed to set virtual processor context, hr=c0350005

The previous logic for synchronizing the values did not take into account
that the lower 4 bits of the CR8 register, containing the priority level,
mapped to bits 7:4 of the APIC.TPR register (see section 10.8.6.1 of
Volume 3 of Intel 64 and IA-32 Architectures Software Developer's Manual).
The caused WHvSetVirtualProcessorRegisters() to fail with an error,
effectively preventing GDB from changing the guest context.

Signed-off-by: Ivan Shcherbakov <ivan@sysprogs.com>
Message-Id: <010b01d82874$bb4ef160$31ecd420$@sysprogs.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/whpx/whpx-all.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index edd4fafbdf..63203730bc 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -256,6 +256,21 @@ static int whpx_set_tsc(CPUState *cpu)
     return 0;
 }
 
+/*
+ * The CR8 register in the CPU is mapped to the TPR register of the APIC,
+ * however, they use a slightly different encoding. Specifically:
+ *
+ *     APIC.TPR[bits 7:4] = CR8[bits 3:0]
+ *
+ * This mechanism is described in section 10.8.6.1 of Volume 3 of Intel 64
+ * and IA-32 Architectures Software Developer's Manual.
+ */
+
+static uint64_t whpx_apic_tpr_to_cr8(uint64_t tpr)
+{
+    return tpr >> 4;
+}
+
 static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
@@ -284,7 +299,7 @@ static void whpx_set_registers(CPUState *cpu, int level)
     v86 = (env->eflags & VM_MASK);
     r86 = !(env->cr[0] & CR0_PE_MASK);
 
-    vcpu->tpr = cpu_get_apic_tpr(x86_cpu->apic_state);
+    vcpu->tpr = whpx_apic_tpr_to_cr8(cpu_get_apic_tpr(x86_cpu->apic_state));
     vcpu->apic_base = cpu_get_apic_base(x86_cpu->apic_state);
 
     idx = 0;
@@ -475,6 +490,17 @@ static void whpx_get_registers(CPUState *cpu)
                      hr);
     }
 
+    if (whpx_apic_in_platform()) {
+        /*
+         * Fetch the TPR value from the emulated APIC. It may get overwritten
+         * below with the value from CR8 returned by
+         * WHvGetVirtualProcessorRegisters().
+         */
+        whpx_apic_get(x86_cpu->apic_state);
+        vcpu->tpr = whpx_apic_tpr_to_cr8(
+            cpu_get_apic_tpr(x86_cpu->apic_state));
+    }
+
     idx = 0;
 
     /* Indexes for first 16 registers match between HV and QEMU definitions */
-- 
2.34.1



