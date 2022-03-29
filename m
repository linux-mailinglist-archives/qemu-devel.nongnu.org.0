Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438ED4EB4D7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:49:25 +0200 (CEST)
Received: from localhost ([::1]:49896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZImK-0004p9-AI
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:49:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIf8-0003rc-4c; Tue, 29 Mar 2022 16:41:59 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:57838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIf2-0006ek-6d; Tue, 29 Mar 2022 16:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Qy+JX1wwfXY9XUBgXQOevxQ+hWwpCYIxDPIVoqHbiM4=; 
 t=1648586512;x=1649191912; 
 b=j9z1KKAcWS/t0CL81TIyN/fvgEqASYmGhSLDHlIVugxX8VGVSZdET36s5cJew8lvDBRSQNhrZC58+Mn5ee0omRYTTrADUIPRAFki0O1UyK740gRGRg7mQ9rSC6gkAEJiPdpsxC3GGsv0P4bz2jrQxKyRdpQAXAKd0LXRXMsGbF3rkGqophULNYApSbs/BlQwZoJmxtW5oa+9kV0PPgLz+XSceURP9e5+EiA1Gsp6/0zxQbPIvsJYeJWfnvKj8vQvFR3ZCcRkS7FSDRZkp2Jbg5VJJMBObgM7qOD2Z8jaXUhjLYyiuE9k3tqdDyXeD4Uu7uDayr3bghEy6XObaX3vRQ==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIey-000374-Fl; Tue, 29 Mar 2022 23:41:48 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 08/45] block/snapshot: stress that we fallback to primary
 child
Date: Tue, 29 Mar 2022 23:40:30 +0300
Message-Id: <20220329204107.411011-9-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB617BAFEA8A05E639C3B4E0E7AAF66DFFB700894C459B0CD1B9C6EA9888AF679A41DEC1F315C35BD472C206EF2094F4D734EEE848E17894A636
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70D278D70F8433719EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063752AC809489EC5B9C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85EC5A3A58751340F50B554A21EB1830F6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE747EEB2A63512ED089FA2833FD35BB23D9E625A9149C048EE0AC5B80A05675ACDCB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BCD50B4D329AF8BB7A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC851EDB9C5A93305ED81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE766D1562891436030EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3D90E0058AC9F27DF35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CF593E0A4FA3DD8F5BB8DFB9331D0C2A924B7649B1E49CC779C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34AAC3D1FDB34D048874522B2B3B0CBEF27B11D7B2F3B6E4F450C9191BC2BEEEE062EFE054AE2611101D7E09C32AA3244C3E6E1D49F7FD4CF66154F169FD49201D250262A5EE9971B083B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGatt83McpHQyg==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE091173E07D0130567D15532364D124EEEE0A58EA02FAC8BFE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Actually what we chose is a primary child. Let's stress it in the code.

We are going to drop indirect pointer logic here in future. Actually
this commit simplifies the future work: we drop use of indirection in
the assertion now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block/snapshot.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index ccacda8bd5..12fa0e3904 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -158,21 +158,14 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
 static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
 {
     BdrvChild **fallback;
-    BdrvChild *child;
+    BdrvChild *child = bdrv_primary_child(bs);
 
-    /*
-     * The only BdrvChild pointers that are safe to modify (and which
-     * we can thus return a reference to) are bs->file and
-     * bs->backing.
-     */
-    fallback = &bs->file;
-    if (!*fallback && bs->drv && bs->drv->is_filter) {
-        fallback = &bs->backing;
-    }
-
-    if (!*fallback) {
+    /* We allow fallback only to primary child */
+    if (!child) {
         return NULL;
     }
+    fallback = (child == bs->file ? &bs->file : &bs->backing);
+    assert(*fallback == child);
 
     /*
      * Check that there are no other children that would need to be
@@ -300,15 +293,12 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         }
 
         /*
-         * fallback_ptr is &bs->file or &bs->backing.  *fallback_ptr
-         * was closed above and set to NULL, but the .bdrv_open() call
-         * has opened it again, because we set the respective option
-         * (with the qdict_put_str() call above).
-         * Assert that .bdrv_open() has attached some child on
-         * *fallback_ptr, and that it has attached the one we wanted
-         * it to (i.e., fallback_bs).
+         * fallback was a primary child. It was closed above and set to NULL,
+         * but the .bdrv_open() call has opened it again, because we set the
+         * respective option (with the qdict_put_str() call above).
+         * Assert that .bdrv_open() has attached some BDS as primary child.
          */
-        assert(*fallback_ptr && fallback_bs == (*fallback_ptr)->bs);
+        assert(bdrv_primary_bs(bs) == fallback_bs);
         bdrv_unref(fallback_bs);
         return ret;
     }
-- 
2.35.1


