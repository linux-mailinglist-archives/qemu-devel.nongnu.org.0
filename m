Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A254361B4A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:27:40 +0200 (CEST)
Received: from localhost ([::1]:40098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJpD-0001JH-66
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYQ-0001kk-So; Fri, 16 Apr 2021 04:10:20 -0400
Received: from mail-eopbgr140137.outbound.protection.outlook.com
 ([40.107.14.137]:53094 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYI-00089h-V5; Fri, 16 Apr 2021 04:10:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YR64zAyBpAs/sisCkRftvdRmPRdffQB4RvYIi666BNU0rbhHficl0PrYlSrk/7na9/BMw/jMyRQj1rgPReE2mNqTgJRQaKLvlhp+GgA0wHt1IuAZc1N4Z8spTTdn6+VBBr4adXGi3u8pPrcGz4pcu9sMLOeVxpXuongLSbLyRcg7xn+ydR45HHFfriqODXYgzNm065v2Vqr7ELPkXzZfXCvjbgh36245GfDathMIDVqS3bJx4g+N9OjB+5yjnB3Lms87qnxntqpWzrCo+1C0DP/EbPCRVlHYW8LEghx/raJydHekwcCsUbFlIfReft/juHVZsfefjOLRfHHd27C2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM6CF8bvL++cB6Es+zVhWh/ciJNqYPjJQ3h0gtza894=;
 b=Y0fCJVpXY1fHw/5knYHMq3Xv56uv/i9Z+gCPgQLG0MoOCt8I0V6De8a0fv2wKVeNjJYL4KIkoKPDx/D+G3ndTZdoUtF9eUJjh9EH5P1EE7f5V+HeAqpsBxWpzyBlxM/oNgCooBexBhhu2r2/ACT1vD3wm97bX/yBCCCssPudi+c4+UdTfJrT7JrvrlKRFI134hcu4onZKRIexfWGeyDns2vdESC/q69ndUtGfsfnsr0w4NMNPYDsGrAOiakNtNmp/SxIsGp0krYlnwtVrMbolPgLu0W5/q24TEG2GsMFkAYcYZTck6zAo6ancrvh4a3Ruu8A3kmNA/7UvzpduryIsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM6CF8bvL++cB6Es+zVhWh/ciJNqYPjJQ3h0gtza894=;
 b=q5H+4cbZI/RacX4DRtJHBfQ2016fcCDIfeoT6yNIJoWSvSTGrSAD+fCiA8W+iovv265SK6/f+k+3JE+JkO3/Ddctuv50ZdBlb6CUCnPHeW/csjz1lWG2o21O6cH+rxF4KfDowXUmKQczivnHZ4O6IPD6+h1q4RDRieBFfS3H4PY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 20/33] block/nbd: use negotiation of NBDClientConnection
Date: Fri, 16 Apr 2021 11:08:58 +0300
Message-Id: <20210416080911.83197-21-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7b7f4d0-b78a-4a6e-e8c4-08d900af0439
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691887461FE2DDCBC98BCC5C14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9X+TmojgUQ3XqdV3cb4uDRE+2k/62QkxYRjN7xFAMPpfqgltOHh/OzT8feKwlNZCm8EgmJaxmYSdOAy6pDcoQAOoevwWO/s71hPQce3AlH3TZJjoecpvD+BSXNWJ2DD29965bXALYkCJOieAGBP6urXw5PhHO3MN+EvYNR+psXRYsMwX/kgHdjdSQs95EucMsTnWoUKFKRP9Wm66e2IFxsO8/e1juoaUBVlD5VvkDcbAld4MFT7oJBEKI5q2rH6U8tPQyRDDgJaHEvhaUfMDrVDO8K/5yRewUowVhEhL/eYNnc1eFz60SXyCkMNR1lIcdEDWzaoRpBsWajlfblaaAT9xtGTN4bjg8quFdGYpqM8NPf27xMM3h+DEC+9FDIuD3xrg/tI05BfZsKodOzz94WmXzSQbW2Teyn/zhohRY1AQAHVQqCgg5cdRJiQMDScKVU83+f8WW341kbPhF/3f5E5eBAj+tkH/BDNm5mEWuyh2KaZ5nt0F1xGHaqH2k+gLGNKRS4zW0Z8Ge7mUJ8wi8Q2v4omIc+8ZkNhPWF/SEknvydU5iFqSC2De7zUMcbwsCuqATev1EKqnF8cq4Iae2tPf8Tbv/iOCkBTfpRLAYGI2cGHmVu2cEqhfI2xX2NP5fsvCn980P+tnMZ41MWxljxqw2K82Vg1yyHncYcfhzmiYyhH8hbDlKdxxixmonRXg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(66946007)(107886003)(8936002)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(478600001)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(316002)(36756003)(38350700002)(38100700002)(6486002)(5660300002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8ZqEHh1qFcjb1RTjdIR58fJsi6E5eR5I1HbXeDImgLSlN6pU6gJ5byy3rZcF?=
 =?us-ascii?Q?E9MRXWhWGc95BkfmpzHcyYyr2uL6LKuNVLGx+KiqERgOIWysKkPX5G/5sbuu?=
 =?us-ascii?Q?ZWz45sO7mesqxvWzbnY/t2iNCYdQ4JgTJ+i8HDO/ML+30SD+POEzlFg29vpd?=
 =?us-ascii?Q?1P+oWGcMdAtYCR6tifGBuPTYMf3ewJNmJWa6+QWbMUj9+6/W3ujKL4u5U6+u?=
 =?us-ascii?Q?L6UYBzerKZ+Pci5XI0cYlmKI8bK1rHJjv6oTA5flMi3JCRHAx2fDl9MQEC60?=
 =?us-ascii?Q?W/p7mzP3dQgV7123Tc8hZ5s6I9g2RROpSNu/gnaTBvyHeMyrDYEUykOdVWZ0?=
 =?us-ascii?Q?8llgdaikS8j4u94bBpDlAhoiqE4YzLqSR+PGoTmFQ8NYSlpCL6WNowu3b9Ew?=
 =?us-ascii?Q?92I7plud1iXTxuo5qNGQXtH/cLlkrcG0gQ9G4oskIBYDjUvA5zyI5EIjbGuq?=
 =?us-ascii?Q?UMEtlmQ1aOCLLI/OkSBLMq+UEiarRAR0uYU+IFn4gr1AEuaRRYL8EX0+fNjJ?=
 =?us-ascii?Q?6wsQjTkFKL70Nbf6f8gqQrUXO7kYWgRWzIXB8SriJHXmgL/VgxtM2lXsVWXZ?=
 =?us-ascii?Q?c7E9qcygvt8mg1XDJJfEdJ6WCYG6WcGWUI07sxa1+3069obat1llRn46C35R?=
 =?us-ascii?Q?3XSzQNAmK1UWcpX4mpVg12BVMY2agS9d96FxG1Kybm00nujMolcGcpaWQtht?=
 =?us-ascii?Q?nJ3t5OGDENHCpgn+vmrzSb2+8l1JyoA25iqZueUb2S6d6Ist8vOkER2AYVWN?=
 =?us-ascii?Q?hkB+25g+XnOHqjWNtsbN1JlysnGQfUrWI2qjy4hwAg2DR/lJvUXmkT17ulKr?=
 =?us-ascii?Q?GQnJ2gDGhsUflaZyOp7n+J2uii6P1YlBi3MrZqcwEHF+TYBrExHzM2H+/aai?=
 =?us-ascii?Q?0KJxK4GU9jRj52X9VpCAVRedkb9OQwKhAlXdRbbu/gBlbKKzIBEEjENPiX//?=
 =?us-ascii?Q?Y83fOYFQiTHShUIacxzAIuAF/76mLrpUjpfmt36ptFfwoaCQTn+8Q/LttrDi?=
 =?us-ascii?Q?bzQuZc1S2dPeQoPRniyCAGxFQZ+ErwsOjRkhx0dWxuAlPK7016AFgdEDjjPI?=
 =?us-ascii?Q?rWlifDqsp3nJmsBpANI45fsY3DDE3pQL57EZ6q6FyVs6PpNhhAlNqgzMuyxJ?=
 =?us-ascii?Q?0/1UWNEhmUG0cZa47JmfNrRv+Pw1ZlATkvdZfKO75TNi9b0gQGtHQKPRAWcB?=
 =?us-ascii?Q?nR2YemXkcx7MNHC034kh3iZuVMsrHInzkex1DWeEfSclWadflgoWarCiMb0+?=
 =?us-ascii?Q?csI5OtvxUNg1XOZ3ZpdY/TSQQn9XqAcAd4oo6IRw+/y17H8uFmfgTidVcZCl?=
 =?us-ascii?Q?lTNoy1sNtsTJQLQQyuUZ66vl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b7f4d0-b78a-4a6e-e8c4-08d900af0439
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:54.1280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvBy7Ng/5osKkI0C1pq1mCYNxkTBiJiplyUrT2r+h9lXreT+SsiAXuplOy3deOCrlx8wi+ujr5UCbzZilIAsl/O7aDyK02Kf55NUStaUU/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.14.137;
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

Use a new possibility of negotiation in connect thread. Now we are on
the way of simplifying connection_co. We want to move the whole
reconnect code to NBDClientConnection. NBDClientConnection already
updated to support negotiation and retry. Use now the first thing.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 44 ++++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 03ffe95231..c1e61a2a52 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -365,6 +365,7 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
+    AioContext *aio_context = bdrv_get_aio_context(s->bs);
 
     if (!nbd_client_connecting(s)) {
         return;
@@ -405,30 +406,44 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    s->sioc = nbd_co_establish_connection(s->conn, NULL, NULL, NULL);
+    s->sioc = nbd_co_establish_connection(s->conn, &s->info, &s->ioc, NULL);
     if (!s->sioc) {
         ret = -ECONNREFUSED;
         goto out;
     }
 
+    qio_channel_set_blocking(QIO_CHANNEL(s->sioc), false, NULL);
+    qio_channel_attach_aio_context(QIO_CHANNEL(s->sioc), aio_context);
+    if (s->ioc) {
+        qio_channel_set_blocking(QIO_CHANNEL(s->ioc), false, NULL);
+        qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), aio_context);
+    } else {
+        s->ioc = QIO_CHANNEL(s->sioc);
+        object_ref(OBJECT(s->ioc));
+    }
+
     yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
                            s->bs);
 
