Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F82965435F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 15:50:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8MpI-0008Lf-Vs; Thu, 22 Dec 2022 09:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1p8Jz9-0008WB-0q
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:43:39 -0500
Received: from mail-db5eur01on2135.outbound.protection.outlook.com
 ([40.107.15.135] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1p8Jz7-0007nu-Gm
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:43:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/EdvUhJg5Uo1lY3N84K7hKUdRbBUvF2iM7op4SRrbKdiVQYucK0w67G95kHuORsU/Mkidcs0bbEjqooMu1FEkuc6hY46gCLeVwrFg1T82oYbJLAUXazjjOIeUDNI1/6szbYEjSU8Ekun1Eupq9bRNyPDu7NMiqrdVPAOuJSW2+NA+7sZKc/GeCjBGYyGTkSWxPV8Q7fqYhXLxVqeNOZ/rZ6DlAn3xCD+MHA/UOrKb1JY2yJDFl99Qs4Hv3/NZqIhaofxQVkXoZVgAft3NeeQ40XGtLekOWMo5YL0rBeC3/RSmaIYGxVHw3dLd7WtYEsAeNONeanMqgJSkQKDNRnnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0m0cZlcwSjHifBQEmyr0hOm1owh50NOZ8QSDtUMOQE=;
 b=PJhqKjeQktKx7uPA+42LW4DIujrINdOee85nn8XKHXsW4+ba50cnCePxBXOoxOC6CjWkdqnHKh9w68lwPp3/KuEJrhffwFu7B45CILm9ssd15g1i+Ee0T0RQBMCXc4Qi+dHFi5nTBWLaAZ0/6k4/7bsOcu9vfSUPRwESHzdx+zMcNaLokM0vZ87A0sJksiMLcoB68S8C1eOPXrK20el7stAYvTtV3QVmW9g0uTqtqr/ChXDIK/QG6L1HR89MDY/lYSsBZawv37ypOOnYZ3FH3BXfq+BlFGB2wuglqze82l4WtPtvnjMzNNjMCgLqxD3fFsrqwL+s4j9Qmy+pOx3uRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0m0cZlcwSjHifBQEmyr0hOm1owh50NOZ8QSDtUMOQE=;
 b=JcHWanv88PJqX/FMD7ecxaOmrwqYkquHCCqq4JzNyhosTk4NH6sS3i6RvMEJzXo5yPakBmY/LQn17ABnkMeCUbhybYHL3oEgYw8pG2SibTeGeO5LzBgO5PyBTRepzquQbsb8OHeQ05x2NFQg+oC4/wnloWzzyD8SlfTvJqK5iY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by GVXP189MB2055.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Thu, 22 Dec
 2022 11:43:04 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%3]) with mapi id 15.20.5944.006; Thu, 22 Dec 2022
 11:43:04 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 1/5] pcie: add helper function to get number of VFs
