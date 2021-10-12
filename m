Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E891342A96E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:30:39 +0200 (CEST)
Received: from localhost ([::1]:39266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKfm-0003Ko-Pj
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXm-0006tQ-DF
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:22 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXk-0004DK-Fv
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:22 -0400
Received: by mail-pg1-x531.google.com with SMTP id r201so14340753pgr.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KpJskJGYG8NwOwmiH2Iu6UhY3Zn5zWd+0hF4Ppw0hnM=;
 b=P2JX9NcqR9R9sJ10TUPmFcTmeWIoDAlBw3L0qaLGafmBiFA3xrR3zDq5kSHzIMfPel
 Ga3XW9U1/nf64gfjaVHtx0UreRll658cqEi2Ceyx+89P+G/8FBfa/I04IiWnkGTKy+cJ
 eQopVOpWlBA67r0dGGN/rF6DlesxVUjqt5oRDiHZMrBF1Ar2hB9FaT3nYIXn1d8XCIsn
 YeYpz0dDUgNxPJwVFFiPokMHo9LWfIdvc0LyHDzS6yetpJxVaM4dXUlQMmPEari7Ttr1
 Vq0uv3HzqyqvDvMlZTDE3GbA2Se2ik+OtY1tGwaXpL/pkPAFZ7p7wr0NvzUNm/30yvIg
 aM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KpJskJGYG8NwOwmiH2Iu6UhY3Zn5zWd+0hF4Ppw0hnM=;
 b=g+BiI4zid8xQwKm7ZKhTdyy8aq7rwJfiqsC3v7odbqpby+nNIohMljCSUNWzTZ25g3
 fyMMXQuaahDOsxLLm3HfyUop7UkBKzfvk+5gktqJa5RFmkYeQP50D6FO+//J3wBWz7sM
 pKj5yNYxd9Mj2qxQ432kYBeZY3VpErF+OjSV7NzlisbuJ0d35Kc2mUQ/LW8JvTwHaBlC
 DhuJf7mbKYENc90voHji1fJvhVYeQ91hFS5tb2lNukd/oyv3pdJqYoFbbQ9TCB+lNzDG
 /pe+3awGlJedFmxr3Y+FyEN5o4UvJ2tl3cMAHJPyBvlfdRqKyX1F4EksFOJ7e+cbRkJD
 Igbw==
X-Gm-Message-State: AOAM532bNjIk6kANWYOEGr2PgfTkOVFcBlcJxMnP86FGTNeGrL7PIg5Y
 HnSUqCwEAwJuuMq2d4FFig14W2hrd5+mPw==
X-Google-Smtp-Source: ABdhPJzm+ZRX/sZhW7+wv57k9o55HXJLDSy88lE7jqAQcA1OLMNUgukqLdyshePexMSkIHG0MSepXQ==
X-Received: by 2002:aa7:978b:0:b0:44c:abf1:a8b8 with SMTP id
 o11-20020aa7978b000000b0044cabf1a8b8mr32699395pfp.35.1634055739093; 
 Tue, 12 Oct 2021 09:22:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/23] target/xtensa: Drop check for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:59 -0700
Message-Id: <20211012162159.471406-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index dcf6b500ef..09430c1bf9 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -382,18 +382,14 @@ static void gen_jump_slot(DisasContext *dc, TCGv dest, int slot)
     if (dc->icount) {
         tcg_gen_mov_i32(cpu_SR[ICOUNT], dc->next_icount);
     }
-    if (dc->base.singlestep_enabled) {
-        gen_exception(dc, EXCP_DEBUG);
+    if (dc->op_flags & XTENSA_OP_POSTPROCESS) {
+        slot = gen_postprocess(dc, slot);
+    }
+    if (slot >= 0) {
+        tcg_gen_goto_tb(slot);
+        tcg_gen_exit_tb(dc->base.tb, slot);
     } else {
-        if (dc->op_flags & XTENSA_OP_POSTPROCESS) {
-            slot = gen_postprocess(dc, slot);
-        }
-        if (slot >= 0) {
-            tcg_gen_goto_tb(slot);
-            tcg_gen_exit_tb(dc->base.tb, slot);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
     }
     dc->base.is_jmp = DISAS_NORETURN;
 }
@@ -1293,12 +1289,7 @@ static void xtensa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
-        if (dc->base.singlestep_enabled) {
-            tcg_gen_movi_i32(cpu_pc, dc->pc);
-            gen_exception(dc, EXCP_DEBUG);
-        } else {
-            gen_jumpi(dc, dc->pc, 0);
-        }
+        gen_jumpi(dc, dc->pc, 0);
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


