Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8F4E4A67
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 02:16:45 +0100 (CET)
Received: from localhost ([::1]:54878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWpcC-00029I-Au
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 21:16:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1nWpab-0001Kz-Sy
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 21:15:06 -0400
Received: from [2a01:111:f400:7eab::604] (port=29270
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1nWpaV-0004SP-V3
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 21:15:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POcymoz560lVOMcsby8tAq1dhaBvjLSlRCQAYOsvkDXiqtq5NQzaaH5hI91lrnwqg9IMMXm4A856A7xx8XAHq55ZikN1DW2/eJRAU3P2YqUavGdrHxykmboaLi4SJGPGN3ZOClNNiUKZ1+f7QhaRrEdELh8ZWY6+EHZk3+NboxOrtIzc2Tt7Ve1yHImlfOjzj0+Uh49ubzoaa7up4grgoI3N+VRmMNgT38QygJHUXyZTJFwZlCHsF6bRp36QP1VIdMj4F3nLrFclLlrjb+Gh3YHDY/rpAO5idbsFxVyUo6dgsaP1RPz74iOYYnVCm7/ZPEadDGEwcfxgX4fBerW/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOl2nYJ/Hpj6fo5heQlul7qAsP7k08cLUbcAmW00cMA=;
 b=O2BoLG/Y/dRAdfmsoqCZbacGS41lKjPrbzn32uRmppn9RjlNuaWUYeIgdCjgoUOMTyJPVksLJoBtX1QNf7kUZikyrgDdDxglFuWL6L52fl/Qe+HlFAW6xZOHcNvWa3pxnYArPUFN7sDIwoFcWbp++X+JyRXIMeBD4G6LdtwcYgeob44XIZEhQFkndINe+5X30AH3/goyxigRgRhXYXnWAfIOTQw4xoCjcbqv+TIkg/7LlbqCFHFkPZ6r7YXJ2RchCveYAZcJHkm7oIt/vSYj2qPXPFQv+Lz1cwHkuEfBq0yY/y5iFFuzhxfLdvvJGXrX1S8zpDvEnG7G21q/oJyQag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOl2nYJ/Hpj6fo5heQlul7qAsP7k08cLUbcAmW00cMA=;
 b=mEPVWSiltV5MniVXP0nWT6tRk8AO8Q8MoIpWyZhJ1nF3cXQJqSZouvjXP58Hkz5UT8mlMlHcJMkOG+jM5tP0ZttFrbkL8ILTjBO6I6f8ueVbX6KMPaPc1Djcd6V0rUxIcC8OqpWKYBp+Rm6xiyWsECR6uBbbCqdjBr4D6w2UDtI=
Received: from BN7PR06CA0070.namprd06.prod.outlook.com (2603:10b6:408:34::47)
 by CH2PR12MB3735.namprd12.prod.outlook.com (2603:10b6:610:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 23 Mar
 2022 01:00:23 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::1e) by BN7PR06CA0070.outlook.office365.com
 (2603:10b6:408:34::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23 via Frontend
 Transport; Wed, 23 Mar 2022 01:00:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Wed, 23 Mar 2022 01:00:23 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 22 Mar
 2022 20:00:22 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.0.0-rc1 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
Date: Tue, 22 Mar 2022 20:00:08 -0500
Message-ID: <164799720867.410785.2028661290678230885@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fbafef2-bc79-422c-32f4-08da0c6882da
X-MS-TrafficTypeDiagnostic: CH2PR12MB3735:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3735BDBE6BDE5C7CC7E2338F95189@CH2PR12MB3735.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KyuvvhAUVftzJ/ziIInsh8nCCAl0zBGX5JtT+53+6xMOwlaqRiSktRCfKCdTSjYQwYJq4Ll0gK+dcYJ2IJVSns3/rY0SAcSanV9FhhXPQ91qpDbthGoVIxwIoDu/gDPMus/aCRIHAD41ZRMfU+wx2t6n3IYIyyC/Yf0GvE2Krv0wl4H4QrqLfrkRthhZzY46oMsD017XuhT51UAEE12xPHdJWkbrs+KtdB63idabOD7rjqpwRvzbclfH/nr9sWjZIXNDDjCmIe4WjMNrbYC379b5EI4a6FZQLbEKlgvkNmY8A9EgcxVstrWge6k2LJ9JAWbL6yBykfeKafF/ixPQZtfiArlktREqft/cTMmEzKuWY4S7iJ4XL3E/sC5jp+mOGj/yKsw6JprFzSmfkqg9EhsXKPjXDrcq4EyjE+2f262jE4oarD6iakbJrNXjmiz/ZQMS9aT8dRDC6bBp5XldEjpugb8+YGOcUBIhGx3acYmQg6LRF3rfLXZ5hKLKp/72MPjYkDae7sIklpsxjcvm0m6k3LWEDE5UbR2LQaz09WD7tdwVSOLggAD4RrFshvlVmAuarytcwSqaIpK6XFdVAJKqv4HYpnnTRM6Rm2SgDvAKq8K3GUtfF+7e6eMDlwpw572OuRPZGj99CyJtxmOpV+ZR+DAYqPw0XM9zC8op6nbblYhrfo9DacX1EgMQuWdLJUmZ7W5lsIIl7J4o7uU4zDI24Nqe2/PerfFOEZd6OoQVZahALPWXaYiWQud3w5H/0myw1bXAkSXmu/ZORbpf/H55of9BlVxVT1aFy6P9OdC0COeVfuwZIAJkccLIqBWGRMwFr3kyvYdIoH3MsOAGAw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(40460700003)(47076005)(26005)(36860700001)(2616005)(30864003)(44832011)(16526019)(316002)(66574015)(508600001)(83380400001)(6916009)(4326008)(82310400004)(81166007)(84970400001)(2906002)(966005)(86362001)(8676002)(70586007)(70206006)(356005)(36756003)(6666004)(336012)(186003)(5660300002)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 01:00:23.7191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbafef2-bc79-422c-32f4-08da0c6882da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3735
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7eab::604
 (failed)
Received-SPF: softfail client-ip=2a01:111:f400:7eab::604;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
second release candidate for the QEMU 7.0 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.0.0-rc1.tar.xz
  http://download.qemu-project.org/qemu-7.0.0-rc1.tar.xz.sig

You can help improve the quality of the QEMU 7.0 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.0

Please add entries to the ChangeLog for the 7.0 release below:

  http://wiki.qemu.org/ChangeLog/7.0

Thank you to everyone involved!

Changes since rc0:

15ef89d2a1: Update version for v7.0.0-rc1 release (Peter Maydell)
b7a3a705b6: Merge tag 'pull-request-2022-03-21' of https://gitlab.com/thuth=
/qemu into staging (Peter Maydell)
04ddcda6a2: Merge tag 'fixes-pull-request' of gitlab.com:marcandre.lureau/q=
emu into staging (Peter Maydell)
309df6acb2: gitlab: disable accelerated zlib for s390x (Alex Benn=C3=A9e)
9d36d5f7e0: Merge tag 'pull-block-2022-03-22' of https://gitlab.com/hreitz/=
qemu into staging (Peter Maydell)
4ea4bec6f4: qapi: remove needless include (Marc-Andr=C3=A9 Lureau)
e0e7fe07e1: Remove trailing ; after G_DEFINE_AUTO macro (Marc-Andr=C3=A9 Lu=
reau)
389834ee65: tests: remove needless include (Marc-Andr=C3=A9 Lureau)
336d354ba7: error: use GLib to remember the program name (Marc-Andr=C3=A9 L=
ureau)
45297887dc: qga: remove bswap.h include (Marc-Andr=C3=A9 Lureau)
b331307046: qapi: remove needless include (Marc-Andr=C3=A9 Lureau)
d2958fb0b6: meson: fix CONFIG_ATOMIC128 check (Marc-Andr=C3=A9 Lureau)
848126d11e: meson: move int128 checks from configure (Marc-Andr=C3=A9 Lurea=
u)
0e8d95e27b: qapi: remove needless include (Marc-Andr=C3=A9 Lureau)
8a166615a4: util: remove the net/net.h dependency (Marc-Andr=C3=A9 Lureau)
5933dd9576: util: remove needless includes (Marc-Andr=C3=A9 Lureau)
06cef3bc59: scripts/modinfo-collect: remove unused/dead code (Marc-Andr=C3=
=A9 Lureau)
519655970e: Move HOST_LONG_BITS to compiler.h (Marc-Andr=C3=A9 Lureau)
77a19c6aa4: Simplify HOST_LONG_BITS (Marc-Andr=C3=A9 Lureau)
887ce500ef: compiler.h: replace QEMU_SENTINEL with G_GNUC_NULL_TERMINATED (=
Marc-Andr=C3=A9 Lureau)
c08401793a: compiler.h: replace QEMU_WARN_UNUSED_RESULT with G_GNUC_WARN_UN=
USED_RESULT (Marc-Andr=C3=A9 Lureau)
9edc6313da: Replace GCC_FMT_ATTR with G_GNUC_PRINTF (Marc-Andr=C3=A9 Lureau)
e7b7942822: Drop qemu_foo() socket API wrapper (Marc-Andr=C3=A9 Lureau)
8ef2513d87: m68k/nios2-semi: fix gettimeofday() result check (Marc-Andr=C3=
=A9 Lureau)
3d76c3b6d8: vl: typo fix in a comment (Marc-Andr=C3=A9 Lureau)
5324e3e958: qemu-options: define -spice only #ifdef CONFIG_SPICE (Marc-Andr=
=C3=A9 Lureau)
5791de9d48: Merge tag 'pull-nbd-2022-03-21' of https://repo.or.cz/qemu/eric=
b into staging (Peter Maydell)
48f1fcd5c8: iotests/207: Filter host fingerprint (Hanna Reitz)
da9d88d8e6: iotests.py: Filters for VM.run_job() (Hanna Reitz)
8f685ac391: iotests: make qemu_img_log and img_info_log raise on error (Joh=
n Snow)
f400e14da0: iotests: remove qemu_img_pipe_and_status() (John Snow)
3c8b7358d6: iotests: replace qemu_img_log('create', ...) calls (John Snow)
97576f8c0a: iotests: use qemu_img() in has_working_luks() (John Snow)
4cf661f2c0: iotests: remove remaining calls to qemu_img_pipe() (John Snow)
88baae552d: iotests/149: Remove qemu_img_pipe() call (John Snow)
3d53818ff7: iotests: replace unchecked calls to qemu_img_pipe() (John Snow)
78d0476129: iotests: change supports_quorum to use qemu_img (John Snow)
1670ae7af6: iotests: add qemu_img_map() function (John Snow)
ac5bb4861c: iotests/remove-bitmap-from-backing: use qemu_img_info() (John S=
now)
9ebb2b765b: iotests: add qemu_img_info() (John Snow)
0f7d7d72aa: iotests: use qemu_img_json() when applicable (John Snow)
29768d04af: iotests: add qemu_img_json() (John Snow)
569131d585: iotests: fortify compare_images() against crashes (John Snow)
2882ccf86a: iotests: make qemu_img raise on non-zero rc by default (John Sn=
ow)
fc272d3ce0: iotests: Remove explicit checks for qemu_img() =3D=3D 0 (John S=
now)
062fd1dad2: python/utils: add VerboseProcessError (John Snow)
be73231ba8: python/utils: add add_visual_margin() text decoration utility (=
John Snow)
e48093a6c0: tests/qemu-iotests/testrunner: Supply a test plan in TAP mode (=
Thomas Huth)
e287072b40: tests: Do not treat the iotests as separate meson test target a=
nymore (Thomas Huth)
ab101297cb: tests/qemu-iotests: Use GNU sed in two more spots where it is n=
ecessary (Thomas Huth)
cc5387a544: block/rbd: fix write zeroes with growing images (Stefano Garzar=
ella)
3213bbaf57: tests: add (riscv virt) machine mapping to testenv (laokz)
48fb0a826e: Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu int=
o staging (Peter Maydell)
6690302b84: block/nbd.c: Fixed IO request coroutine not being wakeup when k=
ill NBD server (Rao Lei)
a2c2d44ae1: docs: Consistent typography for options of qemu-nbd (Eric Blake)
80f00ca280: MAINTAINERS: change Vladimir's email address (Vladimir Sementso=
v-Ogievskiy)
330724977b: Merge tag 'pull-misc-2022-03-21' of git://repo.or.cz/qemu/armbr=
u into staging (Peter Maydell)
2028ab513b: Merge tag 'block-pull-request' of https://gitlab.com/stefanha/q=
emu into staging (Peter Maydell)
17e6ffa6a5: hw/i386/amd_iommu: Fix maybe-uninitialized error with GCC 12 (P=
aolo Bonzini)
b21e238037: Use g_new() & friends where that makes obvious sense (Markus Ar=
mbruster)
1366244ab6: 9pfs: Use g_new() & friends where that makes obvious sense (Mar=
kus Armbruster)
15ba4a9f7b: scripts/coccinelle: New use-g_new-etc.cocci (Markus Armbruster)
79854b9544: block-qdict: Fix -Werror=3Dmaybe-uninitialized build failure (M=
urilo Opsfelder Araujo)
27801168ec: tests/qtest/fuzz-sdcard-test: Add reproducer for OSS-Fuzz (Issu=
e 29225) (Philippe Mathieu-Daud=C3=A9)
ecf1bbe322: Merge tag 'pull-ppc-20220321' of https://github.com/legoater/qe=
mu into staging (Peter Maydell)
799f7f0104: hw/sd/sdhci: Prohibit DMA accesses to devices (Philippe Mathieu=
-Daud=C3=A9)
78e619cbd5: hw/sd/sdhci: Honor failed DMA transactions (Philippe Mathieu-Da=
ud=C3=A9)
19a5452723: tests/qtest/intel-hda-test: Add reproducer for issue #542 (Phil=
ippe Mathieu-Daud=C3=A9)
79fa99831d: hw/audio/intel-hda: Restrict DMA engine to memories (not MMIO d=
evices) (Philippe Mathieu-Daud=C3=A9)
be5a8cf347: hw/audio/intel-hda: Do not ignore DMA overrun errors (Philippe =
Mathieu-Daud=C3=A9)
3ab6fdc91b: softmmu/physmem: Introduce MemTxAttrs::memory field and MEMTX_A=
CCESS_ERROR (Philippe Mathieu-Daud=C3=A9)
58e74682ba: softmmu/physmem: Simplify flatview_write and address_space_acce=
ss_valid (Philippe Mathieu-Daud=C3=A9)
3515553bf6: target/ppc: Replicate Double->Single-Precision result (Lucas Co=
utinho)
217979d33e: target/ppc: Replicate double->int32 result for some vector insn=
s (Richard Henderson)
9d1401b794: ppc64: Avoid pt_regs struct definition (Khem Raj)
3ec5ad4008: target/i386: kvm: do not access uninitialized variable on older=
 kernels (Paolo Bonzini)
