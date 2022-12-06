Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8A4643C33
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:22:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POh-0003OB-QV; Mon, 05 Dec 2022 23:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POf-0003MW-1t
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:33 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POd-0006y7-Bo
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:32 -0500
Received: by mail-oi1-x235.google.com with SMTP id q186so15574603oia.9
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vl4jY0qCeUzsoqmWnAohVecCt0XdBWnXbPzcSP7167M=;
 b=Telw/ooPfVPgpRTs7xr7RZx6XdWLqTS4q6pLOembtJL7pEF6VQ1Uma+PBLzv9e545H
 /PhNT2pdZVdpOUq+XC7rXc0LLxnuClWLU65hmUHdcr6FpcESMbc3g3rCuyg7vSO7w3sU
 2dk4cMTw1VO6agPG2Bcry4NX4397Ci5YYaVAwTnF+WB7z05UkqUKMyU18uXshsxzgaBo
 bXjF/YimrBiZLVm2g9Toh3umWCVr0MEqhYmFRmdjnbHkLee6yUbm7Q3GcBpy8AwruMIR
 wMbgK6w9ZJqGdpVIC2mr5ApCpz1pmh/JBxbWvZVkoXeLpWEQmhsPQudk5csWprvTlYhS
 nFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vl4jY0qCeUzsoqmWnAohVecCt0XdBWnXbPzcSP7167M=;
 b=RZIOwy21QnvbqIMa/cx9kqW6qB5v/qvZryCknDHl9gz7A5m0NkE/IKNWeAx0sjj4v3
 4L8WLALps74cFTZmjhVqUb61+oh8QsF7mAny58+HJ+MNiT8Y11fxKnNgA5qh/o8xdnVs
 coxpf1lGXGXyKt2eSwm5SD/0yEs0F/9V6/cJFyTc6QeLWivczePf8+PHASfsBuGSmefE
 jfgU6+iNIRVgrsxSw7/DQdvsqNNmpEmt5o9pnnzoN/wYX9Oyp5P8RFOv5JiDCcUfa/0N
 ajhrykOnhx52Sp/SrGywvftCOwv0sGlmlH+5jlHrRjJPktRdTzkp7z7z1noNhJvUSYfU
 59zA==
X-Gm-Message-State: ANoB5pmp+hjhQYs0F1ks751oqbOLuCduptvCQFf3WdAtVRWfnkX3x9fQ
 L9B/NYaX9Ql3z5+xDglrHJC48tJ0WKJRgeavRhU=
X-Google-Smtp-Source: AA0mqf48bU8VVD8GTdKLDFwWaSRo6IEaMiiM85eMpbCik0V7JJfADnq5Im1uHiB3moEbCp6iWUvy0A==
X-Received: by 2002:aca:38c6:0:b0:35b:cf0f:59e7 with SMTP id
 f189-20020aca38c6000000b0035bcf0f59e7mr14406875oia.2.1670300250056; 
 Mon, 05 Dec 2022 20:17:30 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 09/22] tcg: Rename TB_JMP_RESET_OFFSET_INVALID to
 TB_JMP_OFFSET_INVALID
Date: Mon,  5 Dec 2022 22:17:02 -0600
Message-Id: <20221206041715.314209-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 2 +-
 accel/tcg/translate-all.c | 8 ++++----
 tcg/tcg.c                 | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9b7bfbf09a..7566ad9e7f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -575,8 +575,8 @@ struct TranslationBlock {
      * setting one of the jump targets (or patching the jump instruction). Only
      * two of such jumps are supported.
      */
+#define TB_JMP_OFFSET_INVALID 0xffff /* indicates no jump generated */
     uint16_t jmp_reset_offset[2]; /* offset of original jump target */
-#define TB_JMP_RESET_OFFSET_INVALID 0xffff /* indicates no jump generated */
     uintptr_t jmp_target_arg[2];  /* target address or offset */
 
     /*
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ac3ee3740c..9cf88da6cb 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -979,10 +979,10 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
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
 
@@ -1164,9 +1164,9 @@ static gboolean tb_tree_stats_iter(gpointer key, gpointer value, gpointer data)
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
index d334f95375..37957208c7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4250,8 +4250,8 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
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


