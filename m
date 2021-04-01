Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6693514F9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:03:04 +0200 (CEST)
Received: from localhost ([::1]:40520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwyV-00088Y-Nh
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrj-0001tU-8Y
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:56:05 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrZ-00031u-Vh
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:56:02 -0400
Received: by mail-oi1-x231.google.com with SMTP id c16so1683427oib.3
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 05:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JjlPaXyuxmJc78UBaRD26ugJ56+ZZ/y7y6+y5dorLqk=;
 b=XgvyIi4RtYw1km+tBhq8U0qH/EaSjqKNKHdION7K73Z8gA+VDSTl820c5rWoGa3JBu
 0jN/GKDaIJIHJUbsmRBo5V+0taB1D8xagQ/QSc90YilIBbpuUbH2f/JSciXvdfcpDI7C
 cY1WNB3XiiofamElZiGMjiijA+crgkdwbvaYFeqaGndhNnG4UoNnRlCjfSHo4F5anE0s
 hdKcMQ7mT23yXBm6RoFB2GdnhiRTJB8yZfQy0nlFdC424PfXwGJjIItaY1qBpoGsisd6
 bEdfF9ATHMZ2k65CiTCNdNM3HbKLZmT9vuiAMSpUzY1g9pSheAsEgkOBpiJDjZ1iKGcR
 ldxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JjlPaXyuxmJc78UBaRD26ugJ56+ZZ/y7y6+y5dorLqk=;
 b=fbhJDPXth8J6+TvseVHC08on6aNlJclEgc5BZkj8uEWYESjOKKorKYqVm2ygJrjhxe
 OIYxiKOqC9i2d6b1oBpcbiwTTp/qm6ATJDCXTI/icLH1csYMkU797NGnd6WSTHRKF5lg
 CC9SmRoDtD9PvuGJoOdptBDDix5Vnbv22A5+7I8WpVZHDdAD4l55WHQMHsh9cSPWk0QQ
 gASZBFOb4ydT7xhiRza6D7mtSS9ScwatQbdtru8pRu2bOmpn78V9p4LX5ntrYNHeZsLx
 nQdkId09BYNsQl9YptyexMkJ9EbwbNZ+px2nbzyuTP40h6w2lvTh7E5y8/vAjV26nWDT
 uJaw==
X-Gm-Message-State: AOAM5329X8Gvj6bbsXm/PxUuO7w2LXnr4mUjGpYOhbHuw1Rvsr446Xqn
 +cmTb+62th8uM9uFQaJ4GIassjLx6R4WyRI=
X-Google-Smtp-Source: ABdhPJzLBPi6mayc6/vYAk9lDVKfWPhciOGsM08z6My0FasFOBNVJQLT1J70niGjGXwysBO8xaH9xA==
X-Received: by 2002:aca:fc11:: with SMTP id a17mr5776781oii.68.1617281752660; 
 Thu, 01 Apr 2021 05:55:52 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id w11sm1082245ooc.35.2021.04.01.05.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 05:55:52 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH RESEND v2 6/6] target/arm: Add vCPU feature 'el2' test.
Date: Thu,  1 Apr 2021 12:55:38 +0000
Message-Id: <50db1700b4df48acbecfda077b2220a0e3cf6b49.1617281290.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617281290.git.haibo.xu@linaro.org>
References: <cover.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=haibo.xu@linaro.org; helo=mail-oi1-x231.google.com
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


