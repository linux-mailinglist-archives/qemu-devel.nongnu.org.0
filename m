Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BC8474F07
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:20:13 +0100 (CET)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI1l-0007eZ-28
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:20:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHui-0005W8-00; Tue, 14 Dec 2021 19:12:56 -0500
Received: from mail-mw2nam10on2065.outbound.protection.outlook.com
 ([40.107.94.65]:22241 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHuf-0005nW-3N; Tue, 14 Dec 2021 19:12:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLeHLXMUx55tdGSjxl2fq7FIoHyL8BjGFuvkDcQTwRDXhm6WG9UrlRPgcUdQfucf55dCJpeQpwTw8SzF+k/xrPF2/YolhlywgZ5Lf84uxQHmn26a+2cgQxdBZ/YZbYkE3ogUcadgZRCg7LvCV3Vx1pld0+qOlbtLRzYErYGxJyrJeA1QpcYS6/XSEJIqs+hcLzNoasyBhcD+oGj9XdDIIQMcBvzUGOYTPcP/UnTmFi2uk8dfQ0BAFv2zR7CnV3Hl+GcnLFKv8jlv+o0tlAeob3L7o9APCA4AnO+A0cFKOEaTqVKnxYGBnUNA+O+hTNJhhVQg5bQA/ZJfywWQtSh5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bz9nhSKbhpDvpoQv6ltenATNG0v8B5ioh69SSjaa3Ok=;
 b=TYrFshl7grgIyCjQtFbim9Mo40XSamEI1fk9DgObSfqyKQfv3eFtPWzw8w+FzccQe5Oqw8Fx6t2BkekviHfxz2qOfpyVWrvu4XAwhn5+dAdrgSaT3ppiuE/KQ+AWcwp2YkXKyzexRYTd74IOxUXkSmbx0WUgWN6tXgIs5FtfMXUbXyxZEEqbOn4S27Q395C0urse4eaKCcQMa4v+lFNwG7V3RfR9RMhVtWBJj0TW+C2BI00/4WyIiXqvRHDQYtDAzYNKm0vS+awUubBiEmcKLY3W8+31Hfb0K/ZXHVgYmKwT8SHeLC6BD/6YWX6YIbQrRdJhdsUFMI89UrMHia8W6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz9nhSKbhpDvpoQv6ltenATNG0v8B5ioh69SSjaa3Ok=;
 b=jPT8TCdwfh1GH9i6SWLyOzoW30DlYyY8iO09nxLviCCwGnonWZXGCw+BvvJ4LWmPHihsW3glKsP1r52dZIz00RVNt+Jqfp68e5c4vQyos9CfToElA9Yd4DrsgMQyG1KOsRIvcu4GX/Gx+IYBOf1Xcxh7gPaUpkW6giZXU3O1QrU=
Received: from DM6PR11CA0050.namprd11.prod.outlook.com (2603:10b6:5:14c::27)
 by BN9PR12MB5049.namprd12.prod.outlook.com (2603:10b6:408:132::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 00:12:49 +0000
Received: from DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::f5) by DM6PR11CA0050.outlook.office365.com
 (2603:10b6:5:14c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:12:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT013.mail.protection.outlook.com (10.13.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:12:48 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:12:48 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Greg Kurz <groug@kaod.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 33/47] rcu: Introduce force_rcu notifier
Date: Tue, 14 Dec 2021 18:01:11 -0600
Message-ID: <20211215000125.378126-34-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 36de5dc2-503a-48b7-7c62-08d9bf5fa0d6
X-MS-TrafficTypeDiagnostic: BN9PR12MB5049:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5049DCECC7FE586AE5B6AD3A95769@BN9PR12MB5049.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M2pz0QmMuso/eTBvz7Lmco3/+R8ncfUBiScPTino0fQM8lgK/k6D0azKk6fOIpqB5HuMOh4B7sBlUCWE5wKeqEs05JAgt87OC1Dhy1acdLKLoVPBwiRrVShqlqN2JL07qyKqLsA0+y6KeMfcMx/1kdumqdCybT1vsQQ9tMt82V2AODufZFx7uyeRJp+IybERskjZnvpQTttecEMvVSI/b6jzUo6M9v3hK2HdjOo72Q9e/YypEQv5YAs5IzZ1o8dJpVZ+91B8xp6/btYzom30qFEE4Uj0l9Cmu9vEDfCUcblTlCCwaPkklOHZX8MbzVKudQ3lVeCDyaIPyfMrdwWyol/qUpi7/08kYV92Uvvz2jmM3Dbw/xR7z5/SQfvu1o42Hurs0mW+tJnAp6rmBAilaJf4Ukh/WNXMmULBZ176k8VcU8l9V4a7l9AZi6q5ygkyg/GIZ/PiH+LVBdY3LtqirHQK+Ur20Relid4Mtqw6/2j1IzgzVGkJ01D0TvXPn8o+wA1m7obKXvo7LrKLM04PaQrYS1AW5/OjR64VqQlqFLBpGQTg4WR2KeZm1QoDJIUtq9WGtDgTWUo5x++4kzZcebn2SDY5jl7JNuZYx75jt3RMRNvWbONblpYCEMKD7UYqa4rs0Ep4NEZ6db4zPfDPiKjEvBYGLfl34dHY3R3qceYicHiBRT5OiSf27JHK6O3hzaUjmSSYOQp4jVYx9dKG4fVjQTAETyGeDAxkMtBI89ebxRcU4+NQAkULyB3GmyZbhsqlwYj+MPQWDVwj6b+ungP/JM80jPVM3Ji9QHkNQGTIzt1H5Lx5vmso653I6gl20kYjkTMXLJMl6J+m2Qxl2JJH412KMMML9uRYoyrGefsHg6mT+zB5q4/5gJA4HvaA
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(336012)(26005)(36860700001)(316002)(356005)(54906003)(82310400004)(2906002)(2616005)(81166007)(36756003)(16526019)(508600001)(5660300002)(40460700001)(6916009)(86362001)(186003)(8676002)(4326008)(44832011)(966005)(426003)(83380400001)(70206006)(70586007)(1076003)(47076005)(6666004)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:12:48.9971 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36de5dc2-503a-48b7-7c62-08d9bf5fa0d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5049
Received-SPF: softfail client-ip=40.107.94.65;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

The drain_rcu_call() function can be blocked as long as an RCU reader
stays in a read-side critical section. This is typically what happens
when a TCG vCPU is executing a busy loop. It can deadlock the QEMU
monitor as reported in https://gitlab.com/qemu-project/qemu/-/issues/650 .

This can be avoided by allowing drain_rcu_call() to enforce an RCU grace
period. Since each reader might need to do specific actions to end a
read-side critical section, do it with notifiers.

Prepare ground for this by adding a notifier list to the RCU reader
struct and use it in wait_for_readers() if drain_rcu_call() is in
progress. An API is added for readers to register their notifiers.

This is largely based on a draft from Paolo Bonzini.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211109183523.47726-2-groug@kaod.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit ef149763a8fcce70b85dfda27cc1222ecf765750)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 include/qemu/rcu.h | 15 +++++++++++++++
 util/rcu.c         | 19 +++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index 515d327cf1..e69efbd47f 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -27,6 +27,7 @@
 #include "qemu/thread.h"
 #include "qemu/queue.h"
 #include "qemu/atomic.h"
+#include "qemu/notify.h"
 #include "qemu/sys_membarrier.h"
 
 #ifdef __cplusplus
@@ -66,6 +67,13 @@ struct rcu_reader_data {
 
     /* Data used for registry, protected by rcu_registry_lock */
     QLIST_ENTRY(rcu_reader_data) node;
+
+    /*
+     * NotifierList used to force an RCU grace period.  Accessed under
+     * rcu_registry_lock.  Note that the notifier is called _outside_
+     * the thread!
+     */
+    NotifierList force_rcu;
 };
 
 extern __thread struct rcu_reader_data rcu_reader;
@@ -180,6 +188,13 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(RCUReadAuto, rcu_read_auto_unlock)
 #define RCU_READ_LOCK_GUARD() \
     g_autoptr(RCUReadAuto) _rcu_read_auto __attribute__((unused)) = rcu_read_auto_lock()
 
+/*
+ * Force-RCU notifiers tell readers that they should exit their
+ * read-side critical section.
+ */
+void rcu_add_force_rcu_notifier(Notifier *n);
+void rcu_remove_force_rcu_notifier(Notifier *n);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/util/rcu.c b/util/rcu.c
index 13ac0f75cb..c91da9f137 100644
--- a/util/rcu.c
+++ b/util/rcu.c
@@ -46,6 +46,7 @@
 unsigned long rcu_gp_ctr = RCU_GP_LOCKED;
 
 QemuEvent rcu_gp_event;
+static int in_drain_call_rcu;
 static QemuMutex rcu_registry_lock;
 static QemuMutex rcu_sync_lock;
 
@@ -107,6 +108,8 @@ static void wait_for_readers(void)
                  * get some extra futex wakeups.
                  */
                 qatomic_set(&index->waiting, false);
+            } else if (qatomic_read(&in_drain_call_rcu)) {
+                notifier_list_notify(&index->force_rcu, NULL);
             }
         }
 
@@ -339,8 +342,10 @@ void drain_call_rcu(void)
      * assumed.
      */
 
+    qatomic_inc(&in_drain_call_rcu);
     call_rcu1(&rcu_drain.rcu, drain_rcu_callback);
     qemu_event_wait(&rcu_drain.drain_complete_event);
+    qatomic_dec(&in_drain_call_rcu);
 
     if (locked) {
         qemu_mutex_lock_iothread();
@@ -363,6 +368,20 @@ void rcu_unregister_thread(void)
     qemu_mutex_unlock(&rcu_registry_lock);
 }
 
+void rcu_add_force_rcu_notifier(Notifier *n)
+{
+    qemu_mutex_lock(&rcu_registry_lock);
+    notifier_list_add(&rcu_reader.force_rcu, n);
+    qemu_mutex_unlock(&rcu_registry_lock);
+}
+
+void rcu_remove_force_rcu_notifier(Notifier *n)
+{
+    qemu_mutex_lock(&rcu_registry_lock);
+    notifier_remove(n);
+    qemu_mutex_unlock(&rcu_registry_lock);
+}
+
 static void rcu_init_complete(void)
 {
     QemuThread thread;
-- 
2.25.1


