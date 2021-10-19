Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF71433951
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:53:56 +0200 (CEST)
Received: from localhost ([::1]:53164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqV0-0007cM-3Y
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq5w-0001ya-O7; Tue, 19 Oct 2021 10:28:02 -0400
Received: from mail-mw2nam10on2072.outbound.protection.outlook.com
 ([40.107.94.72]:10629 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq5u-0004Xp-If; Tue, 19 Oct 2021 10:28:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQzOBLJbdaXs1E84ZboutW6vAFhYfWk1f+ynQi23eotUMstSw87Xrh3Pd7fm0YK4d+i9Z/F9CoqRINukjicq7AlpqYRLvqWolMy817WWzfrqooPTpYu4TNkPL65nTwuGog/lTDVMOSCRy/cd1y+s9yR+4ZSjGHGW2bqQnJUWUkJXa2+xfmlHW2t9C+zR5ij9oORLnGLi2c5fULjWcLcE6ULzJcQ2sqyuHrIXHRL8tTmkuxGi3Bb3XYpTsU7XAjsXCTjMBHoIqNHb4fJltRI8TMyRt5J5y+ZNNqQXMMJTFOF3N6nf8iOoenw169Hq1Iz7EXG5DL9dxWaxua0TzzY1Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+6V18KVCgMKY4WRYQbW8MAcpyOLvV0o+utT7DouAQ4=;
 b=jHvJqfT7K+zSmvsvAuCeifgYe4U03DJpyUI69w0NG83p6bAs0/Gl3xvwto/gzHe7gebyQ1RtNUnAWFrXDF+ZWFbx5XCMA09aSO2kA2IP9kcEhFTzabGza+KskEunhmuTChMCaFcI8zyMnvTyCGYlLdBIN1iF/iqDGSJaiGB8xdtxQkxsqvo8aF0t1DAID4mKOlRvCiQB2r9iRVCw+NQhZFsGn4o+0lmB0LSxS97sDyAyu6u2LHR5VUTLVJNPkUSmFpsN8K16eB/t/y5KTjNTX125wrSSKUowBDTURpu4crSYI1A7TuH9KkRaqnH7zzG7Djt58GOMQMimKPXM2mqinA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+6V18KVCgMKY4WRYQbW8MAcpyOLvV0o+utT7DouAQ4=;
 b=OwT5GvBj5nGKY5TiP30OKrkYnhov7icXYkxgiofFyloM76MWdeDovoBSDKKzgJDEH3qnTWQ3djdBW4i4+dcHBsywoARckMOLuNUC9XGtovXH3UHxVirzoPv4Mel3CqRkzVjHqPh2uRFiq7WKUEk6n7oBNGLx+X5IOs24R5kA60k=
Received: from DS7PR03CA0354.namprd03.prod.outlook.com (2603:10b6:8:55::12) by
 DM5PR1201MB0108.namprd12.prod.outlook.com (2603:10b6:4:58::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Tue, 19 Oct 2021 14:27:53 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::32) by DS7PR03CA0354.outlook.office365.com
 (2603:10b6:8:55::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:27:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:27:52 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:27:49 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, David Hildenbrand <david@redhat.com>, Wei Wang
 <wei.w.wang@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Alexander
 Duyck <alexander.duyck@gmail.com>, Juan Quintela <quintela@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 42/64] virtio-balloon: don't start free page hinting if
 postcopy is possible
Date: Tue, 19 Oct 2021 09:09:22 -0500
Message-ID: <20211019140944.152419-43-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: aebaed1d-b277-4e80-9ac7-08d9930ca29f
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0108:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0108B2A4E4086130AD9053F395BD9@DM5PR1201MB0108.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fxec5QXoV48VkNnyscd8001cg5b+AtSRtLECHB/scIcUyGar2Jb6IF7v/lz7X9ZlNlk8NRzirSlCNR6ddmqVxgUNthjNKdSB0lAdBa71SGvHcKkvnx2kQx6/DZNFUdZm9s/7qAwmHKWCNr93NkdjBnUKI3t3WscuoiyLadDNo+ruKU1FVo3m88ZPVt4RG9/jBBGZ7SZdgJscWb7jVFnUj4C+P/RwTcWEfSfqtVFdGX0YhweWqXwSigh8+ua1S6+ITrDfTAv9OOWMDWMt4txr07rPFJs5Ihx8K0eS8R8LOu+Mr8IMrT26gvOe4Ght8BG5rY/mzVcIMPdFbQzMgEtxWLDFVBQ2lY5u0dWmgBw7wVsx6bw5XmOXg+rLgFUaphfX80NtmWFfci06LL25QgP7cWQeJFI5YelqM4eDA9plpbjfo8msro0n4ZWiA6fCG+HM+LZuTzwSNeI81NuxWzfD+MlMjJf3JdWTT7DyBWvXFIg3YcEs6WCXnAyL1hphu8YohyKTwkTUCGxel8zfp/OXZNxAsX0g1eN/wDP3vlrSjzP8zmYg51/+OwDVlLOC32kV61/GtltjZXyVqSSs0q2ILI2mHL8c1lTgasdeqBmWLz8HvVpVdPejLsvB0owIc3IaHBfJD9KmbKb5U1OehPwwJddeQ6TiWz+pabbd1lKXv3EdHlZMqDoXpitK6slaxolbRHeGD0S0Svd+rrERtCPofPM77qguOIMz8Rn9x/Kez3qzounObCSUBFeevCUob4iUdEbHljN6/yD0tGMql2FsSceO2apsSRLxczZ3bvBVw/PqfrzCmCgwQ4aSahTIlla5
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(2616005)(2906002)(36756003)(83380400001)(81166007)(70206006)(336012)(508600001)(6916009)(16526019)(426003)(44832011)(186003)(8936002)(82310400003)(6666004)(966005)(36860700001)(4326008)(5660300002)(356005)(8676002)(54906003)(7416002)(70586007)(1076003)(26005)(47076005)(86362001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:27:52.6095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aebaed1d-b277-4e80-9ac7-08d9930ca29f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0108
Received-SPF: softfail client-ip=40.107.94.72;
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

From: David Hildenbrand <david@redhat.com>

Postcopy never worked properly with 'free-page-hint=on', as there are
at least two issues:

1) With postcopy, the guest will never receive a VIRTIO_BALLOON_CMD_ID_DONE
   and consequently won't release free pages back to the OS once
   migration finishes.

   The issue is that for postcopy, we won't do a final bitmap sync while
   the guest is stopped on the source and
   virtio_balloon_free_page_hint_notify() will only call
   virtio_balloon_free_page_done() on the source during
   PRECOPY_NOTIFY_CLEANUP, after the VM state was already migrated to
   the destination.

2) Once the VM touches a page on the destination that has been excluded
   from migration on the source via qemu_guest_free_page_hint() while
   postcopy is active, that thread will stall until postcopy finishes
   and all threads are woken up. (with older Linux kernels that won't
   retry faults when woken up via userfaultfd, we might actually get a
   SEGFAULT)

   The issue is that the source will refuse to migrate any pages that
   are not marked as dirty in the dirty bmap -- for example, because the
   page might just have been sent. Consequently, the faulting thread will
   stall, waiting for the page to be migrated -- which could take quite
   a while and result in guest OS issues.

While we could fix 1) comparatively easily, 2) is harder to get right and
might require more involved RAM migration changes on source and destination
[1].

