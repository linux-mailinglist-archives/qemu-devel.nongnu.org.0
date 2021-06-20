Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45423ADD37
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 07:27:17 +0200 (CEST)
Received: from localhost ([::1]:43850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lupzI-0000bJ-Ui
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 01:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxt-0006zG-KN
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:49 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxr-00085e-0V
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:49 -0400
Received: by mail-pg1-x534.google.com with SMTP id n12so2599741pgs.13
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 22:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pGPuQ96khA6BN7ttYpkCEpnz8SyOo+2mAqDfZ6XIx6k=;
 b=tifq7i5T+DiJ5HC4Y/B8fUo0N8oNUvy6KY2Q5Sz5oU+fZYQRl2xITD0/O+EygaZhU1
 dRL4zOtpXHUOeM9LYb5EOOIeSIzyxFnVDTYnB1xLq+un0b2MWTheOwRDXVwpFCbrwWek
 9hJgCcaFQgXIsovQBfmHoYIPjue2hFLJLbyI/9nnmJxnyie8l1HFybZ8nuZbuaxWPFgH
 2cZRrmfC1fR2i3W9q8udSSkqwLfs+0l5yZNkReOyJwpzgxbkrwvAgDNgoUCtCWDFAgXn
 Wr9KDyS/xK2m/lau7/0DeEsHa+5C0kTBBtuqCfgO1vPspdCDM393LcNKWHb+lZQwp924
 Xfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pGPuQ96khA6BN7ttYpkCEpnz8SyOo+2mAqDfZ6XIx6k=;
 b=HQ94Fl4hJZEBQ1zcD2lvR2wnxHJ/fYg4GKyn6XmEMM8uHP+A+Fpj3KAJgZ0SQRaqx5
 HtdtQKaX5WQv6AwVKNTLNrF2CMb5tpea8TTqWf836Kl2FxK9av6ipGoprSVdDlA8v2rE
 Y2k43scGwSkkH2QppMSJzC9cP9KcwhE44Ie3NAwDD/GTm9WtwLcq50tzf4x46SY49VSx
 5pRtiAagDNJhPjtcGloXavYUDrkzMBKDOyjHK4UDv8idpQ1o7tKkKhCmWuWV5Q1guuEY
 P+wg/Zy99SG7HYCdFRsPGYk53rQBTZfcYDQlTcYU8AEhIJ/AooGb+EVBYXFSqZkW1/fe
 xR7Q==
X-Gm-Message-State: AOAM532FWdugaz1Lp42vxO55ZPHHjoJuWbIn8W7OeDIfVxn3NSKMM5Ya
 qTFRtMrszd+JSAPQDcCYyiAZ3ASMdN9Fzw==
X-Google-Smtp-Source: ABdhPJxgGHBC9EbQqEaampSYcQibNjvXyJdSUP6PNDD+/4mgjCMC6dF/1nbqrz+RMxB8+ixjdt4Sbw==
X-Received: by 2002:aa7:9ed2:0:b029:2fc:b328:ad67 with SMTP id
 r18-20020aa79ed20000b02902fcb328ad67mr13518330pfq.63.1624166745409; 
 Sat, 19 Jun 2021 22:25:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm11409741pfh.103.2021.06.19.22.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 22:25:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] target/nios2: Replace DISAS_TB_JUMP with DISAS_NORETURN
Date: Sat, 19 Jun 2021 22:25:37 -0700
Message-Id: <20210620052543.1315091-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620052543.1315091-1-richard.henderson@linaro.org>
References: <20210620052543.1315091-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only semantic of DISAS_TB_JUMP is that we've done goto_tb,
which is the same as DISAS_NORETURN -- we've exited the tb.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 399f22d938..388fae93a2 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -37,7 +37,6 @@
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
-#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
 
 #define INSTRUCTION_FLG(func, flags) { (func), (flags) }
 #define INSTRUCTION(func)                  \
@@ -209,7 +208,7 @@ static void jmpi(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     J_TYPE(instr, code);
     gen_goto_tb(dc, 0, (dc->pc & 0xF0000000) | (instr.imm26 << 2));
-    dc->is_jmp = DISAS_TB_JUMP;
+    dc->is_jmp = DISAS_NORETURN;
 }
 
 static void call(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -269,7 +268,7 @@ static void br(DisasContext *dc, uint32_t code, uint32_t flags)
     I_TYPE(instr, code);
 
     gen_goto_tb(dc, 0, dc->pc + 4 + (instr.imm16.s & -4));
-    dc->is_jmp = DISAS_TB_JUMP;
+    dc->is_jmp = DISAS_NORETURN;
 }
 
 static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -281,7 +280,7 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
     gen_goto_tb(dc, 0, dc->pc + 4);
     gen_set_label(l1);
     gen_goto_tb(dc, 1, dc->pc + 4 + (instr.imm16.s & -4));
-    dc->is_jmp = DISAS_TB_JUMP;
+    dc->is_jmp = DISAS_NORETURN;
 }
 
 /* Comparison instructions */
@@ -883,7 +882,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
         break;
 
     case DISAS_NORETURN:
-    case DISAS_TB_JUMP:
         /* nothing more to generate */
         break;
     }
-- 
2.25.1


