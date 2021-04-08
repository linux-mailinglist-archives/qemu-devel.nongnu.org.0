Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1F33586A4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:14:59 +0200 (CEST)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVQw-00043V-PY
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVN9-0007vQ-SU; Thu, 08 Apr 2021 10:11:03 -0400
Received: from mail-eopbgr50100.outbound.protection.outlook.com
 ([40.107.5.100]:41486 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVMh-0001oo-9h; Thu, 08 Apr 2021 10:11:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5b8I1NnQQaxlOPBbzovQ/4Y6/0iYpI+SqlgsA+VkpThDT6UTN2RHsFjWKAiSqLGGqtIS98O9FlNOKj3WtCtdiWaU7tvpIiY/Hhe1FOulg0lQ+yedtMl4JzDhJaOKXXg9r+meo5m187uY1rtarOndmjiQRSlPv9/sUsWI4QX1HNNH9QMt9XwxSbgJMAEA7WGIZ2OhQOT2BtXOyJDvqIs+5It7X4b52YKDxyarbq9htbpcXt8dOAz/jpg3yIZWgJ0AwRvhDG6om4laZyiHS+S+2E1MkQhVaNA0dENNA7vZI0h+BDmLreK57OOAUGUeEhMMGPwU50W8YBWoi71iTr7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zITceg6mv4BZpl6oLaSwMbgBMcBYcUlsD+K4SXhYrhk=;
 b=cmKzfaUGMZt5uCfmwi23CO7h2BbqHL0TpcZgac5/wTbRIXyrATEtdbZZ04TM0P9o5w9kAvFWkpzVkHCW9wpzHcJRHMV+c8bTax3xtjHkg3dl45xrvF0yDH9o7chsqlEJQogtNkFvwtDUhsdn+/2Ax78+fmXzwzQaXv0TNKhfzkWO7D4JODA52lS68LxmW3XV2xxSI3hcKy7JxvSJbV4XG1loEboZyfWraTzfUM6Ky4d1ueWfG2rZDofW0qVrD7GqKB6Bp/gqsZx3W+di7uxwWx8kK7fofBpw1yn62xzYigxQ316tmdj/ymkstjcw3xTr4CMIwN37rSbtzi6+uOl23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zITceg6mv4BZpl6oLaSwMbgBMcBYcUlsD+K4SXhYrhk=;
 b=eom/gHrjJo4FYO8nvlcOzMKgN1TSjiwd05apYnNALacjo7Jh3TgBclaN7NDX/1kfnj0VMt3c+XbB+gNReWT2RQMw6dFZGE2GYmD7+lTB/Y3fuhF4lmt6SApBBvwRzoyelYjOn2MELaDS28u2ka4cjcsV+6dSnD6JkFp9lcr27VU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5127.eurprd08.prod.outlook.com (2603:10a6:20b:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 14:08:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 14:08:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, rvkagan@yandex-team.ru
Subject: [PATCH v2 09/10] block/nbd: introduce nbd_client_connection_new()
Date: Thu,  8 Apr 2021 17:08:26 +0300
Message-Id: <20210408140827.332915-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408140827.332915-1-vsementsov@virtuozzo.com>
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0701CA0052.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0701CA0052.eurprd07.prod.outlook.com (2603:10a6:3:9e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 14:08:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4af20297-151c-4899-26f6-08d8fa97d86c
X-MS-TrafficTypeDiagnostic: AM6PR08MB5127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB512766DFA8558407B2307D3CC1749@AM6PR08MB5127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:64;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f1bbi4KP6lEW470+IYVdyUXLDHE4W4rqrW538+K0BOkc38zYiWUxcuHtNM3NxTxO0LzErjlWTaW8f4mvhx6J/lswR1zAedhZ+BBrmBTs+9eB9+yb3B0yWLyH3KUCzVlGIdq7OetBmL9CM2NSZ9eUMKo36pQcfPv0XVNaKeBgW/jZ9w0ncvQ8hSfpiV4LyX3ThsC8xuYdlMMCgABWSbVM4uptyb/vBFvrFTrcJcvq86gcTDDCEieshGdAzHF3rDbP5w9bb0DSG2jqy2MzNn30q/7tJm4XrHMpEqQ3B9CmBILUlEs/cyOPXOlS1o24p0OzNxWgMnDHpRrmSbvOOvkBFXRECqIynEXkiN8XnpLQHPJJEt2aRFIuPAFFGefSj/NAI7hEHQ/H/KxIdkbjO/a4LwqtI6COVXn6eojq4ujB07jowWM/m6dUM1+EAfe2EkHrJQEVqr74DjqOh+kuA8yiLalfX0lxD0YP9cm4UBwP2uMXH++1e9o3iGmrKJZ1GA7E2xhBoXW0DZOvCUG1ywziY1wu5kAFwbL8SFp/4m65nICtnCNZLdUQQB1cTV/W4mclUpo82+ejBFWeWNbpl+Xm8QvK+CLnDS1yg6FI4CkCMqOjtRYo2Sncb3+Jk/cWsaL4U8JeFwttJWPMvtoDUJreqr1Tfp3gLQjNbEN86QDQPbcIHxVe+oy0mX/gmXANBdP8r/ae7FpST8/DAyLhZrP0eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39840400004)(366004)(346002)(136003)(6916009)(2906002)(38350700001)(86362001)(83380400001)(8936002)(6486002)(52116002)(5660300002)(4326008)(66946007)(66556008)(66476007)(69590400012)(36756003)(38100700001)(6666004)(6506007)(1076003)(6512007)(2616005)(8676002)(186003)(16526019)(316002)(956004)(478600001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CwNBdN+bVvLN02lWdQN1g3s5+8VoPCffGjZEIME4WU5M/kEbFjYnSlbitltP?=
 =?us-ascii?Q?klD4NEp7TJVFjsNuZtuWt/jTem8EvUStaM98qDTUuxEo9u2+9XUiuxtRqVb7?=
 =?us-ascii?Q?eNkJOrhZk8Tg9Wa1FP7aHEfpLRGazcfVNTwr1WPlrxKbB6fuDUP9INyIoTuO?=
 =?us-ascii?Q?kljRnzVKNJ9UyQ7z0o1L7ISh9yFcLGCPuw5pGZ6wYJ4/bHwbE9odvdJukUTq?=
 =?us-ascii?Q?Q+wGVhcQXxhm8H9EqszRrnquTQLl1AshlW0EDE82MLVzD2yOn1Fa+q+PjrF4?=
 =?us-ascii?Q?7ik2uRMV+imVJSnGasw8asem39mSl0XWE/QNwq6k4TxsVOjYeUYh69QoobyD?=
 =?us-ascii?Q?0vFa8av/RaURQUQexDh9XJ8zOJ6HBpRjEWfMGpd5E/NvMaEZTAJexahIxa5p?=
 =?us-ascii?Q?EdGRmjlB5HKUR2k3u8W4icyFqgeCo+x7vLnH3Zr7RBxyYD4y9/ZDzhrSYvKe?=
 =?us-ascii?Q?OVaocH4+iA2Z8kp94DIbIY98ZMlruOjhesJbBlqVyqUA8eYW+2YGEwUPOiZE?=
 =?us-ascii?Q?7Qr8qM4XuN/qyWINtT13fRtb3A+/LIAkzQPNHuwcHkq26Cbas4oGFu6u5Ufk?=
 =?us-ascii?Q?tI69d+LQBOnYWy6vNYAZmUFVg9ZsqVsHCvUdNYZMX+PNlxmdM8j5t66mESrT?=
 =?us-ascii?Q?KTbwyx/R91nJ9EGbnvjr8SVNpVu+DlAEl33bW52Npsjl9vmoKr6QusKsbVyj?=
 =?us-ascii?Q?umFarbB3CTIF3VncDKZJOqneWN+p5szJDp7q/Y1+GDtJzp1hS7a1V2hJ1KYw?=
 =?us-ascii?Q?dGUBPAsJIMbS4Csz5hAHjLzM6eY4vOvkxKYbElrIWyOTW8Im+KNbfx+4oAhR?=
 =?us-ascii?Q?st3o6vY2TAIi9CKj1D5JxiJsj/9XjpHbx9LclJEB/P6OV1x6/XlG0uH1gLR2?=
 =?us-ascii?Q?oArF+zyZEOTL5T+oGxnPT+XKRekKAOQFK6169t7L+I8XLAE3N8h2vNT5DCnQ?=
 =?us-ascii?Q?sSpTpEJraHNP0JFXTgV/ugU6YfKBrAtD+rIkTAB7vIFi2vKeGJlLsY0vL45j?=
 =?us-ascii?Q?tCt/sgO3IxrVHZ+3oJCh/6cDalkjt3fNu38BVnDpIzWyqV97Ki4bv0lfjDbF?=
 =?us-ascii?Q?ebNPZgrFWUMyVo/OQ1dGAOyBxSq6cbLKUSmdyo7+218jZjMZ+dKUFjq9OJ+8?=
 =?us-ascii?Q?14BMwejoe71kAfjngOfSVEcn276a7Bq6vIREVX8qMpLxzJaDXaYK1rZXHzq/?=
 =?us-ascii?Q?AkXpVH/wS86PVhc4kTNhObI+uot5XTGS/bBuaX6XQ0ykl8DC0Y6D32dPu2UR?=
 =?us-ascii?Q?i4kdpgrYZhsdVnHowmMg2aXoY3QaqAvUOEhMe+prJ+qjVUQLwxDI8tk/xond?=
 =?us-ascii?Q?SkSQ4gfIiO0CYA5U10o/m++G?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af20297-151c-4899-26f6-08d8fa97d86c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:08:55.2679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHNgfJqFMx52SyWAyqV10icb9yfpt4uACCwDkBlhtaQ0FmuR2bFPs8b/4GubZnhY2yzIpU44hOeH7WzNcSjBKtn84JegyZIdFUMr5ZpLIrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5127
Received-SPF: pass client-ip=40.107.5.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

This is the last step of creating bs-independing nbd connection
interface. With next commit we can finally move it to separate file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index ab3ef13366..376ab9f92d 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -336,16 +336,19 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }
 
-static void nbd_init_connect_thread(BDRVNBDState *s)
+static NBDClientConnection *
+nbd_client_connection_new(const SocketAddress *saddr)
 {
-    s->conn = g_new(NBDClientConnection, 1);
+    NBDClientConnection *conn = g_new(NBDClientConnection, 1);
 
-    *s->conn = (NBDClientConnection) {
-        .saddr = QAPI_CLONE(SocketAddress, s->saddr),
+    *conn = (NBDClientConnection) {
+        .saddr = QAPI_CLONE(SocketAddress, saddr),
         .refcnt = 1,
     };
 
-    qemu_mutex_init(&s->conn->mutex);
+    qemu_mutex_init(&conn->mutex);
+
+    return conn;
 }
 
 static void nbd_client_connection_unref(NBDClientConnection *conn)
@@ -2211,7 +2214,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     /* successfully connected */
     s->state = NBD_CLIENT_CONNECTED;
 
-    nbd_init_connect_thread(s);
+    s->conn = nbd_client_connection_new(s->saddr);
 
     s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
     bdrv_inc_in_flight(bs);
-- 
2.29.2


