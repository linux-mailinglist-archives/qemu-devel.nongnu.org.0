Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120D736DC89
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:57:20 +0200 (CEST)
Received: from localhost ([::1]:36204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmYx-0004ST-37
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxu-0005ns-Cv; Wed, 28 Apr 2021 11:19:04 -0400
Received: from mail-he1eur04on070b.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::70b]:4079
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxh-0001qz-PK; Wed, 28 Apr 2021 11:18:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMtDQeBFKOMiI/HazPFPSVJyYTlhW/u9PjdJ7k0lOjnJutAyeZ2kB/ssg7TFAyvBekqMvbo4xV/JRDBxkPr5tWqNWO4l2PpuaAaZxgwZ84mNNec2++cPO05aZ0pvJuc0p/bSphSNFlzJYiCmO+TnTt8zcRmsSa12mnL4HrvdQzutHkodaIcrjR+u18kaw2RzJ4yp4QtAMCUMlc0xYwAfofeyd1adk3vlmQAID613LOPScJ1x/pUPkug+e1fpdUZ7X5uBmcsxo8ypenvSYLnPmCL7kSZEFi4M3XZM/sz556sTAAjUXvb4QEHjaNujQqPzKqQLcJi8IVOWEEMAFlMzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+vqfQPy4CMfVwavJ26Auw0ZBXkAQxypORNCWHGdaVM=;
 b=WFSmRAAOJoKklvmbGzeMAVde+KrejlsLYm3nTmmrSvSObcKbhBgJ/KKyXdK5vvjxwXimPrT1i1VucaF5NezhnZ/xfV+pzTpDzzVjhKEK2QPjR/TXUgR4Iq0M83LdfEvM5dZTg5dIhLSTZdQ2Is8RC60eBWCX+x6R+QfsIrz1ABFIijmAAAYmdd0dSSTYFUKHWkGU6+dmTFs5/B7vSVZUuXQ6DCRccV/iqRwQkiOuHeEr6GOMOrHpwq1/zi3t1BeYzzp278hbuAoRcWBL3t67j5E1O98zkvODoO1Z4QmFXvnvybeSkpQFHi/Ybi3C9+a+rPW9X23CM2a04Z1PPu3fMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+vqfQPy4CMfVwavJ26Auw0ZBXkAQxypORNCWHGdaVM=;
 b=G5UM+ha0VWSNzwzMVYUWiTPb/j3IlZVhgzw3ZFEUC5w0owYaji5mCtJ3WNu6rcjQ3Bj/n/hDVXiva41oHq8l3RS1Ynt/IGcBQ940rsqEa9ddgqPQNPTgGwa3s3fw3OSSXW064eEAWmgjRdYLsKnj+XAv9/fic7Z7y5YqTXMyeCM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:29 +0000
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, Alberto Garcia <berto@igalia.com>
Subject: [PATCH v4 07/36] block: make bdrv_reopen_{prepare, commit,
 abort} private
