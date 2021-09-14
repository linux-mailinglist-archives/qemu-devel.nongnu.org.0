Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A75840ADFE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:40:19 +0200 (CEST)
Received: from localhost ([::1]:41202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7jW-000626-FP
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VG-0001tL-Nw; Tue, 14 Sep 2021 08:25:34 -0400
Received: from mail-eopbgr40107.outbound.protection.outlook.com
 ([40.107.4.107]:50377 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VF-0006CE-2i; Tue, 14 Sep 2021 08:25:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/6zjeueNTUJQYqB4NvyzEXkdZ0eTtx33lVVp1yVLndslbGIqfzFLEiLGOg69eKUcOHhxhwY+qdwRaApXo1hBzmHPZmS1K3dKu8FBRGAXLga/z0npe29MlIaLaduTYxFzZ93WEHMsiB/S91cYntPNwJMYincwfsrKkVmSatkl7oG26ikyMIjQNQUwvhFcte3rh8U81gnRcbF49oWtnxHCfRGK0Ng/mzSfUMgua5wRfPY54vSGkS3qJnNQH1tpN7pJGjhwT0thVJlq/uHY/o6U5gzcugNK4XMxKYo161hT3tfqegf77NTwETQp0H6OXHt1TyYVXhN/3Ex66FCeLGYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=sVYOQZk3gziUN9dQYhtd0Bz/6SDcl90B4K8/9cgY1j4=;
 b=V4xb8On3NBim7vNKn4pDua9vi6B08DlA2/Eb8kiv0xgFVC5vs0IqZPYoFaR08Bwdcy4rwRYcYHYKSbDxwxGK/cbdbvPR5yMVOP2sRXDo8I0y5WdpIVrsbUAgJtMgbWGXZ3akcH5m0PVlnWBxtJy2pfJkGMSDaa6S6S97VtDLrfVw8Xyicf9x1hILbJT1HBdJFVfnre6Zn3VOkISrsG8z8m0f5ZTLjOywJtFvwHg4YCpKiej0Xf3Z2akrZZju4uO3LmC1zwqorJrXK1wJVtBHJ/1BpGeXy8eZVEil0/JEevjeC9Xe1t+OPqK89ge8pTQSVmLdrXZB4v3f+mHatRa4Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVYOQZk3gziUN9dQYhtd0Bz/6SDcl90B4K8/9cgY1j4=;
 b=HQGT6YsF4qjrTEO2M4CrfnfdepIMb2nzcafUptVGhmaKU/KLb6t6hNnvLQ5tQxQ3Nm1EJ3cepqJpaxL/pRLbmniOs/BxntfR/2Frf6txVg4WHYDUSmUHQ+DlfvN7WEiE+2PvAGGdxNc3JgfhFTWP/+4QtBqSA39vgiU6CvKyWCQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3157.eurprd08.prod.outlook.com (2603:10a6:209:48::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 12:25:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:25:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v4 10/10] qcow2-refcount: check_refblocks(): add separate
 message for reserved
Date: Tue, 14 Sep 2021 15:24:54 +0300
Message-Id: <20210914122454.141075-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914122454.141075-1-vsementsov@virtuozzo.com>
References: <20210914122454.141075-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:25:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04302750-e05d-43a5-5e14-08d9777abd30
X-MS-TrafficTypeDiagnostic: AM6PR08MB3157:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB315752154EFCCBF39C39C63CC1DA9@AM6PR08MB3157.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ixZnYlmG4OgqjJYPKLk0Nke3P6gMB3lyPVjlOknhggd9+8CmOfAOFyfXJxGiyEfDwOi5tkqlfTyO/N/J2WwwYVOZTT3BMsyBHF0gfPH8PcAQZk1QkBqZQuUNAVT57axplYJ6CkgK6Z+kSiRMBNFw5gvE0gt+sPOl+uNCf8qFC6cLEB3r0ncp7nIGu+NoBoWn49q+nbA7yY4I95ngZ54YL/ohoU6SyY9RwAAvX9EFuKWD3VNBcgGEgync+J/Hydgx1GokNRP48n/JUFrNQ9yEnM/kmy42O9QtuQfPfA5KPz9+2SlLFl0bHa1YbR4oV4jcd1+CqZR6+/yvY+fDzdJs/JWlD1LH2VpNKXLSp+19yWnyuRqmYttdzSKElpoWVOK9ZW/EfWi5WdXM64iz0qTq1WDcdE3k60uPWAAt/F7Fic9i+7kiBcamaUlYozCMm83R4O55cwjAkNlq/x4yu3ompQ1yUMLc35VlsZ2K3axdb5Z/p+Sn1kSYjdEUAsRwc5ZX3CCGxOKX8wQCn8p1vAmIuELWYg1jzOwzO7RVcQnthG+SumQibJJkmI9og3mxOUt8tQiD7fN4UFPY8cIHnCcJsu0RXrxdDeoCZ5TvpYhMYIuMc+aBGGe4vPLHkSL7DwCk0SDTzZp/yAT0bMPUKGgLYJrNlsfRwCj/gzaGO4VNaV7YxszqfXJRcqmD+hTNCevA20TWXvpF4ZX79JxOcLLnZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39850400004)(52116002)(2906002)(6486002)(8676002)(38100700002)(38350700002)(2616005)(1076003)(5660300002)(6666004)(956004)(107886003)(66476007)(6916009)(19627235002)(186003)(4326008)(26005)(86362001)(83380400001)(316002)(8936002)(66946007)(478600001)(36756003)(6506007)(66556008)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x0v+lV4Bsskhk51nbsHOw+uizJt4/v5E9TZIVMKsyqhTwEoNrI8XPQ+pHxUJ?=
 =?us-ascii?Q?NkjkyTY8D6RB4KnPJEtr1IfJKrDdRGZhgrYDuBHxwVboG03XB2uJvEGd1+5b?=
 =?us-ascii?Q?H6pLMpBImcBI+g8NYQawUqXNjmxGiLgUEmgMtidpdOBfYxVIptkJLuyPdQml?=
 =?us-ascii?Q?W54WInHYjv0BgCmngAqokSH8ceRlVj7i5zua+DauDBwRkGJR4XgzoO7TU9Sz?=
 =?us-ascii?Q?uRZ2iZ5gfL6WdQrrccmbEtzFKPb1BIXEwsjGXffdPkoTi+mFT0FYg563GmmX?=
 =?us-ascii?Q?peoJ57EX6/weUgptXe16N1A/yt7OXEHDhg/InD6Yc7Xx/FTx5ieubLORo0y7?=
 =?us-ascii?Q?uh6FUP7Qwgtw1mcpJRClb6dgWyabXm8SJjRVTvAunjfAtxS2reUq2fCKTVKj?=
 =?us-ascii?Q?DXHVufaXqk7mzG1hust9fZ1zL6cvzYcZ+tRyZp//l2Z90thFCrTYybDy2R0G?=
 =?us-ascii?Q?PpsM3PIIa3Hf2NV6vQqi2o/lM54D0GhjC3FCbXco/yRjrIzwkL9tfu8XkwZ+?=
 =?us-ascii?Q?UKzVnUCGgV9V4IKAXJtsuG8xDkVbUd3JUJchbIeNVyNFT1QQvxVZG3QDDPbh?=
 =?us-ascii?Q?8HH8cz3mzTh4Ya+tpnpgv4DK1Ik0nHo4xLz4uAIXzV28n0GYXtbFC2uK/wtq?=
 =?us-ascii?Q?HGsYhYSVUIW5eBgIqGHV+DDTTlitsUMJYE1Rt6tO4ac1wKVlsW8TyCYaXxZf?=
 =?us-ascii?Q?OeZQvfWgnYMvfe8V0mxPeM/jtV05YlTOdduGhntxfWKrZO2adYIdYlpGu1If?=
 =?us-ascii?Q?QpXC0CWKEXcNJREBuu+cREb2DmBbJj1Amv+5zzsbKYeBdunbR1BM7GZ+uXxC?=
 =?us-ascii?Q?fqmt2uJHAeZnYeMBb5ORyOEmKUbmlPf7Sc8uyUdl8bm5qcWITKkpUnj+ndeY?=
 =?us-ascii?Q?wnyHd6EkzMSnW3MyP3qBjNCTq6ilNNIajtpxQMdSYJo5FUQtpIWqAcoQy7mg?=
 =?us-ascii?Q?0fVw7NgViFhnPq1I91dchkIGvdu8tD7laeBfgxc3FaDI0xnRiOnSX/4K2sVc?=
 =?us-ascii?Q?LazzY3cAwIm4v7PSUSlV59UOvGP24yy9ruJWTZFJVdMdtEadkSVyrhNGEVlN?=
 =?us-ascii?Q?y9dB6DeSH1UzM8x7Mgbd1GZ3uT+uoYo9FaqkeoHZiNALMGU1W0JI+JHusEvJ?=
 =?us-ascii?Q?KO8LfJf4umXYkdae0pyfZXB1/UZDShjG4+dv4vCROOR1Fs9TPHp88mGAegEH?=
 =?us-ascii?Q?NmwfkxR8LJPLo8ZWtbFuBqObNNpWSq4/bot9DdLsGgReEz9aOyt9CDE2tvgB?=
 =?us-ascii?Q?Fm7tK7tju4F6ZVuIDED4HMJegObdYASFQ9LK/7RqJlhEGP0s4gFIiQZ7HGTO?=
 =?us-ascii?Q?pO/uj8DA6gmw1Hl46qzeDLIC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04302750-e05d-43a5-5e14-08d9777abd30
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:25:29.4948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GSARRdGXosnfIAoeYmyq/vMmakdtt0qSnsOnJN8qJOXoPzB3BKdU5gOqnJIf3P2mjAIUiKVVHAdz2gBMrdkDf76I/u3EU1mBhV+K/ytc8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3157
Received-SPF: pass client-ip=40.107.4.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

Split checking for reserved bits out of aligned offset check.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2.h          |  1 +
 block/qcow2-refcount.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 58fd7f1678..fd48a89d45 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -591,6 +591,7 @@ typedef enum QCow2MetadataOverlap {
 #define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
 
 #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
+#define REFT_RESERVED_MASK 0x1ffULL
 
 #define INV_OFFSET (-1ULL)
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 75751a0181..d70667916b 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -2087,9 +2087,17 @@ static int check_refblocks(BlockDriverState *bs, BdrvCheckResult *res,
 
     for(i = 0; i < s->refcount_table_size; i++) {
         uint64_t offset, cluster;
-        offset = s->refcount_table[i];
+        offset = s->refcount_table[i] & REFT_OFFSET_MASK;
         cluster = offset >> s->cluster_bits;
 
+        if (s->refcount_table[i] & REFT_RESERVED_MASK) {
+            fprintf(stderr, "ERROR refcount table entry %" PRId64 " has "
+                    "reserved bits set\n", i);
+            res->corruptions++;
+            *rebuild = true;
+            continue;
+        }
+
         /* Refcount blocks are cluster aligned */
         if (offset_into_cluster(s, offset)) {
             fprintf(stderr, "ERROR refcount block %" PRId64 " is not "
-- 
2.29.2


