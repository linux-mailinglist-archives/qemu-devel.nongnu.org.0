Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EE34EB4F7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:58:26 +0200 (CEST)
Received: from localhost ([::1]:42220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIv3-0002po-SH
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:58:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfk-0004jg-AR; Tue, 29 Mar 2022 16:42:36 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:46548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfi-0006lA-Jd; Tue, 29 Mar 2022 16:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=DGKBQHxE+T+Kp0JQzEXPpwqXC63+qN1VZAhB/xHE0RI=; 
 t=1648586554;x=1649191954; 
 b=I1Y+4Symwjdd9RnHhJMxm1F9/KNQfdyjDGfuX22MnCOzcdF9ECjDCqS3XW8JITqh3WOu1+tDy5BhbHkleFbKafgCLXnRp0x/INQCC+fAoNcjwTicCFbY3B4mwwDgQ9mq8FozkzA2U8e7t68NPMwNQOLRS1EiCpgdL+olwjFc4jQYwwGRnE/8mVtM/iDuF06VAL8m9DuB1OESK38DeN4qVm096mfOXuI+xI0TKjdMHmKTDN20/YN00NyaoOhKteyMx6i8Y4s+UKYjkce6XBSH4mgCNIIso8Rju6gU1BLtBuYLZswzvRU/afgCdslrCXb9i/Z2hq6ywCouvjQM6SRQWA==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIfM-000374-Hm; Tue, 29 Mar 2022 23:42:12 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 18/45] block: bdrv_refresh_perms(): allow external tran
Date: Tue, 29 Mar 2022 23:40:40 +0300
Message-Id: <20220329204107.411011-19-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9B83DD81DD066BE64A182F30D711DF321C3181FFB50202F95182A05F5380850404C228DA9ACA6FE2739905B1F6B41EA0298E90540BDDCC40647D503446D747ED3749554235B7CD924
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BC08626EA5717D14EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637EDC9855826FBDF5A8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8214DCC0301779941356A095913C02D0A6F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FCAA867293B0326636D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BAA867293B0326636D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE7532CA1512B81981B78CF848AE20165DD8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE360910C30DCD593B16E0066C2D8992A16C4224003CC836476EA7A3FFF5B025636E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637800467F8E86B131AEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A09B9BA260DCCDBF07C61ACD6032E2C49AD4D19919B02C295B1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3472E5ECC12A9739C198866BBE316887974B1D26DCA7569569CE23D317DBA6F05CB7ED501CF1B50C4F1D7E09C32AA3244C26E03283D32024E7F705BB663B19717D3E8609A02908F27183B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGbK9kn3E3t2FA==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEF2D518CE5A43FD9E185804533E97E615AE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Allow passing external Transaction pointer, stop creating extra
Transaction objects.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/block.c b/block.c
index 8c34de936c..f2b70b81cf 100644
--- a/block.c
+++ b/block.c
@@ -2473,14 +2473,23 @@ char *bdrv_perm_names(uint64_t perm)
 }
 
 
-static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
+/* @tran is allowed to be NULL. In this case no rollback is possible */
+static int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran,
+                              Error **errp)
 {
     int ret;
-    Transaction *tran = tran_new();
+    Transaction *local_tran = NULL;
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
 
+    if (!tran) {
+        tran = local_tran = tran_new();
+    }
+
     ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
-    tran_finalize(tran, ret);
+
+    if (local_tran) {
+        tran_finalize(local_tran, ret);
+    }
 
     return ret;
 }
@@ -2494,7 +2503,7 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
 
     bdrv_child_set_perm(c, perm, shared, tran);
 
-    ret = bdrv_refresh_perms(c->bs, &local_err);
+    ret = bdrv_refresh_perms(c->bs, tran, &local_err);
 
     tran_finalize(tran, ret);
 
@@ -2974,7 +2983,7 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(child_bs, errp);
+    ret = bdrv_refresh_perms(child_bs, tran, errp);
 
 out:
     tran_finalize(tran, ret);
@@ -3012,7 +3021,7 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(parent_bs, errp);
+    ret = bdrv_refresh_perms(parent_bs, tran, errp);
     if (ret < 0) {
         goto out;
     }
@@ -3039,7 +3048,7 @@ void bdrv_root_unref_child(BdrvChild *child)
          * we're loosening restrictions. Errors of permission update are not
          * fatal in this case, ignore them.
          */
-        bdrv_refresh_perms(child_bs, NULL);
+        bdrv_refresh_perms(child_bs, NULL, NULL);
 
         /*
          * When the parent requiring a non-default AioContext is removed, the
@@ -3275,7 +3284,7 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs, errp);
+    ret = bdrv_refresh_perms(bs, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -5054,7 +5063,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs_new, errp);
+    ret = bdrv_refresh_perms(bs_new, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -6284,7 +6293,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
      */
     if (bs->open_flags & BDRV_O_INACTIVE) {
         bs->open_flags &= ~BDRV_O_INACTIVE;
-        ret = bdrv_refresh_perms(bs, errp);
+        ret = bdrv_refresh_perms(bs, NULL, errp);
         if (ret < 0) {
             bs->open_flags |= BDRV_O_INACTIVE;
             return ret;
@@ -6409,7 +6418,7 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
      * We only tried to loosen restrictions, so errors are not fatal, ignore
      * them.
      */
-    bdrv_refresh_perms(bs, NULL);
+    bdrv_refresh_perms(bs, NULL, NULL);
 
     /* Recursively inactivate children */
     QLIST_FOREACH(child, &bs->children, next) {
-- 
2.35.1


