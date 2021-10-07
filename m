Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE92A42516B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:46:01 +0200 (CEST)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQuW-0007xW-O4
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYQsP-0005u7-31
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:43:49 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYQsM-0002T9-NR
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:43:48 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HQ7Dj60CRz1DHZP;
 Thu,  7 Oct 2021 18:42:13 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 18:43:43 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 18:43:42 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 3/3] qapi/machine.json: Improve scalability of the SMP
 related comments
Date: Thu, 7 Oct 2021 18:43:37 +0800
Message-ID: <20211007104337.10232-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211007104337.10232-1-wangyanan55@huawei.com>
References: <20211007104337.10232-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rewrite the comments related to SMP in qapi/machine.json,
so that we can easily/clearly extend it with more target
specific CPU topology members introduced in the future.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 qapi/machine.json | 47 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 5db54df298..2eda8e996e 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -866,10 +866,15 @@
 # a CPU is being hotplugged.
 #
 # @node-id: NUMA node ID the CPU belongs to
-# @socket-id: socket number within node/board the CPU belongs to
-# @die-id: die number within node/board the CPU belongs to (Since 4.1)
-# @core-id: core number within die the CPU belongs to
-# @thread-id: thread number within core the CPU belongs to
+#
+# @socket-id: socket number within the upper layer container the CPU belongs to
+#
+# @die-id: die number within the upper layer container the CPU belongs to
+#          (since 4.1)
+#
+# @core-id: core number within the upper layer container the CPU belongs to
+#
+# @thread-id: thread number within the upper layer container the CPU belongs to
 #
 # Note: currently there are 5 properties that could be present
 #       but management should be prepared to pass through other
@@ -877,6 +882,15 @@
 #       interface extension. This also requires the filed names to be kept in
 #       sync with the properties passed to -device/device_add.
 #
+#       Different machines may have different subsets of the CPU topology
+#       parameters supported, so the description of the supported parameters
+#       in this struct will vary accordingly. For example, for a machine that
+#       supports a CPU hierarchy of sockets/cores/threads, the description of
+#       the supported members will be: @socket-id means socket number within
+#       node/board the CPU belongs to, @core-id means core number within socket
+#       the CPU belongs to, @thread-id means thread number within core the CPU
+#       belongs to.
+#
 # Since: 2.7
 ##
 { 'struct': 'CpuInstanceProperties',
@@ -1390,19 +1404,34 @@
 # Schema for CPU topology configuration.  A missing value lets
 # QEMU figure out a suitable value based on the ones that are provided.
 #
-# @cpus: number of virtual CPUs in the virtual machine
+# @cpus: number of present virtual CPUs in the virtual machine
 #
-# @sockets: number of sockets in the CPU topology
+# @sockets: number of sockets per upper layer container in the CPU topology
 #
-# @dies: number of dies per socket in the CPU topology
+# @dies: number of dies per upper layer container in the CPU topology
+#        (since 4.1)
 #
-# @cores: number of cores per die in the CPU topology
+# @cores: number of cores per upper layer container in the CPU topology
 #
-# @threads: number of threads per core in the CPU topology
+# @threads: number of threads per upper layer container in the CPU topology
 #
 # @maxcpus: maximum number of hotpluggable virtual CPUs in the virtual machine
 #
+# Notes: Different machines may have different subsets of the CPU topology
+#        parameters supported, so the description of the supported parameters
+#        in this struct will vary accordingly. For example, for a machine
+#        that supports a CPU hierarchy of sockets/cores/threads, the
+#        description of the supported members will be: @sockets means the
+#        total number of sockets on the machine which is the upper layer
+#        container of socket, @cores means the number of cores per socket
+#        which is the upper layer container of core, @threads means the number
+#        of threads per core which is the upper layer container of thread.
+#
+#        Unsupported parameters can also be provided in this struct, but their
+#        values must be set as 1 in the purpose of correct parsing.
+#
 # Since: 6.1
+#
 ##
 { 'struct': 'SMPConfiguration', 'data': {
      '*cpus': 'int',
-- 
2.19.1


