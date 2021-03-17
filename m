Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23F433F391
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:42:50 +0100 (CET)
Received: from localhost ([::1]:47112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXNp-0001Vr-Tc
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHc-0004Tl-PS; Wed, 17 Mar 2021 10:36:24 -0400
Received: from mail-eopbgr60123.outbound.protection.outlook.com
 ([40.107.6.123]:28737 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHa-0006ux-OT; Wed, 17 Mar 2021 10:36:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKo+osNCbAiH++9bOtU4QObXJQDXLTvacsdK8ScuNtIs3hM1pfZNfhH6DdAbZrBVeVGb0e/Nj+XHxc3U6n4AHCvHkMYir0mz2SmiTbOFHoeiBw3vSFoHghXfPS2B+WqbXS5exUAMsniPJGOyekl0fpceZVxnvXEZDEEzlWBk38XKUlq29AjZ4BNOog9/8aX+FRDHkesN0e6ShcF+xbZgxcp9QZkBE6JnoQSQeiCVVrzYWX/pCvRfMvXj1u1zuO2wR7Es0EUIa2cT8bvnqMjliTvbRAzpPdKvnAVL8W6+ZMcvlRmy6yqzWkcR1RbGYfIJ75lU9/6TQ9UoP0Ixg5gQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXz4brO/+ecQ8hx5vUwvnOMg+EuTEt/9meSVqnGu+r4=;
 b=Gd2tFu3279tnnnjF34qPEG4iSz+aUwKIvA0nhvPu9wCcCiJ6hACiWQBJfCt9OSt/7qEUdIN8aFpo9UJgYTtMQB7nEkp3xzC1ZpG5KpqSmx650DANcssccJeXb8kld6lcQWLtt8/EwtNscdBRj7IHdOvkkjFRvt0KgVi2llWxMe3VlpB+sLbDsRnjbQV6wCtlyn5fQfncJK6hiNRSNrxZX4zKszFTPibo33Y26WNOkqXWUHyVNs4IBvxX0Gw1Z74+crpOHtZR4JktdFw38bOH3Col7ttpwc3NA+ug2tMAhjoc7qK24t4F/uJPnJYJtG2UDc94fwP3q4YzDwEhIGJlvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXz4brO/+ecQ8hx5vUwvnOMg+EuTEt/9meSVqnGu+r4=;
 b=Zk8q0XrvEMt978RvxHGB1tPZ6viZ8+B/gtzWKeqAXXi1APh0y0HXjfUIwtTg7odAgmi1WxXk9X2PrSssBxURySdi4qMz+mlc1/JfXEnNxLDWch+Jf6AXzVr+Yw9rKxuL8B512WHX9oKhbS1Ym8kab/0ZgskXpVL0/uo2tPkSfyk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:12 +0000
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, Alberto Garcia <berto@igalia.com>
Subject: [PATCH v3 07/36] block: make bdrv_reopen_{prepare, commit,
 abort} private
Date: Wed, 17 Mar 2021 17:35:00 +0300
Message-Id: <20210317143529.615584-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9757d11f-78b0-4ce4-9497-08d8e9520352
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB354485B7E0AFBCE537D59035C16A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pjm5ZW9AAFW2mshxGC5u/l3g9ggIkF3hiatZ4nWG/Qi7WgoWnJ0iyB3upgQyoB6PluyfxrDsGx/1nnBX65rEUJlkP0waDt/mJgKOZ7gHTNHz613VbqDhXD/9gFrJdXA8vm5xkLtrEbM/Ot16/2j1XSr58MZLa1CI5dKXXRiD+Jr9gWUuyCaSL3v4M7NhV/JY7cswbBALjhwemft4jEwTNrbdQI7xosNpyUFHD2js/Iydf7Ta9QCvyg5Pn41SIhf3QJYzQ9yZODB2sGVZJMYlSidRY/PhkPvugZEgQ0zdRFzIbsfpFbT6plEDM3aY6LQLr4/Q8AjZgFP9Qr5X8KJ6PTwrPwuML+3jljpHVjzs/OmMASdtgczk/AEaLT9F/RCusZAlyfUlL2Rv7nTZHh4Qwha+JsON4XQoZ7+ZQA0/xWSDsHhuE4dwvEjWOC+ud+QM6je1m0srl5wuXBtEHuWn62mVwz5slPia4V96k0+cQAhYGLLFAS/Q33rcGrmp+E+PQiByNFq+qGX2ghJKVTYnqm+Abmc3Dx48nqEp69JO1IU2YM5J8xkcmA7Cxdu1TkDD4L9L3gQQhTSUBr00dXXx7wkRtHnl25jeS/EBdhhSb7KzmyTNgbh9D5VoTtQqxGxh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(186003)(8676002)(16526019)(26005)(86362001)(1076003)(52116002)(36756003)(6916009)(66476007)(6506007)(4326008)(6486002)(2616005)(5660300002)(8936002)(66556008)(66946007)(83380400001)(2906002)(478600001)(956004)(6666004)(69590400012)(6512007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+sWvqPyroPXp1Wx2fJt4rPb3N5E4LnSno9crR0u8+1+LsTDW8aBRjoxHt7f0?=
 =?us-ascii?Q?suRDaXLcr1APGGjDZVQBvHXEWEHzOzO8433l7inxPEJ/nTcFDG9/qokjsI3C?=
 =?us-ascii?Q?+HWnX4Ts0TOJZMAZnbDP9h6BbkukDCaTc3zDRTgoUScsK/D6ymBn0Anhb6CH?=
 =?us-ascii?Q?mWxi2Bs338MXUj/76E8lfDifWBVsdV3r5+zdKaFBsrHCZKZTlZu/0GN1mJaN?=
 =?us-ascii?Q?eQSd4GnloST55TcF2fysZllbzbbrJSBpsJwZ+aIL9t7dExQARaxyJWmMJRu+?=
 =?us-ascii?Q?ICRhs+dj/19qnT49kqD/eD9Z6UD1KPZmbeqb+RYMwyooY2gSUF9DZiXJCi6l?=
 =?us-ascii?Q?+VMVg33FcAKngtNt2PMFs/EkRlPW16/ADesUQE/LHYGGs1iJqHMw/aF2Rk/t?=
 =?us-ascii?Q?pt30+eCPJo3a0nrSfRhFAqFbv0gN8XIpmpTDDRWDsajbgIXq+otfoXvlanah?=
 =?us-ascii?Q?aVldzQkbavQgBIzz3bEBnio41SbjgwHKZFvpXtf2QZc7bGCAVd1/lyVR7Sv7?=
 =?us-ascii?Q?s4LGQzqtN5IFEejFjGmMPUF0bOCXJtT02NKERMtp59/uEgP/rleq0VThoO1q?=
 =?us-ascii?Q?bPTcstmcBAmxlyUSSQhNxWrwXNMuw/YCkjLSAXPVjpblntL2Ow+cSIiKRudf?=
 =?us-ascii?Q?Otadv05OkuyL0neOMIry/a0+3TTK9ua2kPRrhce0HPVAnhGwXw2jFTmTymU8?=
 =?us-ascii?Q?uGJcIFtLCK5HZicSdmkJFa00Cet5O0zJBQBqY12Dgb3TcfgBdXFRS/v1eTiL?=
 =?us-ascii?Q?yFI/QUeMxMwkZ04vxM+l7scX82erRSH5ZSzB6zGfpyNsCXWRatZZrGOexamA?=
 =?us-ascii?Q?oQv91kl+E09ER9jZFkuHgJ5tH9LVi8daei2dAh7feSY4nX1Xuqpky4Q0ZC8o?=
 =?us-ascii?Q?zsXizm370eE0Uogvch/WFvNvPrztYzEzU0ZT/0akkmGxfACSdGukcJQoprnd?=
 =?us-ascii?Q?E/Y87c5hYgNOtV7080yUoai8sDAfjmHgGWPRb89RgX3t6Ifm6IihqVOhdqP5?=
 =?us-ascii?Q?/8LDK93AjgLzF21IwrmbdjUUhyfVM4s+3PJDkCySVSoUZ9wXUEejMehp/GnT?=
 =?us-ascii?Q?FcyrvEV2zrwYElt+2Bhgw/ImvqRckNeW9KhRfCu480srUPrEnZuH5NPiFXlF?=
 =?us-ascii?Q?QV+IGbFJ4Krhg92lzJDNZo+NfB/lkoIbSmH/QB6B9p4V6vAXnJemhgCOgZFg?=
 =?us-ascii?Q?D4D17TJaV35uADsL6TWuKl5gqV+4S0/sq02645QQ068XBFfvxlQfp7Rn4bbY?=
 =?us-ascii?Q?CiwdEVLUpR1EZ4Cheub/54Ugfxg6kDAORWjAWZt0x2uYgM3d/TraVWcUk1Lp?=
 =?us-ascii?Q?txt5/ymraV20X/dkKMAUN3UD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9757d11f-78b0-4ce4-9497-08d8e9520352
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:12.6822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRSIor2OwmGcI6ocS34jukEpPM16Z2jr0A092lK7zZgUn+sTbftwVzMjqMnFiAGxJr2TfzveTC4VNjmHaa7nYb3NeIdR7ZjbLdxscihDNUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.6.123;
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
index 61703027ec..b951ecb5db 100644
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
 
@@ -4119,8 +4124,8 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
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
@@ -4335,7 +4340,7 @@ error:
  * makes them final by swapping the staging BlockDriverState contents into
  * the active BlockDriverState contents.
  */
-void bdrv_reopen_commit(BDRVReopenState *reopen_state)
+static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
 {
     BlockDriver *drv;
     BlockDriverState *bs;
@@ -4395,7 +4400,7 @@ void bdrv_reopen_commit(BDRVReopenState *reopen_state)
  * Abort the reopen, and delete and free the staged changes in
  * reopen_state
  */
-void bdrv_reopen_abort(BDRVReopenState *reopen_state)
+static void bdrv_reopen_abort(BDRVReopenState *reopen_state)
 {
     BlockDriver *drv;
 
-- 
2.29.2


