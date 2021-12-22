Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FA147D635
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:05:35 +0100 (CET)
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05za-0007mH-Gy
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:05:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bm-0001GP-HF; Wed, 22 Dec 2021 12:40:58 -0500
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:36163 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bb-0002Zq-C1; Wed, 22 Dec 2021 12:40:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vsjbv0TxH/+CkiGr8W+295O8L5mGi3iBPtT8gvtsnJnnChkQAauiM/n6Jrm0Mma9J3e4Mt8om3D2WAxcIgPvOUvd9/0rPb8CEYSJ9Ik1rpr9LJ/QjjY8T/LPs+H5eL8ZibZ46azkb+kpiTSwThRBzeGNu+8yApxjEX73o4PwamPIPfRtUWQApAzT4kbdB+ZkRe7z0VpcdrZFJjww4OKkWTPNicNTxk3sFf5OtK5iRklBF8BYY8/mcgzMFm1rOrzU7BaEyB3V1Two7de0KOXtUXPuKsBs3L/y1ib11HyUx4PLleNKazFMZtHuUibOChtfkHhqkyUz9/8bk3axLjDAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5ATDaSVy6Q6GRqF8gPOf+PPgc/Mwjv3iBcH1wu9/0U=;
 b=A6PztfnAWjSZPUDoTjbb+bkxoofXSLu7P2AjKmatF038Rn7tZWUa8YTKMW6g2xo0Mj5OcHrsw3gNqKAusmQUmvGsWIFx0IGDRfaeVS0/at/RW0T+keTlgUJ52cY5CXt3hm9QKbztHcC5Vcvx7bLGAtXtOEZ9WD9WR7aFDepQYYkB2lNmdlsHz3vrpe0R7GMK1Z9JjjdT+/Riau0ShLXJn4C2Zhh+qrIpxBnDBPXCJgg90JtXmVrfMKf34i0d1exs6TuC9NdrRhbgdbgdxYIW3TXvDSuPSxLpdUvVGKe9MSAszUyWtH3e9sG6wszLd7ySKxIh0jrmvnNSzGCdA8HxMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5ATDaSVy6Q6GRqF8gPOf+PPgc/Mwjv3iBcH1wu9/0U=;
 b=gTBnDWVRZeHk49gLkXAy8f7gVmOTtpbM95DIeC0KVtWY6HwL3v0eLSS1nYlw+58KKW7ywvDhACwWmKAz7hr2hxTw+nuVvzrh11U++BhECsHJ3h37ZbzDeoYIg7nVETqOQnera1fxF6QPKU/2KdZOZL2e4cAB1Kt20A18EiJAGHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:39 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 09/19] block: introduce FleecingState class
