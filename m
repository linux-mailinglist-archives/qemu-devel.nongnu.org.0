Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C02422BD6
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:07:55 +0200 (CEST)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXm2q-0006Pu-Et
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXk-0003wj-SU
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXj-0005M4-9f
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mF74YFJ6GaBMfDQRmEU5OTTb9vKX/BLdTLRHckXpG18=;
 b=Ie0p+w+pKRz2sYFHjAF31olNg9mWLfV1Dl5KhVBQrl5umHWfoFCqdaIrYuRqmtILwQpOlJ
 syYBv1mY76uiDJG5q5GiSZQpe1Nz5aevvqbqVICMD10R6KkMaX2PZ/1eRXzLs303DUcAcp
 4c4SmNRX/CXG2rH7/HoH+7FRJDeeRiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-eUBzj1T5MQm2AaCtGQ8ynA-1; Tue, 05 Oct 2021 10:35:39 -0400
X-MC-Unique: eUBzj1T5MQm2AaCtGQ8ynA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 688E9362FE;
 Tue,  5 Oct 2021 14:35:38 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3882D1042AEB;
 Tue,  5 Oct 2021 14:35:37 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 17/25] include/block/transactions: global state API +
 assertions
Date: Tue,  5 Oct 2021 10:32:07 -0400
Message-Id: <20211005143215.29500-18-eesposit@redhat.com>
In-Reply-To: <20211005143215.29500-1-eesposit@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

transactions run always under the BQL lock, so they are all
in the global state API.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/transactions.h | 24 ++++++++++++++++++++++++
 util/transactions.c         |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/include/qemu/transactions.h b/include/qemu/transactions.h
index 92c5965235..f4a7c473fa 100644
--- a/include/qemu/transactions.h
+++ b/include/qemu/transactions.h
@@ -37,6 +37,29 @@
 #define QEMU_TRANSACTIONS_H
 
 #include <gmodule.h>
+#include "qemu/main-loop.h"
+
+/*
+ * Global state (GS) API. These functions run under the BQL lock.
+ *
+ * If a function modifies the graph, it also uses drain and/or
+ * aio_context_acquire/release to be sure it has unique access.
+ * aio_context locking is needed together with BQL because of
+ * the thread-safe I/O API that concurrently runs and accesses
+ * the graph without the BQL.
+ *
+ * It is important to note that not all of these functions are
+ * necessarily limited to running under the BQL, but they would
+ * require additional auditing and may small thread-safety changes
+ * to move them into the I/O API. Often it's not worth doing that
+ * work since the APIs are only used with the BQL held at the
+ * moment, so they have been placed in the GS API (for now).
+ *
+ * All functions and function pointers in this header must use
+ * this assertion:
+ * g_assert(qemu_in_main_thread());
+ * to catch when they are accidentally called without the BQL.
+ */
 
 typedef struct TransactionActionDrv {
     void (*abort)(void *opaque);
@@ -53,6 +76,7 @@ void tran_commit(Transaction *tran);
 
 static inline void tran_finalize(Transaction *tran, int ret)
 {
+    g_assert(qemu_in_main_thread());
     if (ret < 0) {
         tran_abort(tran);
     } else {
diff --git a/util/transactions.c b/util/transactions.c
index d0bc9a3e73..20c3dafdb8 100644
--- a/util/transactions.c
+++ b/util/transactions.c
@@ -23,6 +23,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu/transactions.h"
+#include "qemu/main-loop.h"
 #include "qemu/queue.h"
 
 typedef struct TransactionAction {
@@ -47,6 +48,7 @@ Transaction *tran_new(void)
 void tran_add(Transaction *tran, TransactionActionDrv *drv, void *opaque)
 {
     TransactionAction *act;
+    g_assert(qemu_in_main_thread());
 
     act = g_new(TransactionAction, 1);
     *act = (TransactionAction) {
@@ -60,6 +62,7 @@ void tran_add(Transaction *tran, TransactionActionDrv *drv, void *opaque)
 void tran_abort(Transaction *tran)
 {
     TransactionAction *act, *next;
+    g_assert(qemu_in_main_thread());
 
     QSLIST_FOREACH_SAFE(act, &tran->actions, entry, next) {
         if (act->drv->abort) {
@@ -79,6 +82,7 @@ void tran_abort(Transaction *tran)
 void tran_commit(Transaction *tran)
 {
     TransactionAction *act, *next;
+    g_assert(qemu_in_main_thread());
 
     QSLIST_FOREACH_SAFE(act, &tran->actions, entry, next) {
         if (act->drv->commit) {
-- 
2.27.0


