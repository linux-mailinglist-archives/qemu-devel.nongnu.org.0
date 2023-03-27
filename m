Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F76E6CA553
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:13:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmea-0006Uy-KO; Mon, 27 Mar 2023 09:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgmeQ-0006Mu-3D; Mon, 27 Mar 2023 09:12:44 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgmeO-00017S-HS; Mon, 27 Mar 2023 09:12:41 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 qe8-20020a17090b4f8800b0023f07253a2cso8751630pjb.3; 
 Mon, 27 Mar 2023 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679922758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gSor7mkAJ6QbuhewJCouEkbM5T6yFksX9iZ2HrNk2I=;
 b=hQNekoqrkzWS+n9dJoY1bttMtyPHgcN7emb6/xgiSU1gWd66F9k8UzCe2fu3B6ZRu7
 BZmB2R9IUrw6MCcqfKbXldZ/VfVc7dSiFDXlBTNaqELHfAOQKsUZM7M7FAywd5bGm/+h
 k8Xf/ZZORIKneMjRiz3q37VgRo18OxtGU5SFrghYSf3M4JDzGCDEAQyAAl072jjTyLm6
 Iv3y6ZpqacreWdxzf/iCVUXPtjoRx1FCiAnNukonMcA8bVeqp6PCCXj9nQWG0EvtU4nh
 wicVbD/4t4xFUnVuGUA3UQLTp38QiLnDKpfFI5LL8AXt5eL2brIoKlMUmYSP/NhuxE64
 fcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679922758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gSor7mkAJ6QbuhewJCouEkbM5T6yFksX9iZ2HrNk2I=;
 b=bKQPbqY7KSNOH8ihD2b+WKYNJvWeQJCKAqiHGMECB7EnJYr8Vb/8M9RI3ZtkMUkCqf
 +6dVnxQAc6dYTQWbz8Fb0AXo6B9d8W911cOU7RdhR+5V57Pr5B+uTsyShLFHbjzc26nF
 NkhtV+2NNjqcusxBk7fvDNp3iikDBpnW2SgOVX8HodOt6y4ZggcFilyn2CfAG1kWxtqk
 DAYEFtT3W/3zFsl5hFjI5sGe04UI1zXZMJm1xJgdDzubfNrXtFHXmlBIKsUJLgvD8VNi
 4HMu4PmLfelPusXi1KnOma4PEGahKsSYLkVmis2Fw9OGHSjyKiZZnlZCg3mGi3pbCqQM
 +89g==
X-Gm-Message-State: AO0yUKWVyW9z3TIRESU4RyUwYNrC3XILXaNamgtMVLG57RDLv3Ptsimb
 qd/puNSiBfu9JnfBvdFGJG7T2jHJrAk=
X-Google-Smtp-Source: AK7set+pWO/sJ2C2HR/t0c6ZuSRjiCUz6Bhg9gq3UaRlo5fo1ubrCKyU58+FhKSZy95z49gLKhJllQ==
X-Received: by 2002:a05:6a20:811a:b0:d7:3b62:3cf with SMTP id
 g26-20020a056a20811a00b000d73b6203cfmr10289553pza.54.1679922758513; 
 Mon, 27 Mar 2023 06:12:38 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a63f50c000000b0050bcf117643sm17301638pgh.17.2023.03.27.06.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 06:12:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 5/6] target/ppc: Add SRR1 prefix indication to interrupt
 handlers
Date: Mon, 27 Mar 2023 23:12:17 +1000
Message-Id: <20230327131218.2721044-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327131218.2721044-1-npiggin@gmail.com>
References: <20230327131218.2721044-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

ISA v3.1 introduced prefix instructions. Among the changes, various
synchronous interrupts report whether they were caused by a prefix
instruction in (H)SRR1.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1:
- Use insns_flags instead of excp_model [Fabiano review]

 target/ppc/excp_helper.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 6ac003bcd5..4e119c4dfc 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1346,12 +1346,21 @@ static bool books_vhyp_handles_hv_excp(PowerPCCPU *cpu)
     return false;
 }
 
+static bool is_prefix_excp(CPUPPCState *env, uint32_t insn)
+{
+    if (!(env->insns_flags2 & PPC2_ISA310)) {
+        return false;
+    }
+    return ((insn & 0xfc000000) == 0x04000000);
+}
+
 static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
     int srr0, srr1, lev = -1;
+    uint32_t insn = 0;
 
     /* new srr1 value excluding must-be-zero bits */
     msr = env->msr & ~0x783f0000ULL;
@@ -1390,6 +1399,29 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 
     vector |= env->excp_prefix;
 
+    switch (excp) {
+    case POWERPC_EXCP_MCHECK:
+    case POWERPC_EXCP_DSI:
+    case POWERPC_EXCP_DSEG:
+    case POWERPC_EXCP_ALIGN:
+    case POWERPC_EXCP_PROGRAM:
+    case POWERPC_EXCP_FPU:
+    case POWERPC_EXCP_TRACE:
+    case POWERPC_EXCP_HDSI:
+    case POWERPC_EXCP_HV_EMU:
+    case POWERPC_EXCP_VPU:
+    case POWERPC_EXCP_VSXU:
+    case POWERPC_EXCP_FU:
+    case POWERPC_EXCP_HV_FU:
+        insn = ppc_ldl_code(env, env->nip);
+        if (is_prefix_excp(env, insn)) {
+            msr |= PPC_BIT(34);
+        }
+        break;
+    default:
+        break;
+    }
+
     switch (excp) {
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
         if (!FIELD_EX64(env->msr, MSR, ME)) {
-- 
2.37.2


