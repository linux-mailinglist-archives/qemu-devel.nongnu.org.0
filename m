Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E57069E49D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:27:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUvt-00038C-OR; Tue, 21 Feb 2023 10:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUUvH-0001yX-9S; Tue, 21 Feb 2023 10:51:27 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUUv8-0004VL-QQ; Tue, 21 Feb 2023 10:51:18 -0500
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:8923:0:640:c717:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id CC7145F52B;
 Tue, 21 Feb 2023 18:51:02 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b584::1:19])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id rosEB10KmeA0-kaZWdvBf; Tue, 21 Feb 2023 18:51:01 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 alexander.ivanov@virtuozzo.com, den@openvz.org, vsementsov@yandex-team.ru,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
Subject: [PATCH v7 2/5] blockdev: transactions: rename some things
Date: Tue, 21 Feb 2023 18:50:48 +0300
Message-Id: <20230221155051.746312-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221155051.746312-1-vsementsov@yandex-team.ru>
References: <20230221155051.746312-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>

Look at qmp_transaction(): dev_list is not obvious name for list of
actions. Let's look at qapi spec, this argument is "actions". Let's
follow the common practice of using same argument names in qapi scheme
and code.

To be honest, rename props to properties for same reason.

Next, we have to rename global map of actions, to not conflict with new
name for function argument.

Rename also dev_entry loop variable accordingly to new name of the
list.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 blockdev.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 293f6a958e..2174ab2694 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2289,7 +2289,7 @@ static void abort_commit(void *opaque)
     g_assert_not_reached(); /* this action never succeeds */
 }
 
-static const BlkActionOps actions[] = {
+static const BlkActionOps actions_map[] = {
     [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT] = {
         .instance_size = sizeof(ExternalSnapshotState),
         .action  = external_snapshot_action,
@@ -2371,12 +2371,12 @@ static TransactionProperties *get_transaction_properties(
  *
  * Always run under BQL.
  */
-void qmp_transaction(TransactionActionList *dev_list,
-                     struct TransactionProperties *props,
+void qmp_transaction(TransactionActionList *actions,
+                     struct TransactionProperties *properties,
                      Error **errp)
 {
-    TransactionActionList *dev_entry = dev_list;
-    bool has_props = !!props;
+    TransactionActionList *act = actions;
+    bool has_properties = !!properties;
     JobTxn *block_job_txn = NULL;
     Error *local_err = NULL;
     Transaction *tran = tran_new();
@@ -2386,8 +2386,8 @@ void qmp_transaction(TransactionActionList *dev_list,
     /* Does this transaction get canceled as a group on failure?
      * If not, we don't really need to make a JobTxn.
      */
-    props = get_transaction_properties(props);
-    if (props->completion_mode != ACTION_COMPLETION_MODE_INDIVIDUAL) {
+    properties = get_transaction_properties(properties);
+    if (properties->completion_mode != ACTION_COMPLETION_MODE_INDIVIDUAL) {
         block_job_txn = job_txn_new();
     }
 
@@ -2395,24 +2395,24 @@ void qmp_transaction(TransactionActionList *dev_list,
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
@@ -2430,8 +2430,8 @@ delete_and_fail:
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
2.34.1


