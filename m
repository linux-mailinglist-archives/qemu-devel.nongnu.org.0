Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D85C000C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:38:35 +0200 (CEST)
Received: from localhost ([::1]:33724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0ry-00015B-JM
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slf553@126.com>) id 1oav5h-0003Xl-I9
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 04:28:27 -0400
Received: from m15111.mail.126.com ([220.181.15.111]:29547)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slf553@126.com>) id 1oav5b-0006Wk-1p
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 04:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=5kF/bmuqjE142pMlr1
 yOnrYSK7TVnzR7uQ0dqUNk6RA=; b=a4g0oa7HO3wgf9Nvhg/1QYiMbkNsvxGRhj
 qt2o3fMnA/kSAGCXwzbxB7upA8j00jD1Zq36jVpiwCFUTbCPPX29oV2Gd4jUQ4JX
 U4m7CoOuGPZtCBVYezkX8FViM9kiWuA6qppzxpbOg0311YNM5CNfKlaXrEeQLafo
 U5RKX6WGU=
Received: from master.localdomain (unknown [117.160.246.157])
 by smtp1 (Coremail) with SMTP id C8mowAB3eIzrwypjMH8RCA--.64443S2;
 Wed, 21 Sep 2022 15:57:32 +0800 (CST)
From: songlinfeng <slf553@126.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	songlinfeng <slf553@126.com>
Subject: [PATCH] try to find out which cluster allocated in qcow2
Date: Wed, 21 Sep 2022 15:57:30 +0800
Message-Id: <1663747050-122900-1-git-send-email-slf553@126.com>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: C8mowAB3eIzrwypjMH8RCA--.64443S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1UuFW3Zr4UCF1kZr18Xwb_yoW5Jry8pa
 ySkr13Jr4FqFy3WrsIkr1DXa1fGw4kCF1UG39rXr1jvFnxCr4xu34kKFZ0krWkWr17XFs0
 qrs5tFW8uF1xWFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEs2-bUUUUU=
X-Originating-IP: [117.160.246.157]
X-CM-SenderInfo: 5voikkat6rjloofrz/1tbiLQ2DtVpD-lEK+wAAsR
Received-SPF: pass client-ip=220.181.15.111; envelope-from=slf553@126.com;
 helo=m15111.mail.126.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 21 Sep 2022 10:31:51 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

In our project,we want to full backup a disk only allocated area,but qmp block-dity-block-add can create a bitmap with all zero,so we can't find out which cluster is allocated.in qcow2,I think l2_table can help me find out which cluster should be backup.

Signed-off-by: songlinfeng <slf553@126.com>
---
 block/qcow2.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 block/qcow2.h |  1 +
 2 files changed, 50 insertions(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index c6c6692..944cf4f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4194,6 +4194,55 @@ fail:
     return ret;
 }
 
+void qcow2_get_cluster(BlockDriverState *bs, uint64_t size)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int l1_size = s->l1_size;
+    int cluster_size = s->cluster_size;
+    int i;
+    int j;
+    uint64_t *l2_table = (uint64_t *)malloc(cluster_size);
+    int l2_entries = cluster_size / sizeof(uint64_t);
+    int total = (size + cluster_size + 1) / cluster_size;
+    for (i = 0; i < l1_size; i++) {
+        uint64_t l1_entry = s->l1_table[i];
+        uint64_t l2_offset = l1_entry & L1E_OFFSET_MASK;
+        if (l2_offset == 0) {
+            if (l2_entries < total) {
+                char *buf = (char *)malloc(l2_entries * sizeof(char));
+                memset(buf, '0', l2_entries);
+                printf("%s", buf);
+                free(buf);
+                total -= l2_entries;
+            } else {
+                char *buf = (char *)malloc(total * sizeof(char));
+                memset(buf, '0', total);
+                printf("%s", buf);
+                free(buf);
+                total -= total;
+            }
+            continue;
+        }
+        int ret = bdrv_pread(bs->file, l2_offset, l2_table, cluster_size);
+        if (ret < 0) {
+            error_report("can't get l2_table");
+            abort();
+        }
+        for (j = 0; j < l2_entries; j++) {
+            if (total) {
+                if (l2_table[j] == 0) {
+                    printf("0");
+                } else {
+                    printf("1");
+                }
+                total--;
+            }
+        }
+    }
+    free(l2_table);
+    printf("\n");
+}
+
 static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
                                           bool exact, PreallocMode prealloc,
                                           BdrvRequestFlags flags, Error **errp)
diff --git a/block/qcow2.h b/block/qcow2.h
index ba436a8..7079916 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -998,6 +998,7 @@ int qcow2_co_remove_persistent_dirty_bitmap(BlockDriverState *bs,
                                             const char *name,
                                             Error **errp);
 bool qcow2_supports_persistent_dirty_bitmap(BlockDriverState *bs);
+void qcow2_get_cluster(BlockDriverState *bs, uint64_t size);
 uint64_t qcow2_get_persistent_dirty_bitmap_size(BlockDriverState *bs,
                                                 uint32_t cluster_size);
 
-- 
1.8.3.1


