Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69905474E34
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 23:51:34 +0100 (CET)
Received: from localhost ([::1]:37014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxGdx-0001os-1X
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 17:51:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxGcJ-00013i-Bo
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 17:49:51 -0500
Received: from mail-co1nam11on2088.outbound.protection.outlook.com
 ([40.107.220.88]:9217 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxGcE-0004YU-FV
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 17:49:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyT//G/lyIPX6zjNjHjVwFeol/e3AFcUX3v4xOZiJL1/VuIaji7WEWo641ypBx+ij1q4cZOOZssni9gwARKfZBreRYMCnXuvnfYSTRlG5woh0wx3HCqKCwIxQcTO8MOBrB+d3WYOhy7lBttm7iMUeu/h0HwaUcUghmdMtj8OrE7SrzJmepTsLt+ngKrAX3fpkkJzwNnhoGj9RbZNmgttacXRBMFzHfaaT+4Q/RAhwZxb94lG4XWwpYLbrEXGGhywiTOCvMi3vw2NSgcqueAsorjiyrzvcs5jqM475ZSWyoqJ14dlFEwrOpWYSORoXDSnIl9eLNDi+g8q8rWtkwsjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJcXLGLgzAc5RFZ+B8Rm8y5R9ZojSbo22pLKbJec2DU=;
 b=Y1lqxE1sehvgYdGuK2oa7hWoezfxu0JdY+mpuhAPzQvcSn/A8aTfD8kypxzs6U4koO+XQQEVT2dK+FsoFfFb5WyCX13JALR3km19xfqXOS3tdTobe1t8FJAxMX6/0L1G6r58xbtPcNRrO89qvxaohT/qHFlwHfBvzpuKM/PCFHpYvLJWAPvMA2nzvszUOOcqU/TUmB6biQFh6CCFg48nE5gPasfv9DlG4qf4zuotItO+E3BIFgETwcupX1qYxMWQNhhcwgyRmUDh9FrJS7Rd+CJ5Y5KwMlBxvncdWs1MZa8TlCydW7RHW4yTlWm78PGHO00mFKuaXRM6nVryX19mMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJcXLGLgzAc5RFZ+B8Rm8y5R9ZojSbo22pLKbJec2DU=;
 b=F0LMcsjNb4DbTieQDsYx9P9O8aE2v2dtjXLdGoHjzpAYN98nrn/EcoUVIEsiOuM5BF+oQeIykdSXODstX8qNMsUoMCa1CrB06WDhrE8K4F0pLXGKfVoHDGSs0OHNNSTr3EtA+yjddI9yGTlhTrvelnJGgOo3zvjHupAsX48wMzU=
Received: from MW4P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::29)
 by MN2PR12MB2942.namprd12.prod.outlook.com (2603:10b6:208:108::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 22:29:08 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::42) by MW4P221CA0024.outlook.office365.com
 (2603:10b6:303:8b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Tue, 14 Dec 2021 22:29:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Tue, 14 Dec 2021 22:29:07 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 16:29:03 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.2.0 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: Richard Henderson <richard.henderson@linaro.org>
Date: Tue, 14 Dec 2021 16:28:25 -0600
Message-ID: <163952090545.371760.18068992651045494184@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b4a9e49-1700-4176-8a31-08d9bf51249a
X-MS-TrafficTypeDiagnostic: MN2PR12MB2942:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB2942D189641ABBC2DC59678E95759@MN2PR12MB2942.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sNMu9EZJ+OM4UG693S4q74WZV8QTFsCPNBQwEJBz/awehmZX/StvlbkDCaZoLZk+miv46xhpJpRCyRXou5ZFaaEvQcNmIpjV+lQPPn8jMwNuY51pvrQ10GV8rd+MR3ebzDrEJKkqRMs1pqHtWv7j49sGRnaM6obNWTtAQEDIL48gmQXmjyV/JRdGYDR/d3C8pRGKSBHr7ezbqsg+wYN8VSDg897RyPpp4fD1NPM/GGUlE43GssJ9hOdeTLFUBOt7wL4HkOR3IEcqQ3j5dfZi9QnOKz65g6Oju281oUZEQVEriu1eXuQK1FnkRPBENOSJNm/NIu/1qC5S9GyeFbc1hvtVGhDISVfW4C5ysMKGsN4s+qvfY+Ndb05dsms+yFo5I+jGLeUP2ArwEmWDu98zOEaGdLfTNpbBcCjkQ6uV65T5Wkkdm5WjgLfoolJgSQMZSc5fCUkR6XXuk8/gTVz78guelt4BwRUip4MVm0AaIAxyyYZDyM/no9uos8lnd6qIeNckwMNCFcTHyc9mlLdu5uhWgoy1HmAtFpn8TyBPB1cxdRaFjeYQeKjRqboLiXAV4DzCoOWonp9yWccJjccXglQmZBhF1ldp8W+6Tdt9F8+lBjbsEj7pIwnuadYP3SpIOZ+rcGVKKydZivs+IN9bg52OVCCyRwKYcb//qO7U7muDP0H0KtRB5FPTNFMJHHILNsBavCp+PvTOEHGVFd7ATiYbG5+/vLlC9FaB9+wodYiHtPJvWNk67sW5w92tRw/xDx5dZmd4dOkKXOSabmscRLYgckDoYDLoqHxuNYcH0hq2ynDFnb4fqnOy0d6Gz6LTJjTIkxZf8gcPmJlmZ+yTCdxTAy2ZPeC515YmWd+9YOzpFAr2yzcKO5esT4OuFhpX
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(26005)(8936002)(966005)(186003)(16526019)(2616005)(82310400004)(81166007)(426003)(86362001)(5660300002)(336012)(8676002)(36756003)(4326008)(36860700001)(6916009)(70206006)(356005)(47076005)(508600001)(2906002)(40460700001)(316002)(6666004)(83380400001)(44832011)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 22:29:07.4968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4a9e49-1700-4176-8a31-08d9bf51249a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2942
Received-SPF: softfail client-ip=40.107.220.88;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

On behalf of the QEMU Team, I'd like to announce the availability of
the QEMU 6.2.0 release. This release contains 2300+ commits from 189
authors.

You can grab the tarball from our download page here:

  https://www.qemu.org/download/#source

The full list of changes are available at:

  https://wiki.qemu.org/ChangeLog/6.2

Highlights include:

 * virtio-mem: guest memory dumps are now fully supported, along with
   pre-copy/post-copy migration and background guest snapshots.
 * QMP: support for nw DEVICE_UNPLUG_GUEST_ERROR to detect
   guest-reported hotplug failures
 * TCG: improvements to TCG plugin argument syntax, and multi-core
   support for cache plugin

 * 68k: improved support for Apple's NuBus, including ability to load
   declaration ROMs, and slot IRQ support
 * ARM: macOS hosts with Apple Silicon CPUs now support 'hvf' accelerator f=
or
   AArch64 guests
 * ARM: emulation support for Fujitsu A64FX processor model
 * ARM: emulation support for kudo-mbc machine type
 * ARM: M-profile MVE extension is now supported for Cortex-M55
 * ARM: 'virt' machine now supports an emulated ITS (Interrupt Translation
   Service) and supports more than 123 CPUs in emulation mode
 * ARM: xlnx-zcu102 and xlnx-versal-virt machines now support BBRAM and
   eFUSE devices
 * PowerPC: improved POWER10 support for the 'powernv' machine type
 * PowerPC: initial support for POWER10 DD2.0 CPU model
 * PowerPC: support for FORM2 PAPR NUMA descriptions for 'pseries'
   machine type
 * RISC-V: support for Zb[abcs] instruction set extensions
 * RISC-V: support for vhost-user and numa mem options across all boards
 * RISC-V: SiFive PWM support
 * x86: support for new Snowridge-v4 CPU model
 * x86: guest support for Intel SGX
 * x86: AMD SEV guests now support measurement of kernel binary when doing
   direct kernel boot (not using a bootloader)

 * and lots more...

Thank you to everyone involved!

