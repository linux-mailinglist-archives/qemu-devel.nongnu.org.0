Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB136C5C8F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 03:24:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfAbV-00025k-Fg; Wed, 22 Mar 2023 22:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pfAbQ-000244-Ee; Wed, 22 Mar 2023 22:22:59 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pfAbO-00083v-Ud; Wed, 22 Mar 2023 22:22:56 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso2310318pjc.1; 
 Wed, 22 Mar 2023 19:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679538173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MAmH7/Wnz26mjPPEDwoTsOT+dBQ23DDMqUzeKxGlxjs=;
 b=cDxSxVfbSbdG5Lbq6bt2zQeUc48N2b2gABG2n6c3ofY1GjsoLjyRtv32MwkM+Q/oJE
 W1Lcc7pbDXJS5Wr7buNGhg/HdJ/CLMUrtgGIY32mZ3xaXm+Ug5IV4RUMVT47cH7gsaxk
 NVXLAGP/qDrZHypxT1KGrsKkydO1nxAOTl3azrDnAHtXWyu3qkNKDu2b+D4AxQvhTYzC
 DdJZNj9b1tKdBXR6Udqhnz921HIXBo+Gw87Ep+4luE8ptxa8PTSRQZSC878+90D7BGEe
 FDCqDK9rIqVak5jliukrz5nGCC01jsdBots+tmpXc1ezxd9BBfl5z2Y6/k8NEVwCCcly
 mqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679538173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MAmH7/Wnz26mjPPEDwoTsOT+dBQ23DDMqUzeKxGlxjs=;
 b=NvkQcPRQ76iYXY7Y7hu0Tv1L8ZsNymAx4Vwlt2mrJZI0w+WUc31qiMojJ9wrLQyA9v
 hOn55d6Ac0QpJxMKeKCzdfAet2YGi1e72SEC8yySGR7fjt3rrUYBAex9+mRjWkEXlgV0
 EurHH3zxkGMnAcnWxwx207js6wHxfoTb/ELiLYuqnl/55Ws1GbDBnn+f/OPbNuXtKWJx
 rpN0IpR9L191zs0QEA0cFwhdsEyewT0anP4eH8aIsgPOvc6ODO8vxVVqnAwC+RyP9i06
 ec5S3LH3u3DEth0iYz/hzlCsVpbDHqp6FbvRf5g7LmSVfupEnZIQ1Uou4g6T5KibSPYp
 Tw6w==
X-Gm-Message-State: AO0yUKUgwG0MXr5YLIpDMklUEr4qkqS2Kqd/XFsVx0nnQgGikz0hitgl
 OlRjzxc0OiikIBK6TVDorL/1vwJC+AwtNQ==
X-Google-Smtp-Source: AK7set/EVAbGAiTR/jFFxPX1Xw8gtYqBcd3RQ/HADAuRcxVyiYwnMu/qTZ6LKZ4QtjvH14t+OwPLLQ==
X-Received: by 2002:a17:90b:1d8c:b0:237:b4c0:e15b with SMTP id
 pf12-20020a17090b1d8c00b00237b4c0e15bmr6026827pjb.44.1679538172924; 
 Wed, 22 Mar 2023 19:22:52 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-215-123.tpgi.com.au. [61.68.215.123])
 by smtp.gmail.com with ESMTPSA id
 jc11-20020a17090325cb00b001a1abc93eabsm10609438plb.226.2023.03.22.19.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 19:22:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 3/6] target/ppc: Fix instruction loading endianness in
 alignment interrupt
Date: Thu, 23 Mar 2023 12:22:34 +1000
Message-Id: <20230323022237.1807512-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230323022237.1807512-1-npiggin@gmail.com>
References: <20230323022237.1807512-1-npiggin@gmail.com>
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

powerpc ifetch endianness depends on MSR[LE] so it has to byteswap
after cpu_ldl_code(). This corrects DSISR bits in alignment
interrupts when running in little endian mode.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/excp_helper.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 287659c74d..5f0e363363 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -133,6 +133,31 @@ static void dump_hcall(CPUPPCState *env)
                   env->nip);
 }
 
+/* Return true iff byteswap is needed in a scalar memop */
+static inline bool need_byteswap(CPUArchState *env)
+{
+#if TARGET_BIG_ENDIAN
+     return !!(env->msr & ((target_ulong)1 << MSR_LE));
+#else
+     return !(env->msr & ((target_ulong)1 << MSR_LE));
+#endif
+}
+
+static uint32_t ppc_ldl_code(CPUArchState *env, abi_ptr addr)
+{
+    uint32_t insn = cpu_ldl_code(env, addr);
+#if TARGET_BIG_ENDIAN
+    if (env->msr & ((target_ulong)1 << MSR_LE)) {
+        insn = bswap32(insn);
+    }
+#else
+    if (!(env->msr & ((target_ulong)1 << MSR_LE))) {
+        insn = bswap32(insn);
+    }
+#endif
+    return insn;
+}
+
 static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
 {
     const char *es;
@@ -3097,7 +3122,7 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
 
     /* Restore state and reload the insn we executed, for filling in DSISR.  */
     cpu_restore_state(cs, retaddr);
-    insn = cpu_ldl_code(env, env->nip);
+    insn = ppc_ldl_code(env, env->nip);
 
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_4xx:
-- 
2.37.2


