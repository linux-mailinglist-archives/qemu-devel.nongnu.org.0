Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081295A7155
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 01:03:23 +0200 (CEST)
Received: from localhost ([::1]:36890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTAGP-0005Ik-I2
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 19:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oTADZ-0003gW-W2
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 19:00:26 -0400
Received: from mail-dm3nam02on20606.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::606]:61921
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oTADW-0004im-Gi
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 19:00:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YF+04AJhM30aziVJYEUhdSrc8N7D98k4Z4DPyUCuiPK4SPb9mB2SXDTBWByFdtDtXaFbtkzgiZr1rldairokPM75rAQzEqwEwktuysXf4HQUefF2Z/hYCdije+tNUz/IorquHZw9wKjRiTKOLQExXlNeKXLPzdqoeo3ixhKDi4MIEfqJZYy5OUtqKB94u4ToGB4CZ+Y66EsK1x9Zd7JylAcwvYZhMckqTXAxsrHhKclh4wn6kjj4hWPtu0RE9Ry19qtbn6sVq8GKm8uWKAMC0m9o/OQnahuGRi/o2H6QYVxbdWyk0sVfxXkxWOeOcV7AYjDUi2m+HE46urR+c9IO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ud/Kkta12kyN0gwkx2KmJ7JIv9jVZXLThYJSW39VPr8=;
 b=Eam61O0ApkLz/3l7iXBxOvuWZKhy30BelAwrlibjqWKOooFhB3kFEiY/IezP6pfVBjXYTobOH1MCNa/+VkeakNmwIOteTBxTfHLXatWham8z5mBQcsbhI5/l1kmMHo9sE4bUiroGX8aObQBXgQH5TIM6wafnqoTtJmy/5v6YhTfcmCmTdLvgo/loY0+vIMhxqTp81kihWTg9Q3TywuVpfXFOHtqqzUtNI9g7+G+HTuhki3OEMsZru1FBybahLuQuyMh/j4crKbYMR7MDjge4cT8WDg9HNjFdDJQL1AwfsMcAaz+74NAyLbyd1ItamimMEC0dRzeCcOXNaqO0fNBLTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ud/Kkta12kyN0gwkx2KmJ7JIv9jVZXLThYJSW39VPr8=;
 b=Ppq/9KsEYMJncp5yri/Alm6qvVLLSbYb8EOZiM1VGEMZWmWiy9zCDimLroUVWeLbUzc7GhH86Fsq1EIJGCLuKFJAj4P52Dz0BVvUVxaN5dvyg4WJoES/1bUT8Pf3SThIbaoSoPAQuUm/45wCyBSn1xqp1JWIoChfTnlDkmQJfKI=
