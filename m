Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333FC31B1D2
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:12:14 +0100 (CET)
Received: from localhost ([::1]:36248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLsT-0003Cc-6m
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgX-0007Ev-7m
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:54 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgV-0004Fr-OA
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:52 -0500
Received: by mail-wr1-x429.google.com with SMTP id r21so6075193wrr.9
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 09:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FVN4+88EUUq6gz1CpRu7+tWI7TBZoJBeRwTCH0aFxfc=;
 b=IV0wOnXbhtXN9wmDQFvxjVGIW+1egUvcoEI0HAfHqgL2nYS7szCXUDbVwgGXW93qGQ
 qVIweTOZQEKWEqjuqNZuko0cdsqp02gyV+2y38KBDvIkvdNS0gY91bLBlTzSLWSP4ma3
 0When7iYLKwO38sBa+pny/hegFWoK4LrkxvxXrVgtm9Zm0RFZ1/9ifyG8WqO0D7Kn7gc
 Pg8CXEDBq7Rv+45rMw2BcObGHFjNgZ+JhjKP84gXxrqUf6gCHYacG40JTj48o15Pw+0m
 2KPwYhmk/DUp9m/a1nYo4nSwrrmbklyT1vjuzPFkB1NLB11fUzadBi2XxL1yEdRkwTnM
 z8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FVN4+88EUUq6gz1CpRu7+tWI7TBZoJBeRwTCH0aFxfc=;
 b=NZBr2MDhkW7cH9LP5h+aWRC97PeyUo74fP6D7LkDTZqAN50/Za0vp3sXjopWs3P62j
 UBF0QcoyDx9hjjATuYG6+ke/K/vx3v63XFjWRiK+PYwRzq/zigTU7b4iwMAhhpI9b7lo
 lNF0eSDgi/mm/+Qd6cuGGe7VYNlauqug1IA1JnBbz+P9mBFoxdAsRG5oOkm3IpcjmzEl
 yDirCWjBL21CYQaCdS/PlkobRmHBWLnlU4LTb0zqoOIyoCV8jpi7yOjITFrZvUMD0BBO
 rYp36QH/Q48nmakdGXd6MKfh3BH1N02WMZxcEoiuWlTmEdUWO4yb+ITKrcD/4YJvDF/E
 beFg==
X-Gm-Message-State: AOAM531jYErYjmDv8+Bt9yM2/kmfpsmWYcBGB7wLI8ju76/jEdlNlKDY
 T5epfAmgqbSgShbLQq5wLncZuQMBYvo=
X-Google-Smtp-Source: ABdhPJz+iPc05i5t1XeIgBuCg9r18QCLHyEa4/B8EeLJUtIFR3GbWEPIbAJNxq+c/prFA49XpXRcLQ==
X-Received: by 2002:adf:97d3:: with SMTP id t19mr15482042wrb.164.1613325590282; 
 Sun, 14 Feb 2021 09:59:50 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w25sm21512304wmc.42.2021.02.14.09.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 09:59:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/42] target/mips/translate: Use GPR move functions in
 gen_HILO1_tx79()
Date: Sun, 14 Feb 2021 18:58:37 +0100
Message-Id: <20210214175912.732946-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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

We have handy functions to access GPR. Use gen_store_gpr() for
Move From HI/LO Register and gen_load_gpr() for Move To opcodes.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 16a731d3f37..a2994eb0aa6 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -4126,31 +4126,18 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
 /* Copy GPR to and from TX79 HI1/LO1 register. */
 static void gen_HILO1_tx79(DisasContext *ctx, uint32_t opc, int reg)
 {
-    if (reg == 0 && (opc == MMI_OPC_MFHI1 || opc == MMI_OPC_MFLO1)) {
-        /* Treat as NOP. */
-        return;
-    }
-
     switch (opc) {
     case MMI_OPC_MFHI1:
-        tcg_gen_mov_tl(cpu_gpr[reg], cpu_HI[1]);
+        gen_store_gpr(cpu_HI[1], reg);
         break;
     case MMI_OPC_MFLO1:
-        tcg_gen_mov_tl(cpu_gpr[reg], cpu_LO[1]);
+        gen_store_gpr(cpu_LO[1], reg);
         break;
     case MMI_OPC_MTHI1:
-        if (reg != 0) {
-            tcg_gen_mov_tl(cpu_HI[1], cpu_gpr[reg]);
-        } else {
-            tcg_gen_movi_tl(cpu_HI[1], 0);
-        }
+        gen_load_gpr(cpu_HI[1], reg);
         break;
     case MMI_OPC_MTLO1:
-        if (reg != 0) {
-            tcg_gen_mov_tl(cpu_LO[1], cpu_gpr[reg]);
-        } else {
-            tcg_gen_movi_tl(cpu_LO[1], 0);
-        }
+        gen_load_gpr(cpu_LO[1], reg);
         break;
     default:
         MIPS_INVAL("mfthilo1 TX79");
-- 
2.26.2


