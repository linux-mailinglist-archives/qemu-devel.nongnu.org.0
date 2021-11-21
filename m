Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E333E45835C
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 13:31:08 +0100 (CET)
Received: from localhost ([::1]:37006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1molzw-0007Av-0e
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 07:31:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluM-0003pG-UG; Sun, 21 Nov 2021 07:25:22 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluH-0005l5-ST; Sun, 21 Nov 2021 07:25:22 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HxqKq5MX1z1DJQV;
 Sun, 21 Nov 2021 20:22:39 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 20:25:07 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Markus Armbruster <armbru@redhat.com>, Eric
 Blake <eblake@redhat.com>, <wanghaibin.wang@huawei.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: [PATCH v4 01/10] qemu-options: Improve readability of SMP related Docs
Date: Sun, 21 Nov 2021 20:24:53 +0800
Message-ID: <20211121122502.9844-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211121122502.9844-1-wangyanan55@huawei.com>
References: <20211121122502.9844-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

We have a description in qemu-options.hx for each CPU topology
parameter to explain what it exactly means, and also an extra
declaration for the target-specific one, e.g. "for PC only"
when describing "dies", and "for PC, it's on one die" when
describing "cores".

Now we are going to introduce one more non-generic parameter
"clusters", it will make the Doc less readable and  if we still
continue to use the legacy way to describe it.

So let's at first make two tweaks of the Docs to improve the
readability and also scalability:
1) In the -help text: Delete the extra specific declaration and
   describe each topology parameter level by level. Then add a
   note to declare that different machines may support different
   subsets and the actual meaning of the supported parameters
   will vary accordingly.
2) In the rST text: List all the sub-hierarchies currently
   supported in QEMU, and correspondingly give an example of
   -smp configuration for each of them.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 qemu-options.hx | 76 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 59 insertions(+), 17 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index ae2c6dbbfc..7a59db7764 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -207,14 +207,26 @@ ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
     "-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
-    "                set the number of CPUs to 'n' [default=1]\n"
+    "                set the number of initial CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total CPUs, including\n"
     "                offline CPUs for hotplug, etc\n"
-    "                sockets= number of discrete sockets in the system\n"
-    "                dies= number of CPU dies on one socket (for PC only)\n"
-    "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
-    "                threads= number of threads on one CPU core\n",
-        QEMU_ARCH_ALL)
+    "                sockets= number of sockets on the machine board\n"
+    "                dies= number of dies in one socket\n"
+    "                cores= number of cores in one die\n"
+    "                threads= number of threads in one core\n"
+    "Note: Different machines may have different subsets of the CPU topology\n"
+    "      parameters supported, so the actual meaning of the supported parameters\n"
+    "      will vary accordingly. For example, for a machine type that supports a\n"
+    "      three-level CPU hierarchy of sockets/cores/threads, the parameters will\n"
+    "      sequentially mean as below:\n"
+    "                sockets means the number of sockets on the machine board\n"
+    "                cores means the number of cores in one socket\n"
+    "                threads means the number of threads in one core\n"
+    "      For a particular machine type board, an expected CPU topology hierarchy\n"
+    "      can be defined through the supported sub-option. Unsupported parameters\n"
+    "      can also be provided in addition to the sub-option, but their values\n"
+    "      must be set as 1 in the purpose of correct parsing.\n",
+    QEMU_ARCH_ALL)
 SRST
 ``-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
     Simulate a SMP system with '\ ``n``\ ' CPUs initially present on
@@ -225,27 +237,57 @@ SRST
     initial CPU count will match the maximum number. When only one of them
     is given then the omitted one will be set to its counterpart's value.
     Both parameters may be specified, but the maximum number of CPUs must
-    be equal to or greater than the initial CPU count. Both parameters are
-    subject to an upper limit that is determined by the specific machine
-    type chosen.
-
-    To control reporting of CPU topology information, the number of sockets,
-    dies per socket, cores per die, and threads per core can be specified.
-    The sum `` sockets * cores * dies * threads `` must be equal to the
-    maximum CPU count. CPU targets may only support a subset of the topology
-    parameters. Where a CPU target does not support use of a particular
-    topology parameter, its value should be assumed to be 1 for the purpose
-    of computing the CPU maximum count.
+    be equal to or greater than the initial CPU count. Product of the
+    CPU topology hierarchy must be equal to the maximum number of CPUs.
+    Both parameters are subject to an upper limit that is determined by
+    the specific machine type chosen.
+
+    To control reporting of CPU topology information, values of the topology
+    parameters can be specified. Machines may only support a subset of the
+    parameters and different machines may have different subsets supported
+    which vary depending on capacity of the corresponding CPU targets. So
+    for a particular machine type board, an expected topology hierarchy can
+    be defined through the supported sub-option. Unsupported parameters can
+    also be provided in addition to the sub-option, but their values must be
+    set as 1 in the purpose of correct parsing.
 
     Either the initial CPU count, or at least one of the topology parameters
     must be specified. The specified parameters must be greater than zero,
     explicit configuration like "cpus=0" is not allowed. Values for any
     omitted parameters will be computed from those which are given.
+
+    For example, the following sub-option defines a CPU topology hierarchy
+    (2 sockets totally on the machine, 2 cores per socket, 2 threads per
+    core) for a machine that only supports sockets/cores/threads.
+    Some members of the option can be omitted but their values will be
+    automatically computed:
+
+    ::
+
+        -smp 8,sockets=2,cores=2,threads=2,maxcpus=8
+
+    The following sub-option defines a CPU topology hierarchy (2 sockets
+    totally on the machine, 2 dies per socket, 2 cores per die, 2 threads
+    per core) for PC machines which support sockets/dies/cores/threads.
+    Some members of the option can be omitted but their values will be
+    automatically computed:
+
+    ::
+
+        -smp 16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16
+
     Historically preference was given to the coarsest topology parameters
     when computing missing values (ie sockets preferred over cores, which
     were preferred over threads), however, this behaviour is considered
     liable to change. Prior to 6.2 the preference was sockets over cores
     over threads. Since 6.2 the preference is cores over sockets over threads.
+
+    For example, the following option defines a machine board with 2 sockets
+    of 1 core before 6.2 and 1 socket of 2 cores after 6.2:
+
+    ::
+
+        -smp 2
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.19.1