Received: from MW4PR04CA0100.namprd04.prod.outlook.com (2603:10b6:303:83::15)
 by BL0PR12MB4900.namprd12.prod.outlook.com (2603:10b6:208:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 30 Aug
 2022 22:55:17 +0000
Received: from CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::6f) by MW4PR04CA0100.outlook.office365.com
 (2603:10b6:303:83::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16 via Frontend
 Transport; Tue, 30 Aug 2022 22:55:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT097.mail.protection.outlook.com (10.13.175.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Tue, 30 Aug 2022 22:55:16 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 30 Aug
 2022 17:55:15 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.1.0 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: Richard Henderson <richard.henderson@linaro.org>
Date: Tue, 30 Aug 2022 17:53:33 -0500
Message-ID: <166190001339.271991.6991052484622099743@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19ff494f-06c9-4127-a89f-08da8adab4d6
X-MS-TrafficTypeDiagnostic: BL0PR12MB4900:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIu5hjg5/6BdlOCVvwO+2z//FGN/vr3zA8HrI4FtAWqt3l8R88cBPfuxeHOXCL9HCQuyYkk2TOp8P6zrHFsIPZZnZ2zSsksXABQm6+YFWxDVYPS+lKmL17SnoGOND1rKql0wlbiRs8z60eSzwBpGspr6Qw/oAmcvnjB6pb+PtYvBt99iqN192sfD3+9NAwPw/qG36yQlr13JDT443wL2angUfKnEugxKcl/DjN/k1sa2lUldzCX35lmpKnQb+VKMjwTkvx4KjSkqnWWk3nojWjnDSwDjTHleDwauRKWuEjc43o9m80KLbJgQNy5gOindYLSEvyQc0lLXoW8QDNbXpXzEyV9HSzWidHBZvRH3rApAC4GWnyyZA4DKFjlG6kle8aMyXkm2y2JPFpmZrxp/rOdiwZ+oQIX+Bial7Jkz2oADNTH4r71YCm7frspnFdJJ1dfDT626SkqJqR8zJqN1d9iFNeOYmhxZ8qIggANAgDpwDFlXH/hndkQgK23w0KE4btE4B9r0/I/HBlUumxFi8SKbr+Z55GnC/lJKRNuHomaoWLMoL540eLZVjD7HboCNPUNmpanX6mAHqq2j3G2UsKts7cppbZSaxvXo9/ZJRGvYJQhcUrrjm6i9eS/LxyZNcsFD8xa45P2KG7vhCRTTljpuKFvWds04DYf4pOyoaAI7YzIFxsE2W1aVQQ1OCeboZuXZsBw25mQJiHwmTnrUzS74AsnVZf6QMv7ISqoObBhk5TCk3txcXMrSBJIiocsRU/zGuKTE4R7K3LQvjrh4wBAzt5XKnu+zGuRrBactoHb0e+wGy5AE6iyQ5rjLsC+E7WeNpkb6KO2knMzPgKQJzg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(40470700004)(46966006)(36840700001)(4326008)(966005)(8676002)(83380400001)(70586007)(316002)(478600001)(6916009)(82310400005)(40480700001)(5660300002)(8936002)(2906002)(81166007)(44832011)(356005)(40460700003)(70206006)(82740400003)(86362001)(36756003)(16526019)(26005)(336012)(426003)(47076005)(186003)(6666004)(2616005)(36860700001)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 22:55:16.5317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ff494f-06c9-4127-a89f-08da8adab4d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4900
Received-SPF: softfail client-ip=2a01:111:f400:7e83::606;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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

On behalf of the QEMU Team, I'd like to announce the availability of
the QEMU 7.1.0 release. This release contains 2800+ commits from 238
authors.

You can grab the tarball from our download page here:

  https://www.qemu.org/download/#source

The full list of changes are available at:

  https://wiki.qemu.org/ChangeLog/7.1

Highlights include:

 * Live migration: support for zero-copy-send on Linux
 * QMP: new options for exporting NBD images with dirty bitmaps via
   'block-export-add' command
 * QMP: new 'query-stats' and 'query-stats-schema' commands for
   retrieving statistics from various QEMU subsystems
 * QEMU guest agent: improved Solaris support, new commands
   'guest-get-diskstats'/'guest-get-cpustats', 'guest-get-disks' now
   reports NVMe SMART information, and 'guest-get-fsinfo' now reports
   NVMe bus-type

 * ARM: emulation support for new machine types: Aspeed AST1030 SoC,
   Qaulcomm, and fby35 (AST2600 / AST1030)
 * ARM: emulation support for Cortex-A76 and Neoverse-N1 CPUs
 * ARM: emulation support for Scalable Matrix Extensions, cache
   speculation control, RAS, and many other CPU extensions
 * ARM: 'virt' board now supports emulation of GICv4.0
 * HPPA: new SeaBIOS v6 firmware with support for PS/2 keyboard in
   boot menu when running with GTK UI, improved serial port emulation,
   and additional STI text fonts
 * LoongArch: initial support for LoongArch64 architecture, Loongson
   3A5000 multiprocessor SoC, and the Loongson 7A1000 host bridge
 * MIPS: Nios2 board (-machine 10m50-ghrd) now support Vectored
   Interrupt Controller, shadow register sets, and improved exception
   handling
 * OpenRISC: 'or1k-sim' machine now support 4 16550A UART serial devices
   instead of 1
 * RISC-V: new ISA extensions with support for privileged spec version
   1.12.0, software access to MIP SEIP, Sdtrig extension, vector
   extension improvements, native debug, PMU improvements, and many
   other features and miscellaneous fixes/improvements
 * RISC-V: 'virt' board now supports TPM
 * RISC-V: 'OpenTitan' board now supports Ibex SPI
 * s390x: emulation support for s390x Vector-Enhancements Facility 2
 * s390x: s390-ccw BIOS now supports booting from drives with non-512
   sector sizes
 * x86: virtualization support for architectural LBRs
 * Xtensa: support for lx106 core and cache testing opcodes

 * and lots more...

Thank you to everyone involved!

