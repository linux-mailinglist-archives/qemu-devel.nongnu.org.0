Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD84D44BE1C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 10:53:40 +0100 (CET)
Received: from localhost ([::1]:36618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkIW-0007lb-2S
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 04:53:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mkkHD-0006RL-Hq
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:52:19 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mkkH9-00080g-Ct
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:52:19 -0500
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hq0W0297Qz90xx;
 Wed, 10 Nov 2021 17:51:56 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 10 Nov 2021 17:52:11 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 10 Nov 2021 17:52:10 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 1/2] tests/unit/test-smp-parse: Make an unified name for the
 tested machine
Date: Wed, 10 Nov 2021 17:52:07 +0800
Message-ID: <20211110095208.448-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211110095208.448-1-wangyanan55@huawei.com>
References: <20211110095208.448-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the name of the tested machine in the expected error
messages is hardcoded as "(null)" which is not good, because the
actual generated name of the machine maybe "(null)" or "(NULL)"
which will cause an unexpected test failure in some CI platforms.

So let's rename the tested machine with an unified string and
tweak the expected error messages accordingly.

Fixes: 9e8e393bb7 ("tests/unit: Add an unit test for smp parsing")
Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/unit/test-smp-parse.c | 38 ++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index cbe0c99049..872512aa37 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -23,6 +23,8 @@
 #define MIN_CPUS 1   /* set the min CPUs supported by the machine as 1 */
 #define MAX_CPUS 512 /* set the max CPUs supported by the machine as 512 */
 
+#define SMP_MACHINE_NAME "TEST-SMP"
+
 /*
  * Used to define the generic 3-level CPU topology hierarchy
  *  -sockets/cores/threads
@@ -315,13 +317,13 @@ static struct SMPTestData data_generic_invalid[] = {
          * should tweak the supported min CPUs to 2 for testing */
         .config = SMP_CONFIG_GENERIC(T, 1, F, 0, F, 0, F, 0, F, 0),
         .expect_error = "Invalid SMP CPUs 1. The min CPUs supported "
-                        "by machine '(null)' is 2",
+                        "by machine '" SMP_MACHINE_NAME "' is 2",
     }, {
         /* config: -smp 512
          * should tweak the supported max CPUs to 511 for testing */
         .config = SMP_CONFIG_GENERIC(T, 512, F, 0, F, 0, F, 0, F, 0),
         .expect_error = "Invalid SMP CPUs 512. The max CPUs supported "
-                        "by machine '(null)' is 511",
+                        "by machine '" SMP_MACHINE_NAME "' is 511",
     },
 };
 
@@ -480,26 +482,41 @@ static void unsupported_params_init(MachineClass *mc, SMPTestData *data)
     }
 }
 
-/* Reset the related machine properties before each sub-test */
-static void smp_machine_class_init(MachineClass *mc)
+static Object *smp_test_machine_init(void)
 {
+    Object *obj = object_new(TYPE_MACHINE);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+
+    g_free(mc->name);
+    mc->name = g_strdup(SMP_MACHINE_NAME);
+
     mc->min_cpus = MIN_CPUS;
     mc->max_cpus = MAX_CPUS;
 
     mc->smp_props.prefer_sockets = true;
     mc->smp_props.dies_supported = false;
+
+    return obj;
+}
+
+static void smp_test_machine_deinit(Object *obj)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+
+    g_free(mc->name);
+    mc->name = NULL;
+
+    object_unref(obj);
 }
 
 static void test_generic(void)
 {
-    Object *obj = object_new(TYPE_MACHINE);
+    Object *obj = smp_test_machine_init();
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
     SMPTestData *data = &(SMPTestData){{ }};
     int i;
 
-    smp_machine_class_init(mc);
-
     for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
         *data = data_generic_valid[i];
         unsupported_params_init(mc, data);
@@ -523,19 +540,18 @@ static void test_generic(void)
         smp_parse_test(ms, data, false);
     }
 
-    object_unref(obj);
+    smp_test_machine_deinit(obj);
 }
 
 static void test_with_dies(void)
 {
-    Object *obj = object_new(TYPE_MACHINE);
+    Object *obj = smp_test_machine_init();
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
     SMPTestData *data = &(SMPTestData){{ }};
     unsigned int num_dies = 2;
     int i;
 
-    smp_machine_class_init(mc);
     mc->smp_props.dies_supported = true;
 
     for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
@@ -575,7 +591,7 @@ static void test_with_dies(void)
         smp_parse_test(ms, data, false);
     }
 
-    object_unref(obj);
+    smp_test_machine_deinit(obj);
 }
 
 int main(int argc, char *argv[])
-- 
2.19.1


