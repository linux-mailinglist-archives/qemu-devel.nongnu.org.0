Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21BA3F9EE0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:34:38 +0200 (CEST)
Received: from localhost ([::1]:51138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJggX-0005yW-KO
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRF-0001BO-My; Fri, 27 Aug 2021 14:18:51 -0400
Received: from mail-eopbgr20117.outbound.protection.outlook.com
 ([40.107.2.117]:18413 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRB-0006di-1T; Fri, 27 Aug 2021 14:18:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0yxyR0zVLJbGt+uuws7sqlIfmZkM8OyDh/i/bkHpCaq0uVs/0N/ap5pwMW/3YJw1B3bk/7Jta/pVkksefW8++v7b9kwunVwFN7wzvynTHd48O5Se8Lpv9qrvqwU+iYuBfMy09S0ktez9Be+U9x7S64aMmyWSMd8DnqYc+YXvwOpZ/Ost0I6WvxlI2LEnDTfU6Te/NHrD+ZcZmqkVjkk5d3heCEy1wWlJ4uCQV7P2gKvqMV5sP1TfmxFQfmAjQIcf7ZrbM095k5c4SZXgqHsStqlQ7913Eh7WjMjxdS5HfpxjxgA51xjJDyTPpu5I+sdNHtLpxYluPFcg6i1EBLNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txiEbjPgLG7Kzqjy98pe9im+U38ZNZeQcV4HP1w5oPs=;
 b=TVOuCcnmXFijIS6Mrjl2WBu/yQ38hXo7dRpe9/kriNEXJ37MMkk80mwVF5m8u2MfdhkGyu5nu+nSFZ7nXqpE1Z1rVN7Bb73i/cv3Qd4tSuIJGN/4qFJvmaokaR8NKIzv3Gsx4SzoLVpA3yWBwQ8jOddhfq5aImTWZ18k28+4eoaWVsqspi/MqagkQQjRcyZcckWq/MU9COMbBrCt8XYTsSMuZOB+FfbJm/vy29z9WlBA8RkO8gOa1XjtxDRrxsdACzVEoroIfYf+6T7h+fe+r/MFNTzI3IgnA7LNL/WMKpS17yaj2EX3UU4QGpkglL9ILYktj3MPyA2IDR0/ZrNJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txiEbjPgLG7Kzqjy98pe9im+U38ZNZeQcV4HP1w5oPs=;
 b=o1ec+z6y6mV13kx9Fx6BN+IqTIj3P7ohErlS2+ur7jhQMhQoj3wh9xP8nVsp1PiG6LDhm2mBiTnCqOtAIZGkYaVeJfAR0fEZa0k/GTsgtQ0idQzc4uePCJkKPW+oMz1Fv73JDRH2BC9WQHz3hKFAW67Qa2CLF1FBWOPU6YiIcZA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 09/19] block: introduce FleecingState class
Date: Fri, 27 Aug 2021 21:17:58 +0300
Message-Id: <20210827181808.311670-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92de3920-08c5-4fa9-909c-08d96987157a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3765AD77D92AEFA1A15A4C03C1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6E51eO5NRgss9rYwuTD8MfGd0jvgtaHIB4MlH7/GAYBD8PkWNBcG8iJ5ueyKlSvrzc3HkwLV6IDnPt419E+4S6XhNNW+3VrX78HZcYKCW/DSIiYS2DWPwH/QLtheFUN/rJjkbWRy7fFNJmTkGtCIbHA+G3CLPnpm8T0Q+1TF5DaC3nYz38PJuVaCAonPDNFlLeMhQ/82+p6LWVXCjdJwhkbzgYziNgcBl3zfPAUHz5sh1UZyjuC871dZAwmyW723Defh9+oD+dXojXlv7YICwMGpaBC/jov3bUf64BjgBVqc5T/49647WMowpOLwnMN5g0R9EzxSyUMkS8ZI2rCw+ihypRDPTyQQ3r9P7feTxnERj0w+WmDMre26ki9UsZV3FiDIjnsYQ+VzBOzd96cB1VsAqeRITMf8ab1DWROJybSeaMQ/rJKhCdswwPCAglbgheaq6pEigwk1B0VfoBpgFdtbadne7QDpPsWMPrMyLoGs3rIOc/nnl9m0/kjMjJgwigdMaavAFMcamqBmN+UlOH1VCnFQJ3cMdVNyz5TbWxdFrYKPpMp/a0cHNQjHgj+llct+kknA+Y/biLosmPNVfxT+V4QF/FXIxKRwwAGkREz2xHOGMNiBE6Ld6WuJqsc+sRtH/CEFwATa5gB6euQ+FewmGTuVRTNNIaCCZ4OfRe84uU4pyxAAkkBIVKlyjnuizEL7MG0eME6D0lec/R26ts0rE3YQDfdpCRtmgPQQem832/CEp4EQge1zlK29Eyj5gUbjP+wrURoVvhPFt68K2J2YmypOK0QoritpJ0gjdKA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(30864003)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vq4Qp6E1aWVCeETO19enKBN7gqs7frMB6Dkjm2udAkhkaDnEvwZ9mSC01dIF?=
 =?us-ascii?Q?7laNNJSpdyDG/uWHcInI3oovTNyoxXDG2Af8a/GEI5MIV8/R2Jttu9c2A9M7?=
 =?us-ascii?Q?BIGGAWIF2UVJWZ2drMen7ZGmoaeLhToGbONF11QRsPMlBRCrGkVoAFwvHC0q?=
 =?us-ascii?Q?uLQOIGOrAqOkCoAQODNtS7O57GModI5Im92ihUvlUGXH4UbRx6z4m+TGsU3X?=
 =?us-ascii?Q?7S3AjITZPt8NH0zNJ8+f+ivLBv781xktdLyE3nCizLXwEKWwr9bX+8oLkjZ3?=
 =?us-ascii?Q?UjkXTWxVpAnMyQe+nqB1G4vjdNvrTpSiXaWW9tWoXbARAYFBKzkn5YrBaP0n?=
 =?us-ascii?Q?OMeB/qxgCw+j5YhJUd9oWruF8s5imzWch6lw4JvX4mu0ofxfvSQLFj3qiCuC?=
 =?us-ascii?Q?l09dfb8277lTIuviBerRYbmbv88CmDh40SrbtoseNlOwNk1LIick2cBi70BX?=
 =?us-ascii?Q?giBFlCO76sbLPLZ8ck2SSYjSBsr7EOWGW+I5ESH2EZV9+fcaV7M5XCLSRRh8?=
 =?us-ascii?Q?gJOG5JzZILPqf5hIDcG377/+SrXfdtrxu4wbsHxaYOzBKxJOjO5OOyA6Yt/+?=
 =?us-ascii?Q?jwUM8188L9I761odQrYTviBec+tBcRHnSDmiTpHqf2smnQ4c8P/UlwHKHSBc?=
 =?us-ascii?Q?qSDcVT+29UBMyryMuo0MJ01Lidbc6Gp/xBrgh+SMUfKTms/C/BZfdZBbKyMd?=
 =?us-ascii?Q?zGocOEqIMqd7HM/HPxQAQvLSm54w6Y+BKObp8kUyACTc5aJ/zkiFjlbXqiyL?=
 =?us-ascii?Q?XFndRKj7n+G6TXkoGyZ/myUgJXaB4YCgoFqq7xzmhDn1z7kpZhAdGbfxMHI/?=
 =?us-ascii?Q?B4lQxHLweqZAdFYlyPJtkdpVgh4+IlYJaVAS12fOmkSed+eT8zJKErX5rzJl?=
 =?us-ascii?Q?IB1ZXAiJqk4phja2RKXRsTU1JZ9Unuyg2nAVHTo6VazD1S9nH6qJRdTHiNcR?=
 =?us-ascii?Q?9Sv6/1zx/0XykhFAdCS4T/WsDQ4fzjlDL4qDXhwZIZK5zYShokfYc+OTI29E?=
 =?us-ascii?Q?XNk2rNtrdwKAuq5IQeCK6v06zLUR8sDYYZqTXdvQIKus+Fzw+A0X+L8VZVjq?=
 =?us-ascii?Q?3BbvhKefuv7Oq5VYG9rmq+bX0A78FRqEm8gaTbAg2LUsSXSvLgmlkwn6odlV?=
 =?us-ascii?Q?5PgVsfpMmjCDUexOqUmLr4QgdMiCUgrQo8m7uyoAfdf25rRjn5UistoPKm1i?=
 =?us-ascii?Q?BNCZwgbN30JNVnwJsHg8bHWw7dtLNEAQZOLyBFhEg0r+da4ly2ieNqslaGE2?=
 =?us-ascii?Q?D1oeOMuMPh7SNgGXrX6vCZdu7AmYUrp2RkDeFejTh+8mpmWL63YpleYtJKi+?=
 =?us-ascii?Q?N/n0uQB8dBRgWj40/KQjFh4o?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92de3920-08c5-4fa9-909c-08d96987157a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:35.2895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4W7qnxy8eKtq7K2kppxoGMINxHeA6OwV3BDSwHAZ9lnwkyAYGYp7LHu4vCJmJryYOnRQYVVwr8+wt5oOaPia+DO9j24Vhh4AS/AQeF9miOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.2.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
index 2d58170224..20f3c7eb68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2341,6 +2341,8 @@ F: block/reqlist.c
 F: include/block/reqlist.h
 F: block/copy-before-write.h
 F: block/copy-before-write.c
+F: block/fleecing.h
+F: block/fleecing.c
 F: include/block/aio_task.h
 F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
diff --git a/block/meson.build b/block/meson.build
index c630e9374a..caa52f49c2 100644
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
2.29.2


