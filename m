Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC56D4EE238
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 22:00:59 +0200 (CEST)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na0yZ-0003CF-1y
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 16:00:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1na0uz-00071g-UI
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:57:17 -0400
Received: from [2a00:1450:4864:20::134] (port=45884
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1na0ux-0005W1-OU
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:57:17 -0400
Received: by mail-lf1-x134.google.com with SMTP id p10so1011102lfa.12
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 12:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bxyn54e7K22O4y1024ooFgI4SbWbMEFQPuEcwhV+0lA=;
 b=LPJOvXipOWHwP+VV8+B+N+Nk7lsZgrW05DyocncUvdHGkYbD8JTDYTUc7woLsibyla
 C4drbGER5DHImYEpQiFlUYc6OgAneKSpT0dxSu+5NfKN1PH/oSwaHfqsl3Tj0hQgQ5uW
 CAn8oUz+H2v7KxWfWA7X623179cVzpHnOBWH7Dr51U4vf3pJkd95+gbXuMpeehmPOW+N
 ViBFvgcjNC5ZqSGJ2rndUymMnHbM9tol7ZT9QXuQbQfi/XW5huDmrtwdQxszPU+7xsd2
 5oQ+Y98Msq1cuHAQdEibP22ASXTC1MiROeJeUlumRvGvZPsKx4G4nuDpCCzEy2hoO73O
 6wcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bxyn54e7K22O4y1024ooFgI4SbWbMEFQPuEcwhV+0lA=;
 b=jN65gqFIeMIpgy9J/ZRw/Ty+gVN6KjYQcqf3M1R08eQt80JHwtj7ONTKhahQxo83ga
 w+2lnlAaN5y2jQCNiCVVcMzwSNDK9CVN8fNbkqS165J84eU7FbU7fZVkrqaeG7XXvBiC
 neaRCVMwD0+0rEsB6PxAr+Hd45Jyac/RWHfjoioN04a348DSDOaD/CXWVYu6J6wBWfcH
 mUD66FZ968Ngxd4bfLWjd2DDI+zIU+0nIgsYBFP2ZnR1W+78qEaWXgMZ1wTi3u9yfQOi
 JoUKhmO3W2/lCLdo3hGhK9eavx0q5eBsqXjNkesPJ/ZgvcXj5EaeIasBmMp9dUS3F7Em
 VDGw==
X-Gm-Message-State: AOAM5337nAiI8su6UnXuezEjPcKE6IrDgoYhNegSAuTQRDA0Kmg4mYak
 vqDjIV4oxTf45A0t9W6zEqcmBQ==
X-Google-Smtp-Source: ABdhPJx5EbkpcxnTPjExWhv3NXHS5X/dyE+E5Huyd/lr/haTGc9o2PR3cclsHtEErNd3H5OWEjyPWg==
X-Received: by 2002:a05:6512:1387:b0:44a:3593:7708 with SMTP id
 p7-20020a056512138700b0044a35937708mr11559664lfa.498.1648756633890; 
 Thu, 31 Mar 2022 12:57:13 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 z26-20020ac2419a000000b004484bf6d1e6sm30539lfh.233.2022.03.31.12.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 12:57:13 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH 1/3] block/copy-before-write: create block_copy bitmap in
 filter node
Date: Thu, 31 Mar 2022 22:56:59 +0300
Message-Id: <20220331195701.220690-2-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331195701.220690-1-vsementsov@openvz.org>
References: <20220331195701.220690-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x134.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, hreitz@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently block_copy creates copy_bitmap in source node. But that is in
bad relation with .independent_close=true of copy-before-write filter:
source node may be detached and removed before .bdrv_close() handler
called, which should call block_copy_state_free(), which in turn should
remove copy_bitmap.

That's all not ideal: it would be better if internal bitmap of
block-copy object is not attached to any node. But that is not possible
now.

The simplest solution is just create copy_bitmap in filter node, where
anyway two other bitmaps are created.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/block-copy.c         |   3 +-
 block/copy-before-write.c  |   2 +-
 include/block/block-copy.h |   1 +
 tests/qemu-iotests/257.out | 112 ++++++++++++++++++-------------------
 4 files changed, 60 insertions(+), 58 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index ec46775ea5..9626043480 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -342,6 +342,7 @@ static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
 }
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
+                                     BlockDriverState *copy_bitmap_bs,
                                      const BdrvDirtyBitmap *bitmap,
                                      Error **errp)
 {
@@ -356,7 +357,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
 
-    copy_bitmap = bdrv_create_dirty_bitmap(source->bs, cluster_size, NULL,
+    copy_bitmap = bdrv_create_dirty_bitmap(copy_bitmap_bs, cluster_size, NULL,
                                            errp);
     if (!copy_bitmap) {
         return NULL;
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 90a9c7874a..79cf12380e 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -398,7 +398,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, bs, bitmap, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 68bbd344b2..b03eb5f016 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -25,6 +25,7 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
+                                     BlockDriverState *copy_bitmap_bs,
                                      const BdrvDirtyBitmap *bitmap,
                                      Error **errp);
 
diff --git a/tests/qemu-iotests/257.out b/tests/qemu-iotests/257.out
index aa76131ca9..c33dd7f3a9 100644
--- a/tests/qemu-iotests/257.out
+++ b/tests/qemu-iotests/257.out
@@ -120,16 +120,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
@@ -596,16 +596,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
@@ -865,16 +865,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
@@ -1341,16 +1341,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
@@ -1610,16 +1610,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
@@ -2086,16 +2086,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
@@ -2355,16 +2355,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
@@ -2831,16 +2831,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
@@ -3100,16 +3100,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
@@ -3576,16 +3576,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
@@ -3845,16 +3845,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
@@ -4321,16 +4321,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
@@ -4590,16 +4590,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
@@ -5066,16 +5066,16 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      }
-    ],
-    "drive0": [
+      },
       {
         "busy": false,
         "count": 0,
         "granularity": 65536,
         "persistent": false,
         "recording": false
-      },
+      }
+    ],
+    "drive0": [
       {
         "busy": false,
         "count": 458752,
-- 
2.35.1


