Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC74474F0C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:23:30 +0100 (CET)
Received: from localhost ([::1]:43588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI4v-0006dd-9J
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:23:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHq0-00069O-0u; Tue, 14 Dec 2021 19:08:04 -0500
Received: from mail-dm6nam10on2040.outbound.protection.outlook.com
 ([40.107.93.40]:7265 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHpx-0005FT-Il; Tue, 14 Dec 2021 19:08:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqvRnpanrBnSjL2YKMhw5xbsJGxla/dMnFriNrx2kmWsSvs8ZL2jbtSBHHzAlRfPW1SYWfm2quw6kfs+zwnrQr1iqRkzOlys1bSk+WQJWBdp6A3Tv5RT3Ar4AO7wND42fHQMeXROeOhy967xxRcVMvan4+hEN94/iDgnNKz825TiyfruPXTpxUE7U3n+oWB+GgC6ILr8SHtprrYKZ7X8dNggnm2K8pZgAfkxiNtTu09+xNRNjiW/wihtyiuzBcpPbPMgxjstvwSZbTTyd+Hb15IV7khMTgk6lpcMy1X/ifd3ektDD+qIx7tb4peHWDAnMjEIP2buWZMCeGTBzFjfvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBdIrPU++znlMD7ePPkTf3CkVjRiooY1A6nDg1iL/YA=;
 b=ZONgAk2TAkuw3kIVBwZZR83iCabfPzi1ASYYsqX8vsV+DeWHK52304XUI3FBMG1ADAW8RcarrfTdfqVpLkJBuWV2yqybl7rGxUeVSfCeQ75qoO05bb/sj1j6lXw6iCgDdA4grj7QRuLNsOwh8/tEZkWmd8q9DIdA7zFeckfyqdIzXccsBrIvsFmeYAn/C2X4aEXzuP57nLi2Hyz2tS9Om1n/0ghIZm+XUrX5ef69OVH4PiFpFphCvlbDt//nH7t5CK579A6TO0SZnHGLYFCrIdRomu1FcsMB4aQDSX1JaU3qjGKLj0AZ7wa+MPbx/LVX4d/tk9v4gVzVmIjmkF1Xxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBdIrPU++znlMD7ePPkTf3CkVjRiooY1A6nDg1iL/YA=;
 b=ILixcw+6jHE3kMxOyrPdFueC//949f0nhb5zH8jiszLMBeBpglxnSfgsRmhwvB7Dh36gsOtI1M5xLPPGb7UGdbLNDYTPQ4ydwUV1gAF5I1nQm2gxjnHUauqxmeUg9xSIk3+PCMsnTxsnu/tq5/i0UTcw2k88IvnDM8TLwNJjzXE=
Received: from MWHPR15CA0027.namprd15.prod.outlook.com (2603:10b6:300:ad::13)
 by BN9PR12MB5033.namprd12.prod.outlook.com (2603:10b6:408:132::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:07:57 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::5a) by MWHPR15CA0027.outlook.office365.com
 (2603:10b6:300:ad::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16 via Frontend
 Transport; Wed, 15 Dec 2021 00:07:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:07:57 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:07:56 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, David Hildenbrand <david@redhat.com>, Wei Wang
 <wei.w.wang@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Alexander
 Duyck <alexander.duyck@gmail.com>, Juan Quintela <quintela@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 01/47] virtio-balloon: don't start free page hinting if
 postcopy is possible
Date: Tue, 14 Dec 2021 18:00:39 -0600
Message-ID: <20211215000125.378126-2-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41af900c-cded-441d-41a3-08d9bf5ef2e3
X-MS-TrafficTypeDiagnostic: BN9PR12MB5033:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5033880F278B098604D061EB95769@BN9PR12MB5033.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p2P/LVW//onbLajwnRA3AAD2JGuNxXRD5P7yoLMSDnuA3KqG7Y/5F4zUfGRow2M+LSPz+zfcFk9ddvSjflSepnYuhPpItrCRq1CrJuiCxnuA/uIiwl7oUR0zEyjAugzm/W2bAxLKozkc8k0s8dkKetzj0uFwzGm/STrxek3gdCvhcSPYd9aymfajt8+PSyI2NwFzxe+FMC6LsWwGcItShKqD7hTveOElJ4Nk8XLBthSf2Y/dVFxHYhlgPVM6eK6nF1Z/I7ERmbh9zZQ/pz4A1zTRxqQh48X+62tC1yd249CB5c1uy9DQ2N+jZRlsIuNgo4isgXkToRITOuGjzQcld7t6TzD3qYeYr6mV8AgYuqTONQQhyEljM2OSE0uppJTGpAUl/oRl7DvesBJIV9JqdlLVbtvMAQIswe/WU4PW4tcUTPiGwKxjtNanmHADKcqJaeZCfFUsSUELJNwZatrA0wXSlc2ogcWxwy8HGhqz6U9YcALTN50oM+BQN0zTOdTKYl3xCUADGwTKoDw/PSrNRzllJAUbOE9kz2cBrU82fCoHjiX9UVYcZDOqRmTr4o+HSs81yegvnaRk2xhx6Ff2rDlkLNXwoAa2pLo/604HuEVW76swAxOd1/yuqZ7nbUR9YinOxIfHCyS5I6GktiMO4Ob0TnQ3wP1f+MTZQ/pXL2I2wGFaDOEq8MyJvkTlWzMS+2DpHA23NJ5VoOrjkpW8BlPrnGJUz97OzpdJzJvHaUXMHydGW1GALhBQ5Q0oUtiYSLb6WhLtLZ5zpk6O2FJGtttRg0a25Zz6AyFYKd6+UqBg2xrTEW6tSoYJUlnDhhWTbxWTbfqTkkgdkkMAa8ESt2CQT/8gaq4ejPHw/51esw8BTgfBy7Qd5DYgoqs5zgER
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(1076003)(83380400001)(6666004)(44832011)(2616005)(26005)(81166007)(508600001)(47076005)(4326008)(82310400004)(316002)(7416002)(356005)(8936002)(86362001)(40460700001)(54906003)(5660300002)(336012)(426003)(2906002)(36860700001)(186003)(8676002)(6916009)(36756003)(16526019)(70206006)(70586007)(966005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:07:57.0844 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41af900c-cded-441d-41a3-08d9bf5ef2e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5033
Received-SPF: softfail client-ip=40.107.93.40;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
index 4b5d9e5e50..ae7867a8db 100644
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
     case PRECOPY_NOTIFY_BEFORE_BITMAP_SYNC:
         virtio_balloon_free_page_stop(dev);
-- 
2.25.1


