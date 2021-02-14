Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B129431B1E1
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:19:09 +0100 (CET)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLzA-0002Ms-GD
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhJ-0007fQ-UC
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:44 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhF-0004Ut-RY
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:39 -0500
Received: by mail-wr1-x431.google.com with SMTP id b3so6104839wrj.5
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FfRtrIVYgrZx8p+x3vP4XGNic7F4mMc3E9YYXBY0pFU=;
 b=o8WREhb4dKioU1pyB4M8/MK+ycuqhktIENWqKMDL3TIddaoRFYEnmIpL/hZTjiY7Lr
 nv5uR7FbLHouZe0wj+aUM6HsawirJQN52WM25AIaa7Q4KwgM3rL49hgxrqzfX2pYKAtu
 zmAkf0Ef/G0P4bR69BC5DZGhGh/vV/NaKSMRpoIDgZNtro4Ie2PpH0IPShQLwyKn4td6
 Rj11lH9PAvQOfImte8KG96T8xKwNp/1gI48xluIYX1EE8rIGAPUeIjGbbMsm4tO9DTpu
 JTsi/URA5r1FncDuQAfFzVp+5oSMs9aDZeXAxG2KOxbqIq7HSd6OKvLkXZPogxNyxfti
 1agw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FfRtrIVYgrZx8p+x3vP4XGNic7F4mMc3E9YYXBY0pFU=;
 b=eTlLs5nJWFV22NUGpeOY0y+ItE4lXb2jQYjO4ttuPl0RVYxYk+ovqDuKbH1qdyq9GW
 7+t39g0nxaHcZ9Udj3I8x0/JIaGP8ZhyqCEQHvWtokYPQ1ee2M8aNfiXFHXd65lhA8qP
 ipPFhcMQqhd5ZVcZlAIB3CSqFb8x78xkkWDAbvxb2VzVeyK9ABr6rja/J/uGIF0vfBmY
 mKF/h+f74AvoZKsoVb7ExZZG4xJGipG9tbG5xFWZXrKB2j7DfsfYhcd+H4hEcDi9ixMS
 yuiv8Ohs0YUK61VA1JfPi9bipPqwspyfrcCGSSD4eAejCJeU25I8knDlzJOHW7awQqVx
 apug==
X-Gm-Message-State: AOAM533bpRYO83sLOO3l2i2g3LV4/2l0G41Recb1btCilqXSN+xUZyib
 kvasqP3nZYS7Sbu1Pv9+DfWnO9tpLKo=
X-Google-Smtp-Source: ABdhPJyIXTMd9O46RIT7MQPGfepw9iJJQEIELxVKW4OhecoTcCvUBoT8m/BJhEml5nvu+9z5PWr8/Q==
X-Received: by 2002:adf:f941:: with SMTP id q1mr15161235wrr.189.1613325629787; 
 Sun, 14 Feb 2021 10:00:29 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c62sm22338051wmd.43.2021.02.14.10.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:00:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 15/42] target/mips/tx79: Introduce PAND/POR/PXOR/PNOR
 opcodes (parallel logic)
Date: Sun, 14 Feb 2021 18:58:45 +0100
Message-Id: <20210214175912.732946-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the parallel logic opcodes:

 - PAND (Parallel AND)
 - POR  (Parallel OR)
 - PXOR (Parallel XOR)
 - PNOR (Parallel NOR)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  4 +++
 target/mips/tx79_translate.c | 54 ++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 0f748b53a64..26c80b9bce5 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -32,8 +32,12 @@ MTLO1           011100 .....  0000000000 00000 010011   @rs
 # MMI2
 
 PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
+PAND            011100 ..... ..... ..... 10010 001001   @rs_rt_rd
+PXOR            011100 ..... ..... ..... 10011 001001   @rs_rt_rd
 
 # MMI3
 
 PCPYUD          011100 ..... ..... ..... 01110 101001   @rs_rt_rd
+POR             011100 ..... ..... ..... 10010 101001   @rs_rt_rd
+PNOR            011100 ..... ..... ..... 10011 101001   @rs_rt_rd
 PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 243a81c3c5e..28d07baaa73 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -2,6 +2,7 @@
  * Toshiba TX79-specific instructions translation routines
  *
  *  Copyright (c) 2018 Fredrik Noring
+ *  Copyright (c) 2021 Philippe Mathieu-Daudé
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
@@ -139,6 +140,59 @@ static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
  * PNOR    rd, rs, rt        Parallel NOR
  */
 
+static bool trans_parallel_logic(DisasContext *ctx, arg_rtype *a,
+                                 void (*gen_logic_i64)(TCGv_i64, TCGv_i64, TCGv_i64))
+{
+    TCGv_i64 ax, bx;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    ax = tcg_temp_new_i64();
+    bx = tcg_temp_new_i64();
+
+    /* Lower halve */
+    gen_load_gpr(ax, a->rs);
+    gen_load_gpr(bx, a->rt);
+    gen_logic_i64(cpu_gpr[a->rd], ax, bx);
+
+    /* Upper halve */
+    gen_load_gpr_hi(ax, a->rs);
+    gen_load_gpr_hi(bx, a->rt);
+    gen_logic_i64(cpu_gpr_hi[a->rd], ax, bx);
+
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+
+    return true;
+}
+
+/* Parallel And */
+static bool trans_PAND(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_logic(ctx, a, tcg_gen_and_i64);
+}
+
+/* Parallel Or */
+static bool trans_POR(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_logic(ctx, a, tcg_gen_or_i64);
+}
+
+/* Parallel Exclusive Or */
+static bool trans_PXOR(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_logic(ctx, a, tcg_gen_xor_i64);
+}
+
+/* Parallel Not Or */
+static bool trans_PNOR(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_logic(ctx, a, tcg_gen_nor_i64);
+}
+
 /*
  *     Shift (9 instructions)
  *     ----------------------
-- 
2.26.2


