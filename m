Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1DA3FEC4F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:41:05 +0200 (CEST)
Received: from localhost ([::1]:57778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLk9Y-0007rV-85
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLk7A-0004QM-JG; Thu, 02 Sep 2021 06:38:36 -0400
Received: from mail-eopbgr30115.outbound.protection.outlook.com
 ([40.107.3.115]:38273 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLk77-0005xI-Ro; Thu, 02 Sep 2021 06:38:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ldt61tY9U/IX/0IO0X7nSH/5ZqzPpRF0DAPYmLlGqGLBBxe552vAPVm2WaLfhWaU67qwq6FwkkGbSUKXq1YKJoWx42rTxgYjJpQphOOA6eS5Het7aNXW9pV1HZoVujEzY/G8Fsn9wJT1WMPaKOgPlS4k2JUGrdgpg0Es1wVv8Ss9PniLtG/psaf6eWRorRke2Ft+CN4BSCW5fLdbOPz5ZfTgmWklLE9SYG+aNcD3JNTzCsAGwJ8vPnqyAG5NWMjwOMefjjvwcgTow0cnByJCpK395igOEIGle9c8AN70z7MJG2XGSiemdLSCOI5wLT+LbqNkrQZ6v4KaNadqRSqYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=xlbGgnSWwiIR5tBhQ3+VOQbEG77BISpE7o5B7KRFsOY=;
 b=EuaoUxH0WpuUSVrR4cbrShcpz1Y5FkJbcyVl9+KQ1A5xv/HA+HRQGd6POeo2/Xo3JL0wDDenRRlcy4AIeyS43vvtEj9+8Sta05XorXiDj/B3rCy8uhbQ86yowhBOJFzaF7gSrMM3LZK6lsjZbJfGVgzV4b2eWwZR/q6mHVwJ5PHgkHfYUtux0F7Xq3ufT7tTrHnadI4BB1QMflvnuTHr3wqciIBVAeqdpqH4qjpwQRWDsuOXxHpLs8PtKPWkiDUQ+KpHfC56EmULYexcWEhs5F5wtTVzZlRezpMQXY+OOKVUOLtrlpc/3bN5rlkbL/vEPJj1a+or1yx3DrJGHapChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlbGgnSWwiIR5tBhQ3+VOQbEG77BISpE7o5B7KRFsOY=;
 b=N5d2IXghhES8FTf89mZCKELSEGL7lBu9l0TOG9Bcpl501u36fbg9MOb9EBXxHE5Wx0c4Rvl7gtCBLZ9m++U8V7L0l9apcpEKPGST0tNVSHAO3wgZk+orGDkwJZ/NPPVk3auhrrwHPsTgeMaQbcDW+wDygyD0ZYZ8hlONjn006oc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4472.eurprd08.prod.outlook.com (2603:10a6:20b:bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 10:38:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 10:38:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rkagan@virtuozzo.com
Subject: [PATCH v6 3/5] block/nbd: refactor nbd_recv_coroutines_wake_all()
Date: Thu,  2 Sep 2021 13:38:03 +0300
Message-Id: <20210902103805.25686-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210902103805.25686-1-vsementsov@virtuozzo.com>
References: <20210902103805.25686-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0037.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR0402CA0037.eurprd04.prod.outlook.com (2603:10a6:7:7c::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 10:38:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b00357cd-54d5-44f8-f825-08d96dfdcb4f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4472765AB43D555247E927D0C1CE9@AM6PR08MB4472.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wusoiT81vnDZjPWv3I+Us0TxI+MpOhkUCB4MeBkalvZkZtZsWnQ9S/KpWISrJ03EsJesWlsXvAGzmJ8PMDR1bxhTfD85525fci21vDEnE6KuOkQy8Ojafdquhkofdbt3kSZ+oVgalmOLPhOthANChU3zSZ1sPPkAcWKRGffOCN6n821HRvSc7hyGbOm/RpUMQiWLRSJVW6kM0WwxlQ4aQdzWE6lrib7wC3P8c/KtrkwYeHuX+AktOW+nvuLr6zAsj2Fzu6NwFjkrwrRkJO2sKzziCOnYmGXmrgkYT0lmfWM4Xhi9lALic9g8csmbTIpI0Fhr3nXvltTWwdB5h9nyJEs17kA8AhbrX67rR6t2a0VyRD7s60x8Bc6Nz2nYASnlWbTIiISio3ZfFtA6aUJOAem1pLkY0m21r1dlpKF58CB5ydVLbYjIkU0Wy/xqhGeaBAAjaFUsnnvTganaMlG1FFxD2ZMpHT4SB+TV8BapAsDoBk+MONHSmqsUfDGxAtMbK32wdgKsZZgHO4JyNxuVbFfAFCql12UZ/3jBggcssMaWS+gmevBp1o6aWxKPp8DRYxsGn0BsH7mOer8H5Y28bDVTqQ4FX87WKEtwjKpbdvKEeiN+cOLwemYYadKx5YfAT27Af6Y+8USGp96K9oiK/l6IA+cVZyXu/nz/NroT6aVQrVl91RMKyI+WsBCt68LbfITmPHdakf1CRqs6u1p82A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(66476007)(4326008)(26005)(6506007)(66946007)(6666004)(8936002)(1076003)(5660300002)(316002)(83380400001)(186003)(8676002)(6512007)(38100700002)(38350700002)(2906002)(107886003)(66556008)(36756003)(6916009)(52116002)(956004)(2616005)(86362001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kTkZXK43B0DZ67boFEg+HjuygAaCNliTEFPjV0Pmd2HRdE5ctR9WpFzABGMK?=
 =?us-ascii?Q?32LwZdf8J4Nh7qJLDaaOFlqhVHjgmoJrN9a3St56N9db+LwM7i6PR3TTPFas?=
 =?us-ascii?Q?pvyAcXkTmdGz4HpoXX+TzAh+6LPJEIKTNCPpbbYRnZDoU0TxCRENNTFVnnzy?=
 =?us-ascii?Q?D207QWJ0inkLlVp+XZRcS+fJKUgEuMTWZftDbnrQDVI1chcTuf96yfItsYGT?=
 =?us-ascii?Q?jBvdlHFx8ufoZeHQFkSh6Jbi2RlgV98c9DQIlFWqWnXVldpvW5WEO8BHUaPF?=
 =?us-ascii?Q?Ezmp4pjiialnbBOlJTt+qUUZB5Srwc0nJ27w7xnA+v6e3ImvlQwK30+mUxp8?=
 =?us-ascii?Q?J4kAYF0uNbcg7airno73NYKlU8f5wb9v7ztMdrt2W8IpqhGFFQrcUIhAxBIM?=
 =?us-ascii?Q?mgGPqLW08nkwskIFO/ZlIPnDa8r0lzz63Gfp5OdTmTzMxBNZ5p/K6M6d/rV1?=
 =?us-ascii?Q?WrLqhN+ViIVIvj3DRxOIh/5/iribl/yTDo/3mhggsTUm6ZT01WWb/IvuxeyY?=
 =?us-ascii?Q?Ji+FT0KvaK4NXR1DJetpbxwEMoYkEmT83cCZ2NmkGeU6D6MQbdhBZjEQ386w?=
 =?us-ascii?Q?IFZxJnd9bv0X55cZ2fehr8WBjc26ZDGTSdms3pD5ZEcyPVNMcW7xZbqXzorr?=
 =?us-ascii?Q?cHvYQgO2AExO6nrdCh0m6U3Tj75rvG0b5Wj3F1H41CMwRxLOuuNOrafveyHj?=
 =?us-ascii?Q?7HiX1F08dA9xrDyfR0JMILiBccve3mO3Dbxj4mWkp5n5yjkj+ClPinp2B2Ea?=
 =?us-ascii?Q?jCa0zw6G0iiTElYBSdMnzik9gjNqaZOY4ijY+4nWnY3WPEIeZ3n/w/o71uZQ?=
 =?us-ascii?Q?cDRksiYFWx0k+qXLI+vicpPvHDee1bvUCfTztXEbobO1RIJ5ZDpp5p+41wxF?=
 =?us-ascii?Q?gbrlLrYZSrCAp+ws4Jmi1oLRnn+gAP61qNBMp3z032oUnn6JkiIYDVQjnpRI?=
 =?us-ascii?Q?1V6S8LaXWuXAWI2aYV2ysSvt1kwgg4E3bP8qmMsLVtcUP1IMcL/eXqAvoNsv?=
 =?us-ascii?Q?lo9lJGOt86CPeeFA1bT0j94nizIMvbT0Tp8XfyibtzYF4pT2q6TE4+9gu1Jr?=
 =?us-ascii?Q?AXU8j/j/EMiDDDTWIJDIU5sNeu3eAXFwhxJcSX5qIEqxbJOWU1dBmPn69JOK?=
 =?us-ascii?Q?mVyzHyDDuR/TJzo24ABWOpqYHnSQmHJ6Lx5j4HS6JL4N0n51L2B/JCu1F7kT?=
 =?us-ascii?Q?gzjxtmbFrqDCUe5FBezi0pAQedYqSUYosdMw8Uf+d5NQIe05wzGCAhORM5bF?=
 =?us-ascii?Q?5ZNvg8Awg7srqGxJtSbXOctg01kJWqZtc8NsGtjdfc78vrIvZmjOeIwLAe1L?=
 =?us-ascii?Q?YYmFsM4UBhQdMpTFnv4KxKbg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b00357cd-54d5-44f8-f825-08d96dfdcb4f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:38:25.5880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9FOWLQrnzVTloPjDe06FWUW/xiWxNtdueO8iINu2QswPBtiH2ZT+B+DpqQY3gMVNAKG6/mTPZhRuBh1jntmZGpogE0Y6uST2v5USoCxTDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4472
Received-SPF: pass client-ip=40.107.3.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

Split out nbd_recv_coroutine_wake_one(), as it will be used in
separate.
Rename the function and add a possibility to wake only first found
sleeping coroutine.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 32e3826ba2..52b0733684 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -127,16 +127,24 @@ static bool nbd_client_connected(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
 }
 
-static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
+static bool nbd_recv_coroutine_wake_one(NBDClientRequest *req)
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
+static void nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
 {
     int i;
 
     for (i = 0; i < MAX_NBD_REQUESTS; i++) {
-        NBDClientRequest *req = &s->requests[i];
-
-        if (req->coroutine && req->receiving) {
-            req->receiving = false;
-            aio_co_wake(req->coroutine);
+        if (nbd_recv_coroutine_wake_one(&s->requests[i]) && !all) {
+            return;
         }
     }
 }
@@ -415,7 +423,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 
     while (s->in_flight > 0) {
         qemu_co_mutex_unlock(&s->send_mutex);
-        nbd_recv_coroutines_wake_all(s);
+        nbd_recv_coroutines_wake(s, true);
         s->wait_in_flight = true;
         qemu_coroutine_yield();
         s->wait_in_flight = false;
@@ -558,7 +566,7 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
     }
 
     qemu_co_queue_restart_all(&s->free_sema);
-    nbd_recv_coroutines_wake_all(s);
+    nbd_recv_coroutines_wake(s, true);
     bdrv_dec_in_flight(s->bs);
 
     s->connection_co = NULL;
@@ -1035,7 +1043,7 @@ static coroutine_fn int nbd_co_receive_one_chunk(
     if (s->connection_co && !s->wait_in_flight) {
         /*
          * We must check s->wait_in_flight, because we may entered by
-         * nbd_recv_coroutines_wake_all(), in this case we should not
+         * nbd_recv_coroutines_wake(), in this case we should not
          * wake connection_co here, it will woken by last request.
          */
         aio_co_wake(s->connection_co);
-- 
2.29.2


