Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1672E4D166A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:42:10 +0100 (CET)
Received: from localhost ([::1]:42526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYED-0000Ez-6C
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:42:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7C-0007f7-8q
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:34:54 -0500
Received: from [2a00:1450:4864:20::62a] (port=46623
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7A-0005mD-NR
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:34:53 -0500
Received: by mail-ej1-x62a.google.com with SMTP id qx21so38495898ejb.13
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hhFBWbXilePF1ZwGI19W9ujjRyVX0rQ2f1lQWvaRXiE=;
 b=OJ4ahNcuy8PvSED5GFfGRHKzl5MsJbslPAxUm79v1qNUIIvq9NtfaXzncnzWiQ/mPr
 QYELR7UePX+G2bj+C+n3FPMkH8vd/tEpOgMOzmqK0S5F/bHjN45F6mDghTasvyRUp/1Z
 KtgJCbY/DQPQ3BM3y5v4JLt61AbPUiiDwGuHaj997g9Jh3ifW6aDoi9Q8JPnHZdCAOUE
 MkXTs6mvdfAUdMDRtK9D0C6Vs8HjKQ3w84Nf4j5poU3238qjZ6JNjBU/jKDmQfruoFPc
 upyF3uhKW8DjTO35mtVkk8zt2veaJ86MgnFCLRnF/VtCd6oBFYLLxOVG6rgCQNCjhSHj
 2L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hhFBWbXilePF1ZwGI19W9ujjRyVX0rQ2f1lQWvaRXiE=;
 b=GUxSm6p66Cm0vYbq3P5BQZVyQeJ+ASYEry2Zeo+SHdZT9MvJPHm9qzz8JM8tPeoZN8
 VcHAI6NX9G2m/c2b4Oqnjv5s/CA93z75kbpnV4yX3He+PE/+PdkUoDPOd8pO5fGXQyok
 ovNu9Tca1sEckvlZg39qNYRgkk+NrmTBVjx0Swq2otCl7HOS4wa3p521Rred5Rwb5fHw
 o/G2yaCGH6TPKfTS7UJ698qN+ofGRjcQNQi9juWsfyTd6nIWycGgJ1w7VFPIejo4P9LM
 igI83+rgDpx9eYdkPmgqGUjiV+38WwKsRlWL3xqVl2n7DWPWlXa7FCudM+chaSCkUQ/n
 d5MA==
X-Gm-Message-State: AOAM532ivAlI1iUhrYqAKypqnB1+qdKWXyZsCxjsAv/uOkEe0SBz1s/l
 xazhS9OGZuJfZFEY4JBiYGp9bFRQiz8=
X-Google-Smtp-Source: ABdhPJyPXCxre4Jknp6mqX2//9zPED+Jl6BZst133uRgWSO8jLzAQ5+qEzi6zIC3Y5vbMi0hCadEcA==
X-Received: by 2002:a17:907:2ce5:b0:6db:63f:9c28 with SMTP id
 hz5-20020a1709072ce500b006db063f9c28mr11595791ejc.629.1646739291342; 
 Tue, 08 Mar 2022 03:34:51 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:34:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/22] whpx: Fixed incorrect CR8/TPR synchronization
Date: Tue,  8 Mar 2022 12:34:25 +0100
Message-Id: <20220308113445.859669-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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
2.35.1



