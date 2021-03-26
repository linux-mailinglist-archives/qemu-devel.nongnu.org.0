Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED07A34B027
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:27:01 +0100 (CET)
Received: from localhost ([::1]:43044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPt2q-0004yt-Vp
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPse1-0000bf-Ti; Fri, 26 Mar 2021 16:01:21 -0400
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:54454 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPsdz-0006Yw-Gp; Fri, 26 Mar 2021 16:01:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQWlZxK/GTY3XLRUnSm3RFRT5buDbgwUclucx2LjEMXo5g4p7BzFYDXv+MyXw+9dUR5Mw3sQvMHw7dEmCahmcPplYthgJcWbS2EnzXpkllEIOJD9/mtzl6njz6aqlhz+ZdOLi8ZD6IvZKxSDKMLs22S+7BOdqVxC8aGk6i6MI9nKjasfo3x8iSLDxX3xR3pP72QsQjlK5ivcAO19N8DOoz/53zh5tNIuIRaz4vbU4DxOqxiIr7r0UycgBJAtvUqd1CP3zSQKxscPoarkKBU//f9hjDVIAuC9+Us1bpDI4Po0E2zpeZKcU/1NldeEcEHAFoKPsEQ3Nuh6IWXtVx/vgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Udo0lvdE7fqNfuTvNF1H2PhumtJnPOyuY2Fbm3iNj5w=;
 b=E0oZrumouhEwsX8gwi4RwQkrTLUpE6m0v8gcGGOuX6Ab7SpUnP5ifjTsJaiaZuUi0EAYGzz/S7KwN6nypT6CV0UOIeCLeajkpdV8mvemTNzYS3iG7uvBKqW9HAV36pI42ZDsMfTOFAy3rZc0kH+1hsw56vI19fn1Y70OObRwllHEUQFmtAyhDc9U4lXocntSHM6Wig+rCu9g40H5FNcbkx0dQT41KZIx9L3HBKchwUk40dXjfj9n7ehE3IHYCgHn7ocEVQqgvOUJ/7uxejX6qdtXJVgT95C1mJzi66a5bvgXkjS9RscxbqNT2r5L2WmmbVIBkmojJYbJhT2UNwbjGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Udo0lvdE7fqNfuTvNF1H2PhumtJnPOyuY2Fbm3iNj5w=;
 b=aaS4dD0QfPuZN8Euhh11TKdIyruZI7xIAaifu/Z7Do+TRAbQtmsEZTQJRyhmyRnPBgUFaVlc4bJLewk3cPO62U1EM4FVEq3J28KWj+YVjAoF4o1iR3N0QS0Wpeu0xzUjLkK6IhUJHajMgqbf/xG6WgB7OO5uDiYNU40n7jZEgnE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 20:01:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 20:01:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v5 4/6] qcow2: introduce inflight-write-counters
