Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7B237354D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:02:51 +0200 (CEST)
Received: from localhost ([::1]:40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBYY-0001Ad-7a
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWE-0007oP-5W; Wed, 05 May 2021 03:00:26 -0400
Received: from mail-eopbgr70123.outbound.protection.outlook.com
 ([40.107.7.123]:51520 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWB-0005wK-So; Wed, 05 May 2021 03:00:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNhbbQftrC49cRNRFCBlDBEA5rfe5AcD8XkMtIyPHmYt3hCJ53ouChQ17VOdke4W3L1HXu81OSPdGhPb3cOlXUviBOE22egZCrdKm2jCXah3qRDOWC5hFJIGAYZUsmeNnF+MhE0+cRdtKFXKbYy4ZlaK7XNxVrEYqDKSlZTiL8txRmRyJsP1dda5RX3OiatRdfMxAsIg9W5TWTJeavSkVhScBxbinaC6QLoT5XNX0/oJaxAdzqsDMYghrViPvqvo1l0luemGVpS0g2xW29APiTLJOv+/e7Dkz3HpiQ8nx9hAy3yblH5aJsr8YMjsAyGZBiDebrhJKFRrXbX4gA7KXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoZQ57TpdwrglEnFj/robC9eebGwtsjMEgEpePEUxic=;
 b=CGN8L4ctbzMtG+GIRZPwu04C7FkWvw9/2wwjUos2uNYBMFgKTX3egqo8KoLQy0gR7graMDTn56KHEqYUQ1o4F7+LW6NAtsixlxadzu86PGowj+74k7EuTedk9EtJKJRi1JYtg8Mo/yAPQBFc+bTW9ex+OwaYFKgX3+3jF3NaojSBWiDLWfWNwqJAevBUwFmqfViy/gUlFi1iyWliWuYOeM/ZJ+SxFDzk2YO33WDv6pCdZ1LsFGLgTkqt8EqnJSgMNvC85D95Mp/i+EVn1aoKVKv4At8F6/DzQt7wLuTg8qvpHug0DeVam272WYHv478KcElgRkhmoSrDZMHZKqGhOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoZQ57TpdwrglEnFj/robC9eebGwtsjMEgEpePEUxic=;
 b=cHw0+GUaWBdilQ4Gmwff05FKkhjncuL8Gvqro+nDfjGNRRvQM2bWUK7DCsU6cszDyFwO7kPMqCRU9fROE3H/tPeXmVqIBqeujG3o23uX2lqaPCLlSriDbcxrZmI7EzL00FDGEsZtnR3i/hxt69ay8naQ62oCic3RG7O7JQijWCY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:00:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:00:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com,
 eblake@redhat.com, berto@igalia.com
Subject: [PATCH v2 03/10] qcow2: introduce qcow2_parse_compressed_l2_entry()
 helper
Date: Wed,  5 May 2021 09:59:48 +0300
Message-Id: <20210505065955.13964-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505065955.13964-1-vsementsov@virtuozzo.com>
References: <20210505065955.13964-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1PR0101CA0013.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Wed, 5 May 2021 07:00:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ae9a686-936b-4b5a-cdbf-08d90f936e50
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652A16D997BDCF505113C3CC1599@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uU/ALpn33OU6/72geEK/L3P1OWZQKsUuZk7eqMatWeb+7tEVsOK3kxzhxtP1E8Po9kFBPyrc2VjTAcsx8j9pP62rFPExPkmaCKI5wMyrfNoblpfOorRfCD8QQGuAZmdzrSux9xuAyDFkOHfQIK99e8U8dTLDahWiD25ot3tdMABtFjc5qOl3Yk6EEO+ZkYWm6UK+o9mQjE83wb3bXksKNFcG+hGybBFsgnPso7LXLALjfHm8FsUkUsS1C5YV1KhI3k6SRyxasf/Kay/CMT5mCAJZQWyk2/yPQRagf975zyEtQ+3HEwIvI4RBTMeEvic8IdhDH11tL2YRXxU8pkbggnaUqnKE76JoxGqa+gTp2BoB1jX+7iYNtHawUw0lOJE74V69/3eQKBBhHQlwzsanLmUWMCFo6egGFbLDbbkt+0ESnUqLm2/ngpjXDmftxjViOsY0xJ07TlWheEbm/fP1MXfo1HCcuXQqzIeRUbwkasyW67uLcXKF22B8k0wibOw1WUrIS3iw/QYgCYSTbJrqGKLBa3BoOXa6J4IKrDp0sZPUdG0i1hx/qYwKXKogBnO1Jo2jV2pjIf5te6T//KmJ2ZILO1/SpH2CCaEL3UknZLf6ZRVDQ+HYCMTNDUaiwsC/vp4pq9telA2IKMgppC5lsuSAj3zbwoBfhKyXgC53hnpnXSIzJiU9YQBQC5MvfCkj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39830400003)(136003)(346002)(376002)(2616005)(2906002)(956004)(36756003)(66946007)(6486002)(8676002)(8936002)(6916009)(4326008)(6666004)(16526019)(186003)(6512007)(1076003)(316002)(38100700002)(86362001)(38350700002)(83380400001)(66556008)(26005)(6506007)(66476007)(5660300002)(52116002)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?At4bmiVavKjvCkrarQjuutW90fbeDbsYfY0pfEn1tIBKuL5FOI0N5Y9NakOU?=
 =?us-ascii?Q?qdTi/ycqbro6o6wwIEd2/eJOAUTtz4WX9eGUgpwUOqX9dU+HTV0Tb4FMNRb7?=
 =?us-ascii?Q?Rw03vESehxq8dbFUqPNVE4vd+rRi4Vj7OwsUBa5b2QD8BKOX4LsEkM7cxvkv?=
 =?us-ascii?Q?ZQrpAbm8YLWeXuS2X+qtKJG3TKmdO34GliZabxtntK4ytQxuAt4HrG0Z5aOX?=
 =?us-ascii?Q?Ck1GzpAqz6+QptS1o14A8Rq1DQnsxnpjShG2lSrrmstrKMXlbYr37FVaD6vG?=
 =?us-ascii?Q?8+dPOnAQ5iJhdRHBEK/xTLZTeGMlR7NrKq77K3AYrlSZGy4TG1Re3NfpHMvY?=
 =?us-ascii?Q?GBN0WDB+Ah8Q1MVw33+aVZiDDQJDxBUs8y/IpbQWtoY1O+cjRKRuZ2w/GFpt?=
 =?us-ascii?Q?SxMc1U8aJ/gDQyK6D3wlNW3OBiQP6UwvVHd0I7jeGE+2M4nk9VAQmXloAs4p?=
 =?us-ascii?Q?3Aec2GAT5GGb06OoxfUMXdfoJO44E+4HPaOkCQIlJfgIEYuVyTIQDerJbpXf?=
 =?us-ascii?Q?aDpeXIJclrmgf31wBRnvDdHeJdsWLMopngtG+kKy1iCU6ndHd33DDJJCT+46?=
 =?us-ascii?Q?QOw9lmhl6KJ0OozXvyU0AtfHwGB+ch267+Qshx2+vdUe5RdaonzzkkFNccNt?=
 =?us-ascii?Q?+f0mZLihL1ZG8TD0MDqViZWub2MaAyjBIp2LrEPhSxPA39RfzyI7vNz91gcq?=
 =?us-ascii?Q?sZhk9X1tLXnc9+uYBrH7oBpfY8FgM33VaQ5LeDcVuPz+fFMEEI4FO+O40NRC?=
 =?us-ascii?Q?I44Wt+1nGY8ww4NZDvG2CrBJDj93iHnSB+AaXKzgrJgqcTXAuaii/tq+XwR7?=
 =?us-ascii?Q?euSB3RiSUSeApEQrQu/2RHVuHIX48G76WaipWdLu9NpUSVydQmnEhEGk7VFR?=
 =?us-ascii?Q?33TrUG3FvZfPoTRAFx1+0igZqLh+jg1oNOipUf+664oaKpdl2RMoF8019XPE?=
 =?us-ascii?Q?kmHt5zqmWK04ifBUeogMjb9lKOu2/iAceyebINGQcrlhopTDXadI52OFbFbC?=
 =?us-ascii?Q?ouL1UOfuv3sLnG0AmY52dkzLEG+d9AcqzPdGscGek6puMfbLUXoeE4JMOkIE?=
 =?us-ascii?Q?qlZAZHXqL6RM1/jdeklf1Nluk2DDkLzvVZ1wHXrU0EHZ/FU/pqUu92kYJdy3?=
 =?us-ascii?Q?KgbNTUntX/bHtU5l+TmekkgTnXYxZZYQZubumTej2fpoi0MJnF+f0DHZ2uZD?=
 =?us-ascii?Q?nH5BnPuwgbJxk/CBVBZVtqajdXGL1N30adqr+S/XkKIckYzRsxCunpWpNS+/?=
 =?us-ascii?Q?XHUtMbV81UH0ybj+d/Zjus12D64XrJUhWtWHvns5DGeqZXK6NmAiGbq+dCci?=
 =?us-ascii?Q?0sgxx/oo+P30oOuf3Cdo/hE1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae9a686-936b-4b5a-cdbf-08d90f936e50
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:00:13.6358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hXjyOEEdmvyNf/eNoiLQXR4eanNoSCNhwU/AszSRBxqKHzr8+fZkf47YA7SMizBjUKlZPFD+FAucOPyoQEeCnzT3UmJ6/DM7ypG0o4/2+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.7.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Add helper to parse compressed l2_entry and use it everywhere instead
of open-coding.

Note, that in most places we move to precise coffset/csize instead of
sector-aligned. Still it should work good enough for updating
refcounts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2.h          |  3 ++-
 block/qcow2-cluster.c  | 15 +++++++++++++++
 block/qcow2-refcount.c | 36 +++++++++++++++++-------------------
 block/qcow2.c          |  9 ++-------
 4 files changed, 36 insertions(+), 27 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 42a0058ab7..c0e1e83796 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -110,7 +110,6 @@
 
 /* Defined in the qcow2 spec (compressed cluster descriptor) */
 #define QCOW2_COMPRESSED_SECTOR_SIZE 512U
-#define QCOW2_COMPRESSED_SECTOR_MASK (~(QCOW2_COMPRESSED_SECTOR_SIZE - 1ULL))
 
 /* Must be at least 2 to cover COW */
 #define MIN_L2_CACHE_SIZE 2 /* cache entries */
@@ -913,6 +912,8 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
                                           uint64_t offset,
                                           int compressed_size,
                                           uint64_t *host_offset);
+void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
+                                     uint64_t *coffset, int *csize);
 
 int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m);
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 04735ee439..70d0570a33 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -2462,3 +2462,18 @@ fail:
     g_free(l1_table);
     return ret;
 }
