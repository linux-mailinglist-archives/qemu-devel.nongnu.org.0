Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F6B2D7F4F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:25:38 +0100 (CET)
Received: from localhost ([::1]:40514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kno2q-0000N7-MC
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnL9-0006rS-Jb; Fri, 11 Dec 2020 13:40:27 -0500
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:21414 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnL3-0008BO-IY; Fri, 11 Dec 2020 13:40:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDBeE009uxFh+V59r+FEnAqFfyUdKn00p9qe8GrxgvH6SvbactN9H5OOluq9ns2EkLIaGeB5yxufTUM0iEam0s4Kj1NmaPSYPP9RqKRBnvMno90P1oMmPdK2eLojopnUkVHfPtalVpE0iB9T61j03t3esXh7rXhl2+AkPxKE/KEUlKssnqB/bZ10x/iuHpZWhDNwXCf3nDXWnDHY83MuuJycX5nS6ydjlLWSrIHulr0D6hiOvHZao0iyFf5v91ErmQKZWz7+0nneyJUjcBvmtzS8CEP+vRGyB5Tel5Eu6FzabXxDWJZDXUi/xT2rhnR+mCozzVM5mapdWW6PXReZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fx/hAaIC2EAKEDXeCBLuq8xobo0AOX2o0mpmedLOCrc=;
 b=bElNM/4E+Khb8WaV+nbiKmlGKDMxrOnhilYXeskKdHydctNuPraSUhPmXZ4NTJ4kPl8nBPWDOif/fCYBhq+gl/vCFRntHLxCOLOZArIpXT0LhhhfEWyB+nF1a/9jDQ+/3ukon0YNxnI6opKsTXiIWuu0FhjW4RJRcxjr1F/xzKm8+Q/Ezm9mTIPvqKRUWGA1nUIa9uIJlKd7+CpbwgMyuOgj2Ogv2XN3kA+Dlt4uwKLyDPpB/P/Mdmza7+IN7SJBt19947A99GHidBSZ5JzmI3jPXvFJ54kzyReEKg+N+DniDKALV79lUOpalFp7/biQ18yamF4VHu5Hu/2KlpYr3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fx/hAaIC2EAKEDXeCBLuq8xobo0AOX2o0mpmedLOCrc=;
 b=ZLLRAVaclMdxn52NheRy2KM32YsTCCtLi9qv0/5m0EMQDnuwN+ZU32OuZwhCONgjuqChvHk5G/NdQ2CwcxL0Ba0rcQzCQ+obpHMhIpJk8QyX+jOSZ8qQocgg173hKvwkXgH5ReGbQl3o1lmele2pB3hAid2e7lEIp08LhFJsBYY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 09/16] block/io: use int64_t bytes in driver wrappers
