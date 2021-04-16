Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774D361B3F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:21:49 +0200 (CEST)
Received: from localhost ([::1]:46544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJjW-0000S8-LW
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJY4-0001Oh-W6; Fri, 16 Apr 2021 04:09:57 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:43105 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJY0-0007xx-5P; Fri, 16 Apr 2021 04:09:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHVGl9AQmjOp0gNLNiOK3Ll54ttM9a3kIzqM8wmlK8wH6OLm5xh3iDx8i2MFYIld6PkPpnXLsmcY6bJ6288NKIeZ8a359ru/lS3FH+uCbU0ckuyQjXBzyK5ElXiNLrieqjABTs1gdqLT4amuChNaNWHaMKO+CDK6fMp0siQU4vygdP3Cqc+HCXwNx3RLQMOw30RpY6UOujYxiVqGQMih+k3+4DMECfBlAcNuQcEgFWxTgO71vW340NlUPrAmmjf4yofYFrDe7g1jP5MgsU+aiyipggfHmThEHZmURkQqbJvcJkB4XVQoJk1N5TRp8LbjkGyFLV9eG4H2p9Nxpl0oCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6b90KSbPR0eAQ04ZIMLVux2xwrm/Ca03zr/SIJFTSYQ=;
 b=g5yDpG/APdpXe6Z/HnT6Ra2Fj9R9jnNX05kyjU+CdzXQrRV3AQJPsfpSKdAkwMyP6AAoJ1tF7nAjjh31cu4CkL4gq/bGdfFezvfVFIJZJjRnqtqQizYhO7SxSBd6ubnXIkZ1wxyoPRU1xess1qIzRF8hIwU3C5ymPeSHBaeog7CS1jZFgFZcFuJd9YCuu0DX+z+YlljZ7A59ExHFL230azZMBolCuIy1gMz9Zqi68b8DVZgEbNuaDgztOZHeQi5OlpfWcIQha4N0/8yUzNuR36XTdu03Z3hwzZGYjz9vXmQpAQpdYsdsPYswVvB0UrQiVY32we4mv3JVR/ula/lJmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6b90KSbPR0eAQ04ZIMLVux2xwrm/Ca03zr/SIJFTSYQ=;
 b=hV6jlij2NMz03asEXI9IjYOVs4VeVD1/d1+E3vlUXsvhdzXT/pd3d4PuOPYLkwTgWbf6V3igvIoM+z/p/UtSFUnEY4L9Rap2xDCV6I2GGMatKsaFekdUR5HHI1HaO1G1u69sQK2cytIYhNCgtaTyf+cztFYBNjoUnEkWppsQDTA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 10/33] block/nbd: make nbd_co_establish_connection_cancel()
 bs-independent
