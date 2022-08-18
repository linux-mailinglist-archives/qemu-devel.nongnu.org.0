Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15073597E40
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 07:53:27 +0200 (CEST)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOYT8-0006um-2n
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 01:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oOYKB-0004fT-2V
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 01:44:11 -0400
Received: from mail-mw2nam10on2043.outbound.protection.outlook.com
 ([40.107.94.43]:55168 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oOYK8-0007kE-GJ
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 01:44:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkVsDSNAO1JNf5RVnFRXZezoHLCyD9KHMLK5Sm1Z9GU+4iHYXoGzn/xRuYPtjXs8DblgKkZ5s6qGBsLer+tWUGPTkVl8Y3GH/cuuriLuocQVAKeA5bgb6XCZQozYXKAb4cRFEGhSu1VJB43gBrseMZwhZbGUOOK7KTtFB2ocGmZpXRpO9IXelv9Yw2CEq6WNjQ7WTU3LUOtRt6HJsUK//sZ3gJFkGyJIVt6fhfas77qODbkXp9pF28HlCNpZOWd1OFA+JDoDRuY5Bf8lRiASbx3pl0NGQ8a7NOyJaF14At+Ai25W1Sd/tmKqX79SNG7FKjg3rJUIOgEm55zwzBo7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVHWIOo8hBxxxLDHob9TA4LiTjXlY0O+JlYPd9bagk0=;
 b=dzLLg/CD5q6I0Pnddr7IhXOo1RY2wq2A4Cds4v5g4900cYWTJDuhuanpwHOL+qgKtX4c0PYRGYa6stf0Kt/LuON97AeNJod1zNpJYLi1JORXYOA5W3IToi28ggPoyqhmY7iTONt554qg282WKYLQ8kjG7Yu0yQVjblF27JYESWCYUqVpSy5ej9tR14ScEfYs5t+rmEKK7a/RZ66IZ1VQDXmshAEQNzW5nxoURq0mpPBW7afdv2XdQYSTnx8UpJQtJjUgSNr4e7FTvIxyIY1KY+j29fsXBaapDUjrf7MKUHUF5WqI/g/vBwTaQhNSbMAquDo4qCZzScBldbOuZoa+mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVHWIOo8hBxxxLDHob9TA4LiTjXlY0O+JlYPd9bagk0=;
 b=YkgCIpqFOCSIvn+JeQnRmWswnGUpdxzWM38qZhz9HpS3hzdQQ9fJ4i508HIGkny1uSdxzVlNtFAul7ZeDbCNqM3nONW7GEebUFuW1hNIGUi6xKiY9c2fVF4EVyMenLCsQdB47PcjFTK6FBERA9aXvcZ9rp1bRF89QEDgU+xp9S0=
Received: from MW4PR04CA0075.namprd04.prod.outlook.com (2603:10b6:303:6b::20)
 by SJ1PR12MB6026.namprd12.prod.outlook.com (2603:10b6:a03:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 05:44:03 +0000
Received: from CO1NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::cd) by MW4PR04CA0075.outlook.office365.com
 (2603:10b6:303:6b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20 via Frontend
 Transport; Thu, 18 Aug 2022 05:44:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT102.mail.protection.outlook.com (10.13.175.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Thu, 18 Aug 2022 05:44:03 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 18 Aug
 2022 00:44:01 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.1.0-rc3 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>
Date: Thu, 18 Aug 2022 00:41:42 -0500
Message-ID: <166080130228.51240.14592723336710553557@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a4467cd-240b-46ad-5bbc-08da80dca8ad
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6026:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mfs9/RLSNeVSqyvQCPGvFyJM2fSHKE2SOFltnA5ecdOysdxi0t7pQigOH9tnjcX6rgddsXEvQOAtxBlo9ctCJn3eNUD3sdNnRL9VZwj6NiX93oAc2+VyREIxn0YwbjGey30KQLL1x2bXlCYY5xZ9VfgyU0r8qgk7sSyemaMXGs2/gOl4FJO/n3r1ovJ/LU7SpFemLMKgzsT3uWktnvDrOUkxV6ux6H5FkS2mTm8wK0ms6Bz8tFVUzHeEZBM/0QxMApEemP3vFFH720leZ+rdglioasdPkbWx2jOKWvzRLz8oMlPRjof+ZL2opIelCwKsgNi4CGy3TedRGuOEjdKWJFQXfvIGGTL+ro1fAoT6niSzfwhdIsB1CgIB6lokf10bYB1v7bvTdeJfX3xuGL5CmJmiABD9syv0/HM0Y3g9I8W++1PR6LtT8rrc6uIRfbsmb/eqAuspXWWGYqHDRCJh8oS2k1gkio+CyXVaz/wMHXphWy+KxhobiUsMovAMOsoj0EOo4ecXPZ0L8WkDTdTuSbnTTm4DnjMGyjX/j9ZSPy0m6xUaxvu4pqe+J33+/fOmzaNVgaIfkzvoXwKaACsezNE9Li/BMyImWB0B/B5poIxua2ZwbmvoYZsDdkzrcsBVSyexJGgvht8cVVM3vYVz9uKSXyMr4iVFDfPo76qWgC20JlfY8IFXLm1m0YZkPCbUum+f0uqh0zItK6oJCtpQEWwG7jA0xvHSTHToVne/z1ymyhsIYXnPYohzpvpYtOszNRVdx/QVvd/X1A4UnqVfgYjXlNiQOLE05x50ZS/E5AoMQfPfui2nWXei5jep/ES26D9aS0oTje/fYAz2IA1RsYkPgC0ca3hbNSgMTp8nd1YlmWbKCFGg9Q+vY7ZHdHK1
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966006)(36840700001)(40470700004)(40460700003)(16526019)(336012)(426003)(478600001)(966005)(186003)(66574015)(47076005)(5660300002)(36756003)(83380400001)(6916009)(8936002)(86362001)(40480700001)(36860700001)(356005)(26005)(41300700001)(316002)(4326008)(8676002)(81166007)(70586007)(2906002)(6666004)(70206006)(44832011)(2616005)(82310400005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 05:44:03.3534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4467cd-240b-46ad-5bbc-08da80dca8ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6026
Received-SPF: softfail client-ip=40.107.94.43;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
fourth release candidate for the QEMU 7.1 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.1.0-rc3.tar.xz
  http://download.qemu-project.org/qemu-7.1.0-rc3.tar.xz.sig

You can help improve the quality of the QEMU 7.1 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.1

Please add entries to the ChangeLog for the 7.1 release below:

  http://wiki.qemu.org/ChangeLog/7.1

Thank you to everyone involved!

Changes since rc2:

c7208a6e0d: Update version for v7.1.0-rc3 release (Richard Henderson)
effaf5a240: hw/usb/hcd-xhci: Fix unbounded loop in xhci_ring_chain_length()=
 (CVE-2020-14394) (Thomas Huth)
9c23d71934: tests/qtest: misc tweaks to readconfig (Daniel P. Berrang=C3=A9)
65711f9a87: tests/avocado: apply a band aid to aspeed-evb login (Alex Benn=
=C3=A9e)
b1ceae2f5b: tests/avocado: add timeout to the aspeed tests (Alex Benn=C3=A9=
e)
52f0c16076: linux-user: un-parent OBJECT(cpu) when closing thread (Alex Ben=
n=C3=A9e)
1f90ce64fc: docs/system/loongarch: Update the LoongArch document (Xiaojuan =
Yang)
4311682ea8: cutils: Add missing dyld(3) include on macOS (Philippe Mathieu-=
Daud=C3=A9)
e1f045780b: hw/arm/virt-acpi-build: Present the GICR structure properly for=
 GICv4 (Zenghui Yu)
6a54ac2a97: tests/unit: fix a -Wformat-truncation warning (Marc-Andr=C3=A9 =
Lureau)
120f765e03: Fix some typos in documentation (most of them found by codespel=
l) (Stefan Weil)
2daf518dd1: target/arm: Don't report Statistical Profiling Extension in ID =
registers (Peter Maydell)
dbbf89751b: linux-user/aarch64: Reset target data on MADV_DONTNEED (Vitaly =
Buka)
3cd3df2a95: linux-user: fix compat with glibc >=3D 2.36 sys/mount.h (Daniel=
 P. Berrang=C3=A9)

