Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A826D58F432
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 00:10:30 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLtuC-0006Hq-Id
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 18:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oLts4-0003FF-6l
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 18:08:12 -0400
Received: from mail-sn1anam02on2061b.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::61b]:4101
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oLts0-0004O7-P3
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 18:08:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nw9biObntoOTJyK0mgkCojOjci7aNJLlIiLSlVs+yJ83rQEm5SshaRJcaRoLWCnhbqwIbFgzgHZdqQhcN3GMzG+mkzpaBo3zSwnvuciPoVCPs3APO8M7lsREvLHjtPp9dATjvPA0G8DT2JGZpTHkJQu04SljeUEG3yiLWtzZHUlKZ+qPfbgBjvAnxBExMfyT0DdLWhK9BUgNFYetII7YX2ns6ZYqffVG/14R7XaFUd1cWF2kXtqMebBy4hBM8KF7xgM/WMS1bHV8+6QiHc08WgXdxhjLh+Kw5VTl6f3HAUa+xbKz6AMsjLz5sTc8ZfcMEoz1Je/bYf0cXS6k9zW15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmgdC4hFD1IJgXcxdjPUYTotvmI4cUH2aTJZMcLg6/I=;
 b=Qiji+MdKJymYBCjgK33sLdyKEjozkOcVwJNZb4CBWZnS8ovBcLTNQqINkrL7AxQ0Xl8Va3pMTjGoTBFLrE6UUBE2YD8xgOzMDEYc6vpV1h2zS67LP+2uPDWN6muWZyZJsAawKP2rEmDzd6zphCULFkjGtZHWinyYKeFwNhxfUouzeZDr7hZbHluryAmra9cmk7Ya6Qno7C9HgT3qwhIyFz6d1vRaE6ezgRaN6/aVtWEJ32yPBK4fR8gqhPJl4oMSMsJBcdXLp/7PgguK5l0a7znLOXXzS7G1ZltOlO5NmPxUaQ5ekV4ZBEW52YThhu0NIC40slonYmQpymuGDcd+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmgdC4hFD1IJgXcxdjPUYTotvmI4cUH2aTJZMcLg6/I=;
 b=t0IcT3qY/gB5jT7BH50jZCK7WvI1exLbRCB+4eQLOKsfcdcqaTQnTCi+odk082LOEkO3NnPB9XYkia+JKHdDakNeAd/njvWl2DWbhzZebENENMUlJXBAlzIIeIDQQFmiPuvy0pj4/DyhqiSRUYS55vwdahsYeKBx4DIVZNamzI0=
Received: from MW4PR03CA0313.namprd03.prod.outlook.com (2603:10b6:303:dd::18)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 10 Aug
 2022 22:03:03 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::8b) by MW4PR03CA0313.outlook.office365.com
 (2603:10b6:303:dd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16 via Frontend
 Transport; Wed, 10 Aug 2022 22:03:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Wed, 10 Aug 2022 22:03:02 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 10 Aug
 2022 17:03:01 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.1.0-rc2 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>
Date: Wed, 10 Aug 2022 17:02:46 -0500
Message-ID: <166016896689.68555.1654970483471318281@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10be610e-65b9-4cb4-6d54-08da7b1c1894
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BJ7NgVEp9imUEAuua9PI+DQ/INDw88J35WUCJTAyP27OjwMDujJA49ZuNd6si5TV5YVhDH+Rshv7lnRf89ycOziy7vbhwZ2gbHCXB+220bzqHPMyLcv8auNURCMCFd3bSJfrkN4Neig8LVrvx7BYXWbI6azPvYdEbHrrGJ7QDBv0Ua/4eTFhkPppe9au9MfDVJWfbFQcckAuRhTNPlG13rTxl71+3EBCA0tJPtWW4b3zXKo9YDGr24ChbYyIC7MSkjVu36TeWgYfaIRShpyVhDJaxRvuq65NfXSxqxGHNPxXxDTfFT0nFHfsyfFOht4x2/BqK/xB1JX6MGeCm1fMg9QHW4dyeEPSLLjL51tuQG8CMa8smIqwfCDe99HaI5cyOQsMm8XVCtehVOIEuB0C9sPpEKn/m/+3tCj6vKmpzE7VXSGPmh8gqOmkM5zyoKhgPRxhOalSnuH3xtG54fisD5+1pR71GaC00DrUMNqUSfEaX3htYksoNLDXGPTo7TtLj420hqORcSw8PMarZxiGv4HO/gEmYZsiPE9xrB/k6yUWlkWjB/EjAFWX2J8qctqMHf8qpFopTqER61RWcmEC8L1zKA0I2PgQ65ezN4iCMTl6fNoKhf1rEBZ0nEmfgNlyA8WtB1TsG+3RjRjOPUoVWPEeYzThX6sNCW8sSRjCerRTwdziALdF07HnqZi+n0tfX7Onq31Gz2UvASv4Kg8Sjb/O0aPmt2yTh6Cyb5QK+TibAh0iHj24jCYUMSro/lk1VgB1391tWyrYAEhGBaqE2xfFdOQUjZO8R61qRtnSJ8A6+56fpeVKZEhc4DAszPWfkZcUpC9XsaIcwB7tNttWdhUi/sEibW7Ui6mTr2M7OlspogZ4rWM9FUa3PxOP1WQw
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966006)(40470700004)(36840700001)(26005)(356005)(82740400003)(82310400005)(40480700001)(426003)(186003)(47076005)(16526019)(316002)(66574015)(336012)(36756003)(83380400001)(81166007)(4326008)(8676002)(8936002)(44832011)(40460700003)(6916009)(5660300002)(478600001)(2616005)(2906002)(70206006)(966005)(36860700001)(70586007)(41300700001)(6666004)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 22:03:02.6152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10be610e-65b9-4cb4-6d54-08da7b1c1894
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
Received-SPF: softfail client-ip=2a01:111:f400:7ea9::61b;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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
third release candidate for the QEMU 7.1 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.1.0-rc2.tar.xz
  http://download.qemu-project.org/qemu-7.1.0-rc2.tar.xz.sig

