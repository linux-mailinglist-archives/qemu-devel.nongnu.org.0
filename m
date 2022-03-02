Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9012C4CAA2F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:29:57 +0100 (CET)
Received: from localhost ([::1]:39376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRrQ-0004WW-NE
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:29:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPRmi-0003pF-I4; Wed, 02 Mar 2022 11:25:04 -0500
Received: from [2a01:111:f400:fe06::70c] (port=37767
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPRmg-0007je-PB; Wed, 02 Mar 2022 11:25:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uyzj7np9B8YdAuCY808H9TXHMUYALVnzpkL/b955jGR6AxBSYt8QrQ+xnBe2uqV5CbdXAlBvlXCAGr77NF4kxi1IR38oLXX2pRvFM5Limeqn4zf3N3w/E+ZYT55C0SF6NUfPaKsKK6TnHulO84+kzzgIe0LH0wha5uPUgVVgb3+17TP5FJ4aV8qpJcRYdaQSeqiL96BUYL9i4OEDHhVtpMrH0aelqIYmTh1iKj/NQOX3WgNAav7hyd4k4eQLaalHb+Y4qzYpk4w8lwiZUQVSSgS6gVYeVzlk6bigt2GAsN9HAYTUWKGgQA/0DXVS9UNNSX2mAy10HK37TJCf1uYvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjcSN+V7jUg4BbTkha0e0lrczm/uPm0NWYIfzxn6CTE=;
 b=mc/sx2EOcVBB2fqJzcXlMcwRCeamucW6Nar5tiQczHGRkf06xIyGZTmtwaknX8sHgu6offNNwp2DIjBesnv/mbjAsEHmhrxZv9ANGeNngjIlokMLlgcMH4QXst/NV2Hixj1r3TtQQL5oXeI7/fwaBV0afymOOPEkqM5F0E1u5ktqpERmJBukpKBweAEH/c8nWyCmTc3SkZUm3bQ7f1NR8RYv8ilwFEedj2s/J6hm9jWQBTXMB5txepZ5CiGYZFpLfuM4k1H6oZvv87QwmDGRBIyjjCVdSqg5K2tscOe/VgXDac4NFjKA2QAfJrQ4AGvcdTrl0WKR50CFsMgVPQxNdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjcSN+V7jUg4BbTkha0e0lrczm/uPm0NWYIfzxn6CTE=;
 b=d7r4zMyS/GygVWI73AYHwzBeeVffgGQOnzqAFjb2l1K3qGiBkk9tBe+J6RwWn/dq3NNkt3CaJbKVeyPFRKCSpzYoOCKlHC4URrYCxrIbNWr+HgbG9gXXhMwa8WVsc6hgggyYj96jMP94tomTYgDVG1sAo/gkLcaADMlBGzd6Qfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM6PR08MB3206.eurprd08.prod.outlook.com (2603:10a6:209:46::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Wed, 2 Mar
 2022 16:24:58 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 16:24:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 stefanha@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 1/4] util: add qemu-co-timeout
Date: Wed,  2 Mar 2022 17:24:39 +0100
Message-Id: <20220302162442.2052461-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220302162442.2052461-1-vsementsov@virtuozzo.com>
References: <20220302162442.2052461-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0064.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::15) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16b0ae5b-f440-4671-6d20-08d9fc6930f2
X-MS-TrafficTypeDiagnostic: AM6PR08MB3206:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB32065A74120EBB49D414AD3DC1039@AM6PR08MB3206.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x9CE0vir1WqKPtzherXgqrLQcNf3PI9ivHRLVh1mC3KDRmNa3bVldvYV/0viAmH9dnvqNPB/wCsVpm6jTcqvBABWlsRgeee96PhnW5V+25kRJIYqkbmNRorDbZu0DkvKaZH438CjWJINroYvLHcnGBni35gJa5eAKZQM6EyqFluQ188pB3c0uRfEUoLZeeScYaVO/s11vP3mzE23jSHC7/M1xFw9CU9Ezr7hOFFjF3n14i3yS2W7PtVUkouYmXx/ISGjSv2snBgK6IpLgIXXfw94QyIYKWlKD4vB3KSKK1067bIm2o2CQJ537t9Rrmcj8cQhxkIW27nfJPgdbaVGPHik6NL5kc9RuXIzdhpwOLczdcT0vYSu3tKylxuQSYzJ9KEqp2j0u0CoFGVWyiEAQamBAVgSGcjXuY98+P0qrS5bXF6b3AvE3w1ECrWc4jfCEgMhmirmf0QM76H5jxc+tYia2oN25fz411J+e2Gdg1haDaiD1yR9d6ymyDN0wt7htBdL9A9z7zjV/00GdWATQz9NzjYZFbWIPdvCYrhm4VLF5cPHVzwR01lfSBJKVlcvP5okiwpRTaI1ZT/T4K3S7ApuKZZdwUjlIAa4iKjqosIXu+3Om0a3jOYn31zrKOpr/uQSkp9rnsDTHHIvFUohHLGmpuCoyVSvCf0xoV0W0fjqj9Ys6qWMugbO7Rj2zzF+A9HGsyk5HLjyuPA+SWPY0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(8936002)(66946007)(66476007)(4326008)(86362001)(83380400001)(38350700002)(316002)(6916009)(186003)(38100700002)(1076003)(2616005)(26005)(2906002)(52116002)(6506007)(6512007)(6666004)(8676002)(5660300002)(508600001)(36756003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jqzlDyE6eEqnbqesL4/8EMEp64lN/d7gnPr9h1EfGIoz36J7mzAEcumWqzaJ?=
 =?us-ascii?Q?g1vIriOlcG3CtC1m2HalT5MQ1qBgNIJL8TtxmAYyl6iDcORHb316rRSq1pNG?=
 =?us-ascii?Q?rYYUUcu7O79piYxDsZgR22xzCGZnA0E0PlP0E2NKSSOZhafTI7pTpNEVahnn?=
 =?us-ascii?Q?eWkD85OUdzerYuiIhEaFcfnuuc0sKH3QEJsz2MiPAfu0uCXqjvAmPtNDIUvE?=
 =?us-ascii?Q?jKJa5PHaxQWQ5DK/wRcNL0cs5STKsU2yeL3RMn9lHAQ44+07ZW8K08c9xQeW?=
 =?us-ascii?Q?wiwMpOn01mM1SlQIrJnQtuoGSflEroFkXsOre3ktVpYvY4TuZ76QfnGgifog?=
 =?us-ascii?Q?Nrhhs4R+6lHofXKx+m3ESRu7BjSr2eT0aIVuY1Mxcd8oRJbkvcYpXoX4jnZD?=
 =?us-ascii?Q?hf5/nRJhvh/PZ/kiCspuYhEamwt2OPz0nKOPDWhWO96mLAK8l9eS4vachRR1?=
 =?us-ascii?Q?XuaEzwXV4xpRhfuJqHcgHi+pGs83eLPNYDn2bc/faCiNIwYYycxCZUgwg/Tg?=
 =?us-ascii?Q?Fl1zcQgt1Otc6Z97UXC9bjWUQo8qIqKuRFDfeEx6MsQ9ClIn8r7u2tnx56LB?=
 =?us-ascii?Q?EMLJDJnoSMRTv3wu+3Umt2xZEUx/he9HL05g93uoAC49m/WQRsQYk7sRTSKm?=
 =?us-ascii?Q?ToH25SVhJ0a/4qAE4jMx5Q5731JRfO+8iULYIB/IMvBZA5j4W1hvAnma/DoV?=
 =?us-ascii?Q?O1blBa46iHGzy1998A+pgNv+3mNhK9HmVPxzis39bTdg12gLXo5PF42FYO44?=
 =?us-ascii?Q?QQQ0X6w/xYw+Im6cuk9ADBx0CzLYGbSBSo4PZWCRs8oocFv5/5U4ahqeGjbZ?=
 =?us-ascii?Q?343QT8fRhIJlHeQwstmCckG093mgR5P2vsOIK0EK/VMJgVJUjMlfWnlSXycb?=
 =?us-ascii?Q?QUcMCEQSXYNZIcl1s9PVIVYqAiwx/g1dIQV6xuCrpzs4Pkeck3LEYap0TmBW?=
 =?us-ascii?Q?SqgibJV5Mhyv6LRaAHieuOOFiolxr629Wl5YbprIhyRTQudvlvOHfStgKvF4?=
 =?us-ascii?Q?MRqTIbUIWBgRCUTke0rNd/xqxQb40hCjqDqhtSC+xgS2aYJGrwK0bTF7NR4n?=
 =?us-ascii?Q?/zvnqo+lztCnBSnpMASfd9fLca+S7T72Pv1iLB4RkeCc6EQxEGKbMIQ3lXqf?=
 =?us-ascii?Q?gLzqsnck/EWFK7s0I4LKds0yJ2GYrEX+koZNFpFSdQesrVpHUFK77ULEsAne?=
 =?us-ascii?Q?4P/1emKvIF7Na2NB+1J4r8EGvsaOhz4LUtBXXTh7PZURVad5AtsargrtY6tI?=
 =?us-ascii?Q?q1DJ1+8Lplqq0ZG0Oods/Ot1l0bLUgLAODIINoFlWkKSy16cutv2XC4Y/rkr?=
 =?us-ascii?Q?n00MU86kpdQVeoc34Nd2uP58+tQOveJMpFtGSh3yOqR6avN/r4vWDl18ne7z?=
 =?us-ascii?Q?AZpjJrqmASK7v3ca0dH+t8zTK6tzXZO0IN47gd50fKOhzu6/tMElqfD1gjKt?=
 =?us-ascii?Q?I9HnKF+qXHhlxgUJKNZn/XPYrUh9t+ktUmU9Okg3hjBhET9okBR79vgD8FpF?=
 =?us-ascii?Q?9IjwOlLUqbnZAibgIBiRtKtZeEAaIGjE7gp39lGBNePtv3WL7VuArVeXOkUg?=
 =?us-ascii?Q?Hdhkr5bsacYMiDvCN/xc0DH7Btyx93iha+vfe5QijVuL+QVrIma5KEeyS0QG?=
 =?us-ascii?Q?lhnK6jRup3f2HhVCa4m+IQhJaU6ODQBeBqqxLpEHId3iJHmyFFL8DEXISnOC?=
 =?us-ascii?Q?thQ9Ow=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b0ae5b-f440-4671-6d20-08d9fc6930f2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 16:24:57.5251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4YnvX0gq/yFgxfSWl8eaQD57hGVtHWm9Zdw7z43Qq5Ox5zvVPud4qm6aGx+Lrjo12vsFC+g9KApRehEmot4llG+Bw1YlJJOAyPwnYEW4TU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3206
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe06::70c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe06::70c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add new API, to make a time limited call of the coroutine.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/coroutine.h | 13 ++++++
 util/qemu-co-timeout.c   | 89 ++++++++++++++++++++++++++++++++++++++++
 util/meson.build         |  1 +
 3 files changed, 103 insertions(+)
 create mode 100644 util/qemu-co-timeout.c

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index c828a95ee0..8704b05da8 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -316,6 +316,19 @@ static inline void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
     qemu_co_sleep_ns_wakeable(&w, type, ns);
 }
 
+typedef void CleanupFunc(void *opaque);
+/**
+ * Run entry in a coroutine and start timer. Wait for entry to finish or for
+ * timer to elapse, what happen first. If entry finished, return 0, if timer
+ * elapsed earlier, return -ETIMEDOUT.
+ *
+ * Be careful, entry execution is not canceled, user should handle it somehow.
+ * If @clean is provided, it's called after coroutine finish if timeout
+ * happened.
+ */
+int coroutine_fn qemu_co_timeout(CoroutineEntry *entry, void *opaque,
+                                 uint64_t timeout_ns, CleanupFunc clean);
+
 /**
  * Wake a coroutine if it is sleeping in qemu_co_sleep_ns. The timer will be
  * deleted. @sleep_state must be the variable whose address was given to
diff --git a/util/qemu-co-timeout.c b/util/qemu-co-timeout.c
new file mode 100644
index 0000000000..00cd335649
--- /dev/null
+++ b/util/qemu-co-timeout.c
@@ -0,0 +1,89 @@
+/*
+ * Helper functionality for distributing a fixed total amount of
+ * an abstract resource among multiple coroutines.
+ *
+ * Copyright (c) 2022 Virtuozzo International GmbH
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
+#include "qemu/osdep.h"
+#include "qemu/coroutine.h"
+#include "block/aio.h"
+
+typedef struct QemuCoTimeoutState {
+    CoroutineEntry *entry;
+    void *opaque;
+    QemuCoSleep sleep_state;
+    bool marker;
+    CleanupFunc *clean;
+} QemuCoTimeoutState;
+
+static void coroutine_fn qemu_co_timeout_entry(void *opaque)
+{
+    QemuCoTimeoutState *s = opaque;
+
+    s->entry(s->opaque);
+
+    if (s->marker) {
+        assert(!s->sleep_state.to_wake);
+        /* .marker set by qemu_co_timeout, it have been failed */
+        if (s->clean) {
+            s->clean(s->opaque);
+        }
+        g_free(s);
+    } else {
+        s->marker = true;
+        qemu_co_sleep_wake(&s->sleep_state);
+    }
+}
+
+int coroutine_fn qemu_co_timeout(CoroutineEntry *entry, void *opaque,
+                                 uint64_t timeout_ns, CleanupFunc clean)
+{
+    QemuCoTimeoutState *s;
+    Coroutine *co;
+
+    if (timeout_ns == 0) {
+        entry(opaque);
+        return 0;
+    }
+
+    s = g_new(QemuCoTimeoutState, 1);
+    *s = (QemuCoTimeoutState) {
+        .entry = entry,
+        .opaque = opaque,
+        .clean = clean
+    };
+
+    co = qemu_coroutine_create(qemu_co_timeout_entry, s);
+
+    aio_co_enter(qemu_get_current_aio_context(), co);
+    qemu_co_sleep_ns_wakeable(&s->sleep_state, QEMU_CLOCK_REALTIME, timeout_ns);
+
+    if (s->marker) {
+        /* .marker set by qemu_co_timeout_entry, success */
+        g_free(s);
+        return 0;
+    }
+
+    /* Don't free s, as we can't cancel qemu_co_timeout_entry execution */
+    s->marker = true;
+    return -ETIMEDOUT;
+}
diff --git a/util/meson.build b/util/meson.build
index 3736988b9f..44392e89a4 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -82,6 +82,7 @@ if have_block
   util_ss.add(files('block-helpers.c'))
   util_ss.add(files('qemu-coroutine-sleep.c'))
   util_ss.add(files('qemu-co-shared-resource.c'))
+  util_ss.add(files('qemu-co-timeout.c'))
   util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
   util_ss.add(files('readline.c'))
   util_ss.add(files('throttle.c'))
-- 
2.31.1


