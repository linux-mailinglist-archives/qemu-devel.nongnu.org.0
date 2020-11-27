Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712052C6852
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:59:27 +0100 (CET)
Received: from localhost ([::1]:46784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifDa-0007vo-DZ
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0p-00019Q-JU; Fri, 27 Nov 2020 09:46:21 -0500
Received: from mail-am6eur05on2120.outbound.protection.outlook.com
 ([40.107.22.120]:28961 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0n-0003Ef-7s; Fri, 27 Nov 2020 09:46:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQrZN/pbB71AW7JKH5b3kgCWVMua+ydmOefYa4OFNUTqmNOCvtkGceF26QEi3JFD9bIaow0cuzUfAqqSpYIfE/Sombqkob40AmZsSgeaLzEQdIQrd/B2MECPWgso8tmD9KB4IvitCzbtGYzEQCbgCdKr3sCMFiBmvPAr84l656cblhjqm5gqYLQhmTLbGXtNbO4oxZHKo8y5kkIfJr3RuZt1MJset5gH0/KReXctAQHtiCsaO7AZ66mUOPmKpDmWFcfuFJvm9ps9SKhs/YpZcXzL95FFXJcmBYBV6Rmi6v/PIE+KjWkXmhlvq7AhhJHZjtDa+N9iI58Dhw21KL8eDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjEFdMnLXLT905b3EAn1qXIZV99TbXSGSGpEPzWsiXU=;
 b=VXpZYJyh4InBmxTdtcORfuAohLTF2SMSrDyQWNquELnzAdkPdgxAhmp3OtF39EXDPsnDUmiXgUNUsHIGafnh9bh+L5kz83laL6JIzfblErrj2FV3B2YBrOLNndM11K9sv7BJWddxJcYVirH6ycacMOb5xj1CGn3fVHTtI7BKqLK1lP42yrW9A5N2juEte4QI6yqehz2dnx6RSFWD6RFQN1Ci6pAtcjhvZUuW+9K7gKhTD6eVA2BAfGyte5oMRvB+o7GuBpliH2skV45u9UoW1mZEUoiJQp0zSA7sDH47oGnMzpzQvy3gt8Neiyx2fkW8lQr6+T1NdI9Tow5Ne9Kdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjEFdMnLXLT905b3EAn1qXIZV99TbXSGSGpEPzWsiXU=;
 b=akBY+o1GSYWZr4djndF2yoNkQSvogPFsPcHNgrDdwe7FL36eR9WqcqAsZnmBo5fSpXIHeCiR7UFC8uGnsKhVc30NUQ8nkxyLAMWaBEsQQ04ZLei67rNJJztU+vWEkpQOod1aax1UF1hZkIy+FYuBuKhv1QpSzo/BrGbjTCjbjf4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 10/36] util: add transactions.c
Date: Fri, 27 Nov 2020 17:44:56 +0300
Message-Id: <20201127144522.29991-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02e71819-9e86-4ee2-8229-08d892e31ec1
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50783363CA474C2714913C76C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vmappfu9h9/hwIF2HfTUaqr6GDP+hl3YtFLawJX8dL2tsMtO9V3/OFfGRsMFjWlC2kA0W6q3yaz1x0rUJ5HPcwVe+JQS5zelMENlicBl8nV7BMEed0UxUsvH0QfjVxdFf3sDFrX1f1T6naGBUo07KmDYcpj4mG54tUYna0GZIFQpDZXinBkPKni49FCJRU9rqbxEg3FIRFklM23f/199EevUFPymNcXRqGqpxYNkHbYUQJfoNEtKNu8inxAqdfEmtF+Rd8ML7l2ItKITp0b9KZyFtVg2MvObrP8D84Xn3Xprr4J+nEF8aDmCDSdWeXopNzqpsun9H+d74uPYgCTh4uFBn0UVq3kLGYupHqP/hk3uJuDHin7g0IFKUF6ASDzYSlIDdPV9NmALdjhYM26gjit5ongbtLhXtKw1Lf6/K4wKT0XOmU+4YMLuEr4wcIBc0H8JL0drnP3vFM93l3uyW94fG64gTTJT1Ss9/D+XWRs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bLeCXm7c43SkONPVEX08B/HqLOdqiLXHPAnS9cWUeStsXGH++N1sX4WVRWBu?=
 =?us-ascii?Q?QSajGDWrG1AatMAi8FROu2WGa8jjnoJhuepgxVZDG1Pjvs+RD90mKqtsLuWh?=
 =?us-ascii?Q?HWwFhracQHQA7m+YtMvCwavUV77H+AU9ktUfu5JiZyfpBszKPXoimaQ2Z+gz?=
 =?us-ascii?Q?wVqip55i+oHQJfll7ZW+zveK+X4ibrj5ql2HRkDXAnHG+dnTyZnGa7kf3VNT?=
 =?us-ascii?Q?3MgxRa8ArH0Z3xtvAYgw5hzgmnrUWXVUpz1vCwlMpnVoooXKooqqJhpG9jcA?=
 =?us-ascii?Q?/9dYYPoDtWw5PYhWG+OImbPA2006FdFwvXudGyoKqBrrtwGwR8paeDhJiopP?=
 =?us-ascii?Q?40XnA4zc5RoNyTuADWqt1zkAVvGcnYxvK+aV2/8DK6nIGP72Nqa8/RJTl8Y0?=
 =?us-ascii?Q?Od3bIFDb3OSmsatEMxuV1PheB4pVyw/agY3NVStpZYc3+loSEWTPg9wbYe4b?=
 =?us-ascii?Q?LuBtteoWpHdC1jlYdKMwuVKh2VUhvHrznFs6QNVhTfMJZqoHgMX2RMlFrZUq?=
 =?us-ascii?Q?AzhkFLy/Yo9Pt6Spt0b4JPw7olMxpm/JeVr8a4PCx2P9VPjD0HxtO3rUJrP9?=
 =?us-ascii?Q?oD1bI7FKh5zmsQWXukv3lcCFrh99MDV9nuNfdE881bpDGvRNQ3DzopJBKLWe?=
 =?us-ascii?Q?JLUTSEJ9akjg4r5znCxn6+Q8WLcGaTicB26NK3iF/0RlooRYSj3wcjo+ntok?=
 =?us-ascii?Q?bY79s1CoCa+o1MycL9wHkOGCLRnRtXUi6uhVKGf3CYJMNTcmUljeh3DLRB5m?=
 =?us-ascii?Q?h0zwVqW3ltXVV9fa5bKC1qwJx0Gv3z3XgzJgklBDMRFhWN0lNsQ/V2GxnveG?=
 =?us-ascii?Q?berULNHPVDWnqzZRahh3aCwC/n35D1Z+8LzCYlHnQPTjtFrmHRhaZ9f8s6bO?=
 =?us-ascii?Q?6VwfIzS+Rnj9uoKu198qHMKeaxnC3jJDx/NeNVm8WKCm1uCyo5p6B4D+ZvhD?=
 =?us-ascii?Q?bnvqXct+y1knG08L2gebAkjl0FuFxC1lA+iHHYiHOorZHjODtouyumHUGymz?=
 =?us-ascii?Q?AkD/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e71819-9e86-4ee2-8229-08d892e31ec1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:44.5688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0V91uG04FkDXLY5aX+BZBoTLRUupmLIW8hwZRsEZF7SvEQQQeYUgGqO1exps/4v+IfXTdl2GOlHlD/Uqx6t8U2rWl6knYy387X38SWC5oII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
  which is prepended to the list. So, driver struct doesn't include
  "prepare" field, as it is supposed to be called directly.

- commit/rollback is supposed to be called for the list of action
  states, to commit/rollback all the actions in reverse order

- When possible "commit" should not make visible effect for other
  actions, which make possible transparent logical interaction between
  actions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/transactions.h | 46 +++++++++++++++++++++
 util/transactions.c         | 81 +++++++++++++++++++++++++++++++++++++
 util/meson.build            |  1 +
 3 files changed, 128 insertions(+)
 create mode 100644 include/qemu/transactions.h
 create mode 100644 util/transactions.c

diff --git a/include/qemu/transactions.h b/include/qemu/transactions.h
new file mode 100644
index 0000000000..a5b15f46ab
--- /dev/null
+++ b/include/qemu/transactions.h
@@ -0,0 +1,46 @@
+/*
+ * Simple transactions API
+ *
+ * Copyright (c) 2020 Virtuozzo International GmbH.
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
+ */
+
+#ifndef QEMU_TRANSACTIONS_H
+#define QEMU_TRANSACTIONS_H
+
+#include <gmodule.h>
+
+typedef struct TransactionActionDrv {
+    void (*abort)(void *opeque);
+    void (*commit)(void *opeque);
+    void (*clean)(void *opeque);
+} TransactionActionDrv;
+
+void tran_prepend(GSList **list, TransactionActionDrv *drv, void *opaque);
+void tran_abort(GSList *backup);
+void tran_commit(GSList *backup);
+static inline void tran_finalize(GSList *backup, int ret)
+{
+    if (ret < 0) {
+        tran_abort(backup);
+    } else {
+        tran_commit(backup);
+    }
+}
+
+#endif /* QEMU_TRANSACTIONS_H */
diff --git a/util/transactions.c b/util/transactions.c
new file mode 100644
index 0000000000..ef1b9a36a4
--- /dev/null
+++ b/util/transactions.c
@@ -0,0 +1,81 @@
+/*
+ * Simple transactions API
+ *
+ * Copyright (c) 2020 Virtuozzo International GmbH.
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
+
+typedef struct BdrvAction {
+    TransactionActionDrv *drv;
+    void *opaque;
+} BdrvAction;
+
+void tran_prepend(GSList **list, TransactionActionDrv *drv, void *opaque)
+{
+    BdrvAction *act;
+
+    act = g_new(BdrvAction, 1);
+    *act = (BdrvAction) {
+        .drv = drv,
+        .opaque = opaque
+    };
+
+    *list = g_slist_prepend(*list, act);
+}
+
+void tran_abort(GSList *list)
+{
+    GSList *p;
+
+    for (p = list; p != NULL; p = p->next) {
+        BdrvAction *act = p->data;
+
+        if (act->drv->abort) {
+            act->drv->abort(act->opaque);
+        }
+
+        if (act->drv->clean) {
+            act->drv->clean(act->opaque);
+        }
+    }
+
+    g_slist_free_full(list, g_free);
+}
+
+void tran_commit(GSList *list)
+{
+    GSList *p;
+
+    for (p = list; p != NULL; p = p->next) {
+        BdrvAction *act = p->data;
+
+        if (act->drv->commit) {
+            act->drv->commit(act->opaque);
+        }
+
+        if (act->drv->clean) {
+            act->drv->clean(act->opaque);
+        }
+    }
+
+    g_slist_free_full(list, g_free);
+}
diff --git a/util/meson.build b/util/meson.build
index f359af0d46..8c7c28bd40 100644
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
2.21.3


