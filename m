Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871AC57A673
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:24:43 +0200 (CEST)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrth-0005nm-Tw
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWw-00077H-SX
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:10 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:40625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWv-0006Gk-AK
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:10 -0400
Received: by mail-oi1-x231.google.com with SMTP id r191so7823862oie.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sGdHWNOdW2WrHLjWLIrMnoyjBp9QciCdh5JHta0OwMs=;
 b=vuTIkwGIKJpRtxVLhFUBaTAOrNbWg3ZkSjAKJ1aFw0NaZTMKQWqXNBt3lkmJfccQpX
 5sIenHu4i7ZY6W6fl036smFbnkcsOH07Y3heiFea5NYg7iJQ7TQyVjKw0Q+48PWKw5XT
 +fYxltmk9ZRNcQDwuVj+g0vApC9jrVMsWBsY5tt451xNTVhKAPvVCsbCETIDkm1v8Nbp
 MbgSA3lkf9Ly+0PCamc3yN779FJpcJjFojik1TXP/b8V4LZ2u3xU8jBJIzC/rlXUF7M6
 nC8KpBnlCljtdUzFsuxESx+PryH+s6MogB5VqQeZFKK6qXUdlnAwsVkSjpOMxSF1BkXB
 XsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sGdHWNOdW2WrHLjWLIrMnoyjBp9QciCdh5JHta0OwMs=;
 b=fgFWh1BsdzdcloIodKZuHKGh4/5zi8e1L03N36JVR2X7iUxn4ZzYjuSoXNGDktTJfI
 L9UnGfBMlWrq2IZMGu8eH86eQdJ3EbdNvnHJk5mbbySMG64RDjSzyiY7tUj/HOgMJlze
 VYQFQ2TdNktROdTdgmJYBptYWZYd1ziFeuFPPsdZDABGThYdqHOmAEb3bwICnkSZUAiG
 j03wTJ8bCsmNV7nOPqjDxRFR7BXgEmcq6whFYhlgne01TwD+KuCFbliKVx3kbN267Q3y
 uJrfVKhT2uTm3D7xAKV8sK3kB9jaZyR1jbWOQnB+2SfPG+AyWU6aDJoA384/oZubPWz8
 tFvw==
X-Gm-Message-State: AJIora+0czrNK3D1PySmvmxSinB7gcEXwLP0Zeo0zHgYpy25YvZE8V3C
 oGSuI278hdYXvQXK8pm7NZZXE7edy5aXm4ut
X-Google-Smtp-Source: AGRyM1vnpwg41OMJtPHCLaQP+vnTcu9u9/iWA20d7PUqQc/mOWUrqQcsdUOzD/3zQTy4NCGsyP8M7g==
X-Received: by 2002:a05:6808:169e:b0:331:522a:4521 with SMTP id
 bb30-20020a056808169e00b00331522a4521mr306761oib.293.1658253668146; 
 Tue, 19 Jul 2022 11:01:08 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:01:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>
Subject: [PULL 14/21] tests/tcg/loongarch64: Add fp comparison instructions
 test
Date: Tue, 19 Jul 2022 23:29:53 +0530
Message-Id: <20220719180000.378186-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Song Gao <gaosong@loongson.cn>

Choose some instructions to test:
- FCMP.cond.S
- cond: ceq clt cle cne seq slt sle sne

Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220716085426.3098060-8-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/loongarch64/test_fpcom.c    | 37 +++++++++++++++++++++++++++
 tests/tcg/loongarch64/Makefile.target |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 tests/tcg/loongarch64/test_fpcom.c

diff --git a/tests/tcg/loongarch64/test_fpcom.c b/tests/tcg/loongarch64/test_fpcom.c
new file mode 100644
index 0000000000..9e81f767f9
--- /dev/null
+++ b/tests/tcg/loongarch64/test_fpcom.c
@@ -0,0 +1,37 @@
+#include <assert.h>
+
+#define TEST_COMP(N)                              \
+void test_##N(float fj, float fk)                 \
+{                                                 \
+    int rd = 0;                                   \
+                                                  \
+    asm volatile("fcmp."#N".s $fcc6,%1,%2\n"      \
+                 "movcf2gr %0, $fcc6\n"           \
+                 : "=r"(rd)                       \
+                 : "f"(fj), "f"(fk)               \
+                 : );                             \
+    assert(rd == 1);                              \
+}
+
+TEST_COMP(ceq)
+TEST_COMP(clt)
+TEST_COMP(cle)
+TEST_COMP(cne)
+TEST_COMP(seq)
+TEST_COMP(slt)
+TEST_COMP(sle)
+TEST_COMP(sne)
+
+int main()
+{
+    test_ceq(0xff700102, 0xff700102);
+    test_clt(0x00730007, 0xff730007);
+    test_cle(0xff70130a, 0xff70130b);
+    test_cne(0x1238acde, 0xff71111f);
+    test_seq(0xff766618, 0xff766619);
+    test_slt(0xff78881c, 0xff78901d);
+    test_sle(0xff780b22, 0xff790b22);
+    test_sne(0xff7bcd25, 0xff7a26cf);
+
+    return 0;
+}
diff --git a/tests/tcg/loongarch64/Makefile.target b/tests/tcg/loongarch64/Makefile.target
index 59d564725a..b320d9fd9c 100644
--- a/tests/tcg/loongarch64/Makefile.target
+++ b/tests/tcg/loongarch64/Makefile.target
@@ -13,5 +13,6 @@ LDFLAGS+=-lm
 LOONGARCH64_TESTS  = test_bit
 LOONGARCH64_TESTS  += test_div
 LOONGARCH64_TESTS  += test_fclass
+LOONGARCH64_TESTS  += test_fpcom
 
 TESTS += $(LOONGARCH64_TESTS)
-- 
2.34.1


