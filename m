Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3122E2522E1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 23:33:05 +0200 (CEST)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAgYy-0002hW-6L
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 17:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg3p-0008Kk-DJ
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:53 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg3n-0001vP-Dz
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:53 -0400
Received: by mail-pf1-x441.google.com with SMTP id t9so4127755pfq.8
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 14:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W2BW1I6HkGHTMtHfmJz96M6DpNmBNEMsH2Tt6EuxiQM=;
 b=dk1uiILb8BTy8RHzHra9B1Jw4LAAEAOUMir09XvE2eYsTA3WUn/vfLM65I2KFftma5
 T07iAKmJn0gHcbddm1oHczPmmD3JEeJgAjutrA+KTCkKhKBLvjptt0SvUMe+xdioQs9/
 4kFyBYm2NPHcXWqheqHO0jHM1U6nP1WMv8boubBeUdgulNdDyzuTwkf7hR+tfJ5wNQsK
 nQ9XPp2Ad1y+XgFNHYO+ZN4V2jtGTCxwvDg7ExnTL48Lgsj8wnYpTYGHePbDGUHbm0NQ
 N4aaUrdOBQuY4xOuTm/2iowV9SaNA5iH4LEOSBWM3r+T1ZSTYEByrl19eQ9vQKvxkMPq
 4gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W2BW1I6HkGHTMtHfmJz96M6DpNmBNEMsH2Tt6EuxiQM=;
 b=dGlKPwGPuXFdVUhpAqSrtFZ/B5now13ekC5sVgGjHa7Vi5xvn+JHVKyNJhXjtzl1W2
 1yYuZ2n+vo3O7/KQfTSKG6qa9lV9JCsS6c6QNDv/8m0SLHey/+ogxj2vgc+3macklJdH
 31jm3hLMb3sNzfTDonJhnmcbQR/89QNbVoyojWCn0VoUiPjxTjq7w8hh/K0bKNBw9Atf
 bnzshdnyL3JiqLD8stzDo3Y5DK89Kyi3yqnFRFIxJAOeJxgPcU0/b/c/wz1P3nAdTR3a
 GqgbQ8KY6GiINFA16xwdUXD+PB3g7yqqKaVpqhHEg2NFmlzLnu7w8s4PtkrxnKxFNpDL
 IuuA==
X-Gm-Message-State: AOAM533UKGf/vuzeZoTzOjO8scTzG7mAhZh2EvVC4ruZZQDW5WTKAcGj
 YpDk/Qq85j8lJFDQmyQ183QWLjIdECnMig==
X-Google-Smtp-Source: ABdhPJxIZ/FwoiRv9socCH2Soi1rHc1bisT+Dd7z/8niwstovSZSbuDnx22UJ3XCENYM6zT6w0cO9A==
X-Received: by 2002:a63:c62:: with SMTP id 34mr7894863pgm.377.1598389249660;
 Tue, 25 Aug 2020 14:00:49 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id k4sm16074pgr.87.2020.08.25.14.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:00:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 46/77] target/microblaze: Convert dec_imm to decodetree
Date: Tue, 25 Aug 2020 13:59:19 -0700
Message-Id: <20200825205950.730499-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825205950.730499-1-richard.henderson@linaro.org>
References: <20200825205950.730499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/insns.decode |  2 ++
 target/microblaze/translate.c  | 18 +++++++++---------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/microblaze/insns.decode b/target/microblaze/insns.decode
index 31e50549ea..a7eb7d4e6f 100644
--- a/target/microblaze/insns.decode
+++ b/target/microblaze/insns.decode
@@ -76,6 +76,8 @@ cmpu            000101 ..... ..... ..... 000 0000 0011  @typea
 idiv            010010 ..... ..... ..... 000 0000 0000  @typea
 idivu           010010 ..... ..... ..... 000 0000 0010  @typea
 
+imm             101100 00000 00000 imm:16
+
 mul             010000 ..... ..... ..... 000 0000 0000  @typea
 mulh            010000 ..... ..... ..... 000 0000 0001  @typea
 mulhu           010000 ..... ..... ..... 000 0000 0011  @typea
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 8fdd03fb5a..c1d19f4678 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -477,6 +477,15 @@ static void gen_idivu(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 DO_TYPEA_CFG(idiv, use_div, true, gen_idiv)
 DO_TYPEA_CFG(idivu, use_div, true, gen_idivu)
 
+static bool trans_imm(DisasContext *dc, arg_imm *arg)
+{
+    dc->ext_imm = arg->imm << 16;
+    tcg_gen_movi_i32(cpu_imm, dc->ext_imm);
+    dc->tb_flags |= IMM_FLAG;
+    dc->clear_imm = 0;
+    return true;
+}
+
 static void gen_mulh(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
@@ -834,14 +843,6 @@ static inline void sync_jmpstate(DisasContext *dc)
     }
 }
 
-static void dec_imm(DisasContext *dc)
-{
-    dc->ext_imm = dc->imm << 16;
-    tcg_gen_movi_i32(cpu_imm, dc->ext_imm);
-    dc->tb_flags |= IMM_FLAG;
-    dc->clear_imm = 0;
-}
-
 static inline void compute_ldst_addr(DisasContext *dc, bool ea, TCGv t)
 {
     /* Should be set to true if r1 is used by loadstores.  */
@@ -1547,7 +1548,6 @@ static struct decoder_info {
 } decinfo[] = {
     {DEC_LD, dec_load},
     {DEC_ST, dec_store},
-    {DEC_IMM, dec_imm},
     {DEC_BR, dec_br},
     {DEC_BCC, dec_bcc},
     {DEC_RTS, dec_rts},
-- 
2.25.1


