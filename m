Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1618A38CCCB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:57:28 +0200 (CEST)
Received: from localhost ([::1]:42172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9Op-0002a9-0y
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9Ha-0005jZ-41; Fri, 21 May 2021 13:50:01 -0400
Received: from mail-eopbgr80131.outbound.protection.outlook.com
 ([40.107.8.131]:27182 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9HW-000645-V8; Fri, 21 May 2021 13:49:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mco/W3N5YewOIr6qSkv0BcwDJFcatkTRSCR/+aVw1ooaZv4c4y7h4gVHKjTQEswhROhKW3A7JqS8Ow1J1gMm0F6+NoYNXK2dDk1sAYJLmQtJtINinz7ut/ThmwlW49+QOhgk9wD4+Fp9xtYWW/Ps6Yw2pgBRDmW4zFwgB2VLwgAAE3WH+SdE5VpUgGxUVacnqGp3RfBx9plP0UOM/0veyJ3RyangD8njYqq0Uja5/BK90x6OkP4bHBDloogRjXW6MdzKGnEUk9T9zTokUZ6M+K7p31g2ln7DbqNI9BE0xorUoTt8GV+XdKWB94ukpsxTUrDRrfVoFud+zFjd0lIX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W32qR0dU/jtVjexo7afbVzfkcTtP+AtZAWb3b6pwLDg=;
 b=eDlGLsIrT70tjhMqIaholItPSCtn8eud4Z1MeIS5nZ9FUGFdQ2hrviGWLp06AXp39dmm1r2LJHpDOTkEOFZShNDIMGLVZaSxRadzMjuubat32sgD2roPqVZqaaZuw1AntfzScKcl7Bj7pQeE0tEEoZN3fyKW/hR8jUx9dE1/h/khBUB2LIjVtfugqkTI6Ge4VdofcJV5xekwP96Ud/aHuBywT4ZrP/pClQeFNvtzf7uU6gYb+s6hFUkrgR6UVz8FSRBgxzTHzTsKkFy655hCbXUqnLngteDuVmta175gw9c+IuOTNnm1GCD8/1gS6j7/67z/E5JqTFCKQzH0XMfmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W32qR0dU/jtVjexo7afbVzfkcTtP+AtZAWb3b6pwLDg=;
 b=osZTuAA4I2OtBYFeGPsABiD7FSROz+d2SJ8NQqCdcrdY/YGSxMUlOeD8vlQg6YWPsIrxRe6C3LJgAcqXvzOSopLwnWW91Lh3Y8/KFUeH23LrA8Vu1YUORyra/uxuiop3lBJOi+/x0blBFxukm5zMkmZ6ulZHHj1o4740Is/9YQw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 17:49:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 17:49:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 5/6] block/backup: don't insert filter if no writers
Date: Fri, 21 May 2021 20:49:24 +0300
Message-Id: <20210521174925.62781-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210521174925.62781-1-vsementsov@virtuozzo.com>
References: <20210521174925.62781-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1PR09CA0083.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1PR09CA0083.eurprd09.prod.outlook.com (2603:10a6:7:3d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 17:49:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7869ac0-018e-454e-e8d1-08d91c80d143
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5911EB2E5CA588C8346118A5C1299@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CMLwe1Ck3Ti1mjZASZQ1W3hLkHIw4kfYHF7QlJFyYlx5dvHkfNpVkhK/qRyGuKzkcaudSE9NcMNFX1L+b+Ra0Vjs1RFA9uP+z/gvJwWYh6rByXGnTLNMltczyIAoKUvh1tuit/Dz9hq2aKrwD+Xb8Zj9lKRD8PXm7cbBR1z5+pBAmo4aw+8mEa23wDgN5eeTRmPHj3dkovr80fBCxXc1a3u7k3K94rwQXc6nTz3HLP8RZDZxunQoyB+Ow1UM7TUIr1Gw9wTf+QkI/TFhxxaFEmn9T9n0Hl0LwbaAXF+KafCYEXeebnN/74TJEgKJM5KA0F0NYewAd+fROmezTTycQ0sBJb4PohKNwW6wP4LUZJ5KB2WNvHSEofb16QO9aIs5CAgX8OvQxbNoEPwfrGD1rRf3fNBd4mjYLQK9/n50O7Fi5p50CTnIf9lyPVRwExmvAkiQKubsP+OI1kuml7k6/RfZYEvgdQRdZhH9qXM6rOy3HKEhre+tGDac+P4XgtKDeShM/KT0YHBqEvAZGGxB+cS8YkzMZyFaiMfa9RPE3zd2W/Ti7C3ECbRmUHVgnnNwbxz0z/NVj6d2Vvi6QP1loqskDP1F0VFK5R7ZcqsV9GB8jQMRWnD68MB8FTzydoe3Or6HNDRDcQihox799CaarHfV1GSicTfYMLA0Xv5M3Rxqsi6cSOFTsy6b/qLR0scE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39840400004)(6506007)(38100700002)(38350700002)(6916009)(6666004)(86362001)(52116002)(478600001)(36756003)(316002)(2616005)(956004)(4326008)(8676002)(5660300002)(1076003)(26005)(83380400001)(6512007)(8936002)(66476007)(66946007)(66556008)(186003)(2906002)(16526019)(6486002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rDCcPSjUx/pn0pCepSERc1fDF1Py+JruQLFSydxPsRv7LBiqbAglHeTD7yNc?=
 =?us-ascii?Q?gqOm039+OYvwvu/YXepAgY/XJxIOY+xucuIf5+K+kFvU8xXkEGaXEAsDX+oS?=
 =?us-ascii?Q?aeL8GS0ABplgXrhn8Q1QNJNEksr3uN+/KCHUTtbg4rkv+7ni+qkualG5tARX?=
 =?us-ascii?Q?zVD6dIybfZeg58L9CR03zk2Ac59DLCdCZlL6ZepfkQ5Itm197FLN7E1+yqEL?=
 =?us-ascii?Q?sqPmiKst+F5h6aok+zs5xOo7DKVlN4h7zNO+3eLdwtRqZSLg6rjVrm9ShMkt?=
 =?us-ascii?Q?AfizyMIiRkoSxNs9IvGhz5xI8E7gj8OOo24FLwMd7YA38ZuSG+h0FEK+wcJU?=
 =?us-ascii?Q?esKk89N89S6uXwUeTCAIQ4KQQvOPWHd+rSF7vQKhsVOTc/sLNhiEMw9J6AsE?=
 =?us-ascii?Q?KdL5C3fnvAjfdGfUqIVD43sAT0jlrOVq+r9BtbQRZ7oxUMHB0lba7QlOH9pH?=
 =?us-ascii?Q?PMVQKkJ4mUjh2UZuxwEQCkr4nXbopajByQhCTKmviApQu/K7ELyRO4vvPkKI?=
 =?us-ascii?Q?qUICjtN+djGnd1dR1uUUj2FDjEM6oT7rsnvqLugmFwDB2nrBhdWtGGuyMneE?=
 =?us-ascii?Q?hWLWs5KTwzqbh2t1tVpojrn2Tx3ltPRfZxy3EMCCOo099XCr1RqEkLmj8MQh?=
 =?us-ascii?Q?juIcbpOFp+79rsIlhlTu9gUylfC8uT2L60Kx2vG83RTc9mELOZkoLaWNO6Gi?=
 =?us-ascii?Q?rTxTLCPDXxYlWfoz9LNAaXIve3zvzuHcBxiLM9TR0GnRD6yYuTQ6AcJNFy0Q?=
 =?us-ascii?Q?8aI/T4eI+DjulL9i2epzE+o54TY7eMSgCHr5CxLV7de5ulvNpx9nQSV+YbZT?=
 =?us-ascii?Q?Eyv+tVr05/kbgbQBoqJyNOnrh5SQcE5tCFTs5sf6+W65cV8DBGtUc5wftNGd?=
 =?us-ascii?Q?lOsYvjmRkFfi8Pc4LVwhEtoNqXZlPfWZ8Ul8hR+jRau++Ts9Y2k6jazqqn2M?=
 =?us-ascii?Q?8gYnA5e9+Oo+9OTAEWLFqXh26GqaBFQ/87nz72/mDJmjWlAc/BNhkMa4vN85?=
 =?us-ascii?Q?Id4LSZUAW7djnJlvOs/nV1x7imr8AKW38byeeuxXNQ2Kn1lTaGr771h2st7d?=
 =?us-ascii?Q?24uS6s7K3H5hqJvAXgABsqLcVnYLm5g/IZMpwGp5+zkelB0w47imeow/S0Um?=
 =?us-ascii?Q?PKKVnYdMpkn8fzAw9L+p/xpmNey+Ml6772cHnQ4KYXwV4xYUnpyeDZEVbwuc?=
 =?us-ascii?Q?TojZEt01bEw80cdm1yO8IHjP+iKWbHb/SPQkvuGNr/n6H1kL3sqthNgjimuM?=
 =?us-ascii?Q?kpkuS5mEnO3XfRx0/Qc0c44zUDSbmoED0/F0g1f8BRhM3RVLzKNH5JLQfv2O?=
 =?us-ascii?Q?i2usESTn85ocZRqIaRH8v1GJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7869ac0-018e-454e-e8d1-08d91c80d143
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 17:49:44.3419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ht8/BuzdvU2qJp25D8iKBk1Z6qT3TXMwN7x7RFnOR62TGdhCws0BVmvwO7DzUOJHxVoWYZeHLM9nqw0rh49+UaB5QUyRK3xn7bFSmcvTO0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.8.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

If source is immutable and there no writers on it, we don't need to
insert a filter, so let's detect it and use simple blk's for
block-copy.

Note, that it's possible, that user will try to add writers on source
during backup. It will fail, as our source blk doesn't share write.

In future we can add a tri-state source-mode parameter for backup job
with the following values:

 immutable: got without filter. blockdev-backup command fails if there
            are writers on source. Adding writers during backup will
            fail.
 filtered: insert filter unconditionally. Writers are supported on
           start. User may add new writers above copy-before-write
           filter during backup [current behavior]
 auto: go "immutable" if there no writers on start, go "filtered"
       otherwise

And "auto" would be a default behavior. For now, let's just change a
default behavior to not create extra filter when it's not necessary.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c | 55 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 5 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 14652ac98a..e856e4ad73 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -34,6 +34,8 @@ typedef struct BackupBlockJob {
     BlockDriverState *cbw;
     BlockDriverState *source_bs;
     BlockDriverState *target_bs;
+    BlockBackend *source_blk;
+    BlockBackend *target_blk;
 
     BdrvDirtyBitmap *sync_bitmap;
 
@@ -102,7 +104,17 @@ static void backup_clean(Job *job)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
     block_job_remove_all_bdrv(&s->common);
-    bdrv_cbw_drop(s->cbw);
+    if (s->cbw) {
+        assert(!s->source_blk && !s->target_blk);
+        bdrv_cbw_drop(s->cbw);
+    } else {
+        block_copy_state_free(s->bcs);
+        s->bcs = NULL;
+        blk_unref(s->source_blk);
+        s->source_blk = NULL;
+        blk_unref(s->target_blk);
+        s->target_blk = NULL;
+    }
 }
 
 void backup_do_checkpoint(BlockJob *job, Error **errp)
@@ -368,6 +380,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     int64_t cluster_size;
     BlockDriverState *cbw = NULL;
     BlockCopyState *bcs = NULL;
+    BlockBackend *source_blk = NULL, *target_blk = NULL;
 
     assert(bs);
     assert(target);
@@ -450,9 +463,37 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cbw = bdrv_cbw_append(bs, target, filter_node_name, compress, &bcs, errp);
-    if (!cbw) {
-        goto error;
+    source_blk = blk_new_with_bs(bs, BLK_PERM_CONSISTENT_READ,
+                                    BLK_PERM_WRITE_UNCHANGED |
+                                    BLK_PERM_CONSISTENT_READ, NULL);
+    if (source_blk) {
+        BdrvDirtyBitmap *copy_bitmap;
+
+        target_blk  = blk_new_with_bs(target, BLK_PERM_WRITE,
+                                      BLK_PERM_CONSISTENT_READ, errp);
+        if (!target_blk) {
+            goto error;
+        }
+
+        bcs = block_copy_state_new(blk_root(source_blk), blk_root(target_blk),
+                                   false, compress, errp);
+        if (!bcs) {
+            goto error;
+        }
+
+        /*
+         * initalize bitmap in a way copy-before-write filter do it, to have
+         * same code path later.
+         */
+        copy_bitmap = block_copy_dirty_bitmap(bcs);
+        bdrv_set_dirty_bitmap(copy_bitmap, 0,
+                              bdrv_dirty_bitmap_size(copy_bitmap));
+    } else {
+        cbw = bdrv_cbw_append(bs, target, filter_node_name, compress, &bcs,
+                              errp);
+        if (!cbw) {
+            goto error;
+        }
     }
 
     cluster_size = block_copy_cluster_size(bcs);
@@ -464,7 +505,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     }
 
     /* job->len is fixed, so we can't allow resize */
-    job = block_job_create(job_id, &backup_job_driver, txn, cbw,
+    job = block_job_create(job_id, &backup_job_driver, txn, cbw ?: bs,
                            0, BLK_PERM_ALL,
                            speed, creation_flags, cb, opaque, errp);
     if (!job) {
@@ -474,6 +515,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->cbw = cbw;
     job->source_bs = bs;
     job->target_bs = target;
+    job->source_blk = source_blk;
+    job->target_blk = target_blk;
     job->on_source_error = on_source_error;
     job->on_target_error = on_target_error;
     job->sync_mode = sync_mode;
@@ -500,6 +543,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     if (cbw) {
         bdrv_cbw_drop(cbw);
     }
+    blk_unref(source_blk);
+    blk_unref(target_blk);
 
     return NULL;
 }
-- 
2.29.2


