Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7AC58A16B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 21:46:00 +0200 (CEST)
Received: from localhost ([::1]:43846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJgn9-00032j-4m
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 15:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oJgkS-0008PW-CF
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 15:43:12 -0400
Received: from mail-dm6nam10on20603.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::603]:43233
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oJgkP-00060p-5S
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 15:43:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENGBAVutAynWKKgF69niysfSDKw0ONJeaXiUn1st9apHrQ0dEIDctH3UfnM7toXnh88sBJuKP+aBIxmA4svwzqU/FDYxvISnjtMMkM/nUtBFSfKM1RGLZU6W7xUp/afO5SPUcDZx3ZVASb7tew0MzYgJt6dsYm5QqgXxBiPE3rOUS8ljwMYWYw5fNxpAYGKE9RBxKODSmpW6imel5a871fKOK5zm5llzIyvZSREYgjUR0NatdtvpJLAuEjCirGzJd2KIOkhLpMA2A6ti6FvjJShFL3+yyPprfVOFef1FZ5d8AE/aGl1rmtkgScw3aY7Oh5BRzh1lL4J6+2U6j5D4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5tbYPH2htJQ/Z/hKWtGgwmRHiXUD517q1Bb1KG/Pd4=;
 b=JHPsWg7/3ZbVxOmRi6ipyem9tgeXE0XTHLBm5F9etS3T7DvDyR5Hg87zu0OTTEdZ+g47t/OpDIDWayR3RZpxbV37Ldhh9TPvH7bvz1WI0fdUbQqPs3ZMFnIEVL5NInQWXBiSA2+Je5bi50159R16AsQ0zYYrCQ2GrS04y9GroN/F/neIQCCEYdEKDaSTMTFqB6SqJPE7vvlJlRQiFDL90iVqirBvAMCuFCBVpRduDMQvOiHFM7oDyo21uackR7A8fPCvxrhJlSNNSKvX+OMHjfIrsfWsasTxPOVLiVjIQA6Z6yPYrZ+h3eke8CQ7feAVOFwfEKSBbULs4eSqdU59ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5tbYPH2htJQ/Z/hKWtGgwmRHiXUD517q1Bb1KG/Pd4=;
 b=s6109OmXqlYcNnw6QfLIwNHarhmHa2rG5CVwEu81qPftuC0KIMQtNGIDDpvcmJpKVygHjOSq0LkHuaayec6WP3hy7JusewGxodkieTq982q1dM3l3xa5lP+1lHDdO4gu/fT32FZblSYUhkKKS6zA4OGOs8JNYN08j7LkoUhUPGQ=
Received: from DS7PR07CA0006.namprd07.prod.outlook.com (2603:10b6:5:3af::16)
 by PH0PR12MB5468.namprd12.prod.outlook.com (2603:10b6:510:ea::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 19:38:03 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::51) by DS7PR07CA0006.outlook.office365.com
 (2603:10b6:5:3af::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Thu, 4 Aug 2022 19:38:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Thu, 4 Aug 2022 19:38:02 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 4 Aug
 2022 14:38:01 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.1.0-rc1 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>
Date: Thu, 4 Aug 2022 14:37:47 -0500
Message-ID: <165964186725.37448.2007999876070172351@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c4fac24-2115-4054-648b-08da7650d865
X-MS-TrafficTypeDiagnostic: PH0PR12MB5468:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +R97/8ByQEYS0XZcdBsdQDc29TuxbSwe4y3w+2v/0QHhXMbPioHvyy2a6C9RQTEYY/Rzds4TZsg/AxnIfDxyGicOk1jHnTasmyKlcQat26qb3mRAGUYfukjmdrSpNZZ85KP+o21G1ReGOOjdIBS4GAMp3lTKgCE4U9omhHuZBgOreMQxJURQiRv3X67a8OfuMHo1aBSsKdnAMuTpQ3HAjMXzCK8HiDMZrDHo0WK70LezpyT2hd94TTNTzpvG7WdIvjGLd8a1ZsPUzGBuGK8I1TiyUlSj8Tq8Ak9pyIJflIV/86kVrogb3qxDP8wI5Eo5mSu03kY9fhCXMz+d6xkRW1CqOut8aN1YAFP3WS36ENM8uyePbciB+u0007FtT8hIUHjQneDgzs+eljqQpJ/NS+AbFqpsEZwZ8rp5QtyPF2E2n5T6zHxTQEIuwFwZRFqPJ8CPfCg/UYxcMuJD3a5acYgXdtGUS9TlpYl5A0p9oQA34eeyysmo/wZrpysTOsvNV4rUI2x9tr9Hu2SNLFq755nkVva6AI3MleJyTGeytqbPVvmk1ElWqv5/5+ZHgrQAsNxxqwcV0l/U4jJ5FlL/l1PAyBCPEA4BR9Vhy+Fv30bsDWhIXzWBjuORycPe0SXVEnOwF4Dyj0HPvyQNLfCPjySBxAwuAk1bppJ0Ie2wSnXjKWTWjqH7ME5rueitq7Cwa5i4G5SkR9vdGp+o8sFf+rryUf8OVtXrec+jGVEnOLW9aksMjqjKkwfYZConPy05l0RjfrzvNhn+KcQ96Gl/P2yJ3pKA30+j7n0KaWNe9QObODI2foMcStuOQYUf7hXMsq8s7jdNRiCdFyw28utr2pspClcqydCIJRyxIkWd7aLXEH8zwsnULLCDIAZjv278nRWTWpjE+FvmBWfU78Hi2w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966006)(40470700004)(36840700001)(478600001)(4326008)(966005)(36756003)(36860700001)(70206006)(70586007)(44832011)(8676002)(316002)(6916009)(8936002)(5660300002)(16526019)(2616005)(186003)(26005)(47076005)(426003)(2906002)(336012)(66574015)(41300700001)(6666004)(40480700001)(83380400001)(82310400005)(81166007)(86362001)(356005)(82740400003)(40460700003)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 19:38:02.5237 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4fac24-2115-4054-648b-08da7650d865
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5468
Received-SPF: softfail client-ip=2a01:111:f400:7e88::603;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
second release candidate for the QEMU 7.1 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.1.0-rc1.tar.xz
  http://download.qemu-project.org/qemu-7.1.0-rc1.tar.xz.sig

