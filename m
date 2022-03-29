Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2764EB50E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:10:14 +0200 (CEST)
Received: from localhost ([::1]:37622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJ6T-00022b-O7
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:10:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfe-0004RU-Vo; Tue, 29 Mar 2022 16:42:31 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:44416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfd-0006kW-Bp; Tue, 29 Mar 2022 16:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=OMY5DRLBvzJjEKkgjCgTqrr5rz5WCAyOraB7C7EExeg=; 
 t=1648586549;x=1649191949; 
 b=cU05IjeSOf5RxWwQiedlWqYaf5rF3iJVOfLgDjgMZjjJPSBAVJnLhE1sMAgd9sgpTI9M2XHz5c4saK3AKVG3oIkjmBBucZpIqCKv8BiwdJ6jw9HiKQCh5aUAUF8jwqajybjAAdk60Ee95W8s+rFRKTrzK/Qz9cFg//XEtAXX5jJOV4eVloG1aXEbiF9kC0nq2ct5adWyAtXNi0t0ohgLIrm7QTLye1lMA5MUVm0mGkjDeu7QNOPi56+Cy3A1kM7idwEALD4Tc4D+lQbn+Sr7E9h6HCYf6TaDqMGKY5KkfpBMTvYefMhcICjmLmrPfBl50KfKSeb5h9LUWfuFqcshkw==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIfG-000374-NM; Tue, 29 Mar 2022 23:42:07 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 16/45] block: drop bdrv_detach_child()
Date: Tue, 29 Mar 2022 23:40:38 +0300
Message-Id: <20220329204107.411011-17-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61AD608933592879E20A8B16C77A2AB91B00894C459B0CD1B9A4992DBB923A8B6E7C85F14FA9C32C68C206EF2094F4D73422AF0AD8BA8DF889
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE742D9BD90C58D50E0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063764BF1E09E94CC6278638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82DEABD9D8660855117B7522ACC2A9B896F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE764603B5C71CE8B8F9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637FBF931FEADDDACF0389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637E36603AA58007A7AD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE78696DB2F622C7C89EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C34429BBE684C7B23335872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A09B9BA260DCCDBF01E8D1CB28FE16B9F277161D896D3470FB1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34F38194B2C99DC1287A761AACE25FF500CC1773FC9CB6D3B18133647CAEEDEAC17338EF1C54A5F58F1D7E09C32AA3244C2DFE0B6AAECCF453A8D27C7C456F0396853296C06374E60283B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGYHCTpOCQ9ERw==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEF129005A09017BB6465C7FEACF31D12F5E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

The only caller is bdrv_root_unref_child(), let's just do the logic
directly in it. It simplifies further convertion of
bdrv_root_unref_child() to transaction action.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c | 45 +++++++++++++++++++--------------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/block.c b/block.c
index d852daf7c8..378841a546 100644
--- a/block.c
+++ b/block.c
@@ -2948,29 +2948,6 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
     return 0;
 }
 
-static void bdrv_detach_child(BdrvChild *child)
-{
-    BlockDriverState *old_bs = child->bs;
-
-    bdrv_replace_child_noperm(child, NULL);
-    bdrv_child_free(child);
-
-    if (old_bs) {
-        /*
-         * Update permissions for old node. We're just taking a parent away, so
-         * we're loosening restrictions. Errors of permission update are not
-         * fatal in this case, ignore them.
-         */
-        bdrv_refresh_perms(old_bs, NULL);
-
-        /*
-         * When the parent requiring a non-default AioContext is removed, the
-         * node moves back to the main AioContext
-         */
-        bdrv_try_set_aio_context(old_bs, qemu_get_aio_context(), NULL);
-    }
-}
-
 /*
  * This function steals the reference to child_bs from the caller.
  * That reference is later dropped by bdrv_root_unref_child().
@@ -3053,10 +3030,26 @@ out:
 /* Callers must ensure that child->frozen is false. */
 void bdrv_root_unref_child(BdrvChild *child)
 {
-    BlockDriverState *child_bs;
+    BlockDriverState *child_bs = child->bs;
+
+    bdrv_replace_child_noperm(child, NULL);
+    bdrv_child_free(child);
+
+    if (child_bs) {
+        /*
+         * Update permissions for old node. We're just taking a parent away, so
+         * we're loosening restrictions. Errors of permission update are not
+         * fatal in this case, ignore them.
+         */
+        bdrv_refresh_perms(child_bs, NULL);
+
+        /*
+         * When the parent requiring a non-default AioContext is removed, the
+         * node moves back to the main AioContext
+         */
+        bdrv_try_set_aio_context(child_bs, qemu_get_aio_context(), NULL);
+    }
 
-    child_bs = child->bs;
-    bdrv_detach_child(child);
     bdrv_unref(child_bs);
 }
 
-- 
2.35.1


