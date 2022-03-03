Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4344CC669
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:47:17 +0100 (CET)
Received: from localhost ([::1]:44148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrPw-0007bw-Df
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:47:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNA-00042o-V4; Thu, 03 Mar 2022 14:44:25 -0500
Received: from [2a01:111:f400:7d00::701] (port=54113
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrN9-0004Yn-FN; Thu, 03 Mar 2022 14:44:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo+F+D+37A5pPjR7JRWX0umf5CqEDeS8yBzvJ8GWwBJVXDoZV5PVijUdlqfveXzsjkle8+y6+84EboVjX5ugYZD7hgewUCt6HS/7kVuej8ErOdwSn+iNcIi67HWV/CodtlhvspRDeDR1PVH9vsPfvTmFKOkLEpGiQpol5eWHe2YVsZ8VySzp6cXgIntTPKdnWixEOfLVrhwfQi5Mlrtw25SXWsH47MiWiO5CgdLv7tCNL0KJ0/m9Dk/0jUU6U+3PQF9HsncHmkt2pBNtU1JE89z81oG6TdDUN/bKGLjpswvvDwazWbDriSqLT8C8IMX7WBzZOkCNNOGup2SQLojuhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwtkRFZsupCHj5xg46xDbUv6v3iJOt4sHv5qvsVGsLU=;
 b=PLtKk3LPVk0wPi3VPg+ZXvFQ0fOeGrI/drhAOs1JIwbhsKMmLtJETj0x5AJ/RUcIkBViXIJ/hK4Fpn7tV+IyRLuddUzBbMNRBiGMKww8eCrdkezVdJah1QdiGcE4PSvDr0613b8b1MRPyof9SL6BsMd+snocvKRQZuAoFnWPftOvNvHJwcJMbsJsyuIDsioAezzvMnNfGrUrMpaMMVK8slnsal6XkBDqP+junQa+f777OWgH6FoxOFiGse6rBEuO+a6xwwLb80AyOWqBTdM9YNs7BuraudjP82HTMt33/VscKQIbKwCyoID3O4NYK8zSFANh/4M4JyYfzLNkOWdK9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwtkRFZsupCHj5xg46xDbUv6v3iJOt4sHv5qvsVGsLU=;
 b=sDa9XfecpTH8qux/8qRryoZmO3wG4gFsC/dJ8s5XdV5rrx5B5EetTgsq+spxdBIvymdrQ6cng9qAGTMBT06ijm5UeQkhf+VMUuAyx7hjwNfjaeA4B2TDgDVCKe8PxoFzHykIFcYtsI4kKyYVccHhe/DiRDDDuCzZITt39xsYD48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:11 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PATCH v6 09/16] block/reqlist: add reqlist_wait_all()
Date: Thu,  3 Mar 2022 20:43:42 +0100
Message-Id: <20220303194349.2304213-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97405140-2de6-4ce9-caa9-08d9fd4e3095
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB47368DD917944882E7A2BD4AC1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s2B1+j4dLC3xGzRXBy/tqJ+AOsI417bUuXioiNExpa+6ssSVW8WHgFmZgG4BH9NTJz4reUvSDMlqMgGw3lVBtXJeITHnQ9TrS4bXygSKfIGElRJk2N7ZQfO4yXkPE6YFal09BWUn7Jg1s/QveQd6Vvl1Su8ogrSR269Q3Gohnc1tQ5k4c3kHnZ0KW7CcS8JgJqaIrWrMAYNkGGOCMK0FUvG2s/VO+y6uHu7aY/Bu/ob8Hjt2EIyphmJSD2D4dZxHUk5q5wBpPqVXA+CTFhC4GnaRZvXONTrx0eBtjg9mGUeP8ATlMshw7/yw+ZFC3tKUW6jyqCqzi1TmSljBlS5LxnpqARc135DzciqcRtS+WI1b0F2jdHnwmoS3WtKy/glVgqFWTnyF+JgeWMFePmvTqFFVE3wL4NS9GN+zR7IqXnRqxMooMDdkpjWTbEHDqn9BJ4RG/pDP2hemVvdudYE8ucO45P/cWMhSCFM67l3qnZZeOeRDNw7R0+otR9aDF+O4pnjnZJ71F7WoAF9jbRmsk4vQDUBRgHl4pPSD+f4HgduP16i84989Bm3yaxOKoVEOZctvXkJ93jHu8b6XZFBnO56/xyGMyZNOPobUqDhdgXoxopiARKynO5BCnJ+i2FD32dLsNTOyEqUYVQKcUM/bIry6fFaL/bqnDjQ/DT/DbwRzowHqKEjluWQkPKkePnQtpo+HnU4qyErhW3qXsIsdYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(86362001)(8936002)(107886003)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1dP0KBwCRi36gch+2LeGLwKSMH01Ghsys59U0qcqt5YX1IyCQj0ilqujo1jZ?=
 =?us-ascii?Q?DELZ3xY8HbhBzAHen7pPmi3FBAAT/LIh1REvsfQiCmnWGY47zdj/75r8is4W?=
 =?us-ascii?Q?034rWAutVNl5hC060DnZIeXztI1reFmEIuZX6uCrRAcM5uw7qHqE6fCzfjRA?=
 =?us-ascii?Q?pkTFBn/x137knPh2isJC0bS8+wQt60t9413EGfLZCwkfEwHdFfGJchb0x2xi?=
 =?us-ascii?Q?3L2jzumegpgc7BovHlai6QMdbsUpbI1tWyWikl8qq0miP0p7DzQR0wqVPjPH?=
 =?us-ascii?Q?zPii/ZX/l6eROhj9cdjyPQLlQ3mO7NolSR+udSWkZQi/uf/3qgWtl9iSW+88?=
 =?us-ascii?Q?bDmk9c/1Thgt6pXdajvvW/1j+jtrU7vVKXX4QTV1mFbHXrqfKvbFAGYUv7dS?=
 =?us-ascii?Q?U8dghiV+24pVINUIPeIzd2VjoDQLZ5SI5Ors1tObIZlvLpQ8gZR8wmKj4jft?=
 =?us-ascii?Q?TwWcTH8lY1QPfe28A5baQEZY6BqemWcFh0xWfjrGpO69fO4sopJ3B8XQHlLN?=
 =?us-ascii?Q?0syP6zQyccH7pVYWKMOHd8CUZFYfaALW9r/t+r/ap4y57ui5djg6xWo4SrOz?=
 =?us-ascii?Q?EM3PZLgs2t6nsAsIZZhCe4D/gnMp/0gcKHDBeTZgKgVNHhe7fRugliZvBljD?=
 =?us-ascii?Q?kR3b3+HOQ/WyxUD/HeIVZK24yJasCVZcSFXAChYNET6WFSnL4RR6Ij1MVoNl?=
 =?us-ascii?Q?WUMrZKeRKYaPlYFGi5wA5qRmel9XorIM/Y8A+0rkcXGngne+c1o0b1tEH+YH?=
 =?us-ascii?Q?//o0XZTEot4g3moGmwCnVB4lXHixsnsqrg896AqMgDdZbZSrvj8N3wOCFBKt?=
 =?us-ascii?Q?TnRSCPl+Sgw7qeif/1kmXYwKz2JYlog2MhUGd+QAcAJ23dRo+yMCtn1a/+sk?=
 =?us-ascii?Q?ppwP6ZSTefF3LYmo+RzQgrrxr+FU35HqE51/b1tNnik+zLOIKQNZJ1SII4Xz?=
 =?us-ascii?Q?gCY4dBaJD++gM29wGpDCgDtFoNZMurMcUO495O2kd0uKLUt0eOJ7bfqJocAi?=
 =?us-ascii?Q?jyu2yutg6ft//jhsTa0UIMVs89mu9bYx/YAvq8IjuQcNJgc9UgdpGmf/WKkT?=
 =?us-ascii?Q?gp0oDNfSz/jIeKmUvSZR3xz/f9BrTLW3lRex5x5ZNub0kGqotHUWrUKPPs38?=
 =?us-ascii?Q?E0HNIRICjQgH1eSwZbfIni1+kzrspVsYx2KUD8eXZi8qsnxe1bq69doZmoEU?=
 =?us-ascii?Q?Ie01w/5r8rJuOm2oSu037/K7ckqv8OFrVgyr/2jyydsDI62DQ965oi4O5Ka7?=
 =?us-ascii?Q?Ebzwz8btMZy1Df/GQ12sxHjnfxyj47fLM8S52IqlzuPXlA7VqBtDb8tTvrW0?=
 =?us-ascii?Q?TDK5qCGsIsAYf1fKzZjyXGqBN8cMPHlD6nMP1I79OWMI/iFncbOTfZyv7A3H?=
 =?us-ascii?Q?oN2Fy5QaiG7F/ageW6U/N570BinIgIv9AYWuV2b0ePNMeIkGEBO3mZi6o0wh?=
 =?us-ascii?Q?Yc3bgVYgCnvKpignmp6PLvaQRm+giL5TwZv9Qy8nMA45IUKX1J8tM8qwDXov?=
 =?us-ascii?Q?payXBYZfBTcKnzxkMUpMz6fDrJ3nahqU6CQUUgR9ifAPMOVToAmOFy00KV67?=
 =?us-ascii?Q?JhR7vmviGty5FYQVDCyiz0pmClS2KjvELiM3038kmln5DY/M8mmBWCw/TslF?=
 =?us-ascii?Q?DNEWZ1RpSXHCnNgbh9DiDNg9LMJleCryP1KBuoZHhbOoG5tyLZoGBYznYp+P?=
 =?us-ascii?Q?7hAQnA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97405140-2de6-4ce9-caa9-08d9fd4e3095
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:11.4816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4AiKJSBvmjT0/RAzJY+O+RPpLBNj8qQxKEEzvbllAE6qoTqP4qd8SaiEy2Ov7LHri91Mb5Rpwqf8VclYbj0uKvE4kYJXjwdGHEYp87dU2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::701
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::701;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add function to wait for all intersecting requests.
To be used in the further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/reqlist.h | 8 ++++++++
 block/reqlist.c         | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/block/reqlist.h b/include/block/reqlist.h
index 0fa1eef259..5253497bae 100644
--- a/include/block/reqlist.h
+++ b/include/block/reqlist.h
@@ -53,6 +53,14 @@ BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
 bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
                                    int64_t bytes, CoMutex *lock);
 
+/*
+ * Wait for all intersecting requests. It just calls reqlist_wait_one() in a
+ * loop, caller is responsible to stop producing new requests in this region
+ * in parallel, otherwise reqlist_wait_all() may never return.
+ */
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock);
+
 /*
  * Shrink request and wake all waiting coroutines (maybe some of them are not
  * intersecting with shrunk request).
diff --git a/block/reqlist.c b/block/reqlist.c
index 09fecbd48c..08cb57cfa4 100644
--- a/block/reqlist.c
+++ b/block/reqlist.c
@@ -58,6 +58,14 @@ bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
     return true;
 }
 
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock)
+{
+    while (reqlist_wait_one(reqs, offset, bytes, lock)) {
+        /* continue */
+    }
+}
+
 void coroutine_fn reqlist_shrink_req(BlockReq *req, int64_t new_bytes)
 {
     if (new_bytes == req->bytes) {
-- 
2.31.1


