Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C234EB4FD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:03:14 +0200 (CEST)
Received: from localhost ([::1]:50766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIzh-0000Dv-30
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:03:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfq-0004zJ-PG; Tue, 29 Mar 2022 16:42:42 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:52442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfp-0006lc-3g; Tue, 29 Mar 2022 16:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=NlXLLjHhzjJwbL7aaUa+mLTqZL+LtKpdXGa6yrGpV+c=; 
 t=1648586561;x=1649191961; 
 b=ft8ikO0t01FNuMqO7CND/cTANp7U8fAbTvYaZYo8nQhaleISEmyGL46sZbwU45LCdBCVphc9oeSlbNbyItd6/Vn8tVIgKUyJQButbKb+3dZu9RvCzRyk2zj0azrMnuV3v/Fhcoldqb6YxRMZMVZ7Bc1qXt8mMyIo7jKK9q6ooYvX+4bXWq50coYzM8BPgFRB7BIbh3OOj9qNMiSkMyldmPCuSgxpqmBX0+RhDsIJfWFQkyioBYZ+sEd4kyM+tp77evHpNV37oKwbJwWBTmBAT7vCTR4DnmvXpZ9IKf1qlfHGZPBE5PvFG7ijHYrGUV7Qhd1+k0yw6PjBk6N+AkVmtg==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIfS-000374-VZ; Tue, 29 Mar 2022 23:42:19 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 20/45] block: make permission update functions public
Date: Tue, 29 Mar 2022 23:40:42 +0300
Message-Id: <20220329204107.411011-21-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6155011D2176585D5E1D932C628789187E00894C459B0CD1B91550CAA8FB6C860CA874FA32B5CACB33C206EF2094F4D7340D92EFB1A9252998
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DB84ED444C624799EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378010A306A5B6F90A8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D814936A40AA21EB5E4B70431335C9295B6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE709B92020B71E24959FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B3A703B70628EAD7BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCAAC0AB268FC727953AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637A9B5CFA561830F3FD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FBFBFE0634520CEB9262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A09B9BA260DCCDBF04F2CA2673F04E21794E664495FC2BEA7B1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34951738D4D62E58A46E22A4AED60CE4CE7278578975A365B5666ABF92D2E62A866448CFB0F8EDB3C41D7E09C32AA3244CC5D8ECD145285D096689E97CB2CB332263871F383B54D9B383B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGayfvTi5llQmQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEF7546BEA4EADCC61F97F17C85D3F6D89FE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

We'll need them in further commits in blockdev.c for new transaction
block-graph modifying API.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c               | 7 +++----
 include/block/block.h | 4 ++++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 54f1182f10..288141328e 100644
--- a/block.c
+++ b/block.c
@@ -2437,8 +2437,8 @@ static int bdrv_do_refresh_perms(GSList *list, BlockReopenQueue *q,
  * topologically sorted. It's not a problem if some node occurs in the @list
  * several times.
  */
-static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
-                                   Transaction *tran, Error **errp)
+int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
+                            Transaction *tran, Error **errp)
 {
     g_autoptr(GHashTable) found = g_hash_table_new(NULL, NULL);
     g_autoptr(GSList) refresh_list = NULL;
@@ -2496,8 +2496,7 @@ char *bdrv_perm_names(uint64_t perm)
 
 
 /* @tran is allowed to be NULL. In this case no rollback is possible */
-static int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran,
-                              Error **errp)
+int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran, Error **errp)
 {
     int ret;
     Transaction *local_tran = NULL;
diff --git a/include/block/block.h b/include/block/block.h
index 768273b2db..09c254db9b 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -906,4 +906,8 @@ int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
 
 void bdrv_cancel_in_flight(BlockDriverState *bs);
 
+int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
+                            Transaction *tran, Error **errp);
+int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran, Error **errp);
+
 #endif
-- 
2.35.1


