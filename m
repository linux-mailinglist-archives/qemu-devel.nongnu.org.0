Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D64F700A7C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:42:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxj-0007GS-4j; Fri, 12 May 2023 10:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxe-0007AB-Ug
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:35 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxN-0004hZ-Nc
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:34 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f435658d23so39602465e9.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902477; x=1686494477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WvyKjvvZPjQfu6e5IbjWblRQ9GYWJyDmT7w7l2HjFqA=;
 b=lFbkBrdfNE3wAiKgOej/kiP6mk04mRza8oOnjdGKyDWCfz8KvLtljwspZLglN87ej8
 k02cabAugs1qIUx0ee074FO9ri1M+ePLisf04Vb0t019Q+PSOviSq5oB2Xae+Q85F0oL
 5Mz6ELVYMHyGmV+j99fq6tGON9UV9Nrn7Ywp0p/FsjtuD/JnNt4Pz4L1eBfVrBAIoLCx
 aYifTfmd7C+fjWb6rx5drRF2GhKDlIqF3QmAeRcjxIPSBy84ivR27/9ps91WweLATKw2
 1JeNfIXqM5uivvIlg0iFo7lDvn2aN6qlOjJQap0uE4OK9TlOC/bRTfqpga+XsUS7CH9e
 LnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902477; x=1686494477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WvyKjvvZPjQfu6e5IbjWblRQ9GYWJyDmT7w7l2HjFqA=;
 b=VToXIPTRhAPGenl/AOn2ldKuKN5fJ9qaOCEBklFt7aAJHvkfLj8MC+5BZFocfvSGf1
 QzmNUyrXyDWw331QCwgw0gZB8UcUaGAk+mFg0XkZZwH7/md3Ya92aI9qyIxs1JlTPrNr
 uf+1aWPIBTvlWy85bncv2JdpgT4lnEzJTjvtNf4zOhX6c5yJRj9RBRauLHtc8sjnNYeb
 P0czYoUcprcdx6XKF9kvS9Hogomxnc1Oy67Lu+HrCovMxHRH7EX/AQrz93pOK3JyNKGj
 wMyzNRrAeMTk+lP7TjH9ttFdDRsbYfTAjvBBzdRyLPZsW9jJLSGdM65MMZ3Sitsl9+d1
 qypg==
X-Gm-Message-State: AC+VfDx332IcjxuV27xIQji/3LJ0yezz9VmoUwGBwvLbsqXWdyjUGu3i
 tfsowNZHnMdl/W8PozD1ON2HSw==
X-Google-Smtp-Source: ACHHUZ6o6iIXmcxmD9DXUBD2dL4qyfNd1hZP9bS58m9vSSMTXC73KnX6HNEgDUYXrhOfEotlUhrZrA==
X-Received: by 2002:a1c:750a:0:b0:3f4:16bc:bd19 with SMTP id
 o10-20020a1c750a000000b003f416bcbd19mr16089233wmc.23.1683902476963; 
 Fri, 12 May 2023 07:41:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 18/20] target/arm: Convert BRA[AB]Z, BLR[AB]Z,
 RETA[AB] to decodetree
Date: Fri, 12 May 2023 15:41:04 +0100
Message-Id: <20230512144106.3608981-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Convert the single-register pointer-authentication variants of BR,
BLR, RET to decodetree. (BRAA/BLRAA are in a different branch of
the legacy decoder and will be dealt with in the next commit.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |   7 ++
 target/arm/tcg/translate-a64.c | 132 +++++++++++++++++++--------------
 2 files changed, 84 insertions(+), 55 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index aa035f39558..22e3a5cea0c 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -135,3 +135,10 @@ B_cond          0101010 0 ................... 0 cond:4 imm=%imm19
 BR              1101011 0000 11111 000000 rn:5 00000 &r
 BLR             1101011 0001 11111 000000 rn:5 00000 &r
 RET             1101011 0010 11111 000000 rn:5 00000 &r
+
+&braz       rn m
+BRAZ            1101011 0000 11111 00001 m:1 rn:5 11111 &braz   # BRAAZ, BRABZ
+BLRAZ           1101011 0001 11111 00001 m:1 rn:5 11111 &braz   # BLRAAZ, BLRABZ
+
+&reta       m
+RETA            1101011 0010 11111 00001 m:1 11111 11111 &reta  # RETAA, RETAB
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 853a01ac5be..e5b9171313b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1435,6 +1435,75 @@ static bool trans_RET(DisasContext *s, arg_r *a)
     return true;
 }
 
