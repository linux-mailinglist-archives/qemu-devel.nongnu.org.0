Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC40356A3A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:49:57 +0200 (CEST)
Received: from localhost ([::1]:53650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5ky-0007VI-NB
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iI-0005St-Ce; Wed, 07 Apr 2021 06:47:10 -0400
Received: from mail-vi1eur05on2103.outbound.protection.outlook.com
 ([40.107.21.103]:59841 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iE-0001Lp-W3; Wed, 07 Apr 2021 06:47:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUt1FzP0cRrxQjiOo1vkuiS5qAJ32+7QZitrt3oJKg9vyGK+jBQKb8whio4UV/pae3IN5G9BcZrsFCCNYn3ZtJOqD8kXgg9mPdGaw+FCHZQ8Mf1zILdFW6lH4+pM7AAy94yQP2p7MUjfi9nB2O4SGJ+77CqMHFn45O5EXCplhJtjxL/Rhy1HdUrJ+kHse6isNETqqhLtf4F4INeT5viTgVyiF5mPcmZhgXqPrMHDQjerpgdLAPRvLkUi1Ux+mHSYW1qIxBYVZmEwRN9ut4QDPBhf46qPcSXfaMxmNzHLp+YpiCBmKTMobiynH4zPioaJkiXOZ2tUtCuzxm+Ic1B9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UstyaWhcai2+zMpaiu1oCwjxGXfSR2FUfh73V1yqJlM=;
 b=QX2z3pw+KKUBFAz8A9MhowX4FY0DoGoFvvGXeaLT0gpj7z09o3c6ZvhE70/gwA5gtYwsk5M8hpeL82JJ0PfeqB5IJMKWYL1On2mWthK3wqF+gpaZHSAy0XDO4xbl/uDxf4ucBN4xnQJs9rSn0Nezrn48Vjl6+OsfX/ojOe6GIDWLzEdLV10snQuKlWyxZD5qTdoES58AVjdU7JIcDtQzofF9RwXMzS0hk0QaavfOyE7aPlvSyeYZueaKpBzmadPosGEJ1oFMOMOgqKLfxcDUhn7cFqpbV4rIPn53cXe4bznswVTZKmYyjmuTZuzecvWikH72QrebddxtBHnDNGid2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UstyaWhcai2+zMpaiu1oCwjxGXfSR2FUfh73V1yqJlM=;
 b=QvdMTwZnFeqAyEIOuTMcoCULI4yt+67WNEX+Eu6CzL7C94vGWMn7616bhgncuIQt9imphv4unByiMZejhyeoWdi7t3T8e5q1hQy5N2oMHQ5/YcoCtBH293lyFdUlTIU5adgGfljtVRzgphPa5LLMP7fCczfteH8zsSPA173Vk3U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 10:46:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:46:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 02/14] block/nbd: nbd_co_establish_connection(): drop unused
 errp
Date: Wed,  7 Apr 2021 13:46:25 +0300
Message-Id: <20210407104637.36033-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407104637.36033-1-vsementsov@virtuozzo.com>
References: <20210407104637.36033-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:3:e5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:46:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9bda354-e496-4c31-d037-08d8f9b2785b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63761BE63831226FE308459CC1759@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:416;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L1Q2+ESqfYM8tv1Mb+unX5iGTXNTTraSZGv6xEG+jyl1ig+cchdl+pkbTszqjhXxzv2xUPLrUCsnO0P7XBIpvo6U+NapEdUW10NPhUuaMS9qpjwIrPYHZYRzyq7wEjznrU9Rd1fq5J6Z0jvEtFQFQNjwiqUCQISdchUzccvuU/Qlr7JzidrCNX/G/UcpCfsVzC1d/+U9e6olKYw1UcduCYMAgZSt9fAGyIE6O8X7pgXpAXB6h3tuTWZF2BVm6eerpnZeR8tdSBHv6HCXln1cZ9gcyexk4Wy9KZImk6pr3UD4wC/Dntden12paNSQ4DI2H4ZE2AGvi8ZnVJPTy6h5/XLZh2Md6RGn6WLjray+P8expScVu770vPVFkPDMP/703bjnoML1oxOUXGv2BTk/DcuPDnwtg2iXXIJmUQwxahG3XEvUSfrKiquG3NMFK54BtQ/q9znqnCwEX2I89558Ex+FoKt6QPcIAqWRN/WSYFL3X+kMnMl/fmqjnEoJj2jBW4jRXnHjdpozefB+mX0UTVA6/hi8X4/Z8DA8eauSo+J7gf8RzKdak0jP+Wk1vITD8zzQcIHx6jDHrzcGs+8mw6ui8L6d8MzZU5y7i2IQvKIaCu/uvwE9t8a72DtQAd1u7m7x41T6+bmyD4dhPWBICy92V9/rOPLOKsOEX9TXto4pzRPSkhmrU3KBBTL2gubEbpvljD2xWqICQtaA0LnD+DngGhcRTjZMA1BW9EGeLN8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(376002)(396003)(346002)(107886003)(69590400012)(83380400001)(6506007)(6666004)(66946007)(6512007)(38350700001)(8936002)(6916009)(316002)(16526019)(4326008)(186003)(8676002)(52116002)(956004)(26005)(5660300002)(38100700001)(6486002)(2616005)(36756003)(66556008)(66476007)(86362001)(2906002)(478600001)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lQSjUnMmYImIzAVoBeScsbEC8RVxylLTMuEJlvwb+2ckJzNxnhqxL1+YYF6A?=
 =?us-ascii?Q?7E01vc+NEH7e6wQz3uwxDOCamOMMOxyMe1HsTwVmKmcomaobsJJYYgYnN278?=
 =?us-ascii?Q?sTOLv8zTjSz9/FiEXtIpfnDor+dtduMLK34Qaos1JIM/oI6QPvgwwu0ymuTg?=
 =?us-ascii?Q?+FE1Ou4k/tUF/HhL9UgrwZ7hja8AvTs1yjJ44HL2M4gejuemRfMBPRsVWH15?=
 =?us-ascii?Q?MJ6VjDhNpdSTrxV6BUbTHm+iqvh9+6oTHd1gyJtAhNr43J1DQoF2QmstIdgV?=
 =?us-ascii?Q?wv7Z3jbV8/KBnWrcoDvVxZK5GJ3PF0+FFgpH2gMXHP1E3W2Lc/YN2EZ8oGvT?=
 =?us-ascii?Q?pH5f3Z+dmsA4dKDWq/hYnmPUfXgvomIi961OvsIf1ajUKNwXkINqfECFttPc?=
 =?us-ascii?Q?sL34EZIKnHA1RLmDyxo07zDhczbD1AHy8Fy2JjT6sWqsXDoPPj6OtWSolhB0?=
 =?us-ascii?Q?MLjoTfYtjMwKUYnF86VpoopUhqhlCo6TCkWlLQvn3RLjBphpiHy/aKa7ieHB?=
 =?us-ascii?Q?wRXY8F0EZrpfIYMGB+AV45Tiyi1RYutLN5CL53FaDeBxHmZQ43ITxpENBnDS?=
 =?us-ascii?Q?tOyi/oz6m6ObylFEG63Ds7jTI4415a/mcBRPKZSdpxPpNLUZzu7K2I/LCYjs?=
 =?us-ascii?Q?TcDPVqFp9SyQ6Yd0klm9NJqpaLpBTBTWfdg9UhFJ8BP4aVmbNoP7fDwphIpN?=
 =?us-ascii?Q?bM5FsXYP5Gb0z3AzNgKYNZQIWN7ILh64THUx6j37Ovy8RHRGSeiGV00a2KOY?=
 =?us-ascii?Q?ph9wrERO6F3zKA0+pHZm8HlJXTEwPAUfUqDf0PIdLtmV9C9ilbIF9OOtow6E?=
 =?us-ascii?Q?Ws1+5pKvAnS3m/49veBq77WMN+T+ibS78DHw4U0hmeEDUmtjzkxhVvIKNA49?=
 =?us-ascii?Q?8JeIeI6NjwoG3IAOk1+UtA+x5wbY4MiQO2dXmZmC+a7zQWUsGd0NWDm3shSn?=
 =?us-ascii?Q?d+C1pPJsxl7gqsox4/1wBurAgAIK7lhk/dcI4cTKmMVSuTWBo04t95n1xiaF?=
 =?us-ascii?Q?DYbgd3yARFv63LtmszcDAjyllMRR5pqECJyg+N4/F/9h4A5F9GFKftWIjuT5?=
 =?us-ascii?Q?fzw5N5aq+tCAYsu6jR8+o0SxEugpVlzEYAoE4HYpHz2Eh6BB/neokuXTNuxX?=
 =?us-ascii?Q?nDtk0y+A/P4kr147G6Fx4VgNhNxjaj6M0Dy8nmNoMEnvwKZ5MAw/xGsujW/g?=
 =?us-ascii?Q?1x/RF3hMmLQxme/UuHWI1gjwsoFCegtrJCspq/QSAcd7gNlVjII/5KdXF4D7?=
 =?us-ascii?Q?Qe1ggfLlUuKFNpvtlAhU+rLZgFg7ycishVxhqKiCNv1CRnBr6lEm5M7ORqtC?=
 =?us-ascii?Q?KIC9c6fxVdDM64GdLYUGS5JL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9bda354-e496-4c31-d037-08d8f9b2785b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:46:59.3883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnrObGUdiU6CPYW5nzmWS4+uFdIDjb5bT+q1CDoJXxlg542EzSOn0bu82c242EhbvpSDikWAnSxA12UmG2kL43jyUOvbNFwSKWzb1R69eUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.21.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We are going to refactor connection logic to make it more
understandable. Every bit that we can simplify in advance will help.
Drop errp for now, it's unused anyway. We'll probably reimplement it in
future.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index a47d6cfea3..29c33338bf 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -145,7 +145,7 @@ typedef struct BDRVNBDState {
 
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
-static int nbd_co_establish_connection(BlockDriverState *bs, Error **errp);
+static int nbd_co_establish_connection(BlockDriverState *bs);
 static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
                                                bool detach);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
@@ -435,7 +435,7 @@ static void *connect_thread_func(void *opaque)
 }
 
 static int coroutine_fn
-nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
+nbd_co_establish_connection(BlockDriverState *bs)
 {
     int ret;
     QemuThread thread;
@@ -491,7 +491,7 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     case CONNECT_THREAD_SUCCESS:
     case CONNECT_THREAD_FAIL:
         thr->state = CONNECT_THREAD_NONE;
-        error_propagate(errp, thr->err);
+        error_free(thr->err);
         thr->err = NULL;
         s->sioc = thr->sioc;
         thr->sioc = NULL;
@@ -509,7 +509,6 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
          * result may be used for next connection attempt.
          */
         ret = -1;
-        error_setg(errp, "Connection attempt cancelled by other operation");
         break;
 
     case CONNECT_THREAD_NONE:
@@ -617,7 +616,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    if (nbd_co_establish_connection(s->bs, NULL) < 0) {
+    if (nbd_co_establish_connection(s->bs) < 0) {
         ret = -ECONNREFUSED;
         goto out;
     }
-- 
2.29.2


