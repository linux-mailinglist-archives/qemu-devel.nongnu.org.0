Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485EF3B78D4
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:45:05 +0200 (CEST)
Received: from localhost ([::1]:42670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJfM-0001Dq-AE
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwD-0003xH-Vz
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:26 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwA-0002wu-TR
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:25 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso3081661pjp.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nkUwvYz/H7E5G0Q9SrKLVPmT+1u2d8aWX4+EJ+0VG1o=;
 b=VK8QqAfDxNWf3pwj17kQSMHzB0I7Pr/P3JtXMyAUmY68wabdQvi1VaZ5PB88BWAM9P
 R0ylYoV8SyOHXxWxnZwuwgBaymk4VAebLb1jC45wSzlD8pZG05g+yJLvAue6gu30hU8E
 b7cqxiG/x3LEl4IYpsCyRXw0n1EfpI/AZHJBvSkL7dxhcsSrzCye+JmV4DPbavqmvr3v
 uBsYt8Orq1hPKRdGvXk45QfClFgmAP2XPHRk+46G92Fjfxbi3CqAPX2ZZ0FR3iV71oya
 2f+O+rOBe0fYomBRBlqrzQrgkHeDz5izUTDaZPBIszBrH20KOas7+OYicFvy0c8eHX1N
 EtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nkUwvYz/H7E5G0Q9SrKLVPmT+1u2d8aWX4+EJ+0VG1o=;
 b=Xy+nLWApB6NbatgW91qSFzlepZtSM0wbDHfhQ7bmP7QTwnc52f35r8fPvkVIlRQxAG
 f0GoLkpHZF+NfRhmd8fuF6xGavp31OLbPtrJhP2LPdGOQDjMgCD0cPDoNyknUwWFB+Ao
 En0tu5D/fe+EnoRjFOtzME42+ovFEWm9g5y8wk7LMVmXAWGti2fhgMZ0vE6KvVDg/WrZ
 KCZAky2EsR6kqSMkM8esHVn689C730bHMLp49TqSFchjM7I/QQ6p5HzuPYkhYDVtjJ1j
 QeLMMOOTxXUrWomL2vRRANVHKidA7GBoUX3rNfwjJsUfo/sp+kLpahIzZlY5l0tg2+Ah
 1QiA==
X-Gm-Message-State: AOAM5325xpCiJetO4ve5yO14QLomZRZ4niyGPe7ZNVAqpJ0KihxIVeMP
 veiijcWPY4+qt8x/B3W9w+qQeL/rFm+PMA==
X-Google-Smtp-Source: ABdhPJwtR7/Dgm3TRY8zvC+7cmziNJcDQ/uJFgIMJYbW0T8ryh9K6DG72oZSkWRYtHdK9lFDbRmCKQ==
X-Received: by 2002:a17:902:c602:b029:127:a3a2:4951 with SMTP id
 r2-20020a170902c602b0290127a3a24951mr25460046plr.65.1624993101477; 
 Tue, 29 Jun 2021 11:58:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/63] tcg/ppc: Split out tcg_out_ext{8,16,32}s
Date: Tue, 29 Jun 2021 11:54:32 -0700
Message-Id: <20210629185455.3131172-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly require these in other context;
make the expansion as clear as possible.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 795701442b..aa35ff8250 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -738,6 +738,21 @@ static inline void tcg_out_rlw(TCGContext *s, int op, TCGReg ra, TCGReg rs,
     tcg_out32(s, op | RA(ra) | RS(rs) | SH(sh) | MB(mb) | ME(me));
 }
 
+static inline void tcg_out_ext8s(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out32(s, EXTSB | RA(dst) | RS(src));
+}
+
+static inline void tcg_out_ext16s(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out32(s, EXTSH | RA(dst) | RS(src));
+}
+
+static inline void tcg_out_ext32s(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out32(s, EXTSW | RA(dst) | RS(src));
+}
+
 static inline void tcg_out_ext32u(TCGContext *s, TCGReg dst, TCGReg src)
 {
     tcg_out_rld(s, RLDICL, dst, src, 0, 32);
@@ -2322,7 +2337,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2;
-    int c;
 
     switch (opc) {
     case INDEX_op_exit_tb:
@@ -2390,7 +2404,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld8s_i64:
         tcg_out_mem_long(s, LBZ, LBZX, args[0], args[1], args[2]);
-        tcg_out32(s, EXTSB | RS(args[0]) | RA(args[0]));
+        tcg_out_ext8s(s, args[0], args[0]);
         break;
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16u_i64:
@@ -2728,18 +2742,15 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
-        c = EXTSB;
-        goto gen_ext;
+        tcg_out_ext8s(s, args[0], args[1]);
+        break;
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
-        c = EXTSH;
-        goto gen_ext;
+        tcg_out_ext16s(s, args[0], args[1]);
+        break;
     case INDEX_op_ext_i32_i64:
     case INDEX_op_ext32s_i64:
-        c = EXTSW;
-        goto gen_ext;
-    gen_ext:
-        tcg_out32(s, c | RS(args[1]) | RA(args[0]));
+        tcg_out_ext32s(s, args[0], args[1]);
         break;
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, args[0], args[1]);
-- 
2.25.1


