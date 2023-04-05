Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0147E6D866A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 20:58:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk8K5-0006z6-Lw; Wed, 05 Apr 2023 14:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pk8K1-0006yr-Ie
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 14:57:30 -0400
Received: from mail-bn8nam11on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::600]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pk8Ju-00004q-9b
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 14:57:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxQ0X6RZEqxXlKf0kaoYiJ4EIE0I81XJndJ5YvmOuQI6atIAJ8YjbEBbhy7OCcSj5HSO5ZYvmLmCofoQWsWprHIwn69WQwVA3o7xPcfg0wekQjdZQsm335EM9uKE7mY1fFzJ2ESwZglSguLArnSw/I52fVG9PHVFz2aNqjzjbjb2ZpgvfG6/RwHy+nAH26TbODSJh5s3QKBw2eyCkmuzy1WP/BP3/wLz7YoD1WpX+S3A7APy7DXH2/EHDaEbTwxzKkSuxHwfucyxjK0WC4efiyflOOXMVoTyZj5EkcNG/IYteno+Lv0xp/Ba0KDBYcBXECV8zpkEYhucnybTjgzxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDsPjbcd+WYB1fIJD6Sng1j+m2ByAvwMsXM53rC/Dj8=;
 b=YJ1tK5mrAE7NfBH5lRS5loir5gor8FL52YuVWoeBdzPYSdR+FvkGkN2+NltUO99RfIyDTwXXeGD4WV5wJpHq53kTJ+q91zY6r78VMxGVffAxeDUxM8lqm52jn6x/5LOQHB8axFon7kyGkStr8D7O/s34Mw4eXtgtgDDFgjMOTRpCe75PXeUh+sJF0yFmovPBckDOXamzazpMXA7EiuoqiNxJSYcTAf0c23ZjX4Pm6MhAcsf85HSiG9AW3vqnxT++6v/qjlilxZlr/B+FDkOnIv85osjzzXxiiBU/bCIIdrlRaq73Evu90iGrJ7pYWTFwx8tbhTSeFAz8h+LycDFdLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDsPjbcd+WYB1fIJD6Sng1j+m2ByAvwMsXM53rC/Dj8=;
 b=ezZp6H+ypda8Q2BUPHHhvptxk2oo87G3+1eseFvtiKhwWfYzR5UtBnrsIC1nqTlit4Y+e7viKGOOig7V1Y0GfdVrZajiVBDz5wtoESvgE25Y8+7l7c3Az94XmcTT159okB/NquylPhpjx0DC+KykyAz00oNyFNq1Slavb4CCI8U=
