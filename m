Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF4359CCBE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:05:32 +0200 (CEST)
Received: from localhost ([::1]:45364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHQA-0005ik-I7
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvZ-0006AI-6h
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:56 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvW-0007FY-9u
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:52 -0400
Received: by mail-pf1-x436.google.com with SMTP id y141so11832834pfb.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=cs9G+21OdHQdLobnzvJt7VPWHa06hM37G+iQ/J7TZ4Y=;
 b=p6j0dpO8Jcr0jWfqc1LCZCxge97eUR6eVbEnM4r1V+OmzxVc/FLlke/+jPM+0iP+nb
 lzBeuh82hlWbfztqxNO1RfslzHDkmTVDFRoobbrcS1SBmZ4Ka578mZLtSqThUXAS9Sol
 5E0BeUM91dryKPtlDKM/BW1txu2/o639xQn3jh3L/l7EiaUxnj/u69qpbxu0dE/tgebm
 8d1sN8lxcqZCrEobfaoeSbQQE7fuOmnuXmIISLnDSjGZGdBH7nMKDnk6zfzNlxsLUOlE
 2o1jplmU+Bz9/8PkHCxoMKaQgBVD+LOVJOti5jgzL86OYiEqWh1XybxZxsMMyuhUQAFb
 qbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=cs9G+21OdHQdLobnzvJt7VPWHa06hM37G+iQ/J7TZ4Y=;
 b=CvW5/3O04ypx/Rg8CcDLLnrDMDf9IdqOeHyG+oFv6StdyXnB7sAa2VO7ESF5Kfu5xS
 Kr0TYJKE8cTeoLnaJEnnMw/hmN+KJE/auHQr/NmILT4GalzNgEwJsyVczRNzvUHtsuBE
 ZtyhrZpKAkshXWg2cE/NkHOkSAQHlU0fpu9js/vDcaiM5YioSQU0XiBDpnkIORdujqiU
 t2VPkSE6j7T6UawDaB5uy/uBh3NygP/oEsIfQWyAhWHkcjDfD7KO1XgcL4IkebfFlAHJ
 gXDAQKjxF14ZtHZ/CkiVXQY5wRlxYRswsirs364xxRON43ZCBAHjZiVCVadeMP4ZhkgN
 K//Q==
X-Gm-Message-State: ACgBeo2MPTpYG+Ljtwl8a/N//8HyNeffGNNJBIYerm+uDzA1VBx4QF0X
 iaZjQHd1N5HxDt3ndYbNNQ63aPDL8Sk9Mg==
X-Google-Smtp-Source: AA6agR5cMwjw7c43uTS1eCLeF5Qs6Tz80uH41H3sOi3ztRDogIryrAaaIirdfe6DEZ1650J1bplRtw==
X-Received: by 2002:a05:6a00:10ca:b0:536:ec31:827c with SMTP id
 d10-20020a056a0010ca00b00536ec31827cmr1982664pfu.67.1661211225455; 
 Mon, 22 Aug 2022 16:33:45 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/22] target/i386: Use gen_jmp_rel for gen_repz*
Date: Mon, 22 Aug 2022 16:33:15 -0700
Message-Id: <20220822233318.1728621-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Subtract cur_insn_len to restart the current insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 6d6c751c10..67c803263b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -224,7 +224,6 @@ STUB_HELPER(wrmsr, TCGv_env env)
 
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s);
-static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
 static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
@@ -1277,7 +1276,7 @@ static void gen_repz(DisasContext *s, MemOp ot,
     if (s->repz_opt) {
         gen_op_jz_ecx(s, s->aflag, l2);
     }
-    gen_jmp(s, s->base.pc_next - s->cs_base);
+    gen_jmp_rel(s, MO_32, -cur_insn_len(s), 0);
 }
 
 #define GEN_REPZ(op) \
@@ -1297,7 +1296,7 @@ static void gen_repz2(DisasContext *s, MemOp ot, int nz,
     if (s->repz_opt) {
         gen_op_jz_ecx(s, s->aflag, l2);
     }
-    gen_jmp(s, s->base.pc_next - s->cs_base);
+    gen_jmp_rel(s, MO_32, -cur_insn_len(s), 0);
 }
 
 #define GEN_REPZ2(op) \
@@ -2751,11 +2750,6 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
     gen_jmp_tb(s, dest, tb_num);
 }
 
-static void gen_jmp(DisasContext *s, target_ulong eip)
-{
-    gen_jmp_tb(s, eip, 0);
-}
-
 static inline void gen_ldq_env_A0(DisasContext *s, int offset)
 {
     tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEUQ);
-- 
2.34.1


