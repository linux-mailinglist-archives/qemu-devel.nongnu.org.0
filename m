Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E2398A4F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:21:16 +0200 (CEST)
Received: from localhost ([::1]:36346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQo7-0008Ey-Dm
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfN-0000uv-T6; Wed, 02 Jun 2021 09:12:13 -0400
Received: from mail-am6eur05on2138.outbound.protection.outlook.com
 ([40.107.22.138]:12054 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfH-0003Pp-EF; Wed, 02 Jun 2021 09:12:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTastlbyHNLzzKJuacVPlYj4fTaUrAYtgN+qUUEVOpkxWyeainug8e1TZjlObUTi9ZkyQic6YqxCZmi0mk2QULyi/qQDWi+GRi4qQnWwj5M2nSglwGs9yKECXemNMKHKkkAjwlqlF7Dv8QXte5dkIrZJHJR3K3Jh8sBHpDzojCr294UJHxrCh2KMyuXdxIDXyoz4ZYti2QL1cWh8QgNN/I365sevwgNHrmkaPV5RRJvfUCWpo5tFYuv9vS/kE8NhQR4KXndqyoLxTYXVXMXlXOR3KTmrIa63p3UXjmXkAH8h/740TkqiXwbMdDuzdoPSj7JPmuXOunku20HcNi2PBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CxcOwZdKNFNzBx0wXYgJ5RkseoqLR9SUNfi8XYqszo=;
 b=iKSr1j7jgSAghIIfk/K6ny8RtTsJkyMj0KZ0yWXUC2fvz3Jnsjaz2jdT3kDkeQ5DRmSzrL49RiSo+Rtf4ihvoSZlDFDS2pW8rtaAlx5ExbUBEH9XEUtd1lL5aBBXsKzIqbll4laK07Xd9LbldgutIQW2ZgNoKTulJW6P7/Q9toUg1fUlQ/GVCP31xI/fHDGD6xUpQddvZxPiDrVh1hAHyEgTPJ3BQ+jSicd5TWduzDB1DxYvg8Iu60vQdF3Rhn2Xay1qcrI3oh4TXWXpOoVANnhlaPUG9YECptjwxDayCTDkj6+EYS5WT6fx2UiGfQD1/15n2s8UJ1yt9cLVp1Tx1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CxcOwZdKNFNzBx0wXYgJ5RkseoqLR9SUNfi8XYqszo=;
 b=EvDoZI6SJdkL2GsevDpIrtByp6eUYMCwzPKFeg4kJR2lE16jR5OsXETIbnoe37Q5U9afZ9HSIqiYqMylQ5gBactwYDMj8M0GUIGPqD6DhTLKAIrk1VEpGxdhsL/koSOE/shZ5L0H4Ot8u/KH13xCoW/QVhIdbOw1k0SSJyLFS/M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:11:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 16/35] block/copy-before-write: introduce cbw_init()
Date: Wed,  2 Jun 2021 16:10:49 +0300
Message-Id: <20210602131108.74979-17-vsementsov@virtuozzo.com>
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
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ace164e-452e-4a44-770f-08d925c7fa9e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6693B43B825BB899A4B3F2EFC13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vpbOBQ6ypDX9jzzidy0B981A8AX6qbllScZIkA6YmM7TL6kCvwqCFwDLKGE+dpmG5zE/t5a2OVv2U6eheslY09VCoJ6pQuRPWL6Hc3ytx5mQcu4F/GUYektYOxrUGVK0z11PndAIRUaPPN9iIOHyfzN9rfKPRSRBCRwmGwbJCO3AQWNqANyoDqRxgegxsaSvnjdQQLdHcGy0omuAqjppMW2Uw850Z/u/hokvBLgHQmzQhRsRwEkNgEbCRyi1yk19ldBBlSHZygyIlemkpxfbU5mKgxxIBoKyzoZ4YqUIKUUAZkIjwuSQ26AwTYuTjJRmJcjJKGj2sMkwTUSMeZhh74BqQqacm23ORFICh9QljFxeJESBn7D9MiLeHnnfDgOZ7wSwPJdg77gKuSBgnt9CUqq+O2svHvZriRz++HzxF2ChJzZsTQ4kkEocTmRqt+fPsETUcNpUYPcijjFOA2sEkMrAeUon3p/D25MFLrIYiNsyqkmXNYEzarTdY3btTp/TzGTY4WD90Os9gA3Iv/yXNPHcs+VOxhbJPgL5M02l+13ov4iJp0AkZEjTaILo9rcPrjkzZPlKGTo2a2UJZH8wPh9KbUxJBOlT3xosQmoEzzXg0MKptrBNGgpFemNef3xjudaxl1tEogUuaN20lJ6UJKYGzx32TFUxOCVJoG1DZVnmGi9H/54tLlVAI4HGyAWb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lcbTVejltDKb+Lm/fklcQLJqhTwBXUjTHrwIw3zI21RFRMSKrXsmj1VZtESI?=
 =?us-ascii?Q?OJyGTT/9dsm8urNd6K0yaYr90cDZXIpzMhUpCstFp8+t6MtAKIRH/kM3mLfM?=
 =?us-ascii?Q?IhJy+ixdVFKvXvg0Va3Ubp6Jd0V93HRXQKI2ibbbP6b4dUlZkZdqEbVQm+ZG?=
 =?us-ascii?Q?epGD7OMcpO20BBFGfXrzwsTbS1cpNVzteAOPseU577oZ39cj67reXhU1LcuP?=
 =?us-ascii?Q?XtTdOt+0OdWQ/ds35A48XDZKMWarJs5sw+Pqfe4OX6/2vrx/MfCKbBJSZ804?=
 =?us-ascii?Q?dkig5blSMjbVBCzuiZn3rEA7UQ55syJUVaMbjFMkMj1BVQ+SAxv1tEyoF4rh?=
 =?us-ascii?Q?dAGcspxYLscpRsKgyzKVRD3EucWJfrkX/NvdBFUbAJhXVWG/JBbABTadXdpw?=
 =?us-ascii?Q?Mz2ZIwLHnfJc9jpOPAv/Og0QHcA9ofinCmHZwmNG5RIOh3eIqPuLYNipPaAb?=
 =?us-ascii?Q?RSvaSEiXPc1dMxmuI4UjTUbBvZzwdzKAXF/bWmIIRn/AAvg7aTfeLc3pOQYa?=
 =?us-ascii?Q?Y8mKAlgac/WCJIeOwB1ZE+bSi7xEV+DIGhIk/l8xhglHKRcbM/9qW2wkdRat?=
 =?us-ascii?Q?o4v/vyUd9fjvOISeHxVa6/KCdnFEDlwqkeSry4doBHEAdu5k0fTzX/vKvAbc?=
 =?us-ascii?Q?qgpYXRjL3T4Lq37vePcpcZmo5WaHDUYvA7W0mhkxFewEYpDhTR+XT/qqcjrO?=
 =?us-ascii?Q?srub/OL2C29dxPGwWuOUND/DL11479rzfv9T5VGikjPzbb9CVTBmZ52PNMuE?=
 =?us-ascii?Q?yosVQodA9YFOMxPIFnz+alzlLsIvn9J++xO63S1iaIG19bWT+tIs82CUhFWd?=
 =?us-ascii?Q?btjV6nIs5Vt0AbgPZP9XgRSHP8ILm7zHUwIvefiJwvGmD7ddCUPE2Wbk3y9L?=
 =?us-ascii?Q?5sv1QPEZXjfw344JT0tshGvcl2rdqotRNu8UWRroAvWuOcJyP3YAXKxxShu2?=
 =?us-ascii?Q?5hTobmAzymfgdgS1rCjzmCBdqtlCsxu9IrSZOkSKUfsFuezXA7FiRUTFjL39?=
 =?us-ascii?Q?9DLoIDmlBLzWF6lgY30K20VLgNrpkKJE2DEnRKyKUjbDK0Yl+4z4mhdSvq4p?=
 =?us-ascii?Q?M1c9xYbSyJXr3XYElI7yj1CR7Z3dP3hUOU07fHAoaADTyigEX/hy7SFve1S+?=
 =?us-ascii?Q?a1yOHfekScYKfBY1oCPT8Spzn9NLg4vJ+v2QYSc76idVSFkiGKJg3D7iBy2t?=
 =?us-ascii?Q?vzHiI2ly8cmLAn0/gjOtMeJv9MPKvVqsngDrHq1/t+rch8jHfXfKC0OMqVB3?=
 =?us-ascii?Q?loeoEYMLf1glBsOlufu7MbJliFoLFAuovqvx3R5v17spR3Di8YdtLfUfbQ/0?=
 =?us-ascii?Q?mJ7EFw6K4TDBSAu/Fa/Cecgg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ace164e-452e-4a44-770f-08d925c7fa9e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:48.4348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRPBGivEXJ/RK6olbfJET2zsja5g86VMKCRsVpxocWLc1iGA/sHhfBwOSfuATwPqQoZSNnqb/EQ2ynGMu9AMNbfVg/5DeQWeai+reFRlWGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.22.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Move part of bdrv_cbw_append() to new function cbw_open(). It's an
intermediate step for adding normal .bdrv_open() handler to the
filter. With this commit no logic is changed, but we have a function
which will be turned into .bdrv_open() handler in future commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 69 +++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 28 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index adbbc64aa9..a4fee645fd 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,6 +144,45 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
+static int cbw_init(BlockDriverState *top, BlockDriverState *source,
+                    BlockDriverState *target, bool compress, Error **errp)
+{
+    BDRVCopyBeforeWriteState *state = top->opaque;
+
+    top->total_sectors = source->total_sectors;
+    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+            (BDRV_REQ_FUA & source->supported_write_flags);
+    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
+             source->supported_zero_flags);
+
+    bdrv_ref(target);
+    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
+                                      BDRV_CHILD_DATA, errp);
+    if (!state->target) {
+        error_prepend(errp, "Cannot attach target child: ");
+        return -EINVAL;
+    }
+
+    bdrv_ref(source);
+    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
+                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                  errp);
+    if (!top->file) {
+        error_prepend(errp, "Cannot attach file child: ");
+        return -EINVAL;
+    }
+
+    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
+                                      errp);
+    if (!state->bcs) {
+        error_prepend(errp, "Cannot create block-copy-state: ");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 BlockDriver bdrv_cbw_filter = {
     .format_name = "copy-before-write",
     .instance_size = sizeof(BDRVCopyBeforeWriteState),
@@ -181,36 +220,10 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
         error_prepend(errp, "Cannot open driver: ");
         return NULL;
     }
-
     state = top->opaque;
-    top->total_sectors = source->total_sectors;
-    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-            (BDRV_REQ_FUA & source->supported_write_flags);
-    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
-            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
-             source->supported_zero_flags);
-
-    bdrv_ref(target);
-    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
-                                      BDRV_CHILD_DATA, errp);
-    if (!state->target) {
-        error_prepend(errp, "Cannot attach target child: ");
-        goto fail;
-    }
 
-    bdrv_ref(source);
-    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
-                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                  errp);
-    if (!top->file) {
-        error_prepend(errp, "Cannot attach file child: ");
-        goto fail;
-    }
-
-    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
-                                      errp);
-    if (!state->bcs) {
-        error_prepend(errp, "Cannot create block-copy-state: ");
+    ret = cbw_init(top, source, target, compress, errp);
+    if (ret < 0) {
         goto fail;
     }
 
-- 
2.29.2


