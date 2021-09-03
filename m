Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486E03FFE41
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:35:54 +0200 (CEST)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6Y5-0003pB-Bb
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6R0-0002t6-Nu; Fri, 03 Sep 2021 06:28:34 -0400
Received: from mail-vi1eur05on2111.outbound.protection.outlook.com
 ([40.107.21.111]:45006 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6Qz-00025z-5Y; Fri, 03 Sep 2021 06:28:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVuetuZmqv/le7doSen25G5KHQ+axDkGxk+4NGKenqeD/iomuokVBq8idpi/6tzrld20QvSeqfIqFoDCQAr0DkacgN+mZ2+Fl/vfFCdFmum0i9LfLC1eoZXGoyl9rPeDccEuuDllcbNwQlbmkgK4yc9sc7qgOLl16s7yqmixYO7T8mJzBb7WosAjTsaRxewWI9xqFErWvs3g6KcN6vIXt+P7npBzdk0wNCxHkBjJSMh2uIHkzQM9waR0/NaTnovAQGauWNaN+enyCxE7aTDyeydm34VU+JPMy2U2JP5xP+KZI2ZWoUiGoxZ7mdj+FT7/a//+n0HhWGcbrgFe7pXoeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=LtY5DMEzIGq0nSG6N4d2PbDlqXMuzHVf5c9Ffma9Fys=;
 b=fdQKBvUnkkxaOaFufWHdMzlBwW8DgGNIHfLL3W1KeUKuCD0BSZl6s6X2Rjn504vIuvLzQeDhqVMPVP5w42jdhwss+yEphL6vhcYbYwEQ+608N20qK0c0sbrS8fRgWp4X+iiNz5W3awUrnUsKqvhp8PZ+a7P+l4JpVZnSSk2+GaoVZ5Q0j7I5wo4SA7tj0Olm5no2uNamS29oVN6/Z5CB9IT2LOkAHLV61xMIJ0BMURu5VB0dTbp4Wz7N2B+JWa5Hfbaakx79LAqKUWdUJezXn0ATfFvcIf72DY8gaqKQCS8BT1ZMzhwsyLZ2drafgapMyE5DlCyb7NT/7vUixjCiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtY5DMEzIGq0nSG6N4d2PbDlqXMuzHVf5c9Ffma9Fys=;
 b=XHEEFa4QsAujuIRO36jLa30IG6irNZZLhB6wDPjLIp3+UE2oyKNiHRIriN941NGIHYjx7CMv8gJMxXpF+zdBg8D2oz3xnZqNdtzfbbsjaaef1WTV+0oEieGX4kpYQVZ+45mzTDZOqJlpr4b3mbuxN/mv3qBNq20uU9RvWLw8s0Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7009.eurprd08.prod.outlook.com (2603:10a6:20b:34c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Fri, 3 Sep
 2021 10:28:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 10:28:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, kraxel@redhat.com,
 idryomov@gmail.com, berto@igalia.com, philmd@redhat.com, eblake@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 vsementsov@virtuozzo.com, jsnow@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, ari@tuxera.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 02/11] qcow2: check request on vmstate save/load path
Date: Fri,  3 Sep 2021 13:27:58 +0300
Message-Id: <20210903102807.27127-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210903102807.27127-1-vsementsov@virtuozzo.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0163.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0163.eurprd05.prod.outlook.com (2603:10a6:3:f8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:28:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59989b92-fe80-4e8c-957a-08d96ec59097
X-MS-TrafficTypeDiagnostic: AS8PR08MB7009:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB7009558648427428EAFD57B4C1CF9@AS8PR08MB7009.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BLWolEeuSqpRY8mbnOxJTi2bMSpPhgxdtZCAofLFn+hYDbltLTNJFTOfkoRG4MQiLUVzN98l1SgEr9/jhSp9ARYbLKbmk2w3fc7/3fnnMgtzkZ0Rg3Y90z785Cw1Njq06fuM0svLU2Vu3fweMKzeizJc0i4Ojxj8sZYKYnSBjBDKX0oosdwdPeTcqsDZ0sKwcYrsPqLwDCTIXvpsbRG8WRXGsUkzoXq9ArazlydlqC2BC85kMdcTFJ8qZPc52+UJqiano68g4nLPjvFYamnWabbjRbR8CDAyo5XB9WFPbG83fNdww7oO7/h3GkjZMiwe/u/VAJHSeSJvla83cWz+YgnRACexsNUbQUpxCnJKwL5Z6fAnN9HQE75F3nKh5wskKMfz/sUvmB9AJWVUt+Dg7JQmOQDyxGALGZJffW9aeiTPPCSX/eMiH5A1BPEiceFVP4G051+xznqoVlUfEvwkdgC40VloBm9R1wn6fUbJp8AvnuUGcJmsjhrvvlZVfgqXttj8376OiGMqKjMPmxvkeJyYy4D+W3SX83Jk/MCU5Mo0pxpFRvpwNiuP8Cg9z0AS+B8UZPxWVduTjN/mdPOewK0U2anTEBTOU4utip7PuIDrwo0ox9nsmorUwDG0O0s9FERDezWze7BxZfjmePW3Xn6sDfTq5vowhvL99sjUNbpPnUXRQVl2TW9xQBrxIfX/ja0r5CntLPXVR3mateHCCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(186003)(6666004)(508600001)(36756003)(66946007)(6512007)(66476007)(8676002)(52116002)(8936002)(83380400001)(7416002)(86362001)(38100700002)(38350700002)(6506007)(956004)(26005)(6486002)(2616005)(316002)(1076003)(4326008)(5660300002)(2906002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rqvyiuIweNB6Mg+tYad37H6OSc0aJBtkOjsJFfL1b6vdGZemaRLXViirC49n?=
 =?us-ascii?Q?LfIyn5Fbopsijh4AYxIB73Sb6hHGs7JMnPNMlj6JSRjuq3Weh6N/AcbX3fEz?=
 =?us-ascii?Q?DO5Z/G4y5OT+gMZ/pscTeajcgz72OgKcWZFsCX8TjExjkJRL/QuiqEzRrG+s?=
 =?us-ascii?Q?WHUdgcDJEbkMT6tumSeQ+Vc6kwL7eWJrWsmjygcStlJSS0s79bEAvEgvdas0?=
 =?us-ascii?Q?cHlgiYvPXkFyPkV0JbO9cUfXOgJTTw8r8AIjJUxvdxVjjs3NtZ+kjNnZa1H7?=
 =?us-ascii?Q?pYstSQH0qgg/6oYrIYYrcMpvSAju/NVtIo662WG09RdTBuARXCXZVNjUrKoB?=
 =?us-ascii?Q?I7/VkztqeA8wcdQu06Oy15oqGhjdwLtKXaHFIDM/TZvFCzHTygBOizZBUqm6?=
 =?us-ascii?Q?c83ONCpQSnkfdP8AiB3DREeDM9JyHVVm7OGB54Y9IrOHwH/DUo3NA76XMNjZ?=
 =?us-ascii?Q?RR/SBPRUpH2WS9c74v2nHvnMy4vRGNZLhNkTNxK8HJ66iLlG3mZbKr31fjx5?=
 =?us-ascii?Q?519wbMWvk65tUZdCjN6Ja/4Yr++pQPO43ANvo4TZjG5J9lRc35sF5INnhMny?=
 =?us-ascii?Q?SD/h58eoWsTtnl1ijfSMIKfeiAU0j+3LEDEz0lsgjOLQuBhXkyZTHmhmuBxJ?=
 =?us-ascii?Q?yYSOYUCBHqcYXBmuJI1XeYNd4/LZunFbQbKemUmZxgOhMWjv9cT1MfUct9do?=
 =?us-ascii?Q?a1nwXV0gw6um7z+eLE9fHRUPfqQzgfB0poIWV7AhRkDZPWSEoKSqCplxCmic?=
 =?us-ascii?Q?GG2PUP83nyRZ2vxQWJOWHrIPmM7q+MJ22SIQIdd3sdTgjZ07W57DzcNZrX4W?=
 =?us-ascii?Q?OnzPSo/YKZCM0QK39UQJjOh+DVBkADILjBSi1x8MQnCxAHlB+c6cOxBJPVqc?=
 =?us-ascii?Q?o9NmYDeoi4i0PHgmBR23YrmX9T8jg2a2mO0+kcvafckYk0DFvbk898zwEcCG?=
 =?us-ascii?Q?G32nXHjkY/Hl8jOvrHV59tI70lqxu8sd+vv5UskAJojtvKxD1IfcQUJ3hlVy?=
 =?us-ascii?Q?MtJ2rxQ7wSix+e+4XNhHTlTJRhHGiHFg2+0/6BDcOC8M2/3WkAuMBVo5YOOU?=
 =?us-ascii?Q?gfaNFGPhTwKTQq2bBpjPeYEBh5QfJoWFFYRLcKjCD9bisqaVwtdOTeA1ONLu?=
 =?us-ascii?Q?lMcY8bWFQRwHxmV/Nrp2ozObSGatpSjN+99WyChN8KtntyQpqNTYKHpik/L+?=
 =?us-ascii?Q?QRk96ZUWZxwRA8F4k0RjG+GE2keTp+MDeC4QKv9QNpZAl9lxxtdYMfiSkRkz?=
 =?us-ascii?Q?uN/QK7ZMCHtiwvZpkqdOoLhW2djwVpE9DmAGMXt9zjM7T/7e9/TBM5B5rD0t?=
 =?us-ascii?Q?HTavHE6JzVv2iyMKZBw1wVKM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59989b92-fe80-4e8c-957a-08d96ec59097
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:28:26.4794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLRDKENvu776/aNkLrtg1beF2NiqazDeX5PCirL8GiewysiA8qmyoF8VeN7DA5nNhFCcfh5+D8cpryFWTYES8wk4SxQFb7RFmNohI3wHAvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7009
Received-SPF: pass client-ip=40.107.21.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We modify the request by adding an offset to vmstate. Let's check the
modified request. It will help us to safely move .bdrv_co_preadv_part
and .bdrv_co_pwritev_part to int64_t type of offset and bytes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h |  3 +++
 block/io.c                |  6 +++---
 block/qcow2.c             | 43 +++++++++++++++++++++++++++++++++------
 3 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index f1a54db0f8..6f15cc9073 100644
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
index 542e0305dc..0058cf4a6f 100644
--- a/block/io.c
+++ b/block/io.c
@@ -956,9 +956,9 @@ bool coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
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
index 9f1b6461c8..04ad512897 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5230,24 +5230,55 @@ static int qcow2_has_zero_init(BlockDriverState *bs)
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


