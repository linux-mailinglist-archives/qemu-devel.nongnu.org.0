Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B492938E8BE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:30:17 +0200 (CEST)
Received: from localhost ([::1]:46404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBay-0000gh-PP
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBSD-0007Sk-AT; Mon, 24 May 2021 10:21:13 -0400
Received: from mail-eopbgr50103.outbound.protection.outlook.com
 ([40.107.5.103]:9605 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBSB-0006u5-EH; Mon, 24 May 2021 10:21:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2muKFDzaObgALBu/1QrXRwnOGE+suMEF7RAFZclAeu1Ya+HOqeQR/5kbhJSbOfSawMAs0QsqM9zd89nd9wjBxePW+FHKIp5GheJ4bvL68MLYA88tGkANjhZ9TXaey4V6A+YNviNShWrRMv8Mh1MHsVyzyAYY08jcUJICTCT8cg9vnF0QW06yT7q+ZLppzf7YXXp2yK1jp/8FrBg66ES/Az8HzRp69S8Dli8RhRfrb2/Z9CGb2I8UaSKxg9Uce7KRMfd34Igr3RSMWCr+73aHp5qzEJhNT8f+VEP9niREWx6uW0vnr2Dm39ggXAH1f9IWElPKDGELPH+KADj8M6Jaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGIeXweqjWBYfTbxtvWgxLwtm66/7rHUR02FO5Hkh78=;
 b=csh9xX5JfzkTUdVt5Dy7V3biRN3i+sydDEePTyNVAwllOKdOSiTTV14OFPDK0ZRfoW9SP4ouS4pbzFFbC7rxxf/nfV2KlwO4+wBS2HV9E06GMFCb1lffwGlKnFS+RJqmStTTVsXHl5bVbubvKYNCHZx6vrUML+vV+pW75mjeCLjEXjHGIE0mBOMxIu6mD7sG5+GetxmyBz3inTzg8h9c2ZfohSoCTtWqDh8fwaPhwYHuRDi9WNnZEB5dze4H3R1Kqsafxh3GdB8mOp7bfTLQ6ueqOZtS318d6503nqsXZ45delC9vZsUdt/Sy785uvdkpyru/TcCLW9tyy8qQHv0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGIeXweqjWBYfTbxtvWgxLwtm66/7rHUR02FO5Hkh78=;
 b=bA1AynA0oqBLDSR1ijG+ZFUwIFeM4Egdo4SfYtbBhO7WMDO7BILKDuldBHRUEoFh5LcR2jt0ekbyUheRqas5ICnrLb9ivrznJd54m5BnfCFCzxgyRyPBedoGOrOIRgR/hFY8QGlx4QgW4KIatiuqfDa5TsbMjFSnyQSh1naiBAE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4165.eurprd08.prod.outlook.com (2603:10a6:20b:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 14:20:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:20:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, ktkhai@virtuozzo.com, eblake@redhat.com,
 berto@igalia.com
Subject: [PATCH v3 10/10] qcow2-refcount: check_refblocks(): add separate
 message for reserved
Date: Mon, 24 May 2021 17:20:31 +0300
Message-Id: <20210524142031.142109-11-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 14:20:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d6414ef-a517-4390-163d-08d91ebf2594
X-MS-TrafficTypeDiagnostic: AM6PR08MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB41654240E07470083E7C1FB7C1269@AM6PR08MB4165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VT/1lA5fA3+PaKc0NF/X9nSPYGd9QUL8Y+SGT0Wyr2nMbJKus2DgDepFpwZG3z+9ab96ejGWljLrl8T8F6EQy24vxc3yB7lv9x59NHivYE9qP5AY3qS26PHulXZ9XBR9AtakAKfH8FySXO0+CVmem2wQ2UN5gY1gosYJaw0MtRmZUfXcmcZ1OGaFg8UNjt9SWAdbmZJpY7oPWuvUAygpDAHVfP82MZzbIp5M5NZJBpLrAHh3+vz/2d1J5QuEJXF6IHFNiyYyuEoAwyveHbpj5RIHWVqfWxeYg3TLrKIK8kTD729AhOdbUZd62Yqtb8Vf5r+80KzyLHAsgFlK+lsPLXSQfuLs+N4ebUES4KvYcUtnZ9ncA5cvxiVqWdYWPGT4nfjrVq42uUzihK7fj0ZMU4gG+Jr9RhGN3UBlCYlkDKaeCt2Hhf6jhZITWOY1SWx2Iqs1Fgc+zjr+5cZUeKQiflMLhdh7NARbLZNlULyiv+jcX3TgKPakCTcrcMwNL2zYZjoZjlLZ2fJ6PI49diI/2NzDtyeeDHCZCzLF3V+Qo0b9H7rgNpJ5aKvyKMpwUB4YdOgN+9dFxfcjfCyeAGaAonnl/yJHi6VPS1Ap07aA/vu6DQJL7bsvpvLXhIQRFthwdgFjqjF6GbznnjMjk363Iss6fdNCoRiCaj72vOlwtLpmY026DY9Z20jtidOawqdS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39840400004)(366004)(396003)(6486002)(52116002)(186003)(36756003)(478600001)(2616005)(956004)(26005)(8936002)(316002)(83380400001)(2906002)(6512007)(16526019)(8676002)(6916009)(66556008)(66476007)(19627235002)(4326008)(66946007)(38100700002)(38350700002)(5660300002)(86362001)(1076003)(6666004)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5vQU0RCpfh2cEC5yX823SLIUsUqF/5nswroiS6ReWlICIlTYQPxtBEVGaG/7?=
 =?us-ascii?Q?oMbkdzeb+dwbeTgL6zsFot4cxKMMq4W0172zI6aOLoYpTnR2kwOhTlS1mDy2?=
 =?us-ascii?Q?3bv6HV1CSOOeyDX0LA4CqlQM0edt4A71YvnHR2wuMjOpjF9w/K8XkVIwQpbf?=
 =?us-ascii?Q?UsrJo4IznwoViWkUG6WVqBVqMaPtFVLEg+DDRu4351sNcC0C7d44z5SocXSP?=
 =?us-ascii?Q?VdNOoyfLnKwbYgO4CvgK4X4Bk6IjdfLqrlPTYGDLm9XaNJ43Fut9DkZVBZnK?=
 =?us-ascii?Q?KIai0lgNRfKhTpKWUDf1Cu96JqaLJgfbs6D3Cl3ryL7uTYiDG9Gn01sLSWOG?=
 =?us-ascii?Q?xPaGp/aKAOO7OxH5FmcNZ7K+NgG58gWbczNhg1xeB6TRfgP2GsUQK+/4SHky?=
 =?us-ascii?Q?dtqW5YxPPcN5exBECUVSoSA/FN/L3ienHTBprs2JFNvGVJV8zp88s+9rFYmM?=
 =?us-ascii?Q?/Nn4yIljYt9+2qjb6d6E97bCve71+krx2RyR3/O5c+wg7LJghidxQScNiVAq?=
 =?us-ascii?Q?sZAHkcWkKoJgEPSW3IRr0LIQYw92e8V6upxzYVcF9PjuQj2P1jeJIOaMK7pr?=
 =?us-ascii?Q?sTeUxOUP4jUftDBQu3PBXHU2ATM+XrV5Iak00ag6e5jQ80LVUsu2Cpg09cz+?=
 =?us-ascii?Q?vRlQLHrmJGV0rk+RPjeFV4kQkEpeaFY0hkkk9dyUFT0VnoRRFwaegE4Mhbuq?=
 =?us-ascii?Q?xWBZhjHT4bxnXyxw6zEFPCuFhYDkfepJNeISHsYdKCx8CrMR8AypCBrsm4C3?=
 =?us-ascii?Q?6nIVBOASa7khBwfVsdrdZFnDkafybhkZKWK6aoxWAZ10iFimk7NGkTl0A81Z?=
 =?us-ascii?Q?C/QPsa/g2m3OiwRmSx3bsJ4QNqM9Hn8GWNkKC4edfzOZ5OjqUKgaYmgTxQCu?=
 =?us-ascii?Q?h1kFAI9ogfsluyaOKv2I/g8nF0aYUyMXDFZdl7XlZzKBa5No8mnjhKiNzUjk?=
 =?us-ascii?Q?aiYIUiASRg1O0qhqUTgtHEHQmWdRysDLZxlQyc9kpBCG2DBHyW0IpYeR7tlN?=
 =?us-ascii?Q?BLdVm5soeIwdIeA0aVetllhKsnkWSJjcyqhcD+QLtgjEM8dtSUZEsORkjtzt?=
 =?us-ascii?Q?I1jzLCf7/Cfc0AGMrUpp1KRuQ0pCqvqcozh2dw1yVn/LaYPrPbvGU9Een5v5?=
 =?us-ascii?Q?4BARsLcRF/GEbxKoU79FGprq7log/AtgEZf8HLfMCi/a2MWl38e9DbeMd2+K?=
 =?us-ascii?Q?X9yx/+7ewZYr9aCgB3h5sAstH9IDjeghjsA37DSdrKTgJXeQZDL13JqCkPc8?=
 =?us-ascii?Q?5iw9f9NTLh0Pri95Cif/ihF7/s3BqwJvHa/5pnDtLxqyw/NYumGmafnbkHa0?=
 =?us-ascii?Q?VhyH7HsyaoQwTf7Em944Od6F?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6414ef-a517-4390-163d-08d91ebf2594
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:20:56.8859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGSBAiaSZryId69TEyxCi3YKzt/LLVJvPg8OVxlLUW2+/uBpqGbTR+weP3nNtayiqCBxizU3Y3l7khS8dyg3vY9W3975X6oZ7iwGm0iOico=
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

Split checking for reserved bits out of aligned offset check.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
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
index 5903e058b9..57311c5610 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -2091,9 +2091,17 @@ static int check_refblocks(BlockDriverState *bs, BdrvCheckResult *res,
 
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


