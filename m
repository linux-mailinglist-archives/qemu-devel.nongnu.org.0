Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CD93A2949
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:23:31 +0200 (CEST)
Received: from localhost ([::1]:54176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHqU-00049w-9A
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHch-0005bl-1H; Thu, 10 Jun 2021 06:09:15 -0400
Received: from mail-eopbgr50133.outbound.protection.outlook.com
 ([40.107.5.133]:23957 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcd-00051Z-NE; Thu, 10 Jun 2021 06:09:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/NGiwvddkeSEE0hKpi5M2NrUO5A4PwKI7QwZvWwPEymA5YPL2xL+5fZTvwoCBrnsK0F0PZsZPiEmwRCZzqNk0tFIlv5d/EKGwaRsHe2K3C1cec55oZ81lDYFcRWuEkf5YM1G4qHPjIhJGlcmK22KNdzH+7IaYPa7TezkZo8i+BW/4uCxOVdVUjgH2fa21Klp9XWIzl7FCGb9R5WlACPbKCBUDU/WdjxbgE8GR5azEg6Atzmfj37pvxknPuOlPSrMe9qg+7hybRt4wstIYHQun+cmYE6KvCmzN6wzIktf5ErwograV5VnwDWvzHMOaaFQeSUKbhq7JPqkx2UtwcV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zg3lNdEE6aZ2Y+cydKvSap+R1f1hOeBv3Rmn5dA05Lg=;
 b=eLPlrIIlPY6QM3QjDD6BEDN7niZDueBHcVmVb0bFTYOXarNJpf+DzBSjEaZLy/fd9oYwV35stESB5TwnyOVR4qf4avr21PBVh402+GYX+8Uq8qN/s1EnJNkyXrBA1v3faGoWDCecbUsu6DG+Cjj3uvs84L69bU3Y3A2oH645rJ8RrgmWOeT7s5MczoRb5wleRa59wk8pcjBMof8oZEqQ2wQxesb70ubRWW+gmuBGqg8g5TZyzx3Xkic0WzC/JYxj6LtQvHhhQXzfS03BMBwD+VHzytkRsvjgEK7QF5uwIj6+15QygOVBnbzv2DoJ5T4cnAO+BeUNZIp9HF203SK4Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zg3lNdEE6aZ2Y+cydKvSap+R1f1hOeBv3Rmn5dA05Lg=;
 b=wG5Kb5ZSOoROfI5UttoZT/wy8EhP3JgeoX1zFNLvBl1HPJ1ri8pQequ409UlKW04hUV0+Ir5V+kAAUjJmgO6l4mL7eZEfetKUl/BtNCmsksO1SafXjlJ8KcUeN0fUKE3ncItmeBeVsRkY8WPKXYLB+TYWk/yYsIMYFzQX7ZBPLo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 10:09:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 Roman Kagan <rvkagan@yandex-team.ru>
Subject: [PATCH v4 13/32] block/nbd: make nbd_co_establish_connection_cancel()
 bs-independent
Date: Thu, 10 Jun 2021 13:07:43 +0300
Message-Id: <20210610100802.5888-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610100802.5888-1-vsementsov@virtuozzo.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31de862b-8040-4a99-4368-08d92bf7c459
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB65023093D9100A31C3D85ADDC1359@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FfO/OCq+0edzXWdp6zAB8n5vA4JDPqb89eznV/xzssHl9ZoWNywOS+Sb4DZp8zprREkMbCT2WrnBD4upHuWFfjFtCxSkYWHdI1hli3a6qs12AgdxamCpBcDhWMDK2J7+I1dVrpOhYzaEO+/mfweJfoQD/bk3ibcESK80wyT/iPFbrLURPGhBxzvmEt5qSPD2xQ5W3dnYKUzeysC3UmeAMA7dvAay4aKlrCo+I4DocE0D4U4Gjv2os+CHzsXFBsqv8HHOGbdlVcbr4zyaGaBEYZmkxa7Z7ZqKvVmAcKTISI5xwS5IUF/Y167CDKML07dMOrzByMSZU+M1oqTY0CBUKt/tWoA60rs4sGSXIvnmvjIwzJyt3Uja21/DYTO1SEbDoTE2BSXxrVAhofRgiQCv+ajIC0h9J79RjoeyBAunV07N8WKK876RXmPDBZxi+sbjWFsasH5trdmPG/lAgKa9GvkU55OgyPH+K1jXq2v5BqWuQHmQruP07QQaVWiO+qSeNlPnfIcTDlpCutcQDaWIf6Hj+usVoM7Dxra/ngScTyS63PCKEUGx/Ae5mQvnD8NN/Nr7nb1KR7Lr95pbXCA0XjNtr2rKOEQ3C0IcTNXt0HOAdBD6UoyeBocVlZPJCeabH8r+6vgKi5QeDC0Y0gDa1mixAw7kvYlnkkMVjy9F4IXvbXc/dZBDd+WnumTsWlJi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(136003)(366004)(2616005)(956004)(6512007)(66556008)(2906002)(86362001)(52116002)(36756003)(6486002)(6916009)(478600001)(16526019)(66476007)(4326008)(186003)(8936002)(1076003)(8676002)(6506007)(26005)(66946007)(38100700002)(38350700002)(6666004)(316002)(5660300002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bw/MnDEsSLxR1c9b8x1d9Jf3xx64Pzm6Xv3nAfpsOEmt1LP07eBL5B4HvAdO?=
 =?us-ascii?Q?1nGA0vufkM6zVluLEexfTFUwezhns5nDIliZBvtDBjOMzAMZ4fL9xkZ/1244?=
 =?us-ascii?Q?zpLDWOUKBIb65emqypOf2wo3KfeLp5KIQGoPj9ul2p9ZSipU0Ajyc6spGQsY?=
 =?us-ascii?Q?3jn5zOFPnFix3jYz6JbTyL6JZtaSwafEkuYpynj9EY2ZuvoPNypNqHKG2ZqB?=
 =?us-ascii?Q?CCyG5bqILGsIvKHGkFGdHraIKW9gCiG3qkBgjCDeXU0BqhJBWzszwcvLEpeK?=
 =?us-ascii?Q?uER48PzGNiNztCosB4KbwjPGOaNM5jOxJXQWq0tov/VYsU76aMXY1X9xPBdz?=
 =?us-ascii?Q?rlCRuQCZ9uHytG/lWq1USVEAURKJvuB8tfKwTminVJBrOLhceY6ItzCksmDb?=
 =?us-ascii?Q?6GC/vD5aMT028XKCd30tapyLLyeKyn1E6KIbeNruvvWyDxGY8jIyaz9fPqHj?=
 =?us-ascii?Q?VYZVUTlQmPcs/Iv/Z92Rl7zHg3Zot+bQIvrumif8EmfZBflRRx3Tf4FWpoqW?=
 =?us-ascii?Q?QBaH04M4mYntrjiR5Q1tHaGNGNB6XKOUSWoTUwlL2byiJANVJ/eUd413vseQ?=
 =?us-ascii?Q?w7jXak6F6U9+1W6oSHw2GUZj1pH2ygEQxr/W28oEHWQUXwus8NjG4EpeTgMc?=
 =?us-ascii?Q?L/KVM1n2OkEe44RPal+PkZf85lmEFumPVrXvJ/881VVM4ccPx4xq5zPdPWPJ?=
 =?us-ascii?Q?d1uYQRQbiuTfwcNPWxlVDzg4F4zn2GAcV8Yxxw+BqnxzA69ABkeM4YnS7kwY?=
 =?us-ascii?Q?JEO79+F1ORNYWZYpDyyZxgwoPd9mI5d0ISktgGUiasBtkwIkJiuVtk1gJ4aF?=
 =?us-ascii?Q?M7ICYLosI0+4OTb+M9rNQS75f7bI9dlzPF0cYbmQ0ktvnwhdHYpZtjKwCxnW?=
 =?us-ascii?Q?Fbzf7YsgtwKR4Q1dWu2djSS9/CMmiktJmOJtfpb8C4SugFNptZT6C9OSSrTA?=
 =?us-ascii?Q?b9nmNeQDlU7LUgaS5u8UIGxhPSuaMHlQ47HLeLaublr8rKJXUH9Du8lvKW26?=
 =?us-ascii?Q?4vBoWJy3Z0jI0o51nHtGPl8KQ9pSHkRWynu+5KV7MNR0/CNwaIza6uQiZUAm?=
 =?us-ascii?Q?ecq/7PK0TVEdafQjUlYp8Di/V/0WQzxLVn9cHK1pA47ABP7i9AGwF9vWmNrP?=
 =?us-ascii?Q?g0nOZGk0GmRMZykzL0YOoVyvKlv6Qnpzyftucl8NDv0PK1DJYv8izzVgQ0Jp?=
 =?us-ascii?Q?4Fu2akXypQ8CskiC2JJHmrTj3mSlOOa0sTdG2vUz4agRmif5xdRwVoJg9Rei?=
 =?us-ascii?Q?MXesUkQq5YDrJ/DCyKUbaKYeS6f1h8xHS2tvgdSh4iYXmTImN4JJb6PeBYm5?=
 =?us-ascii?Q?SmoHeRHP18YPt5sBaljzmIS0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31de862b-8040-4a99-4368-08d92bf7c459
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:00.1921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHJBAUl/hZ5PIU6vOJ+kez/qGg3Q6rD9iDkbsQ3xhrKihg8OwGkqZDhQQwpq1AGgji/rO1jMgp/w2afcJZnhSC9HUoFhOtMiOzIHQl4lgC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6502
Received-SPF: pass client-ip=40.107.5.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

nbd_co_establish_connection_cancel() actually needs only pointer to
NBDConnectThread. So, make it clean.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 9d43f0f2e0..40e8d5b425 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -131,7 +131,7 @@ static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
 static coroutine_fn QIOChannelSocket *
 nbd_co_establish_connection(NBDConnectThread *thr, Error **errp);
-static void nbd_co_establish_connection_cancel(BlockDriverState *bs);
+static void nbd_co_establish_connection_cancel(NBDConnectThread *thr);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
 
@@ -294,7 +294,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
     s->drained = true;
     qemu_co_sleep_wake(&s->reconnect_sleep);
 
-    nbd_co_establish_connection_cancel(bs);
+    nbd_co_establish_connection_cancel(s->connect_thread);
 
     reconnect_delay_timer_del(s);
 
@@ -332,7 +332,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
     s->state = NBD_CLIENT_QUIT;
     if (s->connection_co) {
         qemu_co_sleep_wake(&s->reconnect_sleep);
-        nbd_co_establish_connection_cancel(bs);
+        nbd_co_establish_connection_cancel(s->connect_thread);
     }
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
@@ -487,13 +487,14 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
 
 /*
  * nbd_co_establish_connection_cancel
- * Cancel nbd_co_establish_connection asynchronously: it will finish soon, to
- * allow drained section to begin.
+ * Cancel nbd_co_establish_connection() asynchronously.
+ *
+ * Note that this function neither directly stops the thread nor closes the
+ * socket, but rather safely wakes nbd_co_establish_connection() which is
+ * sleeping in yield()
  */
-static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
+static void nbd_co_establish_connection_cancel(NBDConnectThread *thr)
 {
-    BDRVNBDState *s = bs->opaque;
-    NBDConnectThread *thr = s->connect_thread;
     Coroutine *wait_co;
 
     qemu_mutex_lock(&thr->mutex);
-- 
2.29.2


