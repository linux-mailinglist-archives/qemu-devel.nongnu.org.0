Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECBA4807D3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 10:30:36 +0100 (CET)
Received: from localhost ([::1]:57722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n28oV-00053f-NO
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 04:30:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h3-0007g1-KD; Tue, 28 Dec 2021 04:22:53 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h1-000798-PS; Tue, 28 Dec 2021 04:22:53 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JNTXN02MHz8w5h;
 Tue, 28 Dec 2021 17:20:20 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 17:22:46 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>, Markus
 Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v5 05/14] tests/unit/test-smp-parse: No need to explicitly
 zero MachineClass members
Date: Tue, 28 Dec 2021 17:22:12 +0800
Message-ID: <20211228092221.21068-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211228092221.21068-1-wangyanan55@huawei.com>
References: <20211228092221.21068-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-devel@nongnu.org>

The default value of the MachineClass members is 0, which
means we don't have to explicitly zero them. Also the value
of "mc->smp_props.prefer_sockets" will be taken care of by
smp_parse_test(), we don't necessarily need the statement
in machine_base_class_init() either.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/unit/test-smp-parse.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 331719bbc4..72d83d1bbc 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -523,8 +523,6 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->smp_props.prefer_sockets = true;
-
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
@@ -534,9 +532,6 @@ static void machine_generic_valid_class_init(ObjectClass *oc, void *data)
 
     mc->min_cpus = MIN_CPUS;
     mc->max_cpus = MAX_CPUS;
-
-    mc->smp_props.dies_supported = false;
-    mc->smp_props.clusters_supported = false;
 }
 
 static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
@@ -546,9 +541,6 @@ static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
     /* Force invalid min CPUs and max CPUs */
     mc->min_cpus = 2;
     mc->max_cpus = 511;
-
-    mc->smp_props.dies_supported = false;
-    mc->smp_props.clusters_supported = false;
 }
 
 static void machine_with_dies_class_init(ObjectClass *oc, void *data)
@@ -559,7 +551,6 @@ static void machine_with_dies_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = MAX_CPUS;
 
     mc->smp_props.dies_supported = true;
-    mc->smp_props.clusters_supported = false;
 }
 
 static void machine_with_clusters_class_init(ObjectClass *oc, void *data)
@@ -570,7 +561,6 @@ static void machine_with_clusters_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = MAX_CPUS;
 
     mc->smp_props.clusters_supported = true;
-    mc->smp_props.dies_supported = false;
 }
 
 static void test_generic_valid(const void *opaque)
-- 
2.27.0


