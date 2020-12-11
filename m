Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C03B2D7F64
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:31:10 +0100 (CET)
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kno8C-0004UE-Up
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnLA-0006s8-Ex; Fri, 11 Dec 2020 13:40:28 -0500
Received: from mail-eopbgr70090.outbound.protection.outlook.com
 ([40.107.7.90]:11267 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnL6-00089o-TE; Fri, 11 Dec 2020 13:40:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cW/lW45UNd4zIFuvccEeiPgNeWScXV5VNhfORMVvfhytczASxZXS628v3sY+VWw4KRy91Vv6wQN1vPOaIkcgaHyb+VzHogkyqKPaUDPtcTPM7fiO+fH2YHGZ0Ex7t8KBZTxzPs0vLzKP2+MsSPtj72SS38sQDc+fgP66vQWCB6/WA3EnjsYc0yN9PpJzrDROrNLtCUyra6rH02CqXpHwQtaywKcIACEt8TR1rMfwMp2MBYGEEmFWhlZqF7VUQZrj7tB+dhyGPsEWQI9yEi+1z+t02Kz8iWtZzOM5Y9/TbdDZL5PW4+eqyOzoqHu/cRicnRMKh7euN5MQijjVfzanlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BopKFar8T0Yq1EWnUmiHbeEMhZi9E6KAlxSZ0Hg9Po=;
 b=YInHZVrhUBtkuNdBeXj/+mlxs8N8Nt6q7vD4i6cqdFivbnhwI1mXXpJoVO4d/pFfiaesfaEOVQzaGDt2mJa0cUlwXF4em8eY2MzEDEXGzYkb9EOX/AKQhwU7B9NRq5TO9BOP89wP6y9gWjZ/J4FjQoORy3BG4ot6AWxafKZs0g+L+jI3A4MZTTBrEcHCEFih/qyBmtOLkCaJeODfl7neer6tc94x+8vpoQI99GAuxZZOPNxjg/YRLn/c04vlTS5G1cxjauh5+AewHXnaR8frn1hP2aKF/Z6HniE3YfP8A1gtPdsNRepu/FIz8OyzxNFrjfKy73NGyqPd3RLfeEH5iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BopKFar8T0Yq1EWnUmiHbeEMhZi9E6KAlxSZ0Hg9Po=;
 b=eFCqjvHVcPliDz8DD8tdIAE2EXp++bIMI6V5DKXXMlsZY5nh/ntyWHJs/c5iCCYm3CMNr/3PXSFID6wKpqrSKD8eHjDmP8RLC49bzMVG02ihzPTP5ok4NWAuJt04HGBcHymjg30wd0oHWvUdbLCqMh27gq85nPv9vp25i/1rp3w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 11/16] block/io: support int64_t bytes in
 bdrv_aligned_pwritev()
