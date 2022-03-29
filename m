Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C754EB4F5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:57:38 +0200 (CEST)
Received: from localhost ([::1]:38822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIuH-0000V7-Rl
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:57:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfB-0003tm-9u; Tue, 29 Mar 2022 16:42:02 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:33768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIf7-0006hC-Jb; Tue, 29 Mar 2022 16:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=TU4uacrzz8pOIMBXlCw8rC4ieQGAv6Wl69BsZffrJb0=; 
 t=1648586517;x=1649191917; 
 b=MBXyUtA1w2nlkfCSFuXXrsnKG9ZJ/CjwNcHkhmo35HiaNhmEzbFD6/XihFLcPfMVu0ISFR67RNbQ33VAwYn1U0Bk3EBdjKS02KfVDq8Yb0vG4YFtq9HURIKDcIVd8XKZfsKhlghZxHowBnXWKu6RWV8YjfKFEo6UZw3ek5FpDQM88HNNSto4KIr8+uKxS83ZWs4NXAotD3zTw7czcKMSUzdQzHjV3/yuEBGw5RjCUwukV/+JDD8d98p5h1aswT1TS19nPlSr6t02p/wD2YwBRWhN8YTiD4IDkYB8dQA80gdOo3PFEn3gP/1FiRMAnWvsMgRADGakiIeQYCFo/I6QKA==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIf4-000374-Kq; Tue, 29 Mar 2022 23:41:54 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 11/45] Revert "block: Restructure
 remove_file_or_backing_child()"
Date: Tue, 29 Mar 2022 23:40:33 +0300
Message-Id: <20220329204107.411011-12-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61E1FB8704E9CBF83467E8A25B5576996E00894C459B0CD1B93207DD4D1A2302886A0834F02C96F2B1C206EF2094F4D73415CD2B5BB6EB5A8F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7922E451CE6E839B1EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371005780D56A98C20EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA6F3B3B3C345B4653392152BA345C216FC20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C02CC0D3CB04F14752D2E47CDBA5A96583C09775C1D3CA48CF4C82C86BFC697D19117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7E688A9D963DC14319FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE716AE10134C828A62D32BA5DBAC0009BE395957E7521B51C20BC6067A898B09E4090A508E0FED6299176DF2183F8FC7C0560F6B3575A6996ECD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6A0CD97369C4BDE2E089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A09B9BA260DCCDBF088E2A8A9DBD0A3E89D03720F993F8993B1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C1D376EF32BB0896FE3D6DF5188A3B89C6DCF0CBF19B5574A703F29EE3972D35B7EBA64839020FA31D7E09C32AA3244C024499FF07F76E479E8B5A2E110FB2A8435BF7150578642F83B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGZloTv+x56VsA==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEFDC0A873C2FFED37989AD5BDEE87B968BE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

This reverts commit 562bda8bb41879eeda0bd484dd3d55134579b28e.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index 0ad5e2f09a..b1e1a36fd2 100644
--- a/block.c
+++ b/block.c
@@ -4911,33 +4911,30 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran)
 {
-    BdrvChild **childp;
     BdrvRemoveFilterOrCowChild *s;
 
+    assert(child == bs->backing || child == bs->file);
+
     if (!child) {
         return;
     }
 
-    if (child == bs->backing) {
-        childp = &bs->backing;
-    } else if (child == bs->file) {
-        childp = &bs->file;
-    } else {
-        g_assert_not_reached();
-    }
-
     if (child->bs) {
-        bdrv_replace_child_tran(*childp, NULL, tran);
+        bdrv_replace_child_tran(child, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
     *s = (BdrvRemoveFilterOrCowChild) {
         .child = child,
-        .is_backing = (childp == &bs->backing),
+        .is_backing = (child == bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
 
-    *childp = NULL;
+    if (s->is_backing) {
+        bs->backing = NULL;
+    } else {
+        bs->file = NULL;
+    }
 }
 
 /*
-- 
2.35.1


