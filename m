Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF3D32F260
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:22:09 +0100 (CET)
Received: from localhost ([::1]:35744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIF5U-0006hP-Hz
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMc-0004wL-Qx; Fri, 05 Mar 2021 12:35:47 -0500
Received: from mail-eopbgr30124.outbound.protection.outlook.com
 ([40.107.3.124]:32132 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMZ-0005C4-SQ; Fri, 05 Mar 2021 12:35:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTq2atMXVWOrLFIpZHz4oKJGEdHD3MgSJ3zoo+rDe8xwbKF3bDAwgE23RAeb+oqrisMeLjMdTh2m+akthL7H7pV4W9MSHOlAYsZz7gU+KOrF2UHd/OZahzGrk4hqJ0FHXxCOfXLTyFDiHN4eRS/Z6rfZMlaqVwtcJj5/pF/zMdwSdzlZoFYcxPO6o2Ce/4WleUuSLHImzI8qZ2JE6PiFOTbHyS4wnQjeRPHRPvm9/o1Edg0bsSLYpZxlaceW5FYiTj2nhq+Mz6fYyRuP5psvuxeEWVG1dXKUhZ5Hv1/d3bItRTJHOcacmVzglKuKm3p1n2PhTnsYRvHqFqlJw/AW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0CAWZrvLtoFXm/TNktW68d0kmwrGlEe2Otw+N5QY34=;
 b=nv36VpWOuU5P9ddBezL7RMp09B5QvZo//CGEmEt8hcF1g9p80QN2EEyAMMfPvcezTVvdInbbOFNpHS8QnZUEQaxUfAoTJ5P1p4y6sBIpUbCnze9kB5bScoI+bBNTbEzCzQeXLtms/TAGy41M9fu8DYqs5RTcN2t8//Yhmp6bPv99z1QX+aP+zQ85ZImWebIi9lLgjiEuDP5E324wiHe2CKyBZwwdJiJkJhvPOisLwk+kLOGrOlKRZHIRw9bVju+6D62OAdbObSESKPJYKCSo9V1Q3SbKgwHNA2AxVTyG7drw8xGcL9I8NpDHErBFNjn2BEp6YtGIzFh81mhMuaDI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0CAWZrvLtoFXm/TNktW68d0kmwrGlEe2Otw+N5QY34=;
 b=p+vSwm1vZoUt7jPyn5L6mY+1KnVSGb2zlifP0pYAqeINB+YZeW4dJz38Xlt9jqFLTW5+tn7jMWO11rcL4k3xNruzWjOkFPHmN1lWM5q61hUyPmm3x9dJCd4943uX/I6TTUS0+rbQisA06JD1P+uJEiG1YOF2LcIfZffo78OqxpI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4408.eurprd08.prod.outlook.com (2603:10a6:20b:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 5 Mar
 2021 17:35:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 17:35:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com
Subject: [PATCH v3 4/6] util: implement seqcache
Date: Fri,  5 Mar 2021 20:35:05 +0300
Message-Id: <20210305173507.393137-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210305173507.393137-1-vsementsov@virtuozzo.com>
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR02CA0119.eurprd02.prod.outlook.com
 (2603:10a6:7:29::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR02CA0119.eurprd02.prod.outlook.com (2603:10a6:7:29::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 17:35:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28059b9c-e12b-4f59-6e70-08d8dffd1171
X-MS-TrafficTypeDiagnostic: AM6PR08MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4408F8E692DBD549BA4EF238C1969@AM6PR08MB4408.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FZzJiKpJLMeVN8XLkbBqF81HYiWHlPHBEgH69Zq0Eq+QmmKJfabqJ//t3l8qKsvYCcyALuWsTvQLlq2yYRh4GJjYTs360SWBsNJlyqdPiUePHgcZEte9aUqGpMK6nmLWKklxXqHk9GjNqmBkQ/9bqVuFUT+TrMOM8yscDLUz4LBItHDM1t8825gQU0WIhq5UPTUCvFyv2quoKOMD4vjhINFEgbXS5H9abRiAbnX/PUNPR2MuLu8Ic3mUHbNo0qmhTZeutNAwGJhxJSJV9Wq8AjmWev1XCwWE5sD3ncWIq/3ZElvvgoW2UGtkAzD6eDtyS63lp7An24hpeF2ggNDQl/q9V6Q0huT25V6qd12BofSQRDnahgZLfE6gprGhKJYS5mcFR06rArpE5vwhjV3zV4Zxm9NeIMEh6+2BqZ2qNdQJnRk5nxTY0YUIZtV8q2Nv59S4qx6JTN+osrxS4+cE/Vl+iinfoGpwSZIJD0hw5PtklQs4wH0io4GYBoKi3EmvLviExvSqq62LYS9wviP18+qzsvtWpWfFmR2G0Wk7IQ/xIC80RnVZKRxtc4fuP5QXREi4c/XGv/egZVEt2nED6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39850400004)(396003)(376002)(346002)(16526019)(66476007)(478600001)(186003)(8936002)(8676002)(6916009)(1076003)(956004)(6486002)(83380400001)(69590400012)(52116002)(26005)(6666004)(6506007)(2906002)(2616005)(4326008)(66556008)(316002)(6512007)(36756003)(66946007)(30864003)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nusAoJIRp2iwUt7oicbIxHpXqMorWvg/utvROlal5bWl7fBxSfBmmNpi1JEX?=
 =?us-ascii?Q?erG9yJyNlqdV9xFM52Z+h+2ZbfdkG32qlFCeU+Ci9goaNFBGFaMQaIXaRgWe?=
 =?us-ascii?Q?hLSKpRK6DXMjG8vm9jlOMEBYVx0S7IGXENfUVbV2yeIF1hFwVfSR8RXx2RIm?=
 =?us-ascii?Q?pp0bcVYapzPoX1bUYGUHeFB1SGSavPlDcHLRyZVHry7DvnCmpK2ADKJBekm8?=
 =?us-ascii?Q?Su0whY6jAfRv6MoXcrPKdONcH161tLGFyKAY2vxqGIpfe9d+JQaWuHDY1MiS?=
 =?us-ascii?Q?dnzZr0FARIhaj1+D+gnEF5/mhmQqvq7LNoB7H+gI56fH9TB3tmnG0uxB4j6V?=
 =?us-ascii?Q?OIXA5v7a+MDxEJ45tyx/ZzTR4vTIesRH1YSVBoMMWpiVOkvGIw/nmVVwyKUp?=
 =?us-ascii?Q?wxn0ZQ7RIXQAuQgrKZY7rlyyRob0qdPUgkjR/H3gLv4mcAai6tX9bS50cl3N?=
 =?us-ascii?Q?WJLhX5JZkowIFG3FJSwKEvPK2C7EhGoA0Cbk14UtTSLVs2E9GiRXrE5zNkjT?=
 =?us-ascii?Q?z/i1lJM8ERvpBB2YALoCh5W8VKdGpMKy88F9QSPbfXOfw6lNs79xzJUNtXzL?=
 =?us-ascii?Q?SuQoHwOAPXuc78YHZjBBnmd4dtEl+i+Q9G3j06KCz0seUfbbSwPoVXXUA6HO?=
 =?us-ascii?Q?ZwhK0e+vUZWn8O1ggRAcvoCi/BkFyoQRKXAhLigCGBYBnOfAHE9HlywBFZ99?=
 =?us-ascii?Q?OS/1MDy2GGk9AXmQ0LX82r7SLQkpUl4tT9Re5gOKFMej9PJUfhLKl8Ss+A13?=
 =?us-ascii?Q?FDsl1gMsjLLkIzZZOjc8WwFTEfnIZ89b//2eSQhNa8relW3a/VJvNytmnjbN?=
 =?us-ascii?Q?ulUzqhcy48gkM3IBmceyNcnT0NmyaZJ2gYL0b8RwwAyWJo/Co2hVI14ePd7e?=
 =?us-ascii?Q?8VWUIzT8PoWPJmlHSn34u4jidMUtHpvytCZ2CRMPfMcLtK602qgdCi6Ar5Z1?=
 =?us-ascii?Q?1yizP2zutjPMG25K3u+6YoJxB9GI4TxD6vl/l5U+YxVrj79v2m+mPYrC4WDc?=
 =?us-ascii?Q?GpTwha2MwzArFqDusZVRMKvkJw/JYb1DSyjz9ximcosqrMudx/OZi7JgXAIj?=
 =?us-ascii?Q?z+vBYBiHsQeWlrnI0empiYt8vdJFeqlYFNedSomHAiBJ+qcZ1imAEwpRedni?=
 =?us-ascii?Q?0p2DaeYQaBe93D797QLYCE3frpyvBRLgHpJLw9dXX3Jor0foAtCMFGDlpe+a?=
 =?us-ascii?Q?quKxY+Mhe1O5j/9tznjzgUGJRIxKfn7Pt33XMbCW8Xqg0hM47DBtFVeO4LLr?=
 =?us-ascii?Q?V6HHhYgMXvqqosZwe5uYQEeywMVOjw82RBn23kPHFmqsAXAnRhJbKXfsmEit?=
 =?us-ascii?Q?BMCb6XGrhqMdS9Oq2j73EreO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28059b9c-e12b-4f59-6e70-08d8dffd1171
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 17:35:28.7646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypONcR4uPtbM1JfFIBN6Vi8xX31mIQNQY71DRGnEFDXEhn7BnF3WUM8gYHGLMHXJKmN1z8qbBTQmL6040PdoywzFdGytJGSjt50/wDyUUcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4408
Received-SPF: pass client-ip=40.107.3.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

Implement cache for small sequential unaligned writes, so that they may
be cached until we get a complete cluster and then write it.

The cache is intended to be used for backup to qcow2 compressed target
opened in O_DIRECT mode, but can be reused for any similar (even not
block-layer related) task.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/seqcache.h |  42 +++++
 util/seqcache.c         | 361 ++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS             |   6 +
 util/meson.build        |   1 +
 4 files changed, 410 insertions(+)
 create mode 100644 include/qemu/seqcache.h
 create mode 100644 util/seqcache.c

diff --git a/include/qemu/seqcache.h b/include/qemu/seqcache.h
new file mode 100644
index 0000000000..a308d54b01
--- /dev/null
+++ b/include/qemu/seqcache.h
@@ -0,0 +1,42 @@
+/*
+ * Cache for small sequential write requests.
+ *
+ * Copyright (c) 2021 Virtuozzo International GmbH.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef QEMU_SEQCACHE_H
+#define QEMU_SEQCACHE_H
+
+typedef struct SeqCache SeqCache;
+
+SeqCache *seqcache_new(int64_t cluster_size);
+void seqcache_free(SeqCache *s);
+
+void seqcache_write(SeqCache *s, int64_t offset, int64_t bytes, uint8_t *buf);
+int64_t seqcache_read(SeqCache *s, int64_t offset, int64_t bytes, uint8_t *buf);
+
+bool seqcache_get_next_flush(SeqCache *s, int64_t *offset, int64_t *bytes,
+                             uint8_t **buf, bool *unfinished);
+void seqcache_discard_cluster(SeqCache *s, int64_t offset);
+
+uint64_t seqcache_nb_clusters(SeqCache *s);
+
+#endif /* QEMU_SEQCACHE_H */
diff --git a/util/seqcache.c b/util/seqcache.c
new file mode 100644
index 0000000000..d923560eab
--- /dev/null
+++ b/util/seqcache.c
@@ -0,0 +1,361 @@
+/*
+ * Cache for small sequential write requests.
+ *
+ * Copyright (c) 2021 Virtuozzo International GmbH.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ *
+ *
+ * = Description =
+ *
+ * SeqCache is an abbreviation for Sequential Cache.
+ *
+ * The Cache is intended to improve performance of small unaligned sequential
+ * writes. Cache has a cluster_size parameter and the unit of caching is aligned
+ * cluster.  Cache has a list of cached clusters, several "finished" ones and at
+ * most one "unfinished". "unfinished" cluster is a cluster where last byte of
+ * last write operation is cached and there is a free place after that byte to
+ * the end of cluster. "finished" clusters are just stored in cache to be read
+ * or flushed and don't allow any writes to them.
+ *
+ * If write to the cache intersects cluster bounds, it's splat into several
+ * requests by cluster bounds. So, consider a write that doesn't intersect
+ * cluster bounds to describe the whole picture:
+ *
+ * There are two cases allowed:
+ *
+ * 1. Sequential write to "unfinished" cluster. Actually it's a write sequential
+ *    previous write. The data goes to "unfinished" cluster. If "unfinished" is
+ *    filled up to the cluster bound it becomes "finished".
+ *
+ * 2. Write to new cluster, not existing in the cache. It may be sequential to
+ *    previous write or not. Current "unfinshed" cluster (if exists) becomes
+ *    "finished" and new "unfinished" cluster is started. Note also that offset
+ *    of the write to new cluster is not required to be aligned.
+ *
+ *    Any other write operation (non-sequential write to "unfinished" cluster
+ *    or write to any of "finished" clusters) will crash.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qemu/queue.h"
+#include "qemu/seqcache.h"
+
+/*
+ * Cluster
+ *
+ * Representation of one cached cluster, aligned to SeqCache::cluster_size.
+ * Caches only one subregion of the cluster, started at @offset (may be
+ * unaligned to cluster_size) and of @bytes length (may be unaligned as well).
+ * The whole subregion always lay in one aligned cluster:
+ *
+ *      QEMU_ALIGN_DOWN(offset, cluster_size) ==
+ *          QEMU_ALIGN_DOWN(offset + bytes - 1, cluster_size)
+ *
+ * @buf is allocated to be able to fill the cluster up to the cluster end, i.e.
+ * allocated @buf length is at least:
+ *
+ *      cluster_size - offset % cluster_size
+ */
+typedef struct Cluster {
+   int64_t offset;
+   int64_t bytes;
+   uint8_t *buf;
+   QSIMPLEQ_ENTRY(Cluster) entry;
+} Cluster;
+
+/*
+ * SeqCache caches small sequential writes into "unfinished" @cur_write cluster,
+ * until entire cluster (of @cluster_size bytes) is filled by seqcache_write()
+ * calls.
+ *
+ * @cur_write->offset may be unaligned to @cluster_size if first write offset is
+ * not aligned (for example, if there was a flush request and cache was flushed,
+ * then we continue from the middle of the cluster with an empty cache).
+ *
+ * @cur_write may be NULL, which means we don't have current cluster and next
+ * seqcache_write() will start a new one.
+ *
+ * @all is a list of all clusters cached in the cache, some "finished" and one
+ * "unfinished" @cur_write (if exists). If @cur_write is not NULL it is a last
+ * one in the list.
+ *
+ * @nb_clusters is number of elements in @all list.
+ *
+ * @next_flush is an iterator for flushing. SeqCache knows nothing about how
+ * data should be flushing, so for flush user calls seqcache_get_next_flush()
+ * (which moves @next_flush iterator) and when data is flushed somehow and cache
+ * is not needed anymore, user can call seqcache_discard_cluster().
+ */
+typedef struct SeqCache {
+    int64_t cluster_size;
+    int64_t nb_clusters;
+    Cluster *cur_write;
+    Cluster *next_flush;
+    QSIMPLEQ_HEAD(, Cluster) all;
+} SeqCache;
+
+static void cluster_free(Cluster *req)
+{
+    if (req) {
+        g_free(req->buf);
+        g_free(req);
+    }
+}
+
+SeqCache *seqcache_new(int64_t cluster_size)
+{
+    SeqCache *s = g_new(SeqCache, 1);
+
+    *s = (SeqCache) {
+        .cluster_size = cluster_size,
+    };
+
+    QSIMPLEQ_INIT(&s->all);
+
+    return s;
+}
+
+/*
+ * User should clean the cache calling seqcache_get_next_flush() and
+ * seqcache_discard_cluster() sequentially before freeing it.
+ */
+void seqcache_free(SeqCache *s)
+{
+    if (s) {
+        assert(QSIMPLEQ_EMPTY(&s->all));
+        g_free(s);
+    }
+}
+
+/* End of cached region inside one cluster */
+static int64_t cached_end(Cluster *cl)
+{
+    return cl->offset + cl->bytes;
+}
+
+/* Start of aligned cluster containing the @offset */
+static int64_t cluster_start(SeqCache *s, int64_t offset)
+{
+    return QEMU_ALIGN_DOWN(offset, s->cluster_size);
+}
+
+/* End of aligned cluster containing the @offset */
+static int64_t cluster_end(SeqCache *s, int64_t offset)
+{
+    return cluster_start(s, offset) + s->cluster_size;
+}
+
+/* Align down @offset to s->cluster_size and search for corresponding cluster */
+static Cluster *seqcache_find_cluster(SeqCache *s, int64_t offset)
+{
+    Cluster *cl;
+    int64_t cl_start = cluster_start(s, offset);
+
+    QSIMPLEQ_FOREACH(cl, &s->all, entry) {
+        if (cluster_start(s, cl->offset) == cl_start) {
+            return cl;
+        }
+    }
+
+    return NULL;
+}
+
+/* Makes current "unfinished" cluster the "finished" one. */
+static void seqcache_finalize_current_cluster(SeqCache *s)
+{
+    if (s->cur_write && !s->next_flush) {
+        s->next_flush = s->cur_write;
+    }
+    s->cur_write = NULL;
+}
+
+/*
+ * Write an @offset, @bytes, @buf request into the cache. The requests MUST not
+ * intersect cluster bounds.
+ */
+static void seqcache_write_one(SeqCache *s, int64_t offset, int64_t bytes,
+                               uint8_t *buf)
+{
+    assert(bytes > 0);
+    assert(cluster_start(s, offset) == cluster_start(s, offset + bytes - 1));
+
+    if (s->cur_write && offset == cached_end(s->cur_write)) {
+        /* Continue sequential process */
+        memcpy(s->cur_write->buf + s->cur_write->bytes, buf, bytes);
+        s->cur_write->bytes += bytes;
+
+        if (cached_end(s->cur_write) == cluster_end(s, s->cur_write->offset)) {
+            seqcache_finalize_current_cluster(s);
+        }
+
+        return;
+    }
+
+    /* We are starting a new cluster. Check that it's really new */
+    assert(!seqcache_find_cluster(s, offset));
+
+    seqcache_finalize_current_cluster(s);
+
+    s->cur_write = g_new(Cluster, 1);
+    *s->cur_write = (Cluster) {
+        .offset = offset,
+        .bytes = bytes,
+        .buf = g_malloc(s->cluster_size),
+    };
+
+    memcpy(s->cur_write->buf, buf, bytes);
+    QSIMPLEQ_INSERT_TAIL(&s->all, s->cur_write, entry);
+    s->nb_clusters++;
+}
+
+/* Write an @offset, @bytes, @buf request into the cache. */
+void seqcache_write(SeqCache *s, int64_t offset, int64_t bytes, uint8_t *buf)
+{
+    while (bytes) {
+        int64_t cl_end = cluster_end(s, offset);
+        int64_t chunk = MIN(bytes, cl_end - offset);
+
+        seqcache_write_one(s, offset, chunk, buf);
+        offset += chunk;
+        bytes -= chunk;
+        buf += chunk;
+    }
+}
+
+/*
+ * Read from the cache.
+ *
+ * If @offset misses the cache, return 0.
+ *
+ * If @offset is inside the cache, copy corresponding available data to @buf
+ * (may be less than required @bytes if hole reached earlier) and return number
+ * of bytes copied.
+ */
+int64_t seqcache_read(SeqCache *s, int64_t offset, int64_t bytes, uint8_t *buf)
+{
+    uint8_t *pos = buf;
+
+    while (bytes) {
+        Cluster *cl = seqcache_find_cluster(s, offset);
+        int64_t chunk;
+
+        if (!cl || offset < cl->offset || offset >= cached_end(cl)) {
+            break;
+        }
+
+        chunk = MIN(bytes, cached_end(cl) - offset);
+        memcpy(pos, cl->buf + offset - cl->offset, chunk);
+        offset += chunk;
+        bytes -= chunk;
+        pos += chunk;
+
+        if (!QEMU_IS_ALIGNED(offset, s->cluster_size)) {
+            break;
+        }
+    }
+
+    return pos - buf;
+}
+
+/*
+ * Get next region for flushing. @offset, @bytes and @buf are out-parameters
+ * to return the region.
+ *
+ * @unfinished is in-out argument which means that user is interested in
+ * flushing unfinished cluster too:
+ *
+ * If there are "finished" clusters, "finished" cluster is returned and
+ * *@unfinished is set to false, independently of its original value.
+ *
+ * If there are no "finished" clusters but "unfinished" exists (i.e.
+ * s->cur_write != NULL and it is the only element of s->all), then *@unfinished
+ * value remains the same and the following logic works:
+ *
+ *    If *@unfinished:
+ *       return s->cur_write unfinished cluster for flushing
+ *    Else
+ *       return nothing
+ *
+ *
+ * Returns true and set @offset, @bytes, @buf and @unfinished if there is
+ * something to flush (accordingly to @unfinished value), returns false
+ * otherwise.
+ *
+ * Nothing is removed from the cache.
+ */
+bool seqcache_get_next_flush(SeqCache *s, int64_t *offset, int64_t *bytes,
+                             uint8_t **buf, bool *unfinished)
+{
+    Cluster *req = s->next_flush;
+
+    if (s->next_flush) {
+        *unfinished = false;
+        req = s->next_flush;
+        s->next_flush = QSIMPLEQ_NEXT(req, entry);
+        if (s->next_flush == s->cur_write) {
+            s->next_flush = NULL;
+        }
+    } else if (s->cur_write && *unfinished) {
+        req = s->cur_write;
+    } else {
+        return false;
+    }
+
+    *offset = req->offset;
+    *bytes = req->bytes;
+    *buf = req->buf;
+
+    return true;
+}
+
+/*
+ * Find corresponding cluster and drop it. No matter does requested @offset is
+ * cached itself or not.
+ */
+void seqcache_discard_cluster(SeqCache *s, int64_t offset)
+{
+    Cluster *cl = seqcache_find_cluster(s, offset);
+
+    if (!cl) {
+        return;
+    }
+
+    if (cl == s->cur_write) {
+        assert(cl != s->next_flush);
+        s->cur_write = NULL;
+    } else if (cl == s->next_flush) {
+        assert(cl != s->cur_write);
+        s->next_flush = QSIMPLEQ_NEXT(s->next_flush, entry);
+        if (s->next_flush == s->cur_write) {
+            s->next_flush = NULL;
+        }
+    }
+
+    QSIMPLEQ_REMOVE(&s->all, cl, Cluster, entry);
+    cluster_free(cl);
+    s->nb_clusters--;
+}
+
+/* Returns number of cached clusters including unfinished */
+uint64_t seqcache_nb_clusters(SeqCache *s)
+{
+    return s->nb_clusters;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 9b2aa18e1f..5e263c3343 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3347,3 +3347,9 @@ Performance Tools and Tests
 M: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
 S: Maintained
 F: scripts/performance/
+
+Sequential Cache
+M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+S: Supported
+F: util/seqcache.c
+F: include/qemu/seqcache.h
diff --git a/util/meson.build b/util/meson.build
index 984fba965f..6682e463ac 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -75,6 +75,7 @@ if have_block
   util_ss.add(files('block-helpers.c'))
   util_ss.add(files('qemu-coroutine-sleep.c'))
   util_ss.add(files('qemu-co-shared-resource.c'))
+  util_ss.add(files('seqcache.c'))
   util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
   util_ss.add(files('readline.c'))
   util_ss.add(files('throttle.c'))
-- 
2.29.2


