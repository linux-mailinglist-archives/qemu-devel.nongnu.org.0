Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0B43FB473
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 13:19:57 +0200 (CEST)
Received: from localhost ([::1]:37186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKfKW-0007AM-Mm
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 07:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGc-0006pk-Bs
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:54 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:44611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGW-0004VF-TO
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:54 -0400
Received: by mail-lf1-x12c.google.com with SMTP id s10so5599793lfr.11
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 04:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NB+2ymxcOdJCsq3x7YLHFtrO+ls7rryMPAaZ7huJY0o=;
 b=k9tbKcj3+8GO/DPkWStTB1X4EoDn+6D9kqLn0Yf518E/Hr26dv5kEXlTd8iLNHWStw
 HN88HtDw6W9oAaQlq0c3Z8FnZZhkOcrXN4DlmIfdTwmg1WXfLjMM+ah7l2hnNRs4bfam
 kZ+HwynrAB3Gjb/0Tt0RRy3jp/WK2+mIdSfn/dRkD5XW0ZhyKovVoU8hoC1Srz36ILhf
 5fg9mEGI8rtl576Ub6EWuvlplIpACeBCVYni4A6yNgWKrOckO2WXexT5yhBOovnsTRNi
 JdLowE+3zAJodk7m4YryFl8o2injmkTrmPUTtkAuI2lAHZ+rZV9Ns4IuYgJpLWEh/LNw
 cVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NB+2ymxcOdJCsq3x7YLHFtrO+ls7rryMPAaZ7huJY0o=;
 b=XzyJ3otqwqyKNXy4qjgtiQuDb5eiPMvnL5LtdjEiHJgce3N/SYHQZzYGJl8UqYpx8i
 f5gph8o1zIZHr6iSZ8sytX2jAGk+zb5/Wd/IpsZBtK6ZeRV511EH8W+U1BRfSwI38OSY
 ECjNsvZ/GQAULbgGGBAzdIUckpIwS9ay9c+TCke1unn7eWJQBUAcNIuMWpIATDe49fsX
 EwPkyZDF/6sCnNx959kxDrwsLLBiuGY1fysSnAMk/VB5QhWKV7ovG7GTbMHGzE6xbQou
 eb2mTKnWzCvrNXVuhX5jHSG/te4B+ESXCni4UgOMkdX2MpUHO+Hah5ndqKQcS92YdhEQ
 mk0A==
X-Gm-Message-State: AOAM532oI1eRFcDJ2F4wq0HSXuUTHA2kUrHjJG2XH8c0mh4nqjB5c6kF
 CHlHCNSh0x2eiy4xL0IOlOZro5tsH2h6Ykic
X-Google-Smtp-Source: ABdhPJzHkd9D7p1EyhuRntxmMt6fApg4sbieKiNbz5Smx+miKsv9ha4cAH4wPICfN5n5JIR961gzzw==
X-Received: by 2002:a05:6512:33d2:: with SMTP id
 d18mr4764541lfg.28.1630322147013; 
 Mon, 30 Aug 2021 04:15:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id j3sm1790129ljq.84.2021.08.30.04.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 04:15:46 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/14] target/riscv: slli.uw is only a valid encoding if
 shamt first in 64 bits
Date: Mon, 30 Aug 2021 13:15:01 +0200
Message-Id: <20210830111511.1905048-4-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
References: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For RV64, the shamt field in slli.uw is 6 bits wide. While the encoding
space currently reserves a wider shamt-field (for use is a future RV128
ISA), setting the additional bit to 1 will not map to slli.uw for RV64
and needs to be treated as an illegal instruction.

Note that this encoding being reserved for a future RV128 does not imply
that no other instructions for RV64-only could be added in this encoding
space in the future.

As the implementation is separate from the gen_shifti helpers, we keep
it that way and add the check for the shamt-width here.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v3)

Changes in v3:
- Instead of defining a new decoding format, we treat slli.uw as if it
  had a 7bit-wide field for shamt (the 7th bit is reserved for RV128)
  and check for validity of the encoding in C code.

 target/riscv/insn_trans/trans_rvb.c.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 3cdd70a2b9..dcc7b6893d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -430,6 +430,15 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBA(ctx);
 
+    /*
+     * The shamt field is only 6 bits for RV64 (with the 7th bit
+     * remaining reserved for RV128).  If the reserved bit is set
+     * on RV64, the encoding is illegal.
+     */
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
     TCGv source1 = tcg_temp_new();
     gen_get_gpr(source1, a->rs1);
 
-- 
2.25.1


