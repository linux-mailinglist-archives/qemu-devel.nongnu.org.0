Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8446C3C896B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:11:14 +0200 (CEST)
Received: from localhost ([::1]:56110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iPh-0001QJ-AY
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iEd-0005kY-VC; Wed, 14 Jul 2021 12:59:47 -0400
Received: from mail-eopbgr10112.outbound.protection.outlook.com
 ([40.107.1.112]:36877 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iEc-0005As-7z; Wed, 14 Jul 2021 12:59:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GT+9JeTjNKTPwKVGKdLMu1bzecf+UBUo+VsoMu5WL0GMtfF/jTT74Uqe+tiMoAM4jS+KPdSpfIXW4AxfCPhLHxcLxu7lm3SXNMOx495bWZWcNZbjst3ZFCfB6Ehr0NeisMi7eN0gIiqjII06A0qRUnOvWkrL4AS1FHbcRarfK1d1TzpkZSS99yCpsRPdwySYXEQ+lCqXgTkjVZTTpFWt97ZVRbsQJ+ZF0a0uGOLm2HVFjh9lfeI1H8lKZWqaECHQjTls/4Y4f/2K3DULYrgxZzSh0Z2CxDBmHeyvp0mhl8y+u6+DagklLVK7jHcd5JbbHjNlJtgRoCP7V1Y438/vJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afEzIpToiXJ+dbZy+bPS4j1XwIAaKt2He+rMzWmhde4=;
 b=A3oiC3xXqrpO4ksXEYMcb5lLUm60t/c4RBwCm1uOOpXRysJbWnFpFAsfPAQOd7hCtj6smjEiNyiodtSMNyKtq8vgqOsg3lMScBYAPmj27qNvrsoXTKTFxtT5p51GnxmhhqQnzqPoHZ55ZO0/eZI0JrdcFQTy9CnaXwIZsogqdqnqNKJ1qTsMiLSrzxpek7WjB6DsL5brfZCUZZZ8tBgw8leZlw/5R2QORN/0VdbZpuLfiZ/+BtDX3nkRBrmmkZtFIQW2a7nsXS22X2X6gOOqw/N86SmAyHL2oI6+ZHJCm35RYo+aPUyWDPYQfcTSgh6YYLfSZvEnFPaQIXtUl4TByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afEzIpToiXJ+dbZy+bPS4j1XwIAaKt2He+rMzWmhde4=;
 b=mRg9eSJD3dinXznn7CE42p6lSqnUxAtucqGKEg2Bznl7vCmxGjxRUW4fb5eOSbMgiQzh0zcRf9tGzR+JUdztQJfm7O0fHwVly2PQsVEdrCGYtAHMmBnRHI26hmpNoSKmdKJ6huDXTEY3Jssu7yOwecrXYyN0NAwK8NxrlrfL0H4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 16:59:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 16:59:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v5 3/5] block/nbd: refactor nbd_recv_coroutines_wake_all()
Date: Wed, 14 Jul 2021 19:59:14 +0300
Message-Id: <20210714165916.102363-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714165916.102363-1-vsementsov@virtuozzo.com>
References: <20210714165916.102363-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR08CA0077.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR08CA0077.eurprd08.prod.outlook.com (2603:10a6:7:2a::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Wed, 14 Jul 2021 16:59:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2438d913-9603-4256-5625-08d946e8c14e
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5334BEB85BF34F088CBCCC89C1139@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:269;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BntcOnPZK/THSjmIWeUAllo/1Z1nmt0zwK6TfjwNiDzFFUhMcxcXeGOC3RR8iPl+Qpi2XCVqNQhoYhxNzqhQjIBvmemCdGo9vh/Lvk0DjvfQb1DM2GLObj+72PhUM6nCfgP+nZ6rtF0YNgrETM2IBrV820KlPi+1VuRB3m/AKiqui4jaXmrb2LPoWJXRoSp/C1IV7hsbBiTUI4eROEDcwmhKRmBsXG3R2W6c4C2MdY/HCwuD1O6Ino1DJyFOmbaWs7rfpvrp5BV7ZrDqiok381oXfPoW0ZH6Fx8NBgTCxhRNGlRzJNh/gIlx282Eae/BLK9IOb8kOMRIZ6rbjTxle+36NYQkVqR5v3wx01xYcaQtVnM9c5NogvYCr213Ov8Fm73ItAHvelNrAofZAQarzQ6HztGFhQgoeOlmC6KCEpPwG1PZGQQV6OFyds0fUqOK9WSAYECsydRYwTXZ/UZZT2DtpFfRqBdH0TBWudKhZPMbuMKtZNfvcawM5lc5PP9U2ya44UJnWZ39Y2QKqU2iPUAmlMooKPcVSyBgC7P46+1TfiCexEo7n0cJtY+Q5Z8GSdJIhHPb2GI1VQaclUiy7rPl9Sa8VzJatvX7iBdPGXkm++jZN0eLi0u3EIe4pnKrtrnLzrOICJ0Q25N+PU7NmcRJY0iTwlItSZcMC/zoi8rC2jaCI9ynok5qG+d2MyJL3jtAEPkfNt4QKvPA5XvW6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39830400003)(36756003)(6486002)(316002)(478600001)(1076003)(2616005)(8676002)(83380400001)(956004)(2906002)(66476007)(66946007)(26005)(186003)(38350700002)(38100700002)(6512007)(86362001)(52116002)(66556008)(6916009)(5660300002)(4326008)(6506007)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yHetbdTNST+AHLBNkgNSJn9jz+Wa2Y2pyfpuU2HBmHa32y8hf1UhrO+nb4OB?=
 =?us-ascii?Q?zIOUdokeNSnXlfVT7lZB2ZgCM22gs/4NJ/ae9cyHq9WnEWtiwTuUUsw1jkpp?=
 =?us-ascii?Q?U+0xSyNeqQSGQivz2vuXlgnA9B6xYj4vaOQRamdcKcpbnF7S/Kh7VWrzFvJ9?=
 =?us-ascii?Q?FETOnWCf24yJDJrSxsaq6hVMktiG31C0kO2NffVBcqytZUtHRcdfx+JClDAy?=
 =?us-ascii?Q?ttMFwzrgkBONHek/of2BlvIS6hrTpKx6R6jZWAgowAYyFAKXAYtwWURMQHti?=
 =?us-ascii?Q?lQO1W7IBcrXbUFI3jleA+N6mFRDYQ6tkzf544VB+4c3LpGx0+/9WsjuG4/eF?=
 =?us-ascii?Q?lEcOEyJYG0qoDEee1rrgMK9XS6pYblgfI/Q7KkM//lNj1Qld6mx9Opu4eLQ7?=
 =?us-ascii?Q?FYIfYr9i0H+hEZEy2MWrN2AMk7Ohybo21rw9zW0+/WzDJSgOueRfVURUlnDs?=
 =?us-ascii?Q?NzOv2eNUhd7Y4zmSjMH/Y1rdX4ykgvUKkHZFPPAKznW8eF79SSunnMzcQDnK?=
 =?us-ascii?Q?KbmKOf2PxU7hc4FyEFoo/llsDFO4JAfarpyPZQvBr1GcW2WZfQeIambNJVEB?=
 =?us-ascii?Q?CrtpUjiS6F1y/WxiCBlqC6qh5ijvsby44ZDjIKeiz2DkaFoGJ5uUjViQj24r?=
 =?us-ascii?Q?YrR7TS9Q4awakzYmv7mY7qWBU/qoUT/NHr3iwRLPJEiwliSynBESCOo6LdUF?=
 =?us-ascii?Q?KM/GSeNUvAa4uYTqxkPG8aqY4MuHDCKwXmIdLKzQAReoe7p7OPZ/U2XcMaeQ?=
 =?us-ascii?Q?gWOPmPkovgOcIMFhjFlEsNJ2CaJWNDDAGh4YQ/l6IgYo1XiaZHp5qwdI0gP+?=
 =?us-ascii?Q?vr6q0yau9k7oJPo3X+nzzoY5kicv22eKulwd4pqbiABQDdm6uUbiWKMohYxO?=
 =?us-ascii?Q?w//iyhh1Q9W8VDEHGH/UwdKk0Si/QAw8DOj9WyVdgnmkfYIKFyoi0GqctuH2?=
 =?us-ascii?Q?SRd6T4YSfdZqZcHhomkArd+naueCuNzBUo2T79RPgouBp+OCGtvlu+ZlnYkG?=
 =?us-ascii?Q?a+nVtLfVdAOF+P+U4f59AG/nkfPNZJd99wdc3ATPe2m/Q708YLr0sizcbylq?=
 =?us-ascii?Q?onipHU30RGFZXgfVEQ/GtsUzHykeUmj8haDXSGd8iNMtQZNwiDI0vab8Imem?=
 =?us-ascii?Q?MtyPbfCfto5qtpmvFKEfNBAklfU1ZeJNWWOTn3QECiarxcMsgC8fjvuHSUcK?=
 =?us-ascii?Q?EeykwnRnLnKh1CAUa9CFaoszkOrjpM9Kp6PMIkuDqXK2/VzayA59cyPSRSkd?=
 =?us-ascii?Q?kBOhnQdu2QV/wsJrL+1hxcUqsxXhMP6/dt3QAoc7rIzXWz5kX2G47xZqBD2I?=
 =?us-ascii?Q?817XrL48YgHaoJTbaI5C1mp8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2438d913-9603-4256-5625-08d946e8c14e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 16:59:34.0632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbxuovRaaFG0FsowRW0BTlB7b2iffOMsFHuQ/FNkSob9SE2PS7piRujgSrCZC7ERKygxJnxUZcsRUFd7UYcrMkSck/za8IZ3mlFox7GANj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.1.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

Split out nbd_recv_coroutine_wake(), as it will be used in separate.
Also add a possibility to wake only first found sleeping coroutine.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 32e3826ba2..3b91954b1f 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -127,16 +127,24 @@ static bool nbd_client_connected(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
 }
 
-static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
+static bool nbd_recv_coroutine_wake(NBDClientRequest *req)
+{
+    if (req->receiving) {
+        req->receiving = false;
+        aio_co_wake(req->coroutine);
+        return true;
+    }
+
+    return false;
+}
+
+static void nbd_recv_coroutines_wake_all(BDRVNBDState *s, bool only_one)
 {
     int i;
 
     for (i = 0; i < MAX_NBD_REQUESTS; i++) {
-        NBDClientRequest *req = &s->requests[i];
-
-        if (req->coroutine && req->receiving) {
-            req->receiving = false;
-            aio_co_wake(req->coroutine);
+        if (nbd_recv_coroutine_wake(&s->requests[i]) && only_one) {
+            return;
         }
     }
 }
@@ -415,7 +423,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 
     while (s->in_flight > 0) {
         qemu_co_mutex_unlock(&s->send_mutex);
-        nbd_recv_coroutines_wake_all(s);
+        nbd_recv_coroutines_wake_all(s, false);
         s->wait_in_flight = true;
         qemu_coroutine_yield();
         s->wait_in_flight = false;
@@ -558,7 +566,7 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
     }
 
     qemu_co_queue_restart_all(&s->free_sema);
-    nbd_recv_coroutines_wake_all(s);
+    nbd_recv_coroutines_wake_all(s, false);
     bdrv_dec_in_flight(s->bs);
 
     s->connection_co = NULL;
-- 
2.29.2


