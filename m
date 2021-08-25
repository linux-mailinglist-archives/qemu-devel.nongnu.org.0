Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ECE3F7B03
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 18:58:26 +0200 (CEST)
Received: from localhost ([::1]:54736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIwEL-0006WF-G9
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 12:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwCq-0003qK-7G
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:56:52 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:40622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwCi-0007FN-Ep
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:56:50 -0400
Received: by mail-lf1-x12a.google.com with SMTP id bq28so324523lfb.7
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 09:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mVDf2DTleQlmUk2v3RS7SjiR8DsZ3TaK7txh2qX01oc=;
 b=pc9h+9WjcIIXUwyCgRMntXS/HQTaecDa+yFbwywOntbSHK0vKgmvn/Mb5oOUEcxxzN
 dk5fQ3e0W4fxgUyqcDJgU9KWb4KfmlXQxNl+w53f/7pGoSw+kvO73mP2d61RH0ER9ihZ
 eYP8L1WZf3wehuNJ1lMJH2MmhrzD0PODbN5rV9TVNEDl+o3/Z8F2owb0AC/T5eDChm38
 cguRSyDgWbnL2YebZvZIgxzm6QhtMFJk229Ug6Z/QzaJa4ouc5tJElRfR3UVcVeJsMVp
 AAvcYtrPPsYuHjIdWR0Iqn6G2ZxjxIe1TB6nAJRBE5jrhWFgQXhF2xXHOut3d8sGkRia
 HgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mVDf2DTleQlmUk2v3RS7SjiR8DsZ3TaK7txh2qX01oc=;
 b=OlTDgG7jcLYOjV29TkDTQX7FdQJZktlZT5DcOGwCmWHXQLMZHkPZJByPzzdpAqT4Do
 dKPxgWSGK/vyz7FUoSuGTh/UZsHF+pANI3cKD+F5XmAZprHILO1/jx74kNScimFyKmN6
 lP9ovm/1psqWp7/2DpFADYByYAfuS337f2FVUzbTpinZM4Iho7M75CRABpjUbO70DpYO
 Zr7zreeM1ORKiUoLJDmPP9XKg/boSHhp8dwACAenkNpUAYtxp4cHytcvXcI+kn4xTwRH
 0M9h1vheqexXOXdNQhTnAwkkxn26CzaaSjQFLN41A5jzIln6cTkvsg+uX9yNkk3aWndg
 j4EQ==
X-Gm-Message-State: AOAM5300bulLY+ZFtLYwlnCvS5xy1sluelFm519MmJfvfu16nlhO6EGe
 59PkutG5w6g/OmjRlAD6AZ4OwVyRr/cawpc2
X-Google-Smtp-Source: ABdhPJzHFiTx60pgPyo+O4fFvTyqjQbxJXqsZL9vxLf5BfM9g6bFg5noqAmm+2KNqt5EYZfmEudwdA==
X-Received: by 2002:a05:6512:3189:: with SMTP id
 i9mr547768lfe.419.1629910599282; 
 Wed, 25 Aug 2021 09:56:39 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id i8sm55686lfl.280.2021.08.25.09.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 09:56:39 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/14] target/riscv: slli.uw is only a valid encoding if
 shamt first in 64 bits
Date: Wed, 25 Aug 2021 18:56:23 +0200
Message-Id: <20210825165634.32935-4-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825165634.32935-1-philipp.tomsich@vrull.eu>
References: <20210825165634.32935-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12a.google.com
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


