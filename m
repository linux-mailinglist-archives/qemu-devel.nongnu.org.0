Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E1B4339AC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:06:06 +0200 (CEST)
Received: from localhost ([::1]:54936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqgn-0002Ta-Ps
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq93-0006sl-6S; Tue, 19 Oct 2021 10:31:14 -0400
Received: from mail-dm6nam08on2055.outbound.protection.outlook.com
 ([40.107.102.55]:10401 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq91-0000be-Ab; Tue, 19 Oct 2021 10:31:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5o0ZISW1ptQrrmdgOs7U008JCVi1Cuqq2yBAxBGNnFD3T38TencObWUCN4RR+JcbgwM/k+SZI0As6Bti0H648g3AuNZaDpoXvXl5UrS+DtDJo8BanO592bFYtZ4BTXjYykWcTB1XjCWGpab2Yt8Ha4LfgfSDwjJaJPOzwKWmS8kFjUXXa+9+TD5eXeSgQ+z+87VdhT84QxnLX7RpWNJ2FXT4VCMYfMhhW2lncTcV3JdNA9ydAXOqyG34+lvqEq+UkPIt7F5+M/ago1pSyolaJMCCoVdG4P0GQLiAf39eKRxzIo4sWQ23yxjq+LvI7BLm3BPWhiBPZJGBQCllWPZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmTOjrMR0Dl1GoeTxWZB7KAWX3s+W0EjtNZMg2B1Xv4=;
 b=DrmBcJQEf2EzyJV38o9URQzXbJK/yNAF7rsJprwHiHAoUkpPBK0e3QrGw/tmz13nczVMDEeD5uw9/Gj3ZWQ6E57tMe8dKLtcA+X2y9x63Y1b8ujp5XMz2RJK4bYqs8gz/plUmXGyGtt3IAYULOhvfhiZUqZWZupnvcx7fOZn3+Dq08cxEfJnoRRBSTfKxhzcVjXWsKNwyyxbvT+3l+EU4875cqLkybKwr29iGyN7OETJHLEfYShtDPEWpqrbs6VCOzZ07/9hJAmPCIa0dJd7KmveEBmRD7XQwLuH7On1zjVKIQRD0rX9v4lvdtA7E5iySpA8KFunUYzYwyk+klaang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmTOjrMR0Dl1GoeTxWZB7KAWX3s+W0EjtNZMg2B1Xv4=;
 b=uuu6uWpSCcPiJf7mYp+mx0DS5qdCX/j+82UNBWzTvGf4ljV+fbDwatxgxxe13waIgSDVLHWv/BqJAwuWVjiGcIPcuBHZfdymWUTKHfHHEg1/6x4hXEOwEBjRgewvDUPArkExCX1Lkcig1VtrUg/z61aGjcAGS9MTTirMHdXnQyU=
Received: from DM5PR13CA0031.namprd13.prod.outlook.com (2603:10b6:3:7b::17) by
 PH0PR12MB5465.namprd12.prod.outlook.com (2603:10b6:510:ec::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Tue, 19 Oct 2021 14:31:07 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::db) by DM5PR13CA0031.outlook.office365.com
 (2603:10b6:3:7b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Tue, 19 Oct 2021 14:31:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:31:07 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:31:07 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Stefan Reiter <s.reiter@proxmox.com>, Wolfgang
 Bumiller <w.bumiller@proxmox.com>, Kevin Wolf <kwolf@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Subject: [PATCH 04/64] monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
Date: Tue, 19 Oct 2021 09:08:44 -0500
Message-ID: <20211019140944.152419-5-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5da0cc0-774f-4594-f876-08d9930d16e4
X-MS-TrafficTypeDiagnostic: PH0PR12MB5465:
X-Microsoft-Antispam-PRVS: <PH0PR12MB5465423B40C7040EEA1A6E5295BD9@PH0PR12MB5465.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:357;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXgFHB3x1wE/TAJbX13oYuH4chuHnvagz6gxPWzrLcTn/J7DlPWkeJDNJEyE+xBYjDxHYiEDW2vEoUGg0IeFdRk/nrpFpGxWJBcPUva6uRzyANU/ta2y7koEhQ7sx/qeybStjzQAYqoWSqszumUoSbAhzlC8RzYf/Y7bFL5tkBy8rZq5Jpnv+L8PqSOgNUzr5h23kR1p5EpOxiNG5BW4vaF2qIjc4vlUi0jjHivF2HLkQWcBBGr3ck6O8jSosLE7J9QV+k4EDYWFS8cpJHO+mI5O0RqvTEbsonb012OdbjacLLIIbKv2AAjINzkqDGQm49FycC8a44xdgQ16KxwbTT26TD2Q6vBgmgEJ8sY8hWWK5FnLO6bMzHfe5bh/5g3g1kqv1SRyHUxJJjH8qUg9/6P8LkwJ1WNH0XjFCQZm5Fo+51K2IPSzYFX6ls1JcwuRp+p7Bac8DfLGph9KEiRjED2BBw1RDFyzefMF4l0G3PDQ3Du4UUOL8a1WUPQl7/WkCDc3+1qOJPI7ASwTx44Guh/UF1BtaGl6AydA51AhZue/iKwC5PP96+fWTF2HtkoNmS5AXgc9ftZmsth4yFPgpXsqvJ2DUNOgDOLkEgRCV+WnMBllbp5xWzmjau8SyGlv4Q/BnURLpxb3aavI8NtTg4bm/hxa7XwWNCbC+SsFCkIEjgskVxLqQew5N00ZiPD90fAAsuv2izC9qHyY3VX6wNuGew8PYWNU2BJzwCngUhE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(316002)(36860700001)(47076005)(4326008)(8936002)(6916009)(36756003)(26005)(8676002)(5660300002)(2906002)(81166007)(508600001)(54906003)(44832011)(83380400001)(2616005)(186003)(6666004)(426003)(82310400003)(16526019)(356005)(336012)(86362001)(70206006)(70586007)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:31:07.6838 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5da0cc0-774f-4594-f876-08d9930d16e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5465
Received-SPF: softfail client-ip=40.107.102.55;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Reiter <s.reiter@proxmox.com>

The QMP dispatcher coroutine holds the qmp_queue_lock over a yield
point, where it expects to be rescheduled from the main context. If a
CHR_EVENT_CLOSED event is received just then, it can race and block the
main thread on the mutex in monitor_qmp_cleanup_queue_and_resume.

monitor_resume does not need to be called from main context, so we can
call it immediately after popping a request from the queue, which allows
us to drop the qmp_queue_lock mutex before yielding.

Suggested-by: Wolfgang Bumiller <w.bumiller@proxmox.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
Message-Id: <20210322154024.15011-1-s.reiter@proxmox.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
(cherry picked from commit a67b996e7894edfafbcd3fd007c9f58f26d25908)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 monitor/qmp.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index 2b0308f933..092c527b6f 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -257,24 +257,6 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
         trace_monitor_qmp_in_band_dequeue(req_obj,
                                           req_obj->mon->qmp_requests->length);
 
-        if (qatomic_xchg(&qmp_dispatcher_co_busy, true) == true) {
-            /*
-             * Someone rescheduled us (probably because a new requests
-             * came in), but we didn't actually yield. Do that now,
-             * only to be immediately reentered and removed from the
-             * list of scheduled coroutines.
-             */
-            qemu_coroutine_yield();
-        }
-
-        /*
-         * Move the coroutine from iohandler_ctx to qemu_aio_context for
-         * executing the command handler so that it can make progress if it
-         * involves an AIO_WAIT_WHILE().
-         */
-        aio_co_schedule(qemu_get_aio_context(), qmp_dispatcher_co);
-        qemu_coroutine_yield();
-
         /*
          * @req_obj has a request, we hold req_obj->mon->qmp_queue_lock
          */
@@ -298,8 +280,30 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
             monitor_resume(&mon->common);
         }
 
+        /*
+         * Drop the queue mutex now, before yielding, otherwise we might
+         * deadlock if the main thread tries to lock it.
+         */
         qemu_mutex_unlock(&mon->qmp_queue_lock);
 
+        if (qatomic_xchg(&qmp_dispatcher_co_busy, true) == true) {
+            /*
+             * Someone rescheduled us (probably because a new requests
+             * came in), but we didn't actually yield. Do that now,
+             * only to be immediately reentered and removed from the
+             * list of scheduled coroutines.
+             */
+            qemu_coroutine_yield();
+        }
+
+        /*
+         * Move the coroutine from iohandler_ctx to qemu_aio_context for
+         * executing the command handler so that it can make progress if it
+         * involves an AIO_WAIT_WHILE().
+         */
+        aio_co_schedule(qemu_get_aio_context(), qmp_dispatcher_co);
+        qemu_coroutine_yield();
+
         /* Process request */
         if (req_obj->req) {
             if (trace_event_get_state(TRACE_MONITOR_QMP_CMD_IN_BAND)) {
-- 
2.25.1