You can help improve the quality of the QEMU 7.1 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.1

Please add entries to the ChangeLog for the 7.1 release below:

  http://wiki.qemu.org/ChangeLog/7.1

Thank you to everyone involved!

Changes since rc0:

d2656dd577: Update version for v7.1.0-rc1 release (Richard Henderson)
d44971e725: target/mips: Advance pc after semihosting exception (Richard He=
nderson)
a21ba54dd5: virtiofsd: Disable killpriv_v2 by default (Vivek Goyal)
4bcb7de072: migration: Define BLK_MIG_BLOCK_SIZE as unsigned long long (Pet=
er Maydell)
ead34f64f9: migration: Assert that migrate_multifd_compression() returns an=
 in-range value (Peter Maydell)
777f53c759: Revert "migration: Simplify unqueue_page()" (Thomas Huth)
df67aa3e61: migration: add remaining params->has_* =3D true in migration_in=
stance_init() (Leonardo Bras)
21b1d97459: main loop: add missing documentation links to GS/IO macros (Ema=
nuele Giuseppe Esposito)
e13fe274bf: qemu-iotests: Discard stderr when probing devices (Cole Robinso=
n)
fd8a68ad68: hw/block/hd-geometry: Do not override specified bios-chs-trans =
(Lev Kujawski)
630179b7f7: libvduse: Pass positive value to strerror() (Xie Yongji)
d9cf16c0be: libvduse: Replace strcpy() with strncpy() (Xie Yongji)
e7156ff7cb: libvduse: Fix the incorrect function name (Xie Yongji)
77e3f038af: block/io_uring: add missing include file (Jinhao Fan)
1eaa63429a: linux-user/riscv: Align signal frame to 16 bytes (Richard Hende=
rson)
5265d24c98: target/arm: Move sve probe inside kvm >=3D 4.15 branch (Richard=
 Henderson)
b9e8d68a39: target/arm: Set KVM_ARM_VCPU_SVE while probing the host (Richar=
d Henderson)
0dd14e9555: target/arm: Use kvm_arm_sve_supported in kvm_arm_get_host_cpu_f=
eatures (Richard Henderson)
1bca64a3f0: tests/qtest/migration-test: Run the dirty ring tests only with =
the x86 target (Thomas Huth)
398c01da9c: aspeed/fby35: Fix owner of the BMC RAM memory region (C=C3=A9dr=
ic Le Goater)
3867c1c5fd: aspeed: Remove unused fields from AspeedMachineState (C=C3=A9dr=
ic Le Goater)
3fde641e72: ipmi:smbus: Add a check around a memcpy (Corey Minyard)
e2e137f642: hw/nvme: do not enable ioeventfd by default (Klaus Jensen)
04e8da8890: hw/nvme: unregister the event notifier handler on the main loop=
 (Klaus Jensen)