Date: Fri, 16 Apr 2021 11:08:48 +0300
Message-Id: <20210416080911.83197-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416080911.83197-1-vsementsov@virtuozzo.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04ba3310-d2a9-45f6-8be9-08d900aefbf1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46917D38126F083E87FB39B4C14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vJfV8L4INJbERcB3YFp+ESAAVvuJm/L0vEUoA6/TA4laAU4ATK+qUyndsvcPneN8Szg1hev4llAJZYU7+MWs6Krzzz3MTxi5l3s4PMN48RWi2eLdX8WlH3c145j7B1bXPqfLjR2EHrxprYAXgRSKKUj1H8YT0J2SX6C/E54be0UTd7bMBl0AMYS5FY2Sdk89IeLufFCXkBg8Ua6+YgjqZhg3I/IDf57p1i1IlwOjZRp9pGUofCmjLbnFtpJC5XsySUdtag1TkIzJN5chA12KBcVQ8cLvARXd5awHMKHLQDH0w3sYbr8yMrOlgUSXB1c7gbNmlC1c5E8POZnp2T7lS1qOcWC/IYo5kSOVf+XvNKyVbjvzN440eMAd7yWHRBvApFeMuugU2x3U55hHFPK8ZsBTcWBJKxWv5Xdo7CV7mEhMJTCGTERibAUwRSTUHzSKSPaKO+YHLdnmKBmwSaKA2IXU+2z4NO5dP+YG6555NA/lo4nK6aYW07jIfDr76oxqeawgyf8iHRmCDhwZ2ZHGZisURUxChhuMpcOUdf0XcCIdA6WNFR/oqE0q8DAiaAu8qGi/bJkKA9ayMGgoXNQXStnRhytnqyXd/KE+sn7XI1Pc8YdS1FvaMqkdiz51ayws5VMSw8DAOUtQQ5B3AVQrHkdfWzLwlhxhHNhX3PhcrcZepW8VX9TpADMrdhGGVw09jDcoWo/+wB+28rK0FFQVLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(66946007)(107886003)(8936002)(6666004)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(36756003)(38350700002)(38100700002)(508600001)(6486002)(5660300002)(8676002)(66556008)(34490700003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7XBYDYPH4b9qELUNIUhpdsP9RPgYWtuFJ4kUHM2mqnF1udAG8pNL2ytlqCrt?=
 =?us-ascii?Q?J2IBCcbQia2C7Kd+ezMcF6whHM9+cewCJuIl1hFcv3VSNZD+8btfLhBLLcfy?=
 =?us-ascii?Q?C6zt/Ne8Wuoa/t22L5WBn/SXToFXlQdOOP587ppgR5mqZJNgmCGuRyl7rKQz?=
 =?us-ascii?Q?0Jo5GNp4kBC1DnbLLxzqX8SHIrAla+tBO4q/00gu0K41iHp6FqhHApDT6N/B?=
 =?us-ascii?Q?DOU7T15Yh7dFhDfRuB893h9t/DCXgrIFEl4Bk92n4gKM+VA4zv+AzHomDokP?=
 =?us-ascii?Q?srsviaYzku3Adm5Ug0XBpk+NFoReW52rr4NryJ+AIaFbkohP44Viq91CHiQl?=
 =?us-ascii?Q?syaj8UvtmHpU8HV9hxT30tV4/w6e5Yz7ZfKde7OWdpe63F6Z9urnR1r9YtSQ?=
 =?us-ascii?Q?jXD6opV1YS0WQr4IGgfqf1TPVJB5YUai313Ek7kdmpLZuy1IlTyru9Kxld3d?=
 =?us-ascii?Q?p8zOQtq6eAJdLADRZXCdr4zLgLcXS9yM66JhuTkdeJbjHeMhj9kmvm1/r3K9?=
 =?us-ascii?Q?N53wTqZYB+eFMi1gXpZu71MCPd097IO4CQZL0ySaoQi9uXwrSMoYYql4nP8e?=
 =?us-ascii?Q?VsAkV4bfKnRd6uZmOZ63PEjEXGNAdBt9KOiheasRvSKu+ig48216+kHtGYvq?=
 =?us-ascii?Q?t+41Pv1DBBKhwkL/RG6mw1dtWnFzpy7jJmQamX9OIQzlj5sZzyuUB5sz/InZ?=
 =?us-ascii?Q?v5mr/wU6aHoSSPmMVsBtcjNyXYmTakBad2CrWrU2r11cBuPPArUL/FEKRUPj?=
 =?us-ascii?Q?tuUA6vQngPefsMm6o0Uau0woXOMJNgYxOeYjGO0R+5KD/RfxjCV9KmoCt47P?=
 =?us-ascii?Q?M/prYm42JUp9safUgTKnNQlt4WG/cKlo3yzcPqN7OJ3MxpP++gdprGlzGzMb?=
 =?us-ascii?Q?TkS0tVndQ0+SafWaJ0vFjy3/IjaYPsvvpY3HwKrERwvjUgeh2Nl6fnzuTzlE?=
 =?us-ascii?Q?my/tNozKSqWnFvbtjwFEPuKqZIcGH2jsy6nW90RCJ2Kq29OsxF+qeiSqfzQ9?=
 =?us-ascii?Q?+yNf2z1HdqgezJhNOFYrmUq451FQu7tShLUYOSVVjvgYmwKDUKBE0yt8XE5V?=
 =?us-ascii?Q?ZGPWsOi8fZueXpbZoO7wvCrj4Tce0aB0J95Bp6hcc65kIWjbJI04Pu8GiJI7?=
 =?us-ascii?Q?l/UW9ZfToiCLATRPH2TWFdSQm49BZPaWdpnhO3ydPC+PURSR7JE6zaxvTI0b?=
 =?us-ascii?Q?f5Fc0EjxgE4s1aZIL+Ea/zNSLnvcYpYrpWh6KjSSnaDPVUm01kGCfKIrsnwa?=
 =?us-ascii?Q?NVOTcljNn7B8yQ4AUOGtxM+7+igAAVvyM8aopV9XLORR7fsX+/u82SYAcmUf?=
 =?us-ascii?Q?CkNd8vk03+cLQU1noB3rKAJe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ba3310-d2a9-45f6-8be9-08d900aefbf1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:40.2529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTzimF9gqOfZRe3HLEnQvTQ2WCHOKwLqdYothH62Tv2B0rIwSEEQCocLLfyliGUErD6AtiUNGMcHTWNXeFzua/RK2Xd/uKbC4VHEDmazBgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

nbd_co_establish_connection_cancel() actually needs only pointer to
NBDConnectThread. So, make it clean.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index dd97ea0916..dab73bdf3b 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -123,7 +123,7 @@ static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
 static coroutine_fn QIOChannelSocket *
 nbd_co_establish_connection(NBDConnectThread *thr, Error **errp);
-static void nbd_co_establish_connection_cancel(BlockDriverState *bs);
+static void nbd_co_establish_connection_cancel(NBDConnectThread *thr);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
 
@@ -286,7 +286,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
         qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
     }
 
-    nbd_co_establish_connection_cancel(bs);
+    nbd_co_establish_connection_cancel(s->connect_thread);
 
     reconnect_delay_timer_del(s);
 
@@ -326,7 +326,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
         if (s->connection_co_sleep_ns_state) {
             qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
         }
-        nbd_co_establish_connection_cancel(bs);
+        nbd_co_establish_connection_cancel(s->connect_thread);
     }
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
@@ -477,14 +477,12 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
 
 /*
  * nbd_co_establish_connection_cancel
- * Cancel nbd_co_establish_connection asynchronously: it will finish soon, to
- * allow drained section to begin.
+ * Cancel nbd_co_establish_connection() asynchronously. Note, that it doesn't
+ * stop the thread itself neither close the socket. It just safely wakes
+ * nbd_co_establish_connection() sleeping in the yield().
  */
-static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
+static void nbd_co_establish_connection_cancel(NBDConnectThread *thr)
 {
-    BDRVNBDState *s = bs->opaque;
-    NBDConnectThread *thr = s->connect_thread;
-
     qemu_mutex_lock(&thr->mutex);
 
     if (thr->wait_co) {
-- 
2.29.2


