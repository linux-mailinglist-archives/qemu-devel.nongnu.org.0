Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC58618434
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:22:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcxX-0007Yj-18; Thu, 03 Nov 2022 12:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcve-0001Zo-Fv; Thu, 03 Nov 2022 12:18:56 -0400
Received: from mail-dm6nam04on2088.outbound.protection.outlook.com
 ([40.107.102.88] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcvY-0008HE-Pe; Thu, 03 Nov 2022 12:18:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m53iRSUI3RDI0ZXc927HsjmCxm6S1aj8p6QIRwmdCWNMARqMElQfLmU/JA0SdcFbokVElz9jB27Xoo5ET1z2A76Xv1Ecql+dV3S7L8QX5NtPjy5o3qs37N4JeMF9qFVaixEl1yoCixS6X2IYrixnaKBi3wiEt9a+xub6YBUoU2Hu5L0X35Gl9iQWgmI89RpL3yAsYjcM8rc4GwZltWBhl27ncIUZOk+fY2iOyhaTL/Ut9e898KHIqw3XPr5YOXiEcS2IFiBMJtL6rv22rg7xYiKBrngzwJfJtCupbbwmLtZUean7beiay5Z/C5AbovdOJaVMWipaeTaCLoqkvR5I5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWB92MjN1yYMLJTc0eJ/jgyz5tTb6+lW9x+GXrTLhAQ=;
 b=YOwoqS3LskBdCrLThdOO+pAipjXCIaBCsUfFruB/UxqsLqCF4excrqPrCfJmWb74ZGFhkTdWm8ySXCEDW2D6Kq/1OJ8bl61rPIesQnjkKrfx4YY0wjpzRKNPSK3kpdbjmr7VsLSG6JcNBRTv4tsxFAumDO3D9z4RKMq5RAiCxrK9PTFJ1D6cLvnLPoowbk8RZUn49qYRhw5tRBoqKMVaOD6DiSjbqvCPwA/Gdhw5ablJ7oxMt/lH8LfwrrvXNQwyBJh5qHXtAD3r35zxQtn2jTKg3dlA8LVZ5xczl5v/cZx8kAxQ8Jow1GJr8UcfciMSAzwS8bMm1ZTL2+L1jPYzRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWB92MjN1yYMLJTc0eJ/jgyz5tTb6+lW9x+GXrTLhAQ=;
 b=GPoSXo8fJwUO8BXq4uErHOPpAr12Hthw8FtLfnaxPZYNxhmzuwNH0UrwZfvejtFuxbEb21I8b73zr62/5V+ycd8wKRM+12gu0AKjFC6oqOQ4PvNyH5iLwlV4uDVpa4mtCVqx2Tv5+Jtz6VOhnkafdXwmWHr0ptfmUtJ2K5835XFPf1T7t2NnU8MNc6bCg2kkMeBdrGrZq9e1zFk5hW1bvlBQv0p+hQ5CQIj6cYmkwTLOnWpAYbQsZ8smx2YIP2wIwQEBswFSLyyjMcYcWvYrxR4Ij/pbEIcfPx20BRz33xOzWm6gUnqUaWvSvTJaKmBFqjnT0thy0PwSULWFlNB49A==
Received: from MW4P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::29)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 16:18:30 +0000
Received: from CO1NAM11FT074.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::46) by MW4P222CA0024.outlook.office365.com
 (2603:10b6:303:114::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.18 via Frontend
 Transport; Thu, 3 Nov 2022 16:18:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT074.mail.protection.outlook.com (10.13.174.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:18:29 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:18:16 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:18:16 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:18:09 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, "Ilya
 Leoshkevich" <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan
 Quintela" <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Kunkun Jiang
 <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v3 14/17] vfio/migration: Reset device if setting recover
 state fails
Date: Thu, 3 Nov 2022 18:16:17 +0200
Message-ID: <20221103161620.13120-15-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT074:EE_|MN2PR12MB4408:EE_
X-MS-Office365-Filtering-Correlation-Id: 6579aae6-daf4-4d24-9674-08dabdb70bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i8x0TSHZHPkYhtVwTtTwi9IPspwkvPd8WwIaendN7wHck5B4K3qDVcx5VbPeH5Ks9l5vHhhb76NUeI159qXmtIfbgztmf5VAlegSGaCXF/hEQqH4NChnS30o0DqrAlRBmsr3nxnCGMjLEEVj1ZqJTInHrO14e5yFVpW3DNJ2xYZtTDLe8jkEcGSAW8NQQFg3XBuBS4Ktvk7fmRtViqgKENo5Xa9f3+FVX6xeGAocu5CHmEBhflV9PLeBAL6+RhaiWazwXrXEawnu3xjf1zkVJMYY0E7DOrYBbEVKB1pVo326hsUPAuQ+f+/BwNXqOtBcJ5MNiGcUtos7QJWbvNbdChQ0olze/Szea8y+ELOmCWBF33RWwDt9+guElwfO7WpDEXkrRC85e58HSkHx4HNb25PoniH4XpvL2aZD+xsaDM8v5oPzTKLttKr2hpKRXn3YI3wDASupPG59Lnn9VgXwV1LVnXvf8nPvzKcCSiSj4HMam88mG+9syiBowsO8KmNZiWamGqWcQB/Lopjwync1Qtba0a6DPctrNoVe7HoDjjutk4qX2TddOQ1VmBDgqhj9uRAEgy+7cncaqjsI7nhFqMpHg/y3CBPfZF5twdjmjR0b+WQAaVmy0A6idRe5lejaynncopNo6daO7ELlxm3h/8XctgHxoVollnPJfZ+vKJc0Nb71rlOfsUTHF9Xrfc3ZshHuu+Oca0dMsmHhcdq3vGmRW5Eslw9CVEczCICbNTiK26F/dB3YqsWJSY3rSk+1fpwXIiLT5pIrbAdr2e3T3A==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(40480700001)(4326008)(70206006)(70586007)(41300700001)(5660300002)(8936002)(7416002)(8676002)(6666004)(36860700001)(478600001)(2906002)(82310400005)(26005)(54906003)(6916009)(316002)(7696005)(40460700003)(86362001)(356005)(426003)(83380400001)(47076005)(186003)(1076003)(82740400003)(2616005)(36756003)(7636003)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:18:29.8589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6579aae6-daf4-4d24-9674-08dabdb70bb6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT074.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
Received-SPF: softfail client-ip=40.107.102.88;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If vfio_migration_set_state() fails to set the device in the requested
state it tries to put it in a recover state. If setting the device in
the recover state fails as well, hw_error is triggered and the VM is
aborted.

To improve user experience and avoid VM data loss, reset the device with
VFIO_RESET_DEVICE instead of aborting the VM.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index f8c3228314..e8068b9147 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -92,8 +92,18 @@ static int vfio_migration_set_state(VFIODevice *vbasedev,
 
         mig_state->device_state = recover_state;
         if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
-            hw_error("%s: Failed setting device in recover state, err: %s",
-                     vbasedev->name, strerror(errno));
+            error_report(
+                "%s: Failed setting device in recover state, err: %s. Resetting device",
+                         vbasedev->name, strerror(errno));
+
+            if (ioctl(vbasedev->fd, VFIO_DEVICE_RESET)) {
+                hw_error("%s: Failed resetting device, err: %s", vbasedev->name,
+                         strerror(errno));
+            }
+
+            migration->device_state = VFIO_DEVICE_STATE_RUNNING;
+
+            return -1;
         }
 
         migration->device_state = recover_state;
-- 
2.21.3


