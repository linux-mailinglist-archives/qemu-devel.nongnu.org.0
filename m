Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD423DFE39
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:42:18 +0200 (CEST)
Received: from localhost ([::1]:43410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDPl-0001tH-0K
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMP-0004aL-L7; Wed, 04 Aug 2021 05:38:49 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:35908 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDML-00062H-Hh; Wed, 04 Aug 2021 05:38:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvQzM47CXL7r4DJSud0ezg/PTL6QxHgM7pzY9idcRB6lvNzkLWFq01yp+Txa8nfBLB4zfYJqQFpSE1tAajjEuJgJDNjW3kVNGhFMy/YmPbT9TmVTcdYmjj1sbeVvvVVIKM4vNGlt2bmlPOeMjk/tp6pn0WV/+3K+s3Ckygtz1LMj6uOJj+L9YwiZtt4cuezfCm+Y1ps5MOu9WB2/gZN7AUpJJ/hnyQC56wCTFkJadiXHip1x9G0tFiQzfSBiXd8OjlGLpXvftmTQaWQlHoKG9CUV7e1gu92YyAJjL1okdxzVvmiphhSpdHYV9hDJRBBRVDlIa2XmSZyLNld63tjqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36/DWiO+N5VXBIu5x5B4Szbv2gNyhHZNxBrGnLACR38=;
 b=Y5f/iLHWgCflzNj4FFpMUpE74VjbCuldkOR44fxU3A2961yOnkZlTO9gPfQjVs0NTytZ4u5TKH5GQad/i6jdQQmf4qbwuXZVq6hSnYsWpePP5Oj5+RGmNJ+0oljHbLlzROhZL8zxtt5QevybXEA8TuZvHIyw9LwLPf2iwkRxTfWN9mZ1CFvTkl/blvZlkS8x+uJtxpxJvHWGqVAadCNn1RSK76vNHh3SWcq/nXd8isEjSb1bvGJeUP8/I6QyQmvGib7K70GhqbbQICYwET31rUGheK+dlQqRcCdobABmXODIw/gwdQK9APmU3ohFlqZ9ezpttkGvWDZAk2Bq/KGNIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36/DWiO+N5VXBIu5x5B4Szbv2gNyhHZNxBrGnLACR38=;
 b=Jl7RhM1oEEaztlOQA2tlNAHLC1Av4wvMq+3ix7vj7cFpJHjDhNkx0rIuQYhGe+Wj2b6weVs7d34nzUH3SldX+iiA8zHQSxSzo5blK4/ot8JTy71kA+O5zYykMqt9OPzKvEQ9Q2A2k+UtQ7bxeIw55HgebmBFHg89z4RL2WW1skY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 09:38:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 05/33] block: rename backup-top to copy-before-write
