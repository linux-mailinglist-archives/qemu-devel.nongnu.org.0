Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465A839BC71
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:00:17 +0200 (CEST)
Received: from localhost ([::1]:38050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCF5-00017Y-JY
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8W-0002dc-EI
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:28 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8S-0008SH-He
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id c9so1114018wrt.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WOuysOnef2mMKklKTFeIYkHV2AEtzMpA+XWnC2+7giM=;
 b=lf4rpAtdDhOuo89nFjvu+c5ZRPeDbZIxLSiUlimSH2V32i6d08AWPx6bdZ00+CBKxV
 p4Nr1NEF1OSrlDSwFWItTQHgmoh9Hpw5fHeiTV5sjLu/hbL3cFCmgZVoelB8JvBv8F9S
 LoJwhA+6s7djrxFZ+xbL7Qs2wBw7Zqf48rh16OzH9lrcC4uSOaDYPw5K0blRpS3htudg
 6+wTPB6i5NisBGF4xd67zWWRkWAHOZmn4uxIR78F4F2GBY5LaIw5hDedTN0uiHeoCAl0
 GKyoDemr3Q8R1KJWSNN6N2uutckvOyxxDC2OnJ7MKpoKGHDGd5WpNpteii8V0GE2Vztq
 AsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WOuysOnef2mMKklKTFeIYkHV2AEtzMpA+XWnC2+7giM=;
 b=DMT4ZyIoNPyZoX4EnlDRTx+wdfYHxm292riAM5q+4sgNk6FOp8aiGIICB+aQOSfT2E
 VkhdklO6n2VjZ+++4GenwdiqrsuI+PcKVxOwu618TjJDxa1o9eZMg9LTmILpNBzVduzH
 c1IRIJhq2YR8YyQI689o77UuZSKQ1IZVXGLI2jjaqS5yxUS2fpHE3qsIWhdN3E4bjiSz
 lD+CJCrfj5SAgu7zzml4Xddqdrd2HRtYzTH4T4o3tt9yYOBxW85ySyUhyST6XLho7qh5
 QgBuplp60sOwK9nMyfLN+6NYR/4I1MhbvfxKCyjN/EBh5EMyzGL+9C2mOszogRb7oEex
 gIJA==
X-Gm-Message-State: AOAM531byPFsc+oPTNS4mmySORWEIQBiBhi2Oppiohp3/D5AyMbPA4R+
 baV1u247TxjwKQuCHnUB/GwQ0g==
X-Google-Smtp-Source: ABdhPJy/+4acn7KxICuk9nrmjOuSBxj8wqrTrQlG/EMtj/MWkxBw6rG8kqFQdYuVJkegY6762RR1Sw==
X-Received: by 2002:a5d:6109:: with SMTP id v9mr4712052wrt.0.1622822002504;
 Fri, 04 Jun 2021 08:53:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm1793301wmm.33.2021.06.04.08.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 05F101FF93;
 Fri,  4 Jun 2021 16:53:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 07/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for TCG
Date: Fri,  4 Jun 2021 16:51:40 +0100
Message-Id: <20210604155312.15902-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, only run these tests if TCG
is built into the QEMU binary.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505125806.1263441-8-philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index b1d406542f..0d9145dd16 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -20,7 +20,7 @@
  */
 #define SVE_MAX_VQ 16
 
-#define MACHINE     "-machine virt,gic-version=max -accel tcg "
+#define MACHINE_TCG "-machine virt,gic-version=max -accel tcg "
 #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
@@ -337,7 +337,7 @@ static void sve_tests_sve_max_vq_8(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve-max-vq=8");
 
     assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
 
@@ -372,7 +372,7 @@ static void sve_tests_sve_off(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve=off");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve=off");
 
     /* SVE is off, so the map should be empty. */
     assert_sve_vls(qts, "max", 0, NULL);
@@ -428,7 +428,7 @@ static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max");
+    qts = qtest_init(MACHINE_TCG "-cpu max");
 
     /* Test common query-cpu-model-expansion input validation */
     assert_type_full(qts);
@@ -593,8 +593,10 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
-    qtest_add_data_func("/arm/query-cpu-model-expansion",
-                        NULL, test_query_cpu_model_expansion);
+    if (qtest_has_accel("tcg")) {
+        qtest_add_data_func("/arm/query-cpu-model-expansion",
+                            NULL, test_query_cpu_model_expansion);
+    }
 
     /*
      * For now we only run KVM specific tests with AArch64 QEMU in
@@ -608,7 +610,7 @@ int main(int argc, char **argv)
                             NULL, sve_tests_sve_off_kvm);
     }
 
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("tcg")) {
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-max-vq-8",
                             NULL, sve_tests_sve_max_vq_8);
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
-- 
2.20.1


