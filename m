Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929664ED06A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:51:25 +0200 (CEST)
Received: from localhost ([::1]:33222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZi60-00052H-CN
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:51:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft1-0008Bd-7o
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:51 -0400
Received: from [2a00:1450:4864:20::134] (port=34619
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsx-0003Ix-T9
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:50 -0400
Received: by mail-lf1-x134.google.com with SMTP id 5so38080456lfp.1
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u7zB7QUDy8zFQ7N01182b7cuntUFhcoVxwhc/wsEz7s=;
 b=shLxkt+jInBMg8CWiy2Lg1nstOtGi43ZBFBEtnskImzKgiJ99fNhb+KzYSZCNoDT8Z
 zy2QFFfZEd4dFATzYbgVsnmtMNdduXhFAPvOnTUs3v3aFhXfn0l33fn4/sbNwnd0PSTx
 RBrSuC3RMxcRRz1RZ4Hxh1RdSCEHLb4f0aPcuiZ7YGZnjEZsn+HShcuNbG2xV1HQBK9e
 2jj1yKTKt/W0tYIBNnyT27x9zeCVS7Da76c7l4LeD8HT5s1lsR5MO5JDWOaTExwT8w27
 FpZap6afj+ggtxAc6dZArcz+KgMEzbwLFdpEAVnIakH6Wsq32h6EfyKk0mtJEoSDLFxC
 jg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u7zB7QUDy8zFQ7N01182b7cuntUFhcoVxwhc/wsEz7s=;
 b=4LxUZKm515o+xAdYQA4KMUeL+qx2WPGZ7v/dguC882q10nTqaP12g1VSKHgRdistL/
 jlypnYQqnSfGNZyJ7zpD/f3O/wa0+Gn97rBawS+NpbNfwZfaGwba+wi6H+qtTDjl+orH
 yQHRLn4z9MkqV9FKPbOJr7KQWe9o+PNsjWqv5Z7ztPkRK9t5iLbhHT5CokmtjFMB58Ex
 dvlLAVSYl6PACCYsQ0Cse8u6wTIicVp1sbu7QcXhPWopPxl6k84SsCcMUNIp+9GNN/pP
 UiGaNUbpi3XDrgXZnSKBTbeFFvzZ2RBcvmU4xrv5p6O+KbLNA5Vv0jrRZPlXfqbgPSl7
 aSPQ==
X-Gm-Message-State: AOAM532Pr148NzRyAZan0ix0UKA4TuBhp9/SHPM1fmy2NfwApedGnARV
 8phMsYxdmcw/nj5qJqO/2iE68g==
X-Google-Smtp-Source: ABdhPJzn8AYu8NTCIzprjcJA21qvqSacXrpr3e6ATBB3rGEjADRfPW5c2pzvUTFkk4MSajQ7dD45Yw==
X-Received: by 2002:ac2:4189:0:b0:448:bc2b:e762 with SMTP id
 z9-20020ac24189000000b00448bc2be762mr8406243lfh.471.1648675786293; 
 Wed, 30 Mar 2022 14:29:46 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:46 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 24/45] blockdev: transactions: rename some things
Date: Thu, 31 Mar 2022 00:28:41 +0300
Message-Id: <20220330212902.590099-25-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x134.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:25 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, hreitz@redhat.com,
 vsementsov@openvz.org
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 blockdev.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index a9fb5f66b0..177f3ff989 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2299,7 +2299,7 @@ static void abort_commit(void *opaque)
     g_assert_not_reached(); /* this action never succeeds */
 }
 
-static const BlkActionOps actions[] = {
+static const BlkActionOps actions_map[] = {
     [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT] = {
         .instance_size = sizeof(ExternalSnapshotState),
         .action  = external_snapshot_action,
@@ -2381,12 +2381,12 @@ static TransactionProperties *get_transaction_properties(
  *
  * Always run under BQL.
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
@@ -2396,8 +2396,8 @@ void qmp_transaction(TransactionActionList *dev_list,
     /* Does this transaction get canceled as a group on failure?
      * If not, we don't really need to make a JobTxn.
      */
-    props = get_transaction_properties(props);
-    if (props->completion_mode != ACTION_COMPLETION_MODE_INDIVIDUAL) {
+    properties = get_transaction_properties(properties);
+    if (properties->completion_mode != ACTION_COMPLETION_MODE_INDIVIDUAL) {
         block_job_txn = job_txn_new();
     }
 
@@ -2405,24 +2405,24 @@ void qmp_transaction(TransactionActionList *dev_list,
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
@@ -2440,8 +2440,8 @@ delete_and_fail:
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


