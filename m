Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E786CA552
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:13:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmeZ-0006Td-E5; Mon, 27 Mar 2023 09:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgmeN-0006MK-1l; Mon, 27 Mar 2023 09:12:39 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgmeI-00016X-4v; Mon, 27 Mar 2023 09:12:35 -0400
Received: by mail-pg1-x531.google.com with SMTP id d22so5113795pgw.2;
 Mon, 27 Mar 2023 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679922752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qa0vcpWHUsucp4ekiEDRDxADCO2tmJt2k/q/xtqrpbk=;
 b=SiU0tP50hK232SAW8JVk7eoUT/GazfvhbWoaR6MALoFthkPN1veaNuwqkzv2PmRpd2
 HbTiG/sPUgjzF+fX9p3lX9VxuytZbUVy+HCMQz71AcjwGvu67tmhJz+dqq6Pw++j7AEk
 WiDQCAfr7h4+uScnSOeXv8PYz+3CANlzduyzOgJzt/MfZX825bIo4uaxJq/odvIZGza0
 GskvnAMZJWj5gPTaTOPdaQOVktYad8iN7nYeDRe+4Iviv+q6/qn6mlv+h6ZgOTiKa4m2
 Colhh2qAsUgZtKQDG47+twDJVyVZ2uIm5xA9DpdYmpdV//4iF7t+ogTvYIlSpxRntArc
 3CjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679922752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qa0vcpWHUsucp4ekiEDRDxADCO2tmJt2k/q/xtqrpbk=;
 b=S7myz7yUkyaTTg/qMolMepNLNPN3C+2jrfx6Pr//QpxzIhvcOxq3dsF42BONibeLUC
 hW380unZndIIoWPaSSUzhSicBAfjx8ugUNYlxTg+fcuHiTXmgPThb4llMCujIRd9FqNO
 RrtY0ey1HbIdlt4x+Tntqwu9RsYamS7vowYQ5dSLepWUvoxdWLxMNhKLR+Cowl5QzZcu
 McEHsyK22fNGX+t39IXHogbT/Hxsg+f1ibmn/UQdwxHXoTibSNHBSrR0gUHZoJFOXloR
 8zYGbQv3h50Q6x/pmXP17qqGz8XjQe4keBnxehbZtb2ZftHxlz1cN3fOtzPP4pZfx4/E
 flBA==
X-Gm-Message-State: AAQBX9eyoydupBQY71Q3/DRqIWFw8gQ7di8WronJPP5XBI00RF9YAk7s
 0q+dUUbKEiJ2O231hXzy7eT5E9q1fIc=
X-Google-Smtp-Source: AKy350YrmGsB18c/eGH+uV77F+kmtf7A+PtwZfOC9eDSYM7hi5wISyqMjvi84Ytto+Vd2opRQiM4Yw==
X-Received: by 2002:a62:65c6:0:b0:625:d630:4e1b with SMTP id
 z189-20020a6265c6000000b00625d6304e1bmr8615654pfb.31.1679922751949; 
 Mon, 27 Mar 2023 06:12:31 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a63f50c000000b0050bcf117643sm17301638pgh.17.2023.03.27.06.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 06:12:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 3/6] target/ppc: Fix instruction loading endianness in
 alignment interrupt
Date: Mon, 27 Mar 2023 23:12:15 +1000
Message-Id: <20230327131218.2721044-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327131218.2721044-1-npiggin@gmail.com>
References: <20230327131218.2721044-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x531.google.com
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

powerpc ifetch endianness depends on MSR[LE] so it has to byteswap
after cpu_ldl_code(). This corrects DSISR bits in alignment
interrupts when running in little endian mode.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1:
- Removed big endian ifdef [Fabiano review]
- Acaually use need_byswap helper.

 target/ppc/excp_helper.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 287659c74d..07729967b5 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -133,6 +133,24 @@ static void dump_hcall(CPUPPCState *env)
                   env->nip);
 }
 
+/* Return true iff byteswap is needed in a scalar memop */
+static inline bool need_byteswap(CPUArchState *env)
+{
+    /* SOFTMMU builds TARGET_BIG_ENDIAN. Need to swap when MSR[LE] is set */
+    return !!(env->msr & ((target_ulong)1 << MSR_LE));
+}
+
+static uint32_t ppc_ldl_code(CPUArchState *env, abi_ptr addr)
+{
+    uint32_t insn = cpu_ldl_code(env, addr);
+
+    if (need_byteswap(env)) {
+        insn = bswap32(insn);
+    }
+
+    return insn;
+}
+
 static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
 {
     const char *es;
@@ -3097,7 +3115,7 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
 
     /* Restore state and reload the insn we executed, for filling in DSISR.  */
     cpu_restore_state(cs, retaddr);
-    insn = cpu_ldl_code(env, env->nip);
+    insn = ppc_ldl_code(env, env->nip);
 
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_4xx:
-- 
2.37.2


