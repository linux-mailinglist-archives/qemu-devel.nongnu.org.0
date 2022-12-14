Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0C564D3ED
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 00:53:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5bY4-0006uV-MU; Wed, 14 Dec 2022 18:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1p5bY2-0006uN-OE
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 18:52:26 -0500
Received: from mail-bn7nam10on20617.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::617]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1p5bXv-0007qR-5B
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 18:52:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rw6ASa8N8mWMG0GYZtHOv6ojO0rBSmCWoLNdu7kMEfGhbXkJ5XCMDglsf2mqEGxgMIoiu303fSZm7rmId53Ce6ZeJ83kPnhAMy5oIjhR1SF24jyJZdvfS5ZBZ5wIpBmUsYhCo5hYUX5MZn2fA4TIuxgsmQVkAiAHghCSQ+Umin1Q1PoR4N5fJzEN+Guw9xeJxQpsGMBDTS0MzGAIyKYYGrZoUHYiK/g0hPZBc7aaqdM3I3DXR+wYSOUozhaxgnzV6dSCz5xhZPnRirPt/P75dDA7XkXb9+pLcrHv4PjSOfJ9X4nbO0MR0m0ZNUYOiWM8NaY+Dr6uk+j8rqUo6TlZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWhZANeDkm802Fl/6isuEb8Zrdd1DaKJJ5x/Az/UNYM=;
 b=HShS1cq4QAR9/IbuPtyTbM6rzPrWjkf/neNY5SznbgqW7I00kLkpNkOhizEe+rTguaDokYIAHSqKj7Tdv0anZ6eX4/o7bYEImBxPyftTbX95A7kv8R9ds1OZDEbKsUFZgU7hvTxJE4f5oy6qGXauc1ZhJ2cTtU9JE06DzkLmBLKoAtmZm0VlUPLopnzdEi4xyGpWT2TBLLnZkPo5YFuBXzH+v9t+oPxGUlYX+hcat2GdKiwMa4gzKYoM7z9Mfh9nOc+5lwhQK9lLYmuLY0h7O+dkJ67G9WFxEN/D2i/SBry40CoZq5upIky971RlH3Jo13SSqFbCaPUD1s1YPDQ4/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWhZANeDkm802Fl/6isuEb8Zrdd1DaKJJ5x/Az/UNYM=;
 b=Dh6UBw6SI7lzMP7438vUFrscGEWtLRYL41uQa7rnwe291lcAYyapEzHu2Y6/3lDfsV0MbKBm6hPyKUpSZE/4YWiuocC851akGDWEWxsggRrxOXF0VXgO0gtBlm8Zl+G96LBQmkQl2bV7ayn4jbQg7qlm2QcGBwOlXYLsCGfV98U=
Received: from MW4PR03CA0332.namprd03.prod.outlook.com (2603:10b6:303:dc::7)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 23:47:11 +0000
Received: from CO1NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::a7) by MW4PR03CA0332.outlook.office365.com
 (2603:10b6:303:dc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11 via Frontend
 Transport; Wed, 14 Dec 2022 23:47:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT091.mail.protection.outlook.com (10.13.175.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.11 via Frontend Transport; Wed, 14 Dec 2022 23:47:10 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 14 Dec
 2022 17:47:09 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.2.0 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: Stefan Hajnoczi <stefanha@redhat.com>
Date: Wed, 14 Dec 2022 17:46:51 -0600
Message-ID: <167106161123.176663.16352407323159962211@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT091:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: 69bab34e-7b94-4ddb-8a75-08dade2d849b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CFyi5qZVTHa4LrmzxnPlgojqK5wzK2Jg4zqPBe0RMKMioNJ6UrZV+EGSFh8uKICnG1Ire78aoQhwvuFSo21wAeJh1UOU8lAXmZEmH5HRwhWTghxg2LMGHGORjk93U+UBi8MixI/9CIkft9osJpwOvaS1+dEs0iDLDIJk1KrL9BwRQcU7C5E7sA0Qidlu1XrAJQOjRmfVyyOS7ske6n/RR+VMwj22kcq4E/EZKitT05l29j4Hk1yPoUt3uR+sxlu6uTfeHlIKmqcX55u+3Js6OONosBPje91LEHWP68Eb8VhJr1IpmfPuE0/LHTiS/AeSlYbIVbHecDHNzgAhO/oJNG1pPVR3DSIX5m5xcTDtJbXL6M1o2SdwCmkINp/YTmvqj0iWdV1B+QGSzw/4ei8J6HkXTIcaW/1pj+1YV3qVksFXjSZhkMSElekVqDC7LGcQja6krXmNEKpkbu7rPL0K4TM1Ik8WZ9VCuq3ai4eqcct3vz1B+Ptq5BfqLUWg3YcQjlBatbMex0VZhhjU6jy3/hM273HgW2LviSCOSKiDJhQBkMyPw0WnX5YielPA8OYWQH1MkO1W+vSNSSvMjxwIylCWMHH+b0v71rzpILHDb2KzaxmozICMzDp56TR4lQ1CXN6OmdaELYkRkKRsrS4jkBphRmjOtQyCQuvwiEZEGmtzoMyH+mR08Co4tC14XExRLPMNxSuEa2RWlYPA54u9UF7OU+KezPuBgCtDMamCJbNvB5q0gSgbaHmYWQqxE+3INf7RhttrZCIGvQzlE2uyDw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(82310400005)(47076005)(426003)(2906002)(86362001)(6666004)(70586007)(5660300002)(36860700001)(41300700001)(8936002)(83380400001)(4326008)(316002)(6916009)(70206006)(8676002)(40480700001)(186003)(81166007)(44832011)(336012)(82740400003)(2616005)(26005)(16526019)(40460700003)(356005)(966005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 23:47:10.4620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bab34e-7b94-4ddb-8a75-08dade2d849b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::617;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

On behalf of the QEMU Team, I'd like to announce the availability of
the QEMU 7.2.0 release. This release contains 1800+ commits from 205
authors.

You can grab the tarball from our download page here:

  https://www.qemu.org/download/#source

The full list of changes are available at:

  https://wiki.qemu.org/ChangeLog/7.2

Highlights include:

 * ARM: emulation support for the following CPU features: Enhanced
   Translation Synchronization, PMU Extensions v3.5, Guest Translation
   Granule size, Hardware management of access flag/dirty bit state,
   and Preventing EL0 access to halves of address maps
 * ARM: emulation support for Cortex-A35 CPUs
 * LoongArch: support for fw_cfg DMA functionality, memory hotplug,
   and TPM device emulation
 * OpenRISC: support for multi-threaded TCG, stability improvements,
   and new 'virt' machine type for CI/device testing.
 * RISC-V: 'virt' machine support for booting S-mode firmware from
   pflash, and general device tree improvements
 * s390x: support for Message-Security-Assist Extension 5 (RNG via
   PRNO instruction), SHA-512 via KIMD/KLMD instructions, and
   enhanced zPCI interpretation support for KVM guests
 * x86: TCG performance improvements, including SSE
 * x86: TCG support for AVX, AVX2, F16C, FMA3, and VAES instructions
 * x86: KVM support for "notify vmexit" mechanism to prevent
   processor bugs from hanging whole system

 * LUKS block device headers are validated more strictly, creating
   LUKS images is supported on macOS
 * Memory backends now support NUMA-awareness when preallocating
   memory

 * and lots more...

Thank you to everyone involved!

