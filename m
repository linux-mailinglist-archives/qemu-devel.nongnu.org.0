Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12606AB3F8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:51:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyY-0004tU-Dz; Sun, 05 Mar 2023 19:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxH-00013m-GX
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:59 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxB-0007Hp-8A
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:51 -0500
Received: by mail-pg1-x530.google.com with SMTP id s17so4553784pgv.4
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3i+tzZahpWOMC3oDLZzrT93TZZG3VDz5GUav2I8j86w=;
 b=HsL26Fn2DbN8NPUyuUG0M9fUn35jNy3PAuwVosknicEPIDu7sfrjcbGrCGqGODsE6c
 +UH2xRBQgDPSSWOgTxSSKBpDrX2gFcOoGXa+1IytZQg+ldnZ9uoApHlKKjmJjDEnDwXw
 dJtIrxeo1LoNkp7Ux4AZIH8fx87v8AP34yt+aAwT3tPZY5wXWGVpXpxF1vaLyaGhflMT
 S87HrmwlW968RoGuXBbmcbAmI71KjGxPir7WGr6lljqzUTCqc+Kuvr1DyGQwphkgzP7R
 xC7x9smaGbyXP0/zXLcsQW1mou+idOjYySGni/JaInK/VtMoR40w+aWq8yio7/B82taE
 XNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3i+tzZahpWOMC3oDLZzrT93TZZG3VDz5GUav2I8j86w=;
 b=hcpBcCVlmVSAXz0UWU92Xth+J1qZNThMpNT+XDzowy7slWZ8qjnB5OjmMkqNbnQJjN
 WqiBQj5Rr42rt86awhroz7BpdU5n8t3J0LCjAd3DkbCSBMPTtqjBALUbD9lUsGHMQIKS
 6w2JB/nYAevdguqOLJlu8nzzmUTyp+iObDiKwuPnh6XihftJoRpwEO9fJnskd4CP4d84
 1JVPH+yag99Ibj1HmkX9xV6HV0IcMuBPUdCbLUjsZE+NMi6stAKaG231x6XChBdLWWnt
 xehM/7y7hwYUv/pSJTX1f4B+I7DbiqM9gpiN33GF/QRULcxGEmWpmoPStt2vIXiPjX7R
 7n9Q==
X-Gm-Message-State: AO0yUKUilmwFJoCfUxUD/wH/cm6usDFVaUxdB6FVPayFxEecn7YkbivZ
 tML2exgf9+yoKzL0G9oWF3SWnVLMkNs7qcrnI5p3sw==
X-Google-Smtp-Source: AK7set+2j2f4l3E2tdzylNL6a7omg/cmhs/xsIvJ8NtE1CkvbQnwNhoap6zOx6jUuyGixm5pda91tA==
X-Received: by 2002:a62:64d0:0:b0:593:d276:1931 with SMTP id
 y199-20020a6264d0000000b00593d2761931mr8350270pfb.14.1678063426299; 
 Sun, 05 Mar 2023 16:43:46 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:43:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 56/84] target/sparc: Drop get_temp_i32
Date: Sun,  5 Mar 2023 16:39:26 -0800
Message-Id: <20230306003954.1866998-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new_i32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 2b4af692f6..a20426202e 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -84,8 +84,6 @@ typedef struct DisasContext {
 
     uint32_t cc_op;  /* current CC operation */
     sparc_def_t *def;
-    TCGv_i32 t32[3];
-    int n_t32;
 #ifdef TARGET_SPARC64
     int fprs_dirty;
     int asi;
@@ -129,14 +127,6 @@ static int sign_extend(int x, int len)
 
 #define IS_IMM (insn & (1<<13))
 
-static inline TCGv_i32 get_temp_i32(DisasContext *dc)
-{
-    TCGv_i32 t;
-    assert(dc->n_t32 < ARRAY_SIZE(dc->t32));
-    dc->t32[dc->n_t32++] = t = tcg_temp_new_i32();
-    return t;
-}
-
 static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 {
 #if defined(TARGET_SPARC64)
@@ -153,7 +143,7 @@ static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 /* floating point registers moves */
 static TCGv_i32 gen_load_fpr_F(DisasContext *dc, unsigned int src)
 {
-    TCGv_i32 ret = get_temp_i32(dc);
+    TCGv_i32 ret = tcg_temp_new_i32();
     if (src & 1) {
         tcg_gen_extrl_i64_i32(ret, cpu_fpr[src / 2]);
     } else {
@@ -175,7 +165,7 @@ static void gen_store_fpr_F(DisasContext *dc, unsigned int dst, TCGv_i32 v)
 
 static TCGv_i32 gen_dest_fpr_F(DisasContext *dc)
 {
-    return get_temp_i32(dc);
+    return tcg_temp_new_i32();
 }
 
 static TCGv_i64 gen_load_fpr_D(DisasContext *dc, unsigned int src)
@@ -5516,7 +5506,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         break;
                     }
 #endif
-                    cpu_dst_32 = get_temp_i32(dc);
+                    cpu_dst_32 = tcg_temp_new_i32();
                     tcg_gen_qemu_ld_i32(cpu_dst_32, cpu_addr,
                                         dc->mem_idx, MO_TEUL);
                     gen_helper_ldfsr(cpu_fsr, cpu_env, cpu_fsr, cpu_dst_32);
@@ -5763,13 +5753,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
     goto egress;
 #endif
  egress:
-    if (dc->n_t32 != 0) {
-        int i;
-        for (i = dc->n_t32 - 1; i >= 0; --i) {
-            tcg_temp_free_i32(dc->t32[i]);
-        }
-        dc->n_t32 = 0;
-    }
 }
 
 static void sparc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


