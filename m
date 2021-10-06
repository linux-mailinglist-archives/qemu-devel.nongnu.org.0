Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5D5423E8C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:20:18 +0200 (CEST)
Received: from localhost ([::1]:46124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6qH-0007cv-0X
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nq-0004mY-N5; Wed, 06 Oct 2021 09:17:46 -0400
Received: from mail-eopbgr40136.outbound.protection.outlook.com
 ([40.107.4.136]:14496 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nl-0004IV-Om; Wed, 06 Oct 2021 09:17:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5lCTDbmfeDGi7bl1p0f1sCCMkZTCxPX5dV3SZYBSkgu/2pEcsqu7KGvfjxWVgQeB8A0LeGgwmdSvEPfLTVAwAR4lez/Gr6RzZhE67x5m+IAQmN9k+sShSs5ZOp8/KGrCCIyI2hge43WM7DwFqbPVGhfBk5tgnSQKR7ShZJWZcPVMWbxIe5otsSVofxa9Q7FYlFPSER1asjTx8GNQqKBZH+HD15FsU0JRZSR0NoQgPYkNCFddqyuTYuuOl5QTY5zOa3P3l8F+Qh3GmApn1U6Z0CB6Gfkc7VMztlsmApF56pMnBVNgPVt/8Kaf37DXl1W8WMeN8EsIroLz7XZudeHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgF5mv0hRlaUzAf/93fFHgtcIH3OqJwxJUgquLAk6aE=;
 b=KvCpbcxp6un0G+LnhnO9y2pdWJ6FdXJ3yvqpPANJ/KNMTPcvE8QfLKZreaGTZOZ3JL9Pds/1OmOv3Rp4o0jS6L3OCXL2bhwLsulfv2McZOOwx4Mk51/TqqMtomKltksVHqIQJmaD0NT4do5yqj3+3dtjlrEsvuOQy7OyQfLS26fFHhSdT8QsXcamX1cNktR6iBhzTIDG1Wo75snufC1reCKxPx3EpEq2Jj6nDhIKPlw615TvTk/uDtSjlatouo76aguHOhO9vYKe82Q4AYxRW++QBmJx11781+WPdEKSlMb/6v0iO4E6OtFLNikAoNHalcH1BARUXaQtEAwPUdfg5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgF5mv0hRlaUzAf/93fFHgtcIH3OqJwxJUgquLAk6aE=;
 b=ZiOqi5NThXh0hkVxMYa3hmODR7MbFXrGrcXSI5IxrI1OICGDWZosXIJSWijhZMo25ICo7gMEciqvEZ2SEWh6HlktxJ8XJjmpNziMAslzXARAYC1BVEculeP2tLKlAD+13MMCEt+GstW2CyHkqfOnkyb3j7Kwgf97tqZM2wrZpR4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 13:17:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 13:17:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 01/12] block-backend: blk_check_byte_request(): int64_t bytes
Date: Wed,  6 Oct 2021 15:17:07 +0200
Message-Id: <20211006131718.214235-2-vsementsov@virtuozzo.com>
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
 Transport; Wed, 6 Oct 2021 13:17:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dd35e13-3586-4284-fd73-08d988cba7c9
X-MS-TrafficTypeDiagnostic: AM6PR08MB2981:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB29813669E102C1215EA1F4B7C1B09@AM6PR08MB2981.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2qPEwpumZp7W41vot436xhfOpNzw7+wYJH9IvyPz1mFi1aGGsKy/m2G/HBJDpGdCNttBW14V2WIZyN/MQCuzo/2pNZHtLa6rbhKxRCwqV64x1azli642LpE3pwI5jJRdjIcI5EqUu7JGLlpnVm1LSO4zWoRkgcH8rnzjFpcCW/IapgtWUOGqShJvV0Nq2K66n03x4bx89PCSYPDH6f8R9flUiqNJda2Cx373+TLU2PhZ/pM5h3Vme1Cyn0qpEb1R8ELcYaoOy8s9wHoBdTprpLI4VQcjCPrj/DGWg8Aa8iS7V81q6IeuHv3kUdBvrdyJJVG+L2g2AP2m2FDGZSLuveDplAe8nRj6C1IXWxYDUPTGx1/qoArVzRCZkd8Yj/AcWXq8gv5vlT/e3XovemjVlANZLIqfkKSi5qf439KBgLW4A8zz5FHTNEXiQv+ap3P9hu3HebOdZnGhNviKac8pSoA+4VhhS44ZuSNTKOfnQW6Wg2jMGjV4nrhbejI148HWa6/Js5j6Rbx7A09D9v+eUv41VXh7BYKlrsTdVOtiyXtYAvhr2sHBWUZ6X7iDu/hl/5p+VY8g3wMsgMHeg8QHcXMfe4aiw1RS1pAGyjsRxUuI8mMyIiTcbN8g8qh3tHUySpR+m1o1/CimlXURDblsEkbuWFurfGMHuirweBXsa2TPEotI2M3NURyMBQm5zgK9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2906002)(36756003)(6512007)(6666004)(83380400001)(38100700002)(38350700002)(1076003)(6486002)(508600001)(316002)(86362001)(6506007)(6916009)(26005)(52116002)(66556008)(66476007)(66946007)(5660300002)(186003)(8676002)(956004)(8936002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pez94vBXlisOZF0hWgsRIlN0TxE1l5XBuYz0TTSfiVyX6SrVd3uhwD0v+xNMLKIHkOC08OJ9ypnkHwMi3o935xPDeyIKQgWawpg2nFiE15JLg+W+MaVB3TY6L6VGRbb1ffTFaNJHuSJZRPFMoYQMRyHOyZhTUgRRrZ30W4TLJXgY5WMh+86TWF4ntzgON2n7E9H2XeJPGOiHlN3zc6CNQGzd3gNrgCg/Nv6SRqTAyRzeKrWatrMfmoyBk+CqEjAdet+YImGr2lNVWcX0ApHC8qofLIEmwgpsvd5zgCqRc3qnFhY+nm74tjOYEYXh1jujQf5Xh8O5p43wnOT32fBb756kD7imyOCfALQdFTMakUaCjas17s/76+CGbgoDDs1R2RfF3gzu7scapJppsAYhC0dkCwAK/lNlbEStTdBxHqaRMWv8ylT9r+TLhJVx+bcmZn+qeXHORwF/ZFbWp5i3DO+FGNq2IK59N/9MsDH+VC29PMH4+R5cLU8Mqfph/BODQ/OcOdPUiFpFF2f6Y64boNU30h7G1p//MLQpU6VwSYKlK3cpDyd1euLn3+TZTXFlnc29x7/bmZWFdq+i46EHynVzg0UiQw/T3Biww3PAX+HPoE1cRK+2SO63wIg2Q7jaW9aO0luRxBGQZ68trETYHtVCfTKNnRaJ0Gd6XqUaGlP/ocVAmojJUV5YfRjBuVR1N+fcf7B/m0ZN6MtPmzP2bNnDrlp49wdK1xqXwTgWFxlPauBbF3ho3a0Xybwyk9NK
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd35e13-3586-4284-fd73-08d988cba7c9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 13:17:32.6766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkxRUGNXcXsFBxSv5o/YahmZd/byD8/JNlAtPrCawDHxtiqHFCjEsyL45W3gQzM/9KPuUiNKj6V57XQDb9CvM7LGF1W3qs6NCSDfIZQdq8c=
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Rename size and make it int64_t to correspond to modern block layer,
which always uses int64_t for offset and bytes (not in blk layer yet,
which is a task for following commits).

All callers pass int or unsigned int.

So, for bytes in [0, INT_MAX] nothing is changed, for negative bytes we
now fail on "bytes < 0" check instead of "bytes > INT_MAX" check.

Note, that blk_check_byte_request() still doesn't allow requests
exceeding INT_MAX.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-backend.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 6140d133e2..d121ca3868 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1161,11 +1161,11 @@ void blk_set_disable_request_queuing(BlockBackend *blk, bool disable)
 }
 
 static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
-                                  size_t size)
+                                  int64_t bytes)
 {
     int64_t len;
 
-    if (size > INT_MAX) {
+    if (bytes < 0 || bytes > INT_MAX) {
         return -EIO;
     }
 
@@ -1183,7 +1183,7 @@ static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
             return len;
         }
 
-        if (offset > len || len - offset < size) {
+        if (offset > len || len - offset < bytes) {
             return -EIO;
         }
     }
-- 
2.31.1


