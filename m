Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA82DBB30
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:27:18 +0100 (CET)
Received: from localhost ([::1]:41638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQHN-0003F4-Bi
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ81-0002ds-G7; Wed, 16 Dec 2020 01:17:37 -0500
Received: from mail-eopbgr00134.outbound.protection.outlook.com
 ([40.107.0.134]:2800 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ7w-0001G1-6j; Wed, 16 Dec 2020 01:17:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxR0+g+CZatUXENFp+WV2w3/i5O0pG+Yk7zYUfrcmQS5YBrErasB5gyC6K4WItXT6ApsBeFEznftTRmUDPy8ANnV3HfVeQN4f4QmNhrh3wUPMpiJoL+GIVMyWXNBzfMxKFqC90RgEPHI/fpkmRK/BTjRJ/kZqOZBSQaorKGn0eoXjNJtHjqSrtWmlZlAdWdWGhykEbjGr+n1yXu3xsqV/U+379tcvEUcxDAGTWAnIagl6SAWiEIzM8Ej/wI7OL+uxBxLk7j3SociEEhYVJm4ulgnX+EhvDnPtJsYaKuobSLV4HsBwzn+2ObC711THfFLrS5lWgr4A5K0wL8jGHi0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6YVmnt9CqAhz6txSmyiUCiEqwEwFbJuqX60R09fycs=;
 b=WwIYih5oi7sLubJe7MO9s5TWBwvaXNRFAzx2Yc8sMxqQ4MgcqbSqhXW40M422m9UQzVFKLI6grSuytNj3t7Tpc8Qm5FkroWJXJx7RdH0k93AH/LEVVuE6ZU40nRHVWjnHdNSWqCBhej3UuC/qkpH4dDxBvovzIpg0VgIa4bb+FNom7EWbJ/dPiCyXgwaUP6anJGksM/aWCE18z/akTp5HQz/JdsB+sPwc/jQtax7oaOFLXzVKGkNMw/2xB57JcdLXyPt3ZQ8cJnJi/ZyamFV22V1UeQNUmENo6OdFVexJBKHNxJMZjA8c6YSIqJVKKyX6OobvrrT1L2NkBNj0VA9uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6YVmnt9CqAhz6txSmyiUCiEqwEwFbJuqX60R09fycs=;
 b=vkwIw9D5D0UH8vfe4I6tSysnHYrxixGaeULAFdhRycCJJiymeRjtoNYLgzrrnI2vh0oe3syO53ubRAk6o/w7RPOdAcl8RXx5fYr1bYW9UkNxrTMbkiYdqiOq4gLqBa1M9uygbPPjqN8Q88p9h/bzzxz8Fm+/AwQeoD+Na5QJwSc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 03/13] copy-on-read: add filter drop function
Date: Wed, 16 Dec 2020 09:16:53 +0300
Message-Id: <20201216061703.70908-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216061703.70908-1-vsementsov@virtuozzo.com>
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13368b52-0d89-4994-045d-08d8a18a3e76
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63097E10E815DE115DF9CCFFC1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YBqTKoDPzJsx00IjsMei1QUPH7LkV+NCpBMR7s+qIzNrVyx4cTmPS0HpSFtCLJKQwXmOQ6rLmhBLZ9nCb1nVaQzHKagrpwmVHZPnFFnRW6bAoPpowBBHZZJXpnVs53u/N3gZoeiOhp3XmqiEjGazrNltcFi85CqJDyzOrHDecnKvtRpBH195/5PvaG0Euqg656YJzVg/DuupzoFsItaP5mQ5fhVWQ1IL4mqp7imtvHfZLgmHwwFhtdI+YXyyAjkRdoivhDr184QfpyCOoBdbC9W/ZErhJaRM0yQ0+aljDP8F7vDVGuoS8QOWgflYryVq6Zp82Oy55GlrqmAa3Gs+nPRnLa/Obc/TbC8B/mXh+aEZNBvw9DXjXQiYIPLRYNYfhIoV44SZXqP1DtVKo6BeS6gaGNaXV/xTmvZs8U3DqmUbRfKumnMn69RhvOyk+hd6aU9raPlY1od4fwKz3DvCGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(39830400003)(346002)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7y8CoYb33zkKz2S5uqj2uqe1Hpb7hKudFfAaM5pCSQCbS1wpIKF2ACLPIRdW?=
 =?us-ascii?Q?q2D5LlZoW2x5PQ0roa/ThWM1fdqL0NnPAmUlcXeRSF4njS6H1xK71Leejfr+?=
 =?us-ascii?Q?UrWft3mdcaEfQhdsbGhJGxAywPJ7/FvPTNvaUBNF4eQzrH7jPilUfAmTu0mP?=
 =?us-ascii?Q?Z2j3z7tiHlmoYnH9A+EBp8NKHJqr7iO/A+PU7713nTGjTZS4iEb+09tDZfrR?=
 =?us-ascii?Q?xILP4YrjLXHuTJ3jIFDK/pCpvjCV378FWfAtepwJRh8DTXHh9v71dUm3N9/D?=
 =?us-ascii?Q?PDYweqHFXcDDSXCpmkYZ98ll0foQV60U5LoSE4svVZb3tHudjSFgnZ/porDt?=
 =?us-ascii?Q?NNbNpIKpjvAnu2VEs6gzvX/+eYqaLOtqi0IEsETx8mff4zf7MDCyZ3y7C3O6?=
 =?us-ascii?Q?5gIDUl4Wt2D67sGs+SVpOwofdpQ+SgP2X+qunHbf/FHK/1W2RI/1Qj7ONbM3?=
 =?us-ascii?Q?Pth4n8+viQKVcAYvq1hWDyHqB1OsuMJpkn/a92BEapHXALt+on1L0YvCbNZ2?=
 =?us-ascii?Q?/ZVbcpRoZ+1kJAZxhbk6Y0jXvA1RB7E+LYxzAZzDwss+cLETX+dOW8hjgLNc?=
 =?us-ascii?Q?g/yVy479QVWtHNWfrvk5zq65LKG0rT5TzsMCVuwev0/6lab6oV6EaHSp2TMr?=
 =?us-ascii?Q?7uktelsIrFyl+4C0SVMpcmux13pUddpPg2UAvu81iEfxWcRhn0vfZitzn4wp?=
 =?us-ascii?Q?J1FZx1pG4Iw/Moark4CsrE5A1Zqf6c6o4TVCTC+4vdai68HR5t5+vxz42xsf?=
 =?us-ascii?Q?hfg1aVTR/VxFEkJVlsl/OdswHyCfJjTOCC6jOOMdr7w8NBVS4WFWT+PKci0w?=
 =?us-ascii?Q?9Ool8OD7Mmh96xF6IBDJYGb1WwSOPQwN/H5FaJ6EeH9+LNB+N1CYr50WBR7w?=
 =?us-ascii?Q?sJqcH7WXeTHPN/kyEkFBc2FgGAQQlYOTlqBBrlQpoKPI/nYwCeXq6mTaOVwX?=
 =?us-ascii?Q?dIWSYGXpSBJ5HKAwrhsbVOrRO5hKsrWNGAPnGWs/AfjH+/qiHbCnCV28yRPJ?=
 =?us-ascii?Q?rhsa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:19.7828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 13368b52-0d89-4994-045d-08d8a18a3e76
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKXRB0kT8rJejgHySnijcir7NE5fF1lZpqyK9M3PykbMBuykVkAoyWCekVIscVEHzv08KgwvK/B+nx4OHpelDlvQ/V5MQ7ah6iloWBIG1Vs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Provide API for the COR-filter removal. Also, drop the filter child
permissions for an inactive state when the filter node is being
removed.
To insert the filter, the block generic layer function
bdrv_insert_node() can be used.
The new function bdrv_cor_filter_drop() may be considered as an
intermediate solution before the QEMU permission update system has
overhauled. Then we are able to implement the API function
bdrv_remove_node() on the block generic layer.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-on-read.h | 32 +++++++++++++++++++++++++
 block/copy-on-read.c | 56 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 block/copy-on-read.h

diff --git a/block/copy-on-read.h b/block/copy-on-read.h
new file mode 100644
index 0000000000..7bf405dccd
--- /dev/null
+++ b/block/copy-on-read.h
@@ -0,0 +1,32 @@
+/*
+ * Copy-on-read filter block driver
+ *
+ * The filter driver performs Copy-On-Read (COR) operations
+ *
+ * Copyright (c) 2018-2020 Virtuozzo International GmbH.
+ *
+ * Author:
+ *   Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
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
+#ifndef BLOCK_COPY_ON_READ
+#define BLOCK_COPY_ON_READ
+
+#include "block/block_int.h"
+
+void bdrv_cor_filter_drop(BlockDriverState *cor_filter_bs);
+
+#endif /* BLOCK_COPY_ON_READ */
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index cb03e0f2d3..618c4c4f43 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -23,11 +23,20 @@
 #include "qemu/osdep.h"
 #include "block/block_int.h"
 #include "qemu/module.h"
+#include "qapi/error.h"
+#include "block/copy-on-read.h"
+
+
+typedef struct BDRVStateCOR {
+    bool active;
+} BDRVStateCOR;
 
 
 static int cor_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
+    BDRVStateCOR *state = bs->opaque;
+
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                                false, errp);
@@ -42,6 +51,13 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
         ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
             bs->file->bs->supported_zero_flags);
 
