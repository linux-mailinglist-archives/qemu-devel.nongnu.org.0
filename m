Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A3D2FD488
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:52:42 +0100 (CET)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Fmj-0004MX-KP
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2FY1-0006lD-6O
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:37:29 -0500
Received: from mail-eopbgr750139.outbound.protection.outlook.com
 ([40.107.75.139]:60229 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2FXy-0005cR-WA
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:37:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqAaFGgK7b9CC+3CbKxToamtHOx0pUBeJ6S41OPbK5elHodRkkqPmrilgO6PSDvTuU5vVBXTwdErRJwL9z0hCdyzT+7oPX7ppFIc0KLjHJ7POiBVFsGJnBYjm76CyMT1Ir3qYxMj+oUPD33wwsjHbi4YE7P674m1z04snhJzyYGVX+TM2tjnkI9IjCijIvDimcyb7ReboUTUd69Xqls2kmaQEJmwm72bPhde0ZrjeghIi6vszstXGOBCxcE8P5gqrWrO5FJ5RW0GaS3fQWiY1im/GKzXimjQtRrH/C6Lh/P6hwfAPwCHE1KuYDf9ENO6KLXjCILUVw7EmZsSDBCSdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/Wf/J8lxovgjsBXmJqW+7WfxsvASDxCXhCVRO6ulAU=;
 b=Z1Ia2lIc8CwXuzd3PSQv+lN86Mh6PBJk/izqY9AVBGZTyoGyWn9wFydHMQgxfkywnQ0yQxLbm/yFBwg3SXREovL0AGTaJajNMiswys3mrqMT/50Pr0Ou1eEkA8N6FNenupzDfqCU2CdnDey229/3ztjCiXbx6DcONJmaQRZdMIwMFpUw3apPOS0a2tVL9ZqVOXUbIy7fk0qAtorG3pYFywfVfNUKDVZyAdHHTLF7tnx4Tv8PvFsfNil0D1oaHyBFxdV2aZEXjWELoTmTCS1pb+FM4b8lLM5qN1ZThV4gI+muvCgOqLPZIZKvwu01xKL//2zjpZdl/l0dOye6VJxVbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/Wf/J8lxovgjsBXmJqW+7WfxsvASDxCXhCVRO6ulAU=;
 b=WDQEMrD8gnVnxT+Mj2el7V/RZgiwpKrNZLoYk5IkRvJkH+K0pI6dkktl/MnfvjDHw7LtXnNzcJyJQwuJoPwSUfftqRSmaHTfOMUqxtEw8dSq0h2P1yQIv2CyTcHnqn7DJ3I/A677wHze6WhOrkRvJT+4dVAwvh3liwUzpQcGgTk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5531.namprd03.prod.outlook.com (2603:10b6:806:bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 20 Jan
 2021 15:22:22 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 15:22:22 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] fuzz: refine the ide/ahci fuzzer configs
Date: Wed, 20 Jan 2021 10:22:11 -0500
Message-Id: <20210120152211.109782-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL1PR13CA0318.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::23) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0318.namprd13.prod.outlook.com (2603:10b6:208:2c1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.8 via Frontend
 Transport; Wed, 20 Jan 2021 15:22:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7580f70b-6fa0-405d-dfbe-08d8bd572f14
X-MS-TrafficTypeDiagnostic: SA0PR03MB5531:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5531589F2BD4FE794FB04F70BAA29@SA0PR03MB5531.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hmCcViqdi7qXI/ndGd3FxS/3ciBdic8tjNkOgtaNG4jW1y6cxeVkTuiCOCsScpJn8EzLbc5XKRSGF07rVh06aqT958XINeeJFXaYOQtqhD4Am7vmupou6vdZQIh8yK3/yCvrJRKZsZVPvKv1AQtjYlqPbnzmCUkB5rdwRriCPQ8TAyvQoTUeCAuWdu0L3cR2oJe69XXeEl7Io4u17U++ZWgUkRrNWIOdPtuHwXYWmQafQRFVxEpCl2P7+zuZkMYwRUw3PuMQcR3U7ZL9Ne9/H35k073PVcfEZwBSRYKilRP4Vje/eyrPyeklJjI02Ucrjsa/cpPZRHLdw4+TJYb4RUBeE+LUoq5ANkfFkHshBOwAomXT48tMsZTylT9cO50BQ9/K7zqTpSArS8tx7onSSUu6IGStWBzI2TmC4iIjpgdAet5hseghAaZBVBOwAimRL1Zfpc2dPw1lMkJHtRpZxsuCOH21L9igMBhaLtZOMHY1TbZFznq4MJSMiJ56lzHsG84EOZn7kaFB08pZ1Q4BRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(4326008)(26005)(8676002)(1076003)(478600001)(75432002)(5660300002)(6506007)(36756003)(66556008)(2906002)(6666004)(2616005)(6512007)(956004)(83380400001)(16526019)(186003)(52116002)(54906003)(316002)(6486002)(6916009)(66476007)(786003)(86362001)(8936002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0CZrroLEsyKduiIV2ZVf3lgD4BTt0JJKz7L+jtgNn1Mh7BO5zowbnVVmHUen?=
 =?us-ascii?Q?Rb9mOho35RpTJRqtJn3PGl8/AtSSLyYUcPcN+f6rNTz83TUYRAQpcBxy06iv?=
 =?us-ascii?Q?JCbBRPd1/htmVIGhVNEOWmldh+JQCzvLLMF75nLSvDj8Ms+X3fcRxJyZrV1g?=
 =?us-ascii?Q?lLRjhf5g7MXK/figfoMllOA20pezsex01hzI+FN98xBqkbDinF+qqF85ykCl?=
 =?us-ascii?Q?LF6hYiDa4s09DZrp5Vo8phEHq2WoaSO+cq36gIH34u6NARpuEjXYihanzr8r?=
 =?us-ascii?Q?nv5EV1rVkWGbbsvt/xAbg4vnBwjyq4Z61W/zu7jI3B/+2pFTo9zcQk+oQeh+?=
 =?us-ascii?Q?Yswo6Dldc9pwWMQym63kPSMTWDEoSS6keMdi1Mb+MvMflRDF09SZaqM9x4Wp?=
 =?us-ascii?Q?FUdB98RPg/W+YojpEkLEyg8/StzUEnxJKAFRwYG+MiNR40UpdMe/Gxr2bDYo?=
 =?us-ascii?Q?CbO8EnaLUVXP0hPBxK2sLqk+cqRLyMCEHeid4YSvlFECw/EIKO0GqBsMskQm?=
 =?us-ascii?Q?MrM+Dl0kB+bUDIrAk65rONTIKFme+X4+gfq4+M90ilxGR2HWCGDI3pqiet7D?=
 =?us-ascii?Q?SDNtkfhvU+1PCM2fieNLNazXh7UhQXTn/NIB5ZVQlQ1M3UVpG0M57xYrC+1F?=
 =?us-ascii?Q?m8ofRtxmoUrM1MNN8cwI4oeXOg+UyU4gFGYxTkKehsjyAqTN/nfBnwst7ttz?=
 =?us-ascii?Q?xeKd1oWx4qPjaMrWloqwhTPM+WdURUmMvIwQF8JvJvh5W7R9ZMRbMFxuDDAp?=
 =?us-ascii?Q?leyjbaCctA5xJ31ZEZDxzcynjwNpBwVjB4ytv0klmVPE9vvoX8rYVjyxN58L?=
 =?us-ascii?Q?QRVogk99hEzRSEawsJVLWlcWhcD4+mlrZR/jnG8gaD8fkL1VmRmLTCYqMKfT?=
 =?us-ascii?Q?LiLNq8fwI6jq2XpPm+PDjrg5QTj1xWAkrZ1vmzvQ2jKgoNvvGA4enZnY3R9E?=
 =?us-ascii?Q?wdc1W0d0TlkTXMBh6Adc2oCKjVkX+dAr0ipbJGjPIoxBU3bfCKHn1YeFyvXQ?=
 =?us-ascii?Q?VeJE?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7580f70b-6fa0-405d-dfbe-08d8bd572f14
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 15:22:22.5275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9/Lq1G5D0PnPRgF8RQgFfj5WFiWhi+lLmZyq+DQYlsRJSs3TGjCLh8oobc9/fpX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5531
Received-SPF: pass client-ip=40.107.75.139; envelope-from=alxndr@bu.edu;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Disks work differently depending on the x86 machine type (SATA vs PATA).
Additionally, we should fuzz the atapi code paths, which might contain
vulnerabilities such as CVE-2020-29443. This patch adds hard-disk and
cdrom generic-fuzzer configs for both the pc (PATA) and q35 (SATA)
machine types.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---

v2: Fix ide-hd -> ide-cd in the ahci-atapi config

 tests/qtest/fuzz/generic_fuzz_configs.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 7fed035345..aa4c03f1ae 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -85,10 +85,28 @@ const generic_fuzz_config predefined_configs[] = {
         .objects = "intel-hda",
     },{
         .name = "ide-hd",
+        .args = "-machine pc -nodefaults "
+        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-device ide-hd,drive=disk0",
+        .objects = "*ide*",
+    },{
+        .name = "ide-atapi",
+        .args = "-machine pc -nodefaults "
+        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-device ide-cd,drive=disk0",
+        .objects = "*ide*",
+    },{
+        .name = "ahci-hd",
         .args = "-machine q35 -nodefaults "
         "-drive file=null-co://,if=none,format=raw,id=disk0 "
         "-device ide-hd,drive=disk0",
-        .objects = "ahci*",
+        .objects = "*ahci*",
+    },{
+        .name = "ahci-atapi",
+        .args = "-machine q35 -nodefaults "
+        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-device ide-cd,drive=disk0",
+        .objects = "*ahci*",
     },{
         .name = "floppy",
         .args = "-machine pc -nodefaults -device floppy,id=floppy0 "
-- 
2.28.0


