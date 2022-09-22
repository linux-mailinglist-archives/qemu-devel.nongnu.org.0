Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C385E6469
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 15:57:20 +0200 (CEST)
Received: from localhost ([::1]:58266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMha-0002l6-W8
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 09:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obM8g-0001Y9-6G
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:21:26 -0400
Received: from mail-eopbgr60136.outbound.protection.outlook.com
 ([40.107.6.136]:7326 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obM8O-0004pt-0V
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:21:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhFClolz/QjvEFWbPNLl+6sgV9kgu8VE2B2PonCa/kqRxlr9W9QDp41XLAYXQWifFx3+XQKkx47W0FacbfmtL4fzlUuwinud+K6UU6vnv5UnGHNlgdDlXlNCWMBvj7etAaPtPgjQ7wwZcZnhwH0x7XIcK1y/qdivJCDhFho+D8gq0WOyW4OvPWX3/o8cplkcEthYt5QCYGROKeIChbglmKVBg2FK4+g/i0O9cNSQjPeOKTOnLW9jGO2RSe02W5QgNjMcg1DWHwuSGSss/W2dMDMaLs1X5oFltLHivyOhwWy9VqAC+HrnwHbGH93q9J4sI8DvXKXr6lIrqWdZe1AUJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEdr7wxFSVRIJNKjBaI3l1HwfauaFWtlEsxfhrZpjH0=;
 b=KGWkNFswSpqqBTtwDfYz4DxbM+tQ/wju3B3IvgxDz528szpBr+mHu4Y56oIDM2pOtMnjPgFyBDsueH+bNK7DcFTjX3VcEvaMkNW4lcQgNvS5gZo2W1OxFTqjE5ULg47G61u+AI5K/sou7QF3KWfXjJE0QyoLC6ftBXLDH0ZfoJsPfHYCdU54fVGDoLTg69sqJYqYjBwtRc+f+Lpbcsa0FYhL1mSnorwt8bYMMKy30QfJw+2P6qrvq/mCZPmekH3NosMo4Ld9YFMwqm0J5IiUITyAUVU/Dp2APIokqOP4J6n6gpYKCys5aGCOy165xvjvk74CGY/1Ddk3DB8a0g2Yeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEdr7wxFSVRIJNKjBaI3l1HwfauaFWtlEsxfhrZpjH0=;
 b=Wtyc61xbypG583C+g5T74KfYMHtE28R2EYO/p522WHVj77dEIyNp1tClSXxdH8WFxcZ7YEFeh1+awat7Gi7yalkufaQpg4SrGleJt817O/CXEcLoPGWyxM6r9HJGOcFnS89hXPddGRFhR5nOgclMdRmcX0LuJPJpyzVsjcWm8agEG/ffZNOuzI0+Uk7AImEj6WGlOD9LXxxMEzpcZZ3THVYiEkQHxOBgUY6NdmMwUFKhx6MYA0JPhYxiK4YkDgrfEAzaAxEN9brryBh0s7OwVqfLegfauBFkoFzwFPQuH4vw8G8MP7N7EXLbpK2o//JDIdQi7uTRAlH9z69PHGje2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6480.eurprd08.prod.outlook.com (2603:10a6:102:155::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 13:20:15 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 13:20:15 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com,
	michael.roth@amd.com,
	kkostiuk@redhat.com
Subject: [PATCH 4/5] qga: Add shutdown/halt/reboot support for FreeBSD
Date: Thu, 22 Sep 2022 15:20:00 +0200
Message-Id: <20220922132001.940334-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
References: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAXPR08MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c7fe1a6-8a33-4763-38e1-08da9c9d2f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HuFhhZDiQjl9pvIQrTQjdHsXCq2SvCl+ZGTJyknalB/r7rNPCa/4GHJfkAorKwUOAdoCVEFUnvUK/UyBCfmuqTFd197qrRgXFbw8e+jlyrV0LcDp7e3mb7sTlLgyCevK5esOLNKj08x4wTXrE+KJZcZ9Sv7XC8ySivYVGren5Ghtnn50Lvg1QxHBIgIDVk/CpQtjiRbaQPSfaySYviwFRQBRNsPzrxwrIqiOg9E1Rtvsesmc4Er/vbzxfxRtY+VbRFRzCvV4VrgPbnTLcV2otTD08JzJIbfl+gXA+gShXbjFbxn17TUn5ttoSDDmh0xO/nWyuMay46lc/xqTFfWmggLj2RCXM28Y53IlmOMYTHFp43yudIOJczhpKTIBNbBBkEjH2d+XuazFhzvJvZr0cnLnvBZl1XQNWzLpuGODUDtaOjgLep4mTEEA9GvmF2Zxxq6uRUa7Yx2ovtCWseiee3T6uGJqMNIRyap5AmQsvkN+r5tLe7hJD4SqpdpDRU6gmEXA77lRqm/p/3yRyJPmJZjRHSMoNKABmcStWo7JlMSNorfNqFOgyu/1sVW+ML4Bel/L90BP6YVh3yTGtrI3U+MNosxgE6Z2gDoF92l50sB2pS5E3r84YoYNtQN1wDi9hQIc/sXiYXhQcZZPbjKe4e+E4C8ITc3CkFBBObp4hHqEAjRW3rSxKmeI1zF63B88uxy2xXb15zmWGvuY/ZS56RoDdbOpUuJVhycNgA6/zwv/KUDsSPp9ZEc/BhRr5StK8EBRXOwdMrNt6ZUe/2rWyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(451199015)(41300700001)(6486002)(478600001)(6666004)(52116002)(36756003)(66476007)(66556008)(316002)(186003)(66946007)(1076003)(5660300002)(2616005)(8936002)(26005)(6506007)(6916009)(86362001)(8676002)(44832011)(4326008)(2906002)(6512007)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vU61dC9zTf3XJFMaewPnDZ6wjCS3loWhi22NpaPQxpc+mHv97Iuu78jZLCOb?=
 =?us-ascii?Q?4XELsJXZ81LKwHJidvagQRwXp61AkCnQnuEkmlrYDp+KdIJXkpt1nswx2cNZ?=
 =?us-ascii?Q?ucBNK7qQFtl/2CvI+7qhxM5dB9Sf9pGXWArkZqrG1c0CVdIIKrbY3biHSALm?=
 =?us-ascii?Q?CbE6R3Rcnrckeac5weduYSN7jJaUjS8dInO4hSMhCXhEFqW4NsTWMop8JB7E?=
 =?us-ascii?Q?U5YXqKeFMYkIMcTCuWnMjoeoSdSfXT7bIrxcHW4kQ8KG9n2QyR5YC5Q85xR3?=
 =?us-ascii?Q?MLp1dq9oqbu3g6bcP4M0OraNyYKa0MnbI3El+QyhDbKN0/cBSGXjBMnyxHPc?=
 =?us-ascii?Q?0JeT97V/s362m1dtRt50+GFmT5JC80R2/p1GPA1xYwq2/s2N8wWpPfsq0465?=
 =?us-ascii?Q?83qt4U24ZzKBhRP/RzkmiB3DSq8YKxRRMY4KkdWqmVtqZE5LYdC+bdtC5P0J?=
 =?us-ascii?Q?AmT8pCyt1bg5r/amRpvU3bZBbHEKwfyR4x6DebG5+x0PyRlmIRQTDtJwdE74?=
 =?us-ascii?Q?XLRayJDUeTTaxjTviG7PGLkSTjuo/ZoF4Pui+FCDSbIY0+kF+gvmZtqArEL3?=
 =?us-ascii?Q?X7lyaFQxxYHb/ZrUDzqAWtK6yAwnP74vVRtIfJQPd516a/01ReX4qI/rwHRE?=
 =?us-ascii?Q?c61lgZmo1f4tI76PAfTAkSALRpeyNyQVtwo0dRwzCyeqmGY64pYqBuqpiOzr?=
 =?us-ascii?Q?0pmXgGm+vQcqsHjDVhHfDtAYqoKCkHL+JTEJXbEnhGINnRu6qvfUGiqt/IQR?=
 =?us-ascii?Q?Q5K3TuJ0KL/ozeReHn+EZmFMyn8dJud/uiQE49rYDuiK1w/ZIHDIIOKkpC9Y?=
 =?us-ascii?Q?0vldjxNHbYKt9WEbewbN3d4mbXMBSIbt4w5Il3fCvwbbhqtVg5K2n+Tew7/H?=
 =?us-ascii?Q?o7D3+Sko3CDV56uL3LF1vYJI38reLsdlPlnttxyILRYyohbZdtHhqkcrdIa1?=
 =?us-ascii?Q?pNCiTUiJcyIl6eI9+X7DCZqPug4VLd7hSxFVisG8V2Jo+LW2OdawtS7e3P+U?=
 =?us-ascii?Q?o2hmzZtBO44SXVHG1HFDBXMKr4Gr4h2BBjx7UF40mtyhEeTvYlb83mKX8Lbj?=
 =?us-ascii?Q?hDTOUsg4pX6Hy5ro1Vzdrpa2m+5HtFoRLYVqyvLGZ8l9Ozqq1bhKN+7CKEgk?=
 =?us-ascii?Q?OMR/ffmly5nDU2XyljSA6q17METZpk7gtmuTwfeqfhGwsb0WymIoR09eK0qC?=
 =?us-ascii?Q?vrjODZfKiUnsRPoiaf6rj6o2+ITuJ+ZNXdDaXnrjcRe4i4iAW+eooSJTvp+9?=
 =?us-ascii?Q?wxsu/XwU2eafM2o4OYn41t2p432xIDlXKGojEVRN4RechOjm7gsjawk1l01h?=
 =?us-ascii?Q?x+3osbAfXyLTBs18DlEH+FyN/sdIcd5I9jfthm6f75h17xPRxuWQbD6VqfzS?=
 =?us-ascii?Q?0XjNHdVIAkZiPAat8tlJrPc90HoWnc1tA8+uullBOsBl7WiLdnlVCLH6AOzj?=
 =?us-ascii?Q?EVQ0eAekvjk+L3JVyhV0v/M66HDNucaCWEUoRq/kEsaJQ0HKQANQ4dRkaiF/?=
 =?us-ascii?Q?i5/XSy5mePDq4tzFVpZ7onQ2ZwJCUgJ/ZR8PVZLhkiom+bxawPJMH4QdRaA3?=
 =?us-ascii?Q?XVdFllsUZTy4sZs6VJVHX0t1bKpI+4IjXTP1MOGOP5AydljymMDHmrfkgFXX?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7fe1a6-8a33-4763-38e1-08da9c9d2f84
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:20:15.0307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZcmoJPr8ZCZFWgaSXXS6CtsqrPLr+xCsKICvQJ/l4pj5YJx1X8TrtB2G4GvMTw/PhF/AN/vp5zuXI0itH3ACrOAlz7tL0b11mnFRk0hOF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6480
Received-SPF: pass client-ip=40.107.6.136;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Add appropriate shutdown command arguments in qmp_guest_shutdown()
for FreeBSD.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-posix.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 3a1055d5c3..60cc673f25 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -242,6 +242,10 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
     const char *powerdown_flag = "-i5";
     const char *halt_flag = "-i0";
     const char *reboot_flag = "-i6";
+#elifdef CONFIG_BSD
+    const char *powerdown_flag = "-p";
+    const char *halt_flag = "-h";
+    const char *reboot_flag = "-r";
 #else
     const char *powerdown_flag = "-P";
     const char *halt_flag = "-H";
@@ -272,6 +276,9 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
 #ifdef CONFIG_SOLARIS
         execl("/sbin/shutdown", "shutdown", shutdown_flag, "-g0", "-y",
               "hypervisor initiated shutdown", (char *)NULL);
+#elifdef CONFIG_BSD
+        execl("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
+               "hypervisor initiated shutdown", (char *)NULL);
 #else
         execl("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
                "hypervisor initiated shutdown", (char *)NULL);
-- 
2.34.1


