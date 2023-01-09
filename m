Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE16166313B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:18:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRo-00037X-PP; Mon, 09 Jan 2023 15:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRl-00032Y-3a
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:41 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRj-0007Xk-GW
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:40 -0500
Received: by mail-pl1-x62e.google.com with SMTP id y1so10782570plb.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3kEe5fNGYkVr+4UJdUprtIi1urVwj9zZaNxQZb+ASkI=;
 b=vGdj34OuogiNh7FheRmpKpNUEM83HCrm3Nqbs9IfiZWnHBcYefwfakoB8k4aSACdGX
 Kl00fT2J0cqGl75vN5/8Frc9YCZf2TobFjNv7yBN+wvPSaGf/rBitRx6pShufFXouyU1
 naX1f1Li3DrYvQhjX7WDLP652gA/BZS8ijFyTZ8BWnA5+Z7yZomW5I0yLNzm+Fht1+4B
 rxX1o7tpTwnOL95lUQpjl2t67nVZG4H0NQoAh/xtpfsoZKdfFR8OEhxGd7ulV6WIqHm3
 eFhyQekzDGU5m0mbIX7gm1bNbF42dkI+zVnNTRLtgdqQl8SmbH/pR4l8HFIMWFpw2qHw
 6tCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3kEe5fNGYkVr+4UJdUprtIi1urVwj9zZaNxQZb+ASkI=;
 b=nDMIowv6Y65pW8KQi/3kOMCIU1Lawf6us51DueTV3U78m/1sOS37h7U+hUeRv8nTaS
 PfPEs+XxEnq29zI6wjg9M1gEO9LweZGWQ3VH7eCVQQ4/cLUrf5W09euN2tJ3fO0zo29A
 bE3tBRBqtxT39XvVDjx29R2zX7kbsTuwT0upKQX1Q+3REH6cwwwQc73VdPKRqlo3mzYT
 xUJRuKEK0smVw1+HmektaLIYlA65Jg8j7/yOz9faF0dSh7EUhDDfpGXCU7/U8BeEdAEs
 PZf+tj4VqGEjJpp+PgqzVQRblgipYGtR95WaG/zh77nnt24Nco7qDQ5dD4lbPuIfSUN5
 YTrw==
X-Gm-Message-State: AFqh2krQV1snZG/T/wtlhUbwHaqFsivXMgS64WEIndqzjr5zbZ2nUJgp
 0mYze5fquske9WCbkEsSPMVjgoLVmToIGH41
X-Google-Smtp-Source: AMrXdXuRABT4pB+/vNas7Sq+bhcyV26P/70rHm5/F4UhGXPpLMxcxWfi1edxnrwwEXvxF50zOK1zVw==
X-Received: by 2002:a17:90a:f10d:b0:219:705c:7193 with SMTP id
 cc13-20020a17090af10d00b00219705c7193mr68856648pjb.11.1673294917805; 
 Mon, 09 Jan 2023 12:08:37 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 14/27] target/s390x: Assert masking of psw.addr in
 cpu_get_tb_cpu_state
Date: Mon,  9 Jan 2023 12:08:06 -0800
Message-Id: <20230109200819.3916395-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When changing modes via SAM, we raise a specification exception if the
new PC is out of range.  The masking in s390x_tr_init_disas_context
was too late to be correct, but may be removed.  Add a debugging
assert in cpu_get_tb_cpu_state.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu.h           | 20 ++++++++++++++------
 target/s390x/tcg/translate.c |  6 +-----
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7d6d01325b..c7eeebfc53 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -379,17 +379,25 @@ static inline int cpu_mmu_index(CPUS390XState *env, bool ifetch)
 }
 
 static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong *pc,
-                                        target_ulong *cs_base, uint32_t *flags)
+                                        target_ulong *cs_base, uint32_t *pflags)
 {
-    *pc = env->psw.addr;
-    *cs_base = env->ex_value;
-    *flags = (env->psw.mask >> FLAG_MASK_PSW_SHIFT) & FLAG_MASK_PSW;
+    int flags = (env->psw.mask >> FLAG_MASK_PSW_SHIFT) & FLAG_MASK_PSW;
     if (env->cregs[0] & CR0_AFP) {
-        *flags |= FLAG_MASK_AFP;
+        flags |= FLAG_MASK_AFP;
     }
     if (env->cregs[0] & CR0_VECTOR) {
-        *flags |= FLAG_MASK_VECTOR;
+        flags |= FLAG_MASK_VECTOR;
     }
+    *pflags = flags;
+    *cs_base = env->ex_value;
+    *pc = env->psw.addr;
+#ifdef CONFIG_DEBUG_TCG
+    if (!(flags & FLAG_MASK_32)) {
+        assert(*pc <= 0xffffff);
+    } else if (!(flags & FLAG_MASK_64)) {
+        assert(*pc <= 0x7fffffff);
+    }
+#endif
 }
 
 /* PER bits from control register 9 */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 449e854c82..de2d8edb47 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6493,11 +6493,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    /* 31-bit mode */
-    if (!(dc->base.tb->flags & FLAG_MASK_64)) {
-        dc->base.pc_first &= 0x7fffffff;
-        dc->base.pc_next = dc->base.pc_first;
-    }
+    /* Note cpu_get_tb_cpu_state asserts PC is masked for the mode. */
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
-- 
2.34.1


