Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4789247B644
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 00:45:43 +0100 (CET)
Received: from localhost ([::1]:33124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzSLd-0004Z9-So
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 18:45:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mzSJV-0003fT-MP; Mon, 20 Dec 2021 18:43:29 -0500
Received: from mail-dm6nam12on2058.outbound.protection.outlook.com
 ([40.107.243.58]:45633 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mzSJI-00069z-8q; Mon, 20 Dec 2021 18:43:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dT5F9Sx2supwoWDlg25ZbaWT3kUKxkWYsQFww9EXigVKHtdbCQtQLuTqfgW7H45p1YZHHLjdQEGgIjmB0M4YEGn27mCQVcPIP2HZPHd6FP0vzUduEKg/AQ8mzpvhCCBpXfYKC2jNcKzGHGM1ihwjrSUuHPzHfEy48xYA54U/iuFn7sH4dynFxeEcy9cqEUOSEUgNIEGAxu6EA7FxmmVAWHA0rwzZG/9sgXIQaY9kOXvMk74Xuj/XDMJRLPM3CMgWsjAQUmcZcrrgTpp0gC7nX513J9YX1di62gcice8pANlfB/lHr9/ym+Cf+k/bvjgnbKyjDCGL25+9ORXeI6sAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Khl40WP/KoJKY6EdGwLk/D0rkek//7vF2yv7C+hhvQw=;
 b=BYzHT6XqFrmovSuoPCmzAu+D/XeEkZ8CrDUT79Ii702vyi70YEWKkfjJfZVhWaN/m0dXDqfN4HjUb9hZXoip1eHIE7wu4Hjx1so1JcgsDQlv1U+KLP4CsbdM1e2XDRautZ87ql6xxbVjLNqiRtDlhN0uYCY4dQ5R/eQOovdfZs9FWjicv8xwZrK0hZAkz5Vkf7Wf292tDPp1znuNOfZe2JFLFP0EgbQjEvd7+p5uEgbHwJwq93HuRVYi9iNn27JwAaSB3lu8r1iAn45IZOoX7G7zNJ/+h2cjagRISPC/1Kd1bG14cdQWh7YmYGt2yinN/nX5RxIGKFdwwi/E6fqWcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Khl40WP/KoJKY6EdGwLk/D0rkek//7vF2yv7C+hhvQw=;
 b=bf7Su6VanGj0BJF+cYiE4wtPO4nCTlSLOAURVkUQA6CsMz+9jhBZpuSFXyTqvZy9qNdPArnECqUXWBSys5vJarnxoXl1kMoS5CS1Wb525CGp3o1WIWGoNAZG+CXIpG65V2DbnuZ7wBsZNtxjg61OyKVxFtlPnufKEwUqm7M2K5M=
Received: from BN6PR16CA0035.namprd16.prod.outlook.com (2603:10b6:405:14::21)
 by BN6PR12MB1873.namprd12.prod.outlook.com (2603:10b6:404:102::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 23:43:11 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::56) by BN6PR16CA0035.outlook.office365.com
 (2603:10b6:405:14::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15 via Frontend
 Transport; Mon, 20 Dec 2021 23:43:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 23:43:11 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 20 Dec
 2021 17:43:10 -0600
Date: Mon, 20 Dec 2021 17:41:46 -0600
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>
Subject: Re: [PATCH 00/47] Patch Round-up for stable 6.1.1, freeze on
 2021-12-21
Message-ID: <20211220234146.s7pq5gu6yxhtub3r@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f2d9c54-8ab5-4aaa-308b-08d9c4127b90
X-MS-TrafficTypeDiagnostic: BN6PR12MB1873:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB18730A811E935F5C3D578D72957B9@BN6PR12MB1873.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BhzabBn5kI9pfIkq+dE/i5n47MOzwf+KqqbXyt+QrU+h9f62G+F0tItzntQhO1C+BE5dCI4FwiuL73SfR3+9wN+s4QacPEJQitCTObidsx/L+2FTjyYDTCQPTfWLn9oyUP1f3bCJZQU3a2gqhPBpIBC+xO442XyFagucEAarPntf93lDw+1FOv04LSXUmvPWV70HGpex9j1xBqWyxy83vKX/v6IVThcXrQ9OTiM04SP8praEGcc89/ypDrSSG28e8mFz4vFYU97xzpLPGqakoUlLnY0IzOQG2bqv3ZH+Wn6OsCNoBiPXY1rTUaJ7hklD0UFslUx+2vkTxPhAeu7zob57+2JBmUg8sHMSQnQiHQfcHzqKVMIEh/SeIt+y30q0PMbrh/doIJQbFIg+28p/Zcae2EyHQ5ybZo74GQcQDcgai96kwxuXhgMmGQW6Nputoakr5frXoclG1k23TWIbmZZ9UulmH4lr69uaNrqFGfkWVMaDl3uYK6mcAHiWE23qiYNB4jx3bSt1/5M335AHByzpl1NzoKzBNQ+nBIqqlfxEwbuYjGlq1/qpkLVE7cBfOWti8EBai8aAFQ/yQt/qUuo9Ym1133nrLUW2tSNIQlfIBnXeP+R+rzsleLufllKJYNGr7lldQLA5o/y/fDcAs2HWko84xBnrPKIlIx8EtwpwcaVtw0VHPOJ/PJxFx9qxgmCpElrr2pr+1A/BCYPLfu63UXAKwRg5oiwONlWvMV8hmEMZo6XXdkfKDFTPexDvVqdx15A+gqJU/EpTBslUGMZXIay8/wGNQxNY+wjLNfYU66KjXqtWWuq5k5ljW1XXpf8jXH3GJ9ZzYCrWVLqmuZb+MrKa9GRXpd3hbRWZwhTi72Vyi3UBx/KX7ITXElK73EWD8qMH2D/d+BCbFFoxHMxLXLsHQd76cCAAfihzFkM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(36756003)(81166007)(2616005)(186003)(40460700001)(82310400004)(70206006)(26005)(16526019)(70586007)(6666004)(44832011)(426003)(83380400001)(47076005)(6916009)(336012)(4326008)(356005)(36860700001)(1076003)(86362001)(966005)(4001150100001)(2906002)(508600001)(316002)(8936002)(8676002)(5660300002)(450100002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 23:43:11.0669 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2d9c54-8ab5-4aaa-308b-08d9c4127b90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1873
Received-SPF: softfail client-ip=40.107.243.58;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Michael Roth <michael.roth@amd.com>
From:  Michael Roth via <qemu-devel@nongnu.org>

On Tue, Dec 14, 2021 at 06:00:38PM -0600, Michael Roth wrote:
> Hi everyone,
> 
> The following new patches are queued for QEMU stable v6.1.1:
> 
>   https://gitlab.com/qemu-project/qemu/-/commits/stable-6.1-staging/
> 
> Patch freeze is 2021-12-21, and the release is planned for 2021-12-23:
> 
>   https://wiki.qemu.org/Planning/6.1
> 
> Please respond here or CC qemu-stable@nongnu.org on any additional patches
> you think should (or shouldn't) be included in the release.

Thank you for the suggestions so far. The following additional patches have
been pushed to the staging tree:

  fddd169de5 tests: tcg: Fix PVH test with binutils 2.36+
  711bd602cc tcg/arm: Reduce vector alignment requirement for NEON
  e88636b4d4 target/i386: add missing bits to CR4_RESERVED_MASK
  34833f361b qxl: fix pre-save logic

  https://gitlab.com/mdroth/qemu/-/commits/stable-6.1-staging/

Patch freeze is 2021-21-21 EOD.

-Mike

> 
> Thanks!
> 
> ----------------------------------------------------------------
> Ani Sinha (6):
>       bios-tables-test: allow changes in DSDT ACPI tables for q35
>       hw/i386/acpi: fix conflicting IO address range for acpi pci hotplug in q35
>       bios-tables-test: Update ACPI DSDT table golden blobs for q35
>       tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT table blob
>       tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges for q35
>       tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge test
> 
> Ari Sundholm (1):
>       block/file-posix: Fix return value translation for AIO discards
> 
> Christian Schoenebeck (1):
>       9pfs: fix crash in v9fs_walk()
> 
> Daniil Tatianin (1):
>       chardev/wctable: don't free the instance in wctablet_chr_finalize
> 
> David Hildenbrand (3):
>       virtio-balloon: don't start free page hinting if postcopy is possible
>       virtio-mem-pci: Fix memory leak when creating MEMORY_DEVICE_SIZE_CHANGE event
>       libvhost-user: fix VHOST_USER_REM_MEM_REG skipping mmap_addr
> 
> Eric Blake (1):
>       nbd/server: Don't complain on certain client disconnects
> 
> Gerd Hoffmann (1):
>       uas: add stream number sanity checks.
> 
> Greg Kurz (2):
>       rcu: Introduce force_rcu notifier
>       accel/tcg: Register a force_rcu notifier
> 
> Helge Deller (1):
>       hw/display/artist: Fix bug in coordinate extraction in artist_vram_read() and artist_vram_write()
> 
> Igor Mammedov (1):
>       pcie: rename 'native-hotplug' to 'x-native-hotplug'
> 
> Jason Wang (3):
>       virtio-net: fix use after unmap/free for sg
>       virtio: use virtio accessor to access packed descriptor flags
>       virtio: use virtio accessor to access packed event
> 
> Jean-Philippe Brucker (2):
>       hw/arm/virt: Rename default_bus_bypass_iommu
>       hw/i386: Rename default_bus_bypass_iommu
> 
> Jessica Clarke (1):
>       Partially revert "build: -no-pie is no functional linker flag"
> 
> Jon Maloy (1):
>       e1000: fix tx re-entrancy problem
> 
> Klaus Jensen (1):
>       hw/nvme: fix buffer overrun in nvme_changed_nslist (CVE-2021-3947)
> 
> Laurent Vivier (1):
>       hw: m68k: virt: Add compat machine for 6.1
> 
> Mahmoud Mandour (1):
>       plugins/execlog: removed unintended "s" at the end of log lines.
> 
> Mark Mielke (1):
>       virtio-blk: Fix clean up of host notifiers for single MR transaction.
> 
> Markus Armbruster (1):
>       hmp: Unbreak "change vnc"
> 
> Mauro Matteo Cascella (1):
>       hw/scsi/scsi-disk: MODE_PAGE_ALLS not allowed in MODE SELECT commands
> 
> Michael S. Tsirkin (1):
>       pci: fix PCI resource reserve capability on BE
> 
> Michael Tokarev (1):
>       qemu-sockets: fix unix socket path copy (again)
> 
> Nir Soffer (1):
>       qemu-nbd: Change default cache mode to writeback
> 
> Paolo Bonzini (4):
>       plugins: do not limit exported symbols if modules are active
>       block: introduce max_hw_iov for use in scsi-generic
>       target-i386: mmu: use pg_mode instead of HF_LMA_MASK
>       target-i386: mmu: fix handling of noncanonical virtual addresses
> 
> Peng Liang (1):
>       vfio: Fix memory leak of hostwin
> 
> Peter Maydell (1):
>       target/arm: Don't skip M-profile reset entirely in user mode
> 
> Philippe Mathieu-Daudé (3):
>       hw/block/fdc: Extract blk_create_empty_drive()
>       hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
>       tests/qtest/fdc-test: Add a regression test for CVE-2021-20196
> 
> Prasad J Pandit (1):
>       net: vmxnet3: validate configuration values during activate (CVE-2021-20203)
> 
> Stefano Garzarella (1):
>       vhost-vsock: fix migration issue when seqpacket is supported
> 
> Xueming Li (1):
>       vhost-user: fix duplicated notifier MR init
> 
> Yang Zhong (1):
>       i386/cpu: Remove AVX_VNNI feature from Cooperlake cpu model
> 
>  accel/tcg/tcg-accel-ops-mttcg.c           |  26 ++++++++++++++++++++
>  accel/tcg/tcg-accel-ops-rr.c              |  10 ++++++++
>  block/block-backend.c                     |   6 +++++
>  block/file-posix.c                        |   6 ++---
>  block/io.c                                |   1 +
>  chardev/wctablet.c                        |   1 -
>  configure                                 |  10 +++++---
>  contrib/plugins/execlog.c                 |   2 +-
>  docs/tools/qemu-nbd.rst                   |   6 +++--
>  hw/9pfs/coth.h                            |   4 ++-
>  hw/arm/virt.c                             |   4 +--
>  hw/block/dataplane/virtio-blk.c           |   2 +-
>  hw/block/fdc.c                            |  23 +++++++++++++++---
>  hw/core/machine.c                         |   1 +
>  hw/display/artist.c                       |   8 +++---
>  hw/i386/pc.c                              |   2 +-
>  hw/i386/pc_q35.c                          |   2 +-
>  hw/m68k/virt.c                            |   9 ++++++-
>  hw/net/e1000.c                            |   7 ++++++
>  hw/net/virtio-net.c                       |  39 ++++++++++++++++++++++++------
>  hw/net/vmxnet3.c                          |  13 ++++++++++
>  hw/nvme/ctrl.c                            |   5 ++++
>  hw/pci/pci_bridge.c                       |  10 ++++----
>  hw/pci/pcie_port.c                        |   2 +-
>  hw/scsi/scsi-disk.c                       |   6 +++++
>  hw/scsi/scsi-generic.c                    |   2 +-
>  hw/usb/dev-uas.c                          |  11 +++++++++
>  hw/vfio/common.c                          |   8 ++++++
>  hw/virtio/vhost-user.c                    |   5 ++--
>  hw/virtio/vhost-vsock.c                   |  19 ++++++++++++---
>  hw/virtio/virtio-balloon.c                |  13 ++++++++++
>  hw/virtio/virtio-mem-pci.c                |   7 +-----
>  hw/virtio/virtio.c                        |  24 ++++++------------
>  include/block/block_int.h                 |   7 ++++++
>  include/hw/acpi/ich9.h                    |   2 +-
>  include/hw/virtio/vhost-vsock.h           |   3 +++
>  include/qemu/rcu.h                        |  15 ++++++++++++
>  include/sysemu/block-backend.h            |   1 +
>  monitor/hmp-cmds.c                        |   2 +-
>  nbd/server.c                              |   3 +++
>  plugins/meson.build                       |  14 ++++++-----
>  qemu-nbd.c                                |   6 +++--
>  subprojects/libvhost-user/libvhost-user.c |   1 +
>  target/arm/cpu.c                          |  19 +++++++++++++++
>  target/i386/cpu.c                         |   2 +-
>  target/i386/tcg/sysemu/excp_helper.c      |  25 ++++++++++---------
>  tests/data/acpi/q35/DSDT                  | Bin 8289 -> 8289 bytes
>  tests/data/acpi/q35/DSDT.acpihmat         | Bin 9614 -> 9614 bytes
>  tests/data/acpi/q35/DSDT.bridge           | Bin 11003 -> 11003 bytes
>  tests/data/acpi/q35/DSDT.cphp             | Bin 8753 -> 8753 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm          | Bin 9943 -> 9943 bytes
>  tests/data/acpi/q35/DSDT.ipmibt           | Bin 8364 -> 8364 bytes
>  tests/data/acpi/q35/DSDT.memhp            | Bin 9648 -> 9648 bytes
>  tests/data/acpi/q35/DSDT.mmio64           | Bin 9419 -> 9419 bytes
>  tests/data/acpi/q35/DSDT.multi-bridge     | Bin 0 -> 8583 bytes
>  tests/data/acpi/q35/DSDT.nohpet           | Bin 8147 -> 8147 bytes
>  tests/data/acpi/q35/DSDT.numamem          | Bin 8295 -> 8295 bytes
>  tests/data/acpi/q35/DSDT.tis              | Bin 8894 -> 8894 bytes
>  tests/qtest/bios-tables-test.c            |  18 ++++++++++++++
>  tests/qtest/fdc-test.c                    |  38 +++++++++++++++++++++++++++++
>  util/qemu-sockets.c                       |  13 ++++------
>  util/rcu.c                                |  19 +++++++++++++++
>  62 files changed, 386 insertions(+), 96 deletions(-)
>  create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
> 
> 
> 

