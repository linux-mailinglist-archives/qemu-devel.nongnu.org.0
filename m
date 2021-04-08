Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B34A3586AF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:16:03 +0200 (CEST)
Received: from localhost ([::1]:59614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVRw-0005Nb-RQ
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVMe-0006xW-HU; Thu, 08 Apr 2021 10:10:32 -0400
Received: from mail-vi1eur05on2131.outbound.protection.outlook.com
 ([40.107.21.131]:17888 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVMV-0001oz-FG; Thu, 08 Apr 2021 10:10:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAsDJ71mTXwxNDiYvPtw2BB4LyRL9NnkgYJhGGbm8jbUFr/jb6XQXJ1a0JrKOilh/xQVrbTe5eqWNsJRo1bLlH5CgSRC99Tp9+w6ypxrGSY+eFhOegY/tbg4d/BcfFkf3TLBtGJh3sYZBdUEguLhOyZn3cdoM5A3RMOjeu7GCdrJnLr3jAbg6/wDKLXAPh918rzQKSb6y3BMCkItCVxIGPYGXpbfoL/qcvkFHxlCWMc8AaLwZguqvmN6/3bg2iLHFDEtSJeuA1oSJkD8EkDQvDg8hfpNUVP/0mC9/f5BHtkitA4tNiCsWCC3fH7YeUtDua6XSuvL1KZc2sjSKLsC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRpkgfJ62SJ3UWOtgw4nHRNxnVASjbMRraPiWVPiDHU=;
 b=Is34lLTMAPfSZTZggyNa8sggwP/5XC1P621nndAhw9n+ObSMYkqqRr+tBt20L54rHikbbU0qLotcsH5U0LlmeJDYoVvoHvK6WkkloTADqy9RGY6whUxCQ9TjpGBcEd0Q5ZeBpLVlHEgfb7slQPDdZHtQWhyNR9+14zfEVlOcJ9/8wmaZX7Prz5Il30CSZ4bh3hBHwd3Yn0EH5YHbqxyHbCJWJqR+7tt4oUnA5NHTZ+3dqsfdbCMyZZcOPGqfZDzBEIXij6yqoLUxJhZ0wKnAl8rjBiDcUFRv7Dlznk6cldFsX7UjxfucO4x7NOlXqPX3Qrh9Qgp/Pkbs7lpVDsYUVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRpkgfJ62SJ3UWOtgw4nHRNxnVASjbMRraPiWVPiDHU=;
 b=JoMcq+i/jxkH2CfnAgYzlKxD3WyS+YQQ0UJEOI9z2NnXQsooaFI6LK5pGE7HAPCij3v6VSjFnZ0rZ4GXeBqiVmrgf7M+47bfyyvk1sa06tNSiK9U3/TfsfBRHBhWARNsNyd/C30HpUFf6Uco5aBpZp6n8XH+N8OI1etVcwqFT78=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 14:08:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 14:08:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, rvkagan@yandex-team.ru
Subject: [PATCH v2 02/10] block/nbd: BDRVNBDState: drop unused connect_err and
 connect_status
Date: Thu,  8 Apr 2021 17:08:19 +0300
Message-Id: <20210408140827.332915-3-vsementsov@virtuozzo.com>
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
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 14:08:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 906b375a-0fc3-4ebc-e38b-08d8fa97d268
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5909AA080CD5B23BAD22E144C1749@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:109;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zIa6K+SuhynfV2xvPDICZ1ixFFSnd++4bN/MyqqfoHIImCagZV35Pju8ODG3pLFlPk/dOmsktOXFfuWmOJ896MSDINy9q6K1AmqQJVAZ4+i4yI7dqZSIe28CDr3SessXsWDPby2nYPrjhLWEzeM8g9qKiIDhFvoLNRdC74YBxk2EnV8llOfn69m8VmQXALwgW0ex9XWEiMDTQBxLprfb/RKTGdIDPwG7B4bGzQzFMXAp3YfTTW4jWm4UgYuaKGvh+mVfG0OaeYP6Dc0zt7gtSgFswUD2uDV+IX0qepnfW75YtyHxM6PY7jU4I+Hj6iVLmbgosDuYmhRxvahHWoWcZqMA8IMWUPkpeF75A48TXxECWsG+1Gp3WPzWrEC1rVcE+uMrzJUFrIiFbYokO1xHuAql8rUVa/rk02UwQSJB9/6Kx4J+5A0gYlyYZxEnQC+lwYrjQzxU4DaHqSxF7eHt+LET5DMtt/PxAb+vwKjlwvzItoF4M2k5BdfoygMKjpc6pzp413Hm92cvd7t87gosY1ntj4sMXWWE0Zg5Nt2fMRHNb1tvHbJxDAZHIYWsA8YmJHlm9kidfrVlAVNKe0CBX6zKXXNjP7Ow5IzJB8rdH0++buJjWCtlLdXiZlWUQ7U4J2e+8eDDgjn1nGfy9Q8xhHt7w4Wrfm0uGKMqXaRIxufJzVDydCJPGahbCpEEGSYmVfA62xEcV1xfSCQ3iRF822mmR2o9RdnCPE49RsbhQ9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39840400004)(376002)(36756003)(5660300002)(38100700001)(66946007)(316002)(478600001)(86362001)(66556008)(66476007)(2906002)(69590400012)(6512007)(38350700001)(6916009)(186003)(6666004)(26005)(8936002)(6486002)(4326008)(1076003)(16526019)(52116002)(8676002)(6506007)(956004)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mKMpdiEXBkT5R7Iw/D+YQ0QpvJDBQOd9ag29pu7vhyGwAF2gkhLVptW2Jfev?=
 =?us-ascii?Q?3T4VuQmvNauqjJqSMXs6kdry6T4lyL9+QDTQUyGK5G5qb8JU4tveJoKDt1FA?=
 =?us-ascii?Q?eelTIOSUhLWdT3YXsNdpf46lSUm2/7tvfZcQ1bHdQRrFDg7MQ6rMqv1EEn/h?=
 =?us-ascii?Q?oyNMaS5HEdTDE6qSE83ICFGC21AX1m8Fc8+HynHvGYDpqFAB1iG98qLlNNpJ?=
 =?us-ascii?Q?HGd4I1gDxZ9kxFSiqhmbbaZu0BV93jXEPJ9oL8iP7TqrU2PTbjK/6XtUSRxt?=
 =?us-ascii?Q?IoZxAuuOeNui4j61KJzGa6UdO2zt/COkUY9RAiOkxB86CFKpWTFM6tWkO/mu?=
 =?us-ascii?Q?YvU9dWhay/CvKznG2t5y9IT+/QmtGYixUl50eMvraN31qm5lkNDgNI+XJbTy?=
 =?us-ascii?Q?4d2FqD5aGNxjGsY56ytie8IcQnmGw7tvoK0DuEOGQYx0vxQyVxmRqo1jKMb3?=
 =?us-ascii?Q?I9qZgeO5JkzxTTWBWN4bxgRXZT+D+kU1AzdgSXnCupvdg1nGQ4aQkNvc/AS3?=
 =?us-ascii?Q?3/M1diewWV5S7u/jIH69tf5RAEswF4ojGzf3Cqnx+6ddFejzmSjjB3x9v4Jx?=
 =?us-ascii?Q?8hRfQvgw6NGtZcDZuka4yaPU+EquEXLthhB9nm/4nc3zoYX5LEQLw3J6yPWO?=
 =?us-ascii?Q?WEQkrVmlPHBmSIWXGCOEloWXQKJFBT5nHOT1VQr4Js+Q/hD+NXu6nwDW8T45?=
 =?us-ascii?Q?Bt+6QqrBBGgenOEDPth4x2+yntpRSMDnPzVQeo9FapHgBmNXk131ablA0E96?=
 =?us-ascii?Q?nvQ3akdITAmKOmkQvQc9g/8UHSleO/4Pgg1rcImPO29qnSL9qwa9kE40Qw2r?=
 =?us-ascii?Q?3J0vdT7MdZJIvNWOCLlxKeugq5Fx+pfUH8TQga/7zjwBLJnIG7sbhxH9lZg4?=
 =?us-ascii?Q?6UAjAM7/SZoszp5W7JcJ+qrT6Lex7xjXpLjvvyvFVqNW5iKCqs+KIcnTMfSS?=
 =?us-ascii?Q?0v0jJLvA1tEL305IIw2qCY7Kn556s3LmJNU+VC9guSnn1y/7y4H+5MBygaAb?=
 =?us-ascii?Q?7xmOcS+meIIo6wz9HaqtzEgN2QzoX9g/6Oz5M65PvGXv7lWUGTfXIA/wK4CE?=
 =?us-ascii?Q?/7MPKd5AEh8SGksWENOegyFcXnzkan2QxFC5qV2GyZ38dVS0Viw5s76PYGpY?=
 =?us-ascii?Q?mHP8VKoDCRWqVXAiIYkGu5WxGQaWgzyCIjS76YuysmNPJf9HBeRqmVgHYmgI?=
 =?us-ascii?Q?RKruqY+sOQZCSnMUrEAf1Mq93gVaCVgkqBGieYVTD3n7Qzads48YE17Y0NZB?=
 =?us-ascii?Q?WDDwj2S/YWMC8bIntnWue591Xw1DMWqYOu3HPP37dMJFHsI4KtZwEmlCyvYH?=
 =?us-ascii?Q?MCqFxQTUrC17lHmf9yEp+3rt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906b375a-0fc3-4ebc-e38b-08d8fa97d268
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:08:45.2369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3Q9yFrFflD7EVkEvXse0fcaq+0lRx3JSledBNx+bBYvYRC2fUIWNb+eMs5gRYcA1kzjsk4MpciTmemtGworg0K08oBecbkgG6IH3Sn34xI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.21.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

These fields are write-only. Drop them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 64b2977dc8..b0bbde741a 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -117,8 +117,6 @@ typedef struct BDRVNBDState {
     bool wait_drained_end;
     int in_flight;
     NBDClientState state;
-    int connect_status;
-    Error *connect_err;
     bool wait_in_flight;
 
     QEMUTimer *reconnect_delay_timer;
@@ -556,7 +554,6 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
-    Error *local_err = NULL;
 
     if (!nbd_client_connecting(s)) {
         return;
@@ -597,14 +594,14 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    if (nbd_co_establish_connection(s->bs, &local_err) < 0) {
+    if (nbd_co_establish_connection(s->bs, NULL) < 0) {
         ret = -ECONNREFUSED;
         goto out;
     }
 
     bdrv_dec_in_flight(s->bs);
 
-    ret = nbd_client_handshake(s->bs, &local_err);
+    ret = nbd_client_handshake(s->bs, NULL);
 
     if (s->drained) {
         s->wait_drained_end = true;
@@ -619,11 +616,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     bdrv_inc_in_flight(s->bs);
 
 out:
-    s->connect_status = ret;
-    error_free(s->connect_err);
-    s->connect_err = NULL;
-    error_propagate(&s->connect_err, local_err);
-
     if (ret >= 0) {
         /* successfully connected */
         s->state = NBD_CLIENT_CONNECTED;
-- 
2.29.2


