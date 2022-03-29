Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA774EB520
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:18:22 +0200 (CEST)
Received: from localhost ([::1]:53400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJEL-0004LL-JG
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:18:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfv-0005AI-5q; Tue, 29 Mar 2022 16:42:47 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:53868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfs-0006lv-ME; Tue, 29 Mar 2022 16:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=j9bny9TVrzuT7jrIS9vLZd+Wv7gFvowVd7TSsxfq6xk=; 
 t=1648586564;x=1649191964; 
 b=0zChAFJ897WjsA6rh64/RvkTobNSPDLQhb4GZS1fv/IluzR0boCQWrrqS7VpmLkdD2S4gVrUVXc18rpIQRAikiIdXPY0360Q01JeW8fq6sbAHoNh7mp6xk/pdc32E7IM3nuvQ0IPRAzFGtnTi9fC6ZV8C30syjU8CjHJ00hurhkUPxxCL1kWRb8+gwWMjwbJ8vab+J2nufyOzjhEMSY5LfgOvETYNj6TdjMPYzWdnJKRX6gj3+eIKacNrrN64a/BAdLyFayBqwlj8jWdBBRcrG+vHT2RRGbbgMihj5AzINYNiI/G4g4abtIJU6VxM0dNAy9CKBzXnaJbUbx9lY69LQ==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIfW-000374-Do; Tue, 29 Mar 2022 23:42:22 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 21/45] block: add bdrv_try_set_aio_context_tran transaction
 action
Date: Tue, 29 Mar 2022 23:40:43 +0300
Message-Id: <20220329204107.411011-22-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6163EE6E06DD4447CEC1754C785D0B844400894C459B0CD1B96C016508686BA582F90863BDC0F754D0C206EF2094F4D7343EAE9E3EF2B3B1F1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE789805A6418246A1AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063706922F90966A37BA8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D850260B74FF48386173C87A9EBD1C9B266F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE79AE9BAF3542BD4619FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B2EE5AD8F952D28FBA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC91287B917FF84C143AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006379B06BA6FE78CAE96D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FBFBFE0634520CEB96D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC446469D8A8717206BBF593E0A4FA3DD8F5D958DB6C8E38DFD884FB39BDD0A253279C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34023CA4E4726A7D6C240D9A65B9F59EE6F72C789B49762A2B214B0565B69125A4C50689ED1EFDD6AC1D7E09C32AA3244CC6FE68F1F9B729EE9893DD767CC4B2B1C3B3ADDA61883BB583B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGbx8OWBSbzTLw==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEF20E9A728EBD8E4D8776BDB1EBAA5AB64E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

To be used in further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/block.c b/block.c
index 288141328e..22c5010c4d 100644
--- a/block.c
+++ b/block.c
@@ -2810,6 +2810,54 @@ static void bdrv_child_free(BdrvChild *child)
     g_free(child);
 }
 
+typedef struct BdrvTrySetAioContextState {
+    BlockDriverState *bs;
+    AioContext *old_ctx;
+} BdrvTrySetAioContextState;
+
+static void bdrv_try_set_aio_context_abort(void *opaque)
+{
+    BdrvTrySetAioContextState *s = opaque;
+
+    if (bdrv_get_aio_context(s->bs) != s->old_ctx) {
+        bdrv_try_set_aio_context(s->bs, s->old_ctx, &error_abort);
+    }
+}
+
+static TransactionActionDrv bdrv_try_set_aio_context_drv = {
+    .abort = bdrv_try_set_aio_context_abort,
+    .clean = g_free,
+};
+
+__attribute__((unused))
+static int bdrv_try_set_aio_context_tran(BlockDriverState *bs,
+                                         AioContext *new_ctx,
+                                         Transaction *tran,
+                                         Error **errp)
+{
+    AioContext *old_ctx = bdrv_get_aio_context(bs);
+    BdrvTrySetAioContextState *s;
+    int ret;
+
+    if (old_ctx == new_ctx) {
+        return 0;
+    }
+
+    ret = bdrv_try_set_aio_context(bs, new_ctx, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    s = g_new(BdrvTrySetAioContextState, 1);
+    *s = (BdrvTrySetAioContextState) {
+        .bs = bs,
+        .old_ctx = old_ctx,
+    };
+    tran_add(tran, &bdrv_try_set_aio_context_drv, s);
+
+    return 0;
+}
+
 typedef struct BdrvAttachChildCommonState {
     BdrvChild *child;
     AioContext *old_parent_ctx;
-- 
2.35.1


