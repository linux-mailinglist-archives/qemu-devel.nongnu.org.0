Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 377A14EEB11
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 12:13:06 +0200 (CEST)
Received: from localhost ([::1]:53040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naEHB-0006Ct-8S
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 06:13:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naECf-0003aD-1c
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:08:25 -0400
Received: from [2a00:1450:4864:20::22c] (port=41944
 helo=mail-lj1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naECc-0006FJ-Gg
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:08:24 -0400
Received: by mail-lj1-x22c.google.com with SMTP id 17so3218097ljw.8
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 03:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JCM+e/erm3McXLWinJjX2dOQQh5g/u6Lzw6OUZI54tA=;
 b=oPJs0XiLRMJBubrnhLfwxqlzpn9V199F7ZbBxij97qWd1uB00PBiC8E5/ZYVzvcwWF
 4w2mJRuZM+U8YAqlGNVgMZl5MH36K/EUPVFuRFQeAmf9j/YRmUFARRpaR8KrvFkcc89x
 ZGznn9bkcr6yn66FItjbm+OjAgh49H65dubbvEMXj2RJPfJydTdI9gMmrVacnHVzNOgK
 ByEg6AJ48o0NmLmRNruC6hZwqM+w+F6bDCL4fQxu8+PueN9BGTZ9kLCaB1Rae8pZb7Y8
 TWgSDM2oDBP0UFybCqXzlBbWJZ4MjO9w33oYNFIropDDZWFEhIxpc6YFmyDRGajmTuTI
 /ixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JCM+e/erm3McXLWinJjX2dOQQh5g/u6Lzw6OUZI54tA=;
 b=rTJ3YBFywEdpCsOiKLpDpmZ9CBI2qiHF+PYgXjnmDk1iiVCxMq6PvDzS87WCrxP0pc
 Kryn5M/S/9sLHTq0jbQOtIt+S59tZ4emXVsi4wSDzQZIo2jTEPipBdpIOdoZ2xvdSHvd
 z2b4D9OBUFuR3gEZivyKocCWyKMCovSENOEUidntBXFhdt1OL7OjX8D578tF8jH/AHKp
 4fxm7OruRq7RrjLMv+BNSDZquHk+SJ84Or4cC4WpOpgVncCYB0XlwuNECd499KxWlyPD
 WIVmBf6qHvkjhs8ItELpYCiTVWJFl1itGmLOPRQXfRWIt5MBIYE5D1kkZhMLV8ZpQKwE
 +avQ==
X-Gm-Message-State: AOAM532M/oozBpJMs8+nXoer0beSFOrTAk/Vs6vJb08bwUIAWANpxDiH
 0ToGp0WDk0Kd6e0MqS6dUyPZpg==
X-Google-Smtp-Source: ABdhPJxAFbZjtCjMOKYlcHYSUbvnsmzQGTulsZ+dP/AA1A5eb8DFlj+/MCoIeF5+Nq8xtR1qf+iiwQ==
X-Received: by 2002:a05:651c:2103:b0:249:7e8c:d5fc with SMTP id
 a3-20020a05651c210300b002497e8cd5fcmr12593790ljq.33.1648807700763; 
 Fri, 01 Apr 2022 03:08:20 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 a3-20020a195f43000000b0044a997dea6bsm197508lfj.288.2022.04.01.03.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 03:08:20 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v3 2/3] block: improve block_dirty_bitmap_merge(): don't
 allocate extra bitmap
Date: Fri,  1 Apr 2022 13:08:03 +0300
Message-Id: <20220401100804.315728-3-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401100804.315728-1-vsementsov@openvz.org>
References: <20220401100804.315728-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22c.google.com
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, nikita.lapshin@virtuozzo.com,
 eblake@redhat.com, qemu-devel@nongnu.org, hreitz@redhat.com,
 vsementsov@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need extra bitmap. All we need is to backup the original
bitmap when we do first merge. So, drop extra temporary bitmap and work
directly with target and backup.

Still to keep old semantics, that on failure target is unchanged and
user don't need to restore, we need a local_backup variable and do
restore ourselves on failure path.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/monitor/bitmap-qmp-cmds.c | 39 ++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 4db704c015..07d0da323b 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -261,8 +261,9 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
                                           HBitmap **backup, Error **errp)
 {
     BlockDriverState *bs;
-    BdrvDirtyBitmap *dst, *src, *anon;
+    BdrvDirtyBitmap *dst, *src;
     BlockDirtyBitmapMergeSourceList *lst;
+    HBitmap *local_backup = NULL;
 
     GLOBAL_STATE_CODE();
 
@@ -271,12 +272,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
         return NULL;
     }
 
-    anon = bdrv_create_dirty_bitmap(bs, bdrv_dirty_bitmap_granularity(dst),
-                                    NULL, errp);
-    if (!anon) {
-        return NULL;
-    }
-
     for (lst = bms; lst; lst = lst->next) {
         switch (lst->value->type) {
             const char *name, *node;
@@ -285,8 +280,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             src = bdrv_find_dirty_bitmap(bs, name);
             if (!src) {
                 error_setg(errp, "Dirty bitmap '%s' not found", name);
-                dst = NULL;
-                goto out;
+                goto fail;
             }
             break;
         case QTYPE_QDICT:
@@ -294,29 +288,34 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             name = lst->value->u.external.name;
             src = block_dirty_bitmap_lookup(node, name, NULL, errp);
             if (!src) {
-                dst = NULL;
-                goto out;
+                goto fail;
             }
             break;
         default:
             abort();
         }
 
-        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
-            dst = NULL;
-            goto out;
+        /* We do backup only for first merge operation */
+        if (!bdrv_merge_dirty_bitmap(dst, src,
+                                     local_backup ? NULL : &local_backup,
+                                     errp))
+        {
+            goto fail;
         }
     }
 
-    /* Merge into dst; dst is unchanged on failure. */
-    if (!bdrv_merge_dirty_bitmap(dst, anon, backup, errp)) {
-        dst = NULL;
-        goto out;
+    if (backup) {
+        *backup = local_backup;
     }
 
- out:
-    bdrv_release_dirty_bitmap(anon);
     return dst;
+
+fail:
+    if (local_backup) {
+        bdrv_restore_dirty_bitmap(dst, local_backup);
+    }
+
+    return NULL;
 }
 
 void qmp_block_dirty_bitmap_merge(const char *node, const char *target,
-- 
2.35.1


