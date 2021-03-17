Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B91A33F3A0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:46:18 +0100 (CET)
Received: from localhost ([::1]:57784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXRB-0005vD-CP
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHd-0004VQ-Fb; Wed, 17 Mar 2021 10:36:25 -0400
Received: from mail-eopbgr60091.outbound.protection.outlook.com
 ([40.107.6.91]:41454 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHZ-0006rZ-Rk; Wed, 17 Mar 2021 10:36:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVgaz57h9x0tFHulLSrV8ty/ubwATZ3JhfvUHFCfJsFokdCKpUeYT1fxSKHa21vLlodzSFIAK8U2tCrySa4LgnB0W+UjzI1eyCoL8TaOkJ0g2nf28tVMPJWggKiJdAmtB+nFcZpsW4hiWFv/ceH4W65dZefL2ddXXfVhMJYVBhJjaXXoeyPnrXsdvvpaBljnQKz3eYFBT7FPF1HnQdysBZgv29DRZ+prAolGjx9jgVEvsGnXbQS0Ww8157hAil1/uZvAM4tNhd3YJHdkYneFup0jXZhS03vSeOsDhKe5ZfnyYnn4+lHLgBxGSt1IH+Oyg1BbcG0kTP4k6hUiK+Nk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38KeW3Z/OP1AkNBh5V4c4IuqPMb+O116Yw2N5E2fwLA=;
 b=bAz3aDya4ZQqCuT4V8Ts/hA5Zj05L85o2305lBpl1Y496Q5L8ExWBdpxFSADG5FyBQ371GCNIkO5g51+e2zO2EVNIW94QCdOq+tExH8X+aQcnFD99XTnCL8M16KCbvMKvkXLbzFADwIgHU9LlfXr2FdadLHRKSLmWFmCqacjWcyG4sO8edD22ZZKc+WSJjXPdK3M+4xkpzBq8aZrpkkv2nR2X6BsWleN8D+chiuiM8EcR4WBByMtSaNqz9SrVDSfBDlgr6L1JCVuWctGXbNxpqn2QZ9bhzidkst6AETunje84Ps3jMQkbo6GDMei/CFIQdu7/O/3LmCLWkMe0v/tWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38KeW3Z/OP1AkNBh5V4c4IuqPMb+O116Yw2N5E2fwLA=;
 b=WXbPUR9yN/qReBHsN4b6pOD7AmO43q2fkKYr7TrNfwo7w7g8BUQGED1OdsKYpmgp6+sNOJcWTbAomcqehxwj6wPJDABqKsKDSZh83Ad9wDiV9HmIcnLgwo+WURRY2AqPj5MxMD1n9JHgS4j4KJsXEU/kAzj6sK3aCrw8RV7ory0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 08/36] util: add transactions.c
Date: Wed, 17 Mar 2021 17:35:01 +0300
Message-Id: <20210317143529.615584-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f49f786-c9ca-482f-bcad-08d8e9520420
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB354493726325E585E470DAE4C16A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LUKpOvUwoHertijUo+QAvz//ZZKfZyt/7uOMxbpwBBZmJW4SlbLFa/aVHDlPPbOdzkSvxLad6LYvmwJ9tGC/TO24cu3i4HhOImlWpTKvi7xDdfyhLAWGt2g4l4gMrwgS5Dg5bOhEIUN0PjoCkar+sBw0VzACe+wFQHiuOLpenLyojx/0HTmhoCEOquWFWgJwzoR41UhLsE/Cs1U7r2erPF5kNaBW1plSH8H2aMSJ+KIEYJ84D4wWIR6+cmsXS/qHQINeHaMaXJ6/j/cPUn6V/+I62UCjaZfRmTObRXPWUTBtUJGuVbz+RvMSXNndfbr/GAzE/f9oFQk59EjNU4smYCerbLaQNJf0pFPanYev1o7+Ikr+QIGQMdeIZMNgxXe5G68zfGr5hb96thHI3QKQ7T2IoPfdlssa/5M2hOnqH3c32Ht/inPXN1Iq76+XgzMZN1l8fDF/lSFGZSUKza0MuipypU/d9/KrhHNRbFLVlyI//kzVNHlKODeX1hR3Os5Jir/zPWLsmRHwyIVOJ71XTalUHZOdQmpMYmbtlNa4G4/Mjz87oCpprqMc06Ie9I6aKfxnTxAhZaTB0MEZMkmVqkqduYovJMjuNWP3Xt+Oc93zGweXBNibJKSg5juwY8pz20dI2nR3P8MMdl/HLtzyHkJP1pmttsXU/e/iY+DfKFK9JQxX0kTw2xnfeerw9z6E+5TXQ7QUFqLGke94LksW8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(186003)(8676002)(16526019)(26005)(86362001)(1076003)(52116002)(36756003)(6916009)(66476007)(6506007)(4326008)(6486002)(2616005)(5660300002)(8936002)(66556008)(66946007)(83380400001)(2906002)(478600001)(956004)(6666004)(69590400012)(6512007)(316002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Wsu8OwrH2ntrRxWd2v7T0HZzr6UleWRab/xX2/gi5Sak0RNx8mVNF2i3OHJr?=
 =?us-ascii?Q?umascsr/lucfXov2E6n8+6X+1UsObsS9wIgMpOQ8mFbaxzHGVNispbDu0df+?=
 =?us-ascii?Q?6eXiYTZie7Z6CeudDJBhNzKgi/GbwgNGDZEuqowEZMjdwDnFIjuEKNKVWxRf?=
 =?us-ascii?Q?W77CwOFZ1r9rC+zVDdwZaXHnzDkB9APZsm1j7GIQbM7iYxzzsRzt+FkyXSOt?=
 =?us-ascii?Q?M1kibBGPB62+KlY78pxS7PwPGiMW+PtvcLlpjZl0UF6flCsAaQoVoRdj7fLV?=
 =?us-ascii?Q?SSSXBJftzlDc8W2t99TT2SF+b9Fir5UrEVfHPkTzRR8FB8tsQheDDAT62XFd?=
 =?us-ascii?Q?n5TmDE7envOcl3Ppleid6s+xbEmM52qpBrWPZ6vsIcbGqufMZsewNzRmPWWv?=
 =?us-ascii?Q?Q3FnJUiglYfpailNdw6JMGzbrRheIYQNRqY7wS+e24K/7aUXhfORtbIXY2KG?=
 =?us-ascii?Q?WYfe3wXs9cf/qVmTj/lH/8iDRInOWjgbq1KByWO8Dalaq6720k9Btbmi8Pf+?=
 =?us-ascii?Q?wax+2is45doVWWBYubuuuA78XggwDjYcc7eil0AFrkN/CQXrU25go/FiG0RL?=
 =?us-ascii?Q?ghWuZdieHylyQwGUbMeBDUAu/xckOx7Eb4stHpoYOsAj5RWhTsxQ/Ac4PHce?=
 =?us-ascii?Q?1H/YL2xMy+LfSbvLuIXgwkNbQ3njiTnARI4bCN31eQyQxxbU4O5QwocKY0Bj?=
 =?us-ascii?Q?/Hi7GAIO4iEP3sAzIm+alSTzpxihPSVWBE6qhRzDhfSq1cxhO3gK9pfHkwIZ?=
 =?us-ascii?Q?IJx8QP/6BdD+s9w1yKXJYAQ7e5/PcxVr0nyaU00Hw/fIDy4qjKKqLs9SAvEW?=
 =?us-ascii?Q?2dv3zSzPvaI2ud9HrBWUxF7WoqMdCBenXCaz4Tm/fpTGABaCSpG4XPKICUot?=
 =?us-ascii?Q?zjgT3gHGms1QfRTcZCWrYaSZvq4M0yEVnVVQhiXBukSQvrzpDsbVXmVb7RrC?=
 =?us-ascii?Q?NOxFuBfUozuEYesn32reMpt1WBsPQOJ45wiaNn4mVT13cTMz8Up75U5423nL?=
 =?us-ascii?Q?pG9HD3R2OCalM16lkn/QCoyLph5JtX3lEfo1jLdqD31HVQ7+YpFQmlVHHmv/?=
 =?us-ascii?Q?1PBsYY/XrUmKwQzsfzfxC/8yURmOeaVzFgHo5XGH+6vd2Uu4kNMtUiwizEX1?=
 =?us-ascii?Q?jQNyjgcgJhW374JDPAUxvJuzvMmS/SlsF+hlxMv99svvVzmkC+i+9C0LeefJ?=
 =?us-ascii?Q?DANzNksFwwLYO6WVAtzx39uUaYlE72shby8Q+02V/cXHS8/m+uvTKxdfdpX1?=
 =?us-ascii?Q?IeP7tIqdt2sDv7dlGkq1tK+wuKsEBpAB9JpPMPEW0ux6EL3zY1yOWdWrk8k/?=
 =?us-ascii?Q?17NPVQ6o922MTvp7rxAOMZKk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f49f786-c9ca-482f-bcad-08d8e9520420
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:14.3648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4AVnu6rCu76ql1/iAEa1Ack8zB4eNcm0So2U2qD25kqyKCKP/jxgdQZSYv+JtvLqw8DKewRL2Db0pdJZeCXqJqwY8zT4LrksbP5Zejq8vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.6.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 0000000000..e7add9637f
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
+ * Than, when you need to make a transaction, create an empty Transaction by
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
index 5ca3c9f851..d5e6ff2224 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2514,6 +2514,12 @@ M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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
index 984fba965f..3c39631bfe 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -41,6 +41,7 @@ util_ss.add(files('qsp.c'))
 util_ss.add(files('range.c'))
 util_ss.add(files('stats64.c'))
 util_ss.add(files('systemd.c'))
+util_ss.add(files('transactions.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('drm.c'))
 util_ss.add(files('guest-random.c'))
 
-- 
2.29.2


