Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4A2661C0D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:44:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBm-0000ml-0m; Sun, 08 Jan 2023 20:43:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBk-0000mN-UH
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:00 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBj-0001XZ-C7
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:00 -0500
Received: by mail-pl1-x62e.google.com with SMTP id jn22so7927649plb.13
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NWiFXNj6R/76TLM7GNYc4jJNs/0+KnaQLuUilm2f5p4=;
 b=HFprXzECG0BGuFPIJO+kfDkINr6KVgS2QisMXH6QfikJGIIbf5bmWQCF/GuOwG2+Ss
 K2pNT6nJmvnp/2qNyDG8wb2gc3qyBjTkto79caN/a5QkozOTt4PpbtQj3EDyjIs5Dmzd
 ld5y3X+/6cz9BrEdomFsvZ8mgZs/g5c8yi4Kn1lzsJUV2YzrdMeDHWlcFT5f3fmGIim+
 2VeD6we9DDx0aBnfKFhwzAugefFuGVzB95miObLyt4+FYXwr/bz/0X4zBemN2sdCIobE
 Csw0ERJaHjJsEqR5n7EYV9a5HcrCh6YKl4fSWWLbNI1y4R+oM5uguDPTsAeMyN7cGHbA
 iB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NWiFXNj6R/76TLM7GNYc4jJNs/0+KnaQLuUilm2f5p4=;
 b=j+nI7Yd4lqPR/9Hh2gBec8c6XMHuqdgHaEXnHuQUfsrxtb9Fek3jKm/ClA5QVpqtME
 /80xcSLREYskDPwcs/EkfiQf1HwHkRsrbKcGNsbGe1YXTLYRn7H3QkCXccci9pphG5YY
 ohaIR08IN1y+KdPGT/rM2h0nsYlwT74RjSyoTOI5mQw6vWw3oOJXPlmi5YtXDgu1pRJ9
 95zH9pUs/vpXFe7HLSwNJvxBin9A1zA/y3VEPKKCP+uhLCo8uzBWVRvpDFwh4ouu91/G
 FXdqMRMe/Nu6L1aAsxExwScDFZhYP0zSDGbVHhbDnqACu/KRM42I+r+41UT4y1lnST12
 z+8Q==
X-Gm-Message-State: AFqh2kppviLvdRlsUfjwr14K7jfoNweAL7yxAdsDOxfm6F2CygJL4QNj
 E5veAxgHppdwNhSALpyaekIVbVST9HIvV+fA
X-Google-Smtp-Source: AMrXdXtWkLrUYjZdldxwntLqI6DEnHH/F6Kfw5BraB740B5I6ABbl8mLsx3ekDmEWvHw2QC7k6uJqw==
X-Received: by 2002:a17:902:c1c9:b0:192:6544:18b0 with SMTP id
 c9-20020a170902c1c900b00192654418b0mr57161669plc.63.1673228578071; 
 Sun, 08 Jan 2023 17:42:58 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:42:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/22] tcg: Rename TB_JMP_RESET_OFFSET_INVALID to
 TB_JMP_OFFSET_INVALID
Date: Sun,  8 Jan 2023 17:42:35 -0800
Message-Id: <20230109014248.2894281-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

This will shortly be used for more than reset.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 2 +-
 accel/tcg/translate-all.c | 8 ++++----
 tcg/tcg.c                 | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 25e11b0a8d..b4d09c89ab 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -585,8 +585,8 @@ struct TranslationBlock {
      * setting one of the jump targets (or patching the jump instruction). Only
      * two of such jumps are supported.
      */
+#define TB_JMP_OFFSET_INVALID 0xffff /* indicates no jump generated */
     uint16_t jmp_reset_offset[2]; /* offset of original jump target */
-#define TB_JMP_RESET_OFFSET_INVALID 0xffff /* indicates no jump generated */
     uintptr_t jmp_target_arg[2];  /* target address or offset */
 
     /*
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 51ac1f6c84..99c81e9691 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -501,10 +501,10 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->jmp_dest[1] = (uintptr_t)NULL;
 
     /* init original jump addresses which have been set during tcg_gen_code() */
-    if (tb->jmp_reset_offset[0] != TB_JMP_RESET_OFFSET_INVALID) {
+    if (tb->jmp_reset_offset[0] != TB_JMP_OFFSET_INVALID) {
         tb_reset_jump(tb, 0);
     }
-    if (tb->jmp_reset_offset[1] != TB_JMP_RESET_OFFSET_INVALID) {
+    if (tb->jmp_reset_offset[1] != TB_JMP_OFFSET_INVALID) {
         tb_reset_jump(tb, 1);
     }
 
@@ -686,9 +686,9 @@ static gboolean tb_tree_stats_iter(gpointer key, gpointer value, gpointer data)
     if (tb_page_addr1(tb) != -1) {
         tst->cross_page++;
     }
-    if (tb->jmp_reset_offset[0] != TB_JMP_RESET_OFFSET_INVALID) {
+    if (tb->jmp_reset_offset[0] != TB_JMP_OFFSET_INVALID) {
         tst->direct_jmp_count++;
-        if (tb->jmp_reset_offset[1] != TB_JMP_RESET_OFFSET_INVALID) {
+        if (tb->jmp_reset_offset[1] != TB_JMP_OFFSET_INVALID) {
             tst->direct_jmp2_count++;
         }
     }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 467604efa3..8c35a40eb3 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4664,8 +4664,8 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
 #endif
 
     /* Initialize goto_tb jump offsets. */
-    tb->jmp_reset_offset[0] = TB_JMP_RESET_OFFSET_INVALID;
-    tb->jmp_reset_offset[1] = TB_JMP_RESET_OFFSET_INVALID;
+    tb->jmp_reset_offset[0] = TB_JMP_OFFSET_INVALID;
+    tb->jmp_reset_offset[1] = TB_JMP_OFFSET_INVALID;
     tcg_ctx->tb_jmp_reset_offset = tb->jmp_reset_offset;
     if (TCG_TARGET_HAS_direct_jump) {
         tcg_ctx->tb_jmp_insn_offset = tb->jmp_target_arg;
-- 
2.34.1


