Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D66452A04A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 13:21:20 +0200 (CEST)
Received: from localhost ([::1]:60260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqvGR-0003V3-8W
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 07:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqv7o-0005x5-T7; Tue, 17 May 2022 07:12:24 -0400
Received: from smtp60.i.mail.ru ([217.69.128.40]:47660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqv7m-0006cd-EE; Tue, 17 May 2022 07:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=DlgD5rCdKUrMK0tSXEA/KGQdqoOomidNRcT4NrOR5U8=; 
 t=1652785942;x=1653391342; 
 b=L1eWfiZc4Q1MYj+VElOLiaf/cfPO4+q/aIdSW1FBFmHp9EqG2j0C7bIBYO4BKWI7AH/sq9viNjEGUoonfJVrorDikGOWSTPNV6T5F3z0yIrzR9BB43ZWYz51zdTZ5PifCeVO8RqChNRbJ42TvAiodQbmqGO17tl/2CXqC15VYjmHt75wN0eID8w2XjwuoTq2sTXL/K5amSAmIlumuJqXjdfK83NIXlFKIz7csNckWF64DF3Of7wGr3K4tFIinJRjMn0xdLTLK9GoQsHsjAg/xZqcSYfYKDd2yH7wEkioh8YkMTu5kL4XXHNP3sJe0AWByJFme80rgRKoTYf47P54hg==;
Received: by smtp60.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nqv7i-0000gZ-Op; Tue, 17 May 2022 14:12:19 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PATCH v4 2/3] block: improve block_dirty_bitmap_merge(): don't
 allocate extra bitmap
Date: Tue, 17 May 2022 14:12:05 +0300
Message-Id: <20220517111206.23585-3-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517111206.23585-1-v.sementsov-og@mail.ru>
References: <20220517111206.23585-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp60.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9AB830312DE1E2EF89CD709D1FD35DE978688BB130250C40A182A05F53808504070A2259CC62BA75DEBEF13B6F19467BFE766375DD87FEDF234983572610A3C9E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B9FBA884A7C9B8BAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374A24022C550661178638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8028854DC24ABB61E783DAA760A48A6E36F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74A95F4E53E8DCE969FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B8C7ADC89C2F0B2A5A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCEEA0202A80E0F0E63AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637EA30E508AFFB29A2D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F3F410F14AF5AD977156CCFE7AF13BCA4B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CBB0624710993A7B7B75A1415F4E783A9F6E4874E5DAE503F9C2B6934AE262D3EE7EAB7254005DCED1C39E39C5FB3188C4EAF44D9B582CE87C8A4C02DF684249C42578FD4EBC74EEF699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D342B8615F5CFAD9D02B2D916688FE5360A11B09852D9EFA88265A3F8CA452357649745169ED6F751301D7E09C32AA3244CE65009A0080341142CCF783E6D79E5388894E9C85370243EAD832FF50B3043B1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3fsA429394O6iODQeOHpsg==
X-Mailru-Sender: 6C3E74F07C41AE9425C26D04B7325D44E891999DDF3A5D61B567A3E9F70B9B48A40AD7AC6ECEA9DFE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.40;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp60.i.mail.ru
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL=1.31, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

We don't need extra bitmap. All we need is to backup the original
bitmap when we do first merge. So, drop extra temporary bitmap and work
directly with target and backup.

Still to keep old semantics, that on failure target is unchanged and
user don't need to restore, we need a local_backup variable and do
restore ourselves on failure path.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block/monitor/bitmap-qmp-cmds.c | 41 +++++++++++++++++----------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index bd10468596..282363606f 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -261,8 +261,9 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
                                           HBitmap **backup, Error **errp)
 {
     BlockDriverState *bs;
-    BdrvDirtyBitmap *dst, *src, *anon;
+    BdrvDirtyBitmap *dst, *src;
     BlockDirtyBitmapOrStrList *lst;
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
@@ -294,29 +288,36 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
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
+    } else {
+        hbitmap_free(local_backup);
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