a2da737729: hw/nvme: skip queue processing if notifier is cleared (Klaus Je=
nsen)
a07d9df0fd: trivial: Fix duplicated words (Thomas Huth)
7a21bee2aa: misc: fix commonly doubled up words (Daniel P. Berrang=C3=A9)
ebf705541c: tests/unit/test-qga: Replace the word 'blacklist' in the guest =
agent unit test (Thomas Huth)
2649a72555: migration-test: Allow test to run without uffd (Peter Xu)
219044b8e6: migration-test: Use migrate_ensure_converge() for auto-converge=
 (Peter Xu)
b9e6074fc5: tests/tcg/linux-test: Fix random hangs in test_socket (Ilya Leo=
shkevich)
7eabb050ea: Hexagon (tests/tcg/hexagon) reference file for float_convd (Tay=
lor Simpson)
a1ad040dba: Hexagon (tests/tcg/hexagon) Fix alignment in load_unpack.c (Tay=
lor Simpson)
1e814a0dc4: Hexagon (target/hexagon) make VyV operands use a unique temp (T=
aylor Simpson)
74725231d6: hw/loongarch: Change macro name 'LS7A_XXX' to 'VIRT_XXX' (Xiaoj=
uan Yang)
587858ed0d: hw/loongarch: Rename file 'loongson3.XXX' to 'virt.XXX' (Xiaoju=
an Yang)
fc2cc19ffa: ci: Upgrade msys2 release to 20220603 (Yonggang Luo)
1235cf7d31: qemu-options: bring the kernel and image options together (Alex=
 Benn=C3=A9e)
28053143ab: docs/devel: fix description of OBJECT_DECLARE_SIMPLE_TYPE (Alex=
 Benn=C3=A9e)
503e549e44: tests/tcg/s390x: Test unaligned accesses to lowcore (Ilya Leosh=
kevich)
0882caf4d6: qapi: Add exit-failure PanicAction (Ilya Leoshkevich)
9b1268f55c: semihosting: Fix handling of buffer in TARGET_SYS_TMPNAM (Peter=
 Maydell)
fed49cdf6a: semihosting: Check for errors on SET_ARG() (Peter Maydell)
45704e8904: semihosting: Don't copy buffer after console_write() (Peter May=
dell)
aed04e6357: semihosting: Don't return negative values on qemu_semihosting_c=
onsole_write() failure (Peter Maydell)
93a02e822f: .gitlab-ci.d/windows.yml: Enable native Windows symlink (Bin Me=
ng)
6ad5208661: .cirrus.yml: Change winsymlinks to 'native' (Bin Meng)
ca58b4931e: gitlab: drop 'containers-layer2' stage (Daniel P. Berrang=C3=A9)
998f334722: gitlab: show testlog.txt contents when cirrus/custom-runner job=
s fail (Daniel P. Berrang=C3=A9)
feb6cb9369: tests: refresh to latest libvirt-ci module (Daniel P. Berrang=
=C3=A9)
ebc55f523c: configure: pass correct cflags to container-based cross compile=
rs (Paolo Bonzini)
47c182fe8b: kvm: don't use perror() without useful errno (Cornelia Huck)
705c881f7d: configure: Fix ppc container_cross_cc substitution (Richard Hen=
derson)
0c9717ff35: target/ppc: Implement new wait variants (Nicholas Piggin)
bb7e03cb56: stubs: update replay-tools to match replay.h types (Claudio Fon=
tana)
37e7b86766: vga: fix incorrect line height in 640x200x2 mode (Paolo Bonzini)
eda3f17bcd: hw/ppc/ppc440_uc: Initialize length passed to cpu_physical_memo=
ry_map() (Peter Maydell)
edccf661e6: hw/ppc: check if spapr_drc_index() returns NULL in spapr_nvdimm=
.c (Daniel Henrique Barboza)
d82b11f699: ui: dbus-display requires CONFIG_GBM (Paolo Bonzini)
54f2183630: hw/intc: sifive_plic: Fix multi-socket plic configuraiton (Atis=
h Patra)
44602af858: RISC-V: Allow both Zmmul and M (Palmer Dabbelt)
0c2cb3827e: iotests/131: Add parallels regression test (Hanna Reitz)
eba088f91d: block/parallels: Fix buffer-based write call (Hanna Reitz)

