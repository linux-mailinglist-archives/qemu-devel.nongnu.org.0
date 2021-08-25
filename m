Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1B3F7B60
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 19:16:27 +0200 (CEST)
Received: from localhost ([::1]:52972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIwVm-0001nQ-1C
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 13:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwFl-0004sP-HN
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:59:53 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:39854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwFi-0000eQ-HD
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:59:53 -0400
Received: by mail-lf1-x12f.google.com with SMTP id m28so352406lfj.6
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 09:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u9aw/FdTidHW28P0btKY0zpgCd0X2THvww44X+Potaw=;
 b=wwn9NxuAdqQ7mC+2Tk6OU+DnFYw32IVTU3MCpzGkmtUPq6w82t6JRdU+n76wtsHWVL
 0k+yBc/434Ql2I2ve2Y+cGBk/u4gPchP9d4cg36BZOUQjT2tDibUat35SOi7Z8WGulea
 qpt0XIUzugUclC8W3QlEYHDXd8V62Ite/By68exCnA0hUgqX11ND7eUY2q8zTi60+uKI
 nXtHquGNM5Yi2XBo+0zV5XGSaMvtp3gIyAuJo1K7IeNSt4Fkeo1dr84n/dHAWObZJjn3
 dIuHPbta+KshQzvMwUqy2SjHRC5NxOyQP/o+1KPuyYDvJ918su+PubukpjGK5FMjJHYH
 /9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u9aw/FdTidHW28P0btKY0zpgCd0X2THvww44X+Potaw=;
 b=Bp3HtnIdH4sjlVv3VSIqalAi09vNKD10mHAb9ahyF6YimWBaK1S1OmnTrH8YUg1vDE
 4KsKt6JlpTJxMnvBN518Pagb1WH58LLOmqdzhVntQ7dD4bx90jd3IlGXxCrtObpnW77U
 T9oahKE/r3mnuTtG4x+XwVlRNobguMbL+Q9J9yuTqJ2y3I1CrFS0RMExE0l4LII8BY1J
 LKJmGMspSVDVPN+nDwfQdjjCegH0wvAusMHzcqm5YgXqJNpYfqPWXGnqbjuZ0F/RcTmm
 y8ebM94zhvMc4f04BJYK4O4MA05Ba17AcmrVr4XK7rLnjc7xNDJ50jnmTt/ql/UfZDZR
 MK7g==
X-Gm-Message-State: AOAM530C1QbcbeegIVT9Ud2Tj74Qtv1q/rcgoz+NuKWWPYpaWrQhiXmC
 vHE1udsxLqxleO6EfS9rgOcFj/dl9NEsV1m/
X-Google-Smtp-Source: ABdhPJxyEsf1FTL0+CBK0Y/U3tVYcs4/viERcs/wZOFD1SNCOrj048s/hj8xOoAjJCj/+gJacHn2FQ==
X-Received: by 2002:a19:5609:: with SMTP id k9mr3149877lfb.393.1629910788400; 
 Wed, 25 Aug 2021 09:59:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id r2sm59619ljj.14.2021.08.25.09.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 09:59:47 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/14] target/riscv: Add a REQUIRE_32BIT macro
Date: Wed, 25 Aug 2021 18:59:03 +0200
Message-Id: <20210825165907.34026-11-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12f.google.com
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

With the changes to Zb[abcs], there's some encodings that are
different in RV64 and RV32 (e.g., for rev8 and zext.h). For these,
we'll need a helper macro allowing us to select on RV32, as well.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---

(no changes since v3)

Changes in v3:
- Moved the REQUIRE_32BIT macro into a separate commit.

 target/riscv/translate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5c099ff007..aabdd44663 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -417,6 +417,12 @@ EX_SH(12)
     }                              \
 } while (0)
 
+#define REQUIRE_32BIT(ctx) do { \
+    if (!is_32bit(ctx)) {       \
+        return false;           \
+    }                           \
+} while (0)
+
 #define REQUIRE_64BIT(ctx) do { \
     if (is_32bit(ctx)) {        \
         return false;           \
-- 
2.25.1