+    state->active = true;
+
+    /*
+     * We don't need to call bdrv_child_refresh_perms() now as the permissions
+     * will be updated later when the filter node gets its parent.
+     */
+
     return 0;
 }
 
@@ -57,6 +73,17 @@ static void cor_child_perm(BlockDriverState *bs, BdrvChild *c,
                            uint64_t perm, uint64_t shared,
                            uint64_t *nperm, uint64_t *nshared)
 {
+    BDRVStateCOR *s = bs->opaque;
+
+    if (!s->active) {
+        /*
+         * While the filter is being removed
+         */
+        *nperm = 0;
+        *nshared = BLK_PERM_ALL;
+        return;
+    }
+
     *nperm = perm & PERM_PASSTHROUGH;
     *nshared = (shared & PERM_PASSTHROUGH) | PERM_UNCHANGED;
 
@@ -135,6 +162,7 @@ static void cor_lock_medium(BlockDriverState *bs, bool locked)
 
 static BlockDriver bdrv_copy_on_read = {
     .format_name                        = "copy-on-read",
+    .instance_size                      = sizeof(BDRVStateCOR),
 
     .bdrv_open                          = cor_open,
     .bdrv_child_perm                    = cor_child_perm,
@@ -154,6 +182,34 @@ static BlockDriver bdrv_copy_on_read = {
     .is_filter                          = true,
 };
 
+
+void bdrv_cor_filter_drop(BlockDriverState *cor_filter_bs)
+{
+    BdrvChild *child;
+    BlockDriverState *bs;
+    BDRVStateCOR *s = cor_filter_bs->opaque;
+
+    child = bdrv_filter_child(cor_filter_bs);
+    if (!child) {
+        return;
+    }
+    bs = child->bs;
+
+    /* Retain the BDS until we complete the graph change. */
+    bdrv_ref(bs);
+    /* Hold a guest back from writing while permissions are being reset. */
+    bdrv_drained_begin(bs);
+    /* Drop permissions before the graph change. */
+    s->active = false;
+    bdrv_child_refresh_perms(cor_filter_bs, child, &error_abort);
+    bdrv_replace_node(cor_filter_bs, bs, &error_abort);
+
+    bdrv_drained_end(bs);
+    bdrv_unref(bs);
+    bdrv_unref(cor_filter_bs);
+}
+
+
 static void bdrv_copy_on_read_init(void)
 {
     bdrv_register(&bdrv_copy_on_read);
-- 
2.25.4