-    bdrv_dec_in_flight(s->bs);
+    ret = nbd_handle_updated_info(s->bs, NULL);
+    if (ret < 0) {
+        /*
+         * We have connected, but must fail for other reasons.
+         * Send NBD_CMD_DISC as a courtesy to the server.
+         */
+        NBDRequest request = { .type = NBD_CMD_DISC };
 
-    ret = nbd_client_handshake(s->bs, NULL);
+        nbd_send_request(s->ioc, &request);
 
-    if (s->drained) {
-        s->wait_drained_end = true;
-        while (s->drained) {
-            /*
-             * We may be entered once from nbd_client_attach_aio_context_bh
-             * and then from nbd_client_co_drain_end. So here is a loop.
-             */
-            qemu_coroutine_yield();
-        }
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
+                                 nbd_yank, s->bs);
+        object_unref(OBJECT(s->sioc));
+        s->sioc = NULL;
+        object_unref(OBJECT(s->ioc));
+        s->ioc = NULL;
+
+        return;
     }
-    bdrv_inc_in_flight(s->bs);
 
 out:
     if (ret >= 0) {
@@ -2048,7 +2063,8 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    s->conn = nbd_client_connection_new(s->saddr, false, NULL, NULL, NULL);
+    s->conn = nbd_client_connection_new(s->saddr, true, s->export,
+                                        s->x_dirty_bitmap, s->tlscreds);
 
     /*
      * establish TCP connection, return error if it fails
-- 
2.29.2


