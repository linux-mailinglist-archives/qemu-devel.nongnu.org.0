Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745B036DC7E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:53:26 +0200 (CEST)
Received: from localhost ([::1]:55834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmV9-0000k1-Oi
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxy-0005oX-1S; Wed, 28 Apr 2021 11:19:13 -0400
Received: from mail-db8eur05on2106.outbound.protection.outlook.com
 ([40.107.20.106]:17025 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxj-0001uP-6s; Wed, 28 Apr 2021 11:19:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAPldKopnanJdsKFeIPoKfBsz5m+NpUKb3LMQUx0fP2YK6BGfe9IJAz3rT7dcYngl6U5R8dBa5gTOuBneMBiTnrV60JBWcAlsE7JTyfgSJtbJ37ing5YhpCkztar3tg+j2q2uQqstol4jBrkYWtCJD1u5Wrf68aZzXn9ASfPpGcCZyW4hK2PWzeAkrh3KkbFsJQBguWFA9nf/8bpBd9lzhsz2pD1V2/EqVDYOkMN9TwhzA8Lit86RZf7DDSR/l9+674E01jFOBGmi3DJ8HNExNR0h40Jyq0yjOfGxF9D6VDyXpHfEYhXwvRNoAT0lNQj1bZveHzsPaCve7M3YMPTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7wmAjyiCgb6TKhodW3bXdvVtaDI7bG1+2+Z7nV6GG8=;
 b=PbqdWY2DkhgbHv+CTQqGvM4AL+tL+a4IcXdW3Uu+BguvOrNTK0vKY5kd5MLDkbSSIEIG1smh4pP5Aq24AgP2ecwDXYAWVYYAiEnqt/TzXNoBtMGo8mDL+XyA9qxtu434pR4f7rcO7NC/PCH0s30QePs4gMjhXPL1Ef1O1BEGXVfk9WZ6TiN+MeuJeBRpgAVdEGgBSvYG0xO1YXvbVTdQXFaVsTEXyrG8NmqhumTjnNthrGLXaHM8TFWW8EE0zMzIdaDfk4ASuiCE+KkizuAkbPdOzgjHL8OSoZnO3p96Ph4MzBVvTGIHu8U5s6e4k6CgPBcTGP7vXvt3n0La8xBGAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7wmAjyiCgb6TKhodW3bXdvVtaDI7bG1+2+Z7nV6GG8=;
 b=I+qtYeCfWP+BJvdz2H9zISi6id+1GTnH4piT05LjFRWVO5HUyMyPrbs/EH4tPPTY0J/Cr3aDOMJ20ogsG/jRmXwFJn6zBUwhY9rnYGoCw0772IlRKDl/AALndHbIJQr3JeUqDvfobNJYe0sSMZQmPar2DfLJkxX+ge+YKOE3iKs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 08/36] util: add transactions.c
Date: Wed, 28 Apr 2021 18:17:36 +0300
Message-Id: <20210428151804.439460-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb1948b5-dc0f-4bdf-2a19-08d90a58e1c4
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59094737359BCC86A13FCF5DC1409@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +O7kab4N0aVPG3pFh/3HVXR2LdSDDEfTVYjrlb9RoQbWB0qrY1hePVvbJemHOGqDpwqycv+W0tBigDr9UV0VbmCWFtLfp5nM7DnR5vnNAbkX9JKyWDpqQOnEyT4FlHLnCUvbfnGsApFg97Y6JxNEliLXdJ+L80GkSfUKos0Cf0RulxUiMuoSrj9+d56Yo2rNXxRvTC2SHQ8t5AcxXF9xqzZN6osZPi7Sl0lxwJcnHIL9glX/a/8lQPtOjKvYH4y7MtA540ErqEYJ3F0FxDimw9hf58xLQuwV39GHTLnMQcoWBteXdQvhTY5eAFEo2zsGF6mMifKNwF3JJg9mbIfdjnkZu+F4Q6Moq/B/LjlqwXaggdR7f9tu40oyTqAg502Ze3R7kiZuxHZXQJlo+dtHkkHTHdfkPdF6UsP7bpSKCzT1ETFYCVz9GOZc9R8fd5vL6Mp859Oc9pj9947N8WBe80ojba979mNidL+7IxytbvwcABguO9N+Bwp3EBRYqJH3LRnV1RxEVLRhCAYNGdu0n1u9kkTMyrnqv/0QjwKqazMW2xgoGTB3loQ48ZJWezpVjgPQqIl0kNiWlqmnN3Fxlg96HuklxlzPpzcDA8EXwSGpooV5OoA00x4dBawozhDBz8IBkZqiFTNSNvV4Fkfu8+UxYL8uPsAV9ntObx5H3FJbD6wEsowCsR9ODtZyggnj6YXPYYVmFY+BDW7EfaqBRw7slP1O+v4mgv15UlEjlYoyPlLrwabVv3OLN6GLHkxyUX/E4SwldD9jP7sxBZYkyv8+C2ukUdEW0U0IpgYAADY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39830400003)(8676002)(478600001)(83380400001)(8936002)(36756003)(5660300002)(4326008)(6486002)(52116002)(6512007)(2906002)(6506007)(66946007)(26005)(86362001)(38100700002)(186003)(16526019)(6916009)(38350700002)(66556008)(66476007)(316002)(956004)(2616005)(1076003)(69590400013)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fsAgNL3QUBRTiVjVxIkBpbHEw+0rr2ZjLVEuf7dvrG57YubNHFap36TKQ8R2?=
 =?us-ascii?Q?GTklk8jUdYhPJ91qHmF2mB6gKi8Y/W7DC4Vrf4zbNuXcyhGxjopNN5WcK2a2?=
 =?us-ascii?Q?Yg/7mUjUQs3WLuiAA9igQtNySAPw+r4laevVtPPstq8L6j2hXovUNyvI3v1d?=
 =?us-ascii?Q?5Hq0uWGr82p/vlbxH6v4m3va3KGvMupzgRyh47TRGIM0yfW/zkxkmC4A8qMP?=
 =?us-ascii?Q?/5EE/N3wlfBeRJtfRiGSWCrUyg4AKW9YPzV7NrZCqX03s7SzN5s0DFNM6k47?=
 =?us-ascii?Q?kxicYalTzeq+n2CyTe0MoAO8tacdo19N4PYN1VbTADjsH99esZ5I6K3xSFr0?=
 =?us-ascii?Q?jKkHl9RV872uENEAFTUTrWwTiMHh4teLbTnxQtJn0Ff9OHqtymQ18mhMG0cR?=
 =?us-ascii?Q?uYavE2fCmgoPKelcrr/tLgQHXcOv1sQJUXgrvCngJdlPq/jIXPetmNcycUmi?=
 =?us-ascii?Q?HNQeFSeeG9fbotrhcPaov/NeBp8jeGq5uaIOvHCtz4Awg4T1AqQ+uposPrNx?=
 =?us-ascii?Q?vC/uJljE88heYCz9LFWiIMBCvGgscnDt7XC+gFSQtKMyRQG82/O7YCxp2J3Q?=
 =?us-ascii?Q?OxJ/I4y0Chl0Wm2kpZxk+H8LLK7YX1GhlJ5Nl5JCmxSwlG/m0j2rmrpxAK4Y?=
 =?us-ascii?Q?ekWuJpmNMu23mlCkTZBk5G4YObvhqImBTd94yWGtTtJB4ZmJmWhbsdgb12Ar?=
 =?us-ascii?Q?a0RY0aq/O2mlXTp+QODOctQXsJrlRkVMnQpnKG3NgzAZJsaBYoutv6WVpBnM?=
 =?us-ascii?Q?4yeQ9t0qONNV59Q7uY5CVaGIAc+3XP3PmyqM4Ith7vVhgonDw7s+q38rFKsl?=
 =?us-ascii?Q?Ady2oyjelnjxpxw7UfrxZglMfkBLApWwivy+feu/WD0yB0QVBowSlDYA5GOa?=
 =?us-ascii?Q?AjiiAjIod6o/lZGws1UvcTZ3m+gvEXVw/cxGsqOhGvbcR0i8qDjkZKK+7wws?=
 =?us-ascii?Q?Aw6unK5wP1IXRQu3F1XOtycKYkVWCGi15cYLe2KnvBe/XbZA9X0r8C6QD62x?=
 =?us-ascii?Q?QPOlYGkJ4g1liRFh0BxEgP+Dk2fpRWPFHyy8G2JXkKnRhlCFffktQZ9vsxhK?=
 =?us-ascii?Q?mCCRZGrlNL9LAadxstjgRBYx092a1zALTq9gK89eud0atqtwAkyGeDv8abwv?=
 =?us-ascii?Q?om23Js1hWXbnNM4r3EtHCvT63xTKPphhswInYElH3gXfmZ6ABH1WxwN9uFhW?=
 =?us-ascii?Q?Timv3kKE6mp30ID4Al8ZZSQyDlH/nGfxOBz+r60gBO/lkzt1xPLCB04roFcA?=
 =?us-ascii?Q?3ABiXFPVxZYqGD9s13LbIubXemKYBTEtPbc3lw8kQQsaFLrUahNRf7atR4uW?=
 =?us-ascii?Q?pc6VLypR5pcrmIVF6zTnqJrW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1948b5-dc0f-4bdf-2a19-08d90a58e1c4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:31.2671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPtCcnVmYgS94Hio8LAe97s2rY3vp86UMaCVWEGlNgO8JpiFtEXdi7/0zCkZD4aVsG35+K1dFMWAyLOB/bl0ZI1KXCz8i0kcKZvuxWpyaHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.20.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
2.29.2


