Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD764CAD76
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:24:44 +0100 (CET)
Received: from localhost ([::1]:51472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTeV-0007vm-41
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:24:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTRu-0006fU-2U
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:42 -0500
Received: from [2a00:1450:4864:20::42c] (port=42912
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTRs-0008NX-DY
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:41 -0500
Received: by mail-wr1-x42c.google.com with SMTP id u10so2453770wra.9
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5dbaBdYAMjhrYbiwidflPhtFdmpOVM1ditmWCxx0uo=;
 b=HhP9/8EhQpfP8jl26gJ5VFFBwHwto4Ep6HR4LivgakHzw/HMhGAKf4SoNh4ez+cNfD
 J1txsf/RZIOTyKLaXhj1r+UvPDn6i+NKCpTu6j14dR548QeAm9PSDSRN4uEuytQ7G8mY
 o0NmqVgSCTSWePYwC9QsJ6bTX9rOoKA0rdCFNteynkcKMqgQN9WgOfmgLTFxhQJ+qqrc
 uKEfV3/dqlD96XY7RaJ6rIX4Vqp1LUYB9QBFQ1cFIJH/M9b0vN+ZahBFaAh0+eZr6BDX
 QqMdLIJP7GP1Xvy/BEJFoxqOzthqtJ0rYZINDIhUbUmPmnl+Hpy072khKiasmJg/RsJd
 KWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M5dbaBdYAMjhrYbiwidflPhtFdmpOVM1ditmWCxx0uo=;
 b=rpXipXrrNk5+q76oMX7aSZsGhgt3PB/BNSyVPbzguVFVQsrx4567vKzVHP8L3W0Y30
 bDbhLY5rkG35JWQcfRFCK7CylD42sSNKNgYYosiGK3rAbXj7JmSpIBAKjknRt8QGdMik
 PG/z5keXoqqzkBSgdZEEZR5Feg4Y9bagZwh3eA8+5qZ74JA0dukHsAmIVO/pIVz9pwOh
 BrJt+kj9p6hhaEOH6RnxdncvKldfbevK/3Lc5tG8175mnKLLFHk4C0Sp6iH/bOvSdCqA
 ctYgT+qU2qDsV9SAJc7sZQI9OK/PCTEgCX3GEuGyb+akWCdQM02JPH642uEzi5xy7GTM
 RBPg==
X-Gm-Message-State: AOAM533BPDd/W47GmobugfYGDWB6dnpif3fp74lxZAD0lEgOtuhJCGUA
 yd9DfpkLNDEIh0UBJbEYLRR6lO3fgp0=
X-Google-Smtp-Source: ABdhPJx82IzqlVKNyBtMDWgxZ1EzlCIlnNHJW0wXQeNL3/A8r9ag+dMdbmBnBEqhrKjMIBB8r1qtAg==
X-Received: by 2002:a5d:59ac:0:b0:1e4:9b6e:eac7 with SMTP id
 p12-20020a5d59ac000000b001e49b6eeac7mr24895021wrr.172.1646244699129; 
 Wed, 02 Mar 2022 10:11:39 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm7720811wmb.48.2022.03.02.10.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:11:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/11] whpx: Fixed incorrect CR8/TPR synchronization
Date: Wed,  2 Mar 2022 19:11:25 +0100
Message-Id: <20220302181134.285107-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302181134.285107-1-pbonzini@redhat.com>
References: <20220302181134.285107-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
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



