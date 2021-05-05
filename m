Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC183735DE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:54:40 +0200 (CEST)
Received: from localhost ([::1]:50900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCMh-00028z-69
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIl-0005Jl-C9; Wed, 05 May 2021 03:50:35 -0400
Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109]:41697 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIj-0002WS-FD; Wed, 05 May 2021 03:50:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYecoxRiFA/U2sG9Y52+pnvlC5zAhY07FGtawaTAdnFTLqQfXKrVYHIeN+HdsOAG/zIkgD6BOOgtLZ6gbtGx+KapWofOpDmv4Ol/G2aHcwQKgJjKIUvvo/mt9Zs6Qr5u4De36mb+2BAEDzAv2EELQmzHDV6SewQyQgL7D8Cz10uxPZvu5STuS8x77ed8tnWqvIgQlc6Qde5UKczUhVDB9/9/7FHROL4j9HVPfc1xPbFXLzLjLXamXGLtlJvY5m5LbOLux7xfP1u0R+q8/IA0j3U+8qQetDrqgSH3BiEUSnidcw1mKcAVDhYKEs+wbWGr2Io7i/DbyHltHwJqZAFeDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4QtYr0EV0xTidykAWV/aMtQUFF43vNDdRWOi/3mZmQ=;
 b=i+2BV7OQ+CvyPS5Moy+2/gA5ujGmRl+0rSSomdt4VBucrPI3JPy0UIYo6nkKW4dslQ4d/G8FqQHckg23e6f4Rw9EKrHgNZLzK0XDnYgAA/2XMhBtLhyiikiuwhl6uR8bJp2x1O0khoTvBHwO7onTzsnI9TyAquvFYMIugbtdwUVezbIy39SNbLJ1FLkxR+zz6ysZMxSXqTk7xiYOZC+zNqHCXcSTq1TvK2BkDNAcGZ4M8a5w1G9wCRdCFv5MjHgWrWl0R/hAwU7SqJuJTETDxwprOi2OqEWX4x+JYYqiaUpF3HhNlbNUKDlIRmd5FgJuPm7kUmu6L3Qc94nbx8ZDzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4QtYr0EV0xTidykAWV/aMtQUFF43vNDdRWOi/3mZmQ=;
 b=ITkh4ypG6fLrpWzVDIhbuKXchZ8ZfgQHNV0HoP7QR3Bfg8wTuGXnIza5ftQhXCSBovNOi+L0SMvg41NzY/ocrAhdime185MpEUYZSV8zZicWs/iPIM5EB2jSWM0MRCGjt3ZGozcft3MwdLxRH+jTeJbXI4uA+oqQkHcHMTDVnXI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.39; Wed, 5 May
 2021 07:50:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:50:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, vsementsov@virtuozzo.com,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v5 02/11] qcow2: check request on vmstate save/load path
