Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E143B9EE0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:10:11 +0200 (CEST)
Received: from localhost ([::1]:56688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzG7e-0007IY-Oc
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lzG5W-00056Q-Co
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:07:58 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lzG5S-0003OO-Eg
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:07:58 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GGVxZ4czhz1BPYC;
 Fri,  2 Jul 2021 18:02:26 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 18:07:48 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 18:07:48 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 5/6] pc/machine: Disallow any configuration of dies for
 non-PC machines
Date: Fri, 2 Jul 2021 18:07:38 +0800
Message-ID: <20210702100739.13672-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210702100739.13672-1-wangyanan55@huawei.com>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Yanan Wang <wangyanan55@huawei.com>, Igor
 Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since a machine type does not support topology parameter of dies,
it's probably more reasonable to reject any explicit specification
to avoid possible confuse, including "dies=0" and "dies=1" although
they won't affect the calculation of non-PC machines.

Also a comment of struct SMPConfiguration is fixed.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine.c | 2 +-
 qapi/machine.json | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 58882835be..55785feee2 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -747,7 +747,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     unsigned threads = config->has_threads ? config->threads : 0;
     unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
 
-    if (config->has_dies && config->dies != 0 && config->dies != 1) {
+    if (config->has_dies) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
     }
 
diff --git a/qapi/machine.json b/qapi/machine.json
index c3210ee1fb..253f84abf6 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1297,7 +1297,7 @@
 #
 # @dies: number of dies per socket in the CPU topology
 #
-# @cores: number of cores per thread in the CPU topology
+# @cores: number of cores per die in the CPU topology
 #
 # @threads: number of threads per core in the CPU topology
 #
-- 
2.19.1


