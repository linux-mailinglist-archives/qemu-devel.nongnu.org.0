Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F7F2DBB34
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:29:28 +0100 (CET)
Received: from localhost ([::1]:46670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQJT-0005NN-Oc
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ85-0002is-66; Wed, 16 Dec 2020 01:17:41 -0500
Received: from mail-eopbgr00123.outbound.protection.outlook.com
 ([40.107.0.123]:51180 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ82-0001E7-KU; Wed, 16 Dec 2020 01:17:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjEjjyUYso+K5wtmZU7BhNuq81JrIzm1e1kObWE/Ye9KYpeX09M4d3C2A9i0atpJKpKinEVJw58STwshElAnE0ZyPyYS+pCvDihJR6Ax3G+W7SiZSfdSa9m1GRqCYBtqytjOPkNMUBMeNcNtHEj6AJw9adju7ZGmRbdqTsGe/lUyb1YbSLlHW3uzDJ4+GX1G9yrMv5OdKhfJ27xP2rG2RvJpFb1S3dXyj/gsh2Bsc4hYaQlfcqp0tXl3s78ZAFs6cXn66WQ9ogwjbx+39BqkB4qhbWOeUpQI8m314Hau4yYY5sDjlHTe7UqiScHDGXNJfbZC1PyRbrl3JgYsS0jQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTXwsXtRlJe/PeIsn8mrc7KxlQIf2b9A1I32uEYF7kc=;
 b=UPmrYuuzY1ru2ml4xBm9HI5A1rSLALC7phlc2p4iFhMtuzeGfFP0T3Tvct2JVKb9hLSXmvj67wOitu99UcWTmfGan71L9d7FMSKIq+CgAsWDrz4RXjjQGM0DEuQOjThbIulTByHTM/3JZTp8f9vCt9TFA7xYi2XGBrUInx7B9bvgArYQ7ItbxIkQ3gnksfyGCWam2EdJMNWjHFivoF2D7mSASic5jlZbZR2mNqdUSEWmDYbJf8Co3oRHi/NFPnZlBATjqTyoSwq6ZMfdAt400c9cmnjRovXiRaDV/k6sPdBsSUM1G1hOw1k+zrcAAR1VKXg3BGJL1C6upMMZGHqNqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTXwsXtRlJe/PeIsn8mrc7KxlQIf2b9A1I32uEYF7kc=;
 b=tXhOdkK4VDwC13zO9tJ9i/8TG1mglW+R3L/0uF+NrrVRpcETcZhP321q7evV/sQ7aeHKu9VnhhCplkLnvbro8FWEBUAP8I47Xgej2mft/F7vwfsjLBn0fCfT1NsJPpBAFbHboHeTLE57++LalGFqPOzA4c4WOTgxfYfD0Q4w9ns=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 08/13] copy-on-read: skip non-guest reads if no copy needed
Date: Wed, 16 Dec 2020 09:16:58 +0300
Message-Id: <20201216061703.70908-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216061703.70908-1-vsementsov@virtuozzo.com>
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e857aad3-44a8-4247-f2d0-08d8a18a41ae
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63098C25BFF916428CADD0B4C1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y8za/zpgfKGEFgAAuNOoQ4VW5xc3duxU5FA9LO/QbeW4veKWe+u1crhRd1gKZH4ks9+tZ58bD1hi2lFFenHUQ7Mer4Wg8IK6jHa9cyebn3Q9o6ueHBn7+kzIMJAbztLEucnLArIB7sEL9dwziKLx5QdeZDBRFqCInvOgWOq890M05KvqId2/aKNVJibIGQgQMchB65ulr5kEKoXz7rACPGqumM6spkGV5aiACd0KKfvNBsNWc2kQjtqQ5nGjEafAoKYe3e6gcH02dyWmJz7eufunqtaCMJhUhD8xyqeV1+DX/czlIO/vHPxfhO1YQ/2O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(39830400003)(346002)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?q9UiGXv+/+K8J+Tp7Hr+Gi5ayQtSQrPau+iFpmy71XpxClbv8liexow7zg4V?=
 =?us-ascii?Q?M1dhjel11n7EkuJ5UdDp7YjN5wSsup8phXSlhTLO1tGYUoZ88kpcAM5pYExG?=
 =?us-ascii?Q?xTdbdLGh/3xam31EIpUTEZhedQfBeYUx12nDE3KuhCqNrOAosH2iUlQ2rdKF?=
 =?us-ascii?Q?nlX/FUjTS6WrHKBgEeZV73bM4Y32hTdfELkxtt27uQ4d/f6hBAmlo3C8Wk8k?=
 =?us-ascii?Q?EwJYMPoluOib6G9Zli/+DOctzNVu0PDzhQAXYLNTtA325xQ/2RJO/IKGzwtt?=
 =?us-ascii?Q?fm9gHeILeU/8XL4IVVf3pFH2VYYyzh/s/xCc5d0S/ak6oTlxHHShgzuZJuHE?=
 =?us-ascii?Q?5EiSFipZaZo9f7rkT+DO69hrnvYv0e/R+JQRmI5Pt4D7tiJkEtwLSo0TvU7I?=
 =?us-ascii?Q?HDpljUvnWJW5Ae4g0bVC+7M4IcWKNjiy9TDnooZd8THhej/YEzV7PlIOR/dW?=
 =?us-ascii?Q?MTAoneUT09s+RtQJCADIrhWxBqWmwJ1c767t2Ozj+7YLq8h60cqT9+rcgx0W?=
 =?us-ascii?Q?koWRueHvnUTdXEreSmhg801u7pt3CvkQmhT9yHep50Lkfs6wGctweRqi3nR2?=
 =?us-ascii?Q?JbZd6lbOn01i50rHxGuzU72hozcpppt3EYdwPhwW2UptyJFw0iyaL2TdQ/G0?=
 =?us-ascii?Q?8YpwQQ1Z5mYa2ucCl44omnXAo/EwFEtxDRW2Oqx/+UvV1OSgmoGWpand60Qz?=
 =?us-ascii?Q?bs6wPyNXEHxjD6ZY/HCOi0GPwPyG/aKOF103iY5KlPEa4IbNBbjUjOLodz4i?=
 =?us-ascii?Q?9qznpzRxVQKPByiAFJXgJ0BU0RvLmGSIFqK8EofT+6iNMiOYoFY+Gl4aJIkO?=
 =?us-ascii?Q?dCsfnrIfYntDl747c5X8ccEdnNxKVq1da8D18kt5nbJYbIIMIwxbp/mgMgqp?=
 =?us-ascii?Q?xO6tenQw9JhPvVL3BfkT8Kbf4DieonOTbQKhWKTvbfw2npq6ZwxC5E9VYvi2?=
 =?us-ascii?Q?mEvCKgcURVtErPQRGgYa/wQvzvj5sax6uNJugxc145zTdqkus+wdwPbJKHrh?=
 =?us-ascii?Q?lrw3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:25.1920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: e857aad3-44a8-4247-f2d0-08d8a18a41ae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04ydCdqPsCvGfoGaGpjYSJ9ltxqlOORrUR0cbxUKQdHsHn3bTuILw2gig62SNzErqMCt03OBMKWeWV64YBQFVHE7LnsfxGDCW6JXbRtuJwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

If the flag BDRV_REQ_PREFETCH was set, skip idling read/write
operations in COR-driver. It can be taken into account for the
COR-algorithms optimization. That check is being made during the
block stream job by the moment.

Add the BDRV_REQ_PREFETCH flag to the supported_read_flags of the
COR-filter.

block: Modify the comment for the flag BDRV_REQ_PREFETCH as we are
going to use it alone and pass it to the COR-filter driver for further
processing.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block.h |  8 +++++---
 block/copy-on-read.c  | 14 ++++++++++----
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 8ea794959b..f652f31406 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -81,9 +81,11 @@ typedef enum {
     BDRV_REQ_NO_FALLBACK        = 0x100,
 
     /*
-     * BDRV_REQ_PREFETCH may be used only together with BDRV_REQ_COPY_ON_READ
-     * on read request and means that caller doesn't really need data to be
-     * written to qiov parameter which may be NULL.
+     * BDRV_REQ_PREFETCH makes sense only in the context of copy-on-read
+     * (i.e., together with the BDRV_REQ_COPY_ON_READ flag or when a COR
+     * filter is involved), in which case it signals that the COR operation
+     * need not read the data into memory (qiov) but only ensure they are
+     * copied to the top layer (i.e., that COR operation is done).
      */
     BDRV_REQ_PREFETCH  = 0x200,
     /* Mask of valid flags */
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 71560984f6..9cad9e1b8c 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -50,6 +50,8 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    bs->supported_read_flags = BDRV_REQ_PREFETCH;
+
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
         (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
 
@@ -172,10 +174,14 @@ static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
             }
         }
 
-        ret = bdrv_co_preadv_part(bs->file, offset, n, qiov, qiov_offset,
-                                  local_flags);
-        if (ret < 0) {
-            return ret;
+        /* Skip if neither read nor write are needed */
+        if ((local_flags & (BDRV_REQ_PREFETCH | BDRV_REQ_COPY_ON_READ)) !=
+            BDRV_REQ_PREFETCH) {
+            ret = bdrv_co_preadv_part(bs->file, offset, n, qiov, qiov_offset,
+                                      local_flags);
+            if (ret < 0) {
+                return ret;
+            }
         }
 
         offset += n;
-- 
2.25.4