Date: Fri, 11 Dec 2020 21:39:29 +0300
Message-Id: <20201211183934.169161-12-vsementsov@virtuozzo.com>
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
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12164ef7-61be-4526-0208-08d89e042876
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4915389EA0BE1ACD94000F26C1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1pdvBjLAFP5ZuW7MWjXYyIkUhY6Qyr6sIdBDxqqW2tqyWUsD0dMBaE3s20ZFgHsTUGYpVhu33my3LSPwIRXkbK54bbHSqS4R0CA9+3T3KSRG0aroqR2tN2TZeX4oOd3XgXgjoCjPb8Vm0xdJDPqVZI8mGQuVlS1e8xUidbFWnhKMUtXPnO26BlCNxIPQBowSf/aeJDF5t9V5PomNnYYG1m6Bp9agcbkLkGhr9Xsrzgsgk27tr6kuG+yNt5hIK9XYWkEENs+7WkleHsgr4f1qF/jkFZWscTZAiIY+tvpd9pZ55sB39VxTdApgRA+3dXs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qO7vWuzcJutdpE2fTN+9KZ8s+3sjE1Cb4tC7/XYdfzOSknEoJiUQwjy9Fzxa?=
 =?us-ascii?Q?Eb58e0dsAqlnLOUuoq8oLqnN4FWAfEsvQJDyfbuz6pGc0o//wRu1RYzjJLDx?=
 =?us-ascii?Q?QkMchi5SIxdtRJbFxkbfUCtjeQwXqPSPWnUioiymSNxTLarv/FlI6QzglVeh?=
 =?us-ascii?Q?8bnX3cmMksPR7aCFUTbaYhVUt8AI+Inu+WPBklpWM6pnziWXuo/vsvcPouK8?=
 =?us-ascii?Q?G2ZSxsWn91l3Em4A9yPtGBCjlQJXTlR5jS/SmGXdFrPtqekKldZOgniP26HQ?=
 =?us-ascii?Q?lnrV6293wV1EZyHatb+zXbS6oYEHs4nvvtY2+TzDV2vkOCTWC9fws02BO81t?=
 =?us-ascii?Q?PUWAl3+LAXs0/H0SAZ/Rv5MSKjJhFlWFdXbYNxfPYsZnSxD62rNZ8+pMUq+l?=
 =?us-ascii?Q?4ByL+p9FTs+owR98uQz+Z6gQT/nbDHZfaE7H1hVmDUgWTZgz44fuw+zqRjml?=
 =?us-ascii?Q?eQScW+eV5uPUEozu7YTg2XDwGSsVn84dBnT7LyTBRXDwOs6fEDRJm7Sw6xi8?=
 =?us-ascii?Q?oT9d4C+XBrQb+p1kNLxqYFnZ6oRJHJKjtlrlyazkWE2snz5u87odNm6sLMQb?=
 =?us-ascii?Q?OkF/jz5fBuNf1zVeqvYr/pKEvUfKtX6mDIzXXgUcc4ONxkqFBph0sAjuZmOp?=
 =?us-ascii?Q?CvgzL+W4mU2VurjhxQuxI672jZFUsWj9Erzpy+UDd0zKFi/E9BcdFysz67HS?=
 =?us-ascii?Q?7AFSaVMGsgmiQxbtBXFzZVCu8rDK/1kkVA9Z5Ft2IKOoUqAbZnX2NK4CRxOB?=
 =?us-ascii?Q?ZrlD4TFFxSNgM9uXEhDSz1CcNk3eCNvE13c0ipmJxdjiwvIwTpP9SVhPJtxN?=
 =?us-ascii?Q?v4rc8rwXp9KfliivyhISOP2sctPKOqZLX/1y/u5Dg5tgignmbTjHtjonm2QG?=
 =?us-ascii?Q?e0asXDXyXZcVkW6xiXKqN+c6vwk5ew6bbbWBiq0jQCC3t/hwOm6trESUoZGC?=
 =?us-ascii?Q?Oq18B70CcNHs/5Ve2+9G8oluvJP3fLtNWHaM9EBHGyqEYsZVHGL24XOJvt4l?=
 =?us-ascii?Q?655g?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:56.7939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 12164ef7-61be-4526-0208-08d89e042876
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfJlFSFL2KYqswOkSEEqu/JwrzDAmd+Phq07Mli9+gUZK7VngDC39d4c2xv3TRFKuGaN3TBDWsBYR3k3nRyt4n4yNkkV50SySX3aRzaSmvc=
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

So, prepare bdrv_aligned_pwritev() now and convert the dependencies:
bdrv_co_write_req_prepare() and bdrv_co_write_req_finish() to signed
type bytes.

Conversion of bdrv_co_write_req_prepare() and
bdrv_co_write_req_finish() is definitely safe, as all requests in
block/io must not overflow BDRV_MAX_LENGTH. Still add assertions.

For bdrv_aligned_pwritev() 'bytes' type is widened, so callers are
safe. Let's check usage of the parameter inside the function.

