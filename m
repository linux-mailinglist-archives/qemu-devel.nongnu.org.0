Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B9F36F95C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:31:57 +0200 (CEST)
Received: from localhost ([::1]:35442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRNE-0004YL-HK
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQko-00041a-8K
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkl-0002PP-JR
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+pdJTXXcZElc+AW8Cs3t8ofRGgkPfdks1oZO6Wosn60=;
 b=VWgHLnIebIhGrgJsuLFO3i/aG/L7CApw74l8dpQDDcPaFZl7gxerC4OmSZxIfL68x46Hdf
 Nxk1oqjhTkySljw7X9DYXAyWp2tw3bI0BLYa3n6TkMI73WkIJvY868y/QUJwdOWgyU0BwE
 d3/crh33SFDaI8wpm0YWC2TyAjME8JY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-36y0nxteONKI6cgxn4CSzQ-1; Fri, 30 Apr 2021 06:52:06 -0400
X-MC-Unique: 36y0nxteONKI6cgxn4CSzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF11680ED96;
 Fri, 30 Apr 2021 10:52:05 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDB605F707;
 Fri, 30 Apr 2021 10:52:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/39] util: add transactions.c
Date: Fri, 30 Apr 2021 12:51:16 +0200
Message-Id: <20210430105147.125840-9-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add simple transaction API to use in further update of block graph
operations.

Supposed usage is:

- "prepare" is main function of the action and it should make the main
  effect of the action to be visible for the following actions, keeping
  possibility of roll-back, saving necessary things in action state,
  which is prepended to the action list (to do that, prepare func
  should call tran_add()). So, driver struct doesn't include "prepare"
  field, as it is supposed to be called directly.

- commit/rollback is supposed to be called for the list of action
  states, to commit/rollback all the actions in reverse order

- When possible "commit" should not make visible effect for other
  actions, which make possible transparent logical interaction between
  actions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-9-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/transactions.h | 63 ++++++++++++++++++++++++
 util/transactions.c         | 96 +++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |  6 +++
 util/meson.build            |  1 +
 4 files changed, 166 insertions(+)
 create mode 100644 include/qemu/transactions.h
 create mode 100644 util/transactions.c

diff --git a/include/qemu/transactions.h b/include/qemu/transactions.h
new file mode 100644
index 0000000000..92c5965235
--- /dev/null
+++ b/include/qemu/transactions.h
@@ -0,0 +1,63 @@
+/*
+ * Simple transactions API
+ *
+ * Copyright (c) 2021 Virtuozzo International GmbH.
+ *
+ * Author:
+ *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ *
+ *
+ * = Generic transaction API =
+ *
+ * The intended usage is the following: you create "prepare" functions, which
+ * represents the actions. They will usually have Transaction* argument, and
+ * call tran_add() to register finalization callbacks. For finalization
+ * callbacks, prepare corresponding TransactionActionDrv structures.
+ *
+ * Then, when you need to make a transaction, create an empty Transaction by
+ * tran_create(), call your "prepare" functions on it, and finally call
+ * tran_abort() or tran_commit() to finalize the transaction by corresponding
+ * finalization actions in reverse order.
+ */
+
+#ifndef QEMU_TRANSACTIONS_H
+#define QEMU_TRANSACTIONS_H
+
+#include <gmodule.h>
+
+typedef struct TransactionActionDrv {
+    void (*abort)(void *opaque);
+    void (*commit)(void *opaque);
+    void (*clean)(void *opaque);
+} TransactionActionDrv;
+
+typedef struct Transaction Transaction;
+
+Transaction *tran_new(void);
+void tran_add(Transaction *tran, TransactionActionDrv *drv, void *opaque);
+void tran_abort(Transaction *tran);
+void tran_commit(Transaction *tran);
+
+static inline void tran_finalize(Transaction *tran, int ret)
+{
+    if (ret < 0) {
+        tran_abort(tran);
+    } else {
+        tran_commit(tran);
+    }
+}
+
+#endif /* QEMU_TRANSACTIONS_H */
diff --git a/util/transactions.c b/util/transactions.c
new file mode 100644
index 0000000000..d0bc9a3e73
--- /dev/null
+++ b/util/transactions.c
@@ -0,0 +1,96 @@
+/*
+ * Simple transactions API
+ *
+ * Copyright (c) 2021 Virtuozzo International GmbH.
+ *
+ * Author:
+ *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qemu/transactions.h"
+#include "qemu/queue.h"
+
+typedef struct TransactionAction {
+    TransactionActionDrv *drv;
+    void *opaque;
+    QSLIST_ENTRY(TransactionAction) entry;
+} TransactionAction;
+
+struct Transaction {
+    QSLIST_HEAD(, TransactionAction) actions;
+};
+
+Transaction *tran_new(void)
+{
+    Transaction *tran = g_new(Transaction, 1);
+
+    QSLIST_INIT(&tran->actions);
+
+    return tran;
+}
+
+void tran_add(Transaction *tran, TransactionActionDrv *drv, void *opaque)
+{
+    TransactionAction *act;
+
+    act = g_new(TransactionAction, 1);
+    *act = (TransactionAction) {
+        .drv = drv,
+        .opaque = opaque
+    };
+
+    QSLIST_INSERT_HEAD(&tran->actions, act, entry);
+}
+
+void tran_abort(Transaction *tran)
+{
+    TransactionAction *act, *next;
+
+    QSLIST_FOREACH_SAFE(act, &tran->actions, entry, next) {
+        if (act->drv->abort) {
+            act->drv->abort(act->opaque);
+        }
+
+        if (act->drv->clean) {
+            act->drv->clean(act->opaque);
+        }
+
+        g_free(act);
+    }
+
+    g_free(tran);
+}
+
+void tran_commit(Transaction *tran)
+{
+    TransactionAction *act, *next;
+
+    QSLIST_FOREACH_SAFE(act, &tran->actions, entry, next) {
+        if (act->drv->commit) {
+            act->drv->commit(act->opaque);
+        }
+
+        if (act->drv->clean) {
+            act->drv->clean(act->opaque);
+        }
+
+        g_free(act);
+    }
+
+    g_free(tran);
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c5..4c05ff8bba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2532,6 +2532,12 @@ M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 S: Maintained
 F: scripts/simplebench/
 
+Transactions helper
+M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+S: Maintained
+F: include/qemu/transactions.h
+F: util/transactions.c
+
 QAPI
 M: Markus Armbruster <armbru@redhat.com>
 M: Michael Roth <michael.roth@amd.com>
diff --git a/util/meson.build b/util/meson.build
index 510765cde4..97fad44105 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -41,6 +41,7 @@ util_ss.add(files('qsp.c'))
 util_ss.add(files('range.c'))
 util_ss.add(files('stats64.c'))
 util_ss.add(files('systemd.c'))
+util_ss.add(files('transactions.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('drm.c'))
 util_ss.add(files('guest-random.c'))
 util_ss.add(files('yank.c'))
-- 
2.30.2


