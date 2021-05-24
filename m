Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7F38E8C3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:32:26 +0200 (CEST)
Received: from localhost ([::1]:51498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBcz-0004Fo-Ib
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBSG-0007dv-45; Mon, 24 May 2021 10:21:16 -0400
Received: from mail-eopbgr50103.outbound.protection.outlook.com
 ([40.107.5.103]:9605 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBSE-0006u5-1U; Mon, 24 May 2021 10:21:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i19HjFReXq84XF/Q6Nz5kUh9CRsCq09/qX69PdwRdzUUlM1cLU1CXbpBXlIi7fz4+ERyblmz+0mClz041Tp4dQC/6iT4g0dzNzknoiimkusbRgs+XQrQFEn5X7zAg58ZhZ0mCfDuzNX+hl/nSoIDsCwylBZTJmOTf6kQS7eCYt+WgIU2KV+nCDskuWlau+MWYsIV0wJULQCMsjMoOFx622aUxAp/j7Y3EeziMGYfihLsuKeLZwgfwS7SuxKyzXoP2ys2etWBlh2dWEbl+Axm3p+REn6zyiei8kMTrPRR9DBEv/kWVqMnFlmPOfEwuA4wbzEUHzdezLzGXZAToM4cFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKwLwj+lsTnh+2NuXdem26jUII13JuOyHC0xehNhrqA=;
 b=OhOIg3OvMVnlYG3tAs6sIaex/PDVkPHGYMOYbwGDibjVNcDmuNUQj9t6XAIaxNgrXoEahPphNU0Duljfd4y+NId/w+3f+j5rPZVMUXt3T6+C9AEs2YSkrHLjmVwo7+qaprfTCTr1Tk6UdjYDvENrW1Qs3Z7Q+05Req006ZEYo7x9vNDcqqOZVb3NppgjqIUwbq/b69GQHY8qE01WCpIWDvgvgo1PaiEskywBC+hOyNfyUaWJ1WIMYIqudftDnqyQk2o2lslBcPXhaMYCITqroLPRYX91WQyNziSPD1tlN2u3DT0uwrOQG9IdrHEn8113funospr7Nnkm1e7deGCLzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKwLwj+lsTnh+2NuXdem26jUII13JuOyHC0xehNhrqA=;
 b=QrpKdTNLy9qgPxU4PotgutL1EChgMQvcrp0/6CRn2KiA0AbyryXAmfz2BPTa0vDN5e3+PYW1isfoTErpzikpF1rERvJ+AXz4V4SgISR2rxFGp5NyGCa0CFBCMDC8r/+nHrE5ixxmD2dWtAHZ+k96JuH8W4I4ZCI1eVWc1EtbZsI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4165.eurprd08.prod.outlook.com (2603:10a6:20b:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 14:20:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:20:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, ktkhai@virtuozzo.com, eblake@redhat.com,
 berto@igalia.com
Subject: [PATCH v3 08/10] qcow2-refcount: improve style of check_refcounts_l1()
Date: Mon, 24 May 2021 17:20:29 +0300
Message-Id: <20210524142031.142109-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210524142031.142109-1-vsementsov@virtuozzo.com>
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR09CA0063.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR09CA0063.eurprd09.prod.outlook.com (2603:10a6:7:3c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 14:20:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7e7959a-e9a4-4876-4347-08d91ebf2432
X-MS-TrafficTypeDiagnostic: AM6PR08MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB41656E0EA6F8EF3ACA60AC82C1269@AM6PR08MB4165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WMx8KGFfHMIu22PrAxs45rIOTl6hbpmm2m6oAmASOE1n1gtgh4H6whUK1mo1rovVf2MkSgeE981SDk2Ruv6bjbyCam2KZqmseNmsrIlE79D/WABKDXsKAiCyYiYmK1JfW0EOtf+MjvzRTz+21R4ZfDP7gSxOztiw3PcogWUaeEmFRUZO/avkTbOx4xkaQHgQhKLbBGoafIfyB2Menm+0lgX/2fNXOtWssZglivvorgAJlOZpf+/asLVV5zA6pUzhwI5ssZ4TtIAjAKJpCZb20icNO05Krai72VVGJtAJC8l3KvUk1pxsSI6hIXHsP+uTSY+NeHc1PVAokAYcB6keAuih10bHP9d0jdLrp9RsC65eAk/pP5W51FqJdAFpSmwaKXI4vwRe50CuGOJqPf5jwtIIh4wgF+JHFCi66yMGqEFLd+/6QssMb1qdMlMvHsn0iJRV+asVQwgoZLYe+YtG1ejWzkSkfFX9wY+qEZE1XRlAsogibaSCgYaIFDvovFI5Zh74W/3zgRmT0T/MF1WflAbZk8g/5/XMNklnyPAAZ4kzNSIaj0R4KVJQZZNRQ6xmFD/ujcgj/QN6DBycXt9cBlTDjSm76HMl5knSAEFFXp9F7FVd4qabeG+QkW9HxRkgky1X0vLM3TNj4tWLw6UdZDBdHek1OsQqdRrZZIIKD6kZ8XJVqE6Aby5EvzutsFBc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39840400004)(366004)(396003)(6486002)(52116002)(186003)(36756003)(478600001)(2616005)(956004)(26005)(8936002)(316002)(83380400001)(2906002)(6512007)(16526019)(8676002)(6916009)(66556008)(66476007)(4326008)(66946007)(38100700002)(38350700002)(5660300002)(86362001)(1076003)(6666004)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RI4lmyHd6gaI95aj3EC0DsKPlVE6as8QTnZSu6PGRQutoGN50QYZPhsofU5w?=
 =?us-ascii?Q?YnEMGCt5+AKKnSMXZ3bu0IkafCf3EpASmoHDL9VU3slOYhXxhvV889ABhrqY?=
 =?us-ascii?Q?SS0LxA0/uC6FfkChlQoN5gjt/PPii6g7bYn+gIhvfzx2ekp1agK5vDaRrDqY?=
 =?us-ascii?Q?OUvwJnIJH3CIViaYpyCpo5pi5uDzqwFfWBLIAEoiC4Q5JNJEjZvYwxFIEIYW?=
 =?us-ascii?Q?ah/FGX1FoZtgWjw9pMfcCMXbnwEDwnti9ayZjQmT0FhRTlKwuK6U13wi0ovd?=
 =?us-ascii?Q?/WEpCJvdkPvQ6Wv3+88ehvrq+cW9MOEtAxD20GlmCB8oSaa3B4a3/XJiX8K2?=
 =?us-ascii?Q?r2eKXD6riJ+qrVt0eibgXFFWBXRMouKdDJl89l9LXYVgPXARoHCnAIpr99aV?=
 =?us-ascii?Q?AUgPgMD2QGAAg2Gxm/OA/KX8m8D4EEIihn3+BLY5yW32mi9d73t7ZFffWZ71?=
 =?us-ascii?Q?8rger1QqfNN1UGMM+xXmtmf5ntwasCLbbaLSkAaADulb6wGaKAVySfWT4MuM?=
 =?us-ascii?Q?UNR17RMA+fVg3tYUTmAEC6W6A2st7tuSIiBQbd+9lsuJcvX14H3cWrgirHn+?=
 =?us-ascii?Q?EK5EIDw4WG62zjorGzKSCSQ28av7b7g81pxZw4U5X/pxcwd5x+kt2eGRnK4y?=
 =?us-ascii?Q?qtw+2Z/7NT2K/MdxLBVq8BmDGh3xh1o7EOmrE374aNI0dzZ3Jkct4yDR22bE?=
 =?us-ascii?Q?F93oJbR0cEBvIA+1EIibHZurNnriTv3ZTj0fRmzKJf6ACBGX/OhtQzH3LOX+?=
 =?us-ascii?Q?v7N2bA0OHKY+n2VcA3VzqHZZl1EepC5SPnTHRYG1q+6RYaDEDHggIOr1VeJA?=
 =?us-ascii?Q?K7o+ZvWr0/Y824zK5+vNrQMhws7QLz+Z23LQ4EQKGNyeUsHSmUwifqo4xGez?=
 =?us-ascii?Q?+/ol3nkAsuKEB4rbiPks62MHOQXizUKRbh12H26prc3ymTOacTM9x6vA7qpi?=
 =?us-ascii?Q?WQLhZVRSaT4l3593AdXRacxV9lUMWgxID9GTMW/8Q5oNavdo+7zwruMHpVVj?=
 =?us-ascii?Q?2gu2b0Qo3GKFKDMB9Oh8a22K5ObxNdRKTAO2Ri0yHa0KDZJBZaXI5gjdpWo9?=
 =?us-ascii?Q?NSVxR0kxMuH6UCDEtr3SsBjZ3Yh0zUao+2yMiC8ffSEdxtl/zF55/Wj8ITxL?=
 =?us-ascii?Q?+skLy8/pNgvGkaKSu3ll3KmamTiH5jttTgg7fGimC8dFDBmQOW6PPZoyGguT?=
 =?us-ascii?Q?9kJ6A4hxQDS57amSiRyG/UsyjDnaJe1VkrMc6KxpKfozauhyktZWOFO2XB1e?=
 =?us-ascii?Q?wb5gOif7Y9lyQQ2XqvX6W/zCsfL+WNZHqWKTZTaS/165cRdwgxMh7AIK24Zq?=
 =?us-ascii?Q?KIlmyKRvWlynCp5VJegqpxto?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e7959a-e9a4-4876-4347-08d91ebf2432
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:20:54.5999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbhRwKjDFHkOjy6Jl97278//Bc6elbgsjPRe9E4zA4fFyxJpqdl0cORi6rtVwuPGthYK6wMRu2wJVoieci/YuJq1beR9IktenfUij14l5dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4165
Received-SPF: pass client-ip=40.107.5.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

 - use g_autofree for l1_table
 - better name for size in bytes variable
 - reduce code blocks nesting
 - whitespaces, braces, newlines

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-refcount.c | 98 +++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 48 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index b8fd6337d5..adebb15598 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1864,71 +1864,73 @@ static int check_refcounts_l1(BlockDriverState *bs,
                               int flags, BdrvCheckMode fix, bool active)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t *l1_table = NULL, l2_offset, l1_size2;
+    size_t l1_size_bytes = l1_size * L1E_SIZE;
+    g_autofree uint64_t *l1_table = NULL;
+    uint64_t l2_offset;
     int i, ret;
 
-    l1_size2 = l1_size * L1E_SIZE;
+    if (!l1_size) {
+        return 0;
+    }
 
     /* Mark L1 table as used */
     ret = qcow2_inc_refcounts_imrt(bs, res, refcount_table, refcount_table_size,
-                                   l1_table_offset, l1_size2);
+                                   l1_table_offset, l1_size_bytes);
     if (ret < 0) {
-        goto fail;
+        return ret;
+    }
+
+    l1_table = g_try_malloc(l1_size_bytes);
+    if (l1_table == NULL) {
+        res->check_errors++;
+        return -ENOMEM;
     }
 
     /* Read L1 table entries from disk */
-    if (l1_size2 > 0) {
-        l1_table = g_try_malloc(l1_size2);
-        if (l1_table == NULL) {
-            ret = -ENOMEM;
-            res->check_errors++;
-            goto fail;
-        }
-        ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size2);
-        if (ret < 0) {
-            fprintf(stderr, "ERROR: I/O error in check_refcounts_l1\n");
-            res->check_errors++;
-            goto fail;
-        }
-        for(i = 0;i < l1_size; i++)
-            be64_to_cpus(&l1_table[i]);
+    ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size_bytes);
+    if (ret < 0) {
+        fprintf(stderr, "ERROR: I/O error in check_refcounts_l1\n");
+        res->check_errors++;
+        return ret;
+    }
+
+    for (i = 0; i < l1_size; i++) {
+        be64_to_cpus(&l1_table[i]);
     }
 
     /* Do the actual checks */
-    for(i = 0; i < l1_size; i++) {
-        l2_offset = l1_table[i];
-        if (l2_offset) {
-            /* Mark L2 table as used */
-            l2_offset &= L1E_OFFSET_MASK;
-            ret = qcow2_inc_refcounts_imrt(bs, res,
-                                           refcount_table, refcount_table_size,
-                                           l2_offset, s->cluster_size);
-            if (ret < 0) {
-                goto fail;
-            }
+    for (i = 0; i < l1_size; i++) {
+        if (!l1_table[i]) {
+            continue;
+        }
 
-            /* L2 tables are cluster aligned */
-            if (offset_into_cluster(s, l2_offset)) {
-                fprintf(stderr, "ERROR l2_offset=%" PRIx64 ": Table is not "
-                    "cluster aligned; L1 entry corrupted\n", l2_offset);
-                res->corruptions++;
-            }
+        l2_offset = l1_table[i] & L1E_OFFSET_MASK;
 
-            /* Process and check L2 entries */
-            ret = check_refcounts_l2(bs, res, refcount_table,
-                                     refcount_table_size, l2_offset, flags,
-                                     fix, active);
-            if (ret < 0) {
-                goto fail;
-            }
+        /* Mark L2 table as used */
+        ret = qcow2_inc_refcounts_imrt(bs, res,
+                                       refcount_table, refcount_table_size,
+                                       l2_offset, s->cluster_size);
+        if (ret < 0) {
+            return ret;
+        }
+
+        /* L2 tables are cluster aligned */
+        if (offset_into_cluster(s, l2_offset)) {
+            fprintf(stderr, "ERROR l2_offset=%" PRIx64 ": Table is not "
+                "cluster aligned; L1 entry corrupted\n", l2_offset);
+            res->corruptions++;
+        }
+
+        /* Process and check L2 entries */
+        ret = check_refcounts_l2(bs, res, refcount_table,
+                                 refcount_table_size, l2_offset, flags,
+                                 fix, active);
+        if (ret < 0) {
+            return ret;
         }
     }
-    g_free(l1_table);
-    return 0;
 
-fail:
-    g_free(l1_table);
-    return ret;
+    return 0;
 }
 
 /*
-- 
2.29.2


