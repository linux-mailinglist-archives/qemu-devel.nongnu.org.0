Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7BC3F5050
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:24:14 +0200 (CEST)
Received: from localhost ([::1]:40048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEcH-0000Iv-Tk
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQJ-0006Ub-RB
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:52 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:47048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQ8-0008J5-E1
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:51 -0400
Received: by mail-lj1-x234.google.com with SMTP id w4so31526719ljh.13
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mVDf2DTleQlmUk2v3RS7SjiR8DsZ3TaK7txh2qX01oc=;
 b=ALLBJYwQaeFnQ3OVrI3XwD2sfo9oFj7bPicY6hbv/uXb1x6cHhyjnaQbRWhDQp82fk
 TLJFVbvk52NymdXdE/fT7XsJxd/rzeDpwaWUG0Y5+Cnu9Q5MCET6d3GENr0YBpaIBDuG
 sM88FpzuwneZ0M+95+gmwsfM9dnlsQv9oLREw4E+lePJd+bkAZlzMZ6azkoaNG9/qrZA
 PkRo+vo62gaWvzKQscfkXj0hSCEG5o0Kyyd+Li0w+EbVOuI32DVCanSVL25wQ5+UZQuo
 UHVGptURmF/kHJkOdCbA9Cjne+wfj04spnx1L27x1NKugGTZS45oIux4BxPeKoKXSKnr
 1CgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mVDf2DTleQlmUk2v3RS7SjiR8DsZ3TaK7txh2qX01oc=;
 b=EVlPTfk9962hHnADNjRh7ETZTVuq6SAIm4pBBQbgc1MhzoEJij9a60juKSFeJFq7Le
 /z57sEcU5hQZ21fMy5ZxcsWzb5Jpefb8qza+fQi34obySepdFskvWJ6SlscT1lQ25+lU
 fDbQwNBrz/s5PLa9E15qzoZzV1y4cug2u9CV3G0vBzPO8KTQ8evOQaQNt7K3qclDx+6X
 DjKnaBIZq10AKH8nwphyReTgDaBVDlNFzB2BzL4lc9Ie04PfGKXORDEDTPgOgIJaf0ah
 OiVtXYVE7FOYJ225JBe0f+/OPwk8HhVaObUwP2w6HPoU/ZfCBpFHOXmyxekG8a8FrqWQ
 iDlA==
X-Gm-Message-State: AOAM533KcYsU8KNPgjktbi97C2igxnSnUDxlw7FNuvwvsq2Kef7MR/sZ
 GVR3miak9+LYCVgfcrjq+sBL4y2n/+p2YOY1
X-Google-Smtp-Source: ABdhPJwGcz1l16dA9T6aNKDJHkZjmFNW+0Tnv/S75FUZc4ezA2u2Oj29JJE/7r0BIAfkrL49MQJ09A==
X-Received: by 2002:a2e:a555:: with SMTP id e21mr10883361ljn.44.1629742298788; 
 Mon, 23 Aug 2021 11:11:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id w26sm1511739lfk.223.2021.08.23.11.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:11:38 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/14] target/riscv: slli.uw is only a valid encoding if
 shamt first in 64 bits
Date: Mon, 23 Aug 2021 20:11:21 +0200
Message-Id: <20210823181132.2205367-4-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
References: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x234.google.com
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