Received: from BN9P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::26)
 by IA1PR12MB8468.namprd12.prod.outlook.com (2603:10b6:208:445::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Wed, 5 Apr
 2023 18:57:16 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::b6) by BN9P222CA0021.outlook.office365.com
 (2603:10b6:408:10c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.37 via Frontend
 Transport; Wed, 5 Apr 2023 18:57:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.16 via Frontend Transport; Wed, 5 Apr 2023 18:57:16 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 5 Apr
 2023 13:57:14 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 8.0.0-rc3 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
Date: Wed, 5 Apr 2023 13:52:31 -0500
Message-ID: <168072075103.406711.10895084412380828570@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT028:EE_|IA1PR12MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 091ddbc6-b755-43e1-c278-08db360792f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /oozU7JP5SruDmw1N7td3RmHFL71lmjcxqBvVzkX0kLdz5390Q0ZrTnWVzp82pbD4K9s/zPbK0Mm001ku3/pMUQ0aG4HxFFGfctwIcR++fIg0UU3PkytqcNXkd/FjJC7V7bDxIBOCvOnYoBv94vtUTwxwm7vv+wpQfwHfBjAWt2JkFY9H3EGg4wFaLeuhat+AZ33z6u0cxhrVt+cn+ySLcBkn/zBb49Z9zdAEDOPMQsR57KnEobBk+Bf2bvFrz9oOeBikVGzOsWs1cJg+2xFLbPWw5LgPTz1pTEqLAzKi+lcuzqOqsMY/uPHXCDf+XSiicJN4gQP7Vqh00FFetyftUaNKInK9EDJwAt+z0/blvb3gYYYbO4qDQsczyXbCN4vHUGQwmXztKwh4wiiKWeuI9yoOKL1z/kB3jTVzdRVDFN5S86zrgVTOtPQCD/GMGJFmRk7eOryGekQNmCVzQJy0HMiqfou+5uyHhXwcw++X7nj7aCFn8zc0SYIQjpSVNV0K4BjYlSDGMhi/+bDH/A8qp3vUk/Fi+yDbKI56ABw3WLbKzjhkFIer6KkM7ByZVWMxW4BO0gaPhQdSJGQel9wsoRzYLcs1dKS61JnQ9UtH7CJ7ShcjRg+KHELqgdJNy1bH/slxDwhNVN0Xdh55b8atBrSNYgGC3custB42XnRf9GWk15dNo0yGR5jQTw/p+cD5fXpSbMZollevDCMIQnV3Anw6UTjR6TqcyjZhUuaZ0Xr4xy6ORbNJYaj2n7LR/seB+Z0W0YQSP7REV5DwIl/hg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(36840700001)(40470700004)(46966006)(83380400001)(8676002)(40460700003)(478600001)(26005)(44832011)(5660300002)(16526019)(966005)(36860700001)(47076005)(66574015)(426003)(2616005)(8936002)(336012)(186003)(2906002)(70206006)(6916009)(70586007)(4326008)(6666004)(36756003)(40480700001)(41300700001)(316002)(82740400003)(82310400005)(86362001)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 18:57:16.0904 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 091ddbc6-b755-43e1-c278-08db360792f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8468
Received-SPF: softfail client-ip=2a01:111:f400:7eae::600;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
fourth release candidate for the QEMU 8.0 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu.org/qemu-8.0.0-rc3.tar.xz
  http://download.qemu.org/qemu-8.0.0-rc3.tar.xz.sig

A note from the maintainer:

  Unless any showstopper bugs appear in the next week, this will be the
  final rc for this release.

You can help improve the quality of the QEMU 8.0 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/milestones/8#tab-issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/8.0

Please add entries to the ChangeLog for the 8.0 release below:

  http://wiki.qemu.org/ChangeLog/8.0

Thank you to everyone involved!

Changes since rc2:

c6f3cbca32: Update version for v8.0.0-rc3 release (Peter Maydell)
b1ab8f9cc5: Revert "memory: Optimize replay of guest mapping" (Peter Maydel=
l)
56adee407f: kvm: dirty-ring: Fix race with vcpu creation (Peter Xu)
1ffbe5d681: tcg/sparc64: Disable direct linking for goto_tb (Richard Hender=
son)
3371802fba: accel/tcg: Fix jump cache set in cpu_exec_loop (Richard Henders=
on)
c83574392e: accel/tcg: Fix overwrite problems of tcg_cflags (Weiwei Li)
c8cb603293: tests/avocado: Test Xen guest support under KVM (David Woodhous=
e)
fc9988916a: gitlab: fix typo (Alex Benn=C3=A9e)
bdd53274f2: tests/vm: use the default system python for NetBSD (Daniel P. B=
errang=C3=A9)
90834f5de6: tests/qemu-iotests: explicitly invoke 'check' via 'python' (Dan=
iel P. Berrang=C3=A9)
6e3be02291: Use hexagon toolchain version 16.0.0 (Marco Liebel)
452b3eeacc: metadata: add .git-blame-ignore-revs (Alex Benn=C3=A9e)
3be8c03460: MAINTAINERS: add a section for policy documents (Alex Benn=C3=
=A9e)
0beaebc041: gdbstub: don't report auxv feature unless on Linux (Alex Benn=
=C3=A9e)
b846ad627e: gdbstub: Only build libgdb_user.fa / libgdb_softmmu.fa if neces=
sary (Philippe Mathieu-Daud=C3=A9)
6cda41daa2: Revert "linux-user/arm: Take more care allocating commpage" (Ri=
chard Henderson)
899c3fc2dc: scripts/coverage: initial coverage comparison script (Alex Benn=
=C3=A9e)
f1426881a8: nbd/server: Request TCP_NODELAY (Eric Blake)
b8b6d3c04a: MAINTAINERS: Remove and change David Gilbert maintainer entries=
 (Dr. David Alan Gilbert)
