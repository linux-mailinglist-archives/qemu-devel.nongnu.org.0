Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9ED6F45AA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 15:59:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqVt-00019E-Vi; Tue, 02 May 2023 09:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVq-000191-9i
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:50 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVo-0003Tr-PI
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:50 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f315712406so170565425e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683035867; x=1685627867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=stImznoQH9DbswhM0sRTZE7S3VXdqMW16vSnFo+HToc=;
 b=ypZRo1oElSCBwhj5j8h+wGaGYxrfOjZs8cGx0Hai3NSj98IBsHexGNnPB5+rRKnIDt
 3UEtSmwANsBHfjVgKaDORF2iwexTy8JzN+AUtVZ/LDgYrvfJFO9I4sc2BdlupHo0lf09
 JokRRICvDoTCIaZEFbS3SCZT+Vw/f/XVRf7g/TyRZBcKeYMQfOfZaGRlGuiMkLtg4xsF
 Nuvk+IvYwRCyOWlHzzYbOTLJB1UCsjSDffc9yhn7LezJ7LbMBPPA1jAHFpzMWOInM8fC
 f7RkZxId0RTDZI/BPuNKNafeWocHJSW4dYft+6OTU/b+6g6ivA28wuZ3HW0xmtMnI1IR
 yaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683035867; x=1685627867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=stImznoQH9DbswhM0sRTZE7S3VXdqMW16vSnFo+HToc=;
 b=K4R4nOQvC0J16PriaPpir8P7mqG2LptNWQQB0LuVjlSlvllr1gZU1OuR6ZaAK0P7ci
 gSSAaArFN/Y05ciUqb5MCjCQWtOfTtqJGduHGb2mBpZ9f6VMhEhKjllX+9TKUGpFyMoF
 chdfL9TMhi1Cx9UENqEazjuF9UvPY10OZYptoQEBrbi0xWJW3Lkk8P9SbxUABanaKobk
 ppy3EfzFjBINdnHuAJLxzkB5u0COwvzLoXe0kaKiLOU2LOTmj0V2zmaTGGks+B4hyrJR
 wZAkFSnmYm7q8n2rHSs9hp7Yod+qSHPLK8SFLkHOvnOqs4T89XCiWrWijZjC+Z4hfs8y
 BZAg==
X-Gm-Message-State: AC+VfDyZ+zr15Vuwy8w/qtIAYBeSzNRU9xryJPTIikeD9S1C4oqYE6Xi
 PAFVX4gVxfwwaLyrVCbQTBg5w9pAjJQNiIjWMLn/mA==
X-Google-Smtp-Source: ACHHUZ4rV5TZnkKKJDQCQIhn+8eZYEcYVproWK+zrnd9vbg2LjdBnIDALUFUlnHHyNaFeJ9dKcWYUA==
X-Received: by 2002:a7b:cb86:0:b0:3f1:8129:2c53 with SMTP id
 m6-20020a7bcb86000000b003f181292c53mr13240221wmi.16.1683035867502; 
 Tue, 02 May 2023 06:57:47 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm39461140wms.22.2023.05.02.06.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 06:57:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, anjo@rev.ng, laurent@vivier.eu, philmd@linaro.org,
 jiaxun.yang@flygoat.com, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 jcmvbkbc@gmail.com
Subject: [PATCH 5/9] target/mips: Finish conversion to tcg_gen_qemu_{ld,st}_*
Date: Tue,  2 May 2023 14:57:37 +0100
Message-Id: <20230502135741.1158035-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502135741.1158035-1-richard.henderson@linaro.org>
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Convert away from the old interface with the implicit
MemOp argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c              | 8 ++++----
 target/mips/tcg/nanomips_translate.c.inc | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 999fbb7cc1..a6ca2e5a3b 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1949,13 +1949,13 @@ FOP_CONDNS(s, FMT_S, 32, gen_store_fpr32(ctx, fp0, fd))
 
 /* load/store instructions. */
 #ifdef CONFIG_USER_ONLY
-#define OP_LD_ATOMIC(insn, fname)                                          \
+#define OP_LD_ATOMIC(insn, memop)                                          \
 static inline void op_ld_##insn(TCGv ret, TCGv arg1, int mem_idx,          \
                                 DisasContext *ctx)                         \
 {                                                                          \
     TCGv t0 = tcg_temp_new();                                              \
     tcg_gen_mov_tl(t0, arg1);                                              \
-    tcg_gen_qemu_##fname(ret, arg1, ctx->mem_idx);                         \
+    tcg_gen_qemu_ld_tl(ret, arg1, ctx->mem_idx, memop);                    \
     tcg_gen_st_tl(t0, cpu_env, offsetof(CPUMIPSState, lladdr));            \
     tcg_gen_st_tl(ret, cpu_env, offsetof(CPUMIPSState, llval));            \
 }
@@ -1967,9 +1967,9 @@ static inline void op_ld_##insn(TCGv ret, TCGv arg1, int mem_idx,          \
     gen_helper_##insn(ret, cpu_env, arg1, tcg_constant_i32(mem_idx));      \
 }
 #endif
-OP_LD_ATOMIC(ll, ld32s);
+OP_LD_ATOMIC(ll, MO_TESL);
 #if defined(TARGET_MIPS64)
-OP_LD_ATOMIC(lld, ld64);
+OP_LD_ATOMIC(lld, MO_TEUQ);
 #endif
 #undef OP_LD_ATOMIC
 
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 9398e28000..97b9572caa 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -998,7 +998,7 @@ static void gen_llwp(DisasContext *ctx, uint32_t base, int16_t offset,
     TCGv tmp2 = tcg_temp_new();
 
     gen_base_offset_addr(ctx, taddr, base, offset);
-    tcg_gen_qemu_ld64(tval, taddr, ctx->mem_idx);
+    tcg_gen_qemu_ld_i64(tval, taddr, ctx->mem_idx, MO_TEUQ);
     if (cpu_is_bigendian(ctx)) {
         tcg_gen_extr_i64_tl(tmp2, tmp1, tval);
     } else {
-- 
2.34.1


