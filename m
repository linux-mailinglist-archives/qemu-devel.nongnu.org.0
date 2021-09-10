Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409E84067F1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 09:45:06 +0200 (CEST)
Received: from localhost ([::1]:54402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mObDd-0001N6-C9
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 03:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazy-0005Wq-Um; Fri, 10 Sep 2021 03:30:58 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazh-0000om-Ra; Fri, 10 Sep 2021 03:30:58 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H5S9S0xwszbmRS;
 Fri, 10 Sep 2021 15:26:36 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:38 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:37 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v9 07/16] qtest/numa-test: Use detailed -smp CLI in
 test_def_cpu_split
Date: Fri, 10 Sep 2021 15:30:16 +0800
Message-ID: <20210910073025.16480-8-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210910073025.16480-1-wangyanan55@huawei.com>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Greg Kurz <groug@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 wanghaibin.wang@huawei.com, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
the preference of sockets/cores in -smp parsing is considered liable
to change, and actually we are going to change it in a coming commit.
So it'll be more stable to use detailed -smp CLIs in the testcases
that have strong dependency on the parsing results.

Currently, test_def_cpu_split use "-smp 8" and will get 8 CPU sockets
based on current parsing rule. But if we change to prefer cores over
sockets we will get one CPU socket will 8 cores, and this testcase
will not get expected numa set by default on x86_64 (Ok on aarch64).

So now explicitly use "-smp 8,sockets=8" to avoid affect from parsing
logic change.

Cc: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/qtest/numa-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index fd7a2e80a0..90bf68a5b3 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -42,7 +42,8 @@ static void test_def_cpu_split(const void *data)
     g_autofree char *s = NULL;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-machine smp.cpus=8 -numa node,memdev=ram -numa node");
+    cli = make_cli(data, "-machine smp.cpus=8,smp.sockets=8 "
+                         "-numa node,memdev=ram -numa node");
     qts = qtest_init(cli);
 
     s = qtest_hmp(qts, "info numa");
-- 
2.23.0


