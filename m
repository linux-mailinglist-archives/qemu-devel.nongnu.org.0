Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC04170287E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:28:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUUJ-0004c9-Vf; Mon, 15 May 2023 05:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUD-0004Yg-D6; Mon, 15 May 2023 05:27:21 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUB-0002sy-IW; Mon, 15 May 2023 05:27:21 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-643995a47f7so13012570b3a.1; 
 Mon, 15 May 2023 02:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684142837; x=1686734837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B1gtYriqMp6KeH+Cm1mqAljc/h3SB/6QVeC+84ggT8g=;
 b=VCZIv8a8d5oDHc/pQzaVy9qqRVxwGI6qTWRHd6uKSpWkzcEjlVyVZjB+cxLWw/ZZld
 vRuS1bN8aP/mTpHd1NYbmKYzg6K1MClQ5hjK9mlxzhnNZY9jIQ7qsGW2cW2YbETtqxgV
 WrzNFA58eegN/Y4lvKqP95/VawiQ++kLWkplF/SusQT79yUsU4nrLEGNJ4n8Vx/M4fmK
 D7QgF0Fxz7B9GvECO6ojgUShqk9omIRA0TOKUPgP6d0NXeQDRllZT42Iphgzh4c7+mA4
 kyl+8muN0Qm2+cPGLWypi5MxV1Rc43cjuK0HlYwKLTMP1NjVMs/n039/NYTUxFTaFE7X
 +KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684142837; x=1686734837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B1gtYriqMp6KeH+Cm1mqAljc/h3SB/6QVeC+84ggT8g=;
 b=lqGh36CLqaxnPC3Ty/gK2pmDxwwHaVFHV9kCJlIUVTwp27EXacyQS5zhmYUrXFtXgo
 Vbg0ETpmMJMA4j+y5Tcvg1z2oVlkWGxNA0DL1IwE2GppECG99I7hToMgwQyT7bnn/2DM
 MzKcmRqvl3qgtDP3c5SjHenXUYv46W02BZR21l1Fe56u2+2hkT2PFKY4zRpIV8c7eza/
 8XqFrmoe2H6bZV4uGtUsgJzKRwXZZidUVWG29tC492VgH8CljgjtPfv0ulQ1HE6Ft+pm
 My7Y+WhtRNNasLSv25iNmMiuuZ9+j9WDiKFx8vIL1BXmdWMX4/PAt4Ufe0inL3QhYFp/
 46lw==
X-Gm-Message-State: AC+VfDxEb7auPC2vlGNWzKSKrTkfSpse/E+uM9t+2Tr5Ut17Z9jXOIQT
 0gVk+pLE11gdA6hFMNiART3sWXdmJD4=
X-Google-Smtp-Source: ACHHUZ50E/O+e5Fjwk64EGHCz+vWtqcuJ+qZNYbdzdHyHcTsmHl623fqsq6Hg7DlNiho63gun07Esg==
X-Received: by 2002:a05:6a00:a15:b0:647:5409:5d0b with SMTP id
 p21-20020a056a000a1500b0064754095d0bmr32060903pfh.19.1684142837428; 
 Mon, 15 May 2023 02:27:17 -0700 (PDT)
Received: from wheely.local0.net ([202.168.30.146])
 by smtp.gmail.com with ESMTPSA id
 n20-20020aa79054000000b006466f0be263sm11387818pfo.73.2023.05.15.02.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 02:27:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v3 3/9] target/ppc: Fix instruction loading endianness in
 alignment interrupt
Date: Mon, 15 May 2023 19:26:49 +1000
Message-Id: <20230515092655.171206-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515092655.171206-1-npiggin@gmail.com>
References: <20230515092655.171206-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2: no change.

 target/ppc/excp_helper.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 199328f4b6..bc2be4a726 100644
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
2.40.1


