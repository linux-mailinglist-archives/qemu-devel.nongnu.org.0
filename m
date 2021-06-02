Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C631398A4D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:20:35 +0200 (CEST)
Received: from localhost ([::1]:34714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQnS-0007AJ-Aq
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfD-0000Ve-N4; Wed, 02 Jun 2021 09:12:03 -0400
Received: from mail-eopbgr130102.outbound.protection.outlook.com
 ([40.107.13.102]:43141 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQf8-0003M9-Pm; Wed, 02 Jun 2021 09:12:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eei10ujYNjkBqT3NmivPEH0Q35KPrM9nC2AQCMN5Hvh3y0Cw7mhJSGNDIqjp+mdYERdjzQMb3t5Co7PHWQTMf6QSOayFyjGb8xYjwWpLa7z1HJLEoEwvSR5u6iDpH1i5SCLMIihDVuE0/yRQtZHzx058uklnPbKWrg2ouzlQVuGsnDykhba9xpBfxbyzrwq/Bu9C1+eTA9m5aYk/9xLyhbCX25CYTGJYH9qBNmTKjXX/75AYBUN1uu69pZCKPKsWZXWSHpJ6aSuxj6+AB/aKlWLPomP6PWQBOoevvey4SAyeihbfQxOlXLdPnQ0atJlSVVUDuIBa/J4P60riSrCiRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZ8w5qdaPUsW8UWJ6qFAmiuctXcyXUw7XJ0bYfnYHg=;
 b=gFI6HKX7yOwARlgf1NaBUpTXheAkyTQk4+HesNyhYfJtf/nKRn/Tg3UrdpsS4M4RtifMc3DbDYxL6qj7Ra0+6y3qRB8s3b4vRwhefobsrYZFk/9SLYQ5iY/d2GNyojQTtxkzdlhbZTSuKFEIkCWa1YWGRNERgll7rbnvsu8jbIDyaE5SUXHL43VRGer2MBoTcJx5Ap5neB6yUCYmwtiELG/YjwLLr15LwYI1Oc+8fBcSeB6EcMOp8O+oPsl+ivIbvCZcOn56OEuuAvvhjsc1noPRi6W1SMJFjqTF2HOTIaLRDKUCNhBW8ucuq13ZahGgH5Hefk2WIBuyoVwguq7lZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZ8w5qdaPUsW8UWJ6qFAmiuctXcyXUw7XJ0bYfnYHg=;
 b=n46Sneik4l6rZH7ESTIkqkzCZy6VfrdVDDel9W7DI2+NqnTxUnPtxjctu+Q0VAU2l0m0O483DPjxfziFhanjzmLE+dKqjICfLrIBRohl/C9cdYayeXITT9MAhBYt03oq+2STZ3F6Zwh/NTlVmOOrY0xXi8I4KLxlZG3zqbtMtBc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:11:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 14/35] block/copy-before-write: use file child instead of
 backing
Date: Wed,  2 Jun 2021 16:10:47 +0300
Message-Id: <20210602131108.74979-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88beebc6-d97c-410f-cbb4-08d925c7f8f9
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB669345F2B4B408BE72606A82C13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0rHNzr9A9x5Ttp2Hb9yCKXw73T3uUj6Rk/J+jYHr3gzELqMCksC2cQpuPAkzGDjnyCDvGjjrnUPeqp542Nf/0+a9FZx/VJqIJUTsvxBPqn5d3r+L5MIvgO9gH9DitMYP4XraTXTbKw7OU+L/l6U6NbHGturBy7PQlUSFf9irs0Av0C++aFu3O1ZtCiIde0P6Wj3lZKGzL8crm0/B2mn+IneAy4cb8WnTDOzSHYercj1kcQ1Sb2p9rQ0Z4heYURa8xFX2c2IRJr0dHb8a3vWlpEYqRLkofwx5yf4trOW5AL+NCipebJEY75Of3C0lfcJnmo7ceOfXTm5KrYoOL9Mmw6U+2PL7A4fUGIMHk8kTvdRZeaEsPP09DNRaaVoYAW2sVVyqH4iZFYt44l+uw0OlHZq1Z42HhYfIvqh2ri5uk4nK1K6QdWGkC9g3u11TCP5N1CCOeKqjKFIBEsw4f0tIj0Ul3OYhr2fmZiITcKAOWYW9YyI5EbNxZMbUntywL+czGRQhWskrPwlxIg+AFc8LKClsN5TyTuPltJcdKQiHcVHMcNqQmb3KHEqXeFtebqa+YPEIGSCLliVE1tgK04bgU+aDp6SE/f8lpsH1DjWU/IgRo1bDORreNyAy1qVi8dcd0TAe1fmaRrZfbLruaMB6SqPzE0uKrPb6GG7/p5+9Bh7ZGMm5X9EEwEr/JcYosm+b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zrH8frcc+creq2uT71BuDZruW/ijJk4c/+wj8k1+sJHOjLl91fqmnIcm6tnS?=
 =?us-ascii?Q?Fq8r3N93Ml2PiMcf7BqKA9xdNhKLWGU4uIv7MXxTi560j4ZY8XgFLj9xbLkn?=
 =?us-ascii?Q?EBjWC1rIlBmM/a5NTth9FqUntxQrxKX58fZ1STeWa4pHnd1aCAXvc0OC9Lu+?=
 =?us-ascii?Q?zDf6rgr56Oh5sc64XkBiqbN6wICksNodJuC2h1VG2eDJT9OIwdG7TGxribJP?=
 =?us-ascii?Q?Dexe1SWXMbC4OeeZOk04DFa7EALIQO8gBFfvsCJj19aMYwhZyv7AEY2dPfLj?=
 =?us-ascii?Q?KILBkgyOqZQvb6bFrruyLEEHpPGB2GrDy+YryNLC5V/EkVAp3zJHIhl3mXBd?=
 =?us-ascii?Q?8DEhvpMkAyQCGlGOMG+TITik91rU4XrdOQ95J+ggYrtugBAC5QhybtHMp8Qm?=
 =?us-ascii?Q?ueLDLx+FsWnGddbfoarmPNK+ekOdagYfHrOk/3jOzJrkxieTUcBUBshs3gMY?=
 =?us-ascii?Q?6CX1I/nwtTc6r3hoVvd+wXeDm08EeiysJ3fKrGTu+LfePVMWUkhl1d3USRNQ?=
 =?us-ascii?Q?CCniG+hRI+AqTdhH0eyHLdr5pI9wsZQ2BzsaZiEtlMmxts48pUVFbZNJKOu5?=
 =?us-ascii?Q?IiaMOsUo9rIHEmA/vNs/v+YUunRYR8/+iCpBTSelEjtkDPFVlBb7JE1oCH7l?=
 =?us-ascii?Q?Jn8mR7jJEEOLZShhX4aqV2u+S2TLzgRLrUI0SsiWGyDS9x8YQK0sjH9jiIWF?=
 =?us-ascii?Q?eIAZowKsqBhVRhfEjEbIugz7WwE7jMP/nMaCV2z6KvlICnHXauUof0kiMvxC?=
 =?us-ascii?Q?0iAonygZwQdTQ3hPeUTuL38V8nqj2QqWBcnchvFGNKpFyOCygaXLLauYTKPG?=
 =?us-ascii?Q?XauKvlH3AO1Hzq3aRuJI9hiFfefQ9rNOuqp/3VXegPMwZysv+tObUxMhWB8c?=
 =?us-ascii?Q?pFjwK4n0duNN2gTl84GhRhWLc7skDOm3fQdrlPAT68EdOiIHEAz+CVtYlqtU?=
 =?us-ascii?Q?MuFGNnijZeuenYNd+XcENn9LBuHYB8UgXdDK/qc7UMRReq/sY0psf2m1fAbK?=
 =?us-ascii?Q?hrbPg6kz5NQTv6NJZk2sPeeCRttmc++RwrqBrFm+UXSREWyF/NUuRCqfqeZ8?=
 =?us-ascii?Q?nT2UuOVIRv1s9Xk9dqOGBt0pUJFyiTzVYVi9SOCYmyE+zAyy/G83IIFWk5F4?=
 =?us-ascii?Q?vO8vDoiIr5Oz41w4GzQhZ+MwKiSlnLJAitiBSxafRAGLoBRxhi+tdXdp2D+V?=
 =?us-ascii?Q?77oHFimLD6xqSYTi359OOqQ9VW4IWV+xx/A6wFqRVpBtlZdiLS92/e268FBD?=
 =?us-ascii?Q?ZuaG46cvmFnrXLdFGH3+ojpzqe0d5562mnRg3So0Z/kQ13tCO5A0CiqWO82w?=
 =?us-ascii?Q?npVONA8kRRSBNJShUyzxmcoS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88beebc6-d97c-410f-cbb4-08d925c7f8f9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:45.6590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MR1lPeEFUcw1HPOVjQeSFs7Uu/+OL51ic4ebjj/guNIxfxrTfkcv/ucndnQFbQuj1Wv5xU5Z3kV81z0ik2GdV9fTlgaNWxWjVueIeRMgOGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.13.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

We are going to publish copy-before-write filter, and there no public
backing-child-based filter in Qemu. No reason to create a precedent, so
let's refactor copy-before-write filter instead.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 945d9340f4..7a6c15f141 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -43,7 +43,7 @@ static coroutine_fn int cbw_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
-    return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
 static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
@@ -71,7 +71,7 @@ static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pdiscard(bs->backing, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
 static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
@@ -82,7 +82,7 @@ static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwrite_zeroes(bs->backing, offset, bytes, flags);
+    return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
 
 static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
@@ -95,29 +95,22 @@ static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwritev(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
 static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
 {
-    if (!bs->backing) {
+    if (!bs->file) {
         return 0;
     }
 
-    return bdrv_co_flush(bs->backing->bs);
+    return bdrv_co_flush(bs->file->bs);
 }
 
 static void cbw_refresh_filename(BlockDriverState *bs)
 {
-    if (bs->backing == NULL) {
-        /*
-         * we can be here after failed bdrv_attach_child in
-         * bdrv_set_backing_hd
-         */
-        return;
-    }
     pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
-            bs->backing->bs->filename);
+            bs->file->bs->filename);
 }
 
 static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
@@ -186,6 +179,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
                                BDRV_O_RDWR, errp);
     if (!top) {
+        error_prepend(errp, "Cannot open driver: ");
         return NULL;
     }
 
@@ -201,21 +195,32 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
+        error_prepend(errp, "Cannot attach target child: ");
+        bdrv_unref(top);
+        return NULL;
+    }
+
+    bdrv_ref(source);
+    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
+                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                  errp);
+    if (!top->file) {
+        error_prepend(errp, "Cannot attach file child: ");
         bdrv_unref(top);
         return NULL;
     }
 
     bdrv_drained_begin(source);
 
-    ret = bdrv_append(top, source, errp);
+    ret = bdrv_replace_node(source, top, errp);
     if (ret < 0) {
         error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
     appended = true;
 
-    state->bcs = block_copy_state_new(top->backing, state->target,
-                                      false, compress, errp);
+    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
+                                      errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