Date: Wed,  4 Aug 2021 12:37:45 +0300
Message-Id: <20210804093813.20688-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03c94e9e-00cf-4642-cc70-08d9572ba582
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5032B4222FB1CCA16CAEA7FDC1F19@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Asii3pT5hwUDrWE9aa4ZX0UfiNL753zQtiBwbukEZsxIaxc++Rp/xoAZyuIMLXUzrcSIhx0FZLWR6fZBO2K+ZzkDHuPFNMzfeNosWtgnKz+CVscn5/EdcaXfqJQvs2Pav6oK7EHQWYC0Q2rrh1iBN+AoKSrJ3puxyqXmPURzTgmFD/dmSt83bCM6yl7qDshrMr8EeVCvikaXr/7g/S3tqf2icW572z8KQPU93EwApUJN1gA9p+pjc2404TzFIK8kR/wsLfR3MD2ohrUgtcWEgcialuPeLlSu1T79CUtPskePMBOoWjQnxyNkiTT3wxYbbw439N2h4iXu/vbVTY+nbLi556R14u9jEuDn7jmXn8sNtMtD+K6/C3G3g+KdV+pCgcwkIQBdWOtIr+degjOlSQJnh3Z3d3Qffzn1AlxNNUoK6mhuanN/jN5UpnsjZmdYlT+bFyyrjGNPn4iFKFpwuRpojRgf5PscAoPpy1Fd3Z6TKwdTw8OiecB0xEkN7dWoyByqTL8a/xjFUKAvPL4kLuz/I426yv2GrxnrH30CCAasyK2cRTRMQxtXFQ82UVMhamqyxEDqdDq10gaMC9si4k+y78wKTC+17dVaQ5ngCU/ZXkppzpiUJAdzN+BBexJaxNfV2Y8LEfPqhoOJ2DS09OU3lmQUy+zsSn8HLkY3dsIscSYHGMLveu2vTB1bScpJKYAAcGuQRBpDQgacmA1uytde0KM6ii6nHnPyZRUT3L6HwHrGFs8kcl7Kfrh8TQ3/uOn89PNNv9+H16KlKIBgqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(1076003)(186003)(26005)(7416002)(2906002)(30864003)(6506007)(6512007)(52116002)(66946007)(66476007)(478600001)(66556008)(86362001)(956004)(83380400001)(36756003)(8936002)(38100700002)(6486002)(6916009)(316002)(4326008)(8676002)(38350700002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjN2d2hPYnY2SFFTQ3JpcVZ3UWxIdFU2YXRvVTJGWDZsS0dTWXgyUjE2UHl1?=
 =?utf-8?B?N3J6OWtsMmR0VHhsaHRQWkRUMGsrMmFaOWRhV1FlWHpJcjlIZGwrT1A5Uk5Z?=
 =?utf-8?B?WVhjYW9TY2FZODVvQzdZMkNtWWNRNWkwL3lWYlFMQUhldDIvQ2lSQ1B6S1lE?=
 =?utf-8?B?cjQvUUVpY0svcTZUd0tXUmdLcDZHS2NyZXVRRk1RMTdoeEs0WFFzalpGL1JJ?=
 =?utf-8?B?YWNHTHlTZnhMTGlhUDRReWRMRjcyMDVMQ1RhbXpISXNsTWhIV3drd2hoN0Np?=
 =?utf-8?B?c0J0Q1I5MWU5Sy9ianBza3FyLzhidW1oNlQ4ald5cnJ4OHJla1QvNVhJNFRo?=
 =?utf-8?B?VUhjUElFVWJLSUkzb3ZLVmw5bkR4Z2kvVmVHejBmYkowMm02OTJvb2VsRjNz?=
 =?utf-8?B?RmN3amkxYVgwc2FJZENZRlBERWNFaGdMS1VlZW1JSEMxb0JQRUEyMk05a0tS?=
 =?utf-8?B?bmRZMmlrSmRDNFAyYlBMSE9rK0wzTlB0TmFkZDRyV3lzbllwc1hza21sUmVk?=
 =?utf-8?B?TmtHOSs2Z0h1KzlRblR1QTBTd1IrNjVmVVlZSXRpTytOQUIvRlBBMXhIejZG?=
 =?utf-8?B?Zlp0dWFaU3hEMU1MWnpJRXpYVTR1TXhJVnFQREN6dGsrVlhWbXJEa0RHQllD?=
 =?utf-8?B?Y2tSc0cyeXQzSUN6azB4OVpEMTJuaEo2Wnh0L2RnZGNWN3ViYzdQU2xoeU1r?=
 =?utf-8?B?UFlaVlluR2FjZy9IcXlHOXZ1UHYzNTFWam41WVFsdWdaME9SRlUydXpRNWhk?=
 =?utf-8?B?dFpyUjA5VGpHV21KSnZJZmRYZHdrVTFFSnVEWk1jalJVN25FV244MjRCeFhk?=
 =?utf-8?B?a1VObFErdWVPVXBYVlU0azhQRndZaEVXa1gwKyt4R2ZUcS9VdEpERkgwdmw1?=
 =?utf-8?B?WGtteVI5REEybDVld1diSE5pYXN0YTVsTnBjUzNYbURhaGVrVDNmZHVoSHJq?=
 =?utf-8?B?VHhKaFFwb2RIQ0lmN090NW1kb0dSRVYwb28rQ2ViL2ZSU2VPZ000Vmg5K0lK?=
 =?utf-8?B?dy9sTnozRUZ5RXZzN05jS2QvNkNHWmN2MzZkQUo4TSthaGpVOG11Mis5d0lv?=
 =?utf-8?B?MGZIK2tSK0d3RnlkSEpEdytxUFNyK3cxVE82cFJTOUxJNGZ3OGpXd1JqOVJh?=
 =?utf-8?B?MjJTbjh4VlI4TGY1bzRZMG9aa0tqZENLengrWW9Ba09VS3daTElZYUQ2cHFF?=
 =?utf-8?B?TkJwYUNkRFoyUlR1MWhGSS9xWE9nbVhxVTJTUHE0K1VCS29UamRRN1BvYWFw?=
 =?utf-8?B?Wm1QUjJyampHRWRtYlZyaWxSbmRKdjJ2MWkvMExrSTQ4bVhqVzQ3WUd1U2ly?=
 =?utf-8?B?M2Y3bEE1VjN3M3V3Ym5jQ1NaODZiUlFjRXhqbnhzMXBwenVnZjRRRmVCR0JO?=
 =?utf-8?B?QkZKcy80aFZkS0NZQ3NRR1hleFpwQ2xnS09FaExvYkhiL3J4NWVqRTdnRDZz?=
 =?utf-8?B?M01BdERic3JVN2I3d0tmMW1lclNZWkR5RE16TmJFc2p1S2xyeGlDZnR0N0Fq?=
 =?utf-8?B?TllLbGdybjAyOXg4T0hvazloVWpjRlV3c3JwNG5IZ2xCN1VzUkhJTGl5S2x2?=
 =?utf-8?B?YlVkYUdnUGR4TVRhQ2hlNGR2UXkzTEdWeWhTaGtmdEdmWU1YTGg3aXloNDk3?=
 =?utf-8?B?RG96cVN4T0s0dTVyUnl2WHNGa3BwcFk4dlhsRnBQR2dOV005TEFINTd3Rm9t?=
 =?utf-8?B?bktIbXlzdG52cWtOcDJRUTFpQmJMSS8vK0tuQVJmSHNZU2tNMzUyS093bjNE?=
 =?utf-8?Q?uPEhU+lIAJdAmVhCFv/N2EwHIxrDcvjFJtBj7LS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c94e9e-00cf-4642-cc70-08d9572ba582
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:42.4287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyNlnq/JiPoSRFkraC2jYWtjzie6g+LEalxVLBi6HTxoZSg5+9naFYOrGNkbCW+4PHBLWM+0r3Ol4kanLdybHJYU60tlKrfLkQO/YA34tFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to convert backup_top to full featured public filter,
which can be used in separate of backup job. Start from renaming from
"how it used" to "what it does".

While updating comments in 283 iotest, drop and rephrase also things
about ".active", as this field is now dropped, and filter doesn't have
"inactive" mode.

Note that this change may be considered as incompatible interface
change, as backup-top filter format name was visible through
query-block and query-named-block-nodes.

Still, consider the following reasoning:

1. backup-top was never documented, so if someone depends on format
   name (for driver that can't be used other than it is automatically
   inserted on backup job start), it's a kind of "undocumented feature
   use". So I think we are free to change it.

2. There is a hope, that there is no such users: it's a lot more native
   to give a good node-name to backup-top filter if need to operate
   with it somehow, and don't touch format name.

3. Another "incompatible" change in further commit would be moving
   copy-before-write filter from using backing child to file child. And
   this is even more reasonable than renaming: for now all public
   filters are file-child based.

So, it's a risky change, but risk seems small and good interface worth
it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/{backup-top.h => copy-before-write.h} |  28 +++---
 block/backup.c                              |  22 ++---
 block/{backup-top.c => copy-before-write.c} | 100 ++++++++++----------
 MAINTAINERS                                 |   4 +-
 block/meson.build                           |   2 +-
 tests/qemu-iotests/283                      |  35 +++----
 tests/qemu-iotests/283.out                  |   4 +-
 7 files changed, 95 insertions(+), 100 deletions(-)
 rename block/{backup-top.h => copy-before-write.h} (56%)
 rename block/{backup-top.c => copy-before-write.c} (62%)

diff --git a/block/backup-top.h b/block/copy-before-write.h
similarity index 56%
rename from block/backup-top.h
rename to block/copy-before-write.h
index b28b0031c4..5977b7aa31 100644
--- a/block/backup-top.h
+++ b/block/copy-before-write.h
@@ -1,10 +1,10 @@
 /*
- * backup-top filter driver
+ * copy-before-write filter driver
  *
  * The driver performs Copy-Before-Write (CBW) operation: it is injected above
  * some node, and before each write it copies _old_ data to the target node.
  *
- * Copyright (c) 2018-2019 Virtuozzo International GmbH.
+ * Copyright (c) 2018-2021 Virtuozzo International GmbH.
  *
  * Author:
  *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
@@ -23,20 +23,20 @@
  * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef BACKUP_TOP_H
-#define BACKUP_TOP_H
+#ifndef COPY_BEFORE_WRITE_H
+#define COPY_BEFORE_WRITE_H
 
 #include "block/block_int.h"
 #include "block/block-copy.h"
 
-BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
-                                         BlockDriverState *target,
-                                         const char *filter_node_name,
-                                         uint64_t cluster_size,
-                                         BackupPerf *perf,
-                                         BdrvRequestFlags write_flags,
-                                         BlockCopyState **bcs,
-                                         Error **errp);
-void bdrv_backup_top_drop(BlockDriverState *bs);
+BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
+                                  BlockDriverState *target,
+                                  const char *filter_node_name,
+                                  uint64_t cluster_size,
+                                  BackupPerf *perf,
+                                  BdrvRequestFlags write_flags,
+                                  BlockCopyState **bcs,
+                                  Error **errp);
+void bdrv_cbw_drop(BlockDriverState *bs);
 
-#endif /* BACKUP_TOP_H */
+#endif /* COPY_BEFORE_WRITE_H */
diff --git a/block/backup.c b/block/backup.c
index bd3614ce70..ac91821b08 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -27,13 +27,13 @@
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
 
-#include "block/backup-top.h"
+#include "block/copy-before-write.h"
 
 #define BACKUP_CLUSTER_SIZE_DEFAULT (1 << 16)
 
 typedef struct BackupBlockJob {
     BlockJob common;
-    BlockDriverState *backup_top;
+    BlockDriverState *cbw;
     BlockDriverState *source_bs;
     BlockDriverState *target_bs;
 
@@ -104,7 +104,7 @@ static void backup_clean(Job *job)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
     block_job_remove_all_bdrv(&s->common);
-    bdrv_backup_top_drop(s->backup_top);
+    bdrv_cbw_drop(s->cbw);
 }
 
 void backup_do_checkpoint(BlockJob *job, Error **errp)
@@ -408,7 +408,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     BackupBlockJob *job = NULL;
     int64_t cluster_size;
     BdrvRequestFlags write_flags;
-    BlockDriverState *backup_top = NULL;
+    BlockDriverState *cbw = NULL;
     BlockCopyState *bcs = NULL;
 
     assert(bs);
@@ -521,22 +521,22 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     write_flags = (bdrv_chain_contains(target, bs) ? BDRV_REQ_SERIALISING : 0) |
                   (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
 
-    backup_top = bdrv_backup_top_append(bs, target, filter_node_name,
+    cbw = bdrv_cbw_append(bs, target, filter_node_name,
                                         cluster_size, perf,
                                         write_flags, &bcs, errp);
-    if (!backup_top) {
+    if (!cbw) {
         goto error;
     }
 
     /* job->len is fixed, so we can't allow resize */
-    job = block_job_create(job_id, &backup_job_driver, txn, backup_top,
+    job = block_job_create(job_id, &backup_job_driver, txn, cbw,
                            0, BLK_PERM_ALL,
                            speed, creation_flags, cb, opaque, errp);
     if (!job) {
         goto error;
     }
 
-    job->backup_top = backup_top;
+    job->cbw = cbw;
     job->source_bs = bs;
     job->target_bs = target;
     job->on_source_error = on_source_error;
@@ -552,7 +552,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     block_copy_set_progress_meter(bcs, &job->common.job.progress);
     block_copy_set_speed(bcs, speed);
 
-    /* Required permissions are already taken by backup-top target */
+    /* Required permissions are taken by copy-before-write filter target */
     block_job_add_bdrv(&job->common, "target", target, 0, BLK_PERM_ALL,
                        &error_abort);
 
@@ -562,8 +562,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     if (sync_bitmap) {
         bdrv_reclaim_dirty_bitmap(sync_bitmap, NULL);
     }
-    if (backup_top) {
-        bdrv_backup_top_drop(backup_top);
+    if (cbw) {
+        bdrv_cbw_drop(cbw);
     }
 
     return NULL;
diff --git a/block/backup-top.c b/block/copy-before-write.c
similarity index 62%
rename from block/backup-top.c
rename to block/copy-before-write.c
index 425e3778be..0dc5a107cf 100644
--- a/block/backup-top.c
+++ b/block/copy-before-write.c
@@ -1,10 +1,10 @@
 /*
- * backup-top filter driver
+ * copy-before-write filter driver
  *
  * The driver performs Copy-Before-Write (CBW) operation: it is injected above
  * some node, and before each write it copies _old_ data to the target node.
  *
- * Copyright (c) 2018-2019 Virtuozzo International GmbH.
+ * Copyright (c) 2018-2021 Virtuozzo International GmbH.
  *
  * Author:
  *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
@@ -32,25 +32,25 @@
 #include "block/qdict.h"
 #include "block/block-copy.h"
 
-#include "block/backup-top.h"
+#include "block/copy-before-write.h"
 
-typedef struct BDRVBackupTopState {
+typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
     int64_t cluster_size;
-} BDRVBackupTopState;
+} BDRVCopyBeforeWriteState;
 
-static coroutine_fn int backup_top_co_preadv(
+static coroutine_fn int cbw_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
 
-static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t bytes, BdrvRequestFlags flags)
+static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
+        uint64_t offset, uint64_t bytes, BdrvRequestFlags flags)
 {
-    BDRVBackupTopState *s = bs->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
     uint64_t off, end;
 
     if (flags & BDRV_REQ_WRITE_UNCHANGED) {
@@ -63,10 +63,10 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
     return block_copy(s->bcs, off, end - off, true);
 }
 
-static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
-                                               int64_t offset, int bytes)
+static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
+                                        int64_t offset, int bytes)
 {
-    int ret = backup_top_cbw(bs, offset, bytes, 0);
+    int ret = cbw_do_copy_before_write(bs, offset, bytes, 0);
     if (ret < 0) {
         return ret;
     }
@@ -74,10 +74,10 @@ static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
     return bdrv_co_pdiscard(bs->backing, offset, bytes);
 }
 
-static int coroutine_fn backup_top_co_pwrite_zeroes(BlockDriverState *bs,
+static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
         int64_t offset, int bytes, BdrvRequestFlags flags)
 {
-    int ret = backup_top_cbw(bs, offset, bytes, flags);
+    int ret = cbw_do_copy_before_write(bs, offset, bytes, flags);
     if (ret < 0) {
         return ret;
     }
@@ -85,12 +85,12 @@ static int coroutine_fn backup_top_co_pwrite_zeroes(BlockDriverState *bs,
     return bdrv_co_pwrite_zeroes(bs->backing, offset, bytes, flags);
 }
 
-static coroutine_fn int backup_top_co_pwritev(BlockDriverState *bs,
-                                              uint64_t offset,
-                                              uint64_t bytes,
-                                              QEMUIOVector *qiov, int flags)
+static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
+                                       uint64_t offset,
+                                       uint64_t bytes,
+                                       QEMUIOVector *qiov, int flags)
 {
-    int ret = backup_top_cbw(bs, offset, bytes, flags);
+    int ret = cbw_do_copy_before_write(bs, offset, bytes, flags);
     if (ret < 0) {
         return ret;
     }
@@ -98,7 +98,7 @@ static coroutine_fn int backup_top_co_pwritev(BlockDriverState *bs,
     return bdrv_co_pwritev(bs->backing, offset, bytes, qiov, flags);
 }
 
-static int coroutine_fn backup_top_co_flush(BlockDriverState *bs)
+static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
 {
     if (!bs->backing) {
         return 0;
@@ -107,7 +107,7 @@ static int coroutine_fn backup_top_co_flush(BlockDriverState *bs)
     return bdrv_co_flush(bs->backing->bs);
 }
 
-static void backup_top_refresh_filename(BlockDriverState *bs)
+static void cbw_refresh_filename(BlockDriverState *bs)
 {
     if (bs->backing == NULL) {
         /*
@@ -120,11 +120,11 @@ static void backup_top_refresh_filename(BlockDriverState *bs)
             bs->backing->bs->filename);
 }
 
-static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
-                                  BdrvChildRole role,
-                                  BlockReopenQueue *reopen_queue,
-                                  uint64_t perm, uint64_t shared,
-                                  uint64_t *nperm, uint64_t *nshared)
+static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
+                           BdrvChildRole role,
+                           BlockReopenQueue *reopen_queue,
+                           uint64_t perm, uint64_t shared,
+                           uint64_t *nperm, uint64_t *nshared)
 {
     if (!(role & BDRV_CHILD_FILTERED)) {
         /*
@@ -149,41 +149,41 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-BlockDriver bdrv_backup_top_filter = {
-    .format_name = "backup-top",
-    .instance_size = sizeof(BDRVBackupTopState),
+BlockDriver bdrv_cbw_filter = {
+    .format_name = "copy-before-write",
+    .instance_size = sizeof(BDRVCopyBeforeWriteState),
 
-    .bdrv_co_preadv             = backup_top_co_preadv,
-    .bdrv_co_pwritev            = backup_top_co_pwritev,
-    .bdrv_co_pwrite_zeroes      = backup_top_co_pwrite_zeroes,
-    .bdrv_co_pdiscard           = backup_top_co_pdiscard,
-    .bdrv_co_flush              = backup_top_co_flush,
+    .bdrv_co_preadv             = cbw_co_preadv,
+    .bdrv_co_pwritev            = cbw_co_pwritev,
+    .bdrv_co_pwrite_zeroes      = cbw_co_pwrite_zeroes,
+    .bdrv_co_pdiscard           = cbw_co_pdiscard,
+    .bdrv_co_flush              = cbw_co_flush,
 
-    .bdrv_refresh_filename      = backup_top_refresh_filename,
+    .bdrv_refresh_filename      = cbw_refresh_filename,
 
-    .bdrv_child_perm            = backup_top_child_perm,
+    .bdrv_child_perm            = cbw_child_perm,
 
     .is_filter = true,
 };
 
-BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
-                                         BlockDriverState *target,
-                                         const char *filter_node_name,
-                                         uint64_t cluster_size,
-                                         BackupPerf *perf,
-                                         BdrvRequestFlags write_flags,
-                                         BlockCopyState **bcs,
-                                         Error **errp)
+BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
+                                  BlockDriverState *target,
+                                  const char *filter_node_name,
+                                  uint64_t cluster_size,
+                                  BackupPerf *perf,
+                                  BdrvRequestFlags write_flags,
+                                  BlockCopyState **bcs,
+                                  Error **errp)
 {
     ERRP_GUARD();
     int ret;
-    BDRVBackupTopState *state;
+    BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
     bool appended = false;
 
     assert(source->total_sectors == target->total_sectors);
 
-    top = bdrv_new_open_driver(&bdrv_backup_top_filter, filter_node_name,
+    top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
                                BDRV_O_RDWR, errp);
     if (!top) {
         return NULL;
@@ -210,7 +210,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
     ret = bdrv_append(top, source, errp);
     if (ret < 0) {
-        error_prepend(errp, "Cannot append backup-top filter: ");
+        error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
     appended = true;
@@ -231,7 +231,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
 fail:
     if (appended) {
-        bdrv_backup_top_drop(top);
+        bdrv_cbw_drop(top);
     } else {
         bdrv_unref(top);
     }
@@ -241,9 +241,9 @@ fail:
     return NULL;
 }
 
-void bdrv_backup_top_drop(BlockDriverState *bs)
+void bdrv_cbw_drop(BlockDriverState *bs)
 {
-    BDRVBackupTopState *s = bs->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
 
     bdrv_drop_filter(bs, &error_abort);
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 37b1a8e442..af8aafd06d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2337,8 +2337,8 @@ F: block/mirror.c
 F: qapi/job.json
 F: block/block-copy.c
 F: include/block/block-copy.c
-F: block/backup-top.h
-F: block/backup-top.c
+F: block/copy-before-write.h
+F: block/copy-before-write.c
 F: include/block/aio_task.h
 F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
diff --git a/block/meson.build b/block/meson.build
index 0450914c7a..66ee11e62c 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -4,7 +4,7 @@ block_ss.add(files(
   'aio_task.c',
   'amend.c',
   'backup.c',
-  'backup-top.c',
+  'copy-before-write.c',
   'blkdebug.c',
   'blklogwrites.c',
   'blkverify.c',
diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
index 010c22f0a2..a09e0183ae 100755
--- a/tests/qemu-iotests/283
+++ b/tests/qemu-iotests/283
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
 # group: auto quick
 #
-# Test for backup-top filter permission activation failure
+# Test for copy-before-write filter permission conflict
 #
 # Copyright (c) 2019 Virtuozzo International GmbH.
 #
@@ -31,13 +31,13 @@ size = 1024 * 1024
 """ Test description
 
 When performing a backup, all writes on the source subtree must go through the
-backup-top filter so it can copy all data to the target before it is changed.
-backup-top filter is appended above source node, to achieve this thing, so all
-parents of source node are handled. A configuration with side parents of source
-sub-tree with write permission is unsupported (we'd have append several
-backup-top filter like nodes to handle such parents). The test create an
-example of such configuration and checks that a backup is then not allowed
-(blockdev-backup command should fail).
+copy-before-write filter so it can copy all data to the target before it is
+changed.  copy-before-write filter is appended above source node, to achieve
+this thing, so all parents of source node are handled. A configuration with
+side parents of source sub-tree with write permission is unsupported (we'd have
+append several copy-before-write filter like nodes to handle such parents). The
+test create an example of such configuration and checks that a backup is then
+not allowed (blockdev-backup command should fail).
 
 The configuration:
 
@@ -57,11 +57,10 @@ The configuration:
                         │    base     │ ◀──────────── │ other │
                         └─────────────┘               └───────┘
 
-On activation (see .active field of backup-top state in block/backup-top.c),
-backup-top is going to unshare write permission on its source child. Write
-unsharing will be propagated to the "source->base" link and will conflict with
-other node write permission. So permission update will fail and backup job will
-not be started.
+copy-before-write filter wants to unshare write permission on its source child.
+Write unsharing will be propagated to the "source->base" link and will conflict
+with other node write permission. So permission update will fail and backup job
+will not be started.
 
 Note, that the only thing which prevents backup of running on such
 configuration is default permission propagation scheme. It may be altered by
@@ -99,13 +98,9 @@ vm.qmp_log('blockdev-backup', sync='full', device='source', target='target')
 vm.shutdown()
 
 
-print('\n=== backup-top should be gone after job-finalize ===\n')
+print('\n=== copy-before-write filter should be gone after job-finalize ===\n')
 
-# Check that the backup-top node is gone after job-finalize.
-#
-# During finalization, the node becomes inactive and can no longer
-# function.  If it is still present, new parents might be attached, and
-# there would be no meaningful way to handle their I/O requests.
+# Check that the copy-before-write node is gone after job-finalize.
 
 vm = iotests.VM()
 vm.launch()
@@ -131,7 +126,7 @@ vm.qmp_log('blockdev-backup',
 
 vm.event_wait('BLOCK_JOB_PENDING', 5.0)
 
-# The backup-top filter should still be present prior to finalization
+# The copy-before-write filter should still be present prior to finalization
 assert vm.node_info('backup-filter') is not None
 
 vm.qmp_log('job-finalize', id='backup')
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index c6e12b15c5..f2b7219632 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,9 +5,9 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
+{"error": {"class": "GenericError", "desc": "Cannot append copy-before-write filter: Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
 
-=== backup-top should be gone after job-finalize ===
+=== copy-before-write filter should be gone after job-finalize ===
 
 {"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name": "source"}}
 {"return": {}}
-- 
2.29.2


