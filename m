Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337D44EB4E6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:54:54 +0200 (CEST)
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIrc-0004l8-GE
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:54:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfh-0004Yi-2g; Tue, 29 Mar 2022 16:42:33 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:45438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIff-0006km-FR; Tue, 29 Mar 2022 16:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=3IRrDFCyQZokM4YOT+3VhIkSXhq3B2hRUN68MmXockI=; 
 t=1648586551;x=1649191951; 
 b=zYjjrImiibyL81vWX07niRl79X6hb1RB3NhAaA8d8I/RuRqR52BULI5eGzSMH4+1rH7DnEYGj45Msc8XX5o9fTGOZZVqb+hm1mAZ5Zb9DEwYFn3NhspAA8w4NUmFVaaXkEu3tjVw8PxxKeqDVzsg9AIPhCqy5MlhmPEmjNNF+HwnqMLaBXxc9RMo5AKuNVfZq0EIUlllJbvojmpk4KGOuBePPubZVdCOiV3twPWRb6TRlZlhpzFnePT7T5QRdjAgfHeih0VxR9UK1vjpa2wDKpvMypcptNwSZlbleT+sb5jvZNwYHTkod84BgrXKPw000jJ952EcXY/6MvMId3mTaA==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIfJ-000374-Fk; Tue, 29 Mar 2022 23:42:09 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 17/45] block: drop bdrv_remove_filter_or_cow_child
Date: Tue, 29 Mar 2022 23:40:39 +0300
Message-Id: <20220329204107.411011-18-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6155011D2176585D5E1D932C628789187E00894C459B0CD1B9F14EF927B3E035697E04E627B8B42ADAC206EF2094F4D73497B3F93076A4A5D8
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70043D879A87EF1BCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FD85A7F5EB0E97528638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8BC7CD19086A5185379358375786E8A096F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE77E7E81EEA8A9722B8941B15DA834481FA18204E546F3947C5B63D382EEF4D896F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637424B6AA9142E4BBC389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637057A2EA9A5A8FCA9D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7BE66C62EBF8BF55BEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C355B687C78217711535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A09B9BA260DCCDBF0F129E52A3449C220C56765AE9981D812B1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D344888A9AABCDD3225AF4AF4EA9CFBA90FCF425F3552A5832E48BDE6018B59750DA075EA64158F59871D7E09C32AA3244C023A99FF07F76E476154F169FD49201D259227199D06760A83B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGbQ+E/5eOFFvw==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEF03DAB8878BC7321C5478693C93FB3D2FE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Drop this simple wrapper used only in one place. We have too many graph
modifying functions even without it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 378841a546..8c34de936c 100644
--- a/block.c
+++ b/block.c
@@ -90,8 +90,6 @@ static bool bdrv_recurse_has_child(BlockDriverState *bs,
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
 static void bdrv_remove_child(BdrvChild *child, Transaction *tran);
-static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
-                                            Transaction *tran);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
@@ -4908,17 +4906,6 @@ static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
     tran_add(tran, &bdrv_remove_child_drv, child);
 }
 
-/*
- * A function to remove backing-chain child of @bs if exists: cow child for
- * format nodes (always .backing) and filter child for filters (may be .file or
- * .backing)
- */
-static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
-                                            Transaction *tran)
-{
-    bdrv_remove_child(bdrv_filter_or_cow_child(bs), tran);
-}
-
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, Transaction *tran,
@@ -4999,7 +4986,7 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     }
 
     if (detach_subchain) {
-        bdrv_remove_filter_or_cow_child(to_cow_parent, tran);
+        bdrv_remove_child(bdrv_filter_or_cow_child(to_cow_parent), tran);
     }
 
     found = g_hash_table_new(NULL, NULL);
-- 
2.35.1