Date: Wed,  5 May 2021 10:49:52 +0300
Message-Id: <20210505075001.45041-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505075001.45041-1-vsementsov@virtuozzo.com>
References: <20210505075001.45041-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:50:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35567e8a-de93-4432-546a-08d90f9a71f4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6839602F893B94CF64CF022CC1599@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f4dKjJIvb5evrkir4EY32dIGIKC8yLXTkNddiyapOm63sNoY1tLXneoJqZQNCikiZUqXIpSUlbwx2FPVgXYZksPjrURgCmqNe22OcilSEXL4AmGc9YLVvkR/w+NZYnc1xihOB3Mqg+FbeXV/EdimWaTeZoXvccmjyQtvm/q3Y8ROJI2eaPV5lFduQnO0fYMJoo8YKb5zartXHrrp1hvAkgkCPA2tmcFS0mXcpjPsSg80QROaDBJY3142mk4FBv8A0qN6W9vcu+pHlUHab6dRIZWS9s0F06CvANCk9Et7ZJ3RZKq/3HSnSMxGLxWv37OFmyZd7HuY48R7gGoRLWrcK1KrgAsDynKFB0oW6arDH0cH9gVpVSYLvL/vrc4u+ppVzFKAblwUDtaEQ0+f0UDlFNvQxnwK0ymCIPI2PpMX8aGe69E+6ZMjkWTgLa8vhAubPPgjE5X0LzRQ9/h6zCERx1xg8nSDLiC5gFlbGJzSeig0xafhZSarTdhRK7xX1O1G8IvpRSsU0zRV2CMpoQLBIiBmu95iYBMJwlSW0VZ4YWtJ903FtfUlKlr42yXaSOEvOlACKALrI8vW/JWB7C9WWGrRG1set5nEvRp8Mu7NkBnDMGggxbKQRjEmbeBDr+wlxZMMW5GjyTgjTCuFy+oxz2VG6KFAjJRKB2yIX8DXfRPuUpjFskFZ1Yoy1Podd7W3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(366004)(136003)(38350700002)(38100700002)(66946007)(26005)(66556008)(6506007)(66476007)(86362001)(16526019)(83380400001)(6666004)(6916009)(4326008)(36756003)(478600001)(316002)(8676002)(6512007)(2616005)(2906002)(186003)(52116002)(956004)(6486002)(8936002)(5660300002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8BahzO9qUB3Ua4IGl4jfol9QFB2mQg8FKGedmWq7CLWXGdSqYjM70O6FA8D3?=
 =?us-ascii?Q?a0P4r9BOaoNjhGC8dJ5ueKaHV2iXL2WzHjhKZG4Vp1J34TAR6vAitITuu8H4?=
 =?us-ascii?Q?GbmiaVi+R1Ci+V6ZXwKm7BF/W1kwcF8wCKzp3kDSSua5YVPf78xOW7C2VmrG?=
 =?us-ascii?Q?wTYDwaot7HItqrY6wnJgP4yQMUvVvsGywWXwohUwghGF3Xzwzrc2J1vhn0kn?=
 =?us-ascii?Q?o2Pc5BtgsUY8cKoqvnmNoyT1ImtaFFDFgNcDVQQIF4fSJVNE4uN1PP9k2Qz+?=
 =?us-ascii?Q?unzgtQQT+rdnU7ZTy3w/qveJhqVYfAuKIZ6C/8T0sjfA0OTXMQG6WnMseR3L?=
 =?us-ascii?Q?RCiPGtDQxnviv4EUfP6UPm61i9D4BM2F5oYebn/gcccBVil5wEaVSTXgbFuN?=
 =?us-ascii?Q?IYAR60BwzuPOWnjMLvObebwGcKHn9jTBx2YygATfFFL90a6tKDRsmnvKWbJ9?=
 =?us-ascii?Q?7fLJGYyh4jZLwOBYos/QPKTXMGYKIzQCWhrUQvENPUsAAk83FtoPFNTFkSZF?=
 =?us-ascii?Q?+O2P5Vv1zJQ3l46/gweMoVcv8LW39O6lU0pvwS0ae1DYGQm4lYo5YnRyOwzi?=
 =?us-ascii?Q?SWlK16aLT17fZXDdiTpnIqfpH0xMXhx83I8qGU2lptDkrOe29W/Z82CPFY93?=
 =?us-ascii?Q?ydciIUHso9a3XBbB2hPsrr01k0lk5PQGU1reJgrb8/K9Nyeu846ajLAGCfbP?=
 =?us-ascii?Q?pJfxy4RRdiCfm4AFGrd3bSOIPCceHwiC/lsU6e7dz7QiRrctHEqRN1SrMXd5?=
 =?us-ascii?Q?kRyOpRt74JwBzmYEIcbSA/pXskyPM8o6a+t7IXn2YpeAySmlx9xvn8aJtOtx?=
 =?us-ascii?Q?qubiqnOchHw68GpbTo/3IX9QH+9S+wXb+jEnnTktOGdlrJBNoULQPHNzVltN?=
 =?us-ascii?Q?Ocu9dveSHBSislUwe9gtnB83jpkQetzVgmV/Z85C6yO8M+xdcu8tGjflxCOF?=
 =?us-ascii?Q?b+VsSz2lXfGZhpG4AznGUVK4oHIyWtKN5QmkbDJsCEfrD4CKouOK5BoK5vTC?=
 =?us-ascii?Q?1/2HQbfPOudulKJhdGzfAPLCdEgftxs8RlTx0GPl4Fox4o6DZCKWEGT2J0Xh?=
 =?us-ascii?Q?FtP3aEYAqgVgDoTGO+HdBRR0Ks4a2CUFAwEkn9Zu7PdawAEVtnkiQBvgYmc+?=
 =?us-ascii?Q?1PuuIGbVGrJk7oEnbWZfUVA84C3VYUkVUhEzLtMNbVi/u7ePqAxx/FlhXI/P?=
 =?us-ascii?Q?/m3a+MkWEwst7FuXkvEW/2bHrhBK7mveQ07T1+qc2nlvHkq2+frmbHqbZr6k?=
 =?us-ascii?Q?qM5s9z26Ovz4nWm8m9TucrSFs0Gh7CgxAoY2QyYS6eO8gaqmpdDHKGLYWs5P?=
 =?us-ascii?Q?f//u/pHnhQf7RrBmdpypAd+n?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35567e8a-de93-4432-546a-08d90f9a71f4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:50:26.2815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ab1Z27HkZdp9G9GcZfbWVj1Y7RJQQqj/VdIaDgvC03PQr+ByNVXCzQBbBXhiLWVRX5G6DsZmatkRv0OTIcQ+4w+P09OC11Oh+JDpWIEqpV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Received-SPF: pass client-ip=40.107.8.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We modify the request by adding an offset to vmstate. Let's check the
modified request. It will help us to safely move .bdrv_co_preadv_part
and .bdrv_co_pwritev_part to int64_t type of offset and bytes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  3 +++
 block/io.c                |  6 +++---
 block/qcow2.c             | 43 +++++++++++++++++++++++++++++++++------
 3 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index c823f5b1b3..d2143eb40f 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -93,6 +93,9 @@ typedef struct BdrvTrackedRequest {
     struct BdrvTrackedRequest *waiting_for;
 } BdrvTrackedRequest;
 
+int bdrv_check_qiov_request(int64_t offset, int64_t bytes,
+                            QEMUIOVector *qiov, size_t qiov_offset,
+                            Error **errp);
 int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
 
 struct BlockDriver {
diff --git a/block/io.c b/block/io.c
index 3eb6a38008..932a26f0bb 100644
--- a/block/io.c
+++ b/block/io.c
@@ -951,9 +951,9 @@ bool coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
     return waited;
 }
 
-static int bdrv_check_qiov_request(int64_t offset, int64_t bytes,
-                                   QEMUIOVector *qiov, size_t qiov_offset,
-                                   Error **errp)
+int bdrv_check_qiov_request(int64_t offset, int64_t bytes,
+                            QEMUIOVector *qiov, size_t qiov_offset,
+                            Error **errp)
 {
     /*
      * Check generic offset/bytes correctness
diff --git a/block/qcow2.c b/block/qcow2.c
index 9727ae8fe3..227885620d 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5201,24 +5201,55 @@ static int qcow2_has_zero_init(BlockDriverState *bs)
     }
 }
 
+/*
+ * Check the request to vmstate. On success return
+ *      qcow2_vm_state_offset(bs) + @pos
+ */
+static int64_t qcow2_check_vmstate_request(BlockDriverState *bs,
+                                           QEMUIOVector *qiov, int64_t pos)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int64_t vmstate_offset = qcow2_vm_state_offset(s);
+    int ret;
+
+    /* Incoming requests must be OK */
+    bdrv_check_qiov_request(pos, qiov->size, qiov, 0, &error_abort);
+
+    if (INT64_MAX - pos < vmstate_offset) {
+        return -EIO;
+    }
+
+    pos += vmstate_offset;
+    ret = bdrv_check_qiov_request(pos, qiov->size, qiov, 0, NULL);
+    if (ret < 0) {
+        return ret;
+    }
+
+    return pos;
+}
+
 static int qcow2_save_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
                               int64_t pos)
 {
-    BDRVQcow2State *s = bs->opaque;
+    int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
+    if (offset < 0) {
+        return offset;
+    }
 
     BLKDBG_EVENT(bs->file, BLKDBG_VMSTATE_SAVE);
-    return bs->drv->bdrv_co_pwritev_part(bs, qcow2_vm_state_offset(s) + pos,
-                                         qiov->size, qiov, 0, 0);
+    return bs->drv->bdrv_co_pwritev_part(bs, offset, qiov->size, qiov, 0, 0);
 }
 
 static int qcow2_load_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
                               int64_t pos)
 {
-    BDRVQcow2State *s = bs->opaque;
+    int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
+    if (offset < 0) {
+        return offset;
+    }
 
     BLKDBG_EVENT(bs->file, BLKDBG_VMSTATE_LOAD);
-    return bs->drv->bdrv_co_preadv_part(bs, qcow2_vm_state_offset(s) + pos,
-                                        qiov->size, qiov, 0, 0);
+    return bs->drv->bdrv_co_preadv_part(bs, offset, qiov->size, qiov, 0, 0);
 }
 
 /*
-- 
2.29.2


