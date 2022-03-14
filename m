Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E26A4D91D4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 01:57:31 +0100 (CET)
Received: from localhost ([::1]:47348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTvVC-0007Ju-4O
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 20:57:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nTsJ9-00084M-9o; Mon, 14 Mar 2022 17:32:51 -0400
Received: from smtp17.mail.ru ([94.100.176.154]:43290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nTsJ1-00066B-TQ; Mon, 14 Mar 2022 17:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=YrR5Ot4sGLRv2xF0QG/7/AmQPQxUzrU5g1+O24Gkg9Q=; 
 t=1647293563;x=1647898963; 
 b=x9+8xJmoq0Cqx34j4VSobZWSEL9i2H0UyVbgXiix3BWbbRkEGuB4Vho8R7/49z6K5806kw2NDkhC7852MTmKd1iF1kzBpn15lU5cuhgDFcXeHINSEBvKnJFHfrqRhtpmLoj3vjex7PmDcDqxSHRixAp5WPZ/X+cpzkA7bi+RSlQu2SdJ2MY2QLvzlUeYcCa30MjJEbJCOtWwwBDapBauigcmjx5zALk4jEaKFBcUY26PbX+PFAjsllZtbxe1x5aDaaUt3Vx5qCLrACa5wtT8BXhR0WieRJzDpZzk7M8Qvr2xlJRruMtQtzUM2unEY9FF8Czi7VVI/WzGbc3q6b29ew==;
Received: by smtp17.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nTsIx-0004pZ-5C; Tue, 15 Mar 2022 00:32:39 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, v.sementsov-og@ya.ru,
 v.sementsov-og@mail.ru, eblake@redhat.com, yuriy.vasiliev@virtuozzo.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH v2 1/3] qapi: rename BlockDirtyBitmapMergeSource to
 BlockDirtyBitmapOrStr
Date: Tue, 15 Mar 2022 00:32:24 +0300
Message-Id: <20220314213226.362217-2-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314213226.362217-1-v.sementsov-og@mail.ru>
References: <20220314213226.362217-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp17.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196D8CF2CFB95539D9144AAA932A5836E553182A05F538085040721926008E388587BA331D42A6BEC2650369058CFBBCBE6D0FA8299C1507FF0A
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE71BDE6A359BD5B800EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063700B087299B9BE63E8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8506FCBF05CA46B41D15050C4E3C848816F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE767883B903EA3BAEA9FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC228CA35136EEE5753AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637EC65345A06568A21D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FE81F2A988D4A216F42539A7722CA490CB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CD97CDA27012969F6941BCF6B14395143D1DCBAA48F8E66929C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFCE66FDB1904541E0699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34D7D5115130EFC824A6541A4377AF187EA570A17799A5385261BA0C94CBB67BB83DAB71ACA8A1F8601D7E09C32AA3244CF0F468CA293307CF917600D2CEB4ABA495A9E0DC41E9A4CFC2E5D8217768D59A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqbhzdNy/Mvhp0+ISF9Dhdg==
X-Mailru-Sender: 6C3E74F07C41AE94C4973423E83F3A159D968AF17CAB6850FD1DB80C50194AB895BAA2C22821367FE6462B2528CDCABCB7EB570DD03A1E57B847871DB86736497E5CFB87F3DDD4B722B820C1B2086D890DA7A0AF5A3A8387
X-Mras: Ok
Received-SPF: pass client-ip=94.100.176.154;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp17.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Mar 2022 20:52:36 -0400
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Rename the type to be reused. Old name is "what is it for". To be
natively reused for other needs, let's name it exactly "what is it".

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
---
 block/monitor/bitmap-qmp-cmds.c        | 6 +++---
 include/block/block_int-global-state.h | 2 +-
 qapi/block-core.json                   | 6 +++---
 qemu-img.c                             | 8 ++++----
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 8e35616c2e..2b677c4a2f 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -257,12 +257,12 @@ void qmp_block_dirty_bitmap_disable(const char *node, const char *name,
 }
 
 BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
-                                          BlockDirtyBitmapMergeSourceList *bms,
+                                          BlockDirtyBitmapOrStrList *bms,
                                           HBitmap **backup, Error **errp)
 {
     BlockDriverState *bs;
     BdrvDirtyBitmap *dst, *src, *anon;
-    BlockDirtyBitmapMergeSourceList *lst;
+    BlockDirtyBitmapOrStrList *lst;
 
     GLOBAL_STATE_CODE();
 
@@ -317,7 +317,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
 }
 
 void qmp_block_dirty_bitmap_merge(const char *node, const char *target,
-                                  BlockDirtyBitmapMergeSourceList *bitmaps,
+                                  BlockDirtyBitmapOrStrList *bitmaps,
                                   Error **errp)
 {
     block_dirty_bitmap_merge(node, target, bitmaps, NULL, errp);
diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
index 0f21b0570b..8b2e95f5ff 100644
--- a/include/block/block_int-global-state.h
+++ b/include/block/block_int-global-state.h
@@ -262,7 +262,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_lookup(const char *node,
                                            BlockDriverState **pbs,
                                            Error **errp);
 BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
-                                          BlockDirtyBitmapMergeSourceList *bms,
+                                          BlockDirtyBitmapOrStrList *bms,
                                           HBitmap **backup, Error **errp);
 BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
                                            bool release,
