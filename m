Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3DE3A2AB5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:50:14 +0200 (CEST)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJCP-0000ko-HR
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIq0-0003rz-0p; Thu, 10 Jun 2021 07:27:04 -0400
Received: from mail-eopbgr40090.outbound.protection.outlook.com
 ([40.107.4.90]:54851 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpy-0004Ve-66; Thu, 10 Jun 2021 07:27:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOVnBkFTKdb3JiVPdvGnrz8grJm7iLgoh53vb/JrbDBCfoKf0jxFAgdy7p0+rkmq8YRxJCTMvd7aMrUf+v0cfFI2wejUAs7bEpVhEug/CqPW9Dr8M1XbDGgVruM07Ismgo4QKaP8li1OSvlG/BYoGBX1TQU0Tctiiu5ysY8RIgOQICv4Btk+S5LJFe2NOrCx+B8iYZsbWbljZCManraQXnrijgvU/XIg87vL39hHKWieFWvYfm4A9ETHmYC/JowlFECoqC/7vPHE3rgWlxfWx0XTqbAUQI1ZMzPQFb84doxthORIMMwr9SrhVx9XW4aUcRb94ugruF+tfIPLz18M7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CxcOwZdKNFNzBx0wXYgJ5RkseoqLR9SUNfi8XYqszo=;
 b=YYkZIVOBW6lnkcolGhwz6SKAXeQs3zO/T5WFx30rXoGTXdqPg/jwH0DpWB/YK3sYiqMJhumaaUWQFJvVJtwYjjyUsbgfu1v7AHblgRd62OIjzmWYDY76mMNfPcZpX2u/vsl/97vV816copeU08wNgLLGFqDIQyy9aK18tUVZpFezIPpLqG0GocaLkuWNpTkxbmMAyV1/kg6w0NxC2J3ngpWdOWXNGgeNIKwq9fcVu0NZ6HBfIhlR5u6AJ7nzPkoDcFgLJx0ZApYsE7XubZzd+/uuPR6S0qJJHp2qUlZK037B0U/74sdUsLjeztw6fnQTZ7xrPrZnO5bLaVAHahKWLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CxcOwZdKNFNzBx0wXYgJ5RkseoqLR9SUNfi8XYqszo=;
 b=BWAUiVcY5uSSsc/ji/c4p8dm9HOsvTTp+sSXWBr7aYETYEH8IJR6G2iVhO6yF3VWmTWfbYsr8E2EOlTzkbfZXqXj4kz98IvkDtXUAr0K2UzMkEKSMgcvjU141uodz1MkCzy3AgScLvYxQ7WNF0K0WrOs78/92RMAe5SJ1EcOa+Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 16/35] block/copy-before-write: introduce cbw_init()
