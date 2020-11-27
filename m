Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870562C6840
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:54:42 +0100 (CET)
Received: from localhost ([::1]:33386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kif8z-0002L7-Hn
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:54:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0v-0001Ah-Nr; Fri, 27 Nov 2020 09:46:23 -0500
Received: from mail-eopbgr60102.outbound.protection.outlook.com
 ([40.107.6.102]:38277 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0p-0003GS-QO; Fri, 27 Nov 2020 09:46:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYjYVsTFyznBmV/A1wG+2bm8r/rMarEbGLi6KtwJPIrxve8QIha/6ntIY8wUWXkiFFMWrNt+D6QzMSe6X98Qz/8hYn2eZZg7e1bDZkkPZYJtWE+KkIolA6L/End6vWzptYKINXU0ZJSCTH9P+LcXdLcjvOtgeLXNHbqZJ5d/YAHJ/1iWLdxGbxwPOOzEzP0ysJHKDgiNTicgccX7ccOotmo7oz8PJLA0FcLALcc8EWVgffY0FAvaciRRxNArO1zKfeVGFElhcX8yTpUwus0yGoES+sWW1G68ou6A8KEMFevTtRoZBz5hGavScniTpJtzTO8UI0QOVD2MAP/2XaAqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRaLISq4+K96L4eEq5fMQ8fSA/aWtn18cioyQDXsZBc=;
 b=KIgsKmucH8zYVBqDEzgysWS2DIBkI+rUV3DHgmGWMVpq/tHFhhQQWY0c7w4XBCXMgABk5fmXmgD5GTw9O6uutrhVvHG6UH0+RR/zIIjsoSt0fqpT6OuUs+jr7TAoaa3FgICI4Y2vMaHb9mnBIAJIh9zzzd27DK7fN1Iy2BML31TIfTUp847TCWQQBBikreRnha2jVruJsaDLG2WHApbFpz3kLLl1M5Mkzy8kMh9js8fOhIUOBb4x6iTaef64eLcbr9H2laFfH+Mhyfd0qY3ah6FyEhoiI5sAw5L3vG6VytSl4uJ0hMReek7Q48ghFzxT2z2K1Sw2wgJz9XgCQQRWXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRaLISq4+K96L4eEq5fMQ8fSA/aWtn18cioyQDXsZBc=;
 b=VM6jA+0nVdiOoL+dhRbL5lmh0RWlfiD1EiWTiYCgt2Izn6ccmWjU9QA7VyF2KvHCn8bSO9t46n3oynF9Guvjby9u3w4uEFzVch/eKwERlkNfoKo+IY8PqNywI6hedPbYoDyPn4Lz00b+Hoo2JD1wH2s01tvwhCTb7iKvEOXNe10=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 12/36] block: refactor bdrv_child* permission functions
Date: Fri, 27 Nov 2020 17:44:58 +0300
Message-Id: <20201127144522.29991-13-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6704566-68a5-4ce1-d8e8-08d892e31fa5
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5078CCDFFAB49C3450DDC96BC1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ynAPulk0yVbxFaOQdmOjQwHaY24CW/mLYDi4K5GOiea4Ln1lK4PnYE1awDvXKOCNYeBwjUOpV2vqRFJ0KDpqoq3MRp3uPELn9+/3STpEBfveu/jkU9MBOqeksVlJRmE7O4aCqyCcGzIMT5ysSmUF/MXaP/vZPV4pqQed0r249rEL/0x6Np1PiiEc+JlfXls5zVRFbHg9xmpH0DbeBXrviXVco3bhWQSRl1kKHJwVuuV5eLCRnJc2QxlEJZythyHmcIhgVTc0OOtxguInVGvCRuGdPmCuQPsqir/M5Lq0n7d6QsJ22LoJk+si9IhBKsFfDLbGXt6vcQDRLxvGlwFkPucTEhyH5moJhlv6XMBTkmhtO2Qd9RK9RasaTCa+KGQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oWGZwEhM4TtdumkJq9n//FStQfOJM+sbp3sQ3hk4JlpDxhkVc5RbZYfKPA2o?=
 =?us-ascii?Q?9mrKdph/ntZ68pvKgL/nFBfzaYFqp307NK0cQzQEZdtCVIxCuCSvDUU0mkWX?=
 =?us-ascii?Q?nq1VQwcM7cY1fz40bEO1wVtFzR+U7znq9stE3Tj+0mSuZqCAsJjFagGES4K1?=
 =?us-ascii?Q?mRQFOHjELX1nQxSMsSJlePl+/1xqVcJyngcxH/abN/rLhQ/95PCDYgmAPKd7?=
 =?us-ascii?Q?PFuGV91FC2cGCrNPIROziXXVoVZvigStONzqYUtEK5bXl848UCpR2TtmxTin?=
 =?us-ascii?Q?2VXuXo3bTOkcNJyTu1r9+000Ae+hBB86A53w6ZVBtTXCmqedDT5YiYzaeNy4?=
 =?us-ascii?Q?mp1qWuRfZm09fvlqFbNu7cZ+KS1rSDIryHeqHeEuBQ862QrKPcY/2fSi94Is?=
 =?us-ascii?Q?9Z+ax2UZHLKgmLRrov1Am1bVis6ygx4g844uksuoIAY82uz47bCfSqmRGeii?=
 =?us-ascii?Q?+w5LED8qquvFdRsGYHB6ig/iLy5IggRjdrwY8jmOQ67PRRrcA1PdKsT92vZP?=
 =?us-ascii?Q?+MKUVuoftvcWN+0locNLoPwIlmdtw+5Jnf0Dbij9S/XJAlUhDcZwqPE4HXoS?=
 =?us-ascii?Q?oIczhBF2flBAyN1Cd44GAjrjza5e2LmShCJLAsuzu+BIZzyXOCju/NUbPufQ?=
 =?us-ascii?Q?Ls/LWqX8B0w6+IqPv/XQCCsr/EHEi5sQVIkQOSGK6/h7HvVqDsViVPv5nsN2?=
 =?us-ascii?Q?FIkdqTrP2e6RAdxL5MfcjPaVyXmyOLtLFJ2tOrUKh3Epqidum0nj7CEg2FJG?=
 =?us-ascii?Q?GRA4cDVoohusn5CThT9q1UDTfHMZAoHXmJEUZbYlp2X/btXU0IziJkaUtsw5?=
 =?us-ascii?Q?KSDNJSxWkvxOKb9D+28W9rb3mM4W4b2Etu6AFd4sEnJ65GrRUBpV+oAUzR7e?=
 =?us-ascii?Q?9dlBTgUhycMR1PDtglJmTKKIIGOjafn5BVjVFWmx97MA4in2yGmEoIMwjMNh?=
 =?us-ascii?Q?aOOpbwkR1PpxTmcvzt2T1Rj/VWwNa361oQTivTnYcSDUg2NMoMb+U8IYzlK2?=
 =?us-ascii?Q?i6Hu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6704566-68a5-4ce1-d8e8-08d892e31fa5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:46.0642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sCleZ5WbUZwYPxZa75AMURvi6hP9jQ3h8nSbAfvrSLNUZda13dwDhj798YzlVExn/0pL7nIa8P1PetIydT1Bm1swsiSyynb9yqljfFbdldI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.6.102;
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

Split out non-recursive parts, and refactor as block graph transaction
action.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 79 ++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 59 insertions(+), 20 deletions(-)

diff --git a/block.c b/block.c
index a756f3e8ad..7267b4a3e9 100644
--- a/block.c
+++ b/block.c
@@ -48,6 +48,7 @@
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
 #include "qemu/id.h"
+#include "qemu/transactions.h"
 #include "block/coroutines.h"
 
 #ifdef CONFIG_BSD
@@ -2033,6 +2034,61 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
     }
 }
 
