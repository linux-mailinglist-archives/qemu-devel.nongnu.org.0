Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E997F6C4F7D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:31:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf0Qc-0005ee-MN; Wed, 22 Mar 2023 11:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pf0QX-0005cy-45
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:31:02 -0400
Received: from mail-dm6nam11on2061.outbound.protection.outlook.com
 ([40.107.223.61] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pf0QR-0004sG-Iz
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:31:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XU3TFMEsPSriLd5y3RoPFb1E5bVsN/mZ+eanphNP4ettcOyWESiQiamApgCige5Xon4PvueT1DBUOxXhVkeNw7+X0yP9EDHA9ukkNS00jweVVqk2WVOkGESWNHT5nIXUWyosbxtDCAU9f/F/pcK24r2bF/WGkLRx85pypGqzU8wPe7ixBSsdLsGPEWHbo3TQyTbh+b2oztCRJ4sFsknmk11g6CnSfDbJRXzySoz+bM5cROzDm1BHykHyUjLnEJOQNSezGHFyKvLn9uPiTJVTfCjqsRVMnfFau98nROEnh9kkXb9rs+TmShSTyDNy10ybS2tjBYz02tP98zkG3VkFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vYUbSUGQbUuAgqzaZKP20Nlv2JBtVVBu2350JxM5hs=;
 b=b/hVggDIp5WvSuX0fxSaaLrzCwY9PvNHjK5oK7OGqNqSThNuTrU89ucXHsPGhwl0almTAnS94KZ/huGjqv3EXml5g7Fj1z3HOQs7UB+HSxtUCrIXimkY3/7idGtc7P8voE6B/36E6rjkvwdvRLtiJX3Hp9gP6p5pQrvQrgLgrEbOeGsARceH3KzBqs2yF9ul8TaC9cMfEEwLbDGnQF64G2pzvwwi8HsXD7y9nirRSkzWeqYqCG83PqHuDeNJrWb1D3A/Wd3D4jhJ+bZMsEnlP6I6nVWdm/zyB0ZHLoEsL3z4zjg6F+MNfXuo6OvTtYiZ9TK1FLbKkRVrxtl4vMRZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vYUbSUGQbUuAgqzaZKP20Nlv2JBtVVBu2350JxM5hs=;
 b=4iYvXkBDdGJnQBpqBDLokrRETWWKrj8Iy3JdV0hZMlsLaG09y4Rm1vWquxGQgWe0mXiltZTdvXQkoYsQgoWSgFHtWnCkpJozbwiH3FHeOgtgQxVdiFHTHtt+Igtc7znyHN86trrpeXC2NYH6aKP4TajcaQ/uZmlaVoa62d4FENY=
Received: from CY8PR22CA0007.namprd22.prod.outlook.com (2603:10b6:930:45::15)
 by MN2PR12MB4112.namprd12.prod.outlook.com (2603:10b6:208:19a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 15:25:48 +0000
Received: from CY4PEPF0000C97B.namprd02.prod.outlook.com
 (2603:10b6:930:45:cafe::6) by CY8PR22CA0007.outlook.office365.com
 (2603:10b6:930:45::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 15:25:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97B.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Wed, 22 Mar 2023 15:25:47 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 22 Mar
 2023 10:25:46 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 8.0.0-rc1 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
Date: Wed, 22 Mar 2023 10:25:08 -0500
Message-ID: <167949870818.294415.18242228637497773566@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97B:EE_|MN2PR12MB4112:EE_
X-MS-Office365-Filtering-Correlation-Id: 7410e284-27d6-4607-8093-08db2ae9b627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fP2BLx6VdXMjvXoqom0bp8hEWZquGson3hCsm/NL7Ssax7sWoIGs3dz5KxG55K9+HvzZTTF3l2WBofAc2QMlU1jtpz4xfrYlc7BbQ3WzWNvFhb5KT+Hg3DA3Oduy1kTJiu2XnWLZCKkLRfIUhAoO8d4rrBkAVGqiyFoP64S9OCdy2+GnA/qlSoo6uHND3gTZoSDPEpfeCeuQotNwuCMGCGmXePOl1AUmFTj1Y/aEzKjhGtQucCpOTf853VY/4zBg122zunlspKRF/21GuD84PPn6evAAfgTzIPr70VP/7lXNGwQ027fmbfIWxYYhmdzS5aiMNiQsdEYq43fXQx02zwsFvlNyGLLiEO0cMCAUk4ss4N9vKm4zVCBSqcpq5Nnz88VqBTyq2GK4c+U4g3JbLdL0zVtevlgX3HuSx4rF7rbO40ppL2rJXzmWkly1d/WkUgjXi1EXEiVDNtuznPK6H5eDzq7C2m9ICW1QfNfuKLFphYjO14Pm0uZ4LVBGyLxHDFeRWAAeOZvyGh5eeRKWvTAN0uUZBrkn08bbuRFt2ifsjUj4ysrRw5M42ljXGbNDDEqqfiMbG0gDRQb5Y4DE88gFdtTVvSExKMJLRPkotet5R/zHyNmnWDcJRG/vGUMndRhplz/d7aMu/HoIN63W5IQ7VMwBtkrLE0dpMwQUfD1PhlW6rlxEr4EEhaC62x1KDDoSDcAL4Y53JZomcf/3WYN64mf/Fz1kPnTncLB9PpNNoZxSISuirJW+R5jbOGFaBhky3Ah5YZQ/ksHSG0BqiA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199018)(36840700001)(40470700004)(46966006)(316002)(86362001)(83380400001)(2616005)(426003)(356005)(81166007)(36860700001)(16526019)(82740400003)(82310400005)(36756003)(966005)(40460700003)(26005)(478600001)(336012)(186003)(40480700001)(6666004)(47076005)(8936002)(41300700001)(2906002)(44832011)(4326008)(70586007)(70206006)(5660300002)(8676002)(6916009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 15:25:47.3595 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7410e284-27d6-4607-8093-08db2ae9b627
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4112
Received-SPF: softfail client-ip=40.107.223.61;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
second release candidate for the QEMU 8.0 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu.org/qemu-8.0.0-rc1.tar.xz
  http://download.qemu.org/qemu-8.0.0-rc1.tar.xz.sig

You can help improve the quality of the QEMU 8.0 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/milestones/8#tab-issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/8.0

Please add entries to the ChangeLog for the 8.0 release below:

  http://wiki.qemu.org/ChangeLog/8.0

Thank you to everyone involved!

Changes since rc0:

c283ff89d1: Update version for v8.0.0-rc1 release (Peter Maydell)
5787d17a42: target/arm: Don't advertise aarch64-pauth.xml to gdb (Peter May=
dell)
d4e2cc9aa4: docs/system/arm/cpu-features.rst: Fix formatting (Peter Maydell)
3202b2628b: hw/usb/imx: Fix out of bounds access in imx_usbphy_read() (Guen=
ter Roeck)
d399d6b179: contrib/elf2dmp: add PE name check and Windows Server 2022 supp=
ort (Viktor Prutyanov)
06ac60b73e: contrib/elf2dmp: move PE dir search to pe_get_data_dir_entry (V=
iktor Prutyanov)
05adc48e1d: contrib/elf2dmp: fix code style (Viktor Prutyanov)
0c88f93788: hw/char/cadence_uart: Fix guards on invalid BRGR/BDIV settings =
(Peter Maydell)
0b90336995: target/arm: Add Neoverse-N1 registers (Chen Baozi)
49152ac470: ui: fix crash on serial reset, during init (Marc-Andr=C3=A9 Lur=
eau)
9b6611f40b: ui/sdl2: remove workaround forcing x11 (Erico Nunes)
3c293a4662: ui: return the default console cursor when con =3D=3D NULL (Mar=
c-Andr=C3=A9 Lureau)
281a77df28: ui/gtk: fix cursor moved to left corner (Marc-Andr=C3=A9 Lureau)
74bc00c6b9: ui/dbus: fix passing SOCKET to GSocket API & leak (Marc-Andr=C3=
=A9 Lureau)
e40283d9a1: ui/spice: fix SOCKET handling regression (Marc-Andr=C3=A9 Lurea=
u)
f3ab43accf: win32: add qemu_close_socket_osfhandle() (Marc-Andr=C3=A9 Lurea=
u)
48805df9c2: replace TABs with spaces (Yeqi Fu)
5cb993ff13: qemu/osdep: Switch position of "extern" and "G_NORETURN" (Bernh=
ard Beschow)
b6903cbe3a: tests/unit/test-blockjob: Disable complete_in_standby test (Pet=
er Maydell)
5b7b2a1cf9: target/s390x/tcg/mem_helper: Remove bad assert() statement (Tho=
mas Huth)
86305e8641: edk2: update firmware binaries (Gerd Hoffmann)
22e11539e1: edk2: replace build scripts (Gerd Hoffmann)
9e8a55aa78: edk2: update submodule to edk2-stable202302 (Gerd Hoffmann)
8b00004264: acpi: disable tests/data/acpi updates (Gerd Hoffmann)
e8d1e0cdd3: bios-tables-test: use 128M numa nodes on aarch64 (Gerd Hoffmann)
a31daba07e: acpi: enable tests/data/acpi updates (Gerd Hoffmann)
e902126cae: tests/tcg/s390x: Test unaligned accesses (Ilya Leoshkevich)
ba1ef833be: target/s390x: Update do_unaligned_access() comment (Ilya Leoshk=
evich)
39ad734445: target/s390x: Handle STGRL to non-aligned addresses (Ilya Leosh=
kevich)
2bc66225d8: target/s390x: Handle STRL to non-aligned addresses (Ilya Leoshk=
evich)
0708220c5b: target/s390x: Handle CLRL and CLGFRL with non-aligned addresses=
 (Ilya Leoshkevich)
2b25c8242e: target/s390x: Handle CGRL and CLGRL with non-aligned addresses =
(Ilya Leoshkevich)
227a9f79df: target/s390x: Handle CRL and CGFRL with non-aligned addresses (=
Ilya Leoshkevich)
4942e4cc90: target/s390x: Handle LLGFRL from non-aligned addresses (Ilya Le=
oshkevich)
e6d70c82ff: target/s390x: Handle LRL and LGFRL from non-aligned addresses (=
Ilya Leoshkevich)
2a00d55d21: target/s390x: Handle LGRL from non-aligned addresses (Ilya Leos=
hkevich)
ce7ca26968: target/s390x: Handle EXECUTE of odd addresses (Ilya Leoshkevich)
39344bbc13: target/s390x: Handle branching to odd addresses (Ilya Leoshkevi=
ch)
5e8a0c6291: tests/tcg/s390x: Add ex-relative-long.c (Ilya Leoshkevich)
703d03a4aa: target/s390x: Fix EXECUTE of relative long instructions (Ilya L=
eoshkevich)
04fce706bd: tests/tcg/s390x: Add rxsbg.c (Ilya Leoshkevich)
9701596d82: target/s390x: Fix R[NOX]SBG with T=3D1 (Ilya Leoshkevich)
a1465c8b5b: tests/tcg/s390x: Add PSW modification tests (Ilya Leoshkevich)
199c42a6a1: target/s390x: Implement Early Exception Recognition (Ilya Leosh=
kevich)
377dc84e2d: target/s390x: Fix LPSW (Ilya Leoshkevich)
9ba1caf510: MAINTAINERS: Mark the Nios II CPU as orphan (Thomas Huth)
fa76c854ae: migration: fix populate_vfio_info (Steve Sistare)
ff1585d1d8: migration/multifd: correct multifd_send_thread to trace the fla=
gs (Wei Wang)
bf0274192a: migration/rdma: Remove deprecated variable rdma_return_path (Li=
 Zhijian)
1776b70f55: migration/xbzrle: fix out-of-bounds write with axv512 (Matheus =
Tavares Bernardino)
d84a78d15d: migration/xbzrle: use ctz64 to avoid undefined result (Matheus =
Tavares Bernardino)
a5382214d8: migration/rdma: Fix return-path case (Dr. David Alan Gilbert)
a5d35dc7e0: migration: Wait on preempt channel in preempt thread (Peter Xu)
364206640c: docs/sphinx/kerneldoc.py: Honour --enable-werror (Peter Maydell)
d80d761daa: update seabios binaries to 1.16.2 (Gerd Hoffmann)
d27532e479: update seabios submodule to 1.16.2 (Gerd Hoffmann)
ad4052f104: target/sh4: Honor QEMU_LOG_FILENAME with QEMU_LOG=3Dcpu (Ilya L=
eoshkevich)
afa55c6e24: exec/memory: Fix kernel-doc warning (Bernhard Beschow)
51139fb3e7: tests/tcg/xtensa: allow testing big-endian cores (Max Filippov)
5161dba859: tests/tcg/xtensa: add linker.ld to CLEANFILES (Max Filippov)
dee2a4d4d2: vl: defuse PID file path resolve error (Fiona Ebner)
54ad31fb0a: hw/intc/ioapic: Update KVM routes before redelivering IRQ, on R=
TE update (David Woodhouse)
3b31669ea9: docs/devel: clarify further the semantics of RMW operations (Pa=
olo Bonzini)
ddc7cb30f8: Fix build without CONFIG_XEN_EMU (Miroslav Rezanina)
c3a2c84ae3: io/channel-tls: plug memory leakage on GSource (Matheus Tavares=
 Bernardino)
92f4a21d91: ps2: Don't send key release event for Lang1, Lang2 keys (Ross L=
agerwall)
ac19b51678: Add qemu qcode support for keys F13 to F24 (Willem van de Velde)

