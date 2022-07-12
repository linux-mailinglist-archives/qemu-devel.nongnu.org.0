Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899CF572871
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:21:39 +0200 (CEST)
Received: from localhost ([::1]:56880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNK6-0006Jq-Lv
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oBNHv-0001kI-MF
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:19:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oBNHs-0002Gp-Fc
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657660759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xamwRQcHxp0nHCghcr5xA3P05s95yhuo/GJ5eC+ybY4=;
 b=DQkr4dwR5PXKtwTcy7mfNA8k5vcUfTptOpAG2yzIVt8oQDlAGYvBedsJhiATjC9wyuI6D4
 iP0lTu8kscI3tt0Xhka+9prUWz+jwU6+38KVj7vZOO2gU+TQ33EcnTBofRUI63cTzwVznP
 /x8dxsX6mdNeM8KEAZTGZHHUyNHVHG0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-QUwRMY_6P2-4i11lsLqDgw-1; Tue, 12 Jul 2022 17:19:17 -0400
X-MC-Unique: QUwRMY_6P2-4i11lsLqDgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEF67294EDC5;
 Tue, 12 Jul 2022 21:19:16 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F29AE2166B2F;
 Tue, 12 Jul 2022 21:19:15 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH 2/8] transactions: add tran_add_back
Date: Tue, 12 Jul 2022 17:19:05 -0400
Message-Id: <20220712211911.1302836-3-eesposit@redhat.com>
In-Reply-To: <20220712211911.1302836-1-eesposit@redhat.com>
References: <20220712211911.1302836-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

First change the transactions from a QLIST to QSIMPLEQ, then
use it to implement tran_add_tail, which allows adding elements
to the end of list transactions.

This is useful if we have some "preparation" transiction callbacks
that we want to run before the others but still only when invoking
finalize/commit/abort.

For example (A and B are lists transaction callbacks):

for (i=0; i < 3; i++) {
	tran_add(A[i]);
	tran_add_tail(B[i]);
}

tran_commit();

Will process transactions in this order: A2 - A1 - A0 - B0 - B1 - B2

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/transactions.h |  9 +++++++++
 util/transactions.c         | 29 +++++++++++++++++++++--------
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/include/qemu/transactions.h b/include/qemu/transactions.h
index 2f2060acd9..42783720b9 100644
--- a/include/qemu/transactions.h
+++ b/include/qemu/transactions.h
@@ -50,7 +50,16 @@ typedef struct TransactionActionDrv {
 typedef struct Transaction Transaction;
 
 Transaction *tran_new(void);
+/*
+ * Add transaction at the beginning of the transaction list.
+ * @tran will be the first transaction to be processed in finalize/commit/abort.
+ */
 void tran_add(Transaction *tran, TransactionActionDrv *drv, void *opaque);
+/*
+ * Add transaction at the end of the transaction list.
+ * @tran will be the last transaction to be processed in finalize/commit/abort.
+ */
+void tran_add_tail(Transaction *tran, TransactionActionDrv *drv, void *opaque);
 void tran_abort(Transaction *tran);
 void tran_commit(Transaction *tran);
 
diff --git a/util/transactions.c b/util/transactions.c
index 2dbdedce95..89e541c4a4 100644
--- a/util/transactions.c
+++ b/util/transactions.c
@@ -28,18 +28,18 @@
 typedef struct TransactionAction {
     TransactionActionDrv *drv;
     void *opaque;
-    QSLIST_ENTRY(TransactionAction) entry;
+    QSIMPLEQ_ENTRY(TransactionAction) entry;
 } TransactionAction;
 
 struct Transaction {
-    QSLIST_HEAD(, TransactionAction) actions;
+    QSIMPLEQ_HEAD(, TransactionAction) actions;
 };
 
 Transaction *tran_new(void)
 {
     Transaction *tran = g_new(Transaction, 1);
 
-    QSLIST_INIT(&tran->actions);
+    QSIMPLEQ_INIT(&tran->actions);
 
     return tran;
 }
@@ -54,20 +54,33 @@ void tran_add(Transaction *tran, TransactionActionDrv *drv, void *opaque)
         .opaque = opaque
     };
 
-    QSLIST_INSERT_HEAD(&tran->actions, act, entry);
+    QSIMPLEQ_INSERT_HEAD(&tran->actions, act, entry);
+}
+
+void tran_add_tail(Transaction *tran, TransactionActionDrv *drv, void *opaque)
+{
+    TransactionAction *act;
+
+    act = g_new(TransactionAction, 1);
+    *act = (TransactionAction) {
+        .drv = drv,
+        .opaque = opaque
+    };
+
+    QSIMPLEQ_INSERT_TAIL(&tran->actions, act, entry);
 }
 
 void tran_abort(Transaction *tran)
 {
     TransactionAction *act, *next;
 
-    QSLIST_FOREACH(act, &tran->actions, entry) {
+    QSIMPLEQ_FOREACH(act, &tran->actions, entry) {
         if (act->drv->abort) {
             act->drv->abort(act->opaque);
         }
     }
 
-    QSLIST_FOREACH_SAFE(act, &tran->actions, entry, next) {
+    QSIMPLEQ_FOREACH_SAFE(act, &tran->actions, entry, next) {
         if (act->drv->clean) {
             act->drv->clean(act->opaque);
         }
@@ -82,13 +95,13 @@ void tran_commit(Transaction *tran)
 {
     TransactionAction *act, *next;
 
-    QSLIST_FOREACH(act, &tran->actions, entry) {
+    QSIMPLEQ_FOREACH(act, &tran->actions, entry) {
         if (act->drv->commit) {
             act->drv->commit(act->opaque);
         }
     }
 
-    QSLIST_FOREACH_SAFE(act, &tran->actions, entry, next) {
+    QSIMPLEQ_FOREACH_SAFE(act, &tran->actions, entry, next) {
         if (act->drv->clean) {
             act->drv->clean(act->opaque);
         }
-- 
2.31.1