You can help improve the quality of the QEMU 7.1 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.1

Please add entries to the ChangeLog for the 7.1 release below:

  http://wiki.qemu.org/ChangeLog/7.1

Thank you to everyone involved!

Changes since rc1:

61b6e67171: Update version for v7.1.0-rc2 release (Richard Henderson)
c7f26ded6d: icount: Take iothread lock when running QEMU timers (Peter Mayd=
ell)
7cf745dd9c: hw/net/rocker: Avoid undefined shifts with more than 31 ports (=
Peter Maydell)
10dcb08b03: target/loongarch: Remove cpu_fcsr0 (Richard Henderson)
09d12c81ec: hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit accesses (Peter=
 Maydell)
bd64c210ce: hw/mips/malta: turn off x86 specific features of PIIX4_PM (Igor=
 Mammedov)
8809baf4e4: target/mips: Handle lock_user() failure in UHI_plog semihosting=
 call (Peter Maydell)
f6a5f38062: tests/qtest: add scenario for -readconfig handling (Daniel P. B=
errang=C3=A9)
69c05a2378: vl: remove dead code in parse_memory_options() (Paolo Bonzini)
e12f0685e8: vl: fix [memory] section with -readconfig (Paolo Bonzini)
9390da5ef2: xlnx_dp: drop unsupported AUXCommand in xlnx_dp_aux_set_command=
 (Qiang Liu)
a32086de49: contrib/vhost-user-blk: Clean up deallocation of VuVirtqElement=
 (Markus Armbruster)
407634970d: tests/qemu-iotests/264: Allow up to 5s for the BLOCK_JOB_CANCEL=
 event to arrive (Thomas Huth)
c05a88c6b2: tests/avocado: fix replay-linux test (Pavel Dovgalyuk)
c3dd58ba6e: pc-bios/s390-ccw: Update the s390-ccw.img with the block size f=
ix (Thomas Huth)
393296de19: pc-bios/s390-ccw: Fix booting with logical block size < physica=
l block size (Thomas Huth)
2f149c759f: target/loongarch: Update gdb_set_fpu() and gdb_get_fpu() (Song =
Gao)
d182c39000: target/loongarch: Update loongarch-fpu.xml (Song Gao)
96c3298c0a: target/loongarch: update loongarch-base64.xml (Song Gao)
cd8ef0ed3b: target/loongarch: add gdb_arch_name() (Song Gao)
1fe8ac3511: target/loongarch: Fix GDB get the wrong pc (Song Gao)
4cbadc40b9: hw/loongarch: remove acpi-build.c unused variable 'aml_len' (So=
ng Gao)
00952d93e0: target/loongarch: Fix macros SET_FPU_* in cpu.h (Qi Hu)
e3fdb13e88: util/qemu-sockets: Replace the call to close a socket with clos=
esocket() (Bin Meng)
977c33ba5d: target/arm: display deprecation status in '-cpu help' (Daniel P=
. Berrang=C3=A9)
738cdc2f6e: target/s390x: display deprecation status in '-cpu help' (Daniel=
 P. Berrang=C3=A9)
5dfa9e8689: target/i386: display deprecation status in '-cpu help' (Daniel =
P. Berrang=C3=A9)
5258a7e2c0: QIOChannelSocket: Add support for MSG_ZEROCOPY + IPV6 (Leonardo=
 Bras)
fbf8c96be3: docs: build-platforms: Clarify stance on minor releases and bac=
kports (Andrea Bolognani)
7b0ca31364: virtiofsd: Fix format strings (Stefan Weil)
ed021daf2d: hw/ppc: sam460ex.c: store all GPIO lines in mal_irqs[] (Daniel =
Henrique Barboza)
21d4e557e2: include/qemu/host-utils.h: Simplify the compiler check in mulu1=
28() (Thomas Huth)
1e2dd31149: ppc: Remove redundant macro MSR_BOOK3S_MASK. (Yonggang Luo)
9878fbf342: docs/about/removed-features: Move the -soundhw into the right s=
ection (Thomas Huth)
aed5da45da: vdpa: Fix file descriptor leak on get features error (Eugenio P=
=C3=A9rez)
9567fc1665: README.rst: fix link formatting (Cornelia Huck)
5b63de6b54: linux-user: Use memfd for open syscall emulation (Rainer M=C3=
=BCller)
55794c904d: scsi-disk: ensure block size is non-zero and changes limited to=
 bits 8-15 (Mark Cave-Ayland)
54a53a006e: scsi-disk: fix overflow when block size is not a multiple of BD=
RV_SECTOR_SIZE (Mark Cave-Ayland)
f71fa4e3bb: linux-user: Do not treat madvise()'s advice as a bitmask (Ilya =
Leoshkevich)
734a659ad2: linux-user/flatload.c: Fix setting of image_info::end_code (Pet=
er Maydell)

