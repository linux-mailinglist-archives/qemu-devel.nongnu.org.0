Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C8250547B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 15:06:45 +0200 (CEST)
Received: from localhost ([::1]:35680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngR5Y-0003e4-GQ
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 09:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <natalia.kuzmina@openvz.org>)
 id 1ngPCY-0007MU-4m
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 07:05:50 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:45008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <natalia.kuzmina@openvz.org>)
 id 1ngPCW-0005K1-FF
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 07:05:49 -0400
Received: by mail-lf1-x129.google.com with SMTP id w19so23599736lfu.11
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 04:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=btwyOXkmeAqfb3ol9kva0PB9oKAgCBN5T65eeafyCTI=;
 b=MWqXZPG70Q1jtx/N58yVldmXZgOQYoZbk1xlOqGIfEal9OdEeOQviVXz62GGSx0jdc
 EJb3OJZbF7uTsm1/O8mr/HWGJet6BQ0JJtOwBle6DkZ1DXmGj+uUlDncohsQYg9bGy0e
 GAncasS3/SouDGvUhFQzc/sVsRmXSc3EGj2Dy/+y0BH3fsXpnbMiyUD0TWip5olfhJJU
 MAs34a1NFAdKNJPryiwpaxb80yzdRWdWB5LpbPuyS64fASIb9J080VNtjOEuygo0+xUf
 xeGE3IuxE/QOZUUHwkXm62vxzKVJlAhwmaOF1l+7498rBJBxuurwUi315mDZvz3O4lgG
 EkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=btwyOXkmeAqfb3ol9kva0PB9oKAgCBN5T65eeafyCTI=;
 b=FCLYYw04+xZuP0tTQY32AhcQ7zl1fa8J7lv3H0A3djXigg0HnxS7nSpM7sCSp6PeeJ
 BB5aysTQuwekRAQP4Njn9iphqbowtNTJd47AaPPn800v6CeaiUp4b+zGZHOgGB/NnJ6H
 ftamosS7fErUDl5EgJReH2iWEuX/Vyho/T+xPNaE9IkZ1RmQGlp9/XR5adlH5xM1i2H8
 i5yq4vgvFhzIvai844tkuusOIuWdpCzRgYeANaxdI//GcWbz4k0j/ipQbrEySsWaKZ2/
 gymBXaD1B1sqfnqfs0a7LWiRji4ZxLpkMysUc52Z6F0Ju1jiXPDpkfk9OaYrxzO6Oauz
 6CEg==
X-Gm-Message-State: AOAM533CVgwe4v0wCtaYpTLDq0ECC1h9a4zm6EX7SV+vbYEX80ax9Qle
 FsFf8nvgyc/LuvZjZny/6DXrTMcxll7r
X-Google-Smtp-Source: ABdhPJxLl2avtGBBZtbmfrmaXYu6g5g6UvJ4906g8pVukQp5AsceBBqZsYYyUZhN82tmPKE2+pa/kg==
X-Received: by 2002:ac2:5e21:0:b0:46b:b663:5539 with SMTP id
 o1-20020ac25e21000000b0046bb6635539mr7614999lfg.119.1650279944998; 
 Mon, 18 Apr 2022 04:05:44 -0700 (PDT)
Received: from localhost.localdomain ([93.175.7.89])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a194315000000b00471083815c8sm580041lfa.168.2022.04.18.04.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 04:05:44 -0700 (PDT)
From: Natalia Kuzmina <natalia.kuzmina@openvz.org>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH 1/3] qemu-img check: fixing duplicated clusters for parallels
 format
Date: Mon, 18 Apr 2022 14:04:28 +0300
Message-Id: <20220418110430.319911-2-natalia.kuzmina@openvz.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418110430.319911-1-natalia.kuzmina@openvz.org>
References: <20220418110430.319911-1-natalia.kuzmina@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=natalia.kuzmina@openvz.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Apr 2022 09:01:08 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru,
 Natalia Kuzmina <natalia.kuzmina@openvz.org>, hreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let qemu-img check fix corruption in the image file: two
guest memory areas refer to the same host memory area
(duplicated offsets in BAT).

Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
---
 block/parallels.c | 66 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 6ebad2a2bb..6a73933d45 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -418,9 +418,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off, high_off;
+    int64_t size, prev_off, high_off, idx_host, sector_num;
     int ret;
     uint32_t i;
+    int64_t *buf;
+    int *reversed_bat;
     bool flush_bat = false;
 
     size = bdrv_getlength(bs->file->bs);
@@ -442,8 +444,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
 
     res->bfi.total_clusters = s->bat_size;
+    res->bfi.allocated_clusters = 0;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
+    reversed_bat = g_malloc(s->bat_size * sizeof(int));
+    for (i = 0; i < s->bat_size; i++) {
+        reversed_bat[i] = -1;
+    }
+
     high_off = 0;
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
@@ -453,6 +461,59 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             continue;
         }
 
+        /* checking bat entry uniqueness */
+        idx_host = (off - ((s->header->data_off) << BDRV_SECTOR_BITS))
+            / (s->cluster_size);
+        if (reversed_bat[idx_host] != -1) { /* duplicated cluster */
+            fprintf(stderr, "%s cluster %u is duplicated (with cluster %u)\n",
+                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR",
+                    i, reversed_bat[idx_host]);
+            res->corruptions++;
+            res->bfi.allocated_clusters--; /* not to count this cluster twice */
+            if (fix & BDRV_FIX_ERRORS) {
+                /* copy data to new cluster */
+                sector_num = bat2sect(s, reversed_bat[idx_host]);
+                buf = g_malloc(s->cluster_size);
+                ret = bdrv_pread(bs->file, sector_num << BDRV_SECTOR_BITS,
+                                 buf, s->cluster_size);
+                if (ret < 0) {
+                    res->check_errors++;
+                    g_free(buf);
+                    goto out;
+                }
+
+                ret = bdrv_pwrite(bs->file, s->data_end << BDRV_SECTOR_BITS,
+                                  buf, s->cluster_size);
+                if (ret < 0) {
+                    res->check_errors++;
+                    g_free(buf);
+                    goto out;
+                }
+
+                s->bat_bitmap[i] = cpu_to_le32(s->data_end / s->off_multiplier);
+                s->data_end += s->tracks;
+                bitmap_set(s->bat_dirty_bmap,
+                           bat_entry_off(i) / s->bat_dirty_block, 1);
+                g_free(buf);
+
+                res->corruptions_fixed++;
+                flush_bat = true;
+
+                /* these values are invalid after repairing */
+                off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+                idx_host = (off - ((s->header->data_off) << BDRV_SECTOR_BITS))
+                    / (s->cluster_size);
+                size = bdrv_getlength(bs->file->bs);
+                if (size < 0) {
+                    res->check_errors++;
+                    ret = size;
+                    goto out;
+                }
+            }
+        }
+
+        reversed_bat[idx_host] = i;
+
         /* cluster outside the image */
         if (off > size) {
             fprintf(stderr, "%s cluster %u is outside image\n",
@@ -472,7 +533,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             high_off = off;
         }
 
-        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
+        if (prev_off != 0 && (off - prev_off) % s->cluster_size != 0) {
             res->bfi.fragmented_clusters++;
         }
         prev_off = off;
@@ -514,6 +575,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
 
 out:
+    g_free(reversed_bat);
     qemu_co_mutex_unlock(&s->lock);
     return ret;
 }
-- 
2.25.1


