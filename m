Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCCD4003DA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:08:12 +0200 (CEST)
Received: from localhost ([::1]:49300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCfj-00016z-Ak
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCYy-0007ID-Kj
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:12 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:36655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCYv-0004zs-9L
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:12 -0400
Received: by mail-lf1-x12b.google.com with SMTP id c8so13012046lfi.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sSQEPWASEFCKIe8qVM7WpjgOoUbV16zrv4O67np4u9E=;
 b=nxuq+4M93792aY5QcZcfmcjiTCZ1ICARrURrfdkRIPt5le6v635RciwOStnn0ION9r
 JQtmeJEDCWDTQ4bCeybxhzNYNNjJiim/ozA/TyUR+Vb3xu4o3SlRVpc4zTd2eEHgZN7y
 t2cpnWtyEBX0pXPGRwdiFt9ylUXD5U42m2I77iLEGSUJaCgodlrPshialAE/Nq8KjSVu
 VVLqhJLZOA/3l8MEdu7liqUB/SnLNKgjsvFME/NFqeWf6S5b0eifQYyxhZcjsGnbZhko
 iSI7I7ODyW/UwNZd4qWqJFFFNyuVJSFvVklnpKvpxgtzQwINd1srYurj/XFy1sqOXJO1
 EkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sSQEPWASEFCKIe8qVM7WpjgOoUbV16zrv4O67np4u9E=;
 b=ISilYmqpED6a8tv/1cDCVFogEKmK3RDqUu8uSZFrjyANFlFwBUk/QZikYN95+6cmHm
 2GbMxWAePrOFnRcanGwU4vfmlhBg+T8iyse6XTFPORl8twZMhI2EIcwH73lbimK4CjyX
 jJ7ZiYYi0qCgehyw6Ny/etDu8Oi2GJikgCS8cDPx5Jj5n4x1oJ6ZNmGEZWJHPcZFJKvW
 co4tQQUC55GXvogPXXk2qyaXq62eXIW3VXWsUuso1rqAxFnsLCrjxKbR1Fl3ikXsZ8Fj
 TIWK8aicfvyaJjUftVUcCtmCEqiQKYOw2ElJS38EuI07+cqni5cWjMBchvU2y5/J8z+q
 UfEA==
X-Gm-Message-State: AOAM53108Lp6nqzG3h39bI3VfmJ7XCoutq+RNnQMlbBgsGGBpyB/OV+p
 kbapUvOUgNqbXjoOKMk8/Qk0Di+xGoEmVB5FjqU=
X-Google-Smtp-Source: ABdhPJwNZx0NeyFvKMu/FRXZoDG5ruph7OEJfQJBGu7U9Jou9H9U6KiecsyPQKYQ83wUGrBNNFmd9g==
X-Received: by 2002:a05:6512:1586:: with SMTP id
 bp6mr3517298lfb.509.1630688467467; 
 Fri, 03 Sep 2021 10:01:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id c3sm628401ljj.77.2021.09.03.10.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:01:07 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 03/14] target/riscv: slli.uw is only a valid encoding if
 shamt first in 64 bits
Date: Fri,  3 Sep 2021 19:00:49 +0200
Message-Id: <20210903170100.2529121-4-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
References: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v9:
- Rebased to 8880cc4362.

Changes in v3:
- Instead of defining a new decoding format, we treat slli.uw as if it
  had a 7bit-wide field for shamt (the 7th bit is reserved for RV128)
  and check for validity of the encoding in C code.

 target/riscv/insn_trans/trans_rvb.c.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 91da7c5853..77114889de 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -652,5 +652,15 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBA(ctx);
+
+    /*
+     * The shamt field is only 6 bits for RV64 (with the 7th bit
+     * remaining reserved for RV128).  If the reserved bit is set
+     * on RV64, the encoding is illegal.
+     */
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
 }
-- 
2.25.1


