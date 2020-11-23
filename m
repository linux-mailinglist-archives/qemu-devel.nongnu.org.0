Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8032C158D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:24:08 +0100 (CET)
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khINb-0005EB-5M
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICw-00041w-FZ; Mon, 23 Nov 2020 15:13:06 -0500
Received: from mail-am6eur05on2106.outbound.protection.outlook.com
 ([40.107.22.106]:21121 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICu-0007NS-6I; Mon, 23 Nov 2020 15:13:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4J+4tWRdcpH849X4hdTB+ydUPcV272HK+YMXiAc696SoSCsSCYXmiWnng4hrLKGRPqhIi+IBU/Avdxpmb8927TFXkuEk+TIvbvQrBU7Fap6PQXiXn1ZQb6RZWkWNgug8kVOFBdfqj5gLpErdldbvLsx+W2AblVlfLpGefYbPhu36G5QXqaeRZ1oITFTAoc/Bfk3fx/JRyECK57+eys+ASRHu59eaVGG8xOrQz6uOcDId8PLEXD4roqifMUesLu+bX6X19bdtHNDA0mRzqzyS8SFI14n4R29y66AfmbMO9InSwhh/UYIa1HO23ubd4vjcRf+uss2SchAgjxGNeb1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/F4rxbNHyaITdJSM/s/2gRfVFUABqyp+LzyoDzuihvg=;
 b=kp5rYVdgBu1TrmLcvj/bD39di4FnperZbC6+Ru2nShr7DbYS0tJbI3VLO80scHsUp36gpXy4eRZivJc2ITR9sUtCl64tG8wa+4PImCsfXQveXrAZlvDd3NlkvMIbnfjLuOJTfPi9HKh8uzQ9KtPyQh+mqZ4pvVv+iNaAIIpytpkQ38rAZDRSbuCiHs/I7NVWjQg+s1sz8GKhcexxYKaXSjX2u26Vgu5uM9fbnJqAqRao9XuI9GrtAA4TYq9srGXjMsFSb7wyirp5A0dZ5MjaFclO7N44M4PwYNSZ5mOW865oukxQgfewn7Zkk4uCe0/9WUufyUqmAzUMOiwYYiazPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/F4rxbNHyaITdJSM/s/2gRfVFUABqyp+LzyoDzuihvg=;
 b=QDKdoB3vpaPlgFHNsWCA+CgPzmJgJzsghG2TmDdCvFlf5d9u2dyOzbb4U4A5hknPxVG3cjJ9dm6LZhbVyVKD6IVCUjWfJKSCa2s1dv5HwHwSuLIiqhjYBGKRsxbh1vlq2xrDramtuV8CFqnhszYKZPaytyTpWFJFUSNPMhNYdQs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:12:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:12:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 03/21] util: add transactions.c
Date: Mon, 23 Nov 2020 23:12:15 +0300
Message-Id: <20201123201233.9534-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:12:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3565cb70-d264-4694-17c1-08d88fec28ac
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46909D4034B2AD5AFEB1BFC8C1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 14YqtUftCAXwz+TzXzLnMLXl005rgnC+r2Ngxl3QWa94iTE8ZL1dybMnPgcdFDNi+rAvgvzddSQg/GFHAba7gZzHO//1QyYbnd/LBUEjZk1iPS2CG2YsDlpRjq1aieu5aIOG2hWx70Exadfxg4IbD12GQQr4CARyK7UF5G5W7pzRZSqAWISQf9x+vFkTscUZAqibeXg8VmdDi6w20fmcOtsWZ8aFrD4Sud2mekvn1ujLaHClA1FwnvIAhP0zw+k4Xbela58yiwVtIRUarhL9lUBx+zQCISc7KpBRhAWZZ0d6CnCMO3kqSW7T1LECu6rLm+RmLLkuUlBiv9CQeGedqyTz13XJ2R8L68XU9BFV3W/nm+GI+Hc78RJaRDvSjE4hDU5gfkLzN+2mSk+pzM///YCn1PxFlY8aTHGGxkBDfY74C2RXX3KX2TmCkbVjGUjEYYCrYSJgL5g0WAG7ksvAXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: baEVs7mviz2Zzb6YIFTPLc+N7oBQHHaBIGSJUK8NT26ZCxEE5JfTycA+ziXa3stQCL+ON5qzMv3yFZgFoyRIwrcMyyjpSJ+3CvmaynC05ZDySlU7G9iE5YMKieFpkQh1NP41nAEfSgNoolluJDWHXGuQerELq5AogrWcM01aiP4krZ3RJxwh1issXd6CMilgdvh4R6nkItdidF0mUZ1PxEahYG85UQHuqPfvQczxW/6VWdzR1FNOhEkBu3STXCGth+Rgg1XxmbGt65CbD56WpurejWHY4IM/Xh4M+TYXQkPij6FWMgZWfMMA/RwILsCfDxI8RshZSu86AGml/tmM6QMc/RbOKKtL9+X5UyUvfgK6mM36cQkO6wObWpN86inAIs6D3EJT3eqvO11XmTWaxE8+hp3kU6GHDfnv/Z09I65IElaAmxkNPLntsTy2PXZB3YtftoMYPbgW8v8YVhhnkRKL4oU0N49/VvtcgkF+Z1L8YL+UgQVpA9dT4bmj63XbyFckvgwc6WrFRtAbwPdKOs9H/KfU/j+DFddY/LYBSSo7gnLx9ydMwnxo2xSyzGDwCPi1srd+xIQTZORYbOhiAwA3BmGWdWqQb5jk3CCE9kLQtfJtIIBFFQjaxrTJzj4K3K++JDCAwEgSi7+4BJKPR6XJVPCiYXqb7Osyb1O0gQVA7fivqrVAC8FDRaF5ZYE8VE89VAH4g6ZzirrNG8KF3MWXTKlG7J/NpF8q+10proQsx2j8myV3p2FygSCSQuzpCe0FUl0RfZeUFxVnMcbxt9aE9OKH+qZuIeh5Hub6qXT97Ja/LTn7z6CQffdgGzvBsiI/kWJCwbRnP2IIAz3CN0rUKvYR2kzr+z/t1tt55rCxTJK21I1dEU1AdadqXDKQU0nkK1azvERcSCr8Uyi1dg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3565cb70-d264-4694-17c1-08d88fec28ac
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:12:53.2118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6emYRQvzF3jxwfh+G8aBIzPbXqmdiqDU67nmI8p7hg7dEUxNRX49ftHfEkRYlO7Y0wiFfn4+ZEcopTFuoroBo5k4QfxuyC5s896xPgC5Hvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.106;
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
index 0000000000..db8fced65f
--- /dev/null
+++ b/include/qemu/transactions.h
@@ -0,0 +1,46 @@
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
+#ifndef QEMU_TRANSACTIONS_H
+#define QEMU_TRANSACTIONS_H
+
+#include <gmodule.h>
+
+typedef struct BdrvActionDrv {
+    void (*abort)(void *opeque);
+    void (*commit)(void *opeque);
+    void (*clean)(void *opeque);
+} BdrvActionDrv;
+
+void tran_prepend(GSList **list, BdrvActionDrv *drv, void *opaque);
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
index 0000000000..845d77fc16
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
+    BdrvActionDrv *drv;
+    void *opaque;
+} BdrvAction;
+
+void tran_prepend(GSList **list, BdrvActionDrv *drv, void *opaque)
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