diff --git a/qapi/block-core.json b/qapi/block-core.json
index e89f2dfb5b..c0eacd66db 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2078,7 +2078,7 @@
             '*persistent': 'bool', '*disabled': 'bool' } }
 
 ##
-# @BlockDirtyBitmapMergeSource:
+# @BlockDirtyBitmapOrStr:
 #
 # @local: name of the bitmap, attached to the same node as target bitmap.
 #
@@ -2086,7 +2086,7 @@
 #
 # Since: 4.1
 ##
-{ 'alternate': 'BlockDirtyBitmapMergeSource',
+{ 'alternate': 'BlockDirtyBitmapOrStr',
   'data': { 'local': 'str',
             'external': 'BlockDirtyBitmap' } }
 
@@ -2105,7 +2105,7 @@
 ##
 { 'struct': 'BlockDirtyBitmapMerge',
   'data': { 'node': 'str', 'target': 'str',
-            'bitmaps': ['BlockDirtyBitmapMergeSource'] } }
+            'bitmaps': ['BlockDirtyBitmapOrStr'] } }
 
 ##
 # @block-dirty-bitmap-add:
diff --git a/qemu-img.c b/qemu-img.c
index 5dffb3e616..f853efe6fb 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1618,16 +1618,16 @@ static void do_dirty_bitmap_merge(const char *dst_node, const char *dst_name,
                                   const char *src_node, const char *src_name,
                                   Error **errp)
 {
-    BlockDirtyBitmapMergeSource *merge_src;
-    BlockDirtyBitmapMergeSourceList *list = NULL;
+    BlockDirtyBitmapOrStr *merge_src;
+    BlockDirtyBitmapOrStrList *list = NULL;
 
-    merge_src = g_new0(BlockDirtyBitmapMergeSource, 1);
+    merge_src = g_new0(BlockDirtyBitmapOrStr, 1);
     merge_src->type = QTYPE_QDICT;
     merge_src->u.external.node = g_strdup(src_node);
     merge_src->u.external.name = g_strdup(src_name);
     QAPI_LIST_PREPEND(list, merge_src);
     qmp_block_dirty_bitmap_merge(dst_node, dst_name, list, errp);
-    qapi_free_BlockDirtyBitmapMergeSourceList(list);
+    qapi_free_BlockDirtyBitmapOrStrList(list);
 }
 
 enum ImgConvertBlockStatus {
-- 
2.35.1