ec28dd6c6f: target/loongarch: Enables plugins to get instruction codes (tan=
hongze)
51d54503e8: hw/loongarch/virt: Fix virt_to_phys_addr function (Tianrui Zhao)
a0eaa126af: hw/ssi: Fix Linux driver init issue with xilinx_spi (Chris Raue=
r)
782781e85d: target/arm: Fix generated code for cpreg reads when HSTR is act=
ive (Peter Maydell)
12148d442e: hw/arm: do not free machine->fdt in arm_load_dtb() (Markus Armb=
ruster)
b15bdc9651: target/arm: Fix non-TCG build failure by inlining pauth_ptr_mas=
k() (Philippe Mathieu-Daud=C3=A9)
aad3eb1ffe: block/dmg: Ignore C99 prototype declaration mismatch from <lzfs=
e.h> (Philippe Mathieu-Daud=C3=A9)
95bf341865: hw/i2c: pmbus: block uninitialised string reads (Titus Rwantare)
9d403d27bc: tests/avocado: Enable TuxRun/mips64 (big-endian) test (Philippe=
 Mathieu-Daud=C3=A9)
3d85c7c15f: hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR (Jiaxun =
Yang)
450cb7ec2c: linux-user/mips: Use P5600 as default CPU to run NaN2008 ELF bi=
naries (Philippe Mathieu-Daud=C3=A9)
baead64297: linux-user/sparc: Don't use 16-bit UIDs on SPARC V9 (Philippe M=
athieu-Daud=C3=A9)
87e303de70: softmmu: Restore use of CPU watchpoint for all accelerators (Ph=
ilippe Mathieu-Daud=C3=A9)
a085860834: softmmu/watchpoint: Add missing 'qemu/error-report.h' include (=
Philippe Mathieu-Daud=C3=A9)
6eece7f531: softmmu: Restrict cpu_check_watchpoint / address_matches to TCG=
 accel (Philippe Mathieu-Daud=C3=A9)
4f5c67f8df: linux-user/arm: Take more care allocating commpage (Richard Hen=
derson)
95059f9c31: include/exec: Change reserved_va semantics to last byte (Richar=
d Henderson)
a3a67f54f0: linux-user: Pass last not end to probe_guest_base (Richard Hend=
erson)
e506ad6a05: accel/tcg: Pass last not end to tb_invalidate_phys_range (Richa=
rd Henderson)
73f96d51ff: accel/tcg: Pass last not end to tb_invalidate_phys_page_range__=
locked (Richard Henderson)
f6555e3f39: accel/tcg: Pass last not end to page_collection_lock (Richard H=
enderson)
f7e2add5fd: accel/tcg: Pass last not end to PAGE_FOR_EACH_TB (Richard Hende=
rson)
10310cbd62: accel/tcg: Pass last not end to page_reset_target_data (Richard=
 Henderson)
49840a4a09: accel/tcg: Pass last not end to page_set_flags (Richard Henders=
on)
2f7828b572: linux-user: Diagnose misaligned -R size (Richard Henderson)
1ff4a81bd3: tcg: use QTree instead of GTree (Emilio Cota)
e3feb2cc22: util: import GTree as QTree (Emilio Cota)