Date: Fri, 26 Mar 2021 23:00:43 +0300
Message-Id: <20210326200045.363290-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210326200045.363290-1-vsementsov@virtuozzo.com>
References: <20210326200045.363290-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0166.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0166.eurprd05.prod.outlook.com (2603:10a6:3:f8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Fri, 26 Mar 2021 20:01:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1fc27cd-37e7-447c-b12a-08d8f091e43e
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB58779D484FCE8DFEA330DB8AC1619@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:232;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MmAoHLcQPegW7I7ARf3TVG07uJuXypPQtCqr+ZfjBkhhiqN2DHOqJz7He1ctCjYZoFT6axN+DALAcpGrwS/ptxfPBnSC+a2d4rm8mDqj93kdCSZvSvE/UpxYUMb1NCoQLsJ9wAn3f/UygrpIyAdfOfDmLKzDlsUDbwTBwYgrhjjd8RigYMvYGcgDFnwuG9npxWlBl+JoHBcxSAH8It85t05gFUdorqtOeZ3YJSTvN0SCl3EcoQ6aBnz26oTmJxG1dpVvKZSvMI3Rle7SWZasr/BqXzpiQm9ePejW8G5PQfTjtOQ/ccZzUfyoLwjmlEj1+i/RqBipXS911xY1LQ/7Qwd6r97dATJLvzqlAdL1Rkac82E5irN4SW56qZm4w6lMi2qAco/ubABAoESh+4PTSLqM1IeirFDcr+mW3KHBxIpWN6+z5MsQR0HW75JP9WTf9r2iyrtiOz68e/jFOikSbAG7WdY/3wPZblK5FGUHb5OTCEz/h8Fzg160NCZ6QR/Cok/Wcr1gBSaQNuxkWBbtaEKawtG/m/UtJKhGkCczhp5fEWUYK1aeynl0jHpS9ODHojj8f2kmZXFy0Q5U1jjXt1HS7aA8N2e0P7EXARM8kcRT4go5R38t6DBWjMVlWmQ3ThBoAxyjk7BqiDJ21tcdVFEAzDcvxdfscHYYCMrkeY3EGLMnTY+kHKeyymUddELrTOaDdGEmWhjx052SoTN96A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(366004)(376002)(136003)(396003)(1076003)(316002)(6486002)(52116002)(19627235002)(36756003)(6916009)(86362001)(8936002)(956004)(107886003)(5660300002)(2616005)(4326008)(26005)(16526019)(186003)(83380400001)(38100700001)(6506007)(6666004)(69590400012)(478600001)(66946007)(2906002)(66556008)(66476007)(8676002)(6512007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MRWFTnlMQTtxzllFn5/TguLisl8VM28JOLBwROblO67jRaALvdXnArBbAEPK?=
 =?us-ascii?Q?VyLQwhrtsHbOP30tTh96k041Rh/n8UDXZudkoc8MVR7inFq5zyElAR7bDQkm?=
 =?us-ascii?Q?zo5LggxAkF9OKrP/MdvXFKY7uALEMAHmKf7OfVQD7EzWB2Reu4g/spMxeuRs?=
 =?us-ascii?Q?H69zzyVF3X1nscccFwzHPgB6xYU6M97AjhVNmI/YmWPfnnddVZgG0tSKhxD1?=
 =?us-ascii?Q?tGWlYjMAeM2bb/Toncx3ZCGuJBMHBwmTSmEzDXdljYOyegsnpDedy86Cw/cw?=
 =?us-ascii?Q?kbxCEI/CZ/2SAAoAg+/ADogJWBOjnqnrYXE70tb4AuUnAEErMpCWG/UCMXO5?=
 =?us-ascii?Q?7W+DNpmU8n81gPEBb3WJ0Kv72FZcjidfr41pdXQ7Be5teUHdsdIKTs/6vqhu?=
 =?us-ascii?Q?5iZ2Wrr1gBCOjhMDQ2k7zlXAtQ2EfrbmebxzMRQ4jrElador1FYcSuq0uY/l?=
 =?us-ascii?Q?9R7ANWOqsKHz2Cj/vj+eloBQOAeAvK9UkVb8VMzNfaVrL5dxu2YmZMTrovOx?=
 =?us-ascii?Q?kNd3CVb/wnSO+Mmi5lh5wv/sIyCatW8osH6pSLzeATl16skRrsTFrHRKPSGA?=
 =?us-ascii?Q?v0kvrM0wr8/hFC2BD6djZ/FyDbZLj9SvV1Qfc17LZLUgf+Wab0ahiS3UF468?=
 =?us-ascii?Q?Apet/UeCUXw2oK/+JTECs91ywrSzMJ0zPBjTcEjKytXpN2+eH5rLyKFFjt9x?=
 =?us-ascii?Q?y49larUEjJ/0uwzOev1UCIkzc/oK9YlVIGrZeH4WSlwuE2zCZzjvWXgahQt5?=
 =?us-ascii?Q?NclqbWJMjsWHmDS19jwykntoZ/xC9yBs4kuZwQQIw7FnIdEtM4XFcczCZ1Y+?=
 =?us-ascii?Q?D2CxrpX7NLqLavRSq4trOjZz9ysiBqTSaXyqXygdZVmGNqI9km9jk8nB6DFc?=
 =?us-ascii?Q?0918yzDBI7KSQGyYnl4xohKmaWnMYU2Plk2UHEa2lBvQYgWlR7qWJDpBVoXg?=
 =?us-ascii?Q?7h/0FkVWjjAdWOjzX/SILGugToVrBrt6VUQ+7WyrMhbtPh+2rt1h0t9lGjjp?=
 =?us-ascii?Q?UsI4OROIVNxeOTHSHFfMX71vLFut0xXtfY0V0WDzclsYzGCq/nOrW8RVu3W0?=
 =?us-ascii?Q?8YE2nU3CJMJ4R9mZdJxn5jvZ33g1BwXoC/b9jL0f3DAfs3T4pm4ptzJtjY9A?=
 =?us-ascii?Q?E8f4uPt7kqIFKaqSTKvIPKD8YHlNtK+2hkmP/yW8K4C/2cpzpbtRFhDNGAXx?=
 =?us-ascii?Q?Qnm6I1z3+oqEkEfKxEJyZcbbEBYuR6A5pE39lGxd15rwyQTyRzMCYPLljRRh?=
 =?us-ascii?Q?ws/WrF3PWijQqkhSqYu1lFJ8RNWQr9jZsbBcL4hBBghHbNkbrILsX6ADf7Ns?=
 =?us-ascii?Q?b8Enr61olX7IrBd0ifLEvVWE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fc27cd-37e7-447c-b12a-08d8f091e43e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 20:01:06.5482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbxlvpAm2LC1nN8oM25vaWgMI3QGsaerC0TudbIUfap5S1+CsJG5rtyjVMLXCG5vQVUu4iGuYNJV6Ki4kGkexFHM5mhsARjvZxZDEpekJz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We have a bug in qcow2: assume we've started data write into host
cluster A. s->lock is unlocked. During the write the refcount of
cluster A may become zero, cluster may be reallocated for other needs,
and our in-flight write become a use-after-free. More details will be
in the further commit which actually fixes the bug.

For now, let's prepare infrastructure for the following fix. We are
going to track these in-flight data writes. So, we create a hash map

  cluster_index -> Qcow2InFlightRefcount

For now, add only basic structure and simple counting logic. No guest
write is actually counted, we only add infrastructure.
Qcow2InFlightRefcount will be expanded in the following commit, that's
why we need a structure.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h          | 16 ++++++++
 block/qcow2-refcount.c | 86 ++++++++++++++++++++++++++++++++++++++++++
 block/qcow2.c          |  5 +++
 3 files changed, 107 insertions(+)

diff --git a/block/qcow2.h b/block/qcow2.h
index 0fe5f74ed3..b25ef06111 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -420,6 +420,17 @@ typedef struct BDRVQcow2State {
      * is to convert the image with the desired compression type set.
      */
     Qcow2CompressionType compression_type;
+
+    /*
+     * inflight_writes_counters:
+     *   Map cluster index (int64_t) -> Qcow2InFlightWriteCounter
+     *
+     * The map contains entries only for clusters that have in-flight data
+     * (not-metadata) writes. So Qcow2InFlightWriteCounter::inflight_writes_cnt
+     * is always (except for when being removed in update_inflight_write_cnt())
+     * >= 1 for stored elements.
+     */
+    GHashTable *inflight_writes_counters;
 } BDRVQcow2State;
 
 typedef struct Qcow2COWRegion {
@@ -896,6 +907,11 @@ int qcow2_shrink_reftable(BlockDriverState *bs);
 int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
 int qcow2_detect_metadata_preallocation(BlockDriverState *bs);
 
+void qcow2_inflight_writes_inc(BlockDriverState *bs, int64_t offset,
+                               int64_t length);
+void qcow2_inflight_writes_dec(BlockDriverState *bs, int64_t offset,
+                               int64_t length);
+
 /* qcow2-cluster.c functions */
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
                         bool exact_size);
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 1369724b41..eedc83ea4a 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -799,6 +799,92 @@ found:
     }
 }
 