+
+void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
+                                     uint64_t *coffset, int *csize)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int nb_csectors;
+
+    assert(qcow2_get_cluster_type(bs, l2_entry) == QCOW2_CLUSTER_COMPRESSED);
+
+    *coffset = l2_entry & s->cluster_offset_mask;
+
+    nb_csectors = ((l2_entry >> s->csize_shift) & s->csize_mask) + 1;
+    *csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
+        (*coffset & (QCOW2_COMPRESSED_SECTOR_SIZE - 1));
+}
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 2734338625..66cbb94ef9 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1177,11 +1177,11 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
     switch (ctype) {
     case QCOW2_CLUSTER_COMPRESSED:
         {
-            int64_t offset = (l2_entry & s->cluster_offset_mask)
-                & QCOW2_COMPRESSED_SECTOR_MASK;
-            int size = QCOW2_COMPRESSED_SECTOR_SIZE *
-                (((l2_entry >> s->csize_shift) & s->csize_mask) + 1);
-            qcow2_free_clusters(bs, offset, size, type);
+            uint64_t coffset;
+            int csize;
+
+            qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
+            qcow2_free_clusters(bs, coffset, csize, type);
         }
         break;
     case QCOW2_CLUSTER_NORMAL:
@@ -1247,7 +1247,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
     bool l1_allocated = false;
     int64_t old_entry, old_l2_offset;
     unsigned slice, slice_size2, n_slices;
-    int i, j, l1_modified = 0, nb_csectors;
+    int i, j, l1_modified = 0;
     int ret;
 
     assert(addend >= -1 && addend <= 1);
@@ -1318,14 +1318,14 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
 
                     switch (qcow2_get_cluster_type(bs, entry)) {
                     case QCOW2_CLUSTER_COMPRESSED:
-                        nb_csectors = ((entry >> s->csize_shift) &
-                                       s->csize_mask) + 1;
                         if (addend != 0) {
-                            uint64_t coffset = (entry & s->cluster_offset_mask)
-                                & QCOW2_COMPRESSED_SECTOR_MASK;
+                            uint64_t coffset;
+                            int csize;
+
+                            qcow2_parse_compressed_l2_entry(bs, entry,
+                                                            &coffset, &csize);
                             ret = update_refcount(
-                                bs, coffset,
-                                nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE,
+                                bs, coffset, csize,
                                 abs(addend), addend < 0,
                                 QCOW2_DISCARD_SNAPSHOT);
                             if (ret < 0) {
@@ -1603,7 +1603,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
     BDRVQcow2State *s = bs->opaque;
     uint64_t l2_entry;
     uint64_t next_contiguous_offset = 0;
-    int i, nb_csectors, ret;
+    int i, ret;
     size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
     g_autofree uint64_t *l2_table = g_malloc(l2_size_bytes);
 
@@ -1617,6 +1617,8 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
 
     /* Do the actual checks */
     for (i = 0; i < s->l2_size; i++) {
+        uint64_t coffset;
+        int csize;
         l2_entry = get_l2_entry(s, l2_table, i);
 
         switch (qcow2_get_cluster_type(bs, l2_entry)) {
@@ -1638,13 +1640,9 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
             }
 
             /* Mark cluster as used */
-            nb_csectors = ((l2_entry >> s->csize_shift) &
-                           s->csize_mask) + 1;
-            l2_entry &= s->cluster_offset_mask;
+            qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
             ret = qcow2_inc_refcounts_imrt(
-                bs, res, refcount_table, refcount_table_size,
-                l2_entry & QCOW2_COMPRESSED_SECTOR_MASK,
-                nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE);
+                bs, res, refcount_table, refcount_table_size, coffset, csize);
             if (ret < 0) {
                 return ret;
             }
diff --git a/block/qcow2.c b/block/qcow2.c
index 746ae85b89..418779a43b 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4672,17 +4672,12 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
                            size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
-    int ret = 0, csize, nb_csectors;
+    int ret = 0, csize;
     uint64_t coffset;
     uint8_t *buf, *out_buf;
     int offset_in_cluster = offset_into_cluster(s, offset);
 
-    assert(qcow2_get_cluster_type(bs, l2_entry) == QCOW2_CLUSTER_COMPRESSED);
-
-    coffset = l2_entry & s->cluster_offset_mask;
-    nb_csectors = ((l2_entry >> s->csize_shift) & s->csize_mask) + 1;
-    csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
-        (coffset & ~QCOW2_COMPRESSED_SECTOR_MASK);
+    qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
 
     buf = g_try_malloc(csize);
     if (!buf) {
-- 
2.29.2


