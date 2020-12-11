Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749BE2D7F3C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:16:26 +0100 (CET)
Received: from localhost ([::1]:60028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knntx-0004g9-FW
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:16:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnL5-0006kb-S8; Fri, 11 Dec 2020 13:40:23 -0500
Received: from mail-eopbgr70090.outbound.protection.outlook.com
 ([40.107.7.90]:11267 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKs-00089o-AD; Fri, 11 Dec 2020 13:40:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uy9ioJGKg1yxlJCU9MZVX3HTj97Wv/+Z+T35fw2wrgpfNLtEFR09aZg8r6OeZ653JQr9v++9O7NKPFLArWQb7N55Ui6YWnEpXaoXwbCxOtM0ltzTGhrXwYX3QkOO7k8GldUejBYWbUPjWdD595iki7ks1awqK0hrcYR7gScM9uhb3Ha8tVbEW1P/r9N23eZ1AT2oSJIlH66xOeZ71Ii8PLYbDh6ut83rTkrghUJdoTh3pey4bGdip+dKdtmi18vCGrSInfQr50EJzxoQqrxNjtzuPQpC1n7uRFPIowVFt87OPb8zWAHKkpr/X1wJpOWGzH4D9t+0616ZmT96ud5upQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fpKfrQ2GcMX74J1uBIDqrWQTDh6khkW6lExgvhocEg=;
 b=CcFhGpItO+SfOdx4OeA10+gpcgMaYnzJgG6RRJUssJ7idTi3oeiASAb434LQh/4sbaoa4U9TPIQHP9fhmddRm31ARIo7v1+AQcaFE8MajJAQB1dJVPASTw2NLhqRYQOMBwflCd2YzwlJ7Y37BhhaKmC3yDUn6wp0P1ISTSte1fV5msgIh14xT2XSxB/sF82aO61VQPhU2cLmYyupnIXVzcpLjV5RVEt5gLt9ZFRcdxLjl6ipFmHDxApNZMCvByXruQoxfsjRidF8iDC2sXps3PSlWXkbuiEwg0Gm20L5xUfhPPrIZA9jhSdYZf/nZsYtAzvpHWbnotwfCrgUwpfGFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fpKfrQ2GcMX74J1uBIDqrWQTDh6khkW6lExgvhocEg=;
 b=AojKft0KEgiq9mgqYvGI6cPEs+qbN1tLeTP+et5WAXRHkAUCyjifsHwSf/aq0ZGim5WlhZvHWDUgcwNuKu+BW5JAD5/6iG6W4KAExxotG/+RemfVa7frL3hhJWV1adsMs+s98TPNhnJbWp8um2y7LlTo7DJUN5vAm4/JEasZhWA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 08/16] block: use int64_t as bytes type in tracked requests
Date: Fri, 11 Dec 2020 21:39:26 +0300
Message-Id: <20201211183934.169161-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201211183934.169161-1-vsementsov@virtuozzo.com>
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:208:1::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:208:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5aee86d2-224e-44f4-acb8-08d89e0426ff
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4915B19FB18279757019E512C1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DL0DvESihqrxghc/E7eqZsbzyXhIG4hp5mV/UNYo5DrIwRzKU+w89YDqL40AKih4MHUYf8iWAhZlUjYFQhJbx/SdPbLg4GGxCNpaE5gDZDdsapE5NUZni8IRvY8FYpht1SL+IZyTE9OXakffQ5xJjzSgpSaXYdaCXAdPfzhq2fBvLu6tR8hJu0PXfGwcSC3u1VmoaDO6e9BvN8ULxzqlN8NZSmD4KFffLzLfeYM39POwPxtXwDR2pgFjN4gyq3GtG0xRwadWE5pXMOivtmuwSAsMcKAqaEKQmTtY+EhKT8rUIeUvAIRZKg/j4NthwuxSOj71u9fyDy4Lt9sklmLtEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ObZfFKX3/BgQKX0WEYy9vdGy5hveyxnXrbDSvkVcTpA+usbNWrfo6BUrsOgt?=
 =?us-ascii?Q?D2kzGAqLdyhtuvtf6zUcP5V/n9/kg7NKC1mtvea32HJAmuxyg/4jYwmoRshB?=
 =?us-ascii?Q?P5uWhUbIq/UCwIV22MKBiwWcEIwJs0zXRnMO17zVd3tizsns6jCynpG1tfWe?=
 =?us-ascii?Q?pIyn1jQlSkEO47KcITbI8Y1wTjUFhClYfhi5ZWR8yi4vFm24+ntkaqo7OJZW?=
 =?us-ascii?Q?CGoZwRlQtOs2e8JT0Uh29IcU0HJ1s8+UI5YRdPyzlXMUkr0nL76LFRMChUUo?=
 =?us-ascii?Q?sBIpzdBuMKBlqiRUD00NOSaWZZQ/+KW2Bqy5AZAMYwb49a6meCyvpNSmZ8fi?=
 =?us-ascii?Q?u/feZa7mlmYAoq/VRO33b41kjzn2ZO8188triXdf3NI4VdyhE5OtTbn7YSU+?=
 =?us-ascii?Q?TVy14PcSSYVvVE6vcf3pwKdU3NjA5cSOMO7hCuvdt0i18LC2+dSL3sCP2TpX?=
 =?us-ascii?Q?T34vueqhB5wqcrR1xEg7ULBb2FWVI9/KsEtv6zXANwAwXVDq+WwHIG4ifHrd?=
 =?us-ascii?Q?ddQDVrHfoowNFlisZ45CWXZOtcKqYZePU1qk/L0lC6EfKbr54jq1pjelz/wM?=
 =?us-ascii?Q?puDdgAluidbnXzdP2VhEqkGBH3ksV2bAJHrSj83fkipKyPIwQSh5tLdcXmQ1?=
 =?us-ascii?Q?N/DNIGDIBFrABJQyHV3t4KNBJEOy7iXK2xQxxoeG+vygGV1MJDJaiDE1BC0p?=
 =?us-ascii?Q?iT+iCg2stX4NLFn2rvetSAcHgYAvORm5pjSZZRO2roOLvctGXIqz2Nyz7yUN?=
 =?us-ascii?Q?DENYFO6FdHexbd9TEWqeXtQMYUvta+fRd3GI5LAfiLPBa1rwDXwkwyieKWID?=
 =?us-ascii?Q?V+cjunbMbfpF8p1PTE2SnkrS4kJjKZiD9z36vcM7flocjbMJSBc53zYFGzOP?=
 =?us-ascii?Q?HDe342XKdnGgueLmy/x7JXhIwg5lqB3SlyD7PNPEj8OMvDTxc8ZzC1I7IyO8?=
 =?us-ascii?Q?sBBzoPLLjiWiot/U5oNNt+f7fR+CabmOuLf9l33mKLlvCXnnTEV8VdxNfOhA?=
 =?us-ascii?Q?aDnX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:54.3835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aee86d2-224e-44f4-acb8-08d89e0426ff
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDDUNEF8txIg8Es1COji0KstUo6nFL87YGcwyHQi+i5aAMNyS/7Yk27wfRT8ndjJc0IxU7Jof+lfpBrED6Yq3Gd1uTonRJ7YCacr1MO4L64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.7.90;
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 berto@igalia.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

All requests in block/io must not overflow BDRV_MAX_LENGTH, all
external users of BdrvTrackedRequest already have corresponding
assertions, so we are safe. Add some assertions still.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  4 ++--
 block/io.c                | 14 +++++++++-----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index ff29f31451..04c1e5cb58 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -79,12 +79,12 @@ enum BdrvTrackedRequestType {
 typedef struct BdrvTrackedRequest {
     BlockDriverState *bs;
     int64_t offset;
-    uint64_t bytes;
+    int64_t bytes;
     enum BdrvTrackedRequestType type;
 
     bool serialising;
     int64_t overlap_offset;
-    uint64_t overlap_bytes;
+    int64_t overlap_bytes;
 
     QLIST_ENTRY(BdrvTrackedRequest) list;
     Coroutine *co; /* owner, used for deadlock detection */
diff --git a/block/io.c b/block/io.c
index 42e687a388..5dec6ab925 100644
--- a/block/io.c
+++ b/block/io.c
@@ -717,10 +717,10 @@ static void tracked_request_end(BdrvTrackedRequest *req)
 static void tracked_request_begin(BdrvTrackedRequest *req,
                                   BlockDriverState *bs,
                                   int64_t offset,
-                                  uint64_t bytes,
+                                  int64_t bytes,
                                   enum BdrvTrackedRequestType type)
 {
-    assert(bytes <= INT64_MAX && offset <= INT64_MAX - bytes);
+    bdrv_check_request(offset, bytes, &error_abort);
 
     *req = (BdrvTrackedRequest){
         .bs = bs,
@@ -741,8 +741,10 @@ static void tracked_request_begin(BdrvTrackedRequest *req,
 }
 
 static bool tracked_request_overlaps(BdrvTrackedRequest *req,
-                                     int64_t offset, uint64_t bytes)
+                                     int64_t offset, int64_t bytes)
 {
+    bdrv_check_request(offset, bytes, &error_abort);
+
     /*        aaaa   bbbb */
     if (offset >= req->overlap_offset + req->overlap_bytes) {
         return false;
@@ -798,10 +800,12 @@ bool bdrv_mark_request_serialising(BdrvTrackedRequest *req, uint64_t align)
 {
     BlockDriverState *bs = req->bs;
     int64_t overlap_offset = req->offset & ~(align - 1);
-    uint64_t overlap_bytes = ROUND_UP(req->offset + req->bytes, align)
-                               - overlap_offset;
+    int64_t overlap_bytes =
+        ROUND_UP(req->offset + req->bytes, align) - overlap_offset;
     bool waited;
 
+    bdrv_check_request(req->offset, req->bytes, &error_abort);
+
     qemu_co_mutex_lock(&bs->reqs_lock);
     if (!req->serialising) {
         qatomic_inc(&req->bs->serialising_in_flight);
-- 
2.25.4


