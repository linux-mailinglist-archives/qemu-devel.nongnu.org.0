Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10319474EE2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:07:51 +0100 (CET)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxHpm-0003qh-5T
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:07:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHmG-0001JG-QQ; Tue, 14 Dec 2021 19:04:12 -0500
Received: from mail-co1nam11on2079.outbound.protection.outlook.com
 ([40.107.220.79]:46817 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHmD-0004j8-SO; Tue, 14 Dec 2021 19:04:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W54G7r6JyTMKWeJfi0GjLkV0L/EDe0uZBrjkLiCAUNnCVFy7RWkpRrRAxX3z4+FETijkvlheBRukjvj8GLZnJaC0i/mpFbPZ4cnj218L7bdIL92MtdjgEjALk0x9IVGZ21tgE9AlYeSwoSMEBqUjgw0EOgWwtMQkffqd0AvTHdzdNB5PpsIZOXUNJpHssTgKKKZlq/8Tcwf1KL9x+tOAQWbkJNji6UJAGtXKEqmS+VGXKBlj+SWSCZvKa02mVSNkZfIGX/3VbH6y0HwkJa0/ShmqSn0QfaCR7NgvKy2tBq4/+Wofux1CkBwfLlemXZps2MTNuug7M1bGHb8vX4uu4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XWGlqkuB78DVBPtakO4LrmQcExrwvoFzdkACzKC870=;
 b=d5QAR73vXtoU2jeCZ/QoK4uTxqLgyY6jTj6W/AaVvOjJvskmU269Dpv4JZLxeSxv0V73Y+/HX64Dh+dtGMXiMkEPrB4XdAcNF1nXXoXa+93Tl4f7n9TrqcVgRsm5N+zxOUnWwz9MRJHcW55eVRMreZgw2GydWOnEL2R2O+3U6FKyqJMa5qHI0KDNys8BUnHQCOBFoaHLbUwYk2UrTdrEVVW1cRDclRO9c1KzLjhcK8YpLKu0wDbYi3GQlq2moSlCqGCzWCLV6raHMpIEXabA/e2M5z4cv3zY4gTOf2y5bxHXxu6r6KEN9pODdSe7VhO7ni0WHUnzALlaFwAABLzE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XWGlqkuB78DVBPtakO4LrmQcExrwvoFzdkACzKC870=;
 b=Uo9aSdiA9glzuG/vdI+W5aBSco5qsV3aKLz+Qmv1XedpNL5s3zc+CYBzAOT5tOaVt7z3PpcLk/zd/pRg9ryj5bgMqr1S6KiHh4Oi5JMN0DGYEUSmbni1OWrbwi344ur0luHsQ8NoNM1pgrCvZo6My9Sc+h+R7JD1UmQD8uhHsvo=
Received: from MW4PR03CA0327.namprd03.prod.outlook.com (2603:10b6:303:dd::32)
 by MW3PR12MB4362.namprd12.prod.outlook.com (2603:10b6:303:5d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:04:06 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::5b) by MW4PR03CA0327.outlook.office365.com
 (2603:10b6:303:dd::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Wed, 15 Dec 2021 00:04:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:04:06 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:04:05 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>
Subject: [PATCH 00/47] Patch Round-up for stable 6.1.1, freeze on 2021-12-21
Date: Tue, 14 Dec 2021 18:00:38 -0600
Message-ID: <20211215000125.378126-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34033693-e597-4aa7-7a89-08d9bf5e6927
X-MS-TrafficTypeDiagnostic: MW3PR12MB4362:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB43620BDD782157F6D918380B95769@MW3PR12MB4362.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fywZ4Hhz4T/zEJ5cLE3ETh4YOKgrysyCwwMhONOmpbyxKEw335iCdWwBJ+/SUKkGVLLg2TTFfw87/BKRxbb4T7xcEN8fwKtuldJDlnvUy+EZdNFQK3lEahJs5V2DF65mWqVMnZ2ZGErpYaJVwkWIaNDDwkrRwJga7gKuOQBl4nnCMegMrirp3HTHxoZpsL2VmHNmnzjRbnx05P5ZBqCDGBSZqkEGIqUP4r6AvvITA5zn9A6ynvzn0+jRYS0tWMVqKGvc7mU/usnXBrfz79QkVgagF6WOMUFRVzsWpjPcO7ew0oBohU6ug0YYA5qWfMxoUfMZXV5qGjtI1f67taLdYiVsfigA758RSMBJ3wLQ9cVwix59/yFtdEYDhKlFRpsud62YpZy+RllDEYrbQ2SgB6wxgRUnhh8EVYP3m31nN6oBCKQoOLo4t1vbDc2GED/yl7BCWgwmzMm6osoRjz19luZ193COMeDTukHNjJMP04Z2tuZyGtUPuiXUg2LTa2TeZuvX5Gw/AY7XM2BqVw/hqX+uzis+33QcdfA6ol0bOgxsvM6Bci3eY31EiPnaw5VX61FBB6GkRtjB+r/Cv30n3P5d48pAFD0CL5D0Vh9NcbqFpwAE55SAVY2mhh82sY8Jyd44mzIO0XbcVNUQ0+8KbflwqTa7gXSfNxKNUdpariPBkUP74G77DkF6Fds2qn9tOX2sGSZMN+B5KW5xxDBl61kD1HnF28rpMohS4Lp07SWUQmVne9/Wxdqljt2aTCM1fYy6VasuaXXi+izxdHn38Vf8hPL8G/Moew+FQRRhnNlLOnSetokkek1b3sSmn+nYq/Eq4KJyMEQWz8Ouq0VYLXx0yYW7BBlYPdivKQtiEuYbyCrgu6Fvni6XMBrQ8/vPjbIltCymZc+RC8YCcwUbXA3zMW5jxVyupm8MP5IUUJ0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(966005)(5660300002)(2906002)(26005)(1076003)(36756003)(6916009)(70206006)(450100002)(426003)(6666004)(86362001)(508600001)(70586007)(336012)(2616005)(16526019)(47076005)(40460700001)(82310400004)(316002)(8936002)(4326008)(4001150100001)(36860700001)(44832011)(186003)(8676002)(83380400001)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:04:06.0099 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34033693-e597-4aa7-7a89-08d9bf5e6927
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4362
Received-SPF: softfail client-ip=40.107.220.79;
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

Hi everyone,

The following new patches are queued for QEMU stable v6.1.1:

  https://gitlab.com/qemu-project/qemu/-/commits/stable-6.1-staging/

Patch freeze is 2021-12-21, and the release is planned for 2021-12-23:

  https://wiki.qemu.org/Planning/6.1

Please respond here or CC qemu-stable@nongnu.org on any additional patches
you think should (or shouldn't) be included in the release.

Thanks!

----------------------------------------------------------------
Ani Sinha (6):
      bios-tables-test: allow changes in DSDT ACPI tables for q35
      hw/i386/acpi: fix conflicting IO address range for acpi pci hotplug in q35
      bios-tables-test: Update ACPI DSDT table golden blobs for q35
      tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT table blob
      tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges for q35
      tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge test

Ari Sundholm (1):
      block/file-posix: Fix return value translation for AIO discards

Christian Schoenebeck (1):
      9pfs: fix crash in v9fs_walk()

Daniil Tatianin (1):
      chardev/wctable: don't free the instance in wctablet_chr_finalize

David Hildenbrand (3):
      virtio-balloon: don't start free page hinting if postcopy is possible
      virtio-mem-pci: Fix memory leak when creating MEMORY_DEVICE_SIZE_CHANGE event
      libvhost-user: fix VHOST_USER_REM_MEM_REG skipping mmap_addr

Eric Blake (1):
      nbd/server: Don't complain on certain client disconnects

Gerd Hoffmann (1):
      uas: add stream number sanity checks.

Greg Kurz (2):
      rcu: Introduce force_rcu notifier
      accel/tcg: Register a force_rcu notifier

Helge Deller (1):
      hw/display/artist: Fix bug in coordinate extraction in artist_vram_read() and artist_vram_write()

Igor Mammedov (1):
      pcie: rename 'native-hotplug' to 'x-native-hotplug'

Jason Wang (3):
      virtio-net: fix use after unmap/free for sg
      virtio: use virtio accessor to access packed descriptor flags
      virtio: use virtio accessor to access packed event

Jean-Philippe Brucker (2):
      hw/arm/virt: Rename default_bus_bypass_iommu
      hw/i386: Rename default_bus_bypass_iommu

Jessica Clarke (1):
      Partially revert "build: -no-pie is no functional linker flag"

Jon Maloy (1):
      e1000: fix tx re-entrancy problem

Klaus Jensen (1):
      hw/nvme: fix buffer overrun in nvme_changed_nslist (CVE-2021-3947)

Laurent Vivier (1):
      hw: m68k: virt: Add compat machine for 6.1

Mahmoud Mandour (1):
      plugins/execlog: removed unintended "s" at the end of log lines.

Mark Mielke (1):
      virtio-blk: Fix clean up of host notifiers for single MR transaction.

Markus Armbruster (1):
      hmp: Unbreak "change vnc"

Mauro Matteo Cascella (1):
      hw/scsi/scsi-disk: MODE_PAGE_ALLS not allowed in MODE SELECT commands

Michael S. Tsirkin (1):
      pci: fix PCI resource reserve capability on BE

Michael Tokarev (1):
      qemu-sockets: fix unix socket path copy (again)

Nir Soffer (1):
      qemu-nbd: Change default cache mode to writeback

Paolo Bonzini (4):
      plugins: do not limit exported symbols if modules are active
      block: introduce max_hw_iov for use in scsi-generic
      target-i386: mmu: use pg_mode instead of HF_LMA_MASK
      target-i386: mmu: fix handling of noncanonical virtual addresses

Peng Liang (1):
      vfio: Fix memory leak of hostwin

Peter Maydell (1):
      target/arm: Don't skip M-profile reset entirely in user mode

Philippe Mathieu-Daudé (3):
      hw/block/fdc: Extract blk_create_empty_drive()
      hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
      tests/qtest/fdc-test: Add a regression test for CVE-2021-20196

Prasad J Pandit (1):
      net: vmxnet3: validate configuration values during activate (CVE-2021-20203)

Stefano Garzarella (1):
      vhost-vsock: fix migration issue when seqpacket is supported

Xueming Li (1):
      vhost-user: fix duplicated notifier MR init

Yang Zhong (1):
      i386/cpu: Remove AVX_VNNI feature from Cooperlake cpu model

 accel/tcg/tcg-accel-ops-mttcg.c           |  26 ++++++++++++++++++++
 accel/tcg/tcg-accel-ops-rr.c              |  10 ++++++++
 block/block-backend.c                     |   6 +++++
 block/file-posix.c                        |   6 ++---
 block/io.c                                |   1 +
 chardev/wctablet.c                        |   1 -
 configure                                 |  10 +++++---
 contrib/plugins/execlog.c                 |   2 +-
 docs/tools/qemu-nbd.rst                   |   6 +++--
 hw/9pfs/coth.h                            |   4 ++-
 hw/arm/virt.c                             |   4 +--
 hw/block/dataplane/virtio-blk.c           |   2 +-
 hw/block/fdc.c                            |  23 +++++++++++++++---
 hw/core/machine.c                         |   1 +
 hw/display/artist.c                       |   8 +++---
 hw/i386/pc.c                              |   2 +-
 hw/i386/pc_q35.c                          |   2 +-
 hw/m68k/virt.c                            |   9 ++++++-
 hw/net/e1000.c                            |   7 ++++++
 hw/net/virtio-net.c                       |  39 ++++++++++++++++++++++++------
 hw/net/vmxnet3.c                          |  13 ++++++++++
 hw/nvme/ctrl.c                            |   5 ++++
 hw/pci/pci_bridge.c                       |  10 ++++----
 hw/pci/pcie_port.c                        |   2 +-
 hw/scsi/scsi-disk.c                       |   6 +++++
 hw/scsi/scsi-generic.c                    |   2 +-
 hw/usb/dev-uas.c                          |  11 +++++++++
 hw/vfio/common.c                          |   8 ++++++
 hw/virtio/vhost-user.c                    |   5 ++--
 hw/virtio/vhost-vsock.c                   |  19 ++++++++++++---
 hw/virtio/virtio-balloon.c                |  13 ++++++++++
 hw/virtio/virtio-mem-pci.c                |   7 +-----
 hw/virtio/virtio.c                        |  24 ++++++------------
 include/block/block_int.h                 |   7 ++++++
 include/hw/acpi/ich9.h                    |   2 +-
 include/hw/virtio/vhost-vsock.h           |   3 +++
 include/qemu/rcu.h                        |  15 ++++++++++++
 include/sysemu/block-backend.h            |   1 +
 monitor/hmp-cmds.c                        |   2 +-
 nbd/server.c                              |   3 +++
 plugins/meson.build                       |  14 ++++++-----
 qemu-nbd.c                                |   6 +++--
 subprojects/libvhost-user/libvhost-user.c |   1 +
 target/arm/cpu.c                          |  19 +++++++++++++++
 target/i386/cpu.c                         |   2 +-
 target/i386/tcg/sysemu/excp_helper.c      |  25 ++++++++++---------
 tests/data/acpi/q35/DSDT                  | Bin 8289 -> 8289 bytes
 tests/data/acpi/q35/DSDT.acpihmat         | Bin 9614 -> 9614 bytes
 tests/data/acpi/q35/DSDT.bridge           | Bin 11003 -> 11003 bytes
 tests/data/acpi/q35/DSDT.cphp             | Bin 8753 -> 8753 bytes
 tests/data/acpi/q35/DSDT.dimmpxm          | Bin 9943 -> 9943 bytes
 tests/data/acpi/q35/DSDT.ipmibt           | Bin 8364 -> 8364 bytes
 tests/data/acpi/q35/DSDT.memhp            | Bin 9648 -> 9648 bytes
 tests/data/acpi/q35/DSDT.mmio64           | Bin 9419 -> 9419 bytes
 tests/data/acpi/q35/DSDT.multi-bridge     | Bin 0 -> 8583 bytes
 tests/data/acpi/q35/DSDT.nohpet           | Bin 8147 -> 8147 bytes
 tests/data/acpi/q35/DSDT.numamem          | Bin 8295 -> 8295 bytes
 tests/data/acpi/q35/DSDT.tis              | Bin 8894 -> 8894 bytes
 tests/qtest/bios-tables-test.c            |  18 ++++++++++++++
 tests/qtest/fdc-test.c                    |  38 +++++++++++++++++++++++++++++
 util/qemu-sockets.c                       |  13 ++++------
 util/rcu.c                                |  19 +++++++++++++++
 62 files changed, 386 insertions(+), 96 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge



