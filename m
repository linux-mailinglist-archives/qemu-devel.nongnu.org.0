Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5392762E603
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 21:36:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovlbk-0000Iy-0X; Thu, 17 Nov 2022 15:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1ovlbh-0000IO-97
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 15:35:33 -0500
Received: from mail-bn8nam12on2072.outbound.protection.outlook.com
 ([40.107.237.72] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1ovlba-00008W-Sf
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 15:35:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUx+h8xkW+mTTvgOBoQfbf8s2na0wqmYQqQaXeBp9QlDlx33OhhsWae523wics6UH+L+elQ2NQvFmNfEBKpDNjNjsKSO9/qypNebLk+tg6eREcX//H0ZTlzdKxaKSyBPgRDiiTwrVa6Zed2PxcK6C2gta3YSgpDN20/zTKz+cWh2ulRSxqT5V+qddVYaA/NbEjuduqPkLBNOHmuSPI3Tta9UtKv7J7tlgq9zh7eWW1qBuwoJKIllLa5YbEK6H9TaSZTYu4QevifOt7k+GcVcv6MXXdsB0+wqckLem0ik5S4dAUXjCG8lDx/RuZDbXTHGXftYn7FKHCAVCUCHA+xb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FF+vv7eVdTLAvOLSRFP36tQDeXCV8fMbHAP2+aQf7Xk=;
 b=VsBl3+/A7CERg0irBJEVL9jb88+KNJ2uGS0YoQkL775GPpfAE5Q/qw14mvaBOC2mxjkke8X9vBofJ+WVlaLSoFMbs0dinUpzAMssqZzFmlZj2mEkPkoRxWeZXFTHsViDB3/7IOT51ix6R5krYgmPjadErPuNyxGgTYP/t3yi5rVyFp3O92lbq4T1k/t/TFs88XnTqEhKXxA00ND92iKmTHE0nzYmlkcJsbS/+Zk2ZXnBIYRlrLlBkxiMh1JcDrmeZhWBTQMiZqy/ElbwOqv0nFY1EaFLjGWSkV0Yoc8uUp8Oz4uiW4KVKQosBEysnWtbNXQnDUmJQ6gmClO4dhS1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FF+vv7eVdTLAvOLSRFP36tQDeXCV8fMbHAP2+aQf7Xk=;
 b=doK+g1QRx4sS81qD2Hv3LW+oMVllyeGuPN1saIjkVmW2pSWm+KB7Idw3vSVH1YdtAND2fUn39kQWGryj+fadq17z1kSrrntaWmqDTAl9DJMz6HaTl8o7pnZqQuaYToa0k+5Swr3EaQj4suy406OinneOOesdH1VPuR3opPZfGLE=
Received: from DS7PR03CA0210.namprd03.prod.outlook.com (2603:10b6:5:3b6::35)
 by SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 20:30:20 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::fa) by DS7PR03CA0210.outlook.office365.com
 (2603:10b6:5:3b6::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Thu, 17 Nov 2022 20:30:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 20:30:19 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 14:30:18 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.2.0-rc1 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <stefanha@gmail.com>
Date: Thu, 17 Nov 2022 14:30:03 -0600
Message-ID: <166871700300.255941.11854636613869633630@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT046:EE_|SA0PR12MB4397:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f4f5d8-e275-40bd-8e4b-08dac8da8b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1duJAJJsD4yi05SlxxNz/aDQU/A8hoGF/2WHciMMhlD0u66TJrXv2qgCV2vyNX5EGcjwgm8x8+NzqmNvSyvnJw2U9zwEWjHLEIyuPhiiIiy51WQSD1h+pBOYv7193y0Gh3H0NFq7Qv5pOAl0cVds9Z3ufQ8YQEhVj7/tFzYS2RJQU+JmK8LEhyU631nMsS86beT8FLwV7HUjpMxfEJDNFkFzixROOuN836YrcMEQrBwcNQtSXVqf2tyIPiO6DF3lDDyF5/w/nb39FnZfWh5zNzZAbvj6inau1qOszUflZvqhLUjAL1/vTvxMcjT+9HQUxe88/hodKPqRTFGkIJDyahytRcABeOL0MNssA93DvZernBcSM21pGBwAe4lRJf4gLAQElcJlMxb6uTeigCbHXcujCUxwYbbzHmQ3AlXpBj0Ub+JQqOZT2wValsFNlbDFjkrtsQzRDcv+e0YsO9CENqlKSiV9K9cLZXuoNXjuVdVsC07RmHlrx2U4OIIJAvdRmHj6on8uThmTHREB4dANqpQdxJvbee88NkBsZTx7KqYCvFBCgfwX9XLbPXP4vL3h3IgcK1Z40jOhPI+njRAUTSXVIs8PfucPFCldrkip4lNobxGIIlDAXs9mCVb0i/qgQ6vfOlfXYjelq3j66oSq7neeMlj0NagdCS1WyNFhck2n+DKNvwraRrAyFCPStWEeCHU19r5cKaG2YNnA+ls9jgVs6b5A0P3YAic850map8CQJ9BcmrnWmgPoSvFZHeeGclCm82Uiur/iVkwfm14IpUJNLTdUMhTtJabOlZx0/Er5eJZePghncvy+b/ZOXWbk
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(8936002)(44832011)(2906002)(36860700001)(40460700003)(36756003)(40480700001)(86362001)(8676002)(356005)(966005)(82310400005)(47076005)(2616005)(336012)(478600001)(426003)(81166007)(82740400003)(5660300002)(70206006)(70586007)(316002)(6916009)(83380400001)(6666004)(41300700001)(16526019)(26005)(186003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 20:30:19.3859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f4f5d8-e275-40bd-8e4b-08dac8da8b77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397
Received-SPF: softfail client-ip=40.107.237.72;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
second release candidate for the QEMU 7.2 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.2.0-rc1.tar.xz
  http://download.qemu-project.org/qemu-7.2.0-rc1.tar.xz.sig

You can help improve the quality of the QEMU 7.2 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/milestones/7#tab-issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.2

Please add entries to the ChangeLog for the 7.2 release below:

  http://wiki.qemu.org/ChangeLog/7.2

Thank you to everyone involved!

Changes since rc0:

2c8311241d: Update VERSION for v7.2.0-rc1 (Stefan Hajnoczi)
35d95e4126: target/i386: hardcode R_EAX as destination register for LAHF/SA=
HF (Paolo Bonzini)
d1bb978ba1: target/i386: fix cmpxchg with 32-bit register destination (Paol=
o Bonzini)
d9721f19cd: hw/intc/arm_gicv3: fix prio masking on pmr write (Jens Wiklande=
r)
32bd99d02b: MAINTAINERS: Update maintainer's email for Xilinx CAN (Vikram G=
arhwal)
46530d3560: tests/stream-under-throttle: New test (Hanna Reitz)
57bc6e40e8: libvduse: Avoid warning about dangerous use of strncpy() (Phili=
ppe Mathieu-Daud=C3=A9)
46b21de238: hw/loongarch: Fix loongarch fdt addr confict (Song Gao)
2cb40d446f: Fix several typos in documentation (found by codespell) (Stefan=
 Weil)
f469150be8: net: Replace TAB indentations with spaces (Ahmed Abouzied)
e0091133e3: qga: Allow building of the guest agent without system emulators=
 or tools (Thomas Huth)
b2a3cbb80c: libdecnumber/dpd/decimal64: Fix compiler warning from Clang 15 =
(Thomas Huth)
5ab8ba977d: host-libusb: Remove unused variable (Miroslav Rezanina)
0f48c47c67: qemu-img: remove unused variable (Miroslav Rezanina)
6083dcad80: tulip: Remove unused variable (Miroslav Rezanina)
7d7238c72b: rtl8139: Remove unused variable (Miroslav Rezanina)
ec5651340d: hw/pci-host/pnv_phb: Avoid quitting QEMU if hotplug of pnv-phb-=
root-port fails (Thomas Huth)
f47af0af0d: virtio-net: fix for heap-buffer-overflow (Xuan Zhuo)
28cf396096: display: include dependencies explicitly (Michael S. Tsirkin)
53a3b83259: checkpatch: typo fix (Michael S. Tsirkin)
ace5a161ea: block: Start/end drain on correct AioContext (Hanna Reitz)
af5b6ebe5b: block-backend: Update ctx immediately after root (Hanna Reitz)
d5f8d79c2f: block: Make bdrv_child_get_parent_aio_context I/O (Hanna Reitz)
e56b0c6631: block/blkio: Set BlockDriver::has_variable_length to false (Alb=
erto Faria)
c785326522: qapi/block-core: Fix BlockdevOptionsNvmeIoUring @path descripti=
on (Alberto Faria)
7b5929c734: iotests/151: Test active requests on mirror start (Hanna Reitz)
38591290e7: iotests/151: Test that active mirror progresses (Hanna Reitz)
da93d5c84e: block/mirror: Fix NULL s->job in active writes (Hanna Reitz)
eb99491299: block/mirror: Drop mirror_wait_for_any_operation() (Hanna Reitz)
d69a879bdf: block/mirror: Do not wait for active writes (Hanna Reitz)
344b63b380: accel/tcg: Split out setjmp_gen_code (Richard Henderson)
35abb009b2: tcg: Move TCG_TARGET_HAS_direct_jump init to tb_gen_code (Richa=
rd Henderson)

