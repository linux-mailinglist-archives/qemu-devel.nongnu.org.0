Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA0D2EFFBE
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:10:57 +0100 (CET)
Received: from localhost ([::1]:42612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyE1A-0002EW-Jc
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:10:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpi-0006dn-EA; Sat, 09 Jan 2021 07:59:06 -0500
Received: from mail-am6eur05on2129.outbound.protection.outlook.com
 ([40.107.22.129]:46432 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpg-0003fN-Lg; Sat, 09 Jan 2021 07:59:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJ3xoJDT0r7wgGZ/o7hLBY8+yyMOVHZ6sFQdn3vvqftTJQls+l6eLlfqmiZKrsOzBhb10sHqrgO2Jh/C7bmWQA1oaGcIBPkqmcNsnPdpad4gJAGIJAC0h3NbuGUiSbRNVgpQQ203pLKLdACupKpagesbeIJcj8k231+7tqRDwnTPiSqFqte8npyujNVAbCTfgIfgkjyqdn/nJWxR92P1XWwMU7mwCOpijIQuLda+4qyGAVao3VDYlg9UzVSS8YrrjLZTcm4golBU/dcC1d86LBersviCMwpYC2Y+x+Qldx6oBlJFgJYb4+BJoB6w+3yu7/eImUkKHkLRByWVmkXqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FU1664aVX+pnGTs5I3ebsQYqWxMt5W4q4y1UON+dME=;
 b=d5IrgpDvP13smLYPoLtxlFwe69V132IKER+H4sPdbzu1UhINaPvIqnpkTIbN/wjM8sn4uKSrhA/wXLLg84TVlaMaLXvvs4O2fILmtay+hS7Lyc0LCqY5IJJk2rCKnYoUelj+94UU0D7+fHcFfZbQ+GNmHd9FWvt3I+VHBmxbZAbUYGPc7pL/hBieLURJFAUxI9g5xXgeC55lUS4WO7eK+cg84X7kYKyUx/FGwVen5c9gSvU/yE5+XjgcsG9E7cvF/cqv5g724XNtcmPR5udYCgqDZCm0jUGLeu/nLu9S2WF/F/Lz1N1TttDtmLqvbzZysUrnhbnn+/QxyeIbZq2fvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FU1664aVX+pnGTs5I3ebsQYqWxMt5W4q4y1UON+dME=;
 b=WDwn28sv/Pcg9C/cumkMYAUVo1D3sW7mGOPSKtvo7uP/hTg0H1YXgA5zTsXbB2+2wXxzPuFbYBMStXVZGQcYTIrCxiy9EZBzR9yOJ+eWBB2lVf838NGOC9ChxhTDbsKGUYRG7kem0kJOFRRmJzFZC07iVGpi5fVf50LCVSS8X28=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 12/14] block/qcow2: simplify qcow2_co_invalidate_cache()
Date: Sat,  9 Jan 2021 15:58:09 +0300
Message-Id: <20210109125811.209870-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109125811.209870-1-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43bd7bc1-abfa-4652-397b-08d8b49e525d
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2418FF23EEA5FC7AB964D4CDC1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TrTVJq/zwhKeQIK3bIzmzKNRYxIR94LweFzpbMUGmZsQcZqnMBauKmNSIiyJeEU8kpUSn9y9Qcw42tBsTAm5PznJ3ZBOKuXS2dkj++ZWo5J1UrjZ8CEDPzBypiLgo3m1XbzBRCHe0y/wZwThEgNagYE94Vh+6m/TbgM+DokvqCl+KcGqZksY1/siygC3DHCMp7RMWfem3YLJ0VoWJvyuLXSl3Wb/BAL0WbnwdmHJVTbFkQTfpLTkW+mlZ+l/gH1n1ZBlyNI90ueUvRsmnm2aptihrWBL8nnNlP+/3mWnP0s5afgVcA19IQqss5EPFVBXf5XTc9PCkp51Thcz8AujaYy/YRGpC/zJhWsXGcfaOD2L+VHbcd7I4XAqQjpVGv36gbwoZDU77Gv23JhE/UPnVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(36756003)(6512007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cR+mpwC+Mb1d8rgzC0RlrUgBkGuKF6hwkgpZXWrTWtmM9OFmYanc9YI/NFde?=
 =?us-ascii?Q?D0xqTFHWdBosK/iUD4dlvYEBTyBbd7qwAsiww0at2aOKDc7hfpWg9mLeDlRv?=
 =?us-ascii?Q?/8ZR1/4jDjyztvzBN3hz4BOzDF3PPrtAgjkRmV+6hs0HfqjlRBTxS+3eJ4iE?=
 =?us-ascii?Q?1R0mqsYLvS4J6TD115LNAE/BmvgkD4/EWBQNd9vPRZPZ/Sm1pTGeJRupjh1Z?=
 =?us-ascii?Q?JFZB4bUU1f7tFMr7wexMms4BEM2QStBZG3dZVicH4KiuSPZouPxZT3xn8pcl?=
 =?us-ascii?Q?KOJlo5yNPbcz0bI6eoIl15Z4DsL5KM5/jmxXRpjfJ86nQJBoZBpkU1iWzS81?=
 =?us-ascii?Q?lad8eO5A1b++2IL7TVrSosUm9mqurL23oXue4KHKPN1v81wFbTAdT42J2lJ1?=
 =?us-ascii?Q?UM9XlApany4JX1F+OuUCK1Z6h4YhCh9sr9QBvzn52QIwmjrDG+6kqyk3PST8?=
 =?us-ascii?Q?aJqMEqHoLtCLd0GhRnJPpw6FIk1D7ECGDl3cYB9TAlvFS6cRCQprWrOMGNAv?=
 =?us-ascii?Q?+NNtvrpTmKfWuLYf5mVwuDsz0zgR3UOACEx6P+yNzG6RDyzoNjGQrC+mIeOi?=
 =?us-ascii?Q?5VVWy7PHz6d/IHcckguaE6tU1JQ9CILhF9Keo/hrpxvgEiOWwgQfR+eBs1k5?=
 =?us-ascii?Q?wsmbKzRUJ7aoXhxVLv1cXP6us0lJUVOxuJC834Co6grGPI0UpZRT+PAuZi4n?=
 =?us-ascii?Q?G2l8n6h7gIHbgXZef14YGWbRSYUMOrMP7FHSheLIACFSfzViIH2P0zPlV7z4?=
 =?us-ascii?Q?w/8EMx/Zbz+wQDIpETS3t413v33m9FKIPrA2iObgDHn/3KvkHuLshLYEGu6o?=
 =?us-ascii?Q?JTJpQkyiOM4++foq9jF4Jkn8NkWlW9rFUGAxK15Bf87zjAW7QhZszyq3IslF?=
 =?us-ascii?Q?pg+w/aMtWNOVns9+bNE+kYbe5kfzINWNt5xBIGIWmsLnEAXI+vM0PmTf9FIb?=
 =?us-ascii?Q?BEGeKVyR1KoEM+67w7Vz93sN8OcVv8rhEmvdaiPkt4D94/KWh83HhSGvkEdt?=
 =?us-ascii?Q?mHwf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:55.1862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bd7bc1-abfa-4652-397b-08d8b49e525d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zz3CPB+49E31Yc1rXuxCljFDsLHk6ULi0K2q8zK8WuzXZSr4bJ3iamJOqDmixtZyT6h6dpIw3cqN8XgLxbGNl99xRrxaNBkUBdKyZld0Ffw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.22.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qcow2_do_open correctly sets errp on each failure path. So, we can
simplify code in qcow2_co_invalidate_cache() and drop explicit error
propagation.

Add ERRP_GUARD() as mandated by the documentation in
include/qapi/error.h so that error_prepend() is actually called even if
errp is &error_fatal.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 block/qcow2.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 2e0e050997..436bcf0a97 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2715,11 +2715,11 @@ static void qcow2_close(BlockDriverState *bs)
 static void coroutine_fn qcow2_co_invalidate_cache(BlockDriverState *bs,
                                                    Error **errp)
 {
+    ERRP_GUARD();
     BDRVQcow2State *s = bs->opaque;
     int flags = s->flags;
     QCryptoBlock *crypto = NULL;
     QDict *options;
-    Error *local_err = NULL;
     int ret;
 
     /*
@@ -2737,16 +2737,11 @@ static void coroutine_fn qcow2_co_invalidate_cache(BlockDriverState *bs,
 
     flags &= ~BDRV_O_INACTIVE;
     qemu_co_mutex_lock(&s->lock);
-    ret = qcow2_do_open(bs, options, flags, &local_err);
+    ret = qcow2_do_open(bs, options, flags, errp);
     qemu_co_mutex_unlock(&s->lock);
     qobject_unref(options);
-    if (local_err) {
-        error_propagate_prepend(errp, local_err,
-                                "Could not reopen qcow2 layer: ");
-        bs->drv = NULL;
-        return;
-    } else if (ret < 0) {
-        error_setg_errno(errp, -ret, "Could not reopen qcow2 layer");
+    if (ret < 0) {
+        error_prepend(errp, "Could not reopen qcow2 layer: ");
         bs->drv = NULL;
         return;
     }
-- 
2.29.2