Date: Thu, 10 Jun 2021 14:25:59 +0300
Message-Id: <20210610112618.127378-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21ac3cf2-98e8-4b7b-8a83-08d92c02a439
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381DBC8A05E107C19952AC6C1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZq/Z+XtvEt5ftVhV4WRarmQPonyynCElGw/FRBOXOStYM7oIy266wyCyaAfIZad1+WfAx2OQuDMUowgG+ixJ2PlwD1MFdr/Ufoy9Qk24Tuq6tc27M88Cza7gM7axhS3M1nPsbzHaIAbSLL6hdq0pkuQaQ3hOAXzlS4KuV2FpuGOM1G9ip+KRxC8I5+3Gg/v/UfiwT2p7ANQoMZYYVDoYtVJ8GeIoJKFpSZhMl+lKfJXU/A1RHGBiKDg+D6slDgMmyBIpohcmYKvaMdrpz8uNQnW9sy36ydNMXpFv32LKXm8Sq5u3lRhk3CllzDSjAUh8vk2BSKmQ1LZTOyAKqX8z62AdCnf0cZHTPmtWXcX+ZDlgGETP0q4hNSlj7AP/rQwFprrjcwGtL5oT172GbYtTT/JRI+pLM06oRYyuLs3/5uxjq0ThSL2MC7pqdE+mmdWNFLYELDwznpSHy51aqHrm1Gjhbhjwayda/7gCCQltgLswCv/B6ZcNR4i2rG4ZuM7rbCaa3zf5FpHGcN+SJ+k3eyVcerE3crjUoGVxUShiNlSNT/NqMbg9+pUqh+ZQjBkHUK8WkCPldFYlKqNQjx5brVbIVJLJugec3qJbL33LG623kSJrc8+Lt0oEgGSFRd8t6rcZsJDSvAZgmr8E4iz+RCnuPaM7Tig8XIy6rimCLyxLPQPGTc3KVMT7APJQ21t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4CAKU+9IOwL8x83+1LJmCZzNlilDs5f7jpG8UqXwDsi2j20xL2wy4ipj6+fD?=
 =?us-ascii?Q?lgfDdtPHb/t0JiYoK53twIO6nY0sPqtmML9uAK8tKQDmZ/IjT6FMFnYBx6D5?=
 =?us-ascii?Q?XKwLJ6eOT5XqktCx9LmHSgtedVSMqWwMrkVsJLsaCR1SQAUYaqElbOAb5Jdp?=
 =?us-ascii?Q?XVl4RUBgnGjv7sTigTJE7FrCcyW0KUotoOrWRsvZsvwVM0eAmugneGrmM8mN?=
 =?us-ascii?Q?y7Te20DncumO5TzREvmxIC6Cmau/5hfDZS9P1tY/0xnZWKX73rM/7JFpBR9h?=
 =?us-ascii?Q?/ugRRVDr2BMkdv/aAaBeqMFE94Xn0E73jqC30I/jxebTu6TDLqQmkGvj7HNw?=
 =?us-ascii?Q?sp+9oyEeJsvdJhAshsFd4OqHjTmALuYR8H/KqrJMY3pajnWxepwI+qyt+1ie?=
 =?us-ascii?Q?5tsg7YkVUVuikR2/S+0LW2UZ+AjAiZQi1ZoLntIFYTWqPaVcfx72lmq12Tf+?=
 =?us-ascii?Q?tbXU2AViYLdZww7KLxJavirWmPrCi0i1MkrzolBdUfnwAIfczDHLkhpWJ5LF?=
 =?us-ascii?Q?pWlVjuTnoqWSk5fBRTX+MFbK90Z//4bsBtcYwZcMHEzAuZ+q3DR9F7yNXqv3?=
 =?us-ascii?Q?ydyAHYoDnxpQ0PXlNeWvmaD6rQxaCBlkltHxllhZdtJI+gcsZblLAwG2qJO7?=
 =?us-ascii?Q?qH8j0G0JmN9Wb37WUVgS49K4Ue15V3roMvRhmh6PwokhjrNipHlBUxxQAsUd?=
 =?us-ascii?Q?Q32HLFlH/iE2qapCtw1v1mfYME4yonqXVEimrHJUfJz71cEOh6Gkr+WWQmEc?=
 =?us-ascii?Q?wgCJ6VtMmx7oO+/WCIyOGIP7/3yjAhUc6YCwX/2sHMOKmlKuGtr9mYt9+bKS?=
 =?us-ascii?Q?Fbijle3cEYMRI7j3jCR9E67j1L0RAvkbl7uJfLa/DtXAAxH64HDr5eUMynsH?=
 =?us-ascii?Q?M57/+gjFALtancx5axmQC0ipq2h6xbwycnc+J6WzElBtumiSDOqupFd49kcC?=
 =?us-ascii?Q?cEdpCBsXUhWUNFR6Pqsg4GdTtVRqCwzr7T7daMn2IX8fYJP1CMz+gW9noyUh?=
 =?us-ascii?Q?s28aatNsMsEORYh+eU9uCrb7gKU19X4lmriH9ySfZYCGza5ztopHjQ9mC+A4?=
 =?us-ascii?Q?9ur1K9lnYAb6/AiMba6Q9cmAXFrOfN/WCfFVy0TOe0p7sjeJ4pwevMZOBvPb?=
 =?us-ascii?Q?0omu0p/dqpl8Wf1HtXb4bm6EWblXdm6jLa3o6mhvveZ+CATAd2WJKSEpOQ1d?=
 =?us-ascii?Q?hKPM6UF26NdPyo+8MHJhxAekm6lApd5eIGqabBafvIiswYUgUHdu6BnSbHpT?=
 =?us-ascii?Q?UZLAyKZnHL+ePLsOs2h4ttrB1tVYx7r0AHalYAoNyTOnexZeBQM6VcBKquD1?=
 =?us-ascii?Q?n+rZLuauojPxORZd5xHPLN7c?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ac3cf2-98e8-4b7b-8a83-08d92c02a439
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:50.8258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Snst3SKvVdnEosVDbkhwj6t9RoBnKBR59Nz1mTVHKZ/AY4h7n2yVK3/IGH5RijzCbCLHUSPBBa+5J7jcegiPujEzqQnhd7D+ueils2/HSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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


