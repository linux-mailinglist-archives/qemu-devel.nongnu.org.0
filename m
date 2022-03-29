Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127D24EB4F9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:00:25 +0200 (CEST)
Received: from localhost ([::1]:47270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIwy-0006EP-1G
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:00:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfW-00046O-Gf; Tue, 29 Mar 2022 16:42:22 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:36610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfT-0006hi-5b; Tue, 29 Mar 2022 16:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=UxLyyU0TAZJeXgpsnoD2ljlFfRUASDH9oXbuGOreApg=; 
 t=1648586539;x=1649191939; 
 b=kmwzYEzlfhyf40hkP2zKleJheDU1jUFK5hlra/PVs+B0TYBub6tgXocSBt40VZKXTdQMAXcRQnj5TyHSleN0/ybKodjVHKrf0li0YAIhx/MzUyea39DeecCxRzGVY64OdLVbkWLF/x8v9KchL9NWX1eOMP9/eTSMrCGW9Cx0JmoSVSNAV4hrHb8ctVUZ07PvEO2e2/vvRbEZ/L8oxd2HD62nryuMQdZB1KLPnuc7wHUEnPjsl4XnegBA04P35NBGpghZUtpqz6S3Tasooj/4d7qqFHxnQWdsRq8N5ieCMRg+4bAo24KMZpS8TdZN+7dSJO+PXG7JojAygfMmR/nBWg==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIf7-000374-1A; Tue, 29 Mar 2022 23:41:57 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 12/45] Revert "block: Pass BdrvChild ** to
 replace_child_noperm"
Date: Tue, 29 Mar 2022 23:40:34 +0300
Message-Id: <20220329204107.411011-13-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61E1FB8704E9CBF83467E8A25B5576996E00894C459B0CD1B962B5080CD5165C92291073B88E1A2AB3C206EF2094F4D7348E62883BDF625A9B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72F22E6DC541F75D9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063715F166F2542EEE4C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89AA02E74BBCBAEAEE30699588E7B4FB26F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78A80DFD3A0D2C7BC9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751F2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B93A51A5089774A2DA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCF4A5F967B28177F93AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F790063736D29C35182C813CD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F3F410F14AF5AD9776D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CF593E0A4FA3DD8F5F0B68E8A8D6B11CDD3CCBA2C664498E19C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3490011A262ADAEDFE5233B8F0AC15A988303FBBF4912C086D918D72442B4B03913783E25859257C791D7E09C32AA3244C34E4041EF1F6BA82731E3EB4B873A72FA90944CA99CF22E383B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGYlpKtNQYFt8Q==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEFC00A89396AD65619116FEE6BBC9A90BFE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.108;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp48.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

That's a preparation to previously reverted
"block: Let replace_child_noperm free children". Drop it too, we don't
need it for a new approach.

This reverts commit be64bbb0149748f3999c49b13976aafb8330ea86.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index b1e1a36fd2..65dfaba83b 100644
--- a/block.c
+++ b/block.c
@@ -87,7 +87,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 static bool bdrv_recurse_has_child(BlockDriverState *bs,
                                    BlockDriverState *child);
 
-static void bdrv_replace_child_noperm(BdrvChild **child,
+static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
 static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
@@ -2272,7 +2272,7 @@ static void bdrv_replace_child_abort(void *opaque)
     BlockDriverState *new_bs = s->child->bs;
 
     /* old_bs reference is transparently moved from @s to @s->child */
-    bdrv_replace_child_noperm(&s->child, s->old_bs);
+    bdrv_replace_child_noperm(s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
 
@@ -2302,7 +2302,7 @@ static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    bdrv_replace_child_noperm(&child, new_bs);
+    bdrv_replace_child_noperm(child, new_bs);
     /* old_bs reference is transparently moved from @child to @s */
 }
 
@@ -2671,10 +2671,9 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
     return permissions[qapi_perm];
 }
 
-static void bdrv_replace_child_noperm(BdrvChild **childp,
+static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs)
 {
-    BdrvChild *child = *childp;
     BlockDriverState *old_bs = child->bs;
     int new_bs_quiesce_counter;
     int drain_saldo;
@@ -2767,7 +2766,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BdrvChild *child = *s->child;
     BlockDriverState *bs = child->bs;
 
-    bdrv_replace_child_noperm(s->child, NULL);
+    bdrv_replace_child_noperm(child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
@@ -2867,7 +2866,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    bdrv_replace_child_noperm(&new_child, child_bs);
+    bdrv_replace_child_noperm(new_child, child_bs);
 
     *child = new_child;
 
@@ -2922,12 +2921,12 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
     return 0;
 }
 
-static void bdrv_detach_child(BdrvChild **childp)
+static void bdrv_detach_child(BdrvChild *child)
 {
-    BlockDriverState *old_bs = (*childp)->bs;
+    BlockDriverState *old_bs = child->bs;
 
-    bdrv_replace_child_noperm(childp, NULL);
-    bdrv_child_free(*childp);
+    bdrv_replace_child_noperm(child, NULL);
+    bdrv_child_free(child);
 
     if (old_bs) {
         /*
@@ -3033,7 +3032,7 @@ void bdrv_root_unref_child(BdrvChild *child)
     BlockDriverState *child_bs;
 
     child_bs = child->bs;
-    bdrv_detach_child(&child);
+    bdrv_detach_child(child);
     bdrv_unref(child_bs);
 }
 
-- 
2.35.1


