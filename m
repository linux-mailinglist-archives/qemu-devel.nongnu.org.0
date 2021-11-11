Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B02644D67E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 13:18:34 +0100 (CET)
Received: from localhost ([::1]:38368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml92G-0000Ot-Cn
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 07:18:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8t6-0000Dc-7L
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:09:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8t0-00037W-SL
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636632538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTwU1wxiju8LS239rJNt8QDqlXENRjV3DDrajp7ulPo=;
 b=HvzK52rNfhbsdVTI/mPq8Frvlx/DqheY3DnjWmakgRfmxai9skp4oRqBnZZoCOwat39E9A
 1AklycqIkPbT9fYenp/EavgQuDPY9lEOatGcCQ5juYHiVCoHHaEfNqUq3s9NxujahS3crH
 FQuQR34a5E8xBr2woyhVi67IK5ENccM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-bjGn7a0sM8u7nyOXd7DQSw-1; Thu, 11 Nov 2021 07:08:55 -0500
X-MC-Unique: bjGn7a0sM8u7nyOXd7DQSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CEC0425C8;
 Thu, 11 Nov 2021 12:08:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C2CA5C1B4;
 Thu, 11 Nov 2021 12:08:53 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 07/10] transactions: Invoke clean() after everything else
Date: Thu, 11 Nov 2021 13:08:26 +0100
Message-Id: <20211111120829.81329-8-hreitz@redhat.com>
In-Reply-To: <20211111120829.81329-1-hreitz@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
2.33.1


