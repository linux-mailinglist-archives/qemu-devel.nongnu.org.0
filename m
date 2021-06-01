Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7CB396E71
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 10:00:05 +0200 (CEST)
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnzJk-0002PO-BU
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 04:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCk-0001jl-M0; Tue, 01 Jun 2021 03:52:50 -0400
Received: from mail-eopbgr140102.outbound.protection.outlook.com
 ([40.107.14.102]:37351 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCh-0005zI-KP; Tue, 01 Jun 2021 03:52:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNH9AjMxjVD0mv0Vm43VVn+G/Qap9qYntU6NsElCQckDoX3cT11CXB4flUJRIWM3+JpcEhA4aq7rqKfo6Xd+ruI5zDHxce+PcvzZvDUVYm/afx9+W+6g2SAGght5tp3ds7ek5+z/y/wR0MYNuX5Kxg7HCCnL5DyUpmrMsFVlY0v6AehTx3KVRjxm4bMaVh7ViiMYbHlspa5lHCMNtunb1JRnBkZiGQ3EuYjGcEacxLqfqiUcfYW2zbXGHvnE75St/pLh7/gZlpbAiH4i+wcxQVBMtMp4vSTGcjmtgmsbgvwnDZ+TVmkOMYsi4Q87ZnV9RZuLBxA/KLqH6++85qlNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGolGddMwJO+y/2zkrpYTTrWHefFadaxwp61cVHonuo=;
 b=XmF377NQjRR9HgsBfbHxKsLQudvEJK9OwUb6NQ1eo+4OdSJ5Zyq4w1QqN/x975qHzKHVQTIuHWic4GtYNXHKWkEkhrnREd2eCm3h3wJC27lgChTiWKb9hozO1fxfLfHLREoL27h9pFcByBnJTi9tyLPc68uGVl7dlqO056s1BPvs3RyMx5qhZIeV1kZnibDLa4IxB4tiJImDzJu5ZOhEWiSQh18nznatQSHwtO/OPB/mg9Dpx30AdhsJRUOzfpIZsiUT/UtsmYvQGWpIDwE/0yp4+RF3hQB3t+WS5N1nkXuL0V9Dv8U0DP/ZpsE/fzMdiZkT9lKPZvOpcV+rmXX9BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGolGddMwJO+y/2zkrpYTTrWHefFadaxwp61cVHonuo=;
 b=ARQZWJoKAbG5pXy/UjerxvoRkk6b/TszjNpFiB1UWev1DVfqrxWIwWDwKCz54mfX4OKvGanvA+xoYSfVCHUTmFaLJ4mPlQftE9zSJWktWB0TzqW/6tfcPZucNP7lC3z+T4limNcpACcMK2G2Za7rKEivVwpzNgSaCExhQ2OFKfE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4952.eurprd08.prod.outlook.com (2603:10a6:20b:e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 07:52:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 07:52:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v3 4/6] block/vvfat: inherit child_vvfat_qcow from child_of_bds
Date: Tue,  1 Jun 2021 10:52:16 +0300
Message-Id: <20210601075218.79249-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601075218.79249-1-vsementsov@virtuozzo.com>
References: <20210601075218.79249-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1PR0802CA0018.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1PR0802CA0018.eurprd08.prod.outlook.com (2603:10a6:3:bd::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 07:52:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e07d1273-f16e-42b2-ffd0-08d924d23a27
X-MS-TrafficTypeDiagnostic: AM6PR08MB4952:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB49528D80107D9CCDB7D1D57FC13E9@AM6PR08MB4952.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kpu5iARvcjNMxD6hJ7NbI036sPCFOWshyYs56JVM0oR1Qijf8wgMWI5oYJlACxDwLU9DUbtaM0CO2X7insfmJfTzpKECMjWkb9DvIzZhgGxH8Nh6drpcepje12xWDt7g/XbVT3VFJl5gf+D2LKGRtbZkSO6a867OMFo4CRnfKug5nvbE7cnuuSlswwAt2uxTrOXhwI51LNtuTpf3UpJ0uWyPiN8Ft/e8menlTW0NZg3SBCT54eEBKxY0/wqTX+08BLwprIiw5Z5CRyfOzvQn4WmUYsG3RQCt5ALsyRhDFr5AjIoev8vgor2QKMl+WEZ648WKJc9ptxezq12x+CVIcNOb+uu2/B43nON0KNEX/e44Br/hcf1BwoxnmJT3vYDRc1Rb3FyvrGzfzzdLmFbtISB22jlSpTCrrzfLtJpXS3+602d7YPFen/C/OVCD/mSgW9p4XnYaQ1+/kXdGgR83iOY41VSE24Oj9Ve9wLmlgSdtcIaC5wQ0yfcWqG0mbr67IclqJeYCX8L1zTQRuYgWfe9yTtpXNpWoeyoy5ssCxn4J1pZCCdgTJHOCZdcNfI8gmbeutGQrcv+fjGo2OsMn7MVtCCeQZp14ejl01CoD6bQ+wOuu/iDcQecZC4sLVcd6WlfiIyVbgxZ3+0MDsRthGEf9/5fYGCrK5R/wt+1krUy3BeQHCC14UPoHEUY/iHdq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39840400004)(396003)(136003)(376002)(16526019)(6666004)(186003)(66476007)(36756003)(66556008)(956004)(8936002)(6512007)(2616005)(6506007)(2906002)(8676002)(66946007)(5660300002)(38350700002)(38100700002)(6486002)(83380400001)(1076003)(107886003)(26005)(316002)(86362001)(52116002)(6916009)(4326008)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1xeF5Czz3ilQ7sVTez7kdsWMOlFd0kW8Sg6yem48PbwkTpIwcvGQvBMbmImJ?=
 =?us-ascii?Q?VJduB/C+xSO+waaCKr2/IChz53qtiL+Qd3nKip96kkiPM7kTJUysCz1jpTOU?=
 =?us-ascii?Q?YsGDI03PxTkMhUoX9gi46UqSuuXYaQq+zJLGQEKlfiYETUbzeINLbTP0XVkX?=
 =?us-ascii?Q?3ylj8rXQaPB45BYuOvx+NtCfjDQ329qTUXC7zfTtJnj9PaA2sohh2WYgE6dX?=
 =?us-ascii?Q?DXr2GajL+Fh3Y1xOi2vytNCB5dkrozJJ6CAiFkniIu2rP+9KZsIXnGi4fU37?=
 =?us-ascii?Q?MyHI2UeDcqQEu2jolcBUuMw/3OiPhOiLZ3fRnKJwY37GJX/Z0c+LOeabImS2?=
 =?us-ascii?Q?fL8IKhNxmU5iIqfxA5AhlbDDE+yOcWOs0YMPSp6/cYnPnJsIg1BjG0+7lgvP?=
 =?us-ascii?Q?k1fwgnpjk8N5do5APpoxI+sJgBmg9GN1RndnjDF4qR6A+ZcVbPjgh41ENIkw?=
 =?us-ascii?Q?5ZooeAcE1GMlQlyRbMpXzvsQxswI6RHrGlq/e/6tRKFypqsj5pbF/WHVWoWJ?=
 =?us-ascii?Q?244wrbZhQ2knmMSlFkp80TB7I8dpbAe8h5CbHQ7GTk2L8Dg+wi18D+wWF2m0?=
 =?us-ascii?Q?U07skrIsMXqCXSoDkXQTj93Cm6pI946MDmb0I+h8m1zvp2KcrJmf5p0AYNvh?=
 =?us-ascii?Q?kEWc8HNQlAF1NfNCtBzsp916kGnGOz/PP06ct2be7nV2yZl2azVtrvqf/eax?=
 =?us-ascii?Q?ULGqMQJBZu5UDoq9bWjrhVPzygtaJQYqVG6WOYI+Tn+5oXgUbIZNifqDJRS+?=
 =?us-ascii?Q?JlrjcJKd++5bmuzebDtEQxJa0X70ychEx5h5aS2yZ/NYCOwDdCWFMHYQZj3g?=
 =?us-ascii?Q?CjK79LZD53USBgdm3/fquKpN3rDjJK7oa3Ddn9WwHcUFjxNhfDRkrtW6U7n8?=
 =?us-ascii?Q?iVJ7iSwpGPn/r1n+xy3j0x3DE9ZVyRT6ekJbC5fnTRrsI6CeGHghnwuNIBfN?=
 =?us-ascii?Q?++Reg9scVkcNfbZMvF28hpk1E6h2tqCwdDCwzE2bycNAmkGILeYxXpzzT7pt?=
 =?us-ascii?Q?xhHK2dK5m7KrtXtYEwGgzAUUXIMAshmU4/ItNPBkm61WIPDFuZU+prl6CviG?=
 =?us-ascii?Q?G5f1Aa55+71JSE667JUiOTceMFxZrCXLV2Wl1z9sMjZMwFr9OFeO1SiQCk3B?=
 =?us-ascii?Q?wX9+dq5i6y/b4VxMl3RFa3NlZr+3JQolQSqyWpYJbosS0xo8tmegonYluay+?=
 =?us-ascii?Q?1uKsmtgVNVDvtCrKRMvO9qO96EKnkrT6yX9I6ZSI4BkHGXyV/U/QQfCW3iSv?=
 =?us-ascii?Q?Fy0JBoZeTlJWe+ED1BpniqcUdmjHqqNAoIvBxrAcTftDA6F7FfWLw+CaVTl0?=
 =?us-ascii?Q?f44XZu7T3Ay2XPHyt0fHq3aS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e07d1273-f16e-42b2-ffd0-08d924d23a27
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 07:52:38.9447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iB93qZ9URUWaujQzKhfg4R0gKLeg7kU5m2ua+xOBz5DGEt0ofGNCTNiS0rF8mo9uSVY3OHp+oxodofAmJqUWGM1tXMBpVIqlh+QZCRtzr7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4952
Received-SPF: pass client-ip=40.107.14.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

Recently we've fixed a crash by adding .get_parent_aio_context handler
to child_vvfat_qcow. Now we want it to support .get_parent_desc as
well. child_vvfat_qcow wants to implement own .inherit_options, it's
not bad. But omitting all other handlers is a bad idea. Let's inherit
the class from child_of_bds instead, similar to chain_child_class and
detach_by_driver_cb_class in test-bdrv-drain.c.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/vvfat.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 86d99c899c..ae9d387da7 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3127,11 +3127,7 @@ static void vvfat_qcow_options(BdrvChildRole role, bool parent_is_format,
     qdict_set_default_str(child_options, BDRV_OPT_CACHE_NO_FLUSH, "on");
 }
 
-static const BdrvChildClass child_vvfat_qcow = {
-    .parent_is_bds      = true,
-    .inherit_options    = vvfat_qcow_options,
-    .get_parent_aio_context = child_of_bds_get_parent_aio_context,
-};
+static BdrvChildClass child_vvfat_qcow;
 
 static int enable_write_target(BlockDriverState *bs, Error **errp)
 {
@@ -3268,6 +3264,8 @@ static BlockDriver bdrv_vvfat = {
 
 static void bdrv_vvfat_init(void)
 {
+    child_vvfat_qcow = child_of_bds;
+    child_vvfat_qcow.inherit_options = vvfat_qcow_options;
     bdrv_register(&bdrv_vvfat);
 }
 
-- 
2.29.2


