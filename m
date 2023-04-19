Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE446E8408
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 23:58:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppFni-0004uq-TQ; Wed, 19 Apr 2023 17:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1ppFng-0004uc-Jz
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 17:57:16 -0400
Received: from mail-co1nam11on2040.outbound.protection.outlook.com
 ([40.107.220.40] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1ppFnX-0008Eb-2T
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 17:57:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzv2LvXkaZ8kAK61w/hjS6JsNSsqCCH3m+4LIIqel5Z5ri5NEpSmerAOdxT3ABo2s4j41tFynzgGqQDFn2tKmVCnVihalH8eS/qpL+vupmD6M68wd7FATHAOvhfTXB0n0nbq+bSeZZdoNgEpkccw4E1yIcQmOGOaCduS2zWWLoaUC4DWVcdb1R0yeAba3DFnEozTUsnm4ebwRgVsfHyyHOWw0HoJvMvMZ7QbXiu0K+ilb6YxqMpRoD1mlCqL4YbLjwPW9Ve3jqfa4TocCOZMP4MDYctc8c4dO3FoKM8NtGXLTXz2O3yb/M/+9NH5dNLEW3fY9t6HpMtyRkD8RK0H2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SGbvXDEYBe6VkdiNGQgV/yRAqwqX592glUsydVA0Ug=;
 b=kF7+V9yeIvUrKsKL3BE8hXQsQGoYXYQOW34b+Pk+yPbc4bBy2i+SK4HFv275s6Kw69OoGpXZ83rLL4hxNa9KQH6Kok/lDNtSDdcKT12zbWLM7ZZRku/BukluEZYJ8QxIjaCPK0M/aHL0jTWfp63QoFdC/9qLlAJoiRG+oygib4Cc9sAgQtVyjJnpMnmQlJf5Sh7cw4OGlNZgwHNTtsG5ZkN/FS4hzfbCdBSX41A/fB48cKkiARvqtqpPyrV77FlMh38VaW5oC4aWBOeqtKQmUYXwTM/LCR4ZFF13oZRG26ESjXCJmk8c2KC8w+vEYRGnouyu/LOjcV9Rz9NGIXm4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SGbvXDEYBe6VkdiNGQgV/yRAqwqX592glUsydVA0Ug=;
 b=m+lG88KcIBlviZRmM4xgvWep35o0AGe6zRZgrollnmXQho3jH9ERpu245p5Pbzk3vDjINtGfQG7lmRlgqA5qK7l3mVljrngyjZhDVxWXik49o1S1ZK9ysPt6NPQbnQPN8unhqOjsopq5IPUo59Am1uIG4rFqLIO/mH+rERjSXwc=
Received: from MW4PR04CA0307.namprd04.prod.outlook.com (2603:10b6:303:82::12)
 by PH7PR12MB6667.namprd12.prod.outlook.com (2603:10b6:510:1a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 21:51:59 +0000
Received: from CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::1f) by MW4PR04CA0307.outlook.office365.com
 (2603:10b6:303:82::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Wed, 19 Apr 2023 21:51:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT094.mail.protection.outlook.com (10.13.174.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 21:51:58 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 16:51:57 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 8.0.0 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Apr 2023 16:51:42 -0500
Message-ID: <168194110278.291005.14002075882323684975@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT094:EE_|PH7PR12MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 49df93b7-7b31-475b-ac5e-08db41204ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xjPdaA8OUF+N9roxhhZwVJjlXpTF6nPmwZIaqZjUhYwD92LZ7EwaI7Qmh4kRlH9H94dZAdeImT4Zba1sDdeFym7BeYZL2F4CtC5zXydHGcod8NoQf1sINYarrkdq17hLX+HdfAXwCkQYhzrNp19JxFDcDyqOcFMUaRO6c8mV/kFDLkJ/g15SDaKyYDtV8dgAQFAqGzBeuztcDwuMP1v5Y++4Psp2ltNdSrwNArY+QJcHEpO3fDul3KijS7gE2CEiIFqPqa5PqXbi/8DX3qM5MksSFPab67YodDj4AfC015pdtYnjWjyXlt/djgkUt+YsZWVesHC8RpPjQl/N4TUUgC+qKcKumCeHZ1q4tb2giJx21faN+EzLCx0R7K6R4TZPB2M7p0cw+vvRtJl+VLixM0MDBUE9KCvDyzf8L819iRvPliVc4wlZCHSk3Uj9QjWoDzJSbHxe8s8R373Q9Cs0/uA7vG7sHKhQPwhaDMpzG4EK3nxAINTt8jGwrS4d1lphIUJWNEY1r7xFUtU/bQ7Y9j4JGH8K4VcDCXhnilOIcwHLQrWkHaC8LU4rf+sw25osPZUguEuSt9JZUAMpbHUpAq3txz7dPRvvW0xrLI969P4GImfnvR6pDsIqYLapKmgZ9awAL+IUzi71chWn/QpGGlvm/t1+KDVdjEvOYqfE/dc/U2iy5kQdqMYLp/arTGyqZ9BTqt73ULAHtUVV8Bomfso7atZsNj15T5eC7g/qvfLQs/h+UBMuDpfUvj5WIgF1X3Sb7pAL0iMBM4O3hVHDMw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(40470700004)(36840700001)(46966006)(4326008)(5660300002)(44832011)(86362001)(426003)(82310400005)(2616005)(336012)(83380400001)(966005)(47076005)(82740400003)(16526019)(186003)(26005)(356005)(81166007)(40480700001)(8676002)(36860700001)(8936002)(478600001)(316002)(6666004)(41300700001)(36756003)(40460700003)(70206006)(70586007)(6916009)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 21:51:58.6530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49df93b7-7b31-475b-ac5e-08db41204ce5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6667
Received-SPF: softfail client-ip=40.107.220.40;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
the QEMU 8.0.0 release. This release contains 2800+ commits from 238
authors.

A note from the maintainer (and the QEMU team in general):

  Thank you to everybody who contributed to this release,
  whether that was by writing code, reporting bugs, improving
  documentation, testing, or providing the project with
  CI resources. We couldn't do these without you!

You can grab the tarball from our download page here:

  https://www.qemu.org/download/#source

The full list of changes are available at:

  https://wiki.qemu.org/ChangeLog/8.0

Highlights include:

 * ARM: emulation support for FEAT_EVT, FEAT_FGT, and AArch32 ARMv8-R
 * ARM: CPU emulation for Cortex-A55 and Cortex-R52, and new Olimex
   STM32 H405 machine type
 * ARM: gdbstub support for M-profile system registers
 * HPPA: fid (Floating-Point Identify) instruction support and 32-bit
   emulation improvements
 * RISC-V: additional ISA and Extension support for smstateen, native
   debug icount trigger, cache-related PMU events in virtual mode,
   Zawrs/Svadu/T-Head/Zicond extensions, and ACPI support
 * RISC-V: updated machine support for OpenTitan, PolarFire, and
   OpenSBI
 * RISC-V: wide ranges of fixes covering PMP propagation for TLB,
   mret exceptions, uncompressed instructions, and other
   emulation/virtualization improvements
 * s390x: improved zPCI passthrough device handling
 * s390x: support for asynchronous teardown of memory of secure KVM
   guests during reboot
 * x86: support for Xen guests under KVM with Linux v5.12+
 * x86: new SapphireRapids CPU model
 * x86: TCG support for FSRM, FZRM, FSRS, and FSRC CPUID flags

 * virtio-mem: support for using preallocation in conjunction with live
   migration
 * VFIO: experimental migration support updated to v2 VFIO migration
   protocol
 * qemu-nbd: improved efficient over TCP and when using TLS

 * and lots more...

Thank you to everyone involved!

