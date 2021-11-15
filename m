Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17964507FF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:14:46 +0100 (CET)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdgz-0001ep-TN
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:14:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNh-0004Ah-I3
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNf-0007tI-9A
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=27m0MYEJxiAG2aHi4wg8yJ/9eridihpe+rS+HS/7iNo=;
 b=iMk/oLA5fL10OFhxHrV2qriuZ9H70cVxrzeDLjEC9b8w2inWtaBWpC7dU/cDK5J4HLeOLK
 WKq3/kNiQWDfBwg7titamKsHKG/3IuYba/EDM85Yw2I5ofhPjAU4Rk1UYWRtxmvisbXA0b
 UE09O75wOyOxwvBo4BUSZ+5Nff/h/lg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-UsXdb6DCNgiRVHH3kRfK3A-1; Mon, 15 Nov 2021 09:54:25 -0500
X-MC-Unique: UsXdb6DCNgiRVHH3kRfK3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEC931006AAD;
 Mon, 15 Nov 2021 14:54:23 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB046196F9;
 Mon, 15 Nov 2021 14:54:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/13] transactions: Invoke clean() after everything else
Date: Mon, 15 Nov 2021 15:54:03 +0100
Message-Id: <20211115145409.176785-8-kwolf@redhat.com>
In-Reply-To: <20211115145409.176785-1-kwolf@redhat.com>
References: <20211115145409.176785-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

Invoke the transaction drivers' .clean() methods only after all
.commit() or .abort() handlers are done.

This makes it easier to have nested transactions where the top-level
transactions pass objects to lower transactions that the latter can
still use throughout their commit/abort phases, while the top-level
transaction keeps a reference that is released in its .clean() method.

(Before this commit, that is also possible, but the top-level
transaction would need to take care to invoke tran_add() before the
lower-level transaction does.  This commit makes the ordering
irrelevant, which is just a bit nicer.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211111120829.81329-8-hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/transactions.h | 3 +++
 util/transactions.c         | 8 ++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/qemu/transactions.h b/include/qemu/transactions.h
index 92c5965235..2f2060acd9 100644
--- a/include/qemu/transactions.h
+++ b/include/qemu/transactions.h
@@ -31,6 +31,9 @@
  * tran_create(), call your "prepare" functions on it, and finally call
  * tran_abort() or tran_commit() to finalize the transaction by corresponding
  * finalization actions in reverse order.
+ *
+ * The clean() functions registered by the drivers in a transaction are called
+ * last, after all abort() or commit() functions have been called.
  */
 
 #ifndef QEMU_TRANSACTIONS_H
diff --git a/util/transactions.c b/util/transactions.c
index d0bc9a3e73..2dbdedce95 100644
--- a/util/transactions.c
+++ b/util/transactions.c
@@ -61,11 +61,13 @@ void tran_abort(Transaction *tran)
 {
     TransactionAction *act, *next;
 
-    QSLIST_FOREACH_SAFE(act, &tran->actions, entry, next) {
+    QSLIST_FOREACH(act, &tran->actions, entry) {
         if (act->drv->abort) {
             act->drv->abort(act->opaque);
         }
+    }
 
+    QSLIST_FOREACH_SAFE(act, &tran->actions, entry, next) {
         if (act->drv->clean) {
             act->drv->clean(act->opaque);
         }
@@ -80,11 +82,13 @@ void tran_commit(Transaction *tran)
 {
     TransactionAction *act, *next;
 
-    QSLIST_FOREACH_SAFE(act, &tran->actions, entry, next) {
+    QSLIST_FOREACH(act, &tran->actions, entry) {
         if (act->drv->commit) {
             act->drv->commit(act->opaque);
         }
+    }
 
+    QSLIST_FOREACH_SAFE(act, &tran->actions, entry, next) {
         if (act->drv->clean) {
             act->drv->clean(act->opaque);
         }
-- 
2.31.1