2058fdbe81: Merge tag 'fixes-20220318-pull-request' of git://git.kraxel.org=
/qemu into staging (Peter Maydell)
c9020c8e6c: Merge tag 'trivial-branch-for-7.0-pull-request' of https://gitl=
ab.com/laurent_vivier/qemu into staging (Peter Maydell)
a09863610a: Merge tag 'pull-target-arm-20220318' of https://git.linaro.org/=
people/pmaydell/qemu-arm into staging (Peter Maydell)
a2d860bb54: virtio/virtio-balloon: Prefer Object* over void* parameter (Ber=
nhard Beschow)
d1e9e64629: hw/pci/pci.c: Fix typos of "Firewire", and of "controller" on s=
ame line (Rebecca Cran)
79d54c9eac: util/osdep: Remove some early cruft (Andrew Deason)
9c2d83f5a0: hw/i386/acpi-build: Avoid 'sun' identifier (Andrew Deason)
8900c204df: util/osdep: Avoid madvise proto on modern Solaris (Andrew Deaso=
n)
eb7a38ba66: hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control (Edgar E. Ig=
lesias)
b4ecda2dd7: hw/misc: Add a model of the Xilinx ZynqMP APU Control (Edgar E.=
 Iglesias)
63320bcaed: hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF (Edgar E. Iglesias)
152f0bf0c9: hw/misc: Add a model of the Xilinx ZynqMP CRF (Edgar E. Iglesia=
s)
4a7319b750: target/arm: Make rvbar settable after realize (Edgar E. Iglesia=
s)
c28d4b8656: hw/arm/xlnx-zynqmp: Add an unimplemented SERDES area (Edgar E. =
Iglesias)
654abaa783: target/arm: Log fault address for M-profile faults (Peter Mayde=
ll)
8cc2246caa: target/arm: Log M-profile vector table accesses (Peter Maydell)
299b4a3ecf: hw/arm/virt: Fix gic-version=3Dmax when CONFIG_ARM_GICV3_TCG is=
 unset (Eric Auger)
