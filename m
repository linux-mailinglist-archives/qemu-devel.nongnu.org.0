Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749533A2AC7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:52:34 +0200 (CEST)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJEf-0007vf-DT
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqg-0004Ij-Jd; Thu, 10 Jun 2021 07:27:46 -0400
Received: from mail-eopbgr20109.outbound.protection.outlook.com
 ([40.107.2.109]:37643 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqb-0004p6-Mn; Thu, 10 Jun 2021 07:27:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iy5RGpgz9DUXsJ2GiM0Am0rKoQPUZTDQkHYTdsAvOWsNkCZ9QkHRIJZWKhHTlJogwdVwbfARuoxVPLIhwpiecn4DlxM8OZno2xu/GlPVbl07bQCnFo417ksc760+rp5sues0Sukg0pm5bsV1YnWH0Qit/6j1w99bbYgeHUwrqo8tB2g8z74mYKYo7kGlg1JZqGjTZjPoLvRcnOVY+QFBqbFeB6Yf5ycDGjrmRRbDATewwKmHlmdP8O712F5c54FcOBgfeLkcU4FstC/2r7uM14SEvhnxIbCI8rDch4BIPi+pSjrO2L5+XGBRDjHdUcKPv51EfQcUPhLYoC98284qCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fdt/9kXHN1yQLBrMNRdUEjvnHhIP48yC5QLgDEN0ag=;
 b=ZiY/fRaw2LhNIWwjAa6+PdUgIvJ5/JZouC2KwlBGrGRHAQ9QDNGq1omvYdmD7axNizj/pQX+ob//DDMCvUEu7XlB8F/4XkSdeFQ0ddMYIyrCIRe5dI3kBFOZC/z4Zxc8gF5dLcMejybVtPPOcSk5tRFq1XMpY6y30UR2ZBtgmfTtsMi7UKYAhBoDTBWDZOaid9x/ttx5Nim1SKfy+tXBi9Oz3xCA0x7WH2W3t/jUYJ/lzBFgL+Q0snSMNri31eHBoW6ZOYxJae8aAXecYOzDVjSv4S0el21HEjQoPBJf0n3c+s/YplbQvpjQdhtgDDtfSRs5655EqVv52n5Jfi6qgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fdt/9kXHN1yQLBrMNRdUEjvnHhIP48yC5QLgDEN0ag=;
 b=qBosCiHTmlZXnobvzPTJqdQXC/Y+8yDoNRVcO5c8s55e1dQIEprifeeFMO2tvV+w714QuOaQdD18akFRf7ML+4GlCLPQScpt9g+amr3KQzAlvltmrv4VuXlVUhFaVR6WkmZZLq74dIUa9XJRLpSWESPfslvy0P5P+QAnpMiPNwo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1971.eurprd08.prod.outlook.com (2603:10a6:203:45::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:27:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:27:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 34/35] iotests/image-fleecing: prepare for adding new
 test-case
Date: Thu, 10 Jun 2021 14:26:17 +0300
Message-Id: <20210610112618.127378-35-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:27:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84962c41-d484-4ef7-6e1d-08d92c02af97
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1971BD66A241D4614237DEDBC1359@AM5PR0801MB1971.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1SwoAxT0ZJaoiEHhwz/2yHxBImU3qyi+p/u2Kd2D4YeHRSCDMicRunjdeMY0nWCrD/BAoLzkpGP/tlByXEVfvGaiggkikKnvgRRdrdBDM0NiILG4v3pksE000arvBxHxx9TSX16sS+X8HV8zv2xvTZq/2NEo8kksWIEXG8vBdaexm5sFpHCMJRrjQWm2+B5aCZU2v2+Nj8zlO4RPwLA2GcDpyiwrBv30GQ8RrWuDnrrShoE4chV83975HJ1pO0nP0PBjvEqX+31J/1TX3bcW4KFO37OH4pKYxjqGiQJI2HYX0t3ab+SiMT6hiN9U5g5sdDo77w1lssNJYmtHivKeuqDZhP6TAatWoto91kpmZYFIfKeaStTvJurgc59h0BVgFge6ncfoapmNvjP35Khz2SxSc/69QBI7ERr46ZP5rTh7r8078KMNy5DVe0QONSgI2D6S/RCMXFd7xYEo8VQRAnJsNa8cb+H5G4PCpMaPoeUH7lHiVmZECBwmhgb53V9Oqbz2M0krMH0B3zfTqB6EddwQ40R4VBWiJG6sAfJfdt5R7IMoC71A69jEeM3Au+UGPrREDUtLP3CWOTR30VYIzhb7Bw05HbTg/dfaNsaeBZ5NbjRtlSSyP3pavsxtIgqPYQ8uE1J9beg5HYapGWH4vRixlDxCymaCoviuF8cpAk++Ykfazx4KHBxozVm1iJ3e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(136003)(346002)(376002)(396003)(478600001)(6486002)(5660300002)(8936002)(36756003)(956004)(4326008)(316002)(66556008)(6512007)(6506007)(2906002)(2616005)(6666004)(66476007)(16526019)(8676002)(83380400001)(86362001)(6916009)(52116002)(1076003)(66946007)(26005)(38100700002)(186003)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xTlqQIrcw3ACXd4rd97jleCDp4MnIrpIwlrA3zGtr1FlckQpu8uZYBfoQHGD?=
 =?us-ascii?Q?qJcUq6/GfYRxX3QT0DtA30t0sSTuob0VyqdbVx7AowIGLkS7RQtbK0wiprjD?=
 =?us-ascii?Q?GzC3xCF2B/qi7a2MJ2mUGY48ASp6MguEfd94dAhXr0/g276WGtgIuRjSFmDz?=
 =?us-ascii?Q?tNiCfwLUj1vtBkzkauGhGgbvNj9HDQa6Z5u/JeDnc6tP3mV4PVWtM+fIi3vD?=
 =?us-ascii?Q?xaiobE82gaUchg+7EZJzg3A4to2V6SxpVEP/btdZsN8SaC+DGyQvsPsYcJP6?=
 =?us-ascii?Q?vS6wigX2Am0IUC+eYerxtyJl7IQWjSvLKRPRuJsU5GapsoU7mF5xaVX9zYXC?=
 =?us-ascii?Q?FSqidgCPQ5s2wCg6U7d8FvCYqbUAlzWrtMSMY1Wox6YrkqOgBn+YE6DDhxnK?=
 =?us-ascii?Q?/Q4b3srmdUUgMVMjHxncLLc5N1lwhDjFZZecsYesRRFQxL2zcS8wqSAPm10D?=
 =?us-ascii?Q?m74gtmPLK2EVPBhtYC0YlUs0UTIUMN9vCN16k6VQNyua7PJxKygah3VjrOxF?=
 =?us-ascii?Q?yKaPdmjDatS6FZJU+iyyWvb8LsYEwp1uUdneO3souzaN4ZlRdxje4N2R0AHs?=
 =?us-ascii?Q?PlqYkTU4yxu0fj43SX9awax0jOv5AqMA09ECz0e3rsWO9lykxq5tiz+B+P6Q?=
 =?us-ascii?Q?08l2gAP40ODFBkUd52VXi4CMeBuwTgKAVR8Vojy2jUWZZKCgXKeuyQD1N3X0?=
 =?us-ascii?Q?VUP0errtLiBcwpd/6Ui2j4b6ODHSx/CEY18VhZcitK/gZvte8z76cIklU+YB?=
 =?us-ascii?Q?3ke9YeK9apUYO5hCN00DzuMRpC1v67+yNG5/65Wr/hHor9UqRs7s0M97r4/+?=
 =?us-ascii?Q?/AeFkc2U7buKcU2MPODR8J8LD7ncG1ufuMb9+c1fLVpXbxWuhyG/v5eQo/6/?=
 =?us-ascii?Q?TzWWBzvlyrpv+UNlEm7cYYiLK0NBKjkJS0dHT7/9qGcKRHD1Eg7bYqadnzDu?=
 =?us-ascii?Q?H+cusmas+F3L6ZRoRm4VToQ0kPT09vkaUy53j3+VxeG09FpbWXg9O0Sool5N?=
 =?us-ascii?Q?8Yf1BzN9W7OaMWvaYMWAs5D20WnUsmCgAjSSAyiuMtyKQkttSR6vaaVvBVc/?=
 =?us-ascii?Q?EDjYELHMLZSWzotB6ys90iTigiew8LmAfGCxwUAQlaLhwkAuyNXFF0/sfXz2?=
 =?us-ascii?Q?Sxi80FRr8khzVNKPxWCw5gWsl6vx0X6Dpew5Ku4Zi+DTtio27MzuWM16NuG9?=
 =?us-ascii?Q?s0ZxY03tc6FydqfknTNYuEc4B/PcPj6An/eb+kktm+/8PsZLoFkytyy+bJxZ?=
 =?us-ascii?Q?mf1Q8NHBRX4fHYw4FUoxVCmexgyMqUqzpqUNQmfNMQJQfX6oMW4tROTTBxYR?=
 =?us-ascii?Q?Joe6Niuh3ViVlxQxSTj7Tflv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84962c41-d484-4ef7-6e1d-08d92c02af97
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:27:09.9100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSk4gIWT1O6TLfJDWcqO/ljPKU9qURBrVgbG1oa/lrEjp6dEB7Ns5mOid7iyWzj7C4qQ/hR96OmsmxoFlh9okyxgzDvfQ7IMwQ3khdMxUeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1971
Received-SPF: pass client-ip=40.107.2.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We are going to add a test-case with some behavior modifications. So,
let's prepare a function to be reused.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index ec4ef5f3f6..e210c00d28 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -48,12 +48,7 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-with iotests.FilePath('base.img') as base_img_path, \
-     iotests.FilePath('fleece.img') as fleece_img_path, \
-     iotests.FilePath('nbd.sock',
-                      base_dir=iotests.sock_dir) as nbd_sock_path, \
-     iotests.VM() as vm:
-
+def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Setting up images ---')
     log('')
 
@@ -163,3 +158,15 @@ with iotests.FilePath('base.img') as base_img_path, \
 
     log('')
     log('Done')
+
+
+def test():
+    with iotests.FilePath('base.img') as base_img_path, \
+         iotests.FilePath('fleece.img') as fleece_img_path, \
+         iotests.FilePath('nbd.sock',
+                          base_dir=iotests.sock_dir) as nbd_sock_path, \
+         iotests.VM() as vm:
+        do_test(base_img_path, fleece_img_path, nbd_sock_path, vm)
+
+
+test()
-- 
2.29.2


