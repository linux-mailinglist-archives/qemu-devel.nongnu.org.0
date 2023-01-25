Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C410D67ACCD
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 09:50:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKbTY-0002i0-06; Wed, 25 Jan 2023 03:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbTF-0002hV-Po
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:49:36 -0500
Received: from mail-sn1nam02on20606.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::606]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbTD-0000JK-RN
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:49:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcGycvZFyRxpAEIqfsI3cKxKUUlrd+yXyzoDHglrn9qeQvM8vemgXPAlpfzqLE3mk6Z3gxhCvAmsQDt56MerLAmaRsAS19aGxuMMIbyLDjEkSBg3NXXNh/DTBIqHwT3bUpV0nrm4pCtbcBVqKxSCfP1lZ5V+Co4mBJPkVyMmuc6J2Ctyca7lyv19fFl4XIxeQisx/PLFerzVEB+Yr4m/xRSkmMxsdsWIV8WWcBd7NT1m8UB/7rMo0NLan4+VM007G1ISo+FjdwxXmIQcwQX4yqNctH69o9mHl8VH93H7WP1tNcQu9mcbHJmcn0ilAHBUPdV8q0oVCqbMrqy6eeVomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qx1KuYQR6ecGUTs1AcZ1xyNLJ/NWGF8kUn8IPVLjxhM=;
 b=EifB5JC9/QBhZQWAF+0Cfc+W3atOg0bZ+VeDRRaMrgSLwQCmhJOkq/qb57VgPLoAUp28RpPYd0laY1LK9g1tvtf65tqzFLfoNc49xp0XKDC75HsrgzEcVfD5vTJeTMgaAfivfSiLFFAh7FuCtWxDSKjmzxZI8LDRUHh1vHBJ1CbegzocDr0djbm7RH+zZRwIXSOxQ68lm0idOkstB4B/0t+q16h0d3KsF7XDmpbf8nGeFkgmlojmQj+AL/jscjlo3Yly9/bCnNUxFeG9TaZ3217+T+2xzThpFHQWXKcsRoOYV/1r32SppVRsfZPKTLWwvZIMIYoOPhvqab2f50zlYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qx1KuYQR6ecGUTs1AcZ1xyNLJ/NWGF8kUn8IPVLjxhM=;
 b=dLhpK0DVCBzbVycLkTcZNXCo7w1fJV7Ldqx+SJW+Gqf4IW2v6OH+p/qGwKAfhAtjHhWfxElrwAjrVKwnLN8be7Ob9BuSjflrAEyjJd3ItasK5p/v182eE+nMIGTOPgNJGLvDsMo6kYuldYJbw1vsyuk4u7u+b9nufLrZZ/3QNsk=
