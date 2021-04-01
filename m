Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576613513E0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:45:58 +0200 (CEST)
Received: from localhost ([::1]:60130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRupp-0003zi-C9
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulM-0007E1-RY
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:20 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:41506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulK-0002RG-IA
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:20 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so1681811otq.8
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JjlPaXyuxmJc78UBaRD26ugJ56+ZZ/y7y6+y5dorLqk=;
 b=vYCxZJgC9IYUahRmaA1hiotepZBdCe/oSE2KE5ADOywUfuk97sQdRFvGPI8sSh6TOP
 uPJjSnzNicVOqN0084yEIY3u7409qZ4v0UevAmVvjo1H9q5roEvkZTPVsvmvuDAOSVIq
 7xzHwvQX9SSTVMq1cnlmM8o7XRSFwekvqtbMDZvN3TJC953Ny3gJCZm8I8F7RHvwVbbt
 76VpQpRjoMnd4bhBVTKOjDuKZcZno+W/ZSD531u2tiyYvofepvB3KoVd7hjY3044O6yx
 cy5GjeOQLL5SQSuJAsk0gn6IWGTdm+RiFzlMlULJPFwakQajxzSm1NIv1fRK2wQutVhS
 dc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JjlPaXyuxmJc78UBaRD26ugJ56+ZZ/y7y6+y5dorLqk=;
 b=oLUtSk/966exq01R8weQhH6XeuAouIy6DgEIuehGu5fToq09pmc0lRZiamDbAgqakm
 A+NAOKJZubJWlyq8vx9eWEwAlxVQZ4BqDUQz6wKAn8eAfRi/hsaSsUO4K8z4RbymHvu3
 AQJTrc2RneD+Ts2NBx1qb+WnI8gTxH1UD+MeK2XWeaHRcI0K8WM4wGBCFjRYOvg10KLx
 w3OYBw4UIEJiYdIXzkAIzUI1od5bDnvPL6tedcubVNhnxhqdFYm8WSiMlGDnJDA+T6x5
 LayMG25k3Pl1lBsKcwOxJr24hq9zctHMHwpy218H49/irkpFOfogxD8LHSK5Xz27svgH
 uG+w==
X-Gm-Message-State: AOAM531dhxmx7PhYncCwV4N5KqywKepfqzCTqs/vMF7Dnx/mIunDDYQK
 kfS008Ca7w8BkWVYaaQ0f/2znozLagFwcFw=
X-Google-Smtp-Source: ABdhPJyRwnoAmwu/DxgoSwZSZIUdcGbtPFTuEW6tVQxgrYhuzPi1yYLtANW9vn48cGO5alSYOHz81Q==
X-Received: by 2002:a05:6830:401c:: with SMTP id
 h28mr5936899ots.347.1617273677386; 
 Thu, 01 Apr 2021 03:41:17 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id a6sm1069066otq.79.2021.04.01.03.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:41:17 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 6/6] target/arm: Add vCPU feature 'el2' test.
Date: Thu,  1 Apr 2021 10:40:58 +0000
Message-Id: <50db1700b4df48acbecfda077b2220a0e3cf6b49.1617272690.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617272690.git.haibo.xu@linaro.org>
References: <cover.1617272690.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=haibo.xu@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 abologna@redhat.com, Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/monitor.c           | 2 +-
 tests/qtest/arm-cpu-features.c | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 80c64fa355..6c39238925 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -90,7 +90,7 @@ QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
  * then the order that considers those dependencies must be used.
  */
 static const char *cpu_model_advertised_features[] = {
-    "aarch64", "pmu", "sve",
+    "aarch64", "pmu", "sve", "el2",
     "sve128", "sve256", "sve384", "sve512",
     "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb8..be07bf0c76 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -509,6 +509,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         bool kvm_supports_steal_time;
         bool kvm_supports_sve;
+        bool kvm_supports_el2;
         char max_name[8], name[8];
         uint32_t max_vq, vq;
         uint64_t vls;
@@ -533,10 +534,12 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
          */
         assert_has_feature(qts, "host", "kvm-steal-time");
         assert_has_feature(qts, "host", "sve");
+        assert_has_feature(qts, "host", "el2");
 
         resp = do_query_no_props(qts, "host");
         kvm_supports_steal_time = resp_get_feature(resp, "kvm-steal-time");
         kvm_supports_sve = resp_get_feature(resp, "sve");
+        kvm_supports_el2 = resp_get_feature(resp, "el2");
         vls = resp_get_sve_vls(resp);
         qobject_unref(resp);
 
@@ -602,11 +605,17 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         } else {
             g_assert(vls == 0);
         }
+
+        if (kvm_supports_el2) {
+            assert_set_feature(qts, "host", "el2", false);
+            assert_set_feature(qts, "host", "el2", true);
+        }
     } else {
         assert_has_not_feature(qts, "host", "aarch64");
         assert_has_not_feature(qts, "host", "pmu");
         assert_has_not_feature(qts, "host", "sve");
         assert_has_not_feature(qts, "host", "kvm-steal-time");
+        assert_has_not_feature(qts, "host", "el2");
     }
 
     qtest_quit(qts);
-- 
2.17.1


