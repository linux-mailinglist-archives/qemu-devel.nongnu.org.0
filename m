Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD2A6494ED
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:37:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OFp-0006SZ-V3; Sun, 11 Dec 2022 10:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFk-0006MB-E6
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:32 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFf-0007eU-RQ
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:32 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 m7-20020a9d6447000000b0066da0504b5eso5824027otl.13
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vh4p13H2zViKHartLXadg1WDfoyDsm5UJJHMM3R8D9c=;
 b=fKhhc0Dbs3zvZUralS7r5pAVhDbcRO0V+OAvdPewXahMsffmyd64iy1IiHa0jjs0gP
 5X6VEP2Urp4v0FIGW0rd9WdZ4JHkilNxdI78nSMd9G37sh1jbq1XVcGIMDvW1D6ubJ8F
 DTC6uRh75lL964ROi7HJPlzrntYuR+cghiE0NOUfMo080vcot75EEm0HgAWgHHIDu/aM
 MJ0T9Ao9TZKMhXmXudyDaDXRdTSt5RkloqPiby7Dlg5Qn0sEPk3GIHTiC6qs79685qDF
 gReIgQEAYTUFdj5DR7ugc+gv465JMLwjHPgEy6gBREsEtNT4nD97CKPEai0mnqFjuuXL
 zbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vh4p13H2zViKHartLXadg1WDfoyDsm5UJJHMM3R8D9c=;
 b=1KVd0dTMIZBLzSccSEH60wvdFTUa+0zgzXMnE/CN8I9+lN2ywOdaSlz+DEbGV0tnmg
 nH7rmIa1rR9Z5/BrLf5eohPmFz4LAKZEdQS3yZiUVOByN+OJAbA7d1GcbTFl/lz9aOSy
 JJEFbvpLYdR9qubcbqkB+5pFGGiOuvyPVPFtv56RegBXrCpNKmKjzub1ExX3mlRDkJiB
 aKm1Ei0qFF5vHavpq8SrfYWYdGufUoTN87FszndEKGtGBQVlks+AOVTSwC8Zq255NCE9
 1SGx4EEY84doBb7/QGMnvaTW56ZME/jOFMcIJVgZcwPNi41R6ElP/IdDyEQT3iKTOmYd
 sC9A==
X-Gm-Message-State: ANoB5pnbmqw8kD46VS4oVnJb5FiyCytJs3ft04E4KW6HyFpn0yGCRRz/
 Nxz3K3RoVMGa+VFIKyZpDklGHMrYh/ds5neuzCg=
X-Google-Smtp-Source: AA0mqf67bl8IMDYbUS+Kv01jM5bSTd9H1NzcsEg+M2jO/7c245+oUeAdiVBksyRKu1y+QE/c1gnd0w==
X-Received: by 2002:a9d:7699:0:b0:661:dfe6:9732 with SMTP id
 j25-20020a9d7699000000b00661dfe69732mr5648856otl.1.1670772501375; 
 Sun, 11 Dec 2022 07:28:21 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v2 14/27] target/s390x: Assert masking of psw.addr in
 cpu_get_tb_cpu_state
Date: Sun, 11 Dec 2022 09:27:49 -0600
Message-Id: <20221211152802.923900-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

When changing modes via SAM, we raise a specification exception if the
new PC is out of range.  The masking in s390x_tr_init_disas_context
was too late to be correct, but may be removed.  Add a debugging
assert in cpu_get_tb_cpu_state.

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
index c9afa28c60..fcf0c52b8d 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6491,11 +6491,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
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


