Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E959474F90
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:51:53 +0100 (CET)
Received: from localhost ([::1]:45102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIWO-00045v-4M
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:51:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHv3-0005xN-NN; Tue, 14 Dec 2021 19:13:17 -0500
Received: from mail-co1nam11on2084.outbound.protection.outlook.com
 ([40.107.220.84]:13537 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHuz-0005oE-RF; Tue, 14 Dec 2021 19:13:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ1/+Om3pPLLXT/Q6OCb9l2HRzUh5G6j/hJ3LnSnAk2dlzaRah2EJ7DzvIWP+bjUNP6YXuQ/PBqWvmznv89T9u6uOM+RQF4cjW54GI4jNvzv15F+R300SDsWUTIWZYOnn4Bi/sXb/uWMEl9IS1Szqf4EIkNpxEI/GIE/c8ChUHYmi0SZrXF4PMc7awsxS4R4w6kH3IShRAwrMUAtsCMb3Lle3+hXsZWAlKgXy0FMXHnk5iQzf17a5toiXnQg+5pVmoPi4e80ZqTdQffLGfRPFOZBUIQBjGXG8AF+HG0lb3SM9nrrlqap3SVZV2IbD6MVm53KejR0eMl+ro8H0VnMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Yo2dFdhUZyw09j4ZkDFcAPqi6n8mM6gCKojG61+iF8=;
 b=Uz3RQ+PhTrt2EWtaLW4C8Uhj8+hBvqYGhcXb7Q36rOIEYIjejJOOB9MQQugrJmVBmVRJN5m/cwwkYPrKDp8JpSk7SFTijiKJA85SvpV0iwHg2tYPKrpbTL+3bAuAxNMek5NYqQWV4zo98KQzSyRJruIfY7kUy4tit2zBzfLs2awCYGXWP9siVWb5KG6FUNc6UhgX5eqVsleq23f6vgDuBVkPGnSXN8K5JbOX9P0nEEI7kanHh6kM63jUzeUPCjdcx9bH4MpKgCRw0//E10vVe3ttXeDD/J5tejeyyLRvvD2w/Hy9CjAqjwQuXSgRWAQsHA5/4V0cMRyMQqSuMjEKgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Yo2dFdhUZyw09j4ZkDFcAPqi6n8mM6gCKojG61+iF8=;
 b=oksErmY9kB550FCDkvVtQiWAwjhvB2NAdP5+mcqpEhifCZtl2c4BfBb0deRyE336KMLzDNWYBIenq+/N4k38XlMl9WvbwoC9PXWg/XohFSBNfjQ9qo1abUAIadD8KJ37TTtsFIyiKgzYDlrXDCagdfYamBsgRhQUSRYiWdePk48=
Received: from DM5PR08CA0030.namprd08.prod.outlook.com (2603:10b6:4:60::19) by
 DM6PR12MB4058.namprd12.prod.outlook.com (2603:10b6:5:21d::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Wed, 15 Dec 2021 00:13:10 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::c2) by DM5PR08CA0030.outlook.office365.com
 (2603:10b6:4:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Wed, 15 Dec 2021 00:13:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:13:09 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:13:09 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Greg Kurz <groug@kaod.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 34/47] accel/tcg: Register a force_rcu notifier
Date: Tue, 14 Dec 2021 18:01:12 -0600
Message-ID: <20211215000125.378126-35-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 123671ca-d312-4cd8-130a-08d9bf5fad48
X-MS-TrafficTypeDiagnostic: DM6PR12MB4058:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB40580CB31672538B5615E48695769@DM6PR12MB4058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rWP4ObEGAnMKSOtQA11HtJzWKx0xKB/4QrszoI2YWL6joPc48NctG1W3bLk57DyM/ac0hzQvcmlILjJbr5cUVRdFJHtmQvKnnJ5AHpNu9IE51zxdQAcrrSK/Cp0rFwj1AI18OzyBwIsoTcLeSFg4hLKXmXhnRqC+ARBMbtnNdkGhBegMQPQ4+Rt8gX0JCmMZjrFoWzNz9A8aTMdqL9LsdgMKmS2ggl7nFVMu/MFfjj5emFNEOTm7Ivjk27fJeVvraAPp0KHwU7q8tL8QIYizXYwD1f5u5icL6VnRLllhTwUnhU54Dz7EAVvtCvaNSiUQUolSktW5W2DZPn4NmjgPPa+ZUmOWC1S7WTwMF72bEW67KYZs0T3iDTcaxf59lAEB29CmwecBlBePrK/ySNxcnfWHfSxau3fooTFg94ZdzQO/CaGE+hyc9ZrqCNN3j0luShdjKZ5jipOnW6xpVkCAyGBJuS2BVQDiq6fmwtgBDDMysw8mQ4Cm0OIge/SdNKAAQsP7BiBuZaru/t9zUfDSFDn4ZJqKIqfHy93b6Urq1yDg6TJU525uedZ8pBd+7e9q7noDdW5HjiGA8Kx0PxwEfJ+9AOaw1r3S26uuhuoQbNV7zCz1E+bCbRUQXb3QbIIYDp6RQXfPq4N+rXb/kDiByxFZUA1XfFkXQtfDgd3NWSj5Zi2VXoaLgKs9v2gA9X8ppx02XzWc40DmWGC+b3W0bKEhzHiHWz2sTfLjHOq9OoNRWpLiIjAh3i1ounvhRmDUly2WiJWoILfjrTjnAdcnu7NqMqEl1SylK3YE6DNTZl3OiWbOQOsRnOS3Qyzoei6j97ikpUnkzn+23LeY82T9sK78kZQPViQ/UK14+nMCmbm4Iu291qxLdPNtXDbWt9D9
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(70586007)(2906002)(47076005)(356005)(6916009)(8676002)(508600001)(83380400001)(81166007)(36756003)(44832011)(40460700001)(86362001)(8936002)(36860700001)(70206006)(26005)(966005)(2616005)(5660300002)(6666004)(186003)(4326008)(16526019)(316002)(1076003)(336012)(426003)(82310400004)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:13:09.8834 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 123671ca-d312-4cd8-130a-08d9bf5fad48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4058
Received-SPF: softfail client-ip=40.107.220.84;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Greg Kurz <groug@kaod.org>

A TCG vCPU doing a busy loop systematicaly hangs the QEMU monitor
if the user passes 'device_add' without argument. This is because
drain_cpu_all() which is called from qmp_device_add() cannot return
if readers don't exit read-side critical sections. That is typically
what busy-looping TCG vCPUs do:

int cpu_exec(CPUState *cpu)
{
[...]
    rcu_read_lock();
[...]
    while (!cpu_handle_exception(cpu, &ret)) {
        // Busy loop keeps vCPU here
    }
[...]
    rcu_read_unlock();

    return ret;
}

For MTTCG, have all vCPU threads register a force_rcu notifier that will
kick them out of the loop using async_run_on_cpu(). The notifier is called
with the rcu_registry_lock mutex held, using async_run_on_cpu() ensures
there are no deadlocks.

For RR, a single thread runs all vCPUs. Just register a single notifier
that kicks the current vCPU to the next one.

For MTTCG:
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>

For RR:
Suggested-by: Richard Henderson <richard.henderson@linaro.org>

Fixes: 7bed89958bfb ("device_core: use drain_call_rcu in in qmp_device_add")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/650
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211109183523.47726-3-groug@kaod.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit dd47a8f654d84f666b235ce8891e17ee76f9be8b)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 accel/tcg/tcg-accel-ops-mttcg.c | 26 ++++++++++++++++++++++++++
 accel/tcg/tcg-accel-ops-rr.c    | 10 ++++++++++
 2 files changed, 36 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index 847d2079d2..29632bd4c0 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -28,6 +28,7 @@
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
 #include "qemu/main-loop.h"
+#include "qemu/notify.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
 #include "hw/boards.h"
@@ -35,6 +36,26 @@
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
 
+typedef struct MttcgForceRcuNotifier {
+    Notifier notifier;
+    CPUState *cpu;
+} MttcgForceRcuNotifier;
+
+static void do_nothing(CPUState *cpu, run_on_cpu_data d)
+{
+}
+
+static void mttcg_force_rcu(Notifier *notify, void *data)
+{
+    CPUState *cpu = container_of(notify, MttcgForceRcuNotifier, notifier)->cpu;
+
+    /*
+     * Called with rcu_registry_lock held, using async_run_on_cpu() ensures
+     * that there are no deadlocks.
+     */
+    async_run_on_cpu(cpu, do_nothing, RUN_ON_CPU_NULL);
+}
+
 /*
  * In the multi-threaded case each vCPU has its own thread. The TLS
  * variable current_cpu can be used deep in the code to find the
@@ -43,12 +64,16 @@
 
 static void *mttcg_cpu_thread_fn(void *arg)
 {
+    MttcgForceRcuNotifier force_rcu;
     CPUState *cpu = arg;
 
     assert(tcg_enabled());
     g_assert(!icount_enabled());
 
     rcu_register_thread();
+    force_rcu.notifier.notify = mttcg_force_rcu;
+    force_rcu.cpu = cpu;
+    rcu_add_force_rcu_notifier(&force_rcu.notifier);
     tcg_register_thread();
 
     qemu_mutex_lock_iothread();
@@ -100,6 +125,7 @@ static void *mttcg_cpu_thread_fn(void *arg)
 
     tcg_cpus_destroy(cpu);
     qemu_mutex_unlock_iothread();
+    rcu_remove_force_rcu_notifier(&force_rcu.notifier);
     rcu_unregister_thread();
     return NULL;
 }
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index c02c061ecb..aa5b4ac247 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -28,6 +28,7 @@
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
 #include "qemu/main-loop.h"
+#include "qemu/notify.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
 
@@ -135,6 +136,11 @@ static void rr_deal_with_unplugged_cpus(void)
     }
 }
 
+static void rr_force_rcu(Notifier *notify, void *data)
+{
+    rr_kick_next_cpu();
+}
+
 /*
  * In the single-threaded case each vCPU is simulated in turn. If
  * there is more than a single vCPU we create a simple timer to kick
@@ -145,10 +151,13 @@ static void rr_deal_with_unplugged_cpus(void)
 
 static void *rr_cpu_thread_fn(void *arg)
 {
+    Notifier force_rcu;
     CPUState *cpu = arg;
 
     assert(tcg_enabled());
     rcu_register_thread();
+    force_rcu.notify = rr_force_rcu;
+    rcu_add_force_rcu_notifier(&force_rcu);
     tcg_register_thread();
 
     qemu_mutex_lock_iothread();
@@ -257,6 +266,7 @@ static void *rr_cpu_thread_fn(void *arg)
         rr_deal_with_unplugged_cpus();
     }
 
+    rcu_remove_force_rcu_notifier(&force_rcu);
     rcu_unregister_thread();
     return NULL;
 }
-- 
2.25.1


