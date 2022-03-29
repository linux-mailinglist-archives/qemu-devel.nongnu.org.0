Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4E54EB52B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:23:31 +0200 (CEST)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJJK-0002Qk-IS
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:23:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgB-00060t-9X; Tue, 29 Mar 2022 16:43:03 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:37624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIg9-0006p8-Kw; Tue, 29 Mar 2022 16:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=wfq5VJWX1lz3lS5im4YoB5YaQjaBU6TyQDpUvTgUfjw=; 
 t=1648586581;x=1649191981; 
 b=WdtAmJTQWouE208uui8fO4QpX4qMy4wqkPRMfLXoLvez7pM2AavUR4PaXFetoQzuDixFTx8dxa6+9+qK19vRxczMe/5bTjretAsUc5/VjyUi0fez1J1WEeVktQ4yAc6YxHM2GmE0Qxj95XHzOD7GrYJEFecj3849QusT+ZWlrNykTOHro6IGp4Z2sWSE/FeXT1R99gobe+MXHMNN/BDLdVeluJdgo0QTSNLhzGjLVnfTIngJXMf1LW/pdaXfPIThWYLypUNAgtDlUuFpjyDUJcGMJAuKg+AkTH60fOaNwPLEVCFfGWj8B+c5nMaUGCJFT/5cvmCa20hlmYMKNazHCw==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIfm-000374-RC; Tue, 29 Mar 2022 23:42:39 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 25/45] blockdev: qmp_transaction: refactor loop to classic
 for
Date: Tue, 29 Mar 2022 23:40:47 +0300
Message-Id: <20220329204107.411011-26-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB617AC1FE8603272810BF2FE6052598777800894C459B0CD1B95885EFCC87483CA4A4D5BCBC4539D4F4C206EF2094F4D7347F2EA087B10D9051
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE789066434B85BF7C7EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063779089FB2CE4EA2908638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D87403499C6542EA5F2548817383C3EE2F6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7328B01A8D746D8839FA2833FD35BB23D9E625A9149C048EEF8AB6B2BE2218126117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE73C898D85DF5B8A709FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE775E406D6279F2D37D32BA5DBAC0009BE395957E7521B51C20BC6067A898B09E4090A508E0FED6299176DF2183F8FC7C0AF8A47D1CE1DD64DCD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B62972A486E2682F5975ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC446469D8A8717206BBF593E0A4FA3DD8F5A7D3D997D4F2DDE111454A43022D12B89C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34F38194B2C99DC12880B418D3C8CD849748678713E7F6398DE5F1F3F705388DF8E436E5C9BE9DC1B71D7E09C32AA3244C44A5D44242EB879FAD9E4A41A55E8C1595A9E0DC41E9A4CF8D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGaQkikOG9DhtQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEF248B491B2B16AC33FE5919AF3A4DC9B2E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 blockdev.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 8afd769bc4..6c08ee4401 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2361,7 +2361,7 @@ void qmp_transaction(TransactionActionList *actions,
                      struct TransactionProperties *properties,
                      Error **errp)
 {
-    TransactionActionList *act = actions;
+    TransactionActionList *act;
     JobTxn *block_job_txn = NULL;
     Error *local_err = NULL;
     Transaction *tran = tran_new();
@@ -2378,14 +2378,11 @@ void qmp_transaction(TransactionActionList *actions,
     bdrv_drain_all();
 
     /* We don't do anything in this loop that commits us to the operations */
-    while (NULL != act) {
-        TransactionAction *dev_info = NULL;
+    for (act = actions; act; act = act->next) {
+        TransactionAction *dev_info = act->value;
         const BlkActionOps *ops;
         BlkActionState *state;
 
-        dev_info = act->value;
-        act = act->next;
-
         assert(dev_info->type < ARRAY_SIZE(actions_map));
 
         ops = &actions_map[dev_info->type];
-- 
2.35.1


