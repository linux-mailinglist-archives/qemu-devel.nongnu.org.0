Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA60E363543
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 14:40:26 +0200 (CEST)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lY6iu-0003fn-FB
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 08:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lY6hJ-0003DJ-9A
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 08:38:45 -0400
Received: from mail-mw2nam12on2081.outbound.protection.outlook.com
 ([40.107.244.81]:30209 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lY6hE-0000G8-1T
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 08:38:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bA3XGCTPbggkaYlqSUalDqSe2KY5X4cBddppSZYuXtJ5wyvNSJFKM4lLRnTjLH4/uaPaCVzkpFq6LcnLhAbXC/2HfhuAEp7xNBBmKTBAzfcJMxkLOqDsS/Iz0JxbwsWU8Y4R5gNmgfbpUluVSmNlEQmiRnyFDYAt30SPktyoFmUI/1SkEM0tYaQsTf49kBFu8Ry4PKRO6/qtmHEJfAeYSv0MmVa3vnBQab2YBdDFWhowKJC1QXP7G2xW99higlG6ID9AnHJhzEc64pvLv4PF/jQdrdtOjAOQ6HSrxsmBvij7QSH1oFh0b8akqI5e6c+5XGluT7sRw9ARMpqyKfOpjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3mGwTbElMNcujh5jJ0OraOHqSpQmDpc6hh+D1rauq4=;
 b=mqPbb8HG65LpcrWhWQE4fqTuSnGSFAmK0wkN5dwtXirNsQLb2Blh/uytlSHo3KhfPH6ZFqgcc4SAR4UNXv66PTIBgn8VZ8JuumqDXhQmOwSBhkjVw4gtp26XUF1UTKQGztlIhTUCVJF4eAO1LS6U0bwHPzNR7pkbNu9iv9xW82XqqgbipPanvcaKUwk0+B5AI8/oSGesT6v4a2QSukc1v/Iuzd5D55m4g+abIXIuQbxdBTEYyIe3UbUI96lWTBsCwyaXC/QDQLuAYtAuOT3ydw3grTXDWI0yBH7Xak7M7DLi6zP8ZNus2YfMbwvh2feShLTmg5YV3D6Og7cdMpUrxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3mGwTbElMNcujh5jJ0OraOHqSpQmDpc6hh+D1rauq4=;
 b=sFLuGQlFQIyDxJm+g1xyW6oHhJasQCVKBWxmvm/eCFgAJ5ON+xRUmgDVJg6x/I6FPrNFFTLuEiiGUuZYYfr3OHUzn4y13tJaizxuXBucn8aGmHpnVeb4uyXl2otJyzyHM2Wv+zxEnNBlwc3xDVgJrGF/c4UBlSxaJaO53s5Wmbs/l5Sx+ID9bUjIYErYAZNz+ykAtHma927Y3p9tFQxOdIaDJeUziBDGZPP9AaYRmkyfA4NBrBzK0E2BrT8kIqm12/+HL/FlyJxfemu0N2BCSK7OmPBGgNNwhT3JkGTRueoz8jS4yLHwZqbn0CKVo4FoL+APQf+BGnmSxoLVS2rOHQ==
Received: from DS7PR03CA0273.namprd03.prod.outlook.com (2603:10b6:5:3ad::8) by
 DM8PR12MB5478.namprd12.prod.outlook.com (2603:10b6:8:29::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Sun, 18 Apr 2021 12:23:33 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::bc) by DS7PR03CA0273.outlook.office365.com
 (2603:10b6:5:3ad::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19 via Frontend
 Transport; Sun, 18 Apr 2021 12:23:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4042.16 via Frontend Transport; Sun, 18 Apr 2021 12:23:33 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sun, 18 Apr
 2021 12:23:32 +0000
Received: from dhcp-10-24-130-144.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via
 Frontend Transport; Sun, 18 Apr 2021 05:23:28 -0700
From: Tarun Gupta <targupta@nvidia.com>
To: <qemu-devel@nongnu.org>, <kwankhede@nvidia.com>,
 <alex.williamson@redhat.com>, <cohuck@redhat.com>, <kevin.tian@intel.com>
Subject: [PATCH v5 1/1] docs/devel: Add VFIO device migration documentation
Date: Sun, 18 Apr 2021 17:52:51 +0530
Message-ID: <20210418122251.88809-1-targupta@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0ce00a8-5baf-4a6c-98cb-08d90264c894
X-MS-TrafficTypeDiagnostic: DM8PR12MB5478:
X-Microsoft-Antispam-PRVS: <DM8PR12MB54787C489C210A1615672E6DB84A9@DM8PR12MB5478.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JdUGcIpTPdTK1Sf9io/wA4JIzc8N0KL9gq+mG9C3ah/isQfCMrqBZkkf4bxfIxddIZ0UOuNGpGGHZVyD+VtpT2zwAcluyM5RUTEggA177GvOiV2Ed5x52s6MKstdGDH7LTA7OpxutpkniILH2t6Bn6G3usXE16Kh7chR6xoSpwNX387Eq8oLtIsm/Qt8YC9c38Al4eGSRPlgT4Ca09tMw9nlsyzj3oZHBKGZhsw17nwV8fumLpPaz5wwjpcWTpOiJHCBH0ykg+1yxk31rFZtmd9OYMv+hDORSB8TMcNyt7Xbc+nugh5ynZ5xdssH6X3oXetfBFSBGuKnHq02mRl7Y4pP4sOLw1z6cls5nEr1bBY41n81R44UYRN6ZsXOsD8vnxUStCLiRt8yim8+8DXd1kjV8Jv7T537HauxPp5mm5vutBxbaf2Zul4o1C3T1optR5CiHofVAnuMrZoILoNM6RiaKpghOffPNRf/OQbU7I+aecAlBUhhmnz4V2HgkekxtGlvOfO0nvxa+4mbsVXOKVdcEkUIRg/hwj6E6w5YSNYeb/MLMZFCXK7ESW/OERzyiNYD6IqrtWqTuK7cGzTW7LXaykFG+RHsuoXpYuTuFQTQIHVI8077JW+wEBtiGZYEApMWOiuVPWKi8f4wuSrjIMFo3gA7BpgMioxPsFU1wRQ=
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid04.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(36840700001)(46966006)(83380400001)(70586007)(336012)(70206006)(426003)(8676002)(86362001)(6666004)(47076005)(7696005)(7416002)(110136005)(2616005)(4326008)(82740400003)(186003)(356005)(36906005)(1076003)(36860700001)(82310400003)(26005)(107886003)(36756003)(5660300002)(8936002)(7636003)(316002)(2906002)(54906003)(478600001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2021 12:23:33.3363 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ce00a8-5baf-4a6c-98cb-08d90264c894
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5478
Received-SPF: softfail client-ip=40.107.244.81;
 envelope-from=targupta@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: cjia@nvidia.com, quintela@redhat.com, dgilbert@redhat.com,
 yan.y.zhao@intel.com, lushenming@huawei.com, dnigam@nvidia.com,
 berrange@redhat.com, philmd@redhat.com, Tarun Gupta <targupta@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document interfaces used for VFIO device migration. Added flow of state changes
during live migration with VFIO device.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Co-developed-by: Kirti Wankhede <kwankhede@nvidia.com>
Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Signed-off-by: Tarun Gupta <targupta@nvidia.com>
---
Tested by building docs with new vfio-migration.rst file

v5:
- Fixed meta issues in commit message

v4:
- Added info about vfio_listener_log_global_[start|stop]
- Added info about `save_state` callback.
- Incorporated comments from v3.

v3:
- Add introductory line about VM migration in general.
- Remove occurcences of vfio_pin_pages() to describe pinning.
- Incorporated comments from v2

v2:
- Included the new vfio-migration.rst file in index.rst
- Updated dirty page tracking section, also added details about
  'pre-copy-dirty-page-tracking' opt-out option.
- Incorporated comments around wording of doc.

---
 MAINTAINERS                   |   1 +
 docs/devel/index.rst          |   1 +
 docs/devel/vfio-migration.rst | 150 ++++++++++++++++++++++++++++++++++
 3 files changed, 152 insertions(+)
 create mode 100644 docs/devel/vfio-migration.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c5..dea85faccf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1823,6 +1823,7 @@ S: Supported
 F: hw/vfio/*
 F: include/hw/vfio/
 F: docs/igd-assign.txt
+F: docs/devel/vfio-migration.rst
 
 vfio-ccw
 M: Cornelia Huck <cohuck@redhat.com>
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 6cf7e2d233..e6e4f7907e 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -42,3 +42,4 @@ Contents:
    qom
    block-coroutine-wrapper
    multi-process
+   vfio-migration
diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
new file mode 100644
index 0000000000..9ff6163c88
--- /dev/null
+++ b/docs/devel/vfio-migration.rst
@@ -0,0 +1,150 @@
+=====================
+VFIO device Migration
+=====================
+
+Migration of virtual machine involves saving the state for each device that
+the guest is running on source host and restoring this saved state on the
+destination host. This document details how saving and restoring of VFIO
+devices is done in QEMU.
+
+Migration of VFIO devices consists of two phases: the optional pre-copy phase,
+and the stop-and-copy phase. The pre-copy phase is iterative and allows to
+accommodate VFIO devices that have a large amount of data that needs to be
+transferred. The iterative pre-copy phase of migration allows for the guest to
+continue whilst the VFIO device state is transferred to the destination, this
+helps to reduce the total downtime of the VM. VFIO devices can choose to skip
+the pre-copy phase of migration by returning pending_bytes as zero during the
+pre-copy phase.
+
+A detailed description of the UAPI for VFIO device migration can be found in
+the comment for the ``vfio_device_migration_info`` structure in the header
+file linux-headers/linux/vfio.h.
+
+VFIO implements the device hooks for the iterative approach as follows:
+
+* A ``save_setup`` function that sets up the migration region and sets _SAVING
+  flag in the VFIO device state.
+
+* A ``load_setup`` function that sets up the migration region on the
+  destination and sets _RESUMING flag in the VFIO device state.
+
+* A ``save_live_pending`` function that reads pending_bytes from the vendor
+  driver, which indicates the amount of data that the vendor driver has yet to
+  save for the VFIO device.
+
+* A ``save_live_iterate`` function that reads the VFIO device's data from the
+  vendor driver through the migration region during iterative phase.
+
+* A ``save_state`` function to save the device config space if it is present.
+
+* A ``save_live_complete_precopy`` function that resets _RUNNING flag from the
+  VFIO device state and iteratively copies the remaining data for the VFIO
+  device until the vendor driver indicates that no data remains (pending bytes
+  is zero).
+
+* A ``load_state`` function that loads the config section and the data
+  sections that are generated by the save functions above
+
+* ``cleanup`` functions for both save and load that perform any migration
+  related cleanup, including unmapping the migration region
+
+
+The VFIO migration code uses a VM state change handler to change the VFIO
+device state when the VM state changes from running to not-running, and
+vice versa.
+
+Similarly, a migration state change handler is used to trigger a transition of
+the VFIO device state when certain changes of the migration state occur. For
+example, the VFIO device state is transitioned back to _RUNNING in case a
+migration failed or was canceled.
+
+System memory dirty pages tracking
+----------------------------------
+
+A ``log_global_start`` and ``log_global_stop`` memory listener callback informs
+the VFIO IOMMU module to start and stop dirty page tracking. A ``log_sync``
+memory listener callback marks those system memory pages as dirty which are
+used for DMA by the VFIO device. The dirty pages bitmap is queried per
+container. All pages pinned by the vendor driver through external APIs have to
+be marked as dirty during migration. When there are CPU writes, CPU dirty page
+tracking can identify dirtied pages, but any page pinned by the vendor driver
+can also be written by the device. There is currently no device or IOMMU
+support for dirty page tracking in hardware.
+
+By default, dirty pages are tracked when the device is in pre-copy as well as
+stop-and-copy phase. So, a page pinned by the vendor driver will be copied to
+the destination in both phases. Copying dirty pages in pre-copy phase helps
+QEMU to predict if it can achieve its downtime tolerances. If QEMU during
+pre-copy phase keeps finding dirty pages continuously, then it understands
+that even in stop-and-copy phase, it is likely to find dirty pages and can
+predict the downtime accordingly.
+
+QEMU also provides a per device opt-out option ``pre-copy-dirty-page-tracking``
+which disables querying the dirty bitmap during pre-copy phase. If it is set to
+off, all dirty pages will be copied to the destination in stop-and-copy phase
+only.
+
+System memory dirty pages tracking when vIOMMU is enabled
+---------------------------------------------------------
+
+With vIOMMU, an IO virtual address range can get unmapped while in pre-copy
+phase of migration. In that case, the unmap ioctl returns any dirty pages in
+that range and QEMU reports corresponding guest physical pages dirty. During
+stop-and-copy phase, an IOMMU notifier is used to get a callback for mapped
+pages and then dirty pages bitmap is fetched from VFIO IOMMU modules for those
+mapped ranges.
+
+Flow of state changes during Live migration
+===========================================
+
+Below is the flow of state change during live migration.
+The values in the brackets represent the VM state, the migration state, and
+the VFIO device state, respectively.
+
+Live migration save path
+------------------------
+
+::
+
+                        QEMU normal running state
+                        (RUNNING, _NONE, _RUNNING)
+                                  |
+                     migrate_init spawns migration_thread
+                Migration thread then calls each device's .save_setup()
+                    (RUNNING, _SETUP, _RUNNING|_SAVING)
+                                  |
+                    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
+             If device is active, get pending_bytes by .save_live_pending()
+          If total pending_bytes >= threshold_size, call .save_live_iterate()
+                  Data of VFIO device for pre-copy phase is copied
+        Iterate till total pending bytes converge and are less than threshold
+                                  |
+  On migration completion, vCPU stops and calls .save_live_complete_precopy for
+   each active device. The VFIO device is then transitioned into _SAVING state
+                   (FINISH_MIGRATE, _DEVICE, _SAVING)
+                                  |
+     For the VFIO device, iterate in .save_live_complete_precopy until
+                         pending data is 0
+                   (FINISH_MIGRATE, _DEVICE, _STOPPED)
+                                  |
+                 (FINISH_MIGRATE, _COMPLETED, _STOPPED)
+             Migraton thread schedules cleanup bottom half and exits
+
+Live migration resume path
+--------------------------
+
+::
+
+              Incoming migration calls .load_setup for each device
+                       (RESTORE_VM, _ACTIVE, _STOPPED)
+                                 |
+       For each device, .load_state is called for that device section data
+                       (RESTORE_VM, _ACTIVE, _RESUMING)
+                                 |
+    At the end, .load_cleanup is called for each device and vCPUs are started
+                       (RUNNING, _NONE, _RUNNING)
+
+Postcopy
+========
+
+Postcopy migration is currently not supported for VFIO devices.
-- 
2.27.0