Received: from DM6PR03CA0095.namprd03.prod.outlook.com (2603:10b6:5:333::28)
 by SA0PR12MB7074.namprd12.prod.outlook.com (2603:10b6:806:2d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 08:44:21 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::b7) by DM6PR03CA0095.outlook.office365.com
 (2603:10b6:5:333::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 08:44:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 08:44:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:44:19 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:44:19 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
 <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>
Subject: [QEMU][PATCH v3 00/10] Introduce xenpvh machine for arm architecture
Date: Wed, 25 Jan 2023 00:43:45 -0800
Message-ID: <20230125084356.6684-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT030:EE_|SA0PR12MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a434cbf-ab58-498c-0e99-08dafeb05a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zDqgLfzZ3BkeV9hJO+jv9ivBkrALiRdtGC1QlTxa1HnY2+19PEk8Dm7U6AZ7CxyPwCN8pkZWwMiQ6JFAzin/mgByR8pMQex5HM01a/PgqwSt4Ugm3Xz/r739Ihaoz0gupbvVnDthCJQj3Ub7P8X6ZR+Qij2+RzPxnrxVYrA4bIELzAGITHuBeW0QmNnuG8WpDbGVW5zyfyc+aim6DX+y8Sn5EtHwKNGvwvjut8/qizPHKEyBqxlHSSUf4oWRYDzYVgfgLXxU+56W5wxObmcefK61CQlDQXOVW02+P22d1+QzowY8pkRukPEz4zVaJI9z7/em8mktksUDtFEW1fcLIGIyLxL3pwmEGQJ4qMDZxRLITUKYWLl7j/Uh6ByZp3oGr8wyHJiiwwCFw1UnpctUO0a7Du6pjsfOpiOIEEywpu/dy3+X+y3VjoR5GDjYi/fccpZ9U5UVk/l+hPqiw8yRtrOztpweY7oNPRtAfcUF18p9ZxTsv8pJdvsZYBO09k+N4JZ/8ar+5dJAxmwA35e6571dbB/MGB8zr9kmTEorJ+gIzwfNYOOJ/7RSxgKSOm5uYc983JXTIVIlZ12i/S2Vwc6sNCqmaOKaxVk4hzDe9q4409UmnWqPaZkvIZeIfnuFWqggmkOThqKiiYv6S7TzJ8dfej+SDZarMg49JHjGKpLqmIOqtqoNg30lYA/MX0kedfuTVOdyYvpGC8PmpdN6KISHZ+us8iAzIIool9xg29c=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199018)(40470700004)(46966006)(36840700001)(70586007)(70206006)(8676002)(4326008)(54906003)(40480700001)(316002)(41300700001)(36860700001)(336012)(86362001)(40460700003)(44832011)(2616005)(1076003)(82310400005)(2906002)(82740400003)(8936002)(356005)(5660300002)(426003)(186003)(83380400001)(47076005)(478600001)(6666004)(36756003)(6916009)(26005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:44:20.4593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a434cbf-ab58-498c-0e99-08dafeb05a15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7074
Received-SPF: softfail client-ip=2a01:111:f400:7ea9::606;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,
This series add xenpvh machine for aarch64. Motivation behind creating xenpvh
machine with IOREQ and TPM was to enable each guest on Xen aarch64 to have it's
own unique and emulated TPM.

This series does following:
    1. Moved common xen functionalities from hw/i386/xen to hw/xen/ so those can
       be used for aarch64.
    2. We added a minimal xenpvh arm machine which creates an IOREQ server and
       support TPM.

Also, checkpatch.pl fails for 03/12 and 06/12. These fails are due to
moving old code to new place which was not QEMU code style compatible.
No new add code was added.

Regards,
Vikram

ChangeLog:
    v2->v3:
        1. Change machine name to xenpvh as per Jurgen's input.
        2. Add docs/system/xenpvh.rst documentation.
        3. Removed GUEST_TPM_BASE and added tpm_base_address as property.
        4. Correct CONFIG_TPM related issues.
        5. Added xen_register_backend() function call to xen_register_ioreq().
        6. Added Oleksandr's suggestion i.e. removed extra interface opening and
           used accel=xen option

    v1 -> v2
    Merged patch 05 and 06.
    04/12: xen-hvm-common.c:
        1. Moved xen_be_init() and xen_be_register_common() from
            xen_register_ioreq() to xen_register_backend().
        2. Changed g_malloc to g_new and perror -> error_setg_errno.
        3. Created a local subroutine function for Xen_IOREQ_register.
        4. Fixed build issues with inclusion of xenstore.h.
        5. Fixed minor errors.

Stefano Stabellini (5):
  hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
  xen-hvm: reorganize xen-hvm and move common function to xen-hvm-common
  include/hw/xen/xen_common: return error from xen_create_ioreq_server
  hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration
    failure
  meson.build: do not set have_xen_pci_passthrough for aarch64 targets

Vikram Garhwal (5):
  hw/i386/xen/: move xen-mapcache.c to hw/xen/
  hw/i386/xen: rearrange xen_hvm_init_pc
  hw/xen/xen-hvm-common: Use g_new and error_setg_errno
  hw/arm: introduce xenpvh machine
  meson.build: enable xenpv machine build for ARM

 docs/system/arm/xenpvh.rst       |   34 +
 docs/system/target-arm.rst       |    1 +
 hw/arm/meson.build               |    2 +
 hw/arm/xen_arm.c                 |  184 +++++
 hw/i386/meson.build              |    1 +
 hw/i386/xen/meson.build          |    1 -
 hw/i386/xen/trace-events         |   19 -
 hw/i386/xen/xen-hvm.c            | 1084 +++---------------------------
 hw/xen/meson.build               |    7 +
 hw/xen/trace-events              |   19 +
 hw/xen/xen-hvm-common.c          |  889 ++++++++++++++++++++++++
 hw/{i386 => }/xen/xen-mapcache.c |    0
 include/hw/arm/xen_arch_hvm.h    |    9 +
 include/hw/i386/xen_arch_hvm.h   |   11 +
 include/hw/xen/arch_hvm.h        |    5 +
 include/hw/xen/xen-hvm-common.h  |   97 +++
 include/hw/xen/xen_common.h      |   13 +-
 meson.build                      |    4 +-
 18 files changed, 1363 insertions(+), 1017 deletions(-)
 create mode 100644 docs/system/arm/xenpvh.rst
 create mode 100644 hw/arm/xen_arm.c
 create mode 100644 hw/xen/xen-hvm-common.c
 rename hw/{i386 => }/xen/xen-mapcache.c (100%)
 create mode 100644 include/hw/arm/xen_arch_hvm.h
 create mode 100644 include/hw/i386/xen_arch_hvm.h
 create mode 100644 include/hw/xen/arch_hvm.h
 create mode 100644 include/hw/xen/xen-hvm-common.h

-- 
2.17.0


