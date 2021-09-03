Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280B7400086
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:26:48 +0200 (CEST)
Received: from localhost ([::1]:46648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9DT-00076q-06
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mM91X-0001ux-M8
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:14:27 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:34452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mM91V-0003cA-GD
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:14:27 -0400
Received: by mail-lj1-x235.google.com with SMTP id f2so9598289ljn.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NB+2ymxcOdJCsq3x7YLHFtrO+ls7rryMPAaZ7huJY0o=;
 b=zyT2OPUOiXeS3K00svb/gMjZxsps/2KSwXiM8Wyw7RDTLle63BKUuJco0z3jRS+pia
 nBs5b1X8oHimUw+ciGaxPOKxpHoYDbTBy1da3MHNVeB5g9SkKKRESOzoQEULeQPOhFM2
 iKiY2tetBmUL8aihw5EZrFyQpg4+2N9QdCHXQJCK/337KpxGO19LuOamFaBWJiNVfOPc
 B2ccSBdLLsUODoHOJRZzb7qewJKiM3tcXI7kE9xrC0cciddaFGYEPo79UIwSrZZbTuLo
 AjvtE8Sd9YfbwQX8zoD3HgrXPd/0VdvdPoR3m9pO0FZPcBvIi92O0aZ9ynQ7QFpro2q6
 VIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NB+2ymxcOdJCsq3x7YLHFtrO+ls7rryMPAaZ7huJY0o=;
 b=NA3oSP3kAg9pAe+534uqTcUgCGfi554gAPgEvZyPAiM4mcCT/tsMuhj50BVJr0x5uN
 3zB+qGu43sdbtZnuURJJ8s/2baKxRnIp/miS6MuiSH1vtlfS7wqgxY+6N2dte8+yIxfH
 7oWx6u+uRsW5qslnml7XX8j/BEEc2NI9hatBs1khaNR8Kne6AQKyFKGN4SIGJS3XL0hs
 2VoZr7rXWIvQGO6cfalSTPZOh9wcRfjqK+g+pypibDqjmaXrBV1gLR9wnFnxVLJIApuX
 iUbeow3vxFlD4wC7jW+KxLNYMzoYvyvyIsOgYkmUm1eFizBVK4tgRz6TkpkAND7Ol/3i
 aOGQ==
X-Gm-Message-State: AOAM532PW+pjA5xNm0rEkB1pZ8fsWcNS/s1eiP+GaQlHSvRorbF9/pdu
 r8+GeGk5xVpz6CK3iLvWn/E02oUboQqLbP/lLcw=
X-Google-Smtp-Source: ABdhPJyz1FesxXl/D31j3pw+1lGuD/sNnIcvROV6IRfvPJxhZE54qDHxF6+99JJ6Z+ymDd0Es3sl9A==
X-Received: by 2002:a05:651c:170b:: with SMTP id
 be11mr2791450ljb.219.1630674862604; 
 Fri, 03 Sep 2021 06:14:22 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id n5sm577995ljj.97.2021.09.03.06.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 06:14:22 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 03/14] target/riscv: slli.uw is only a valid encoding if
 shamt first in 64 bits
Date: Fri,  3 Sep 2021 15:14:06 +0200
Message-Id: <20210903131417.2248471-4-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903131417.2248471-1-philipp.tomsich@vrull.eu>
References: <20210903131417.2248471-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x235.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
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


