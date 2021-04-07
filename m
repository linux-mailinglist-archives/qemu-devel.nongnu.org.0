Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474EB356A8E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:56:00 +0200 (CEST)
Received: from localhost ([::1]:43188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5qp-0006Mq-A5
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iW-000640-FQ; Wed, 07 Apr 2021 06:47:24 -0400
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:20888 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iU-0001Tc-Mz; Wed, 07 Apr 2021 06:47:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pe+/eCfSJeqlBMhXc3E+rnrmcGyiR5+bW0xsrqYelvgB+NZ3GwaGbaHwF/ia7szeFGAS2GOkReSEQtVugwqEvu0HPfmuWbJc8HuJ6sDwWnDV7rtuG7x0hv5m1WTeOWnfntguR7Givf1gmjKjyMUMD5Q84HgSBRNuP/2tpZ5kATjdnRkgfVm2MC+1mLe040fsPNWQu5QEck6NVB8ALGtNdimw5jDSrKEegCncnXM6XOEY/TOkXaAid1Cg6NbLYJbq1XjxMlIO6u+/hEUwtqw3bvgVwM4oDPWlgJjnJ006m9vYSMP11g2rRSxI9smu55EE28v87pOzccxutNPpIHO3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEkwYAy1pVM9VZlOV/ULu/9JwYkmgh3KKjF9gvXO7ns=;
 b=irwAK7Tq8d2P7KPbaXdR9xOG8W8L5RID4Y2jAaJOzrYdGkr/bLx6hvheuCL++AHcixKqUVqg/Sd7abDAjsksp2Nu7QzH23YaQP9dUqIdHvnJNaqfM4u8tl9qzDGfktYplw4I6jQzTjQuNwlftnxk9ioVLxRi07HdlV1nfMmM0BF9Ng2j9vPjeCShi1tPQgntiGKuleI7HHuM3khMtvuZegPZWGnJN76KzTuYBrb+N9ZzYtM0PlfLkJax3r1p3/MXzVhnp5598MuUS/KjLPiljUVQ3EQt3h1eZ9u+cD7J/KRCpQ+OfSlGC+/msqEZP2fzqbq3ZNfJokyWVIu0ogojRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEkwYAy1pVM9VZlOV/ULu/9JwYkmgh3KKjF9gvXO7ns=;
 b=OL6AdAJ9n2MuuN5WfOA2U42IqScjJ/OJ/aa04eteatcPCqw5z8w45k70DF+NetWJMr74vZgR6tCTBKWQJ1tcr2M18M0ib058nirJT5xUaBbrsXh3ugWzd4+ohrGkIiFjs7urR51DpQ3ILYzkJ86pE9gNLgARRIdJ6gYf/38g4/M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2452.eurprd08.prod.outlook.com (2603:10a6:203:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 10:47:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:47:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 12/14] block/nbd: refactor nbd_co_establish_connection
Date: Wed,  7 Apr 2021 13:46:35 +0300
Message-Id: <20210407104637.36033-13-vsementsov@virtuozzo.com>
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
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:47:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efe8b582-eaba-43df-8b4c-08d8f9b2810e
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2452:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2452D9BA7A9067184DBD3B7AC1759@AM5PR0802MB2452.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:160;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xTVLWNv7UN6lB0ON/wY0fA1tpflw6UG6YwQk4AMjE3w72tS7NIHtGVjsZ7kfKLYLs8GP+MRLYPGb8uBMW64NqG/4ZMzXBxvPa7aOl4Ivna0AZvWZaovJA/Z1h/ITBM8FDmRr4UG03r7e4bJp3UcZQNGUAAdMxRHN8hg2LuqHAraHDPVEZMw4xUb1i5X67M1l1pKMvPZOiB8SNtLmZk1sijBODn2KaLxeAgq/pjuK1BFg1HGaMH/yygaIKpC3DG3VVWLssXg8FP7JmQ4fgXxyNMmMXtklOqXyOh19NtZ+1pwWjOjqUMxZES7dn62mwrFZkJJiX/VS5ueZSVpjmFHV5b8+iYQgeWap3RSQaVz3RjfhZYdDqBANyfsUw8ZMLpca44FUBPWrbgpIq1Dh/TWOlLuC3u7TZdmwmFUjdJyzohsj4xmJ/ukicuYQh7iCLZVOWwjQxvqtwQcDPkl8vJd2TsGBZTKCnCKWq9UV0U4+Z+3+fNMinv9VU7XkPWSczCJjkJYOoJt1gSoCT7N6+4f/KT1Rr2g8BzR0/uqdUYOPIIhHsqKI03qShTl3cV0X6JSZIaMM0gXQBRBGf4uAI3nIIfA9av/+PWMHA/dCdWpslNyHnjwLqA+oIBTWhcem5/b4ihgxbu7RK9ws/gI3aeHz7BLnuNVEiVIViyYyEdmDNHjWQyJYNY1N4Wj5sh9RyPa1jBXHPmTNKrWudBl8iZ2U2wmU5ZZjuqTOYnsOumSSb5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(396003)(346002)(376002)(8936002)(66476007)(38350700001)(36756003)(5660300002)(6506007)(4326008)(69590400012)(956004)(66556008)(2616005)(478600001)(83380400001)(8676002)(316002)(6512007)(1076003)(186003)(66946007)(16526019)(107886003)(38100700001)(6486002)(6916009)(52116002)(86362001)(2906002)(6666004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NpTCv+IDUDpnriS9aGZWzSiZlOfIKNUx2+w7hxHN+LDME6a9fvEI5E6GYT65?=
 =?us-ascii?Q?tmoIkCzDICb2cKdMnrJBX+fHuRJx+2GZyR2ZKRETkcNYI/WwyA5s7xf9Uqec?=
 =?us-ascii?Q?biJMq0FHMf9r/xflM7lL3VYI2VUNtNnrYgFtwEotzCxSPO4zmyRdqvi4xvSn?=
 =?us-ascii?Q?KwC9ZOg11fEHz/ahUuW15SLFPNlplEGHrwCAnJEHrf+FuAs6QjAFiknV7qgy?=
 =?us-ascii?Q?1ifCWAWAPTsEzn6b8dlltQlQYI78krE9F/JkHYzUVLAjTOEXqkXqjyHqJPiC?=
 =?us-ascii?Q?bY+pvNB1AT6MKp/3JADpMF1eHGPieWl4GkEW1bLxYaj/aQv5Je4cM5uykURQ?=
 =?us-ascii?Q?WOSHWhUB4egjxtHGUl3t/ELcijhiu47GKChOGFyvfyrZyEUIxdk5REO5AE0g?=
 =?us-ascii?Q?FF2Xp6J9vt3yVR6NVtGoTrVtm1VYyTntUhjOVXehTx7nYagyUHYlpTHTslX3?=
 =?us-ascii?Q?shZR3Tb00eV1+dGz28ZIx4y7pnX1dT/T/IE1P8HnyyInsW9+eVEqnSjjk3g4?=
 =?us-ascii?Q?yjJ9kJP4SuEsOoxe4GMh0a5mq00qnyRPX/9xOf5mlFoA3Afyp4h8huJ/wqrW?=
 =?us-ascii?Q?1u/SOtMZcnVrp24mvQmA1KfeFUocaG4ehbV/0ffFqzQd8dq4EYIIp0/L/EG0?=
 =?us-ascii?Q?/NjjYWgLDCGd72wSgkqOSrcTn+Yjw5bCN6fgGHeNB9/9yGvqM1mMWFEkb/Gy?=
 =?us-ascii?Q?U8Rmrwe2tbabqITJjk5GBo30kdhIfV8BxXtsEkAFaGAvX03QINJ5V+5cVauZ?=
 =?us-ascii?Q?7Hh+Yaj8Mz+gFq/vDTorPL44GaKYiEziMhKgXJJY0ULlyBai/T36cZgx4ihr?=
 =?us-ascii?Q?AVd7uBbhnisj2aYNydI1lv6uNmJN5JPfsQHpzez8+YSlUSfsPAtBYvpQLSmy?=
 =?us-ascii?Q?mUiCTAd2YubnlQfVWlyixrWnCsIwHsfLXoRUMB86lF+2p/vsybEuoWRx3wy8?=
 =?us-ascii?Q?J3OpCOB98qrAqR1OSL6inxntOSIhn5EqfveIxh/6jimV+jz5b4H1Rrg9BLVF?=
 =?us-ascii?Q?8+i5XYGLbq5Cd8UXDoFgHj5u1QpCi06MRVkkZFsX3lafirk79U+hheCAdflE?=
 =?us-ascii?Q?bCPt9QKd0sz83iWuOgAp4S+kWV3hj4npMKh4c42Q6rPlOsveSyKF7XpokBHA?=
 =?us-ascii?Q?xv5U+2DtxC5V2xcAx4q1jbH1D92HYZJITMyTT8ZMg2U7F5lKR5+uQ2ZtSjUH?=
 =?us-ascii?Q?YsEUnCiCCKUOrP7emeeVu/9jt6CpZ7joAdUqvTyWRRdUzf/rQ5dRgkTrwyUG?=
 =?us-ascii?Q?nr2Ich0J3RY72rduOhtVRyYBmiZ+gGyed9pnIGoM1KzpIla14BguUd4EQghB?=
 =?us-ascii?Q?CmNORxIvN4CMxT07CxfBBdob?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe8b582-eaba-43df-8b4c-08d8f9b2810e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:47:14.1009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUGn9vMYwI78MYxjsJstgpCdqIJz2TV5tDb8lQdDaiEp+Bp8UD1zcnxn0/vpk53UMIpAdzGTTjOXKefO8eZ22bTRiHgEyUHWmJRxn288Xf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2452
Received-SPF: pass client-ip=40.107.21.113;
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

We are going to drop nbd connect thread states for simplicity. This is
a step that makes further commit simpler.

Note, that yank_* calls moved out of thr->mutex. They shouldn't be
related and already called from other places in the file not under the
mutex.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 6729561935..f0319d2256 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -413,7 +413,6 @@ static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
 static int coroutine_fn
 nbd_co_establish_connection(BlockDriverState *bs)
 {
-    int ret;
     BDRVNBDState *s = bs->opaque;
     NBDConnectCB *thr = s->connect_thread;
 
@@ -430,10 +429,7 @@ nbd_co_establish_connection(BlockDriverState *bs)
         thr->state = CONNECT_THREAD_NONE;
         s->sioc = thr->sioc;
         thr->sioc = NULL;
-        yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                               nbd_yank, bs);
-        qemu_mutex_unlock(&thr->mutex);
-        return 0;
+        goto out;
     case CONNECT_THREAD_RUNNING:
         /* Already running, will wait */
         break;
@@ -459,11 +455,6 @@ nbd_co_establish_connection(BlockDriverState *bs)
         thr->state = CONNECT_THREAD_NONE;
         s->sioc = thr->sioc;
         thr->sioc = NULL;
-        if (s->sioc) {
-            yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                                   nbd_yank, bs);
-        }
-        ret = (s->sioc ? 0 : -1);
         break;
     case CONNECT_THREAD_RUNNING:
     case CONNECT_THREAD_RUNNING_DETACHED:
@@ -472,7 +463,6 @@ nbd_co_establish_connection(BlockDriverState *bs)
          * failed. Still connect thread is executing in background, and its
          * result may be used for next connection attempt.
          */
-        ret = -1;
         break;
 
     case CONNECT_THREAD_NONE:
@@ -486,9 +476,15 @@ nbd_co_establish_connection(BlockDriverState *bs)
         abort();
     }
 
+out:
     qemu_mutex_unlock(&thr->mutex);
 
-    return ret;
+    if (s->sioc) {
+        yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
+                               nbd_yank, bs);
+    }
+
+    return s->sioc ? 0 : -1;
 }
 
 /*
-- 
2.29.2


