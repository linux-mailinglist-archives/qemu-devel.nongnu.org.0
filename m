Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852524EB50D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:08:51 +0200 (CEST)
Received: from localhost ([::1]:33736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJ58-0007r4-Jy
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:08:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIg7-0005o2-3s; Tue, 29 Mar 2022 16:42:59 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:34396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIg5-0006o4-Bt; Tue, 29 Mar 2022 16:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=ytbFMVb6X3oMH9jVOblknaab55fqqN7i6xWZkQ53vqg=; 
 t=1648586577;x=1649191977; 
 b=rxU3hTikBOgxf4qkPulAy4cvq2J3i1LlN68v5Q/1dWMLKiCK8UKaUFuYHtP0UYcJbyOAALEMbWvx0ozLDe7tmcAt+p/9rmTDnegHzLzXjpZETJqFqsB/gp8nbqJP7D++fEs/kazusD7mjubuvWVF+njGWBX68o8qToZXpy8FvbSbIKvAho1U8YCVqi+AXc6GRV2FKR8jcXuxV4Vz+EWo4u7zad1+yBJXRAzneoACJsJ+2nitDKFBFfWGNw7sDy8x4z/Oc7KgVvIoo8fVBjeU6U9LtA7fIQTvXy6qZ4oMlMHdJplXOhrEjrfmJzPdJVklGmwxw2bD9FoQ/NWPQ9pd8g==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIfi-000374-AK; Tue, 29 Mar 2022 23:42:34 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 24/45] blockdev: transactions: rename some things
Date: Tue, 29 Mar 2022 23:40:46 +0300
Message-Id: <20220329204107.411011-25-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61E5A01BA52239DE31EE46BC6EE1AF181600894C459B0CD1B90D554FC1344AD48A0E2E83363EC98800C206EF2094F4D734B323337538F1B82C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77E216A0E97507353EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374F897F3E43A934888638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E4FE1B9E6A47044EEAAF71DCCE88BF926F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE77E7E81EEA8A9722B8941B15DA834481FA18204E546F3947C724336BCC0EE1BA8F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006376B023E84F73EF47C389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F79006374E9BF34603E496CCD32BA5DBAC0009BE395957E7521B51C20BC6067A898B09E4090A508E0FED6299176DF2183F8FC7C03FBDFDC7E18BC620CD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B62972A486E2682F5975ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC446469D8A8717206BBF593E0A4FA3DD8F58D3F990CA65790A6A9AFE01AD74E4D169C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027F36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D548DA55E71E02F9FC08E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349A401E2B4D763A4AEF4E4F619A5993D706F597077BABD5CB3936A493E66D22FDE479DD9072DF0CE01D7E09C32AA3244C2308CC723F83AB01288F94001E94C8B655E75C8D0ED9F6EE8D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGayaZnTYFea/w==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEFC767CF233A6F34DCC736A7AA5E38981BE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Look at qmp_transaction(): dev_list is not obvious name for list of
actions. Let's look at qapi spec, this argument is "actions". Let's
follow the common practice of using same argument names in qapi scheme
and code.

To be honest, rename props to properties for same reason.

Next, we have to rename global map of actions, to not conflict with new
name for function argument.

Rename also dev_entry loop variable accordingly to new name of the
list.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 blockdev.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 65f01a31d1..8afd769bc4 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2276,7 +2276,7 @@ static void abort_commit(void *opaque)
     g_assert_not_reached(); /* this action never succeeds */
 }
 
-static const BlkActionOps actions[] = {
+static const BlkActionOps actions_map[] = {
     [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT] = {
         .instance_size = sizeof(ExternalSnapshotState),
         .action  = external_snapshot_action,
@@ -2356,12 +2356,12 @@ static TransactionProperties *get_transaction_properties(
  * 'Atomic' group operations.  The operations are performed as a set, and if
  * any fail then we roll back all operations in the group.
  */
-void qmp_transaction(TransactionActionList *dev_list,
-                     bool has_props,
-                     struct TransactionProperties *props,
+void qmp_transaction(TransactionActionList *actions,
+                     bool has_properties,
+                     struct TransactionProperties *properties,
                      Error **errp)
 {
-    TransactionActionList *dev_entry = dev_list;
+    TransactionActionList *act = actions;
     JobTxn *block_job_txn = NULL;
     Error *local_err = NULL;
     Transaction *tran = tran_new();
@@ -2369,8 +2369,8 @@ void qmp_transaction(TransactionActionList *dev_list,
     /* Does this transaction get canceled as a group on failure?
      * If not, we don't really need to make a JobTxn.
      */
-    props = get_transaction_properties(props);
-    if (props->completion_mode != ACTION_COMPLETION_MODE_INDIVIDUAL) {
+    properties = get_transaction_properties(properties);
+    if (properties->completion_mode != ACTION_COMPLETION_MODE_INDIVIDUAL) {
         block_job_txn = job_txn_new();
     }
 
@@ -2378,24 +2378,24 @@ void qmp_transaction(TransactionActionList *dev_list,
     bdrv_drain_all();
 
     /* We don't do anything in this loop that commits us to the operations */
-    while (NULL != dev_entry) {
+    while (NULL != act) {
         TransactionAction *dev_info = NULL;
         const BlkActionOps *ops;
         BlkActionState *state;
 
-        dev_info = dev_entry->value;
-        dev_entry = dev_entry->next;
+        dev_info = act->value;
+        act = act->next;
 
-        assert(dev_info->type < ARRAY_SIZE(actions));
+        assert(dev_info->type < ARRAY_SIZE(actions_map));
 
-        ops = &actions[dev_info->type];
+        ops = &actions_map[dev_info->type];
         assert(ops->instance_size > 0);
 
         state = g_malloc0(ops->instance_size);
         state->ops = ops;
         state->action = dev_info;
         state->block_job_txn = block_job_txn;
-        state->txn_props = props;
+        state->txn_props = properties;
 
         state->ops->action(state, tran, &local_err);
         if (local_err) {
@@ -2413,8 +2413,8 @@ delete_and_fail:
     /* failure, and it is all-or-none; roll back all operations */
     tran_abort(tran);
 exit:
-    if (!has_props) {
-        qapi_free_TransactionProperties(props);
+    if (!has_properties) {
+        qapi_free_TransactionProperties(properties);
     }
     job_txn_unref(block_job_txn);
 }
-- 
2.35.1


