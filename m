Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C643B4D24
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:38:15 +0200 (CEST)
Received: from localhost ([::1]:46564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx1xG-0004gT-0m
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vj-0001n1-Aa
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:39 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vh-0000Gr-MP
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:39 -0400
Received: by mail-pg1-x529.google.com with SMTP id e20so10157339pgg.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5hj2jHGsUae2xyTC0V7a9OUN2nIitdGO7+9Oib2CAok=;
 b=HothSubfeucbUatM8aEu0iRFGlCMwOJvCfdAFr2TomI8StZrFadV29uGCuw8aIxy++
 5PC6dsUWUNv9QKXY37QyigUlezCDDObW1BfDPT0LB+sIv0t3gHBsBx5Tp7YhSl55sNV/
 T3XinoaTI61OBnN6ORkiYcLC9F8/f2FA/+ymL5/uiOsHWnJ1r/mg8CfXVq6S4r48Hs7Q
 6bGFGl7geA3jQMuOIVj1eDr3mTDd5NMlhU6ThGZ9enxSqGqyNZZep5DLFglzpHhWAMUC
 8NvHjCYncIKQg1phsn4wX16LmaJO8k3jmAu2N8RUqr2HDxB3AdGX0yurbc2PcwIEmjgX
 RgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5hj2jHGsUae2xyTC0V7a9OUN2nIitdGO7+9Oib2CAok=;
 b=aFXlaXoCNunH+8TOQ3vxVSMjNWYZfAnbUNJ03G3H0ilNwErDqyVbhm7ELdSW9Zsnv/
 nEfE6MPlsHJAGuuj678vampp8mKH2zjKI/bZOwqjb+xdfgcjBxf1mu4dEtaKEvzu1/Rx
 oJ+1STczDPLqBO4q5xCjS5kvlfBYLNv8jHS429dpvTAP2IX3yhsaq/ezEptVAL2hUyle
 VFZMfgATyHEerH3ddSYlJ5rwLJ3H1Zvg3pR9sRdjht3dZXy4I8iZppZ0jFvKL5HQf2cg
 2ea50+TBUtzqaZKOuzZZ9/SSkWQIIHclPVhG0HQw6qRkNMW0uDRTx0UOOy3HZIkyYa46
 QG0A==
X-Gm-Message-State: AOAM530YWd0yWlgMjpR5SN3g5S8qSWBLxF6BEOsiR88SFdtr6DIdG6T7
 +D+ONy7mjbPTWoV9fDqMx1uGsBbJwkvYBw==
X-Google-Smtp-Source: ABdhPJws4A3mrP+P/COrBIpxjzWbkku8BtUDqS0MQ3S0GLRsBgbS86+4f0EKl7lDwhREI5F970De3A==
X-Received: by 2002:aa7:8090:0:b029:300:18db:4e11 with SMTP id
 v16-20020aa780900000b029030018db4e11mr13952748pff.22.1624689396377; 
 Fri, 25 Jun 2021 23:36:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/29] tcg/ppc: Split out tcg_out_ext{8,16,32}s
Date: Fri, 25 Jun 2021 23:36:08 -0700
Message-Id: <20210626063631.2411938-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly require these in other context;
make the expansion as clear as possible.

Cc: qemu-ppc@nongnu.org
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