Passing to bdrv_co_write_req_prepare() and bdrv_co_write_req_finish()
is OK.

Passing to qemu_iovec_* is OK after new assertion. All other callees
are already updated to int64_t.

Checking alignment is not changed, offset + bytes and qiov_offset +
bytes calculations are safe (thanks to new assertions).

max_transfer is kept to be int for now. It has a default of INT_MAX
here, and some drivers may rely on it. It's to be refactored later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/block/io.c b/block/io.c
index c6a476559a..b499998f54 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1904,12 +1904,13 @@ fail:
 }
 
 static inline int coroutine_fn
-bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, uint64_t bytes,
+bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
                           BdrvTrackedRequest *req, int flags)
 {
     BlockDriverState *bs = child->bs;
     bool waited;
-    int64_t end_sector = DIV_ROUND_UP(offset + bytes, BDRV_SECTOR_SIZE);
+
+    bdrv_check_request(offset, bytes, &error_abort);
 
     if (bs->read_only) {
         return -EPERM;
@@ -1935,7 +1936,8 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, uint64_t bytes,
 
     assert(req->overlap_offset <= offset);
     assert(offset + bytes <= req->overlap_offset + req->overlap_bytes);
-    assert(end_sector <= bs->total_sectors || child->perm & BLK_PERM_RESIZE);
+    assert(offset + bytes <= bs->total_sectors * BDRV_SECTOR_SIZE ||
+           child->perm & BLK_PERM_RESIZE);
 
     switch (req->type) {
     case BDRV_TRACKED_WRITE:
@@ -1956,12 +1958,14 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, uint64_t bytes,
 }
 
 static inline void coroutine_fn
-bdrv_co_write_req_finish(BdrvChild *child, int64_t offset, uint64_t bytes,
+bdrv_co_write_req_finish(BdrvChild *child, int64_t offset, int64_t bytes,
                          BdrvTrackedRequest *req, int ret)
 {
     int64_t end_sector = DIV_ROUND_UP(offset + bytes, BDRV_SECTOR_SIZE);
     BlockDriverState *bs = child->bs;
 
+    bdrv_check_request(offset, bytes, &error_abort);
+
     qatomic_inc(&bs->write_gen);
 
     /*
@@ -1998,16 +2002,18 @@ bdrv_co_write_req_finish(BdrvChild *child, int64_t offset, uint64_t bytes,
  * after possibly fragmenting it.
  */
 static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
-    BdrvTrackedRequest *req, int64_t offset, unsigned int bytes,
+    BdrvTrackedRequest *req, int64_t offset, int64_t bytes,
     int64_t align, QEMUIOVector *qiov, size_t qiov_offset, int flags)
 {
     BlockDriverState *bs = child->bs;
     BlockDriver *drv = bs->drv;
     int ret;
 
-    uint64_t bytes_remaining = bytes;
+    int64_t bytes_remaining = bytes;
     int max_transfer;
 
+    bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
+
     if (!drv) {
         return -ENOMEDIUM;
     }
@@ -2019,7 +2025,6 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
     assert(is_power_of_2(align));
     assert((offset & (align - 1)) == 0);
     assert((bytes & (align - 1)) == 0);
-    assert(!qiov || qiov_offset + bytes <= qiov->size);
     max_transfer = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_transfer, INT_MAX),
                                    align);
 
@@ -2118,7 +2123,7 @@ static int coroutine_fn bdrv_co_do_zero_pwritev(BdrvChild *child,
     assert(!bytes || (offset & (align - 1)) == 0);
     if (bytes >= align) {
         /* Write the aligned part in the middle. */
-        uint64_t aligned_bytes = bytes & ~(align - 1);
+        int64_t aligned_bytes = bytes & ~(align - 1);
         ret = bdrv_aligned_pwritev(child, req, offset, aligned_bytes, align,
                                    NULL, 0, flags);
         if (ret < 0) {
-- 
2.25.4


