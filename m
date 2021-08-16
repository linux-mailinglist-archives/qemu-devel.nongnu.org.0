Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249103ECCBE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 04:46:38 +0200 (CEST)
Received: from localhost ([::1]:44088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFSe4-0006xd-Lv
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 22:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mFSdI-0006Ca-JL
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 22:45:48 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mFSdF-0004vG-Je
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 22:45:48 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gnz6M2RFMzYlP1;
 Mon, 16 Aug 2021 10:45:15 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 16 Aug 2021 10:45:36 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 16 Aug 2021 10:45:36 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, <qemu-devel@nongnu.org>
Subject: [PATCH for-6.1 v6 1/1] machine: Disallow specifying topology
 parameters as zero
Date: Mon, 16 Aug 2021 10:45:22 +0800
Message-ID: <20210816024522.143124-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210816024522.143124-1-wangyanan55@huawei.com>
References: <20210816024522.143124-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
Cc: Yanan Wang <wangyanan55@huawei.com>, wanghaibin.wang@huawei.com,
 Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the SMP configuration, we should either provide a topology
parameter with a reasonable value (greater than zero) or just
omit it and QEMU will compute the missing value. Users should
have never provided a configuration with parameters as zero
(e.g. -smp 8,sockets=0) which should be treated as invalid.

But commit 1e63fe68580 (machine: pass QAPI struct to mc->smp_parse)
has added some doc which implied that 'anything=0' is valid and
has the same semantics as omitting a parameter.

To avoid meaningless configurations possibly introduced by users
in the future and consequently a necessary deprecation process,
fix the doc and also add the corresponding sanity check.

Fixes: 1e63fe68580 (machine: pass QAPI struct to mc->smp_parse)
Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Tested-by: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/core/machine.c | 14 ++++++++++++++
 qapi/machine.json |  6 +++---
 qemu-options.hx   | 12 +++++++-----
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 54e040587d..a7e119469a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -832,6 +832,20 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    /*
+     * A specified topology parameter must be greater than zero,
+     * explicit configuration like "cpus=0" is not allowed.
+     */
+    if ((config->has_cpus && config->cpus == 0) ||
+        (config->has_sockets && config->sockets == 0) ||
+        (config->has_dies && config->dies == 0) ||
+        (config->has_cores && config->cores == 0) ||
+        (config->has_threads && config->threads == 0) ||
+        (config->has_maxcpus && config->maxcpus == 0)) {
+        error_setg(errp, "CPU topology parameters must be greater than zero");
+        goto out_free;
+    }
+
     mc->smp_parse(ms, config, errp);
     if (*errp) {
         goto out_free;
diff --git a/qapi/machine.json b/qapi/machine.json
index c3210ee1fb..9272cb3cf8 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1288,8 +1288,8 @@
 ##
 # @SMPConfiguration:
 #
-# Schema for CPU topology configuration.  "0" or a missing value lets
-# QEMU figure out a suitable value based on the ones that are provided.
+# Schema for CPU topology configuration. A missing value lets QEMU
+# figure out a suitable value based on the ones that are provided.
 #
 # @cpus: number of virtual CPUs in the virtual machine
 #
@@ -1297,7 +1297,7 @@
 #
 # @dies: number of dies per socket in the CPU topology
 #
-# @cores: number of cores per thread in the CPU topology
+# @cores: number of cores per die in the CPU topology
 #
 # @threads: number of threads per core in the CPU topology
 #
diff --git a/qemu-options.hx b/qemu-options.hx
index 83aa59a920..aee622f577 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -227,11 +227,13 @@ SRST
     of computing the CPU maximum count.
 
     Either the initial CPU count, or at least one of the topology parameters
-    must be specified. Values for any omitted parameters will be computed
-    from those which are given. Historically preference was given to the
-    coarsest topology parameters when computing missing values (ie sockets
-    preferred over cores, which were preferred over threads), however, this
-    behaviour is considered liable to change.
+    must be specified. The specified parameters must be greater than zero,
+    explicit configuration like "cpus=0" is not allowed. Values for any
+    omitted parameters will be computed from those which are given.
+    Historically preference was given to the coarsest topology parameters
+    when computing missing values (ie sockets preferred over cores, which
+    were preferred over threads), however, this behaviour is considered
+    liable to change.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.19.1


