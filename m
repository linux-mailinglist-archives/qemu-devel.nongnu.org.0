Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA7447E98C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 23:34:36 +0100 (CET)
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0WfT-0000KO-BS
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 17:34:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1n0Wd9-0007Lj-Pf; Thu, 23 Dec 2021 17:32:11 -0500
Received: from mail-co1nam11on2047.outbound.protection.outlook.com
 ([40.107.220.47]:10240 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1n0Wd5-00069h-Vd; Thu, 23 Dec 2021 17:32:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OiWOo3Do0GX3VgaRXnmydX+PH0lfejNpQZzphy79ovvj6my5vEMsuuIDAtgCZkOOI+23Izjz9Y5lRD1SHRSQDWJxbdyclzXOaoOD6q/MgtN7FqpuyOP5a2oVZzQERBqvC7N+ziDUeJDq4jYNti11nUPEL5OoTNfRIP3WaNf0fdH7B63vE7uxDGFJlw7J1qr2sNBgE4XAxFB9+pzZhttOiLaI3aVx9T0gWFexNvz16zj5AhDSpsVO5yOgYvfXefNrWcGL8GE3AiaMCpxO2yXYpyk7NHu5YY7aRr83XRPM4BsZl6nqJn5WTsSvlgwEly07eguLixBsiWYhVybpuRwlKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjAR8S66OfBb35HDwYdgGBTabBVbnQLifLa0Xbu6E7Q=;
 b=eosACB85bm0OmFFIREDe4JjNj84/z00Lu6CamcqPhQJGeB4ezie7vloxuM1PI03Irw40O279dbTEJ6w5yHqqr801mZmY1f3+vFJVPJjgqPBm7eyGfJK+zFbFr+DwMW9fXuEmAB+2uJRKrS0/ZgspcNnaxcrkW2o796WPNL8JiuxI1cbGlzS74KfMJhM9tRq1rmqW10IQsNybsifX8LUiTnJdY3mzw+vWxAhVzB9sHLKVyt2odkrhV7SRHshxIEC/LxUXgYw0RX4IHUY63x/zxJDXCGkOzGR7eI7QsCWMvF55aXPglRYXw1j6IodiyGN6BCS+xrIfG2IefUEyx9Ekyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjAR8S66OfBb35HDwYdgGBTabBVbnQLifLa0Xbu6E7Q=;
 b=m1xtU4HtPsQm1ZUz5noDgASb1r6A+6YdCkFNd+KsaKhvlIokR3VQFJVneCEEVhWivVJrrtr+e1Jw5BsXhc82g4UyZI96b/pUx9FE4JbWT9pfzdsi/cdvt/e+JUxc695GL+1jCFB1HfSxgRCAQcidf4y4avvu422koh4dBYsBlYk=
Received: from DS7PR06CA0031.namprd06.prod.outlook.com (2603:10b6:8:54::11) by
 BY5PR12MB5527.namprd12.prod.outlook.com (2603:10b6:a03:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Thu, 23 Dec
 2021 22:32:03 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::9c) by DS7PR06CA0031.outlook.office365.com
 (2603:10b6:8:54::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18 via Frontend
 Transport; Thu, 23 Dec 2021 22:32:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 22:32:03 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 23 Dec
 2021 16:32:02 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.1.1 Stable released
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>
Date: Thu, 23 Dec 2021 16:28:15 -0600
Message-ID: <164029849563.281415.815636408301189127@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b28fba2-4554-46a3-27c3-08d9c6640b01
X-MS-TrafficTypeDiagnostic: BY5PR12MB5527:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB5527325F8C23ABDB0BE379CB957E9@BY5PR12MB5527.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R3Wk2oc0pg0NYVB/rQuB7BUR1Fj/apiWR/ax3F++KMXkbm9N07Toh5S2JQGTu6QiUXt8JD9dT50BdZBcFBTjHpU5Td3IGcuSfKOffoVfMIA5OkLnuAnx/5DdN75e6GRFOxeo/icC9r88W8tjam3YhRbOe2oicrdeqmIitqNTdLRcUtvbVG2VctEaSQjbQ+8SSPwLhuuU6nO5+zbS5OFRdJpAvOuLTiCcZYl+1Ztk1f+lITTCu32/oCMOX5bfPe8cUocHoqqUE9QQNiUrBPd6x6T0Wn6tZFyecW24FyFTg0awv4Lbv0iSiGSb8mhQX5y3abA5QmZhGSYnriFiKZWOk/6dEXkXXr/GahKTRDgWJ6dItLuUlincYNOqAR4Iwv6Hw8HNOHOTnXg5zM5FAlQph4FozMBXyc8grWbUsX/6Dbbosm77fK+M5UI4pNIs+3+bCpYD0pJfEDrM81DC1AodtqVSi2ROpwYXoP22BxjyPRp1MXZDU4ZPOi9yE1S8D5ozwqxJoD5HpBT0in6gKq9M54OrX7WU9OZSXi1nu9lQeycW5R+njDs0IiudQmBC9Vcda34N7MUZbKxLhrTV0dseVDpW7V0pnYyLKLqV8gbItbuw27s1yrUYf47SWYpdg2olCE6aUDsYv1c07d5vsyMqc+mWQWINkvFt8AE0+Bl3Xvf/8RDkb/PVPc9di0AFIRZtHCiGNc7eLathB/6fXHWGCLdfrlwjsyKDqijoqZkmrnh4Z93vPrfJgdkRIQYxH3wfAMndvyUvV3K20yVm0XWtLI9GciuwA3O7JhAIlIAOuekPH9y4llxanp0EugFsAob+128LmCWlj3tsZiwWR7V4bNgifqGm+F+l7yOs5E2bhWufxerpoDpoTfka+knweNPt
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(70586007)(47076005)(40460700001)(82310400004)(186003)(356005)(16526019)(83380400001)(6666004)(36860700001)(70206006)(316002)(26005)(336012)(426003)(44832011)(966005)(2616005)(6916009)(8936002)(450100002)(36756003)(2906002)(5660300002)(86362001)(8676002)(508600001)(4326008)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 22:32:03.2196 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b28fba2-4554-46a3-27c3-08d9c6640b01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5527
Received-SPF: softfail client-ip=40.107.220.47;
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

I am pleased to announce that the QEMU v6.1.1 stable release is now
available.

You can grab the tarball from our download page here:

  https://www.qemu.org/download/#source

v6.1.1 is now tagged in the official qemu.git repository, and the
stable-6.1 branch has been updated accordingly:

  https://git.qemu.org/?p=3Dqemu.git;a=3Dshortlog;h=3Drefs/heads/stable-6.1

This update contains general fixes for various architectures/subsystems,
including the following CVE fixes:

    e1000 (CVE-2021-20257)
    floppy drive (CVE-2021-20196)
    NVMe (CVE-2021-3947)
    SCSI (CVE-2021-3930)
    UAS (CVE-2021-3713)
    virtio-net (CVE-2021-3748)
    vmxnet3 (CVE-2021-20203)

Please see the changelog for additional details and update accordingly.

Thank you to everyone involved!

CHANGELOG:

54e1f5be86: Update version for v6.1.1 release (Michael Roth)
fddd169de5: tests: tcg: Fix PVH test with binutils 2.36+ (Cole Robinson)
711bd602cc: tcg/arm: Reduce vector alignment requirement for NEON (Richard =
Henderson)
e88636b4d4: target/i386: add missing bits to CR4_RESERVED_MASK (Daniel P. B=
errang=C3=A9)
34833f361b: qxl: fix pre-save logic (Gerd Hoffmann)
43583f0c07: e1000: fix tx re-entrancy problem (Jon Maloy)
1ce084af08: net: vmxnet3: validate configuration values during activate (CV=
E-2021-20203) (Prasad J Pandit)
fec12fc888: virtio-blk: Fix clean up of host notifiers for single MR transa=
ction. (Mark Mielke)
ef0cf1887e: tests/qtest/fdc-test: Add a regression test for CVE-2021-20196 =
(Philippe Mathieu-Daud=C3=A9)
71ba2adfeb: hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196=
 (Philippe Mathieu-Daud=C3=A9)
7629818574: hw/block/fdc: Extract blk_create_empty_drive() (Philippe Mathie=
u-Daud=C3=A9)
4658dfcbc0: chardev/wctable: don't free the instance in wctablet_chr_finali=
ze (Daniil Tatianin)
2b2eb343a0: hw/nvme: fix buffer overrun in nvme_changed_nslist (CVE-2021-39=
47) (Klaus Jensen)
932333c5f0: nbd/server: Don't complain on certain client disconnects (Eric =
Blake)
8c2d5911de: vfio: Fix memory leak of hostwin (Peng Liang)
08e46e6d92: virtio: use virtio accessor to access packed event (Jason Wang)
df1c9c3039: virtio: use virtio accessor to access packed descriptor flags (=
Jason Wang)
7204b8f3c6: pcie: rename 'native-hotplug' to 'x-native-hotplug' (Igor Mamme=
dov)
36c651c226: accel/tcg: Register a force_rcu notifier (Greg Kurz)
fceaefb43f: rcu: Introduce force_rcu notifier (Greg Kurz)
7d71e6bfb0: hw: m68k: virt: Add compat machine for 6.1 (Laurent Vivier)
c2c7f108b8: hw/scsi/scsi-disk: MODE_PAGE_ALLS not allowed in MODE SELECT co=
mmands (Mauro Matteo Cascella)
3488bb205d: target-i386: mmu: fix handling of noncanonical virtual addresse=
s (Paolo Bonzini)
cddfaf96ab: target-i386: mmu: use pg_mode instead of HF_LMA_MASK (Paolo Bon=
zini)
43a457841f: Partially revert "build: -no-pie is no functional linker flag" =
(Jessica Clarke)
ebf660beb1: block/file-posix: Fix return value translation for AIO discards=
 (Ari Sundholm)
bbbdedb386: tests/acpi/bios-tables-test: update DSDT blob for multifunction=
 bridge test (Ani Sinha)
8319de607f: tests/acpi/pcihp: add unit tests for hotplug on multifunction b=
ridges for q35 (Ani Sinha)
a759dc19ec: tests/acpi/bios-tables-test: add and allow changes to a new q35=
 DSDT table blob (Ani Sinha)
24101e36f1: pci: fix PCI resource reserve capability on BE (Michael S. Tsir=
kin)
a43e057bd6: block: introduce max_hw_iov for use in scsi-generic (Paolo Bonz=
ini)
3aa2c2cd67: bios-tables-test: Update ACPI DSDT table golden blobs for q35 (=
Ani Sinha)
9e80a430ed: hw/i386/acpi: fix conflicting IO address range for acpi pci hot=
plug in q35 (Ani Sinha)
c66f5dfc12: bios-tables-test: allow changes in DSDT ACPI tables for q35 (An=
i Sinha)
5cf977a2a1: hw/i386: Rename default_bus_bypass_iommu (Jean-Philippe Brucker)
36cfd11a86: hw/arm/virt: Rename default_bus_bypass_iommu (Jean-Philippe Bru=
cker)
246ccfbf44: vhost-vsock: fix migration issue when seqpacket is supported (S=
tefano Garzarella)
3ee93e456d: qemu-sockets: fix unix socket path copy (again) (Michael Tokare=
v)
ec08035102: plugins: do not limit exported symbols if modules are active (P=
aolo Bonzini)
f97853c8cb: plugins/execlog: removed unintended "s" at the end of log lines=
. (Mahmoud Mandour)
abeee2a470: 9pfs: fix crash in v9fs_walk() (Christian Schoenebeck)
ff6d391e10: i386/cpu: Remove AVX_VNNI feature from Cooperlake cpu model (Ya=
ng Zhong)
b19de1137b: hw/display/artist: Fix bug in coordinate extraction in artist_v=
ram_read() and artist_vram_write() (Helge Deller)
3c6e5df1f6: libvhost-user: fix VHOST_USER_REM_MEM_REG skipping mmap_addr (D=
avid Hildenbrand)
695c25e167: vhost-user: fix duplicated notifier MR init (Xueming Li)
23ba9f170f: uas: add stream number sanity checks. (Gerd Hoffmann)
f0dee5a40d: virtio-mem-pci: Fix memory leak when creating MEMORY_DEVICE_SIZ=
E_CHANGE event (David Hildenbrand)
7637373b23: hmp: Unbreak "change vnc" (Markus Armbruster)
4c34ef3d34: qemu-nbd: Change default cache mode to writeback (Nir Soffer)
9e41f16fca: virtio-net: fix use after unmap/free for sg (Jason Wang)
3054f772de: target/arm: Don't skip M-profile reset entirely in user mode (P=
eter Maydell)
aa77e375a5: virtio-balloon: don't start free page hinting if postcopy is po=
ssible (David Hildenbrand)

