Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E322AE4A3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 01:07:26 +0100 (CET)
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcdfZ-0008Cp-0k
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 19:07:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kcdeA-0007ki-JI
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 19:05:58 -0500
Received: from mail-bn7nam10on2040.outbound.protection.outlook.com
 ([40.107.92.40]:23744 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kcde5-0000ek-UO
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 19:05:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XU5wzF4PYxU86ObEVasDiReNHKKylBiPDB52pJ2ey4ENy2bA+oEdJjaW8sslGKSJtbmprFwPeUylNnY98qUPdJdNeoR2eb6lB4yBTJbTKDWJEFuNzrox3xW2qaADTVnBGfIgOUPvkRBtyF9z19pZCFO7+2RiskSB3UaW9PfaPRvPiaciymNJKvFTxrcSBsAYlgjDwRk0gn5AmJbVcd5w51rfY2C8V0Uc1uBXKldihInQq3RcYyW4OcMm+iXs8ur6l8FaXZhxiPVJw/K53386Tq8SbPMGXwgPby+Lv5A3zFlX/akssww9hEn0QgFxc0UORCEgoDBLBBHeiAQsura3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWqrk4uMrsVBNXeZlxybSc8IQPP2CE/sOOHu/Y9VvjI=;
 b=hSbyJgYQRaA6+kXJqZmr8TaaAtKXFFwhBzlLpTvPKBFxPXVhBoomY30bNYahAINMsQ2Tyn3kPnciZoE13AZlNgbcxUR6MZWaRh2SaH/r1x+jYdDs3/AQcY9m/CAHBaKDkCS1E+xf/zjp/j9Tu8tcfwqjrD4ePto84mIhFWIOJtpMItU9RYWP4GxsOGXmjDNUcSyCH00K8KlPc4z4wnrRrNeEfC55QCvWzVDm4wFtG1KELoMxfnp3L75ISBK9S5B2VAd+sLIO4OSGjCXxZC53fHg0aq/5KcNAfDlIoZ9d9zuq3tfHXfaU1udEA8KYOHZbQWCi7gtqLMJkQZ5gBfW4+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWqrk4uMrsVBNXeZlxybSc8IQPP2CE/sOOHu/Y9VvjI=;
 b=vA+ZIbkmrLrJdsf0+orZEjS4BEJia+4s4y155d2UKUG59/jNzfXk8+YZEcJIX4Hx2FLjdQjKdGueiJcZVV7oockwD0hI0W+gljCokvzzxrAGdAOkeoRKGNuTCR6mbUBrLGkJ2L8KVjtnfv/R68qf28BhKHxE9yw2jouwjovEgxY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3800.namprd12.prod.outlook.com (2603:10b6:610:2d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 10 Nov
 2020 23:50:47 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::f428:769b:3e9:8300]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::f428:769b:3e9:8300%5]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 23:50:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 5.2.0-rc1 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Nov 2020 17:50:38 -0600
