Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD677670CE6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:13:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv6u-0003VM-OT; Tue, 17 Jan 2023 18:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6m-0003TC-Q6
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:12 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6l-0001Kp-7q
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:12 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 7so23209682pga.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ziMP/fEP9bVzsZekB/BH6o4sM8gyTo9c+rdlYUkKqo=;
 b=oQfOFQH77vO5tdjp3YlF+9TO1rGEOk+m4ti3MilPBvqBk3PWA5sQU3XDKDg1IRV08K
 0RhFxd8GgJ8dpeR6ELjDB+YaGDvTol9aLqyzsTSwk7RchIX/J7BIzCPCTCWmt5u4soHT
 Pv81UyJeFasRj767YxHgzQhNQ/Tk9f/ASA5RD3fSleLXZFVBITQgOYzm0oXv/KHEFnLH
 WIQyacEzsa0YULj91UoxgXJX9ZneAmx/lItmEaHuXP4RJV2XJYkkHvZqgOU4F/dhCJBL
 VXrSj1UjOPzPiXjL4OKt4tbjnFn/Ab3tBS87HSQhrzrN8rgL+AI8o0eNmb1yRAnpJyFO
 YgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ziMP/fEP9bVzsZekB/BH6o4sM8gyTo9c+rdlYUkKqo=;
 b=r0zII5Vmkkb8M0cy1v3b0O2hhxiU2xpw6qBwgbo0Xilei+0G/xFXAfXm8dbhpMMExT
 OexSNEo2okuXJ1TAM1eD35XKmwWIv+fAAMfehbbB5OaA0/AQ4dVN5OsoMBTVBUe5XFQG
 l7JC5GIHBPpbbmBmopotoxgjpCn0eLF5qqL2v8Kjxfsv6YMPTlEDwtAn69VDev0i3B7J
 wdk374oHVp9iiHGOWMtLEaoASRsORkc2QcRQ7j+ol57q2GU5YK7cBXCDIGLbuLyatCqO
 2rSUXswrsvkwl3+K+P7iUC5oXvPwHDD0/D7PyzbtjFrwkUz/BOSSYP3F2JAgivDRE+Qu
 GdBw==
X-Gm-Message-State: AFqh2kpspILo8VxiBZ8e2Se+gEd1guaVmYi0vDclSt6ZydLinrKhPSqv
 /EYns/yv17qoHtnHbbVIvhRg1WgOQneWGoWC
X-Google-Smtp-Source: AMrXdXv8SPRJCQBoMp8ZBi9wLzVdbSnnTtXirl+/M2I0OvTluZbQ/DSt9zP/6uFAjiViKJBDSW9F6A==
X-Received: by 2002:aa7:9569:0:b0:58b:97f2:2e3b with SMTP id
 x9-20020aa79569000000b0058b97f22e3bmr5597785pfq.1.1673997069994; 
 Tue, 17 Jan 2023 15:11:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/22] tcg: Rename TB_JMP_RESET_OFFSET_INVALID to
 TB_JMP_OFFSET_INVALID
Date: Tue, 17 Jan 2023 13:10:38 -1000
Message-Id: <20230117231051.354444-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
index 979f8e1107..a4fdce5b72 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -508,10 +508,10 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
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
 
@@ -693,9 +693,9 @@ static gboolean tb_tree_stats_iter(gpointer key, gpointer value, gpointer data)
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
index ffa4506e57..ff674c5122 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4666,8 +4666,8 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
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