+static void bdrv_child_set_perm_commit(void *opaque)
+{
+    BdrvChild *c = opaque;
+
+    c->has_backup_perm = false;
+}
+
+static void bdrv_child_set_perm_abort(void *opaque)
+{
+    BdrvChild *c = opaque;
+    /*
+     * We may have child->has_backup_perm unset at this point, as in case of
+     * _check_ stage of permission update failure we may _check_ not the whole
+     * subtree.  Still, _abort_ is called on the whole subtree anyway.
+     */
+    if (c->has_backup_perm) {
+        c->perm = c->backup_perm;
+        c->shared_perm = c->backup_shared_perm;
+        c->has_backup_perm = false;
+    }
+}
+
+static TransactionActionDrv bdrv_child_set_pem_drv = {
+    .abort = bdrv_child_set_perm_abort,
+    .commit = bdrv_child_set_perm_commit,
+};
+
+/*
+ * With tran=NULL needs to be followed by direct call to either
+ * bdrv_child_set_perm_commit() or bdrv_child_set_perm_abort().
+ *
+ * With non-NUll tran needs to be followed by tran_abort() or tran_commit()
+ * instead.
+ */
+static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
+                                     uint64_t shared, GSList **tran)
+{
+    if (!c->has_backup_perm) {
+        c->has_backup_perm = true;
+        c->backup_perm = c->perm;
+        c->backup_shared_perm = c->shared_perm;
+    }
+    /*
+     * Note: it's OK if c->has_backup_perm was already set, as we can find the
+     * same c twice during check_perm procedure
+     */
+
+    c->perm = perm;
+    c->shared_perm = shared;
+
+    if (tran) {
+        tran_prepend(tran, &bdrv_child_set_pem_drv, c);
+    }
+}
+
 /*
  * Check whether permissions on this node can be changed in a way that
  * @cumulative_perms and @cumulative_shared_perms are the new cumulative
@@ -2298,37 +2354,20 @@ static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
         return ret;
     }
 
-    if (!c->has_backup_perm) {
-        c->has_backup_perm = true;
-        c->backup_perm = c->perm;
-        c->backup_shared_perm = c->shared_perm;
-    }
-    /*
-     * Note: it's OK if c->has_backup_perm was already set, as we can find the
-     * same child twice during check_perm procedure
-     */
-
-    c->perm = perm;
-    c->shared_perm = shared;
+    bdrv_child_set_perm_safe(c, perm, shared, NULL);
 
     return 0;
 }
 
 static void bdrv_child_set_perm(BdrvChild *c)
 {
-    c->has_backup_perm = false;
-
+    bdrv_child_set_perm_commit(c);
     bdrv_set_perm(c->bs);
 }
 
 static void bdrv_child_abort_perm_update(BdrvChild *c)
 {
-    if (c->has_backup_perm) {
-        c->perm = c->backup_perm;
-        c->shared_perm = c->backup_shared_perm;
-        c->has_backup_perm = false;
-    }
-
+    bdrv_child_set_perm_abort(c);
     bdrv_abort_perm_update(c->bs);
 }
 
-- 
2.21.3