As it never worked properly, let's not start free page hinting in the
precopy notifier if the postcopy migration capability was enabled to fix
it easily. Capabilities cannot be enabled once migration is already
running.

Note 1: in the future we might either adjust migration code on the source
        to track pages that have actually been sent or adjust
        migration code on source and destination  to eventually send
        pages multiple times from the source and and deal with pages
        that are sent multiple times on the destination.

Note 2: virtio-mem has similar issues, however, access to "unplugged"
        memory by the guest is very rare and we would have to be very
        lucky for it to happen during migration. The spec states
        "The driver SHOULD NOT read from unplugged memory blocks ..."
        and "The driver MUST NOT write to unplugged memory blocks".
        virtio-mem will move away from virtio_balloon_free_page_done()
        soon and handle this case explicitly on the destination.

[1] https://lkml.kernel.org/r/e79fd18c-aa62-c1d8-c7f3-ba3fc2c25fc8@redhat.com

Fixes: c13c4153f76d ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
Cc: qemu-stable@nongnu.org
Cc: Wei Wang <wei.w.wang@intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Alexander Duyck <alexander.duyck@gmail.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210708095339.20274-2-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
(cherry picked from commit fd51e54fa10221e5a8add894c38cc1cf199f4bc4)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/virtio/virtio-balloon.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index d120bf8f43..4cdbe6b540 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -30,6 +30,7 @@
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "migration/misc.h"
+#include "migration/migration.h"
 
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
@@ -662,6 +663,18 @@ virtio_balloon_free_page_hint_notify(NotifierWithReturn *n, void *data)
         return 0;
     }
 
+    /*
+     * Pages hinted via qemu_guest_free_page_hint() are cleared from the dirty
+     * bitmap and will not get migrated, especially also not when the postcopy
+     * destination starts using them and requests migration from the source; the
+     * faulting thread will stall until postcopy migration finishes and
+     * all threads are woken up. Let's not start free page hinting if postcopy
+     * is possible.
+     */
+    if (migrate_postcopy_ram()) {
+        return 0;
+    }
+
     switch (pnd->reason) {
     case PRECOPY_NOTIFY_SETUP:
         precopy_enable_free_page_optimization();
-- 
2.25.1