Date: Wed, 28 Apr 2021 18:17:35 +0300
Message-Id: <20210428151804.439460-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9b1a56d-8db0-4552-83a8-08d90a58e0f8
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5909C43258763F1E30B4DA90C1409@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kZU6QC0shv9TwXO8iwLm50mv8NfX4iL+URqJ8KdOb/Ay/Rk6VLhyY1ZP05UQbEE09aAtj1DOVTSTxU1UT6naVQng+iOhXH2ZkdlnRReJ5vAlVgPSAsf94ZKopDEFLY5oEbWupHBqK2/xSrA7NiAXctCLQYXso/j4q9T+sn101Rda7XrL1+8b9OykqclHPYT/W+zFTdF9NVB9WDEYT+XkOez73K/Np/6UpaTSqJsnSy4QmnYF8QRpLNfEZGi8DC1/OdNbPSXlsb1ymzFpSMOMf4PhsqnMLoxfuawF0ivjJbjt4Ibc9WKNAOFQWZLBNjxT1eHnzQX5IvyuEEw2RN91Adv5tDVnX/LzSOhXtE6j9BaUM8T2YqCGZLvswYPUdGKFeCpEC70GGMR/jS5BNJV/TfzuUHZ2G5rcZnpMJv3dYwrpVm9xZ8AGAAoOMOhia3sR4dluEkWi5du0ocydA1ugP3w38sqfU1+DIZnMoxIExyCQlpHVrwQOfn0YDXL/HryWnjAHcM99h+rYrGZ8RKNq7CYGYYzcmtUab9LAeMuvZ0dulc4ycT3O2JDOTyhAKWIQpVEwlnlub7cykrcv8h0bJh/zk9uNjiiLZwl6sIsK5cPL4BMfQH3MDgAUXM0tDhpP88g3G0bkIW7t1SebjcZevLPNneNXerknZXS1CdZnuWm4A+Vp4y5SHBm4cqFiHTV4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39830400003)(8676002)(478600001)(83380400001)(8936002)(36756003)(5660300002)(4326008)(6486002)(52116002)(6512007)(2906002)(6666004)(6506007)(66946007)(26005)(86362001)(38100700002)(186003)(16526019)(6916009)(38350700002)(66556008)(66476007)(316002)(956004)(2616005)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?u+ykHR6f+HOiMlRYdkCRXYCCk0xIDvx00kLuhFgQ+SqvTUcUGcVPtLP7deo7?=
 =?us-ascii?Q?aYk5Bzc3G4OwPtkQGGXNoqxtpeDv7QlrGIIIc+yClTpTve0fQ8O/HrLSg9lc?=
 =?us-ascii?Q?0oiKXv9ZQTZAwhLmswILjWB812RXwG76W7jKr2ZJVM02Hr80uvEvlX+V+m9p?=
 =?us-ascii?Q?NQpdyZ+pt4ltshymyCTl38fC7v4zMIdwz+Y7A8y5BBdyBbKCrLGUQOXNSJxp?=
 =?us-ascii?Q?MjS/IreL7PPIFgNlXkAnMkMmWgWibd/SAaEblzN9hlsgqruV37hTWEtzX2Bz?=
 =?us-ascii?Q?Ryx90frvDM128gu0qcPg+xbTevOdBYmvXndOW37ipqV/GL8pIzW13QRxVOIu?=
 =?us-ascii?Q?k2dpN8an81dVzsQ7FHGdQbIIJhxSwsXtCSjoWrpXX9uoZ4PUIa86GTEqaus/?=
 =?us-ascii?Q?Yj/I/FMUHhxcKPmXcy5iBMUEtPkBAWy+MMvXBnBt7l6jBRZrFpgIbenPyPwO?=
 =?us-ascii?Q?L+X0zPWO8tTrqbhmICz6st3/jNYLG5RpV2ennMzNvXAi0Wc9re6isdU4naLG?=
 =?us-ascii?Q?yRAiLAenyGN1WqZD7l8+OHFFhLSzagsDsm9Sr65cOZn0LuXGvM4DZViifLo/?=
 =?us-ascii?Q?q3qC52szIu7FHGTz2cLXsAnP7QeSZq5KhJW53JZNsyVnRTWjEGjqKL8tSfu6?=
 =?us-ascii?Q?NztW5kogl6xnqrrEYndwJC+hkso+M5mF7Za5w8jPzlu1nNJLucUi2SFppom9?=
 =?us-ascii?Q?SYfmsypIi3AYNzRWzYQR1itZsyX4xM+Q4YwTKKsjbLyNC5AK/o1mXuvtGRAm?=
 =?us-ascii?Q?phYNQTSZLDYnNPVIJlOnLAHAwb6U5huVa6F6N15ciAiZCjY1W6aN0a4QE3kR?=
 =?us-ascii?Q?cj1ydOPUUhfE90rWK2cof35vFFWc8FKkpPqy8lTGfRLT3w6j2VzgowUlCZ+1?=
 =?us-ascii?Q?UF3JXCTY3x58igHCT2SRzs9Cp0ocJ0bZe9Qvays+EPWybHa/FpDzqZ8QO+Ci?=
 =?us-ascii?Q?5zNouffZzm2/sw/oHfL5DN0gbx4l+Qwmdu4AvrqyVLTk3ctLq30SdFdVFwMi?=
 =?us-ascii?Q?4MuksE0EdOxJkH9fEqZtv2G2S0nI//4EB/O4Xzg4KwD06FpnsjgMZ3dz8qwY?=
 =?us-ascii?Q?nvExKZgoWxMegS/rD5Mg+umj00URNVhbN04DNPiny8EjIPvx2Dr17T7XqYKC?=
 =?us-ascii?Q?0oIXV4tc0n0yiP6+HKY6bz+csbL7y8INddjjXjOjR3qS9kNP4RUKhsLIDJOp?=
 =?us-ascii?Q?VE60Gi+UGoSkd1UJzyWTd7OmWKxgvVc6zzrOVwyxkVNzdtnITAmvAs0y2Nll?=
 =?us-ascii?Q?LpXkyJYYKQAnaKEbDbWpJ20G7TcaLtQl6c3PVO6c94DDRyoPlLR0U4+iU1tk?=
 =?us-ascii?Q?cSan4881bilDZOYKqWyecqGR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b1a56d-8db0-4552-83a8-08d90a58e0f8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:29.8722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1E1ZHjv9pRRw96bRtwMYDu8wEU8lho31/UPY6MgA8kNctFEt+wP8TEO4t7xWNvPd0T+A/4xFWDcCEaxiVOp5+ykHvOWzDjKyK7/OHOigwdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70b;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

These functions are called only from bdrv_reopen_multiple() in block.c.
No reason to publish them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  4 ----
 block.c               | 13 +++++++++----
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 54279baa95..16e496a5c4 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -387,10 +387,6 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
 int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp);
 int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
                               Error **errp);
-int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
-                        BlockReopenQueue *queue, Error **errp);
-void bdrv_reopen_commit(BDRVReopenState *reopen_state);
-void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
                        int64_t bytes, BdrvRequestFlags flags);
 int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags);
diff --git a/block.c b/block.c
index 54436c951e..34c728d7e4 100644
--- a/block.c
+++ b/block.c
@@ -82,6 +82,11 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            BdrvChildRole child_role,
                                            Error **errp);
 
+static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
+                               *queue, Error **errp);
+static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
+static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
+
 /* If non-zero, use only whitelisted block drivers */
 static int use_bdrv_whitelist;
 
@@ -4153,8 +4158,8 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
  * commit() for any other BDS that have been left in a prepare() state
  *
  */
-int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue *queue,
-                        Error **errp)
+static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
+                               BlockReopenQueue *queue, Error **errp)
 {
     int ret = -1;
     int old_flags;
@@ -4369,7 +4374,7 @@ error:
  * makes them final by swapping the staging BlockDriverState contents into
  * the active BlockDriverState contents.
  */
-void bdrv_reopen_commit(BDRVReopenState *reopen_state)
+static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
 {
     BlockDriver *drv;
     BlockDriverState *bs;
@@ -4429,7 +4434,7 @@ void bdrv_reopen_commit(BDRVReopenState *reopen_state)
  * Abort the reopen, and delete and free the staged changes in
  * reopen_state
  */
-void bdrv_reopen_abort(BDRVReopenState *reopen_state)
+static void bdrv_reopen_abort(BDRVReopenState *reopen_state)
 {
     BlockDriver *drv;
 
-- 
2.29.2


