Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE733F4EA2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:43:28 +0200 (CEST)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mID2b-0000ec-Sz
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0E-0006Dv-OS
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:50 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:45618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0A-0006Im-Mo
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:50 -0400
Received: by mail-lf1-x12b.google.com with SMTP id g13so39106684lfj.12
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+COX/Fn+nzsEGsVRznatLTqCCICkma7A3L/FrfzefDA=;
 b=uh20P1dET8CpQeNlYZaWjc9y11SttvT5vAdUWnV7pz4i4gzfLHa14KVNisp63KqbEZ
 QACCw7D6FH9M1A7QuV42nhf3b1DQVjPmWfdLWSQwR9gZacOssPL0DtPYFtZx4AKiWKDj
 TVuCeb7ljJMjGsfXlidAOAAwYRlZD9DugvphEFs3fNmj/jKMWZNuHpi9QR271MmaFkHb
 KpAsWaBJIaEgapIr/CanCH3c5cqcJne1p+qa8MLvab+Z4WNzkHyzRpCuHdt9+uSka/cz
 z6yMktX1Aqaxxr5HHnVMg0tJKLRsWCvtLbykiTCJK+Gr7oFV59VkHdjCBu0e4G2Q1Kah
 oxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+COX/Fn+nzsEGsVRznatLTqCCICkma7A3L/FrfzefDA=;
 b=GH0ueYc7RYyrTHRUFracv0jfVVUVH8tJ/1nC3lyhGEkBqzRkso8IXn6ZYDHzWbPrJW
 t1bAhMtXfIi5baEyq9lkQ8FVRa50dpvOToNG6yBsoykmvGvK+Z0EimS8Mj9f2t6W52hQ
 mqlGor5p/HoqnnP1xgnePnWmmwV/utenOglCkIsnGySjBU/mksO+I8DVkyQklAnpgHx3
 MYwdErar/f7H6foH4uLYsepGWBI2wRZaWoibDyMlVfzriZBM6BH0mR9wbCriZIjR8dPS
 0BE/kfeBg9UWoeHqb7wLvWV3/vm2ka6KOOM/lebPWYnZtLLqwFksHLtD/5G68aPiUyuU
 8KFw==
X-Gm-Message-State: AOAM532Na8EcIUWHwkpYfwyGZK8G40K5ys8d/EajB0d/e8NSZCOAwdBu
 0zXZrNsumqcqDfgjVeXWhNP9H2/AOuM40fdl
X-Google-Smtp-Source: ABdhPJzvhZUjQ0VLp7g7Hdhbtq0fD3Hq3Ivl0mWTxjqnpfl4117pV4ev2QY+Qa6WXCZUX7+gUCgazg==
X-Received: by 2002:a05:6512:ba8:: with SMTP id
 b40mr17846946lfv.50.1629736844249; 
 Mon, 23 Aug 2021 09:40:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id z5sm1491671lfs.126.2021.08.23.09.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:40:44 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/15] target/riscv: slli.uw is only a valid encoding if
 shamt first in 64 bits
Date: Mon, 23 Aug 2021 18:40:26 +0200
Message-Id: <20210823164038.2195113-4-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12b.google.com
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
---

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