Date: Fri, 11 Dec 2020 21:39:27 +0300
Message-Id: <20201211183934.169161-10-vsementsov@virtuozzo.com>
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
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05063f38-3443-4d50-4a40-08d89e04278b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB49159A911F115F04B3CD3079C1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mGKGEcvDxSAzk0gjPIv8V3YnlczJObPHKIZWOYF7DEtoVkmgPOTg25DxRAtqpEqjDURoisLyqJQnPzfeIRqPsVJfXMn20Q85CGcre8TYdyZTPEPH2hz1C0fdqQDuFBA3TzGSilJ4KG4ySIqCSZhDIe+xv7zPjFo1cP9SOY3q7avqTp2/SFC31Ndzf0fEPCoebzFaqqoKizWvjZH7ptxpAjdaM4uNNdkOecu+RR+2iVMoMx+9e6boIAa52wUTP2nMF/PZ5AZVIjFuLL6YxYGTxlDv7R4RSOdcWM90fVFUUJt8ow5c22mhPIKAYqHT6oQXb45yUh/nDQdtL2Pa01PKfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jt/dl+Mj1/1V18ac5hSPTg682X7hGehCURh8y+PB2RnM4azYawQEeL7PFraU?=
 =?us-ascii?Q?S6Z5tVglHCATBn1oxOlj7fCPYPgj5bUdmyuXf49JoiHCHnNKBiphTTsdtVhN?=
 =?us-ascii?Q?Q2eGRe5ithJ6vRFhf0NQAbzhvOTc0i/rypJ+cGqE4eyI9cgsaDVlhz66GWNd?=
 =?us-ascii?Q?7h2uXKZMlQ43jFDHMsr7lImAnrq94NFj3QXASru2oAjS2BTPwkyeqSC5/BR8?=
 =?us-ascii?Q?Nv+Ftp5xe5l2CzJ0x6KyvUB0M0YUlSA2qnTJ07S7MC/WmPpB0zCY9sh+ppaR?=
 =?us-ascii?Q?3XOMc1qh8AliyB0PLdPyhc2Y5wI/wWTAMOUAHZj1sZtBgp97Cn0D1vVNPyEc?=
 =?us-ascii?Q?ZaswEWpAFq6v9k47fkSdoXeDSVnWBQKAv+8cIKY8DNP3J9bNeR5Jxxxj9YAm?=
 =?us-ascii?Q?YZhwGIjrItSTZZ0/5QwgfIupGgRlTyWGnRWm+NLl4VfNfUSen3aU3WvajUQ2?=
 =?us-ascii?Q?Xr3xc7TcHMAxEggpKZAHsLOJoHLE06cLUTJvc69Hdolajl05cwdk/MNpYcjJ?=
 =?us-ascii?Q?G1h+H3OFzjCeku0ZRuyZdXr5q+7xBGyL+Url4J5JwyRKJjoCB/jmBsqf1N/J?=
 =?us-ascii?Q?8YqRF1reS9aBSpZ3PtD1wu8xa6vAu5aFljVBq3nAxShentqcyqclKXUhCGBh?=
 =?us-ascii?Q?ZOUKSMHgPRHQeaeqS6jAikJqI+DqKdGR8xx2YK8JQOdJEyxqmAznso6nQ2jV?=
 =?us-ascii?Q?8Bzi7RAbnBSifWToWqqCMF2lnpA2l+D7aOA+y+YZoy5FI9zdZugCBOu4fiKf?=
 =?us-ascii?Q?zUWAxd+51cu0S8RnO+Kzhrf8dWO8jIv6+VCEFM5i9IBpLaq+epYxfZ+cgLh3?=
 =?us-ascii?Q?R4Sgkj3k7b9Uno2SF1n88n4Oxu7d5NKCNYBTKx1jcdq0xqnoWcKpJUsHPU/n?=
 =?us-ascii?Q?XuuyKKYVj7hMYz3YPGy4xFiDWW1GJCMaZXCtqcNJRh4nVajXCd9A2k0YEXEf?=
 =?us-ascii?Q?xfT9pr8Lk3CJo0x0fReMtWNQGC89OJQdANzTk6N8b4pkSs+B+kpqQb03ZfaG?=
 =?us-ascii?Q?vD4Q?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:55.2188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 05063f38-3443-4d50-4a40-08d89e04278b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hHcVdH/AuaRCJA552h2ZwwHHKlSOzGffo6NMUCqpkS7BZlAe2SwSG8yxOpqxk3OvV7hgR05DtqvU5P796Mua7fiJX9/Li11tqmfOkzbb/9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.7.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

So, convert driver wrappers parameters which are already 64bit to
signed type.

Requests in block/io.c must never exceed BDRV_MAX_LENGTH (which is less
than INT64_MAX), which makes the conversion to signed 64bit type safe.

Add corresponding assertions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index 5dec6ab925..b2bf18038b 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1103,7 +1103,7 @@ static void bdrv_co_io_em_complete(void *opaque, int ret)
 }
 
 static int coroutine_fn bdrv_driver_preadv(BlockDriverState *bs,
-                                           uint64_t offset, uint64_t bytes,
+                                           int64_t offset, int64_t bytes,
                                            QEMUIOVector *qiov,
                                            size_t qiov_offset, int flags)
 {
@@ -1113,6 +1113,7 @@ static int coroutine_fn bdrv_driver_preadv(BlockDriverState *bs,
     QEMUIOVector local_qiov;
     int ret;
 
+    bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
     assert(!(flags & ~BDRV_REQ_MASK));
     assert(!(flags & BDRV_REQ_NO_FALLBACK));
 
@@ -1172,7 +1173,7 @@ out:
 }
 
 static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
-                                            uint64_t offset, uint64_t bytes,
+                                            int64_t offset, int64_t bytes,
                                             QEMUIOVector *qiov,
                                             size_t qiov_offset, int flags)
 {
@@ -1182,6 +1183,7 @@ static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
     QEMUIOVector local_qiov;
     int ret;
 
+    bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
     assert(!(flags & ~BDRV_REQ_MASK));
     assert(!(flags & BDRV_REQ_NO_FALLBACK));
 
@@ -1252,14 +1254,16 @@ emulate_flags:
 }
 
 static int coroutine_fn
-bdrv_driver_pwritev_compressed(BlockDriverState *bs, uint64_t offset,
-                               uint64_t bytes, QEMUIOVector *qiov,
+bdrv_driver_pwritev_compressed(BlockDriverState *bs, int64_t offset,
+                               int64_t bytes, QEMUIOVector *qiov,
                                size_t qiov_offset)
 {
     BlockDriver *drv = bs->drv;
     QEMUIOVector local_qiov;
     int ret;
 
+    bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
+
     if (!drv) {
         return -ENOMEDIUM;
     }
-- 
2.25.4


