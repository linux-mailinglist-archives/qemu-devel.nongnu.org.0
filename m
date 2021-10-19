Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876664339A6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:03:32 +0200 (CEST)
Received: from localhost ([::1]:48188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqeJ-0006PR-JX
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq5j-0001Q1-VT; Tue, 19 Oct 2021 10:27:47 -0400
Received: from mail-dm6nam10on2060.outbound.protection.outlook.com
 ([40.107.93.60]:7185 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq5U-0004IJ-HF; Tue, 19 Oct 2021 10:27:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3l77zCSIyK6/eRf6RibEZv3oYjVGzoCx3eKlsEAtZRCUmocvTf/gOv7TYconYxNyEQbeD4TLmv/qsf1I+ugBtzNH22I27xXsjEAavYLE5hVJt0AnRUxCW10eyHQrc0rZQxc43MdGtZwZvNGQiCQDCsz/4xVsTYhMeqWqba41aDRiUwWjisleZ94crz6qz2TLomekq4I+/iexyCXaATBb5UsS7tkABN2AxlwSufGElWGs60TymMw6hA4doLF5H7eAnFsdXP39IcSlCjiFgqhMoPCxeEaV8lKqbI5S7q560/OzNodB+3PrAo3uNVECaWwp0TeZZcTUbFofbFta9i9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KBBfXbiPsWcRz8deCaALibCPd0HznJ0C2CpC7ml0YE=;
 b=AUziCGuF9xM4tAlTu1Lh8/9ap7C8gilZOS3QGrt9pumnjuwys126ikCy5qvEyEuhJnHmoCUWrYg53vpzwcEpib7c1Of+uRxFyfCrBzx/fhaNN3nYylt4kG1X9txiW6q441cqacu2iDJdkUA4R1XZxU+Pb4q/KzgAtDDS0q9B9Npxs5ORsGx8zyV9ILf8kFaZSRFC/9worS/gr+5CZdyyWq2u1b8zJ80RaWYY46pM7sxFoKWce43jOu905kVvO0nMj5P14JES37n1X7WZAlTv4tIl5bVCM3sNzfNqPocIyat4XewijWbW7qTzYjE/dokYE1CL0txMk9eVF/MrcKezTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KBBfXbiPsWcRz8deCaALibCPd0HznJ0C2CpC7ml0YE=;
 b=rAESbnQRcSn7NZ4Id5c2oRHUZPNasamywCBX9rQwjgIQYrYg65YNfJrXAtCzL4oAoJCd5pDf+N05e0R2gZbNp6JsVddmnNq5NHMVjCxdjqFltUxgi6y28WH83bYO+usERx8SC6ADVmZPYPGPpXA1V5oYX7/XTOf5LeR/RewED90=
Received: from DM5PR11CA0002.namprd11.prod.outlook.com (2603:10b6:3:115::12)
 by CY4PR1201MB0168.namprd12.prod.outlook.com (2603:10b6:910:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:27:28 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::6b) by DM5PR11CA0002.outlook.office365.com
 (2603:10b6:3:115::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:27:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:27:28 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:27:27 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Jakub=20Jerm=C3=A1=C5=99?= <jakub.jermar@kernkonzept.com>, Keith
 Busch <kbusch@kernel.org>
Subject: [PATCH 41/64] hw/nvme: fix pin-based interrupt behavior (again)
Date: Tue, 19 Oct 2021 09:09:21 -0500
Message-ID: <20211019140944.152419-42-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adae406e-2b92-4c23-8282-08d9930c9415
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0168:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0168FE8F2A16FD7242C8D3B395BD9@CY4PR1201MB0168.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M4b76BopGc3WnbV8GakCHrvQYil8uo/SbwDgHvrl094D2qlH9RF4RRzqMq4b0f7w6CFydfp6JOeiX2NkV2sovXENRgO8lj56CqRw3I95xqAXfVyDJ2HpAEprlpgn7SlkKdt5jh1xED1iDeShZhy+bAex4aqHGN22jOB1UPH9jxHl2XpLuu1eVm4tV4ZSl5btWc3uR/QJSL0IJXcScrGakQKb/jeghww5n9UAT+LRfA+puyurAEu4CDlJVswfKuXqrOwmTTZ0AYg1/DAWdW2WHnBPH9JYwjcfE5XtEUHEOtr4exQlflpfRP+N/revQFc9miXNTn95fWhb2NTJmDre/ELZsAO8UhYFiPURLscn9UK9HQVpW1ELzFMOmLuvosI36HwG+j2ZuIi2ga95blN3PwQWZWOgC1cIOQXal07qKClmhDGk8Fflr35DMXf7kU0R9d+T1YL0CUUR0kTvyhL5Fy95tDIEDcEb/EpUOTdQD/B6spBEpTgBC006C9XfbgGRc/T08hZmBt4WNWjRCG1mIixxiJeeCbNTqWkN58sn0gn/qnFMcbqqIHhglwdLXKfDdia4dgEWkOBt+LC8/uPRYM7Z8gfe6YVKmPqItKULKKutzrPtiUY2+2PtubDgTni3V7RKGk3CAu8NAM3de1vQRiQwTPe9b/Ord9vBvYj2DAX+z9e/asqaoiiDKbeai9WG8Jg7DRgc/w6MubOqY493QaCG9MBGDBEK2f9X0+8/S9o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(54906003)(426003)(36860700001)(70586007)(81166007)(8676002)(5660300002)(70206006)(2616005)(1076003)(83380400001)(336012)(2906002)(86362001)(47076005)(82310400003)(6916009)(356005)(8936002)(44832011)(6666004)(316002)(508600001)(186003)(4326008)(36756003)(26005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:27:28.2165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adae406e-2b92-4c23-8282-08d9930c9415
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0168
Received-SPF: softfail client-ip=40.107.93.60;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

From: Klaus Jensen <k.jensen@samsung.com>

Jakub noticed[1] that, when using pin-based interrupts, the device will
unconditionally deasssert when any CQEs are acknowledged. However, the
pin should not be deasserted if other completion queues still holds
unacknowledged CQEs.

The bug is an artifact of commit ca247d35098d ("hw/block/nvme: fix
pin-based interrupt behavior") which fixed one bug but introduced
another. This is the third time someone tries to fix pin-based
interrupts (see commit 5e9aa92eb1a5 ("hw/block: Fix pin-based interrupt
behaviour of NVMe"))...

Third time's the charm, so fix it, again, by keeping track of how many
CQs have unacknowledged CQEs and only deassert when all are cleared.

  [1]: <20210610114624.304681-1-jakub.jermar@kernkonzept.com>

Cc: qemu-stable@nongnu.org
Fixes: ca247d35098d ("hw/block/nvme: fix pin-based interrupt behavior")
Reported-by: Jakub Jermář <jakub.jermar@kernkonzept.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
(cherry picked from commit 83d7ed5c570d4c1d5163951b3057cac2ae7da4ff)
*avoid dependency on 88eea45c ("hw/nvme: move nvme emulation out of hw/block")
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/block/nvme.c | 18 +++++++++++++++++-
 hw/block/nvme.h |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8f4e1fc3ac..5b4892489e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -469,7 +469,9 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue *cq)
             return;
         } else {
             assert(cq->vector < 32);
-            n->irq_status &= ~(1 << cq->vector);
+            if (!n->cq_pending) {
+                n->irq_status &= ~(1 << cq->vector);
+            }
             nvme_irq_check(n);
         }
     }
@@ -1262,6 +1264,7 @@ static void nvme_post_cqes(void *opaque)
     NvmeCQueue *cq = opaque;
     NvmeCtrl *n = cq->ctrl;
     NvmeRequest *req, *next;
+    bool pending = cq->head != cq->tail;
     int ret;
 
     QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
@@ -1291,6 +1294,10 @@ static void nvme_post_cqes(void *opaque)
         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
     }
     if (cq->tail != cq->head) {
+        if (cq->irq_enabled && !pending) {
+            n->cq_pending++;
+        }
+
         nvme_irq_assert(n, cq);
     }
 }
@@ -4091,6 +4098,11 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest *req)
         trace_pci_nvme_err_invalid_del_cq_notempty(qid);
         return NVME_INVALID_QUEUE_DEL;
     }
+
+    if (cq->irq_enabled && cq->tail != cq->head) {
+        n->cq_pending--;
+    }
+
     nvme_irq_deassert(n, cq);
     trace_pci_nvme_del_cq(qid);
     nvme_free_cq(cq, n);
@@ -5768,6 +5780,10 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
         }
 
         if (cq->tail == cq->head) {
+            if (cq->irq_enabled) {
+                n->cq_pending--;
+            }
+
             nvme_irq_deassert(n, cq);
         }
     } else {
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 5d05ec368f..d216e5674d 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -171,6 +171,7 @@ typedef struct NvmeCtrl {
     uint32_t    max_q_ents;
     uint8_t     outstanding_aers;
     uint32_t    irq_status;
+    int         cq_pending;
     uint64_t    host_timestamp;                 /* Timestamp sent by the host */
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
     uint64_t    starttime_ms;
-- 
2.25.1


