Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E3C572832
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:03:12 +0200 (CEST)
Received: from localhost ([::1]:54760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBN2F-00019e-E2
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtQ-0005g6-41
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:04 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtO-0007Bx-Lk
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:03 -0400
Received: by mail-wr1-x433.google.com with SMTP id h17so12875033wrx.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L1VDa0+dZ75eDcZKDsyiGvySf0TURL5H6Mgvjr+DBeg=;
 b=orIzBllHSWyl+2ahAVcJ1G6H9IfEzB+EJU9lVXw/Eff0B+XqbMCCEx7CFvo9ZsZzSD
 ODZ6LMWWkubPVc6koO+yUEcW6Ue6oXvodqUdWvhIWEV7McMXFyhig3JYD8NEk/R9PM+5
 0fh3ImB/1u+cUFPiQFHp79zonPxIqD6gCqp+Y28ozUN3I/GdGY+VwFYU+yHUa9kahKLI
 yrqqDfa0JBU6ane5WZA7fekQ1m61L2KHFk+1WrVxhaVe9q/yVFntTGaQy445937xz4OX
 nQrxj8dZiPthc+CKfnWeZzAtrOKXl1MEjE/B2uVp/b6msXyqPhgJqStXcCuVyleavE5f
 QSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L1VDa0+dZ75eDcZKDsyiGvySf0TURL5H6Mgvjr+DBeg=;
 b=E6Nc4/TBwJlUonNjGN/swwso23h6rqkJ/YSvKub2uA0MW/mqFbIvadPBPFS0jUMJK9
 Cx9ZLaDLwLQWpx7aS5doADNj5By5kY61kcDzPE1PaIYNbHrHnn3yx+vpdJhnqfLd2fQx
 wKbVRsw73bJaXrL5GRA27TboieFnK8wTZ03GcsJCEN3jNL17Z18Xhxec+yen4jgNMsNR
 qVIvHJw3OY0FqWJAKcwEajV5wr2uxhjJP8V/OwnqMKoZyTJyZyg+S4YViQ+mg/L4S9nJ
 POolPSYDjAB1kkFv9X61YBq3rWlIanMI/YpaFccecBNUF9RcvtZ9hoUCJMjxmw7oPFFB
 OqHg==
X-Gm-Message-State: AJIora/k6rup3QjSDEZ5Ch2Q1+UlOIQdywcExnJPnTt06RRCdRnLQs60
 wmRXGCf9BzKsYb85xpVD5SBE6Fj2SoK0ghgI
X-Google-Smtp-Source: AGRyM1tCan3BBrUZzheO/PnNwQsZRud8nxRk7BOwHC10yfBPz51Jrhi4Fs7l/eUEB/L6RC374cyqng==
X-Received: by 2002:a05:6000:885:b0:21b:a423:172c with SMTP id
 ca5-20020a056000088500b0021ba423172cmr23743138wrb.98.1657659240667; 
 Tue, 12 Jul 2022 13:54:00 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4e1200b0039c5cecf206sm105902wmq.4.2022.07.12.13.53.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 13:54:00 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/12] target/mips: implement Octeon-specific BBIT instructions
Date: Tue, 12 Jul 2022 22:53:37 +0200
Message-Id: <20220712205347.58372-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712205347.58372-1-f4bug@amsat.org>
References: <20220712205347.58372-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch introduces Octeon-specific decoder and implements
check-bit-and-jump instructions.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <165572672705.167724.16667636081912075906.stgit@pasha-ThinkPad-X280>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/octeon.decode      |  9 +++++++++
 target/mips/tcg/octeon_translate.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/target/mips/tcg/octeon.decode b/target/mips/tcg/octeon.decode
index b21c735a6c..8062715578 100644
--- a/target/mips/tcg/octeon.decode
+++ b/target/mips/tcg/octeon.decode
@@ -4,3 +4,12 @@
 #
 # SPDX-License-Identifier: LGPL-2.1-or-later
 #
+
+# Branch on bit set or clear
+# BBIT0      110010 ..... ..... ................
+# BBIT032    110110 ..... ..... ................
+# BBIT1      111010 ..... ..... ................
+# BBIT132    111110 ..... ..... ................
+
+%bbit_p      28:1 16:5
+BBIT         11 set:1 . 10 rs:5 ..... offset:16 p=%bbit_p
diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
index 8b5eb1a823..1558f74a8e 100644
--- a/target/mips/tcg/octeon_translate.c
+++ b/target/mips/tcg/octeon_translate.c
@@ -14,3 +14,33 @@
 
 /* Include the auto-generated decoder.  */
 #include "decode-octeon.c.inc"
+
+static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
+{
+    TCGv p;
+
+    if (ctx->hflags & MIPS_HFLAG_BMASK) {
+        LOG_DISAS("Branch in delay / forbidden slot at PC 0x"
+                  TARGET_FMT_lx "\n", ctx->base.pc_next);
+        generate_exception_end(ctx, EXCP_RI);
+        return true;
+    }
+
+    /* Load needed operands */
+    TCGv t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+
+    p = tcg_constant_tl(1ULL << a->p);
+    if (a->set) {
+        tcg_gen_and_tl(bcond, p, t0);
+    } else {
+        tcg_gen_andc_tl(bcond, p, t0);
+    }
+
+    ctx->hflags |= MIPS_HFLAG_BC;
+    ctx->btarget = ctx->base.pc_next + 4 + a->offset * 4;
+    ctx->hflags |= MIPS_HFLAG_BDS32;
+
+    tcg_temp_free(t0);
+    return true;
+}
-- 
2.36.1


