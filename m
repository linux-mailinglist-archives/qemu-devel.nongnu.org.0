Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7182D7F22
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:07:27 +0100 (CET)
Received: from localhost ([::1]:48792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnlG-0007uQ-Mg
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnLG-0006vK-UU; Fri, 11 Dec 2020 13:40:34 -0500
Received: from mail-eopbgr70090.outbound.protection.outlook.com
 ([40.107.7.90]:11267 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnLB-00089o-97; Fri, 11 Dec 2020 13:40:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fw82PfIhikMPHnQa18BJYkEwPe4cREzM+Q72V7MHfwIrfg0P/C1dMcecYXf9l+g/6DeD6lT4+FkgslfWZ0T1R8W76P0jD5F0Y11zl29xx+0+1PT1tQIEwhj7SwWjoxZ+tjai/EpO5YuCQDwWycBCBx9Z2goyrd5WbezM1CqJ+5qvWi4xvR2nuTd7MqUeqQEvD8/V4PndtDiColRhJOKnF27TczQY4m7LjypMmRCU1Xgw/F0Dlg2WmIU+sdlQCSOYsJmwtOpjRWGZzQ1nnGgHleCaS6Qwc9kH2A0IuPdPd4esbYNo4KdrdOU8gNE0C9E6dH3eIfuE/8TNyJbzAscdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEkmetIL9TcYHBOQbWl8jhNIui6ph+O5zv24qYUh4Hw=;
 b=j3zMrZsclkdKz3H3o84T1frY8Nu+RbwlwFWKNZYIbTsWMoJh0DwzR8OhQWzPXFnirCDLEsHCfiybxLnrk9H3CoPW2O37EcCBupfvP6nwZzK+r1vb5xt7WkyOZ4L8c+Przb9JX7ag9/TYBaZFROqppZ1fQUcFqbjEHL5nljwMeWlNYA2fB/H7QBDtHh+//6LGNoFRIOGO55isZiycW/IEdqTohL0upVtUWeBipHg1oNqg1fH2daoXEmm4u+rU6Cl8ULgF1L/q97ueRrZ8AYyAZTk5eRdbxQ6jOyylKxdiEjXMWw+FMER/whDwcZfuE7BmzgW5OWYnOtGPvTehW6aJtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEkmetIL9TcYHBOQbWl8jhNIui6ph+O5zv24qYUh4Hw=;
 b=jTj7WP7Wkqn7xGsMAxE2hOP2kf94U6w837BVyD75iA4WoL5MjWhTsNgJ6rypbm54urVCXJP//x38Y/3Ra2S3ca3rJUOl/6a1cPm78zmmGVOtBE+UVROxfqq1bCND2vNJ0h/ZAbmsbBOAhES1jLx9AMNaTSQ3c8UjpSpzH98+Qp0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 13/16] block/io: support int64_t bytes in
 bdrv_aligned_preadv()
Date: Fri, 11 Dec 2020 21:39:31 +0300
Message-Id: <20201211183934.169161-14-vsementsov@virtuozzo.com>
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
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cad1513-8ce8-4458-3f9d-08d89e04297a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4915A59B62D8B35E417DCA47C1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lTZVvist1TlGIol2w6fRKALxROI+ijJqj2NDq1f2ddRjahyT6s9ATgYy5STpU2E7UdxvxnTm/yUXtCHwOqsPmGD4SXTMhlpUQ8chGC32tFlnMCNq6Fzwf8IkPyOhG6YIbr6zjV7s3v3cqhTZJQbwNUfFF1xpgFjQGZWpd8la1ln7/DPZf0oUYaa2mrZhEButbaOLbu0ci38e5xFJq/2uZ5ERTeR3DXZXBydr6/zeXSeTGfgwP1k5lZoLLhu43Q7s0uQgtN1o3FZWf3ia8kD4EeXTkdAvYOjGGU7pWXiUgAcd/WpAcmQcaV0EaAnGuVnZzqJIY6gjxbkM4LBYSWPWyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3sjAzdJJR8X2J5/PtW9Zyk9kqqwWc6gmuPVUX4fgpm82d5DEJQBLvSwyiA7I?=
 =?us-ascii?Q?66uAvzLWxlPYmhJGI8TvqOj3Sy8r1w54gwHiVR9WLppeaR7EjqFK86VRG4bN?=
 =?us-ascii?Q?yiNKtRCBwpPDBcRBLHVHCq/H/mj0UuMHWxcmiivkj+KHnNyNqmMyAp+3LkUe?=
 =?us-ascii?Q?o8JZ4OwPuLzDwX/I8HM33Y1+k7BmvjN//q6Co+/ZSfgpgelO4ExdRG6i048K?=
 =?us-ascii?Q?pDxOfbpUrutBM47JRk0xFhTQ78Rhnv4jRJTBmHJZmTlBpsIbQSqtbRjawA5u?=
 =?us-ascii?Q?JDxGoDpr2VHuxLt9wBxvBww8Eip2SJ6UYs81uUP3EzYa4wG2kLC/G3tsYPK0?=
 =?us-ascii?Q?eQm4pdE3rbdxWOtH9jZxSjw3q5KF6LVw/6UGOqwVKjDymqpKEt6Ba0iLq/79?=
 =?us-ascii?Q?GdF3QwkbofUS0H4a2AdG/GCiIIHL1hjFL4jzbUCbOGxPzXs8AeGInmwIEeTG?=
 =?us-ascii?Q?lLtWaBKET75pY/1zD5ChO0W4ovOdFkZ7D81WzVOYLOf9eoc94tDBazijgW/m?=
 =?us-ascii?Q?gqjBkfWaSOTqcL+B3fnURPirpBWwS+mP253Crb2J1RCTyD6sgrFDzNiJ1nYz?=
 =?us-ascii?Q?QCCd+kFkq9TNd4HgoGt/fvXH3H7n3uIXNBs9c/dfc/RuNSA+444njubLKCjj?=
 =?us-ascii?Q?PH8MPPsHHOzMov0OgHXnAe6I8qihmwgNzFlYXvvbWEtR56uPHjTqPwGUcIIf?=
 =?us-ascii?Q?YXtdOLoegJlyPJajMuGhDV793n/wToACdpmV8zppk6xsTlJ/Qv01TXktmiA5?=
 =?us-ascii?Q?t96sC9uSvwwzYWtrHt6rwxRPfTE8wdPFlViQ+sDsA5TCfrisahTTzSKKF49c?=
 =?us-ascii?Q?t+vbqMdsE+lxV5xXaJZmM0LXyu4uVcxiV/yYHhogQB4gnmZ2omY0Wi1XlOUq?=
 =?us-ascii?Q?MpwedGjn/1PNtb6SfDnZ8BFDNeUfLRx01PEyUCOhffY640kbbAo+Z//AUk8k?=
 =?us-ascii?Q?cPAux94Jf3CIqKz3VDs3jvywV6WS4BPJn9Xpwn7F8RJBKure7JRQR7lk23d/?=
 =?us-ascii?Q?9Wry?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:58.4566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cad1513-8ce8-4458-3f9d-08d89e04297a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dybLb8cUmeuP9AibFfnID0FjYQUSF6qjrlwWgGRvdYUHqs75r9q0HMDeh8koM1U1rKGDr64EYCKq68Djs1IVZkZ/tYDyP0/2Ad98ex855fQ=
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

So, prepare bdrv_aligned_preadv() now.

Make byte variable in bdrv_padding_rmw_read() int64_t, as it defined
only to be passed to bdrv_aligned_preadv().

All bdrv_aligned_preadv() callers are safe as type is widening. Let's
look inside:

 - add a new-style assertion that request is good.
 - callees bdrv_is_allocated(), bdrv_co_do_copy_on_readv() supports
   int64_t bytes
 - conversion of bytes_remaining is OK, as we never has requests
   overflowing BDRV_MAX_LENGTH
 - looping through bytes_remaining is ok, num is updated to int64_t
   - for bdrv_driver_preadv we have same limit of max_transfer
   - qemu_iovec_memset is OK, as bytes+qiov_offset should not overflow
     qiov->size anyway (thanks to bdrv_check_qiov_request())

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index d8c07fac56..93a89a56e3 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1453,15 +1453,16 @@ err:
  * reads; any other features must be implemented by the caller.
  */
 static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
-    BdrvTrackedRequest *req, int64_t offset, unsigned int bytes,
+    BdrvTrackedRequest *req, int64_t offset, int64_t bytes,
     int64_t align, QEMUIOVector *qiov, size_t qiov_offset, int flags)
 {
     BlockDriverState *bs = child->bs;
     int64_t total_bytes, max_bytes;
     int ret = 0;
-    uint64_t bytes_remaining = bytes;
+    int64_t bytes_remaining = bytes;
     int max_transfer;
 
+    bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
     assert(is_power_of_2(align));
     assert((offset & (align - 1)) == 0);
     assert((bytes & (align - 1)) == 0);
@@ -1518,7 +1519,7 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
     }
 
     while (bytes_remaining) {
-        int num;
+        int64_t num;
 
         if (max_bytes) {
             num = MIN(bytes_remaining, MIN(max_bytes, max_transfer));
@@ -1624,7 +1625,7 @@ static int bdrv_padding_rmw_read(BdrvChild *child,
     assert(req->serialising && pad->buf);
 
     if (pad->head || pad->merge_reads) {
-        uint64_t bytes = pad->merge_reads ? pad->buf_len : align;
+        int64_t bytes = pad->merge_reads ? pad->buf_len : align;
 
         qemu_iovec_init_buf(&local_qiov, pad->buf, bytes);
 
-- 
2.25.4