Message-ID: <160505223850.287725.18419191934984716963@vm0>
User-Agent: alot/0.9
X-Originating-IP: [165.204.77.11]
X-ClientProxiedBy: SN6PR2101CA0027.namprd21.prod.outlook.com
 (2603:10b6:805:106::37) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SN6PR2101CA0027.namprd21.prod.outlook.com (2603:10b6:805:106::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.9 via Frontend
 Transport; Tue, 10 Nov 2020 23:50:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1eb789a6-d883-4c53-7680-08d885d37231
X-MS-TrafficTypeDiagnostic: CH2PR12MB3800:
X-Microsoft-Antispam-PRVS: <CH2PR12MB380064BACEF36AC863F8AC0A95E90@CH2PR12MB3800.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wV1azt1bMqMF5DfoHlzyaZbUMVBW+Tz8lc+JG8lazAdrmCGMnp9osFH7dh+itjYEEfi88jm+8sING36Fo6aVumbxWQnn++8GuGqiFlhWWZem/f4gWzTRSYYLc4rxnN9f88kMWW/tKXfZ99/FKdqoy0VLV1OXoqodJ6lI8zagfppgLZbL+Ifl24WOOLfbxwB0H1ZFF8KPEXXxXG45fmfnEsi9QhYBqpVVO0193/BVHo0TAKjMwqGucUTagt2GUEVh8fHfRYS7Jc0TGPxJudt14czt1SIo7lk4y5OIRDxCrWEsJb5egOFWBK049GyNdJ+zqZlX5HdQBt7vCPJSSkc/+loxen9EPryVBYaA+yp9zDiRjLSGm7qEWJHhjD9LpN1Hd/slSs/O/gH3zMwwwJCsMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(346002)(376002)(39850400004)(136003)(396003)(366004)(6486002)(33716001)(6916009)(316002)(4326008)(478600001)(9686003)(956004)(86362001)(8676002)(44832011)(966005)(5660300002)(6496006)(66556008)(66476007)(2906002)(26005)(6666004)(52116002)(66946007)(66574015)(16526019)(83380400001)(186003)(30864003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 164XM7IZp/0cDsbogI5lrTXN4O5MdauJWRAp1wGRUr2b1XGcaDM0GyqSh4/zchc782fpnjzeVP0U1Td3FN/058SwTWn5ARlM49POGMvhEVE2VNI4LGU8GFDvgJF722P5e9IJoTWQpfAULkyuYcTsSiYQ8mvCqw0yKC2hSndQEGKhkt/jRaQr/pWcUJxzCKPtfRyQpYBvQKQXwE65vyc2uNFpJBF1DbeE536I3O4Ozuy86HzbvDK30OwzwppO6+8JBQOYi4JxaZmfBkL4wIg/7ZZWYbC+/N2EiX8eaEkG2p0SWCmilgkyC/XDLRlowoeBtQ0rC/TWJ2uv6Q5X+ug5U+a9WEy5fMfbCP91n0mhFONSZCrqm1uoPJM+8Zv3tanVVZAhYKMntg+lz3RWLVSyX8biZ6dciJb/hO6KQIhjVdKWNUokBlbrjvRP2uXWbu8bYCwkLDuRKe3QTtwrl8oFOoLeP2b01UoyFRv0Ab6OJ+l42CLET1hLyfAOehiO36sBTrVN+PLKOhLQA8lq3xohCqJDlXe5obfnUDN0Q+/dEgq4byQ7bagN1ianSHH2sNkuna6xd9AUTfU1A11PNjvNHtxeYlkAtSeW2p5euT1dtp/tl7fOTxgaeVJZH0FzoWfE4e1PtyqRBjurQ8Fceqnb6/PBb1IU0f1IzYvKZcgKTOmU7xofqEjOxnWrrapVd7liTpHbmrufTVAn5PmaWpD8XCxhvNLIeT19vsNM24sjUCk6+q6/+2LZ6t8zlZy0/Od1kGUPzPPRulqj/mb7Z5jGUx/t7hvUBD42e5L+S9CsUt9LGIJ0jQVayTM9VicyqSR2piLhx0epBDRTk0KFhTNMQXLfy/XD7Yar9g12POxUd84gSU5Gq4xSqJKB1XWhmS1KSROjlzRJ20oV//+jrpVFtw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb789a6-d883-4c53-7680-08d885d37231
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 23:50:47.6300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrxwtsO0T2O8kMZnxaAc8DlKYs4NpD2boZiL54IFQWHZF8sntW7qGz0XqBCxOGkFaSfHAdmWmUF3sgkXkMLK5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3800
Received-SPF: none client-ip=40.107.92.40; envelope-from=Michael.Roth@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 19:05:50
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FORGED_SPF_HELO=1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
second release candidate for the QEMU 5.2 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-5.2.0-rc1.tar.xz
  http://download.qemu-project.org/qemu-5.2.0-rc1.tar.xz.sig

You can help improve the quality of the QEMU 5.2 release by testing this
release and reporting bugs on Launchpad:

  https://bugs.launchpad.net/qemu/

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/5.2

Please add entries to the ChangeLog for the 5.2 release below:

  http://wiki.qemu.org/ChangeLog/5.2

Thank you to everyone involved!

Changes since rc0:

c6f28ed507: Update version for v5.2.0-rc1 release (Peter Maydell)
b6c56c8a9a: target/arm/translate-neon.c: Handle VTBL UNDEF case before VFP =
access check (Peter Maydell)
8006c9842b: tests/qtest/npcm7xx_rng-test: count runs properly (Havard Skinn=
emoen)
0e5dc77573: hw/arm/nseries: Check return value from load_image_targphys() (=
Peter Maydell)
44cbf34975: hw/arm/musicpal: Only use qdev_get_gpio_in() when necessary (Ph=
ilippe Mathieu-Daud=C3=A9)
498661dd22: hw/arm/musicpal: Don't connect two qemu_irqs directly to the sa=
me input (Philippe Mathieu-Daud=C3=A9)
bdad3654d3: hw/arm/nseries: Remove invalid/unnecessary n8x0_uart_setup() (P=
hilippe Mathieu-Daud=C3=A9)
2108e5092a: hw/misc/stm32f2xx_syscfg: Remove extraneous IRQ (Philippe Mathi=
eu-Daud=C3=A9)
509602eed4: hw/arm/armsse: Correct expansion MPC interrupt lines (Philippe =
Mathieu-Daud=C3=A9)
604cef3e57: target/arm: Fix neon VTBL/VTBX for len > 1 (Richard Henderson)
bec3c97e0c: hw/arm/virt: Remove dependency on Cortex-A15 MPCore peripherals=
 (Philippe Mathieu-Daud=C3=A9)
0339c2a86f: docs: add some notes on the sbsa-ref machine (Alex Benn=C3=A9e)
7f350a87e3: target/arm: add space before the open parenthesis '(' (Xinhao Z=
hang)
6eb55edbab: target/arm: Don't use '#' flag of printf format (Xinhao Zhang)
bdc3b6f570: target/arm: add spaces around operator (Xinhao Zhang)
9df0a97298: ssi: Fix bad printf format specifiers (AlexChen)
9ad5f6b05f: hw/arm/Kconfig: ARM_V7M depends on PTIMER (Andrew Jones)
a58cabd0e3: s390x: Avoid variable size warning in ipl.h (Daniele Buono)
074df27f74: s390x: fix clang 11 warnings in cpu_models.c (Daniele Buono)
ad57e2b1f5: qtest: Update references to parse_escape() in comments (Peter M=
aydell)
d4e279141b: fuzz: add virtio-blk fuzz target (Dima Stepanov)
704a256da8: docs: add "page source" link to sphinx documentation (Daniel P.=
 Berrang=C3=A9)
d0f26e68a0: gitlab: force enable docs build in Fedora, Ubuntu, Debian (Dani=
el P. Berrang=C3=A9)
4daa9055be: gitlab: publish the docs built during CI (Daniel P. Berrang=C3=
=A9)
2deca810d8: configure: surface deprecated targets in the help output (Alex =
Benn=C3=A9e)
aba378dee6: fuzz: Make fork_fuzz.ld compatible with LLVM's LLD (Daniele Buo=
no)
bb451d2487: scripts/oss-fuzz: give all fuzzers -target names (Alexander Bul=
ekov)
e6a3e1322b: docs/fuzz: update fuzzing documentation post-meson (Alexander B=
ulekov)
f3a0208f24: docs/fuzz: rST-ify the fuzzing documentation (Alexander Bulekov=
)
3758e88bb8: MAINTAINERS: Add gitlab-pipeline-status script to GitLab CI sec=
tion (Philippe Mathieu-Daud=C3=A9)
c3ab5df2f5: linux-user/sparc: Don't zero high half of PC, NPC, PSR in sigre=
turn (Peter Maydell)
266b41582e: linux-user/sparc: Correct set/get_context handling of fp and i7=
 (Peter Maydell)
b8ae597f0e: linux-user/sparc: Fix errors in target_ucontext structures (Pet=
er Maydell)
96338fefc1: hw/intc/ibex_plic: Clear the claim register when read (Alistair=
 Francis)
7687537ab0: target/riscv: Split the Hypervisor execute load helpers (Alista=
ir Francis)
743077b35b: target/riscv: Remove the hyp load and store functions (Alistair=
 Francis)
1c1c060aa8: target/riscv: Remove the HS_TWO_STAGE flag (Alistair Francis)
3e5979046f: target/riscv: Set the virtualised MMU mode when doing hyp acces=
ses (Alistair Francis)
c445593d30: target/riscv: Add a virtualised MMU Mode (Alistair Francis)
b1b9ab1c04: qga: fix missing closedir() in qmp_guest_get_disks() (Michael R=
oth)
d669ed6ab0: block: make bdrv_drop_intermediate() less wrong (Vladimir Semen=
tsov-Ogievskiy)
313274bbd4: block: add bdrv_replace_node_common() (Vladimir Sementsov-Ogiev=
skiy)
6c5f7b3a10: block: add forgotten bdrv_abort_perm_update() to bdrv_co_invali=
date_cache() (Vladimir Sementsov-Ogievskiy)
5f14f31d2b: block: Fix some code style problems, "foo* bar" should be "foo =
*bar" (shiliyang)
7433a6860b: gitlab-ci: Drop generic cache rule (Philippe Mathieu-Daud=C3=A9=
)
dccaea2514: tests/qtest/tpm: Remove redundant check in the tpm_test_swtpm_t=
est() (AlexChen)
3dc057923d: qtest: Fix bad printf format specifiers (AlexChen)
8a47836548: device-crash-test: Check if path is actually an executable file=
 (Eduardo Habkost)
45716765b1: tests/vm: update openbsd to release 6.8 (Brad Smith)
a3f6be81aa: meson: always include contrib/libvhost-user (Stefan Hajnoczi)
122860bae7: block: Fix integer promotion error in bdrv_getlength() (Eric Bl=
ake)
7c5c538306: block: enable libnfs on msys2/mingw in cirrus.yml (Yonggang Luo=
)
c63b0201ae: block: Fixes nfs compiling error on msys2/mingw (Yonggang Luo)
c6ac463631: iotests: rewrite iotest 240 in python (Maxim Levitsky)
2daba44205: iotests: add filter_qmp_virtio_scsi function (Maxim Levitsky)
73ad0ff216: hw/block/nvme: fix free of array-typed value (Klaus Jensen)
bf288953f1: hw/block/nvme: fix uint16_t use of uint32_t sgls member (Klaus =
Jensen)
8ce648056f: hw/block/nvme: fix null ns in register namespace (Klaus Jensen)
3441ad4bc4: qcow2: Document and enforce the QCowL2Meta invariants (Alberto =
Garcia)
009cde17a5: block: Move bdrv_drain_all_end_quiesce() to block_int.h (Greg K=
urz)
3d86af858e: block: Remove unused include (AlexChen)
143d51e179: block: Remove unused BlockDeviceMapEntry (Markus Armbruster)
ffb515fa50: qapi/block-core: Improve MapEntry documentation (Max Reitz)
a1d12a2148: qapi: Fix missing headers in QMP Reference Manual (Markus Armbr=
uster)
92a3c6aac8: MAINTAINERS: Add QAPI schema modules to their subsystems (Marku=
s Armbruster)
c4cdf54cff: docs/devel/qapi-code-gen: Fix up examples (Markus Armbruster)
60f6de8fba: hw/rx/rx-gdbsim: Fix memory leak (CID 1432307) (Philippe Mathie=
u-Daud=C3=A9)
f166061c73: MAINTAINERS: Demote Renesas target & hardware to 'Odd Fixes' (P=
hilippe Mathieu-Daud=C3=A9)
bf4ee88ab6: hw/mips/boston: Fix memory leak in boston_fdt_filter() error-ha=
ndling paths (Peter Maydell)
d40b55bc1b: target/mips: Fix PageMask with variable page size (Jiaxun Yang)
a60442eb8d: target/mips: Deprecate nanoMIPS ISA (Philippe Mathieu-Daud=C3=
=A9)
e6b99460b1: hw/9pfs: Fix Kconfig dependency problem between 9pfs and Xen (P=
hilippe Mathieu-Daud=C3=A9)
22e1367587: hw/9pfs : add space before the open parenthesis '(' (Xinhao Zha=
ng)
487729e9f6: hw/9pfs : open brace '{' following struct go on the same line (=
Xinhao Zhang)
01011733ea: hw/9pfs : add spaces around operator (Xinhao Zhang)
77280d33bc: s390x: fix build for --without-default-devices (Cornelia Huck)
5e49e89cb6: target/s390x: fix execution with icount (Pavel Dovgalyuk)
f29b959dc6: spapr: Convert hpt_prepare_thread() to use qemu_try_memalign() =
(Greg Kurz)
184b813e7b: spapr: Drop dead code in spapr_reallocate_hpt() (Greg Kurz)
295397f53c: target/ppc/excp_helper: Add a fallthrough for fix compiler warn=
ing (Chen Qun)
022625a8ad: linux-user: Check copy_from_user() return value in vma_dump_siz=
e() (Peter Maydell)
e4ce178b61: linux-user/syscall: Fix missing target_to_host_timespec64() che=
ck (Alistair Francis)
36d2dbc72d: linux-user: Use "!=3D 0" when checking if MAP_FIXED_NOREPLACE i=
s non-zero (Peter Maydell)
81966c1801: linux-user/mips/cpu_loop: silence the compiler warnings (Chen Q=
un)
c56caea3b2: tcg: Revert "tcg/optimize: Flush data at labels not TCG_OPF_BB_=
END" (Richard Henderson)
f14bed3fd4: tcg: Remove assert from set_jmp_reset_offset (Richard Henderson=
)
372bcb2585: qapi, qemu-options: make all parsing visitors parse boolean opt=
ions the same (Paolo Bonzini)
e27bd49876: qtest: escape device name in device-introspect-test (Paolo Bonz=
ini)
794b95608f: ivshmem-test: do not use short-form boolean option (Paolo Bonzi=
ni)
5e592947de: pc-bios/s390: update s390-ccw bios binaries (Cornelia Huck)
872882e771: s390-bios: Skip writing iplb location to low core for ccw ipl (=
Jason J. Herne)
577b808b09: roms/Makefile: Add qboot to .PHONY list (Bruce Rogers)
ca1f9cbfdc: ati: check x y display parameter values (Prasad J Pandit)
2ddafce7f7: vnc: fix resource leak when websocket channel error (Ding Hui)
0d9b90ce5c: console: make QMP/HMP screendump run in coroutine (Marc-Andr=C3=
=A9 Lureau)
d00ec2fe86: console: modify ppm_save to take a pixman image ref (Marc-Andr=
=C3=A9 Lureau)
e18d9a9687: coroutine: let CoQueue wake up outside a coroutine (Marc-Andr=
=C3=A9 Lureau)
963a7bed57: dev-serial: store flow control and xon/xoff characters (Mark Ca=
ve-Ayland)
a79f86cdbe: dev-serial: add support for setting data_bits in QEMUSerialSetP=
arams (Mark Cave-Ayland)
66007a9567: dev-serial: add always-plugged property to ensure USB device is=
 always attached (Mark Cave-Ayland)
687dfe63e3: dev-serial: replace DeviceOutVendor/DeviceInVendor with equival=
ent macros from usb.h (Mark Cave-Ayland)
655ec806c8: dev-serial: add trace-events for baud rate and data parameters =
(Mark Cave-Ayland)
ebb1132023: dev-serial: convert from DPRINTF to trace-events (Mark Cave-Ayl=
and)
8a0e4ee704: dev-serial: use USB_SERIAL QOM macro for USBSerialState assignm=
ents (Mark Cave-Ayland)
adab8d48cf: dev-serial: style changes to improve readability and checkpatch=
 fixes (Mark Cave-Ayland)
9f6df01d0e: contrib/vhost-user-blk: fix get_config() information leak (Stef=
an Hajnoczi)
f8ffcb2bda: block/export: fix vhost-user-blk get_config() information leak =
(Stefan Hajnoczi)
11f60f7eae: block/export: make vhost-user-blk config space little-endian (S=
tefan Hajnoczi)
bc15e44cb2: configure: introduce --enable-vhost-user-blk-server (Stefan Haj=
noczi)
de65d49785: libvhost-user: follow QEMU comment style (Stefan Hajnoczi)
1b0063b304: vhost-blk: set features before setting inflight feature (Jin Yu=
)
b7c1bd9d78: Revert "vhost-blk: set features before setting inflight feature=
" (Stefan Hajnoczi)
1bc211a166: net: Add vhost-vdpa in show_netdevs() (Cindy Lu)
57b3a7d81b: vhost-vdpa: Add qemu_close in vhost_vdpa_cleanup (Cindy Lu)
1b296c3def: vfio: Don't issue full 2^64 unmap (Jean-Philippe Brucker)
e19c520fe6: semihosting: fix order of initialization functions (Paolo Bonzi=
ni)
953e6d7c0e: fuzz: fuzz offsets within pio/mmio regions (Alexander Bulekov)
cc3d99c741: fuzz: check the MR in the DMA callback (Alexander Bulekov)
a9f67c1d51: fuzz: fix writing DMA patterns (Alexander Bulekov)
8a805609d1: target/mips: Add unaligned access support for MIPS64R6 and Loon=
gson-3 (Huacai Chen)
89975214e6: target/mips: Fix Lesser GPL version number (Chetan Pant)
a300c04f13: hw/intc/loongson: Fix incorrect 'core' calculation in liointc_r=
ead/write (AlexChen)
4a129ccdf2: hw/mips/boston: Fix Lesser GPL version number (Chetan Pant)
d136ecc085: hw/mips: Fix Lesser GPL version number (Chetan Pant)
f169413c27: hw/mips: Remove the 'r4k' machine (Philippe Mathieu-Daud=C3=A9)
c59c582d56: tests/qtest: Fix potential NULL pointer dereference in qos_buil=
d_main_args() (AlexChen)
3569a5dfc1: configure: fix gio_libs reference (Bruce Rogers)
af2c0e854b: meson: fix warning for bad sphinx-build (Paolo Bonzini)
0250edf1eb: tests/qtest/libqos/ahci.c: Avoid NULL dereference in ahci_exec(=
) (Peter Maydell)
1d72d9c487: tests/qtest/libqtest.c: Check for setsockopt() failure (Peter M=
aydell)
cd57deabad: meson: vhost-user-gpu/virtiofsd: use absolute path (Marc Hartma=
yer)
a5cb7c5afe: meson: use b_staticpic=3Dfalse for meson >=3D0.56.0 (Paolo Bonz=
ini)
fd25017284: qtest: add a reproducer for LP#1878642 (Alexander Bulekov)
4177b062fc: hw/isa/lpc_ich9: Ignore reserved/invalid SCI IRQ (Philippe Math=
ieu-Daud=C3=A9)
f8b8f37463: scripts/oss-fuzz: rename bin/qemu-fuzz-i386 (Alexander Bulekov)
3792185112: exec: Remove dead code (CID 1432876) (Philippe Mathieu-Daud=C3=
=A9)
2eba427eb1: docs: expand sourceset documentation (Paolo Bonzini)
090afdc5e6: cutils: replace strdup with g_strdup (Paolo Bonzini)
5c3cfe33f4: virtio-iommu: Set supported page size mask (Bharat Bhushan)
b917749842: vfio: Set IOMMU page size as per host supported page size (Bhar=
at Bhushan)
457f8cbbd8: memory: Add interface to set iommu page size mask (Bharat Bhush=
an)
6978bfaa68: virtio-iommu: Add notify_flag_changed() memory region callback =
(Bharat Bhushan)
308e5e1b5f: virtio-iommu: Add replay() memory region callback (Bharat Bhush=
an)
2f6eeb5f0b: virtio-iommu: Call memory notifiers in attach/detach (Bharat Bh=
ushan)
15e4c8f01b: virtio-iommu: Add memory notifiers for map/unmap (Bharat Bhusha=
n)
31aa323fb9: virtio-iommu: Store memory region in endpoint struct (Jean-Phil=
ippe Brucker)
bfe7a96173: virtio-iommu: Fix virtio_iommu_mr() (Jean-Philippe Brucker)
8055d2fb7f: hw/smbios: Fix leaked fd in save_opt_one() error path (Philippe=
 Mathieu-Daud=C3=A9)
8faf2f1de4: hw/virtio/vhost-backend: Fix Coverity CID 1432871 (Philippe Mat=
hieu-Daud=C3=A9)
510feed79a: hw/acpi : add spaces around operator (Xinhao Zhang)
4cbf31a8fe: hw/acpi : add space before the open parenthesis '(' (Xinhao Zha=
ng)
88eed19896: hw/acpi : Don't use '#' flag of printf format (Xinhao Zhang)
296e88fd9f: virito-mem: Implement get_min_alignment() (David Hildenbrand)
c726aa6941: memory-device: Add get_min_alignment() callback (David Hildenbr=
and)
780a4d24e7: memory-device: Support big alignment requirements (David Hilden=
brand)
228957fea3: virtio-mem: Probe THP size to determine default block size (Dav=
id Hildenbrand)
0aed280061: virtio-mem: Make sure "usable_region_size" is always multiples =
of the block size (David Hildenbrand)
d31992ae13: virtio-mem: Make sure "addr" is always multiples of the block s=
ize (David Hildenbrand)
54420332b5: pc: comment style fixup (Michael S. Tsirkin)

