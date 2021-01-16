Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CDC2F8FAC
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:18:30 +0100 (CET)
Received: from localhost ([::1]:35628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0ttt-0001kv-Ht
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVO-0004pj-Fo; Sat, 16 Jan 2021 16:53:11 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:35449 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVM-0000ae-CH; Sat, 16 Jan 2021 16:53:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAKlYFRekxG/F8utI1uZ3ZDcg4KxW3j3x2ilQsuZaIPuKGA5JwmU8Xh3trF3wWtn1uLOPkl6BWJGceAgf7yPEIUE8wQ97CTOEhqONkUk+2zBGR5ujh8jKL8ht4xXRniTFv7I6WXFs52yygSGt2dLlI6Jsf25KmzmG8wONBJxEMSy+A2m9u0Y4OJo/1k97N/5dO2/7ReqE+jt1M+n0eHXgSXbJFzyMG5N6zSq168nB+FJM39eJL0H8JiVA9q2sjG7sya7RAO8fQ1JXrNhatE8s4luRP6waAruDs9u4Czdmo6WHhiWfy0H2gIKR5hJhMwwGpBBntNqMLe2hZw9i8wNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FU1664aVX+pnGTs5I3ebsQYqWxMt5W4q4y1UON+dME=;
 b=gWUCGFAt8NpWKknbwHtTnNr92/6fpxvF0uICIJej17AbEYgNhmD1MIhA3v8795vSlXWlF+J5zEVGBIsivPvnud+mVm6RwH5OruvAAzPFOX85qAwGtVXD989To9M56uNZ92GsdXV/pEW5FU9ZxB9JEujApyTxbddChWoLXeNM0LMLMLnJ5AjY1YxjhQ7eceeisQG9CFGx+u8ypEC/hhg+GXF4pK4llZ92czU0pnqzicVvPk2xjR63G/1gowrM0EZdJrLSyB02iN9KnI3OsIfgIGbjBSa/wZRfFz4JWRyewTky73lABksqANXjnFJmSqGdTbTquOIvkJcHG8n+GBweJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FU1664aVX+pnGTs5I3ebsQYqWxMt5W4q4y1UON+dME=;
 b=O13sgi61+JQJDIgjaioAPslnEeFEP8pRwnpQLqeGYVm07MPH8xwdU632xCpOVaZkwv7wMIrr2LpSt5Df/ZOAXyAeXlz/MKQaMbK8cyNyH7gGosqytvvyREfhdLTKixxKiivoA5n6BPaKXEZQ5dMV9dfE5isYm91A+iQZQU5jXiM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:53:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:53:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 12/14] block/qcow2: simplify qcow2_co_invalidate_cache()
Date: Sun, 17 Jan 2021 00:52:07 +0300
Message-Id: <20210116215209.823266-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116215209.823266-1-vsementsov@virtuozzo.com>
References: <20210116215209.823266-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb19eab2-e3c1-43ec-309c-08d8ba691694
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35426869C92D3F500EA04118C1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: plTliX1qmE0mY5tFdTIJnOEhzYKkWBkjqzKJx+fDBJRzaiB9AHKSJ7dfPA2pJp/yj5E3ocjMTjPCQZM0XqcvfP2gBiD7j83js3+D4kNqBRvbEFVZU+O9AQs7u06f9RIu4DBkA+1m9j2P3KPsnKtdEEO2gKq3MlM09wICuEBM+KUrGPPeKZRnL3eKd9h7VsujtCjgW/4WPeuBIviXarN8LBlBkiJDzPSV0lL2ndyorv1rvhaEq/U+uPySbwj2VN/sIm4zaUTFIjhYxnCKbPfUBw0GuvDDhOpTd8A+7baZcNmuZoqzk1LD7sgHjR4+qixuTjFbSqJ+I89EutrZl3YikD0CcgZ775LmL17bnxQRPK+VwUvSIC9/kOIVbWnD1f6EthoS4YKV2rmu79BKPAg47FOtk8KXV5ZP3vHgymITRhgqce19lN050MqX9Ko1rCnzEdMFpzhMbn1mvb8Ld4Q3aRXa2Ub4XNOLZI3cZYYMhlzcUyaXohu3K83URYgtXQbq7aKJq8hkS6Q4I8NiXIGzZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FXNvrBnGmJP7HyaLCvvbPeBLLKLf8f/yujy85Wjocj7R1GqraamhBgE41+7t?=
 =?us-ascii?Q?i0OpBRxRv5acgjr1drZDOUFOzFQCWntFdnALZ5ULwH4DYKDP9AK+QIubMV7z?=
 =?us-ascii?Q?RJUsQxK7+kLnVupvR7gHaP93AwXBOOCUZbnVnvaYRw8F3d6UN7JHYSBrc7WD?=
 =?us-ascii?Q?Ec64DhIiEPwB0lkWWLDhbTuwW/ss/Y4gqFFxFav7IBwsjAUZQh6Y1jzZsnww?=
 =?us-ascii?Q?qlOq4z7R7DT3uAHt418gYGblFGxFr6mT6V7eCqkYuFIj5g0U04oZFkAPrzHV?=
 =?us-ascii?Q?A2yLnUJh3SfqcvtQ1PEWyYv566J4Vc0YIpyUBZKp0eQoRVqyZQ1N15oOYdlI?=
 =?us-ascii?Q?URWRPjxI9kbpb8CH2YbkNtorbGspBDaASrH8fd48rhRmL8HhKJDmrorUgCHg?=
 =?us-ascii?Q?l1ZlDuGhlPpk4NfNwFuhswebcw05tysbGNcsHyMkKy10WcyHMut31EJb9ez8?=
 =?us-ascii?Q?OYdipEq6ZxKqAYWmqHK5lhRERkfFzs8D3XiqJ1KXofdUU/L26oWTNQzAGYc9?=
 =?us-ascii?Q?ksV1E9GuGGkGFFhbKAZG/s/woTML39OCbxvHqZxQnkXcOBnjakDUfFRppkCW?=
 =?us-ascii?Q?11ygKpnJtnOFnORUVdkdCD4VC+l/a1kBco/4qBAuadmHydM0moV0FCp11uCB?=
 =?us-ascii?Q?tNhzZwkZmO7JAXClufx2NKZWvteTM76ugtOtsMzG4yPuM4xwEXe5hVQTfBaF?=
 =?us-ascii?Q?RzhtS1rhzaPjknATmz6gk6BN8F0Fp/mPZqSsTt+/+ByVLwwm/25aMjgPwSaA?=
 =?us-ascii?Q?QJiUbm+Toser0McX12exAuzRsNXVsxhT1mB4sP2o04nj7zp3bCCGoZdIkmF9?=
 =?us-ascii?Q?UfCIJdsHoLKsEV3CfiSEo5OtEa92JtUKZKf1vgTBgcGwj1HjEABqJNP+rE6H?=
 =?us-ascii?Q?CfM8LTw3vStAha7jSaGfEVlptLWewmWYb4+8xefktjlWCQOMqUiobx71foH3?=
 =?us-ascii?Q?ZZ6OZq8vP9OAQulCSpqO+0SyuFxsdUuhkrvHjVZlZeImN5ygjKoUWOAPkZqN?=
 =?us-ascii?Q?QqHL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb19eab2-e3c1-43ec-309c-08d8ba691694
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:58.7317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzKRv6qjj19bDAiSUc2tOwV/zx2Zad/GnyiXPkpONNTf7maDGRMPod7vf8vYvWjiVTjj2emh1oahkjLVm4SA2Dp92/dJt0OblOPjSNDbC8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.133;
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