16d91e06b3: hw/intc: Rename CONFIG_ARM_GIC_TCG into CONFIG_ARM_GICV3_TCG (E=
ric Auger)
c08796378d: nsis installer: Fix mouse-over descriptions for emulators (Pete=
r Maydell)
6b98e86e87: nsis installer: Suppress "ANSI targets are deprecated" warning =
(Peter Maydell)
e422d92a23: nsis installer: List emulators in alphabetical order (Peter May=
dell)
75f7ba165c: hw/misc/npcm7xx_clk: Don't leak string in npcm7xx_clk_sel_init(=
) (Peter Maydell)
9a09273f33: hw/dma/xlnx_csu_dma: Set TYPE_XLNX_CSU_DMA class_size (Peter Ma=
ydell)
39a1fd2528: target/arm: Fix handling of LPAE block descriptors (Peter Mayde=
ll)
c179d3be7b: target/arm: Fix pauth_check_trap vs SEL2 (Richard Henderson)
b17ab4705c: target/arm: Fix sve2 ldnt1 and stnt1 (Richard Henderson)
9eb840a209: hw/display/vga: Report a proper error when adding a 2nd ISA VGA=
 (Thomas Huth)
6832deb8ff: hw/display: Allow vga_common_init() to return errors (Thomas Hu=
th)
5f2011be44: hw/display/cirrus_vga: Clean up indentation in pci_cirrus_vga_r=
ealize() (Thomas Huth)
832061a2fa: audio/mixeng: Do not declare unused variables (Akihiko Odaki)
6c08964b41: ui: avoid unnecessary memory operations in vnc_refresh_server_s=
urface() (Wen, Jianxian)
2297db8228: ui/gtk: Ignore 2- and 3-button press events (K. Lange)
fc8796465c: aio-posix: fix spurious ->poll_ready() callbacks in main loop (=
Stefan Hajnoczi)
8a947c7a58: aio-posix: fix build failure io_uring 2.2 (Haiyue Wang)
1d60bb4b14: Merge tag 'pull-request-2022-03-15v2' of https://gitlab.com/thu=
th/qemu into staging (Peter Maydell)
377bf6f37d: softmmu: List CPU types again (Philippe Mathieu-Daud=C3=A9)
46697cb96e: accel/tcg: Fix cpu_ldq_be_mmu typo (Richard Henderson)
5e2d19b3cd: tests/avocado: start PhoneServer upfront (Beraldo Leal)
c587bddb53: tests/tcg/s390x: Test BRASL and BRCL with large negative offset=
s (Ilya Leoshkevich)
16ed5f1421: s390x/tcg: Fix BRCL with a large negative offset (Ilya Leoshkev=
ich)
fc3dd86a29: s390x/tcg: Fix BRASL with a large negative offset (Ilya Leoshke=
vich)
d0a17829d0: tests/tcg: drop -cpu max from s390x sha512-mvx invocation (Alex=
 Benn=C3=A9e)

