Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DB64652C9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 17:32:24 +0100 (CET)
Received: from localhost ([::1]:53088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msSWs-0004r4-Nw
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 11:32:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1msSVi-00045g-CT
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 11:31:11 -0500
Received: from mail-mw2nam10on2072.outbound.protection.outlook.com
 ([40.107.94.72]:60320 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1msSVW-0008Jm-Pf
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 11:31:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irYPWc1NVVMYHtZzvAk9M1m+2F8ULpMqU0Si3cFenJxLYddrFmPRov5yFiTooq0wKqWYFumJ9XxYb/elYuhjaGGbyF92gDah/1Esxd92P2I8T6XdnZ96J0g4NK7GxgDqgiNFXsCxIXfhwsw3y0DqL9Wi+s02o5OeFF6S2l8/6q5AKjoc39tid+ozN/I33JApvy2CTDJcfPGQ/a4IANsKe1b6UyVz44UieFuFO0DHX5nh81VSX/EZ/6Uvs6486qiaMQTphU8ikBboG6mOxyHx29F8zNXbKINT++PEzpTO62xZoAgHjri0m7Eap6RpW33VI/EBLWEnm5Z2iS+6ArBRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUm1Cr69Q4CfLaHQOniuR13WIQegwRsVIE9CoyCSiFQ=;
 b=gYyHENgz+zILfgzlLAEJYD9qJIC0AdLw7FfnesWHo1S5IRp94E4+lQcrw8E6H4IzNEQiSmJbhdjZ4NJiGb2nN9PZZQsOUAs2PTBOVnVbah1l4KekMgZcXotivRZiM1PGYdATCC8wSdzpmU82QKtWPS01JhhRLfom7mDRBoSWdECYbi5evEcpuYshBuORkCca7fTcXjm0SKOZPgqYpqI3RjkgZS4x5OSQlokirgYr358zG6nsNAZ78HhXxj4Z8mTngRfujkakGNgF8ehx/O8TNxqPlvORhfSutYxkrhCo8vl+ErJi6VkpkhEhA2hfZHBQlWoK5mFdGV9b30i8t0XWcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUm1Cr69Q4CfLaHQOniuR13WIQegwRsVIE9CoyCSiFQ=;
 b=A0wrx0iCoP4d2P+SNtfB5wwgokXULhmBCuzCTKlWNIMLNteuh8Ld60fhj89m8DVVZcTDF/+g/Rtpy/Xq/KvotdfNvPno/905YCfP8izVXsqL+OmJ433hWvAqR1KbPM3MhpB9gfL3Qusf/eo943nhv2CtL/+WlVib4CCo2o9yfmU=
Received: from MWHPR20CA0037.namprd20.prod.outlook.com (2603:10b6:300:ed::23)
 by DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 16:10:03 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ed:cafe::ba) by MWHPR20CA0037.outlook.office365.com
 (2603:10b6:300:ed::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24 via Frontend
 Transport; Wed, 1 Dec 2021 16:10:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 16:10:02 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 1 Dec
 2021 10:09:53 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.2.0-rc3 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>
Date: Wed, 1 Dec 2021 10:09:37 -0600
Message-ID: <163837497742.9170.14519924423747345705@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0b5a27b-a8dd-406f-bf26-08d9b4e5087f
X-MS-TrafficTypeDiagnostic: DM6PR12MB4388:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4388653E88E28CD93744C9BC95689@DM6PR12MB4388.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yajLPrMuVSq4epJRHoNhn8J+8iwf1ZP7zUHqmrJdll1WvshAop721zDgZNpIT+buNWdGyP8WI/sWK4PLuSCz9uxbXgCA84oqkLimqr9KCldidFZbi1XDOVvZ7/5S4fe9VXoOORvbS6kuTvheueHEYX2Q5g6/RVCeK1BajKiLIsrddY7FfRfmeKNKv3Gq1N7z+fDtlI0oYRnJTlz6hBQZAruwnLVaWVE+8xWCURcnp9c83CPLvTjGzRvXHiDrf8spFQdsfbbo0Rkw2owSJCP+7RGBdCs5kAUNuvUSk+XOKtDt1sSg/11DZ77yZ9friDH1cQCUfGHauMAkPMdVyyMhwXXs7sxFq+RVrmJZnS2sTSVBFF7/jGsmDmgSaARu5aPewXLRE4hW4di2/6G2Pd4MkLxF1vEBYrO0VfUL67QedXY0i8taoh9kDm6eJ/sebaouWvFryEpClDHQs5mK7NiOOCkRj7ZCUP8WAVgpZn5RzEgBUz3BySH4JGBnjv9kg3JOuEjO/fRvWx1umv/wOHXkkLEAS5r68CtjUTcfM5cW81vIz6dUzg2dunlk43o9bVV3qDMW0O48j1rkY6KnV4u6d9H8Zh2PO2GgCIRGOsnbHCFpQ5omPckP0668IIoGFTNHj66ODFhHFCT3IIZdru2/JP7nUV6WFS2tmHVpD5mBKpMNM9Vp4WjrwzHAq9o8x/b2Yx4qXlT8m/NxKY+iYXXNvXzce5U/aEbHlooyBLuLVnxHhfJDeMdJjk4tYd+TBt+BRyfJ7ACqUD3HG2L6p0t2adMR5FYXmkpesojjRTHMppbz7/P+JSxZzcVuF3x4QRDfZZZILMf/5IqPuwTIoydrsYNBtr4n8A8fVFiP+XHVvCFq4izQWLhi9PSluXsAZ4SLzLsxsrzVz+95qno6SXjnI8fOthovSAVfw9Tkf1Z+8PY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(82310400004)(26005)(6916009)(40460700001)(44832011)(356005)(83380400001)(81166007)(36756003)(4326008)(2906002)(336012)(86362001)(966005)(16526019)(186003)(426003)(47076005)(8676002)(6666004)(508600001)(5660300002)(70586007)(8936002)(36860700001)(316002)(2616005)(70206006)(66574015)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 16:10:02.9923 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b5a27b-a8dd-406f-bf26-08d9b4e5087f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4388
Received-SPF: softfail client-ip=40.107.94.72;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
fourth release candidate for the QEMU 6.2 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.2.0-rc3.tar.xz
  http://download.qemu-project.org/qemu-6.2.0-rc3.tar.xz.sig

You can help improve the quality of the QEMU 6.2 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.2

Please add entries to the ChangeLog for the 6.2 release below:

  http://wiki.qemu.org/ChangeLog/6.2

Thank you to everyone involved!

Changes since rc2:

682aa69b1f: Update version for v6.2.0-rc3 release (Richard Henderson)
24c4cd1311: MAINTAINERS: Change my email address (Eduardo Habkost)
7bf00dfb51: target/ppc: fix Hash64 MMU update of PTE bit R (Leandro Lupori)
d5615bbf91: tests/plugin/syscall.c: fix compiler warnings (Juro Bystricky)
1e970158be: MAINTAINERS: Add section for Aarch64 GitLab custom runner (Phil=
ippe Mathieu-Daud=C3=A9)
40525be5cb: MAINTAINERS: Remove me as a reviewer for the build and test/avo=
cado (Willian Rampazzo)
a8e537fa4d: gdbstub: handle a potentially racing TaskState (Alex Benn=C3=A9=
e)
86a41ac7fd: plugins/meson.build: fix linker issue with weird paths (Alex Be=
nn=C3=A9e)
a7c6e562e6: tests/avocado: fix tcg_plugin mem access count test (Alex Benn=
=C3=A9e)
aff0e204cb: accel/tcg: suppress IRQ check for special TBs (Alex Benn=C3=A9e)
48e14066ac: accel/tcg: introduce CF_NOIRQ (Alex Benn=C3=A9e)
0a761ce303: linux-user: implement more loop ioctls (Andreas Schwab)
bacf58ca18: Fix bad overflow check in hw/pci/pcie.c (Daniella Lee)
0192d6677c: intel-iommu: ignore leaf SNP bit in scalable mode (Jason Wang)
d3f1f940eb: virtio-balloon: correct used length (Jason Wang)
0fe7245d8b: virtio-balloon: process all in sgs for free_page_vq (Jason Wang)
90feffad2a: hw/intc/arm_gicv3: fix handling of LPIs in list registers (Pete=
r Maydell)
846a1e85da: vdpa: Add dummy receive callback (Eugenio P=C3=A9rez)
9323f892b3: failover: fix unplug pending detection (Laurent Vivier)
7abba7c638: virtio-mmio : fix the crash in the vm shutdown (Cindy Lu)
b74d7c0e50: hw/intc/arm_gicv3: Add new gicv3_intid_is_special() function (P=
eter Maydell)
101f27f3c8: hw/intc/arm_gicv3: Update cached state after LPI state changes =
(Peter Maydell)
2f459cd1a8: hw/intc: cannot clear GICv3 ITS CTLR[Enabled] bit (Shashi Malle=
la)
bede01170e: hw/arm/virt: Extend nested and mte checks to hvf (Alexander Gra=
f)
dd4b0de459: Fix version for v6.2.0-rc2 release (Richard Henderson)

