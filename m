Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669E14339B4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:07:29 +0200 (CEST)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqi8-0004ad-H4
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq3g-0006xs-7Y; Tue, 19 Oct 2021 10:25:41 -0400
Received: from mail-bn1nam07on2074.outbound.protection.outlook.com
 ([40.107.212.74]:59377 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq3e-0002xw-2Q; Tue, 19 Oct 2021 10:25:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6pqPWnnBxXfpgLFbo9jWjSYG7m7sDNYqAs7zM5H+zxyzyL4OYyzhDHYzn0IDVq1a4dZPdUOBVaZw6HueG3WDqb3//nJeR/BcGlFZu0j/sg51YL3afi5hWtU/E/ZJQ25SgJmWFj+E81hP7kE1+2nnkNyBl9fHCqcHYG9Ul/+oPJiOdzOIrRYUWvZ8hD/FWZwqpI1W43Sq2NoaEoX4mTA+jebNSUMn8bemU2x+6mZtcZW5UoBCrMDnw6fdQjjlxjTbii8Ss6juVJFysn2asb1YtEnh8vCgoXzJA00A6oVLahvFkfc7Cx6HFMgh6wCLLEzWmZAcIbqfhaoV1CcqqppzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks2xmH+gO/I08xoK/XmZGS0ss4XC7UeUgJzs0OE/Bco=;
 b=Adq158dB5PT8s0xy0xIKDLxTNmXtO6Gx6W0H1G76QyVX8MLybvn6zAMkdpqc9lWoBVQQ25Y7mfOSwc6hEwjazUUTmAVhh/JGmPNDA6Oydh6Nb0wbJqlCKL7xa0dYl9lXlHkD01MVdla6AGgVgwckQR7nVEuKWNZ9LXhhxRNnIvhiRJePWd2IRw+M4rFqHqkHiqKtdfxvJ3wTMyQjeYN2aQOX7wvlYWtnPrmn+ychEnmDMB9ham7SrU2hi/UQ7iEzlcdY59aSCnJt2Ygji3rScu1tPopXYq2ukmIkEsSIo4ENGdwn0d0UC6q+6UVyDDLT6+lc/Iw4WpzdVVE414+6mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks2xmH+gO/I08xoK/XmZGS0ss4XC7UeUgJzs0OE/Bco=;
 b=MOiltIqK3ug8Y90rqNYmHSWtHHOzbWtUUkpegBX4AQQXTP6VI2BiRpojOxFZ6rc1ZEyNOwgxR3AStsOYxFK6hCAvQC3HCNTzLEAe61sMENRlmJ2mJKv0Pd5WeWlN8KfgoKKaaRnCo24zZ7xRwjudZBNWii0KCGtkDx5krW0KDmM=
Received: from DM6PR04CA0014.namprd04.prod.outlook.com (2603:10b6:5:334::19)
 by DM4PR12MB5120.namprd12.prod.outlook.com (2603:10b6:5:393::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:25:34 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::d5) by DM6PR04CA0014.outlook.office365.com
 (2603:10b6:5:334::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:25:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:25:34 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:25:33 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Igor Mammedov <imammedo@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, John Sucaet <john.sucaet@ekinops.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH 37/64] acpi: pc: revert back to v5.2 PCI slot enumeration
Date: Tue, 19 Oct 2021 09:09:17 -0500
Message-ID: <20211019140944.152419-38-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 48838fc3-7064-4b2a-ef91-08d9930c5011
X-MS-TrafficTypeDiagnostic: DM4PR12MB5120:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5120F4FB415527B72A8FD52495BD9@DM4PR12MB5120.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YN+mLE4dyu6IBOD7d7a2gVgG8zBYA9HENIYxGNfjBrbTqIlCGAOcfBcpkFWVD9KltWFsoz/8tfrphfvgerHDyD0uZRMUA40MkRik+A6qvhEeST75IDOfi+5ZTkQq3JCQnPPjB/tbu1IpZjZFBzjMJXR9T6cYV9/Y3IwR0rmhNFoRAkmxNYgDorZxOw2q2KalSYhrd9QbO3sryHgqzpO8jkfT78T0YNAbuK1qJ5X6rcNGputYpE0af0VvhiUIVECrb8LJoSpEKGa/7BET91xCfZZQ3THKlmHc1JVBCFX0EdGCqhjj3CnlYcd6/rB9G/PquyfQufdzR2KU1o09ogwPECgiE6fy12egKYkKjhqVwWHg0k70yMHYzdNXTvGya67MfuwIp0DF81NsGeDZCfZzyt8sScVCKYR+1wNqK8rMbxZoXDyPnU9qMadtgE3jTaRE+tCIXZmWjaEMREDRb+TfwXPmejy8dVvkDBygJK7tYm+CB6HX4K8Rlj0kP2p6w4whDwwjQbuTFr8d2WUjgOx0T58CKlisk5n/ZVXppQGrKytPM9JxyyeHN0eHHU3g8N16L1SetFaGQbZhdVWR0HQK13q9L0bUYmXxWkMfImyc1O+r85Seojrx5M5GvcPb9TPbqDYTVCSq8j0t8bNwBKjyStkBD6qsG+R2z1staovt1ybE19fsF2MmSzl6oKlqZWf4qkqcTHqlhyPXrdMMcqhnso9EAhKUs4GXsw2Jeg4bz0o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(4326008)(6916009)(316002)(36756003)(8936002)(426003)(356005)(508600001)(1076003)(47076005)(6666004)(54906003)(86362001)(81166007)(16526019)(83380400001)(2616005)(2906002)(70586007)(5660300002)(44832011)(336012)(70206006)(82310400003)(26005)(8676002)(186003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:25:34.1079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48838fc3-7064-4b2a-ef91-08d9930c5011
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5120
Received-SPF: softfail client-ip=40.107.212.74;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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

From: Igor Mammedov <imammedo@redhat.com>

Commit [1] moved _SUN variable from only hot-pluggable to
all devices. This made linux kernel enumerate extra slots
that weren't present before. If extra slot happens to be
be enumerated first and there is a device in th same slot
but on other bridge, linux kernel will add -N suffix to
slot name of the later, thus changing NIC name compared to
QEMU 5.2. This in some case confuses systemd, if it is
using SLOT NIC naming scheme and interface name becomes
not the same as it was under QEMU-5.2.

Reproducer QEMU CLI:
  -M pc-i440fx-5.2 -nodefaults \
  -device pci-bridge,chassis_nr=1,id=pci.1,bus=pci.0,addr=0x3 \
  -device virtio-net-pci,id=nic1,bus=pci.1,addr=0x1 \
  -device virtio-net-pci,id=nic2,bus=pci.1,addr=0x2 \
  -device virtio-net-pci,id=nic3,bus=pci.1,addr=0x3

with RHEL8 guest produces following results:
  v5.2:
     kernel: virtio_net virtio0 ens1: renamed from eth0
     kernel: virtio_net virtio2 ens3: renamed from eth2
     kernel: virtio_net virtio1 enp1s2: renamed from eth1
      (slot 2 is assigned to empty bus 0 slot and virtio1
       is assigned to 2-2 slot, and renaming falls back,
       for some reason, to path based naming scheme)

  v6.0:
     kernel: virtio_net virtio0 ens1: renamed from eth0
     kernel: virtio_net virtio2 ens3: renamed from eth2
     systemd-udevd[299]: Error changing net interface name 'eth1' to 'ens3': File exists
     systemd-udevd[299]: could not rename interface '3' from 'eth1' to 'ens3': File exists
      (with commit [1] kernel assigns virtio2 to 3-2 slot
       since bridge advertises _SUN=0x3 and kernel assigns
       slot 3 to bridge. Still it manages to rename virtio2
       correctly to ens3, however systemd gets confused with virtio1
       where slot allocation exactly the same (2-2) as in 5.2 case
       and tries to rename it to ens3 which is rightfully taken by
       virtio2)

I'm not sure what breaks in systemd interface renaming (it probably
should be investigated), but on QEMU side we can safely revert
_SUN to 5.2 behavior (i.e. avoid cold-plugged bridges and non
hot-pluggable device classes), without breaking acpi-index, which uses
slot numbers but it doesn't have to use _SUN, it could use an arbitrary
variable name that has the same slot value).
It will help existing VMs to keep networking with non trivial
configs in working order since systemd will do its interface
renaming magic as it used to do.

1)
Fixes: b7f23f62e40 (pci: acpi: add _DSM method to PCI devices)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210624204229.998824-3-imammedo@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Sucaet <john.sucaet@ekinops.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 7193d7cdd93e50f0e5f09803b98d27d3f9b147ac)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/i386/acpi-build.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index de98750aef..dbee0cd3bc 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -432,11 +432,15 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
 
         if (bsel) {
-            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+            /*
+             * Can't declare _SUN here for every device as it changes 'slot'
+             * enumeration order in linux kernel, so use another variable for it
+             */
+            aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
             method = aml_method("_DSM", 4, AML_SERIALIZED);
             aml_append(method, aml_return(
                 aml_call6("PDSM", aml_arg(0), aml_arg(1), aml_arg(2),
-                          aml_arg(3), aml_name("BSEL"), aml_name("_SUN"))
+                          aml_arg(3), aml_name("BSEL"), aml_name("ASUN"))
             ));
             aml_append(dev, method);
         }
@@ -463,6 +467,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             aml_append(method, aml_return(aml_int(s3d)));
             aml_append(dev, method);
         } else if (hotplug_enabled_dev) {
+            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
             /* add _EJ0 to make slot hotpluggable  */
             method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
             aml_append(method,
-- 
2.25.1


