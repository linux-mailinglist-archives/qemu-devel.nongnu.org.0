Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C71E4EB4F8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:58:46 +0200 (CEST)
Received: from localhost ([::1]:43126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIvN-0003Qj-Iv
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:58:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfb-0004Kz-U1; Tue, 29 Mar 2022 16:42:27 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:41448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfa-0006kI-7l; Tue, 29 Mar 2022 16:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=RISgcP8vKcw/GZL/xyUYp3/SvV4I5pK+wbvWN3YrsJw=; 
 t=1648586546;x=1649191946; 
 b=Dk/n5pvY4vrxWydqUbKPnRexPEo1Pmc9xpiw4PDfS4PkheZ470S6wnhUqohPNiFmLLJSvSDq/SybmTDPKSpNul1pxD0DVpFM3d1NY4cIbDtcdryAJViu5qseIzN2NK16esVd7C0Z+YcXZYqV6XGSiTh0jHR9NCFefAS4lv/QirXLO3wvBr8jlHcLO/aYTgSRw61Flf86LRgCPrPIVK8z1zAIPs6t+ciLwvsnJ3MRLujEY+W0AeBX8UJuzLXLz3f7M8zuo5eVEI5n9orn3yqm92bZnbsfOcGciVQ2DMla0rPpIh7KaU7ggT6ejCJSXZVdQ81/VuxyHyrL0pKmdTENfA==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIfE-000374-5k; Tue, 29 Mar 2022 23:42:04 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 15/45] block: refactor bdrv_remove_file_or_backing_child to
 bdrv_remove_child
Date: Tue, 29 Mar 2022 23:40:37 +0300
Message-Id: <20220329204107.411011-16-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB619F76FA1B2E2E286FAC27582EB57AF1A700894C459B0CD1B9E85F5E90650916867E9778717B2606C6C206EF2094F4D734F70E9905CEA40A81
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7370F4F695FFFC24BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063795DC1BB912715AE68638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D866F0EFFA814EE8869032A80A5CB1213B6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE73D04F0695778128A9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B3733B5EC72352B9FA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCAAC0AB268FC727953AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006379B06BA6FE78CAE96D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FDD9D78FC36703085262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-B7AD71C0: BCAA75B3C340DBBEEF3A853C90EA8D50F01536074D6990B7EE9D5CB6078CC77CDFF081DF67414A54EFFFE7C7C1A70394
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A09B9BA260DCCDBF047E50909B929253F22F09A6ADEF3B81CB1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3438212F20E1E78D8EB3CAC8F8FDB675502020F222A3C1EDED949AF40EE1F059F9475F536F7AD6DC6E1D7E09C32AA3244CC18F911FB6D129CD5CF4608A552B4E2E259227199D06760A83B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGZIRZf+CKrBRA==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEF6EC5B023F463385020768630229FC1CDE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Now the function can remove any child, so give it more common name.
Drop assertions and drop bs argument which becomes unused. Function
would be reused in a further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 0fddb57e78..d852daf7c8 100644
--- a/block.c
+++ b/block.c
@@ -89,9 +89,7 @@ static bool bdrv_recurse_has_child(BlockDriverState *bs,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
-static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
-                                              BdrvChild *child,
-                                              Transaction *tran);
+static void bdrv_remove_child(BdrvChild *child, Transaction *tran);
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran);
 
@@ -3236,7 +3234,7 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
 
     if (child) {
         bdrv_unset_inherits_from(parent_bs, child, tran);
-        bdrv_remove_file_or_backing_child(parent_bs, child, tran);
+        bdrv_remove_child(child, tran);
     }
 
     if (!child_bs) {
@@ -4891,25 +4889,21 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
-static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
+static void bdrv_remove_child_commit(void *opaque)
 {
     bdrv_child_free(opaque);
 }
 
-static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
-    .commit = bdrv_remove_filter_or_cow_child_commit,
+static TransactionActionDrv bdrv_remove_child_drv = {
+    .commit = bdrv_remove_child_commit,
 };
 
 /*
  * A function to remove backing or file child of @bs.
  * Function doesn't update permissions, caller is responsible for this.
  */
-static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
-                                              BdrvChild *child,
-                                              Transaction *tran)
+static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
 {
-    assert(child == bs->backing || child == bs->file);
-
     if (!child) {
         return;
     }
@@ -4918,7 +4912,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         bdrv_replace_child_tran(child, NULL, tran);
     }
 
-    tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, child);
+    tran_add(tran, &bdrv_remove_child_drv, child);
 }
 
 /*
@@ -4929,7 +4923,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran)
 {
-    bdrv_remove_file_or_backing_child(bs, bdrv_filter_or_cow_child(bs), tran);
+    bdrv_remove_child(bdrv_filter_or_cow_child(bs), tran);
 }
 
 static int bdrv_replace_node_noperm(BlockDriverState *from,
-- 
2.35.1


