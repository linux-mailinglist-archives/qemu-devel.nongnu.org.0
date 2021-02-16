Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D719431CE98
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:03:44 +0100 (CET)
Received: from localhost ([::1]:59490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3lH-0008Bb-Ru
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lC3UK-0006vk-UA; Tue, 16 Feb 2021 11:46:12 -0500
Received: from mail-eopbgr60108.outbound.protection.outlook.com
 ([40.107.6.108]:14830 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lC3U8-000776-Mu; Tue, 16 Feb 2021 11:46:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzZr+rv0wEdiNFeIJylESztAC5oaH5H/SLzn+cuYEUkBNbSDsVwu/L/AgSJ/Z+c0lBUY/zXhzJx3n+bVadDraV6GlijGhQarNWLeNU5dWBRcgRqdsn6WolrzCXjWcNtHE1nAo74kpXTfOc6hobyFuRqi0M9AiS9/avijALh7c0b/mmx9McWqIIfeNgQ7Xhx63rZ895XqQMdd1sosX1DSTfTwfb6Ed0G0merGdFsCjZqu3JcKd20AHj53HEHPBrYcF0OxfLLWPNFYX0S9YFQsNg/7cymbehVBQpaSgmLP3PZud/Zb9/m/yHRBJDG9SMp8NyNrsFMCoKG2e1bf2aAlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4UEnUbYTFoBKaZc+b+I+KyHCL+5hsseuOD2oqDnG7U=;
 b=EJbqfWjDG+3y84IQxMnCaGOlhx3f0UD5cCui9R/JqeORVIpHQ0Q9Uu/8Et+yeOvFhttfUajoCPbenCD1I5lRxx3spTA6hHFzbbJG7ksKz61F9x5w2WOgVOZDuijLaMLgonTlvVzyiDE2ScEtKewttPmsCZrRm+g0R88/9XgQ+qAMoUIy75PijpP8GE74aJmior2G3Pp0eoqWNHAhOnG3sfk/VuJOF1kS2hnctA9UwrzWXnmCXW/HMgucl+16U75IhbzldXZNVTyvSlCBDAGgUWMC7ag3GW5tnvt3YypuX/wYPEUaaxsTCdlf33DvHLHzgsf/gaeuILlFVM9iuErk3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4UEnUbYTFoBKaZc+b+I+KyHCL+5hsseuOD2oqDnG7U=;
 b=YTxvq1Ib+0+4jVsbVmPAhu//lwLko89cFXZwCyNMAw+StIsQeKIiRWgtj3PKuVMpsBFUwmzJ3sKReEg2b9nKnYQGxWqTDICv1P9AeoekTG4/q+BZtRluZLYCBhZpAAewRiupDTpSZNkJpN8Bu7hGI9dLpnk3urahXsBZGqHtzq0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6359.eurprd08.prod.outlook.com (2603:10a6:20b:31a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 16:45:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.043; Tue, 16 Feb 2021
 16:45:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH 2/5] parallels.txt: fix bitmap L1 table description
Date: Tue, 16 Feb 2021 19:45:24 +0300
Message-Id: <20210216164527.37745-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210216164527.37745-1-vsementsov@virtuozzo.com>
References: <20210216164527.37745-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: AM3PR05CA0149.eurprd05.prod.outlook.com
 (2603:10a6:207:3::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.244) by
 AM3PR05CA0149.eurprd05.prod.outlook.com (2603:10a6:207:3::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 16:45:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0a6780f-dc9f-4bce-9e5a-08d8d29a4c30
X-MS-TrafficTypeDiagnostic: AS8PR08MB6359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6359A1296E4E46BFF8B3D716C1879@AS8PR08MB6359.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P1rJ4Y8o6AL7kmw5eX0Wuj5dsy1aMWyuNmps5znPVih0rOO4JCtfY84eO05Q10Jbg7ZmP8qkwKLviyiV3x9LPbpJw3IYSIyUdBFrC8A5JExVtRm8upqAtgY9KyRaa0mex1o2ARgGzHtW35rdHy2MVr4CpwWaAUOEPRXFk/LZSarMWjVN1bK9mDad2+PAOpaAoB/vB6agBJT+KXWGGefbpW9yDHQocRvK+UmEsCawSUNOoVcooRh69wgAnNwrkb0x9NR1xGSVV68EcUOXjTkqA3l7Bk/EO7Pbp2cMFyojQLI+WC+wcRE4WALuEWv1yGSqhF1Km/kp/ntMEWZx99WfgdbYtXU85LAsDHtzI0FUZQ2X3ArTDaZe8k+eIZerno6/cuXCqOB6B96kQSklwIcGUk/BWzC58hxcNkCWZtV7cms0wTrrPyG5e0nmJ5y/Z9r2EU6twoWWddcU80+For2n8XjKwPrfKNipdfg3mTgpd+SYHZuuwxo8w5i9XROkSNteRlvZuL4IsFDD92KBopxcKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39850400004)(396003)(8936002)(956004)(316002)(83380400001)(36756003)(26005)(8676002)(2616005)(5660300002)(1076003)(66946007)(66556008)(86362001)(52116002)(6512007)(186003)(2906002)(6486002)(6506007)(4326008)(16526019)(66476007)(6666004)(6916009)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?h08EGRaffNpXnW3veb3MjnBNTdPds39vBzcLa6kCQiWYOk7asleQ01p5y9y9?=
 =?us-ascii?Q?hPgXTrlX6qZPuCQUJJWK4g0FtJLGAF6o8mN4SLHLmBV6t1UEpcXLkzxMmmvM?=
 =?us-ascii?Q?Rf06AEsE0DmnDMoNJNCZUsKicdUUULqkJcjyOki4xsbcVuRb0EiD13Rc/4Se?=
 =?us-ascii?Q?nBjMJkHvx1nubXwKXAGzhkeznfrkaT+ST3vkmjc4LkmH11LcgQwsneBvsuJJ?=
 =?us-ascii?Q?16+NuK1WgCGmd37sosS0Ls0VMu7zf5LRt2sYDkR22ogTFdpyt7nElEgqs+Yb?=
 =?us-ascii?Q?DQabAyx3sDpkf+j/laJrE+vvCKwWpmZ1qw1AT/aMJOF4ga9JkG9g/T4KWDWv?=
 =?us-ascii?Q?ChPVe9wWeVrWpO6mD50Wwar08ehgUUWvdGv9LAkDphrgztLUW9+m0R3neLjM?=
 =?us-ascii?Q?4PyBHNl0uWQt84uzr/Bc7xFs3+kizys9vBV5r0OwJu7GcISyFcvW909HIfIz?=
 =?us-ascii?Q?XdU5nFrB1q6jH+uGddQn3sHcMgsdgGrjfUhjuNWJnfH9NGKIMD3s48WyV/V6?=
 =?us-ascii?Q?MKO7iTCANSFOkUs0tf7t8tBmNWonO2odJx4I2Pckgz2JbTn6x4e5Ky8AjDA+?=
 =?us-ascii?Q?UnXHkXybTh1MP2qdVGhdmdccJbK3XCgIWtD1jXITbSE+DnrfqdWrjyMzaZnx?=
 =?us-ascii?Q?uwlmmKbof9VPY1GITwoBSgyKuAeu5hWt67G4qWBNBncxFNeaMS2dveL/34z3?=
 =?us-ascii?Q?ej6DFRMFhN66oY4qIGLGT5RPfshLoDmKnfQB3LYMZUPAaXTp6h7ghyd4of6Z?=
 =?us-ascii?Q?xDD1JjKeaysA8ZFn2lepDx/LZR4SZLvZ3xQTqzBmYib771n+t2wDsVfmhogq?=
 =?us-ascii?Q?h3ObfZH1uZmRMF9SarWH6uYWUEv4g6hFuOnbcF7ztnXeWBGcEQP0Otspe0KK?=
 =?us-ascii?Q?MGO8OV9x7AkWpunQhALIypvGOuPxf43B2HwMDklfVKFddzd0kLt1Na4Sj3M5?=
 =?us-ascii?Q?pNuy+NMCm5T0K97cRHVzH60oZbKxL8POOxWmVd0Rc46V9iBSKqd5O/1sFvM/?=
 =?us-ascii?Q?t+yKywqMnP/MImlXgQb6rx8ZsKIW/+p25LUK7trpdmfR30t8h+fFqkOJJEpN?=
 =?us-ascii?Q?ZzJFK3PSYWXYwG+F/QNpw6Ej+dOywTwPtUHq31EVmVVjDe0xEEbFYmuQ2myF?=
 =?us-ascii?Q?eAVq6OhZWYMLVXBOtzr/weTxNcLPrZmyrocxhztKwtgrf3TCUr5ERTE8GJvR?=
 =?us-ascii?Q?R1Ct7OeNjcUbkEfWfYlKJhWOtXzu0r2jRvn7wYoSK5S9+Gum4CJftZwfY8dG?=
 =?us-ascii?Q?NdOQpCHv0S3EU0p5on0oMITYIxW96x9z3re/trBHDEWt8dBlYrNj/3XiRVPD?=
 =?us-ascii?Q?uoIowLT540u4Z7N8yM6WQhbm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a6780f-dc9f-4bce-9e5a-08d8d29a4c30
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 16:45:41.9967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfLahewbp1wzAiTrUJZeCyulKL6qx3Mo9jt7qS4tzQiKzyVMt+OGGjzeZlynI3uiZNo6TxBTA4HOlLRqcr7PGLwuyAUDAUjXQu1p/kP1RIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6359
Received-SPF: pass client-ip=40.107.6.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Actually L1 table entry offset is in 512 bytes sectors. Fix the spec.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/interop/parallels.txt | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/docs/interop/parallels.txt b/docs/interop/parallels.txt
index f15bf35bd1..ebbdd1b25b 100644
--- a/docs/interop/parallels.txt
+++ b/docs/interop/parallels.txt
@@ -209,15 +209,14 @@ of its data area are:
               The number of entries in the L1 table of the bitmap.
 
   variable:   l1_table (8 * l1_size bytes)
-              L1 offset table (in bytes)
 
 A dirty bitmap is stored using a one-level structure for the mapping to host
-clusters - an L1 table.
+clusters - an L1 table. Each L1 table entry is a 64bit integer described
+below:
 
-Given an offset in bytes into the bitmap data, the offset in bytes into the
-image file can be obtained as follows:
+Given an offset in bytes into the bitmap data, corresponding L1 entry is
 
-    offset = l1_table[offset / cluster_size] + (offset % cluster_size)
+    l1_table[offset / cluster_size]
 
 If an L1 table entry is 0, the corresponding cluster of the bitmap is assumed
 to be zero.
@@ -225,4 +224,8 @@ to be zero.
 If an L1 table entry is 1, the corresponding cluster of the bitmap is assumed
 to have all bits set.
 
-If an L1 table entry is not 0 or 1, it allocates a cluster from the data area.
+If an L1 table entry is not 0 or 1, it contains corresponding cluster offset
+(in 512b sectors). Given an offset in bytes into the bitmap data the offset in
+bytes into the image file can be obtained as follows:
+
+    offset = l1_table[offset / cluster_size] * 512 + (offset % cluster_size)
-- 
2.29.2