+typedef struct Qcow2InFlightWriteCounter {
+    /*
+     * Number of in-flight writes to the cluster, always > 0, as when it becomes
+     * 0 the entry is removed from s->inflight_writes_counters.
+     */
+    uint64_t inflight_writes_cnt;
+} Qcow2InFlightWriteCounter;
+
+/* Find Qcow2InFlightWriteCounter corresponding to @cluster_index */
+static Qcow2InFlightWriteCounter *find_infl_wr(BDRVQcow2State *s,
+                                               int64_t cluster_index)
+{
+    Qcow2InFlightWriteCounter *infl;
+
+    if (!s->inflight_writes_counters) {
+        return NULL;
+    }
+
+    infl = g_hash_table_lookup(s->inflight_writes_counters, &cluster_index);
+
+    if (infl) {
+        assert(infl->inflight_writes_cnt > 0);
+    }
+
+    return infl;
+}
+
+/*
+ * The function is intended to be called with decrease=false before writing
+ * guest data and with decrease=true after write finish.
+ */
+static void coroutine_fn
+update_inflight_write_cnt(BlockDriverState *bs, int64_t offset, int64_t length,
+                          bool decrease)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int64_t start, last, cluster_index;
+
+    start = start_of_cluster(s, offset) >> s->cluster_bits;
+    last = start_of_cluster(s, offset + length - 1) >> s->cluster_bits;
+    for (cluster_index = start; cluster_index <= last; cluster_index++) {
+        Qcow2InFlightWriteCounter *infl = find_infl_wr(s, cluster_index);
+
+        if (!decrease) {
+            if (!infl) {
+                infl = g_new0(Qcow2InFlightWriteCounter, 1);
+                g_hash_table_insert(s->inflight_writes_counters,
+                                    g_memdup(&cluster_index,
+                                             sizeof(cluster_index)), infl);
+            }
+            infl->inflight_writes_cnt++;
+            continue;
+        }
+
+        /* decrease */
+        assert(infl);
+        assert(infl->inflight_writes_cnt >= 1);
+
+        infl->inflight_writes_cnt--;
+
+        if (infl->inflight_writes_cnt == 0) {
+            g_hash_table_remove(s->inflight_writes_counters, &cluster_index);
+        }
+    }
+}
+
+/*
+ * Works both with locked and unlocked s->lock. It just doesn't touch s->lock in
+ * contrast to qcow2_inflight_writes_dec()
+ */
+void qcow2_inflight_writes_inc(BlockDriverState *bs, int64_t offset,
+                               int64_t length)
+{
+    update_inflight_write_cnt(bs, offset, length, false);
+}
+
+/*
+ * Called with s->lock not locked by caller. Will take s->lock only if need to
+ * actually discard some clusters.
+ */
+void qcow2_inflight_writes_dec(BlockDriverState *bs, int64_t offset,
+                               int64_t length)
+{
+    update_inflight_write_cnt(bs, offset, length, true);
+}
+
 /* XXX: cache several refcount block clusters ? */
 /* @addend is the absolute value of the addend; if @decrease is set, @addend
  * will be subtracted from the current refcount, otherwise it will be added */
diff --git a/block/qcow2.c b/block/qcow2.c
index 0db1227ac9..0a5bd4ea4e 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1833,6 +1833,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
 #endif
 
     qemu_co_queue_init(&s->thread_task_queue);
+    s->inflight_writes_counters =
+        g_hash_table_new_full(g_int64_hash, g_int64_equal, g_free, g_free);
 
     return ret;
 
@@ -2709,6 +2711,9 @@ static void qcow2_close(BlockDriverState *bs)
     g_free(s->image_backing_file);
     g_free(s->image_backing_format);
 
+    assert(g_hash_table_size(s->inflight_writes_counters) == 0);
+    g_hash_table_unref(s->inflight_writes_counters);
+
     if (has_data_file(bs)) {
         bdrv_unref_child(bs, s->data_file);
         s->data_file = NULL;
-- 
2.29.2


