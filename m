Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7F2A7794
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 07:52:29 +0100 (CET)
Received: from localhost ([::1]:51390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaZ8G-00042p-KR
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 01:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kaZ6u-0003Up-ND; Thu, 05 Nov 2020 01:51:04 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kaZ6p-0001ni-GL; Thu, 05 Nov 2020 01:51:04 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CRZ0g1cbLzLqlb;
 Thu,  5 Nov 2020 14:50:43 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Thu, 5 Nov 2020 14:50:46 +0800
Message-ID: <5FA3A0C6.5040500@huawei.com>
Date: Thu, 5 Nov 2020 14:50:46 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Thomas Huth <thuth@redhat.com>, <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: [PATCH V2] qtest: Fix bad printf format specifiers
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 01:50:51
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should use printf format specifier PRIu32 instead of "%d" for
argument of type 'uint32_t'.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 tests/qtest/arm-cpu-features.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index d20094d5a7..003ba24fac 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -536,7 +536,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         if (kvm_supports_sve) {
             g_assert(vls != 0);
             max_vq = 64 - __builtin_clzll(vls);
-            sprintf(max_name, "sve%d", max_vq * 128);
+            sprintf(max_name, "sve%" PRIu32, max_vq * 128);

             /* Enabling a supported length is of course fine. */
             assert_sve_vls(qts, "host", vls, "{ %s: true }", max_name);
@@ -556,7 +556,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
                  * unless all larger, supported vector lengths are also
                  * disabled.
                  */
-                sprintf(name, "sve%d", vq * 128);
+                sprintf(name, "sve%" PRIu32, vq * 128);
                 error = g_strdup_printf("cannot disable %s", name);
                 assert_error(qts, "host", error,
                              "{ %s: true, %s: false }",
@@ -569,7 +569,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
              * we need at least one vector length enabled.
              */
             vq = __builtin_ffsll(vls);
-            sprintf(name, "sve%d", vq * 128);
+            sprintf(name, "sve%" PRIu32, vq * 128);
             error = g_strdup_printf("cannot disable %s", name);
             assert_error(qts, "host", error, "{ %s: false }", name);
             g_free(error);
@@ -581,7 +581,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
                 }
             }
             if (vq <= SVE_MAX_VQ) {
-                sprintf(name, "sve%d", vq * 128);
+                sprintf(name, "sve%" PRIu32, vq * 128);
                 error = g_strdup_printf("cannot enable %s", name);
                 assert_error(qts, "host", error, "{ %s: true }", name);
                 g_free(error);
-- 
2.19.1

