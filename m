Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525EE5F1CE5
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:39:58 +0200 (CEST)
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeden-0000nV-DR
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCR-0003KW-ON
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:39 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:38575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCM-0004Gy-Ih
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:39 -0400
Received: by mail-qt1-x830.google.com with SMTP id y2so4222387qtv.5
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OLD+HERileW1Kbxz0rqzR3vTYEr20m7NXUljApHgnPc=;
 b=NL4g2N0M9mUp6n4gEXHPEZ1JykurzZswoWIWhj6/5i3ymA8VN/M3wfSAIs600H0SpD
 ty3J6iRPH0w0+d5lKGZ/eebjaftf5R5SN9/9oBlFQjqzI52cfYkh11sJWqnwkD8KzUbC
 pbeBZCEJm00Rq42dt9p9PXIwdOpG7azRRJDbvERXKWcQMQsZ9PhEHYrwuTUZ6XDVjd7B
 WY/slogG9fbaxJofqlcIJCOYoRCLs73bgDuU2vEBRRDsNsqIstLRVyLMC7NSt/uq2qFv
 m+Iad2AwbgKsoSVTkIvrGnDaGE13ZO/OjjpgEsFBqHzOUir5A1iLiWWXf7S7+sLHZj9U
 YVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OLD+HERileW1Kbxz0rqzR3vTYEr20m7NXUljApHgnPc=;
 b=KOF6rgKGrFkV6XMvJnygqN4rhiBDhLtGsbG3s0ZzTfesUgjwhz23eUOUk4tE5ZHBEg
 c7OoH/lLRHG9o+BfxmMfQhg5/eW9aUw02Xg5kMMHq2beXXrFvDtz9d7sCTXfL+rFnzQh
 0ZJ8l/rIsut/NtjdBtVQkg7PZOSgmR6XihuyfhMh6Gef9DhRueeJnfJ4cTY0VsU67JBq
 Pj8px/2ySD6k4bXm+FOR/nap+7rW3pY8MJIdNayi8PqRetkmYbT+Y+0kfjtImMp9kI4O
 yyUj1I8Gs79pabBYWN3yNQr0gA+WWNCuzmpMNj9tguAApKKqM7kdDy6lvf+WiHkxU57H
 yNEw==
X-Gm-Message-State: ACrzQf3Sd0Y7E4MOzwOh31YBtln2/yO//pNyddzrpnxDzUyfMI3mDl+G
 Jy2pnf1ueR31HpYPmkWbpE7GJURYEpQ+fygs
X-Google-Smtp-Source: AMsMyM6e5OYRh8y3/4jDRJQ0kD4GBFXvUxAQPdbbRQ+qauD2KtZyisWUqHUz7PkDXCZLRJzStp2/xw==
X-Received: by 2002:ac8:7f91:0:b0:35b:b968:bfc9 with SMTP id
 z17-20020ac87f91000000b0035bb968bfc9mr10679864qtj.332.1664633432905; 
 Sat, 01 Oct 2022 07:10:32 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 22/26] target/i386: Merge gen_jmp_tb and gen_goto_tb into
 gen_jmp_rel
Date: Sat,  1 Oct 2022 07:09:31 -0700
Message-Id: <20221001140935.465607-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These functions have only one caller, and the logic is more
obvious this way.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 50 +++++++++++++------------------------
 1 file changed, 17 insertions(+), 33 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9294f12f66..2e7b94700b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -224,7 +224,6 @@ STUB_HELPER(wrmsr, TCGv_env env)
 
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s);
-static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
 static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num);
 static void gen_jmp_rel_csize(DisasContext *s, int diff, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
@@ -2393,23 +2392,6 @@ static inline int insn_const_size(MemOp ot)
     }
 }
 
-static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
-{
-    target_ulong pc = s->cs_base + eip;
-
-    if (translator_use_goto_tb(&s->base, pc))  {
-        /* jump to same page: we can use a direct jump */
-        tcg_gen_goto_tb(tb_num);
-        gen_jmp_im(s, eip);
-        tcg_gen_exit_tb(s->base.tb, tb_num);
-        s->base.is_jmp = DISAS_NORETURN;
-    } else {
-        /* jump to another page */
-        gen_jmp_im(s, eip);
-        gen_jr(s);
-    }
-}
-
 static void gen_jcc(DisasContext *s, int b, int diff)
 {
     TCGLabel *l1 = gen_new_label();
@@ -2762,20 +2744,6 @@ static void gen_jr(DisasContext *s)
     do_gen_eob_worker(s, false, false, true);
 }
 
-/* generate a jump to eip. No segment change must happen before as a
-   direct call to the next block may occur */
-static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num)
-{
-    gen_update_cc_op(s);
-    set_cc_op(s, CC_OP_DYNAMIC);
-    if (s->jmp_opt) {
-        gen_goto_tb(s, tb_num, eip);
-    } else {
-        gen_jmp_im(s, eip);
-        gen_eob(s);
-    }
-}
-
 /* Jump to eip+diff, truncating the result to OT. */
 static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
 {
@@ -2789,7 +2757,23 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
             dest &= 0xffffffff;
         }
     }
-    gen_jmp_tb(s, dest, tb_num);
+
+    gen_update_cc_op(s);
+    set_cc_op(s, CC_OP_DYNAMIC);
+    if (!s->jmp_opt) {
+        gen_jmp_im(s, dest);
+        gen_eob(s);
+    } else if (translator_use_goto_tb(&s->base, dest))  {
+        /* jump to same page: we can use a direct jump */
+        tcg_gen_goto_tb(tb_num);
+        gen_jmp_im(s, dest);
+        tcg_gen_exit_tb(s->base.tb, tb_num);
+        s->base.is_jmp = DISAS_NORETURN;
+    } else {
+        /* jump to another page */
+        gen_jmp_im(s, dest);
+        gen_jr(s);
+    }
 }
 
 /* Jump to eip+diff, truncating to the current code size. */
-- 
2.34.1