Date: Wed, 22 Dec 2021 18:40:08 +0100
Message-Id: <20211222174018.257550-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fd94107-49b5-48e3-e067-08d9c5722b55
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB3964224EC1CFB59D2FC1302BC17D9@DB8PR08MB3964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SVLAEhLMofgQTq8ZnpxOy9rR73WsBn+aVPz6VRHaJ0+HmuEetzlrhrGBUZyapnEqSoFcrIt+80d5pv2dg9TW7doiAZC0egMZ7AJGE7WSBv05COgjFTq3sWiAk475Y96lzrom7a0e2xYhmFVVc1CF81szzDieSGRAVlw5SHXzjHsxsgzHuA+GVXA6NMZGuCTn3R5YKQllsfsD28ZQGVIoYZ9pl7OsEVMe9ji9fq+u1bLDoNxX4mcIzD9ninY67RVl2kTktuFN6QTLuYtcUd1cYO6AEJ5oiUtXhdWfuJQl5NYKW8PpLo2SYwD4KLwW3MgrHVldXIsU7PUm6mG3wIatYIVS8AdvlZYFMXvp2cFz4T86emt639eQk3+FV/OgnqEOmIdBYJaxYsX71IN5BI3pYfmvfWdWwvPZegvPstUQBwL0jFvXVEf9rz8bqDLexrbhr5+lzyB9pDlb1c+qckBdiKWlwAFDn4WsAoEci+xrY/QrDaYN3kAaemxu0Y076OUVXXhM1BI0e3q6mmkoyZau1nxUWaqdpK6GYW2N+9ke+JieSALHon20xatGKRAF70NMzH5pBrA/UPttgMxe5ULwnkh/SPPC7ro32yD7OrGrMfGupvAYtw4YPdPkX9bq7m4Msb+7hDbbL6mfHFD2PTwi/JmgGDWRjlmfkiX6x2tHomRGRfWBf3UEcPcXabqVaFzxeE3ls2F7UpRdSzdXpf/MiWl8/vcQ2QC+zPVsSK1+u2abXScUGFMA8ZTWpA/jEx+zqYWovNQZRZdD6F1QzR54CClEQSqU6B1sogx47LL+N8j/G+2sbP7Zx/ymuRRqmUEH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(6512007)(6506007)(26005)(316002)(52116002)(2906002)(30864003)(186003)(508600001)(6486002)(6916009)(4326008)(2616005)(8936002)(5660300002)(6666004)(8676002)(1076003)(38100700002)(38350700002)(86362001)(83380400001)(66946007)(66476007)(66556008)(36756003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ehx4iZylqaXxBAQ/D8dWC9Hwt3/A3pZNx6m71gpISPducUhDF3GfoPTGZlXp?=
 =?us-ascii?Q?1qjsh9sa5yNTefAOG6VwNb4VbL8Segnz9Q5PX6Ts9A91PJielL5AZfHYVZ33?=
 =?us-ascii?Q?U+N56f3i1o5u/yUB+44TMqFqwruwp1e+L7xFDmz8bbNe0ajMyBXlMvpN007V?=
 =?us-ascii?Q?lECOjcOp4fsxvao1s6ZTFBJIZS0AjEQo/GZP4jxf0McXL7jXbQnh/bW4ie/K?=
 =?us-ascii?Q?Q/VHpnewVJPda1r80cOrvCDwSvIQzmtbKcKbn+vEg+yc7gZDw7PTD8f4uVQR?=
 =?us-ascii?Q?Wtfa3K5pKDzeyjJxuOuyBSd0oh9qVl9sfb5wkFHfrYohv/Jo7dx9Q6IEHLQn?=
 =?us-ascii?Q?7AEwmcYFwBoWHsGWtER6HTkNWqpJfQQ89/99T4xMFr1gmFjLN5N4aM8pf+B3?=
 =?us-ascii?Q?mmQS3TN+4+uDpKOMr2rIcglmLTD7yc8VZ7NX/nwdbslGZFcr7OXgdCxfyJpe?=
 =?us-ascii?Q?zP5vymMgM+PwGLBws7VHckXQMvIf+9N24D6kHueCOZjegq7j6zph35F5G5pX?=
 =?us-ascii?Q?JSA5Bnleoy6nj1DR4Nv0Ayhzi56vB0qW/vw/ab1ka57viC6RSZguPpvqcdJ3?=
 =?us-ascii?Q?xhbuE8OpgpFfWgZoNonxz4dn/3T0Sg3nkHK4mRQpjztZHnfwc4pcm2mVBVus?=
 =?us-ascii?Q?UXOIQk40eHido0LyNx/+CJksZZsu0pCkf0BXyvgp1lpx8vJ9ZT0FLpdsfdrt?=
 =?us-ascii?Q?feB5J7T3K6f8DcLP2wqFtlPhzZ/7CldEsG6ROaKtpYqRAlUZ5chRm5ZlWR8h?=
 =?us-ascii?Q?cxxWP7wjJQcKuVmuaUTXI7AvallcwvB8651k1l8mEYqL+3doMvWdcnaaW957?=
 =?us-ascii?Q?e8rUpctUK9yl36sW8/K12hPARg63fpTvP+uSU26XKBP+43mv5d/CEq5MdUXI?=
 =?us-ascii?Q?HDdVgusIaWkvqHSWnpkYwvo8ygWSZ1XeaJK/8fHhh1M6zE7kZDX2VvOoug2w?=
 =?us-ascii?Q?Af5LLZhiw1zhhcEzxeZN/QgwUN/yG9iVTkAyWgq9zmXHZMaKmflm8dDZkv4x?=
 =?us-ascii?Q?McP97ddcP5f1IX3SJMrZxKp4NNBMlgikPZ43qmbXTMnThSKQuryVmbYcN9T2?=
 =?us-ascii?Q?Pj+4sSXVaBZ8c3kHDIXc5urYflqcliiNHFsAYstIKYfHl6I+il6++Io5nuoW?=
 =?us-ascii?Q?gQgtbOoeGGbK4TywNPPp43LYlEbLbpiGR7h3G2Ujr+gjJezaR2lUTuACH9lV?=
 =?us-ascii?Q?nRufO7Kf4WIRxga2jW9kTFaEaMPVtqwlf1u6PoKvOizvoz9j/3epgQsbl6bB?=
 =?us-ascii?Q?Ymn7rE5RCzbfJDxEBSsNeebMcVTOySDgbrRcUREdwu9VRpZ1Ko5Ii2Ughih0?=
 =?us-ascii?Q?ow+L5rWHDabgO9YDLlRlPp8tBsQ3PIW7REet7YnehxTmXNKcRRGMOpI7ToJ1?=
 =?us-ascii?Q?xJhrCwGNaX57XcKcizAqOnKfrEJIXwEZxblAuUf3QCL3uhT7B3rX/rk9tl16?=
 =?us-ascii?Q?FnPMNVwh2OQ5gB3NCG3L5970RwYw9j1oHyecfN6q97xemw/crPSc6wadqz3/?=
 =?us-ascii?Q?OiPgM+7SkgctOhUhQk+Gs6SpWo92x/FKxgdd1zTGKClU1NFzPAbbCLZ0hIus?=
 =?us-ascii?Q?ra5uy4+UOuph4RY92wkCXNKEcAkNgb6nyiACTZmDqJJmTooQiibEgWKDsgxg?=
 =?us-ascii?Q?SdhbaalYOXcvmWVWcj1bJbt0C8ukuwKxhD169cGass6WdCwp2lJHkyQSeLAi?=
 =?us-ascii?Q?nxHkQ8BJ6EF6YaEAVlCeA8274Ag=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd94107-49b5-48e3-e067-08d9c5722b55
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:39.5985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QkxwS8b/aquiV63aNRC/4No37SChFr8b/eZNQs89FaD77hrsuUi2QQYBOicbiLeYtG/TKohKaMgq4usluMl/BpDtGM8jD0rAooGvvTSHIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Received-SPF: pass client-ip=40.107.6.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FleecingState represents state shared between copy-before-write filter
and upcoming fleecing block driver.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/fleecing.h  | 135 ++++++++++++++++++++++++++++++++++
 block/fleecing.c  | 182 ++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS       |   2 +
 block/meson.build |   1 +
 4 files changed, 320 insertions(+)
 create mode 100644 block/fleecing.h
 create mode 100644 block/fleecing.c

diff --git a/block/fleecing.h b/block/fleecing.h
new file mode 100644
index 0000000000..fb7b2f86c4
--- /dev/null
+++ b/block/fleecing.h
@@ -0,0 +1,135 @@
+/*
+ * FleecingState
+ *
+ * The common state of image fleecing, shared between copy-before-write filter
+ * and fleecing block driver.
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
+ *
+ *
+ * Fleecing scheme looks as follows:
+ *
+ * [guest blk]                   [nbd export]
+ *    |                              |
+ *    |root                          |
+ *    v                              v
+ * [copy-before-write]--target-->[fleecing drv]
+ *    |                          /   |
+ *    |file                     /    |file
+ *    v                        /     v
+ * [active disk]<--source-----/  [temp disk]
+ *
+ * Note that "active disk" is also called just "source" and "temp disk" is also
+ * called "target".
+ *
+ * What happens here:
+ *
+ * copy-before-write filter performs copy-before-write operations: on guest
+ * write we should copy old data to target child before rewriting. Note that we
+ * write this data through fleecing driver: it saves a possibility to implement
+ * a kind of cache in fleecing driver in future.
+ *
+ * Fleecing user is nbd export: it can read from fleecing node, which guarantees
+ * a snapshot-view for fleecing user. Fleecing user may also do discard
+ * operations.
+ *
+ * FleecingState is responsible for most of the fleecing logic:
+ *
+ * 1. Fleecing read. Handle reads of fleecing user: we should decide where from
+ * to read, from source node or from copy-before-write target node. In former
+ * case we need to synchronize with guest writes. See fleecing_read_lock() and
+ * fleecing_read_unlock() functionality.
+ *
+ * 2. Guest write synchronization (part of [1] actually). See
+ * fleecing_mark_done_and_wait_readers()
+ *
+ * 3. Fleecing discard. Used by fleecing user when corresponding area is already
+ * copied. Fleecing user may discard the area which is not needed anymore, that
+ * should result in:
+ *   - discarding data to free disk space
+ *   - clear bits in copy-bitmap of block-copy, to avoid extra copy-before-write
+ *     operations
+ *   - clear bits in access-bitmap of FleecingState, to avoid further wrong
+ *     access
+ *
+ * Still, FleecingState doesn't own any block children, so all real io
+ * operations (reads, writes and discards) are done by copy-before-write filter
+ * and fleecing block driver.
+ */
+
+#ifndef FLEECING_H
+#define FLEECING_H
+
+#include "block/block_int.h"
+#include "block/block-copy.h"
+#include "block/reqlist.h"
+
+typedef struct FleecingState FleecingState;
+
+/*
+ * Create FleecingState.
+ *
+ * @bcs: link to block-copy owned by copy-before-write filter.
+ *
+ * @fleecing_node: should be fleecing block driver node. Used to create some
+ * bitmaps in it.
+ */
+FleecingState *fleecing_new(BlockCopyState *bcs,
+                            BlockDriverState *fleecing_node,
+                            Error **errp);
+
+/* Free the state. Doesn't free block-copy state (@bcs) */
+void fleecing_free(FleecingState *s);
+
+/*
+ * Convenient function for thous who want to do fleecing read.
+ *
+ * If requested region starts in "done" area, i.e. data is already copied to
+ * copy-before-write target node, req is set to NULL, pnum is set to available
+ * bytes to read from target. User is free to read @pnum bytes from target.
+ * Still, user is responsible for concurrent discards on target.
+ *
+ * If requests region starts in "not done" area, i.e. we have to read from
+ * source node directly, than @pnum bytes of source node are frozen and
+ * guaranteed not be rewritten until user calls cbw_snapshot_read_unlock().
+ *
+ * Returns 0 on success and -EACCES when try to read non-dirty area of
+ * access_bitmap.
+ */
+int fleecing_read_lock(FleecingState *f, int64_t offset,
+                       int64_t bytes, const BlockReq **req, int64_t *pnum);
+/* Called as closing pair for fleecing_read_lock() */
+void fleecing_read_unlock(FleecingState *f, const BlockReq *req);
+
+/*
+ * Called when fleecing user doesn't need the region anymore (for example the
+ * region is successfully read and backed up somewhere).
+ * This prevents extra copy-before-write operations in this area in future.
+ * Next fleecing read from this area will fail with -EACCES.
+ */
+void fleecing_discard(FleecingState *f, int64_t offset, int64_t bytes);
+
+/*
+ * Called by copy-before-write filter after successful copy-before-write
+ * operation to synchronize with parallel fleecing reads.
+ */
+void fleecing_mark_done_and_wait_readers(FleecingState *f, int64_t offset,
+                                         int64_t bytes);
+
+#endif /* FLEECING_H */
diff --git a/block/fleecing.c b/block/fleecing.c
new file mode 100644
index 0000000000..f75d11b892
--- /dev/null
+++ b/block/fleecing.c
@@ -0,0 +1,182 @@
+/*
+ * FleecingState
+ *
+ * The common state of image fleecing, shared between copy-before-write filter
+ * and fleecing block driver.
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
+#include "sysemu/block-backend.h"
+#include "qemu/cutils.h"
+#include "qapi/error.h"
+#include "block/block_int.h"
+#include "block/coroutines.h"
+#include "block/qdict.h"
+#include "block/block-copy.h"
+#include "block/reqlist.h"
+
+#include "block/fleecing.h"
+
+/*
+ * @bcs: link to block-copy state owned by copy-before-write filter which
+ * performs copy-before-write operations in context of fleecing scheme.
+ * FleecingState doesn't own the block-copy state and don't free it on cleanup.
+ *
+ * @lock: protects access to @access_bitmap, @done_bitmap and @frozen_read_reqs
+ *
+ * @access_bitmap: represents areas allowed for reading by fleecing user.
+ * Reading from non-dirty areas leads to -EACCES. Discard operation among other
+ * things clears corresponding bits in this bitmaps.
+ *
+ * @done_bitmap: represents areas that was successfully copied by
+ * copy-before-write operations. So, for dirty areas fleecing user should read
+ * from target node and for clear areas - from source node.
+ *
+ * @frozen_read_reqs: current read requests for fleecing user in source node.
+ * corresponding areas must not be rewritten by guest.
+ */
+typedef struct FleecingState {
+    BlockCopyState *bcs;
+
+    CoMutex lock;
+
+    BdrvDirtyBitmap *access_bitmap;
+    BdrvDirtyBitmap *done_bitmap;
+
+    BlockReqList frozen_read_reqs;
+} FleecingState;
+
+FleecingState *fleecing_new(BlockCopyState *bcs,
+                            BlockDriverState *fleecing_node,
+                            Error **errp)
+{
+    BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(bcs),
+                    *done_bitmap, *access_bitmap;
+    int64_t cluster_size = block_copy_cluster_size(bcs);
+    FleecingState *s;
+
+    /* done_bitmap starts empty */
+    done_bitmap = bdrv_create_dirty_bitmap(fleecing_node, cluster_size, NULL,
+                                           errp);
+    if (!done_bitmap) {
+        return NULL;
+    }
+    bdrv_disable_dirty_bitmap(done_bitmap);
+
+    /* access_bitmap starts equal to bcs_bitmap */
+    access_bitmap = bdrv_create_dirty_bitmap(fleecing_node, cluster_size, NULL,
+                                             errp);
+    if (!access_bitmap) {
+        return NULL;
+    }
+    bdrv_disable_dirty_bitmap(access_bitmap);
+    if (!bdrv_dirty_bitmap_merge_internal(access_bitmap, bcs_bitmap,
+                                          NULL, true))
+    {
+        return NULL;
+    }
+
+    s = g_new(FleecingState, 1);
+    *s = (FleecingState) {
+        .bcs = bcs,
+        .done_bitmap = done_bitmap,
+        .access_bitmap = access_bitmap,
+    };
+    qemu_co_mutex_init(&s->lock);
+    QLIST_INIT(&s->frozen_read_reqs);
+
+    return s;
+}
+
+void fleecing_free(FleecingState *s)
+{
+    if (!s) {
+        return;
+    }
+
+    bdrv_release_dirty_bitmap(s->access_bitmap);
+    bdrv_release_dirty_bitmap(s->done_bitmap);
+    g_free(s);
+}
+
+static BlockReq *add_read_req(FleecingState *s, uint64_t offset, uint64_t bytes)
+{
+    BlockReq *req = g_new(BlockReq, 1);
+
+    reqlist_init_req(&s->frozen_read_reqs, req, offset, bytes);
+
+    return req;
+}
+
+static void drop_read_req(BlockReq *req)
+{
+    reqlist_remove_req(req);
+    g_free(req);
+}
+
+int fleecing_read_lock(FleecingState *s, int64_t offset,
+                       int64_t bytes, const BlockReq **req,
+                       int64_t *pnum)
+{
+    bool done;
+
+    QEMU_LOCK_GUARD(&s->lock);
+
+    if (bdrv_dirty_bitmap_next_zero(s->access_bitmap, offset, bytes) != -1) {
+        return -EACCES;
+    }
+
+    bdrv_dirty_bitmap_status(s->done_bitmap, offset, bytes, &done, pnum);
+    if (!done) {
+        *req = add_read_req(s, offset, *pnum);
+    }
+
+    return 0;
+}
+
+void fleecing_read_unlock(FleecingState *s, const BlockReq *req)
+{
+    QEMU_LOCK_GUARD(&s->lock);
+
+    drop_read_req((BlockReq *)req);
+}
+
+void fleecing_discard(FleecingState *s, int64_t offset, int64_t bytes)
+{
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        bdrv_reset_dirty_bitmap(s->access_bitmap, offset, bytes);
+    }
+
+    block_copy_reset(s->bcs, offset, bytes);
+}
+
+void fleecing_mark_done_and_wait_readers(FleecingState *s, int64_t offset,
+                                         int64_t bytes)
+{
+    assert(QEMU_IS_ALIGNED(offset, block_copy_cluster_size(s->bcs)));
+    assert(QEMU_IS_ALIGNED(bytes, block_copy_cluster_size(s->bcs)));
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        bdrv_set_dirty_bitmap(s->done_bitmap, offset, bytes);
+        reqlist_wait_all(&s->frozen_read_reqs, offset, bytes, &s->lock);
+    }
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 7f24ee4b92..78ea04e292 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2423,6 +2423,8 @@ F: block/reqlist.c
 F: include/block/reqlist.h
 F: block/copy-before-write.h
 F: block/copy-before-write.c
+F: block/fleecing.h
+F: block/fleecing.c
 F: include/block/aio_task.h
 F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
diff --git a/block/meson.build b/block/meson.build
index 5065cf33ba..d30da90a01 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -18,6 +18,7 @@ block_ss.add(files(
   'crypto.c',
   'dirty-bitmap.c',
   'filter-compress.c',
+  'fleecing.c',
   'io.c',
   'mirror.c',
   'nbd.c',
-- 
2.31.1


