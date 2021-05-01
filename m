Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05997370874
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:47:53 +0200 (CEST)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcued-0001Pr-PU
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaS-00086e-Dw
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:32 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:52754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaN-0008Sb-TO
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:32 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ge1so793751pjb.2
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V94i6w/myBpItKh/9Jz7ZoRAcgrkNfo+3GJKBYP/4N8=;
 b=qE89eXTNGOq92xEdjQ25mk8xecpQxIEkboEaYHtvIvCAr8s5P+/8Apfbyvjc+v99sB
 J2aMRoAkYXwB6lHKCX72yu/EaW7Yj4IzQqM8eLNRwSrV2cdlwbPv7KcjWPy8l7mT65c/
 +zc3o5ZrhIVJE6E7szBXycGXZlW66tzSrqNTE5WGrGkBl+TAqFAkkrzrnJR1kcg9mLv/
 SsYgiygVBUKZXYj5UKkTI1kot+SF3BNQm4qI7Xaass6XE/BzIaPpxsGmLvjMLCtQD50y
 zMvB+YWdISzLyezMdh2SdkgkmR6Tcj3CBWzLUVrJtYAaGvRXhyYYzycOcM3skwZGgEyw
 k/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V94i6w/myBpItKh/9Jz7ZoRAcgrkNfo+3GJKBYP/4N8=;
 b=ZlUynZTAmVv6rtrdxvojiAWHNU6p+WRj/eiPvzd+v6jy7TIi0FDh6EZR4Gw6CaHKsW
 s5xkLTeaQ8kNDd85i/OYNOfQwb5YLkX7t1q7SSHTRyQh04x5LI8KH7/4iXJtET5pT3KH
 5DuQ58zi/obqTv1eBIhvzc+aCDMptGnFzEUJQfZ2SQMffC9tl8UXkWKYYgCG7kBsT1TZ
 M1+cqpRYRrnkcGkzEN9AJF5Op36bysIepq/jhaH2agZqepSAE8QswR/yNIo7r97O+5JC
 TViikuw5LAFVj3fqkdPkgof3BahmlV5vVSbBDk9t3KmZZA1IGx3CYMiRtR1EsL4GhSOl
 KcUQ==
X-Gm-Message-State: AOAM530ZonLB0+hchC6Hn5CKGnWelKPK7Um035TlpupVDvsrcBb2DvCT
 Tty48SSl2mJob7MxgGv5MbCuRahjWRuZDw==
X-Google-Smtp-Source: ABdhPJyOrirr3Yg4DVagc6ygDGmjMqIGEBmmbSb4mGRhxnq5gnYTrUpW+/BFfu0ExdTnFRaDhpCy3A==
X-Received: by 2002:a17:90b:360f:: with SMTP id
 ml15mr4274034pjb.26.1619894606133; 
 Sat, 01 May 2021 11:43:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/31] target/hexagon: translation changes
Date: Sat,  1 May 2021 11:42:54 -0700
Message-Id: <20210501184324.1338186-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Change cpu_ldl_code to translator_ldl.
Don't end the TB after every packet when HEX_DEBUG is on.
Make gen_check_store_width a simple call.

Reported-by: Richard Henderson <<richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1615783984-25918-1-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/translate.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index eeaad5f8ba..2317508fa5 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -88,8 +88,8 @@ static int read_packet_words(CPUHexagonState *env, DisasContext *ctx,
 
     memset(words, 0, PACKET_WORDS_MAX * sizeof(uint32_t));
     for (nwords = 0; !found_end && nwords < PACKET_WORDS_MAX; nwords++) {
-        words[nwords] = cpu_ldl_code(env,
-                                ctx->base.pc_next + nwords * sizeof(uint32_t));
+        words[nwords] =
+            translator_ldl(env, ctx->base.pc_next + nwords * sizeof(uint32_t));
         found_end = is_packet_end(words[nwords]);
     }
     if (!found_end) {
@@ -292,20 +292,16 @@ static void gen_pred_writes(DisasContext *ctx, Packet *pkt)
     tcg_temp_free(pval);
 }
 
-#if HEX_DEBUG
-static inline void gen_check_store_width(DisasContext *ctx, int slot_num)
+static void gen_check_store_width(DisasContext *ctx, int slot_num)
 {
+#if HEX_DEBUG
     TCGv slot = tcg_const_tl(slot_num);
     TCGv check = tcg_const_tl(ctx->store_width[slot_num]);
     gen_helper_debug_check_store_width(cpu_env, slot, check);
     tcg_temp_free(slot);
     tcg_temp_free(check);
-}
-#define HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num) \
-    gen_check_store_width(ctx, slot_num)
-#else
-#define HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num)  /* nothing */
 #endif
+}
 
 static bool slot_is_predicated(Packet *pkt, int slot_num)
 {
@@ -355,25 +351,25 @@ void process_store(DisasContext *ctx, Packet *pkt, int slot_num)
          */
         switch (ctx->store_width[slot_num]) {
         case 1:
-            HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num);
+            gen_check_store_width(ctx, slot_num);
             tcg_gen_qemu_st8(hex_store_val32[slot_num],
                              hex_store_addr[slot_num],
                              ctx->mem_idx);
             break;
         case 2:
-            HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num);
+            gen_check_store_width(ctx, slot_num);
             tcg_gen_qemu_st16(hex_store_val32[slot_num],
                               hex_store_addr[slot_num],
                               ctx->mem_idx);
             break;
         case 4:
-            HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num);
+            gen_check_store_width(ctx, slot_num);
             tcg_gen_qemu_st32(hex_store_val32[slot_num],
                               hex_store_addr[slot_num],
                               ctx->mem_idx);
             break;
         case 8:
-            HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num);
+            gen_check_store_width(ctx, slot_num);
             tcg_gen_qemu_st64(hex_store_val64[slot_num],
                               hex_store_addr[slot_num],
                               ctx->mem_idx);
@@ -593,10 +589,6 @@ static void hexagon_tr_translate_packet(DisasContextBase *dcbase, CPUState *cpu)
         if (hex_cpu->lldb_compat && qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
             ctx->base.is_jmp = DISAS_TOO_MANY;
         }
-#if HEX_DEBUG
-        /* When debugging, only put one packet per TB */
-        ctx->base.is_jmp = DISAS_TOO_MANY;
-#endif
     }
 }
 
-- 
2.25.1


