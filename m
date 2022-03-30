Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A652F4EB92D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 06:05:20 +0200 (CEST)
Received: from localhost ([::1]:38306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZPaB-0004G7-4x
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 00:05:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1nZPXU-00034t-IT
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 00:02:32 -0400
Received: from mail-dm6nam10on2041.outbound.protection.outlook.com
 ([40.107.93.41]:8385 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1nZPXR-0002GD-Sy
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 00:02:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bb4fFq3TOV/TLatwoXGDpqKxCVAztS7X5lufYAPGuDC3R/al2NYexRkItAD+PQFhsDQMyq7CvmS+dxCJ9YGEHkdIIWcoMeV1ShX80Z18c6Hht4+p6qJFvWaPHm9Afa9g70Gp8p9N7H4RmijJ1bk1ftjUA0LK8Ci0/DC7EKX5pdwLHfl7plFCr033ZtdSpHpmRQ5qTQ8BNjj3s5472keKUal8+y8sF4FOHXxE2h1gR09Iif5n8a8wjeXow0rREfhYKJT7dpxpqpm8v2t0owky3cFWTxHjftsOob2CWdWJWFpSKpQTSofNZjuF7TFqPTB7xhuTnUBFmb7IZNyp6Szlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5riok/hJzeYmMlcCS2jPDXkuaLXMN2GDYQIKqAQsV/M=;
 b=BFh8mM0MI6cSDhPaM3WpUmDaadBfYDAR6/Nn8LIFYsI0LV9Xiy20AILZiDXzB2S42iHzZfV9QJdsiP5RbTmZh3pX6RBJsygNaTKXs0SQULixBOdVvF6jReDybduGQeRfjOxI2WCjpTpL3DPS1wWbYpQpeNyIgalKM8apYrQcPnJLJtHO03+X0YDDDq6jcnhPeudEzx03N+88rizRyGFozJ6KygMFwbtfpU9sHXcN/kcSC+5y8MT7kAhgVLNME6dI4VM4+UBdvmwrg4j7zn1Ba3N8x6TlNhAQVNftyYQfbraHoNTFCe1JkjXPfCNTta6fdj5cE7Fo0uzQnmjl2G6Jbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5riok/hJzeYmMlcCS2jPDXkuaLXMN2GDYQIKqAQsV/M=;
 b=0j2oXJOirOgibfTVbNHGjIemVk1C8M/UZlYLbgB5mvoACem7LY/5j3ppmRXIuEbCcixlgUfCjAkhww91Gdz+gmxS6qhSilcF9VPIFNIAAbuNQHDgWplhbvtlP/qeVFNRSToAyHFB2a+HyTiTjIZ9BFkWpbDA0gjVY7+3dPB57uE=
Received: from MW2PR16CA0036.namprd16.prod.outlook.com (2603:10b6:907::49) by
 MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18; Wed, 30 Mar 2022 00:26:01 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::67) by MW2PR16CA0036.outlook.office365.com
 (2603:10b6:907::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 00:26:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Wed, 30 Mar 2022 00:26:00 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 29 Mar
 2022 19:25:59 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.0.0-rc2 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 19:25:14 -0500
Message-ID: <164859991487.44881.10146150423832054116@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30346ab1-807f-4c51-f12f-08da11e3de50
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB361304BB57779EA76E8A02C1951F9@MN2PR12MB3613.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vnUdzZkrk6JvavMZ68JIvY3QktGs45uM3bmB1fCGRYJuT2D3xy7vZj2130xW2rbeQh4gyGXw/0h3wzqcjI++x+Pqt44DLQXJ//ChSUWqmeI3CbDHGc7PTK0+3d92sYt5jjH/9E/Zui8E04PnMpWqxuFcfJAyYcrh6g7LLeccobNMcnDnNfjZ7bCXV25L9Q0bHydOdN7OAOjQgA9NlJUVMqizadcTIy8bm/WC9Wu67LGnkq0Xs8I9UthjIqCfFx0Tsju99aAv0KUz5miiA7808epbOD3umSR0yk0MyGsL6Kp7vb2PD+qUN/aNF9BsqY1WVEhbeK9KMuOtRI+RBbBGTHFp+goAsfGIUrP7XoZbNpj5ezpqoocn2v9sxRBQcs1OzEAORFArsuuYnIAbVYdC7l4yhvhJx0c8wOeXwg362HtuIQyT0dSNfAUdynVozzmhgrkAwsQusNuCITNDSBwr5Y0ibGsfpJuKrEGyX4x7tLRkqsslCJdV5nSrnqkADabZsSTQiH+UAmpRK9UjvyObIDxgzmhFcUiYr3wehJdGawtG00iSN1zM3Wt3cNyY4cu3sn3rKQg5bb/0WxbPT9m3dXaD2tnYbw6x+EixPMi38wcNNhcX69rZjMhcE0iO4yrBBX7Jo4wfSOMh4wFTGyaRmDCdAgv0CfZt8RlV6ieGxGz88TULaen1/iNB+HlWeQkqCm83H9W5niL1mh/wyrntGfk/+hUzOGBgLl5CLIo/9GyEDanrcF4KkSQYuTTnEJbskmTbdlKjArKlB118fXkjctKAqgyF/sAMf6k66X3CkfI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36756003)(70586007)(70206006)(36860700001)(6666004)(47076005)(44832011)(2616005)(40460700003)(5660300002)(82310400004)(4326008)(86362001)(26005)(186003)(66574015)(426003)(16526019)(336012)(8936002)(83380400001)(508600001)(6916009)(356005)(2906002)(966005)(81166007)(316002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 00:26:00.9566 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30346ab1-807f-4c51-f12f-08da11e3de50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3613
X-OriginatorOrg: amd.com
Received-SPF: softfail client-ip=40.107.93.41;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
third release candidate for the QEMU 7.0 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.0.0-rc2.tar.xz
  http://download.qemu-project.org/qemu-7.0.0-rc2.tar.xz.sig

You can help improve the quality of the QEMU 7.0 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.0

Please add entries to the ChangeLog for the 7.0 release below:

  http://wiki.qemu.org/ChangeLog/7.0

Thank you to everyone involved!

Changes since rc1:

aea6e47108: Update version for v7.0.0-rc2 release (Peter Maydell)
6ae6a30ca5: tests/qtest: failover: fix infinite loop (Laurent Vivier)
d5699c0d4b: iotests: Fix status checks (Hanna Reitz)
b1e1af394d: block/stream: Drain subtree around graph change (Hanna Reitz)
b1c0734905: main-loop: Disable GLOBAL_STATE_CODE() assertions (Hanna Reitz)
42a5009d88: iotests: update test owner contact information (John Snow)
36e38426ff: tests/tcg: really fix path to target configuration (Paolo Bonzi=
ni)
14b61778bc: virtio: fix --enable-vhost-user build on non-Linux (Paolo Bonzi=
ni)
77d119dd33: qemu-binfmt-conf.sh: mips: allow nonzero EI_ABIVERSION, disting=
uish o32 and n32 (Andreas K. H=C3=BCttel)
8cd0e66353: target/mips: Fix address space range declaration on n32 (WANG X=
uerui)
a8749d7cc9: memory: Make memory_region_readd_subregion() properly handle ma=
pped aliases (David Hildenbrand)
1699d00e5b: ui/console: Check console before emitting GL event (Akihiko Oda=
ki)
d6b6dea77e: ui/cocoa: Respect left-command-key option (Akihiko Odaki)
47281859f6: main-loop: Disable block backend global state assertion on Coco=
a (Philippe Mathieu-Daud=C3=A9)
bc4ca8efba: gitattributes: Cover Objective-C source files (Philippe Mathieu=
-Daud=C3=A9)
bc504838ff: target/ppc: fix helper_xvmadd* argument order (Matheus Ferst)
c7ca3ad5e7: hw/intc/arm_gicv3_its: Add missing newlines to process_mapc() l=
ogging (Peter Maydell)
6222c3acc4: target/arm: Fix sve_ld1_z and sve_st1_z vs MMIO (Richard Hender=
son)
9584d3d00a: build: disable fcf-protection on -march=3D486 -m16 (Christian E=
hrhardt)
5286c36622: target/i386: properly reset TSC on reset (Paolo Bonzini)
2539eade4f: hw: Fix misleading hexadecimal format (Philippe Mathieu-Daud=C3=
=A9)
3f1db95917: block: Fix misleading hexadecimal format (Philippe Mathieu-Daud=
=C3=A9)
de65b39a51: target/i386: tcg: high bits SSE cmp operation must be ignored (=
Paolo Bonzini)
330ea9d1d8: linux-user/arm: Implement __kernel_cmpxchg64 with host atomics =
(Richard Henderson)
7f4f0d9ea8: linux-user/arm: Implement __kernel_cmpxchg with host atomics (R=
ichard Henderson)
6e05e7047c: linux-user/arm: Implement __kernel_memory_barrier (Richard Hend=
erson)
98a02bc449: configure: remove dead int128 test (Paolo Bonzini)
58f7db26f2: KVM: x86: workaround invalid CPUID[0xD,9] info on some AMD proc=
essors (Paolo Bonzini)
cb48748af7: i386: Set MCG_STATUS_RIPV bit for mce SRAR error (luofei)
dcebbb65b8: target/i386/kvm: Free xsave_buf when destroying vCPU (Philippe =
Mathieu-Daud=C3=A9)
0f37cf2f71: docs/tcg-plugins: document QEMU_PLUGIN behaviour (Christoph Mue=
llner)
f503b7e327: docs: remove qemu_logo.pdf (Alex Benn=C3=A9e)
efd080de76: gitlab: include new aarch32 job in custom-runners (Alex Benn=C3=
=A9e)
78beee809d: semihosting: clean up handling of expanded argv (Alex Benn=C3=
=A9e)
c6afd2bdfd: docs/devel: try and impose some organisation (Alex Benn=C3=A9e)
b8003f9956: mailmap/gitdm: more fixes for bad tags and authors (Alex Benn=
=C3=A9e)
276de33f3d: target/i386: force maximum rounding precision for fildl[l] (Ale=
x Benn=C3=A9e)
425d6aba99: tests/Makefile.include: Let "make clean" remove the TCG tests, =
too (Thomas Huth)
879667433a: linux-user: Fix missing space in error message (Fergus Henderso=
n)
db36aa7daa: linux-user: Properly handle sigset arg to ppoll (Richard Hender=
son)
cd0e31a49a: linux-user: Properly handle sigset arg to epoll_pwait (Richard =
Henderson)
cb22603444: linux-user: Properly handle sigset arg to pselect (Richard Hend=
erson)
0a99f09383: linux-user: Split out helpers for sigsuspend (Richard Henderson)
7fb5ef350b: linux-user/alpha: Fix sigsuspend for big-endian hosts (Richard =
Henderson)
80f0fe3a85: linux-user: Fix syscall parameter handling for MIPS n32 (WANG X=
uerui)

