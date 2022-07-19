Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D0F57A61D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:09:54 +0200 (CEST)
Received: from localhost ([::1]:48338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrfN-0007EG-62
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrXE-0007k5-Sr
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:28 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:44627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrX0-0006H4-56
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:28 -0400
Received: by mail-oi1-x22d.google.com with SMTP id bb16so7807118oib.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5GnJh2Q4BI2AxU/Z48B2EhSx/jk5hTj5PYBnmuOgrSE=;
 b=SSOxOg/wr4WKMDckCvpY/++Yd3rj76NG0Vyj6Bb04DfNIDswSwILwONmnsl+DF8GXz
 Yrs1zHmtxvJaP+JFGF9oDgl9nQfqdzdheuiDjirNeRIVwGZwX+FWwAjRQ1poVUU0KBt4
 EJw9fJZtpbcHESMnGx+qL1gxSwNIvpemMItrLQjQUEZm+RxrpzAnL5/c6OMMKFBy2Vqc
 ft9ADAyBtA8hSNGRKA73rVtHCJCMxC7AJncD+rdOulNYA0xRk0F8MxjxrtPTIU8hoPwC
 rpGhpoQQZ0/BmL+INguV372Pf7Re/7oz24S54bqc8s9PBvVOgICTQGQcMwzvWiziljJz
 LMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5GnJh2Q4BI2AxU/Z48B2EhSx/jk5hTj5PYBnmuOgrSE=;
 b=EPH+cxnKHg+vJRAdAuaXYj0SMeddL6e8sThIwiU7soyMV+DWvObV31UuxfKCnZ9WEB
 VNAMo9epT+lZFK1VSJ1QeI/PeIdq96dKqIhg4qt8tt++1yhs2zYLjBs9VUHKG4kn2fbO
 3xUzIaPveX3fTZqG/1to4KL+i0AQbfC9n/IGO+Sjn/IQXueCu+soWKmGU0gCIVVf8lKX
 fRMJsOiDKd4BpowQxjJUiueZRc0KNRTBspbjwXB77cZV36ahIekBmtAoE5qoFRubtmlw
 I4YdBe/ar56h+K/jpGRuqFV+iuYP8MnHAcK3kcS6XiU7NhuxvJnr93FukO4/WO6uwmXd
 G9VQ==
X-Gm-Message-State: AJIora/Gzp1s3N5qRVmyzwMqK7Z/eqbcjdl8BQBi3Eek1cP+gxXtY6mH
 /DtBqyC8f8kS8LkNMVrn4XSabyZPZLsY+v5r
X-Google-Smtp-Source: AGRyM1trbB6U/s96v0He+h5MIZWZ7sL22xD7wyGXVACuGrT2prZtRtGWtMBubwJYObNcyQHg+FHmCw==
X-Received: by 2002:a05:6808:13c1:b0:335:c146:5e06 with SMTP id
 d1-20020a05680813c100b00335c1465e06mr321842oiw.1.1658253672452; 
 Tue, 19 Jul 2022 11:01:12 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:01:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>
Subject: [PULL 15/21] tests/tcg/loongarch64: Add pcadd related instructions
 test
Date: Tue, 19 Jul 2022 23:29:54 +0530
Message-Id: <20220719180000.378186-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This includes:
- PCADDI
- PCADDU12I
- PCADDU18I
- PCALAU12I

Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220716085426.3098060-9-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/loongarch64/test_pcadd.c    | 38 +++++++++++++++++++++++++++
 tests/tcg/loongarch64/Makefile.target |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 tests/tcg/loongarch64/test_pcadd.c

diff --git a/tests/tcg/loongarch64/test_pcadd.c b/tests/tcg/loongarch64/test_pcadd.c
new file mode 100644
index 0000000000..da2a64db82
--- /dev/null
+++ b/tests/tcg/loongarch64/test_pcadd.c
@@ -0,0 +1,38 @@
+#include <assert.h>
+#include <inttypes.h>
+#include <string.h>
+
+#define TEST_PCADDU(N)                              \
+void test_##N(int a)                                \
+{                                                   \
+    uint64_t rd1 = 0;                               \
+    uint64_t rd2 = 0;                               \
+    uint64_t rm, rn;                                \
+                                                    \
+    asm volatile(""#N" %0, 0x104\n\t"               \
+                 ""#N" %1, 0x12345\n\t"             \
+                 : "=r"(rd1), "=r"(rd2)             \
+                 : );                               \
+    rm = rd2 - rd1;                                 \
+    if (!strcmp(#N, "pcalau12i")) {                 \
+        rn = ((0x12345UL - 0x104) << a) & ~0xfff;   \
+    } else {                                        \
+        rn = ((0x12345UL - 0x104) << a) + 4;        \
+    }                                               \
+    assert(rm == rn);                               \
+}
+
+TEST_PCADDU(pcaddi)
+TEST_PCADDU(pcaddu12i)
+TEST_PCADDU(pcaddu18i)
+TEST_PCADDU(pcalau12i)
+
+int main()
+{
+    test_pcaddi(2);
+    test_pcaddu12i(12);
+    test_pcaddu18i(18);
+    test_pcalau12i(12);
+
+    return 0;
+}
diff --git a/tests/tcg/loongarch64/Makefile.target b/tests/tcg/loongarch64/Makefile.target
index b320d9fd9c..0115de78ef 100644
--- a/tests/tcg/loongarch64/Makefile.target
+++ b/tests/tcg/loongarch64/Makefile.target
@@ -14,5 +14,6 @@ LOONGARCH64_TESTS  = test_bit
 LOONGARCH64_TESTS  += test_div
 LOONGARCH64_TESTS  += test_fclass
 LOONGARCH64_TESTS  += test_fpcom
+LOONGARCH64_TESTS  += test_pcadd
 
 TESTS += $(LOONGARCH64_TESTS)
-- 
2.34.1