Date: Thu, 22 Dec 2022 12:41:16 +0100
Message-Id: <20221222114120.8790-2-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
References: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000000FC.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:19) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|GVXP189MB2055:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4b02ea-32ae-4df8-ac96-08dae411afa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vmFLNDmKXwVkOQN86D3KL26gWu9OiLfW1K8USVeksEqHON7YQuF0/5VEp3Oe/ZjGKQWALJUmINC5yTgXiUBw+vkx9ZP9UDz5ut6B9Nu5Pc1udixAmO8r6IuH0YKPPXSJhgJe/eQAII5WQSh4CJlddDdi9a/jLSGA/tORBC8gBMLpE1ZfvGeDE+FF5MslzTGOfP8iuQ8pqDT9tLQCLwLh6aJpmlfo8/NLpBjda0qXK0bKD95czXLNirvRI6DCJ/JPQ/2IV2BNSKQYRdPcRhTG/iDBjPrwT1SwrbnxdMFMGmiEJTFTMevOkqIwdxQ8oTRykJnKH4yKllG3D3nuAS7TAwq7R1PBsT95kRGWrDLcIArv/TW9zMHW5QQDILNL3Oz+lYy4eSclw464OXDIXoavPcRuH1234e0j/UPJdo7izQLuGkI5fwegJ/JcaQlWsVsKpEOxGtyxbXkoSE4u2Ng1wz2N95++RCuUjxSBFBYR283ZvYQQnIMAABBwDy7QX7FP5M+T1OmkLeFNt+HYXnSeuaPpHEAPALxDr+oNQnvgDCKus1C0lK/BcMKgPhSGEEHWXCzkJWwEpdQUEDGET5BrInakw6qp2TtUulTtal6FKXsBLVVLIjXU2wqQlxt+/koHE+LB3GuJE1R2IWAJZ3MWUcrUPvtVRil//gpx2rbjzv2aLub4uLm8nmMjevhhnOOu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(39830400003)(376002)(396003)(451199015)(36756003)(316002)(478600001)(86362001)(5660300002)(26005)(4744005)(70586007)(44832011)(38100700002)(8936002)(66946007)(66556008)(2616005)(110136005)(186003)(4326008)(6486002)(1076003)(2906002)(66476007)(41300700001)(8676002)(6512007)(6506007)(6666004)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YLir1ofyZo8VO8LjmjsJolHdGmuH7RIc7Xb8ngftJtjbTgt1kIGRwO+EvyZN?=
 =?us-ascii?Q?b59F6Dux3EpxyN1q1sg3WarALF6/Oqp2LIfGQC/ELFGhj7RBxyisFWnM1uNr?=
 =?us-ascii?Q?WBnHx3Dze+8jlarr2u9EBJiNAy7RFM46l5ZYlYutvDMgUe/B7DjCgpSLlErq?=
 =?us-ascii?Q?jSEyAg51r4c/T9csp5H1Eh0h1FNucA5yt/Se8GBWwwopxCCkDrzmLaf44EKb?=
 =?us-ascii?Q?/sXwG9/hB/dR5GO9aX9b2AiEqAn8T5fzDNqfKixdRoKzuF6cPMThXVMp2bil?=
 =?us-ascii?Q?5mnsrf6kWCSTQxaXJ1ghH05AuaSfuC2ybl+IlWz57/qRj5osEZMYo3CtDVqW?=
 =?us-ascii?Q?asMion9+AYQEMdqKSUhKAYPk+6BXudO5bR/8g+AkO+mpF+Kp8TMDE6OdGLB5?=
 =?us-ascii?Q?zrWLyUgJ70BB6Q0Q/wK2EpfjG+WaWpGJxamu1335/j3NbbbP4N52Ki23swr+?=
 =?us-ascii?Q?a2Jh6n16rrgo5hcuUyNBJIex07pmi1dvEYN2GxICB0I/Ss0i3rOuqg3kfEsB?=
 =?us-ascii?Q?QlPJnKL9nXM+I9yfnxXd8eeeJc338ecCb3hndWw6u2YzHGvciUe86yoi+Vew?=
 =?us-ascii?Q?QvttZZ+GvWbKuzdUdLJUG+nzCf+j729FgzSZLaTf60glIOLoU9x7lAgHt9+j?=
 =?us-ascii?Q?RCdDAGqHsbLEJpzQfmaTMlCaQ/F7px3mEoEJC+kKFwQ8+23RkdGx9hvfCBPO?=
 =?us-ascii?Q?PsG0TbKTlPf/5Z5UhcPrGoKrUNHqZfU1HCQlnQY+5wRm6Bo4if8iRG3Aq1FP?=
 =?us-ascii?Q?TjF6dVprZehTHpOWuNPS3Ly1thNHRK001OoY14fyEGISMRc72kWu8M7wuQ+U?=
 =?us-ascii?Q?QiZzkxD6NXXkOdy8Yt38F7eWy2Ce6aMEij685fORFZwHi1dN3Y+V7xhraJ7D?=
 =?us-ascii?Q?DjoIiq7B+yawE66EYJnuAfmdgjzZGfNz84DlgkY+vNf/mv1R2qY/D6bDaPw1?=
 =?us-ascii?Q?sVdIIAOPa/3O4fjK45Ry1m7MGmHVCyKSy2S0fmyuJAU0hhCOhPqOgStbc1s3?=
 =?us-ascii?Q?N63UrRvYaZktaBJJ3R667PSbpeeqxKrCo/v1V2EUUZzaGiJMCviaHC914wPj?=
 =?us-ascii?Q?1T0Xx9T2JytAUCM1rhR1tLAZa+1X4SNf/vIiR3SS62VLfIYKBiEh7vLx9+fx?=
 =?us-ascii?Q?okanCgDlHcgmYWylZzE2MastBGLQy7c+7q7VwRwpt19xZR8VziqeiYkuS6k5?=
 =?us-ascii?Q?BW1sjvjkoGbG7bn3jeMrAh0B5XueLAwFpYWz4JwV9t0GWzCDcrpUMDTPScUo?=
 =?us-ascii?Q?kbLpDHFysA/hL5zrraRmj2ydDZmlH+YJZxCbOYc9ohDb+2buKP3CVeBredhl?=
 =?us-ascii?Q?9oP/w+EJ1KgjC0UBdxHn8QsrjJePXvvu7oXSLpt8+I8tB+FcHaPBBRywnaA3?=
 =?us-ascii?Q?8gXHHnWRl6eXw+Rtv+sl1liKeF1bm0SpPo5yTTOHSyZCTbuVB1GpsoMjvwWO?=
 =?us-ascii?Q?AO7SctLU63Fu5rlNTVKgOmFe33cJMIXFQiDoyMBSqfxejLHGtMAuWuKwRxIQ?=
 =?us-ascii?Q?ET4wdC0yj1YNVNkTThNaurv5dsBhQuqVAnB5bZhBHJDB2wS534LP/Dj+Nexo?=
 =?us-ascii?Q?fXjznloHgmWgecmkCfKWsz7gInTdojIGnoHNZAtmKDYtPt/HqF2HL4Jn1Qq/?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4b02ea-32ae-4df8-ac96-08dae411afa2
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 11:43:04.0315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCb7NaVUdoBR/eqVUz4L6Mz464RjWXlG5tTWo5CCs2Y1X8aTpSz0oVI6wA/8TwHen/B9j4gHIHDWeMJyjAaNzbcwFpbJcpfmOXzAn6Ui/Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2055
Received-SPF: pass client-ip=40.107.15.135;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Dec 2022 09:45:15 -0500
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

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/pci/pcie_sriov.c         | 6 ++++++
 include/hw/pci/pcie_sriov.h | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index 8e3faf1f59..88ba642a20 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -300,3 +300,9 @@ PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n)
     }
     return NULL;
 }
+
+int pcie_sriov_get_num_vfs(PCIDevice *dev)
+{
+    assert(!pci_is_vf(dev));
+    return dev->exp.sriov_pf.num_vfs;
+}
diff --git a/include/hw/pci/pcie_sriov.h b/include/hw/pci/pcie_sriov.h
index 80f5c84e75..8e9367a03a 100644
--- a/include/hw/pci/pcie_sriov.h
+++ b/include/hw/pci/pcie_sriov.h
@@ -74,4 +74,9 @@ PCIDevice *pcie_sriov_get_pf(PCIDevice *dev);
  */
 PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n);
 
+/*
+ * Get the number of VFs created for this physical function.
+ */
+int pcie_sriov_get_num_vfs(PCIDevice *dev);
+
 #endif /* QEMU_PCIE_SRIOV_H */
-- 
2.34.1


