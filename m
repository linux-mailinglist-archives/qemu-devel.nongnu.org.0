Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C45507CB8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 00:44:53 +0200 (CEST)
Received: from localhost ([::1]:49140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngwaa-0003Cf-C6
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 18:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1ngwYJ-0002OF-8g
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:42:33 -0400
Received: from mail-mw2nam10on2078.outbound.protection.outlook.com
 ([40.107.94.78]:2535 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1ngwYG-0003KD-LP
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:42:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guYXRRZ9kkicPOXJzHQVnW4/Uk63PU2/bG1XTzxoz48cXWQdBvkBRPReNcd1YtD0dA80VeS9ZfQUIeXDvYAQYHHgcRDB/QK8Q7zoj1M7IFjJQyTyoM03a/SeTY5VtjdrRLbVVw37zWV2FjTlgsTde52ipt9BptB3B3q6Z9ewhMa/dSy/7vHgD5j69rxWLEeCQLlX3NuZZGTTUqv0KwBFIGBeEuPzbbUHZih0cvTeQtOiYe65ztZXEzGO6vzJj8B+Mm+wp5kEYb56g8xwmakK7IzxD9903U3JXn0EZUrhdGu0Tprv8DwcYZrYZ38VrbcLuKZnudiruyRmQXPwDkUtnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONqAY7/07fLM4xZhyc/UiUnu90STLemiuskEt64lRFY=;
 b=fF67sLr/TJPx4ScLDB8AatHufCwlI3cyVoUimWYO9WGpO85AQVacszqbZ+SH61o5Aey9uA9WddAsOSuoXvcs8rLtJbrM4wbRnEgTbzsdHnWXgLQYEJUyDsq70vO/D+y7hwkH/fR4TQug7qJ4YP1GKs5Sw0KbuE+/YOtVTr2YCu0R9kvNhIldxhyLK4qLoMghqS+I+0jqUXG5k3Wo1rZCkoJJ0J6hy+6MEgWPP4ggD6KDZKbMe1mnwwt3KId5keIt3+gpDRuwaaMulTiyyn6Xlq7gPk33Oz8ywCBE3TRxZtKKbqIvO+8GTCCCmQL5Ox09dLDFDgtg1RkU2Ou+JgHPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONqAY7/07fLM4xZhyc/UiUnu90STLemiuskEt64lRFY=;
 b=wOQLo9uNfUFoYPmQS/1O23+wOzxNu802DFLtPvQ4ZdIxDihvo7MUBoqv8r6bX8tcHeFoB8Ymb4/0hRMFBKprovLf/oZJw2GWtKqW+T2cN+pi8ETjcMfXzdyg+VS4W45PHiuVXACMhYgmQtNfXQUL875926OzAWiyQW0edvmpUTM=
Received: from BN1PR13CA0022.namprd13.prod.outlook.com (2603:10b6:408:e2::27)
 by BYAPR12MB3607.namprd12.prod.outlook.com (2603:10b6:a03:dd::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 22:37:21 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::9b) by BN1PR13CA0022.outlook.office365.com
 (2603:10b6:408:e2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Tue, 19 Apr 2022 22:37:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Tue, 19 Apr 2022 22:37:20 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 19 Apr
 2022 17:37:19 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.0.0 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Apr 2022 17:37:01 -0500
Message-ID: <165040782187.31569.305804975297186026@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 077f8bf2-88fe-478c-ee3f-08da22552a43
X-MS-TrafficTypeDiagnostic: BYAPR12MB3607:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3607D0F1F7F3F0D552912B6C95F29@BYAPR12MB3607.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eCIOZhfjY4yRBlAUnkG2GWnoCAxwMTNDrZjflg181iws/jfUqzN8Xe2c53aQk+ON8daSbNMiGSc3fQcb1Zg6/v5Csayar9WLEjNprrTTi0gW1a89yGYSiMMxUbovKSjYWYMObs6iDw+o+Zgzc7NKMu2PzNcHfOIVRF15MhjVdoenLibqUUkSo56CG2Vf7IsiAspf/W+S2IFl5tTHllShy+R80Xl1qbqXr1holtZDf+s/tQMoblkm35jT735ldzsu4PeKFyEvpZu+QGdjGKXwYuYV3oCiHeIb2EeQShg2wKvyIHyBD/nvP4elhiWhIM9UqY6zDbRQhE50qXk75SWyN5preqv6OQfIzfcA4KrT5xM7OX5OpBCVvl/nztFHnLaDx6so4a26KX5YQng/vhMJXa8biJJ7sNuhwEaBFDzknPdyuNh/CQQ/LRn9yelkMkGq46t61YhhK8awY7VjUV+zORlL6ihFB8l74F8gVG5n1dzfX845UoDEGnyvbunZjXZVKtYOGxp52tHrb6UeghihczEFXD5bmZapMG1zV4v78gC7aLJemzEWFqJ6oOzPBlByYyHQCi2yW6CSUbQ9FqmIX2Nx6WPUxciPqdJ01Ykk8yOv6YFuQ+Z2dVC9Fi1vM+yHip7INvmcio2VofXvIi2eRSMALvkuok7GVOxcAjeZOALNy35VB28HDNFzd6DfSYbC3ptwzfMVgGxWY0l/MHEebPrqq0J0rJe8r5qnEkinf8jW4xm9wGM6pMNoiN4wgDUiDkve/kMILu5BHsazjSG/QNVBTKxS3Lxt7jWNXRveJs0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(4326008)(70206006)(966005)(47076005)(6666004)(5660300002)(44832011)(8936002)(83380400001)(8676002)(2906002)(36756003)(40460700003)(186003)(16526019)(26005)(2616005)(426003)(336012)(6916009)(36860700001)(70586007)(81166007)(316002)(508600001)(356005)(82310400005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 22:37:20.2537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 077f8bf2-88fe-478c-ee3f-08da22552a43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3607
Received-SPF: softfail client-ip=40.107.94.78;
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

On behalf of the QEMU Team, I'd like to announce the availability of
the QEMU 7.0.0 release. This release contains 2500+ commits from 225
authors.

You can grab the tarball from our download page here:

  https://www.qemu.org/download/#source

The full list of changes are available at:

  https://wiki.qemu.org/ChangeLog/7.0

Highlights include:

 * ACPI: support for logging guest events via ACPI ERST interface
 * virtiofs: improved security label support
 * block: improved flexibility for fleecing backups, including support
   for non-qcow2 images

 * ARM: 'virt' board support for virtio-mem-pci, specifying guest CPU
   topology, and enabling PAuth when using KVM/hvf
 * ARM: 'xlnx-versal-virt' board support for PMC SLCR and emulating the
   OSPI flash memory controller
 * ARM: 'xlnx-zynqmp' now models the CRF and APU control
 * HPPA: support for up to 16 vCPUs, improved graphics driver for HP-UX
   VDE/CDE environments, setting SCSI boot order, and a number of other
   new features
 * OpenRISC: 'sim' board support for up to 4 cores, loading an external
   initrd image, and automatically generating a device tree for the boot
   kernel
 * PowerPC: 'pseries' emulation support for running guests as a nested
   KVM hypervisor, and new support for spapr-nvdimm device
 * PowerPC: 'powernv' emulation improvements for XIVE and PHB 3/4, and
   new support for XIVE2 and PHB5
 * RISC-V: support for KVM
 * RISC-V: support for ratified 1.0 Vector extension, as well as Zve64f,
   Zve32f, Zfhmin, Zfh, zfinx, zdinx, and zhinx{min} extensions.
 * RISC-V: 'spike' machine support for OpenSBI binary loading
 * RISC-V: 'virt' machine support for 32 cores, and AIA support.
 * s390x: support for "Miscellaneous-Instruction-Extensions Facility 3"
   (a z15 extension)
 * x86: Support for Intel AMX

 * and lots more...

Thank you to everyone involved!