+static TCGv_i64 auth_branch_target(DisasContext *s, TCGv_i64 dst,
+                                   TCGv_i64 modifier, bool use_key_a)
+{
+    TCGv_i64 truedst;
+    /*
+     * Return the branch target for a BRAA/RETA/etc, which is either
+     * just the destination dst, or that value with the pauth check
+     * done and the code removed from the high bits.
+     */
+    if (!s->pauth_active) {
+        return dst;
+    }
+
+    truedst = tcg_temp_new_i64();
+    if (use_key_a) {
+        gen_helper_autia(truedst, cpu_env, dst, modifier);
+    } else {
+        gen_helper_autib(truedst, cpu_env, dst, modifier);
+    }
+    return truedst;
+}
+
+static bool trans_BRAZ(DisasContext *s, arg_braz *a)
+{
+    TCGv_i64 dst;
+
+    if (!dc_isar_feature(aa64_pauth, s)) {
+        return false;
+    }
+
+    dst = auth_branch_target(s, cpu_reg(s, a->rn), tcg_constant_i64(0), !a->m);
+    gen_a64_set_pc(s, dst);
+    set_btype_for_br(s, a->rn);
+    s->base.is_jmp = DISAS_JUMP;
+    return true;
+}
+
+static bool trans_BLRAZ(DisasContext *s, arg_braz *a)
+{
+    TCGv_i64 dst, lr;
+
+    if (!dc_isar_feature(aa64_pauth, s)) {
+        return false;
+    }
+
+    dst = auth_branch_target(s, cpu_reg(s, a->rn), tcg_constant_i64(0), !a->m);
+    lr = cpu_reg(s, 30);
+    if (dst == lr) {
+        TCGv_i64 tmp = tcg_temp_new_i64();
+        tcg_gen_mov_i64(tmp, dst);
+        dst = tmp;
+    }
+    gen_pc_plus_diff(s, lr, curr_insn_len(s));
+    gen_a64_set_pc(s, dst);
+    set_btype_for_blr(s);
+    s->base.is_jmp = DISAS_JUMP;
+    return true;
+}
+
+static bool trans_RETA(DisasContext *s, arg_reta *a)
+{
+    TCGv_i64 dst;
+
+    dst = auth_branch_target(s, cpu_reg(s, 30), cpu_X[31], !a->m);
+    gen_a64_set_pc(s, dst);
+    s->base.is_jmp = DISAS_JUMP;
+    return true;
+}
+
 /* HINT instruction group, including various allocated HINTs */
 static void handle_hint(DisasContext *s, uint32_t insn,
                         unsigned int op1, unsigned int op2, unsigned int crm)
@@ -2227,61 +2296,14 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
     }
 
     switch (opc) {
-    case 0: /* BR */
-    case 1: /* BLR */
-    case 2: /* RET */
-        btype_mod = opc;
-        switch (op3) {
-        case 0:
-            /* BR, BLR, RET : handled in decodetree */
-            goto do_unallocated;
-
-        case 2:
-        case 3:
-            if (!dc_isar_feature(aa64_pauth, s)) {
-                goto do_unallocated;
-            }
-            if (opc == 2) {
-                /* RETAA, RETAB */
-                if (rn != 0x1f || op4 != 0x1f) {
-                    goto do_unallocated;
-                }
-                rn = 30;
-                modifier = cpu_X[31];
-            } else {
-                /* BRAAZ, BRABZ, BLRAAZ, BLRABZ */
-                if (op4 != 0x1f) {
-                    goto do_unallocated;
-                }
-                modifier = tcg_constant_i64(0);
-            }
-            if (s->pauth_active) {
-                dst = tcg_temp_new_i64();
-                if (op3 == 2) {
-                    gen_helper_autia(dst, cpu_env, cpu_reg(s, rn), modifier);
-                } else {
-                    gen_helper_autib(dst, cpu_env, cpu_reg(s, rn), modifier);
-                }
-            } else {
-                dst = cpu_reg(s, rn);
-            }
-            break;
-
-        default:
-            goto do_unallocated;
-        }
-        /* BLR also needs to load return address */
-        if (opc == 1) {
-            TCGv_i64 lr = cpu_reg(s, 30);
-            if (dst == lr) {
-                TCGv_i64 tmp = tcg_temp_new_i64();
-                tcg_gen_mov_i64(tmp, dst);
-                dst = tmp;
-            }
-            gen_pc_plus_diff(s, lr, curr_insn_len(s));
-        }
-        gen_a64_set_pc(s, dst);
-        break;
+    case 0:
+    case 1:
+    case 2:
+        /*
+         * BR, BLR, RET, RETAA, RETAB, BRAAZ, BRABZ, BLRAAZ, BLRABZ:
+         * handled in decodetree
+         */
+        goto do_unallocated;
 
     case 8: /* BRAA */
     case 9: /* BLRAA */
-- 
2.34.1


