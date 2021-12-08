Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF7346D5F0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 15:42:07 +0100 (CET)
Received: from localhost ([::1]:56106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muy8y-0003OD-DD
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 09:42:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1muy7J-0002YA-Ut
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 09:40:22 -0500
Received: from mail-dm6nam12on2076.outbound.protection.outlook.com
 ([40.107.243.76]:10401 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1muy7D-0004BI-Ad
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 09:40:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a++jzT/p/UAMWWPQCEwQXuBm24qq5tZ0QqQg3NB0cNzEXRFHPzBYAbyfgF3CQBmY1ukBwFvTRpPvH1peG76mvTrVWas/Owk/kOcntWbLUs/O7F+kB0dHCeUlWYoo+6Y2ZyDQKsClfImNLALu8caEj+ELok12+3OOWwhmkChq3KAwC9EKkFfumEIom/SMFPxT85AjzI4jroTPg6RDWvX07Z8UCaSX3gmyqZIZ5jtkwtWyLKG0QybTKIPk95uXQzkYk7SpgRFELkHExI3SoF4zY3k2+Gkc8J9HC7pYs5b9+vZlMD3X/rduWh6Fabk5RvvUCBWpTxtOT/fbAoijwDgRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stMvmz4yYmnJDv30xnyuLwSEd9kMieXtOaC58WUQFzQ=;
 b=ZqSdbsPpkVPDIHKs7I2hfOfR9SWsiVauxqw71+WRnkiR3fm19l1sR58TWsc/nEzzF5mmrnvsNxG8Z7ivNnjERJqRPl2/2VL5zjfG/BkSXwgi57M/SZy+cCsAaGu6GXiD5ojLgnEj9SWEB2q7MbUjTtmvad6I39rhilFEfgovGAQDkJyanLu+p6VFS7DJEEuMDv+dE+sfkwmjg2+9rgHBVzfQophBTXy6GgxN5JaIa9oB38GUb0k8prFG/giBHc3yOO20kZCENN+HeZ/aq/Om3u5XOj0d/m8nqTJb6v3hh60HEIQ0HiEsd9HnXkmzzSJJuLfx1RTh03etKuro5Gs9vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stMvmz4yYmnJDv30xnyuLwSEd9kMieXtOaC58WUQFzQ=;
 b=0sCyqIihVhfAs8Sgx1NAiicVxyFh5SGjnVqt9j0s+o5yiYxNE307zylmFf5fsuBvZV6gIMfr5fgj0BZkIxNVoYGywFsHAEKiYXWIFbmDKqKGgofJlAKqCN6vVi5BEpeyEE6/tsollt2c76mAwAReZ6W5vfp1M4kLxXb6MBgUIQU=
Received: from MW4P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::28)
 by SN6PR12MB4704.namprd12.prod.outlook.com (2603:10b6:805:e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 8 Dec
 2021 14:19:09 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::44) by MW4P222CA0023.outlook.office365.com
 (2603:10b6:303:114::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend
 Transport; Wed, 8 Dec 2021 14:19:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 8 Dec 2021 14:19:09 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 8 Dec
 2021 08:19:07 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.2.0-rc4 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>
Date: Wed, 8 Dec 2021 08:18:53 -0600
Message-ID: <163897313321.340397.3298220794210396242@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5009e910-61f8-4e20-4a4f-08d9ba55b349
X-MS-TrafficTypeDiagnostic: SN6PR12MB4704:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB47040935C20CC15E6B721D78956F9@SN6PR12MB4704.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zU25Xo8REzW9IkBwiaUKSveLyHhZWsWEAqqeBOo+/5rP1peWxUJa2+05oq9cPuXbW3O3uDefvB5aslZqCeVRqUx/I0NbbEebUoP3ShcK1kCZBQGpViUGZI/cyrEzMY6aIhVG8LtW6WKoqDCLZwCKhLC/buGq5l6esNiJ27h9PVfUyr3FtoukTO01bJSc+KmAzPEBud15bJ+WVfCTnCyPh1LbyIAziTQAtNKVbONpu3pKfKLCvqbS0jfr1+Wc8xOBQuFwjE+9EDrFLVJ+JSkKSse35LdAWItLp5mM70Tr1L7WLMfmw3RSIxnx+fY6FuTRi1noMjmn/m1i1N4BKKJH/6FNxvAbrAMNDlQwRnztwD0NgmmBQUv0iIGP1d/CI4MOmEtIWqLUdXQwo0VG4uRncPWsbKAYHbas6jGHAAMAR/fpVKVNk0yUUEc51vGcSYupXz0saLx7AxQa4onReREWCqQLDZB2oUiS0G3rNgsOFm9mG5bZ6cuOBFRIBseRZyyA5iQds9qsfRBlr0k6WJTYYIzeP4KkJJUJPiHDMGEOteO80rzTPGP51vyAflHQiw33jb+ZgMNWRxxnKBuXmvPeLjsnR+71r0pyNuK/6CJASCichlkYZVsSNh0HPYkuAJMC++OFuPD62aucxeY2qCRgzjJsi/7qTdPRrqQkBKVTLZoeg54n0Ow/zi6LORbd9EHst/ai1R1Lmrg1kca2t4XivYF1Gcrbv58sD/SIbwsTUodL69IEKwRzV43d7bhhZovqFz2HVZ4NUCpF3EK0jvUtgX/CUAkxFhGzI4vrXfChZMnC2J05n6tv8g9plPgpbeDxzv2IOAu7I+PVbTfdQ+AkWOnBRD84A53bZmcIrX067BPA+3wLK64tPcy2cNOkGOL6rPgdfbYPaiGnBqKpt/yonJcy4kPGgApPFQNcVIZDwmw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(316002)(47076005)(5660300002)(6916009)(70206006)(44832011)(2906002)(508600001)(70586007)(2616005)(82310400004)(36756003)(8936002)(336012)(426003)(966005)(6666004)(26005)(86362001)(81166007)(16526019)(186003)(8676002)(83380400001)(40460700001)(4326008)(356005)(36860700001)(66574015)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 14:19:09.0984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5009e910-61f8-4e20-4a4f-08d9ba55b349
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4704
Received-SPF: softfail client-ip=40.107.243.76;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
fifth release candidate for the QEMU 6.2 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.2.0-rc4.tar.xz
  http://download.qemu-project.org/qemu-6.2.0-rc4.tar.xz.sig

You can help improve the quality of the QEMU 6.2 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.2

Please add entries to the ChangeLog for the 6.2 release below:

  http://wiki.qemu.org/ChangeLog/6.2

Thank you to everyone involved!

Changes since rc3:

a3607def89: Update version for v6.2.0-rc4 release (Richard Henderson)
2958e5150d: gicv3: fix ICH_MISR's LRENP computation (Damien Hedde)
b9537d5904: tcg/arm: Reduce vector alignment requirement for NEON (Richard =
Henderson)
5b807181c2: virtio-blk: Fix clean up of host notifiers for single MR transa=
ction. (Mark Mielke)
ac5837e330: Revert "vga: don't abort when adding a duplicate isa-vga device=
" (Alex Benn=C3=A9e)
d77c462bf2: hw/mips/boston: Fix load_elf() error detection (Jiaxun Yang)
24ade8c5de: hw/mips/bootloader: Fix write_ulong() (Jiaxun Yang)
3bc90ac567: seabios: update binaries to 1.15.0 (Gerd Hoffmann)
e7fa3377cc: seabios: update submodule to 1.15.0 (Gerd Hoffmann)
cc20926e9b: tests/qtest/fdc-test: Add a regression test for CVE-2021-20196 =
(Philippe Mathieu-Daud=C3=A9)
1ab95af033: hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196=
 (Philippe Mathieu-Daud=C3=A9)
b154791e7b: hw/block/fdc: Extract blk_create_empty_drive() (Philippe Mathie=
u-Daud=C3=A9)

