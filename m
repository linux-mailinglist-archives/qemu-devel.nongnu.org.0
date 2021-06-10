Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440E83A2A4C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:35:04 +0200 (CEST)
Received: from localhost ([::1]:43320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrIxj-0000Pu-Ac
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIph-0002ti-LW; Thu, 10 Jun 2021 07:26:45 -0400
Received: from mail-am6eur05on2103.outbound.protection.outlook.com
 ([40.107.22.103]:32352 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpf-0004Na-P4; Thu, 10 Jun 2021 07:26:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csGxgQE8soKsJWlUiWQEZat4PSTvEX7j5buz8sci3tlhGvsxBps8AcdbHDePF6YTNjI4tYH9vzUiSuhdLhOaBaLv6rcthREklyGyLWuof4OhoA04vOdZN/i2PLm+drCNeybNijcanJ/2Pj46WpQWOrUHnOikFmlvVPNQ7+EkfvNY6Cyi22bxJLvbVj0mf6rjqixwd1FXyh3+icDnRK0akW7DTVX+qTLPliVZGPEmmI2FgkPzmGnnIzWh1WhIsUqszCHK+dSCoqvLEb0MP8w1dvIR9uarQuu/Hk/8M7GRJqInTHoZ6BRuw7jwsPkvj5ZcNiPDpjsNs/vVbVpnIhwZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjT50Aw6DWlp8So9JgiboauEL1EcinJadqO9w7vuNQM=;
 b=SolAt50/VtlKcQSIgaMbf/JNCHZH+U+U3K2W9ijWN42nVkvw23OmEjQanKnxdtQhtP5a74ZDNUfOWOAndeC8pOUl51xUVCF16KJhG5Yo3S6SIC2cAvH6ToHGbtSebX7xtyp4e4vcmuWINWYu0FdmmqjBuzBhmApy0/IBewM00O4SDj4gO3neZhYjClUvSwOG7FQW3+80GQA5k+SDBJNSmcsnZn7bcykDJ6mP6x9lLbA4cJsxmbIkwctGmzWkQF2b9viKqXcJKFE4S1vTnDjQayYSOVxVQK7KePUEtJr7steCC/3sLo2fF4BKWOlAPrIzL+/37Mi0UmQxPWOh6vPvJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjT50Aw6DWlp8So9JgiboauEL1EcinJadqO9w7vuNQM=;
 b=cL9+9xD+H5r+b9HU5sFgOTDK2oLXiEUQRu/EHCU4XF0VT5GC/xecgQN3NfF5iDXQHthbf0YWB0XWzkZO3VKKmSDxr8GQLLEqezGHIW0xihHIb9aUPyy595RDT69EGFEQdgh9cpVD7o0PrijqdzUtiRmrpMCyaMktTcCQdWgzS0M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3960.eurprd08.prod.outlook.com (2603:10a6:20b:ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 11:26:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 01/35] block: rename bdrv_replace_child to
 bdrv_replace_child_tran
Date: Thu, 10 Jun 2021 14:25:44 +0300
Message-Id: <20210610112618.127378-2-vsementsov@virtuozzo.com>
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
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79e31ecd-fa63-4f3a-4af9-08d92c029ac5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB39605D031E8C6459211276D3C1359@AM6PR08MB3960.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ulFV2OGTQ9BYhxqcAPf745vwH34OzjT5R4+hYTVgYvGZOUPB9sdDe/YtxW1o07Hd6bC4qAPua1wRoljEQObPQaCCRfQITGAGTxbwzI5pXjH+DiclPcMhxMkfSyN3jE9hR48pM+9O3OJcR1yJ0jD8x3IVkslKd+R6js42kDYmIXTkxTQzrdISAZ1m/8wU16iQk2GfVLFZJyxwlBjtbbxZ82YwIb8muEAdN8NSYkx9nZoHQr46orhQRVkndNQLFrzAZlWyrizrar2A7oZFVKL28H8VVRATf5UiWhCRDX+zjWTNwPIUa1pKG6/SJH1i5wmtUXnKtB0sGC2Qo0JFmb/SmHyJ7vxA4Rk/MrT2j49gpoWIiOiJJ04P4tnlmjCWUS+5lGPygut3pwPyxPqxJ9xN750cRu7/h/tLfBTizO48GgOtRaJBhgBB4I8ZzEVdfXOxE0fle+4etS332pnkV1ZNQwMPmSJhoWh8nQYwRDvsCKakSaedbL9UywAMCaVOEyxo8RLHSPrnftqWr8oLIuNPn6NS9RsdIjeEI+v8Sk6QRIVjSsO/vohX6MEhSJZvfi0P1UNwvK64N8QR9mcVo1m7TTpQlklURN3/x88NzTIMWkHtRzQYQ5LVDBmkfsCVys1TLLJl7cZ+k2KEvspRwNJV1++p9+XZC6N6B8uDmJlxWW+KyJqnkZjVvbGzNVZx10EO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(346002)(366004)(396003)(2906002)(8936002)(2616005)(86362001)(316002)(478600001)(6486002)(16526019)(4326008)(36756003)(8676002)(66556008)(66946007)(66476007)(83380400001)(38100700002)(52116002)(38350700002)(6666004)(26005)(1076003)(956004)(6916009)(6512007)(186003)(6506007)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6VNxfzyveY5Uqlm3ksdVh2VO/sohnqzaoGz35LjJ9b+VQhLRAN4Kj8AzeD/U?=
 =?us-ascii?Q?mhZMEP9dZlTs0ob1gDhRJgA+8VyMwvRH7ecSNlbINYxLZUFIqK9KZ4zwvxW/?=
 =?us-ascii?Q?l9+OjtJHQ11UCWs+YXFhCuw+5cmFzuZbQ/tlBDvw0jEdKYQbjSW60UATEPY4?=
 =?us-ascii?Q?u6hWKD/UsmRaDh6y1emIer/of/v6nGyVn1ichC3uS3qAOPomKnD5vMTTHplU?=
 =?us-ascii?Q?QpRZt+fYI2tJrr6f6QARW/TXuEDSmOeJFQsDeDwWFBYGLpKBKS5iMm/XV2TV?=
 =?us-ascii?Q?poZFD9O9dBwKPrFvtQuW94U/cVbZ1kFR+BeiSMS1akQrudwSb6W5iwXZcOYz?=
 =?us-ascii?Q?0lETNjm5m9iFX+XKJ/VxF045MpzAs2BjJCO5qALVosjaTMRQ0zumarMMpIK0?=
 =?us-ascii?Q?FW9To+ZxQoWy+fZlCSqdVHBV1Vu//2KW8RZU8LW1zh2chBG2BLnUrsMhpV39?=
 =?us-ascii?Q?mvN2VWV64nSTxLupL/n8kiTIiizGRYki0+BB0tvmCnWTN/rA0Yopp5kDjPUb?=
 =?us-ascii?Q?pNGrNScn2VUFUSP6ezzsTbKOXsNZtoEiWGKSTjQo1Gy06a25FROpvw1nIWao?=
 =?us-ascii?Q?mkhaCUVj9EtlSGTsieT6XQccP8FSa+vVm7V/oaxOtW33joiYxNlsmFHG06Zr?=
 =?us-ascii?Q?YfhYqmCfZQHmWm5ArnHFdy4zUYJK/Yslw15VvZE6oN3beSD+S5PO2s3dEnuH?=
 =?us-ascii?Q?lXI0wWm4SDtOAjyzxrJLJCKa2c2akACDLUOWuCcxcckYHur5q7fJrrONB5CQ?=
 =?us-ascii?Q?rGFTvZWVv7omMOx9L9MJqnQ40KN6KsrkdGRCO8a3tPP83Fy7ZLbW580WAS/U?=
 =?us-ascii?Q?W2XSxRMfr0iC3uesDDQV3T7FOHmjZjKLmvwIInEUQ4lXvRNg7cdJ8AdFZIkL?=
 =?us-ascii?Q?x0mxof+8jAxGRd7deS3/nTDO4MNfYJ/W5iKFcnz1dDSbVOrqLIjb3RHRBq+C?=
 =?us-ascii?Q?Co1yY8aDHGe5H0NJLRgO9f776T2c2IqAlFwZxVefgi09EHQ93B6AHUyNueFU?=
 =?us-ascii?Q?lCmX1LbandRTfP9ksyCXDvNCtxylrIO6TxYDldo9oZ06zXcliB74dYTinjGH?=
 =?us-ascii?Q?+nKdjPs6DA4dXCwoAtheD9zpjVVujwZ73YN4aXWk4RRRWsg4cm7KjLbU3HWc?=
 =?us-ascii?Q?8cEny6usH9hfVyMs6RmFnNSeyvRTzhY1agMZkzcHxq5WAwIGCcYFynqB8tdd?=
 =?us-ascii?Q?7H0odqVWYMlcA+PBjp2gqryQ/qEDlfNjvgq3mOsrfPvZayB3TjltzrPwN6y8?=
 =?us-ascii?Q?8X71Z0Xz/GcPXjI+P5lDY4zty691UVWt2O3Ap9ik/ySI4IgMrFAUvgG0uEkA?=
 =?us-ascii?Q?mgDDo03hAdNQBuOJgufJg5J/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e31ecd-fa63-4f3a-4af9-08d92c029ac5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:34.9127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHLO8wiXIvwnxdAxDtuo8HNF1+xk9kq97gzNS/47/Ab9H1+rn7JtOj7LoYpuE7vW367zGdh0ABWGUf3d78u59Jaadn2UPwZoGj1nlJp5Ha8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3960
Received-SPF: pass client-ip=40.107.22.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

We have bdrv_replace_child() wrapper on bdrv_replace_child_noperm().
But bdrv_replace_child() doesn't update permissions. It's rather
strange, as normally it's expected that foo() should call foo_noperm()
and update permissions.

Let's rename and add comment.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index 3f456892d0..34bfe4ffe8 100644
--- a/block.c
+++ b/block.c
@@ -2249,12 +2249,14 @@ static TransactionActionDrv bdrv_replace_child_drv = {
 };
 
 /*
- * bdrv_replace_child
+ * bdrv_replace_child_tran
  *
  * Note: real unref of old_bs is done only on commit.
+ *
+ * The function doesn't update permissions, caller is responsible for this.
  */
-static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
-                               Transaction *tran)
+static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
+                                    Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
@@ -4766,7 +4768,7 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
     }
 
     /*
-     * We don't have to restore child->bs here to undo bdrv_replace_child()
+     * We don't have to restore child->bs here to undo bdrv_replace_child_tran()
      * because that function is transactionable and it registered own completion
      * entries in @tran, so .abort() for bdrv_replace_child_safe() will be
      * called automatically.
@@ -4802,7 +4804,7 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        bdrv_replace_child(child, NULL, tran);
+        bdrv_replace_child_tran(child, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
@@ -4842,7 +4844,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-        bdrv_replace_child(c, to, tran);
+        bdrv_replace_child_tran(c, to, tran);
     }
 
     return 0;
-- 
2.29.2


