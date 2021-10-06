Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B916423F5E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:32:38 +0200 (CEST)
Received: from localhost ([::1]:46888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY72D-00026e-J7
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6oA-0005A3-Dv; Wed, 06 Oct 2021 09:18:06 -0400
Received: from mail-eopbgr40136.outbound.protection.outlook.com
 ([40.107.4.136]:14496 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6o5-0004IV-0y; Wed, 06 Oct 2021 09:18:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNGa02Lmb71V7CZBWNtV6jgC5w07ac752Au8eFvQsaatLBUZuq+6XD+8/9ba4DLdWKIdMttP/h5LeLJfwLpv2xJk6QUKCKJRn+xcKKAQKVQAI9W7Trh8dxVPmIklmGfw8gf4iMyfqcdu/CVo9z7+ovlMDx5yjKO9OyBUrQvTRJJ8MqSNVWFjHK699iDNpvmtk0UPtHG04d113wK6eeveMjfKGwt7JD9t3XWYqFu5Jnk1iewmMiwpyUBDIIjHv/7XbgMKFW+H614dqCLhSvXZha70q9iyDoJYXJoRUiZAz4Ca6I0SUKb5qAgd9QqXjznOjqFSo2nn0nxSTB3wiuus7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqtPIlK9mznWtFNucBwQjG1NAD/msFn66fYW0QKgrFQ=;
 b=bLVK975eU42wHFejdMufEQosDN2O3iDtXViJqRk+19ItpNXeBxjv2sPzjjfvYQrvU9MUxHFZldkI2+IrKT4HJMgV+UuYB6V+cBA1GX+EsD+VSgM3oSKyfOxW0T/XIhv7U6at3jdQUBZHdPsLTwRGzYyyGo0OSmot/E7CcEi+hrbHSeyr9+dcWXwLBoaZJsOa8ehSNFajo0ybqzQf91EKPWRzITRKJLFMidfrUdjLUpGKrlN+FAfZi4FVTozA/RgbE6KFqKsQnsJzqzRWbisV6Im06tcUfXlYoyfLTUtJhNJqYptRJaUNUsy4r0P+kkKl1MsvNNh6u8BdkS3Qf7Uhkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqtPIlK9mznWtFNucBwQjG1NAD/msFn66fYW0QKgrFQ=;
 b=s8WGRuSwm3rLt5fBQQQawsCIsWjKX9yPKYgReHG81969cQ0viKyD/LfK6BGx90kKOt8FsdOAGs51ZAWM34GWMoQLYe3fEUaRfhPGJZwW/plcU69hnFvMmal+cDpDZPzHKCoS/kTADw1zvsFPyWpT5GuSCJDvwSlsE7CoQoVos7E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 13:17:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 13:17:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 08/12] block-backend: convert blk_foo wrappers to use int64_t
 bytes parameter
Date: Wed,  6 Oct 2021 15:17:14 +0200
Message-Id: <20211006131718.214235-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006131718.214235-1-vsementsov@virtuozzo.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0296.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0296.eurprd06.prod.outlook.com (2603:10a6:20b:45a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 13:17:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 465b33f6-24fd-4878-476b-08d988cbaa6d
X-MS-TrafficTypeDiagnostic: AM6PR08MB2981:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB2981A4BDF84BE9F64735D728C1B09@AM6PR08MB2981.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZUqZSsgRaDrUFHJ+bwSDjsuih1R+qp1BML8d+yEHhEJT9fXtExb+iOHsYy0bsLT1Kt3LT4zlIl54b0WLjoJBWJsmOqkSBgH6ExWBCgP1TsgtJjGo5LUo6/R/Vy56/WM2uWLqyHSjS+i3ifIUgUpBeHRQwN3GF+lKWvB8rwkDtJDINh1YlOeE2s3Np3Xs2tE0i1Pxvz5kGwDpXO9L30mj8wTlgflvlEnDJd48Cu8cU8f7AgXQrmiXzTHJzj0A9rtza6Jp3M8df+L+c/t+TISbRwAqL/iZRzgYZ163PEngp5zwZNQC+XQt55/jAbKQFhJZWN7HeE5mb7w6H/A3WSJYnQhEbb1MmGA+FWWVywsOQT1f012P02SKsbmDlhv51tTZGicKvLgvwCEEUiyz/IxrB4DfEJVOhaKjoKaZ+6iWj+aXsacJJcfR86VRMQW0+6TvEC9DWv2HuV5LugXf2eHHkmS50zIJF/CG6qvgo6MlUr3yGNgu5Z3F9Ox+0X7DadZOXCd4wMrSxXooEjICR/lglkbsuQAXP6rsPTgfeeDfEMAFksOy7UmqSm6Vxwq+ATNueEgqCKKwdPqV1U7NV37Zuk4CEZOKXLf7yNhrjP8Eri+IGxFvBNgP9SQwM2tjONodti+bEFKzEyuFDY/ssT5R3qLOqoTEdJqZIIkb+rJ8Lsn/O8ie0MrTleErcgJ3hx7YeW2CAKBEQZ0A+C417BjaSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2906002)(36756003)(6512007)(6666004)(83380400001)(38100700002)(38350700002)(1076003)(6486002)(508600001)(316002)(86362001)(6506007)(6916009)(26005)(52116002)(66556008)(66476007)(66946007)(5660300002)(186003)(8676002)(956004)(8936002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hQdoNOzkH4sYdohx4C9c74jo2+AG5xDMG/qCnS3MB3+GN1nys3a/v9KxFH4ymBmCFNpXRNFd+UPFzfTcxLtzGzLoooCB+BOVqgqWZmn/DmaqlWZGKX88oxvnQa/0cPrHW9DkY8vcqBp4PpohMvrT4gS6AFzrBmj6Zz5pk9hv7KnPZDnkLSUOYrQv+rQban5tDDAGhbw10QzvKfYlXMOg08K5Fk3Kv8OCMiCe4P8Fn11z/Fb+XWl4UZTVEY43v/UND7YCUsPgzQ6BLebDWrjQAJHn73lsWDXRqW6RP9fXEtMA3Vumm8UMqAA/m7Fj+YRBOUsKJxGIzhBESKAwwHD0PUovnQSrJt5sU2EcbsmmfR04JZINmLfbpbC2j3sw4e85ouvyDzArClsmIh2bUx8vNKm/mS9I5UuJh5YJGV+JdlQVPaJ/cq9EBGTrd7ytRkbep4iWC6fe4T/6P6weWdMmupdZ/h1YSefLyXE+vOwChDWtcnICuIb20s2Kh+Zpeguy8hfmotNq7gE46OmVxIMMsU4hZ9hzjrcn7Cnv22Z7uPGgDLwVQyX0giiIBv2iuALyvD7DvAfGm5LwTFh4Is7Pape2kI8KBdqO4En3nTXQEg7GpmznD4gMmEkLXkvVpDM5C48pdX2AqR/uOmrq7D9xIiFrntaT8bskuXhdU2j4XqEKuTC7quY40t4YPlmx9ppknx7irsEIHHTZ/18nBIoMgUzUCqQQbpqhD4Fhf77Hhrc4mFjV9LWgEp784WPlRMA7
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 465b33f6-24fd-4878-476b-08d988cbaa6d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 13:17:36.9997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ms/HmfnHx0wBfil44t9T2AaptnEkdD1rIdQKZqni0dEfORYYqx4m47wsRXZTVqmubDa2UqpYSiTsS1ocNQ+uN8QwVHAUou6EgsoMEhy6cZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2981
Received-SPF: pass client-ip=40.107.4.136;
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

Convert blk_pdiscard, blk_pwrite_compressed, blk_pwrite_zeroes.
These are just wrappers for functions with int64_t argument, so allow
passing int64_t as well. Parameter type becomes wider so all callers
should be OK with it.

Note that requests exceeding INT_MAX are still restricted by
blk_check_byte_request().

Note also that we don't (and are not going to) convert blk_pwrite and
blk_pread: these functions returns number of bytes on success, so to
update them, we should change return type to int64_t as well, which
will lead to investigating and updating all callers which is too much.

So, blk_pread and blk_pwrite remain unchanged.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h |  6 +++---
 block/block-backend.c          | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 398e7abb02..69f5cfb1c5 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -155,7 +155,7 @@ static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
 }
 
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int bytes, BdrvRequestFlags flags);
+                      int64_t bytes, BdrvRequestFlags flags);
 BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                   int bytes, BdrvRequestFlags flags,
                                   BlockCompletionFunc *cb, void *opaque);
@@ -245,10 +245,10 @@ void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                       int64_t bytes, BdrvRequestFlags flags);
 int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
-                          int bytes);
+                          int64_t bytes);
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
                  PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
-int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes);
+int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
                      int64_t pos, int size);
 int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size);
diff --git a/block/block-backend.c b/block/block-backend.c
index 403cecea98..018684a203 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1330,7 +1330,7 @@ typedef struct BlkRwCo {
 } BlkRwCo;
 
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int bytes, BdrvRequestFlags flags)
+                      int64_t bytes, BdrvRequestFlags flags)
 {
     return blk_pwritev_part(blk, offset, bytes, NULL, 0,
                             flags | BDRV_REQ_ZERO_WRITE);
@@ -1637,7 +1637,7 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
     return ret;
 }
 
-int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes)
+int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;
 
@@ -2180,10 +2180,10 @@ int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
 }
 
 int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
-                          int count)
+                          int64_t bytes)
 {
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, count);
-    return blk_pwritev_part(blk, offset, count, &qiov, 0,
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    return blk_pwritev_part(blk, offset, bytes, &qiov, 0,
                             BDRV_REQ_WRITE_COMPRESSED);
 }
 
-- 
2.31.1


