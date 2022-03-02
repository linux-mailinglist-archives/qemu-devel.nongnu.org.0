Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E301B4CAA20
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:27:39 +0100 (CET)
Received: from localhost ([::1]:58304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRpC-0006gi-VM
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:27:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPRmi-0003np-6a; Wed, 02 Mar 2022 11:25:04 -0500
Received: from [2a01:111:f400:fe1f::70e] (port=25703
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPRmg-0007jt-J6; Wed, 02 Mar 2022 11:25:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNmqMwBsnHNgSZY3tY/i7Uj6zhu6ysTY/mmK+cD3zCoeD/pHseVpSgvuOFKsxCUiXdxfYOXNBoVwJR2aqPRHcKtlbB298/NLr1jwCFpOYeAY1zHGL0tecoxJQ7IsplCdrQeTBqpVynulwVPfKN3teId0S+/hdgWui1NKeCAQbxYpMI0OwGOFY9NmmMunDenrs55tOMCzd6lZaqI7nV1oim8AUjsZPpmyHiBltnkC05G/bQAgnCXWiq7KDzsXnaRiLk0jFmaz6ApUJBhSNZKWCCb+D1/v8KnmnovyPVRg0P4OT9NJ8jIyR/auyVbfYi0xYd+6VW0ppb6QKYSZfez7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA/MsKR4rymW0A/gq5E0zSziC2COtExe8DXeN45nriE=;
 b=IyJzbeCj8dNnDxu9kHsAQ/SfzaG4hNT/KF/ts+DQeQBS9um0l09rze7nwOrHhkJP7R9iUH/7lvPZToyB21BocX6ysK4vX9fOVMcOoAFRrvsgT98kTpI8N54ldhLDrnJy6yqZvquq3NpUFrG3IhcPl1gYooHHCwnCaM/VyKNmI9ixyRwo5X2QpSzPO8qNzBLNlWlutFY5lvivBkrwvQBEjWDEBRTHL7oxAI/8sKBJv2kIv851vvtmlL8xX37q2ZWJpvFzCmMKu28E8WfyUq7bAertCuMp65dZ4E6sBhNE3ge4cGLBxzH0Bn1vekpf6o7espbSDyHm0e7fHW5jDC+S4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA/MsKR4rymW0A/gq5E0zSziC2COtExe8DXeN45nriE=;
 b=e0b5qtTbdfu3h1+aKYy6fGw3AWw3G4jpkhs2PvLEx0odQ0feXWkAEew5XaC685VGDVU3QZ546urzs3uiRALlLs7iQC8cPxaqJfjt2aXhiryX2gJTxx8nSaQYkv6gIxysrcmsqS5Un5qgg1lFeTwicVl7gahYSKVn7DmzfLa0HW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM6PR08MB3768.eurprd08.prod.outlook.com (2603:10a6:20b:90::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 16:24:59 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 16:24:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 stefanha@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 2/4] block/block-copy: block_copy(): add timeout_ns parameter
Date: Wed,  2 Mar 2022 17:24:40 +0100
Message-Id: <20220302162442.2052461-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220302162442.2052461-1-vsementsov@virtuozzo.com>
References: <20220302162442.2052461-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0064.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::15) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 182dc62f-bbd9-4e20-e0e8-08d9fc69322f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3768:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB3768EEE049CD18D20B2849ECC1039@AM6PR08MB3768.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gy7e9WYKet3C2qkM+MiSVp0nsfFW9U7qw5gcxh8j3Agu9mI0pbYvG+2OuRmSAYkTIYWhe+GL4lRLzRAbF08B7wmOpcnhvb3bwpFe3KaIJ1uTvhpsL7eNODSltLlhfBoDTFQC1jNLcLbpRln8prEbdAzkTSuPw0NPkjn+JH82LKw9bGWDO6j/VPw8ydcShn5Re8hpHM3o5ckUKo80zVoA6mtvdyebh17uMrQcUg7e1jDEhqxeojLH/S5d3jmCSEZZs6D+jit6RZU6mo59XkAlXwsHzAVCFvfX93e+1L9s9PrElIIndQGEQ3xTzKjm5tsNMT4kcbIGkz/8Y7mrbOzZLlzlz8X1TOXkZMsjJCNgMag0KHJFUjS2X3m3q1tw+1pxaB4DN2xE3cst3JZBZHLaSgn/bTUVacgdRxt/KjUh2a6/nPkM5YLoXObUi6pzVztBQ9yVq8Pg8T9/xG9yqR1O98TFEg6nzW8Dcblxnn17PYPzLZmAllFvb33LIlqt4Wcmx8pNU5fMHe4fNk3exbDXPMrGQGLJWWvEfIpxbaz+U/LmDQhmX+o9zAKYi5Y4uxvm0/m7dfI5u1d5S4W59ULn2aBPxANeze+077kZXXFz5Be3NEwrB05qLXzPy1LQbweSiyELO96nm6qf98jJL9PNFI5ChBNRhplFxvxDcCw/C/+JsDueRm7d+tJD1zdrobLQCLpaIeEm2JAP2+3DrEirwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(2616005)(36756003)(8936002)(6512007)(38350700002)(1076003)(316002)(6666004)(6506007)(66556008)(8676002)(5660300002)(66946007)(2906002)(66476007)(52116002)(4326008)(38100700002)(508600001)(86362001)(6486002)(83380400001)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pB3ediXIhulBMvL85Y08NvsynlCarG1Zdnavj8NDjigNJwkb1dMUlkNBhjYR?=
 =?us-ascii?Q?utWRTnMXhZ0vZzHjLLN/XpsrzHo7/MzmhDgcQFhh8AJIjz2mezdP5kO7ORHW?=
 =?us-ascii?Q?dpmzgRn4qahCW2768d8cgV7Z1QLfwah1d96dLACVIgcQV59Y7ust8bfpJBVw?=
 =?us-ascii?Q?LU6xOF3dcx/yyVrbwDEY/XCbQhq0C8MZITeoNqedW7Pk3fk+MJv3t1kiiGNZ?=
 =?us-ascii?Q?A8P1OOU3KQbBEiona6q8MILlAIeD2n8Rm524N1uEeQ5Cr0t/q2eBQFyybLe2?=
 =?us-ascii?Q?TvbOgbpK1KRPetVRriiYuSso75ekGHRrGFPVYDNM3fVmecbYuj6Zx7b+EQuG?=
 =?us-ascii?Q?Y+l3OAyVnJc6WYRjEkEzfApzY/11OkKV/xy2MxE4Dur3b0AbazNYNQE5tdkX?=
 =?us-ascii?Q?OMeJ4neeqQ+C6XwZPgrNuACvP+DxFVgfARTfxccFNUy3y+8qX8U4/I7J+wcO?=
 =?us-ascii?Q?SKgW6vpvDHzzBqf5WWGbaq05LXtPCoy2xGdA8OYSwWyJIkgKOIRUE1OWKc4B?=
 =?us-ascii?Q?O4N8OBInejkuqEMQ8zoCvUX4isAoje9B54MrB7DnhpqTEivXesgL0bU5HNP4?=
 =?us-ascii?Q?BTMcCNTTZgSNlNsvQ4EO6ocpdlln1pwEDehbGJWL3aAU319RbAzWx9DJE378?=
 =?us-ascii?Q?o3952s92obB8kyug5csT0v4d7uYpFVxy6SK3CMR5/JUxMRaHGJVUEv/njD0d?=
 =?us-ascii?Q?lezDi6V9P+m+nvRw1WUK6PV2nPrez8zBl8wB+kZAssvuBXZyFY43ud9wJOZw?=
 =?us-ascii?Q?+/pOn+d1LZsnD2uxaHEmEkE03bY6OwJQ1dGiwyTMkqLTOR3k4lEtz9kHDInM?=
 =?us-ascii?Q?QvyshqTMmP0xjQhG2RnRxsQ0mRWR7PM8VbvTn3+PQyYc3nITqFmd95EJRkkw?=
 =?us-ascii?Q?Gz/Mi2smQk4ZebD1KhTgLFNlT55VvuGLaEmXKqX7kPVVFt/ViRwSdqDjKQ9O?=
 =?us-ascii?Q?E/eMzGtOTy6I3H/db7HUAx6l0LqFs8WKjrTaHTeo8iMiylq9KdCXww9msAFL?=
 =?us-ascii?Q?DIAYokh13B9sbcds8ppT99sZS5FnLjDB7Z6ko6MDHStPuaKbuF4OmbYNBMFQ?=
 =?us-ascii?Q?9X872derOoxnojt02G55vCrwKpyEmKrobB3jquFeTDjH5+L+7o8qi1LJkSm1?=
 =?us-ascii?Q?S+X3kZTLkarLcGDUgyhJiDcEM+lhDrThI/kPnGOHK2aJjd0vI8f7InaanwTE?=
 =?us-ascii?Q?uteI2drSEXhNPhlGRRDPNPD1u+bnpL3vkMjlhmHa5svfT2SlloPPpU7mhIyg?=
 =?us-ascii?Q?gmf9C3Tb6K2sldH2P7HDVh3uL1ERZZnKZxkaKTm2nqu8H72pMCvtUSXXyNr3?=
 =?us-ascii?Q?ZOLC7pOqYWMNaNtpM8AU423SoMyqSeALSwD2/qb/ha9ZNpbWFgP07TPO1/sd?=
 =?us-ascii?Q?sFZ0VbdUanhfBjr6aFkfmCSx1IjMSgYdJVPfabbnUfwi/seLM79SZJ/BR22y?=
 =?us-ascii?Q?zFJxdikqhjUbZHhxQvSfdQ2k2HRVJ0VWPCxEYSIKKWSZ2399fnFzaYUoTB01?=
 =?us-ascii?Q?Px3P/c1Fd8+psmzoMS3ndpcW+0WNvab2ETcEfpySRc4yuJSneeNsx9Z//GZl?=
 =?us-ascii?Q?cX/bcTpvnorsZH2zCFMWuR/LjRG8Ad9TjQ9TZRnnVZBsQSYDpYSAFjB24ZJB?=
 =?us-ascii?Q?NUy2Bxqje0CIkjjSxxi9W3ZPaEWcNyBH8F7qsRO87NL0cNYCicqHwHcoubJn?=
 =?us-ascii?Q?mw5sTg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182dc62f-bbd9-4e20-e0e8-08d9fc69322f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 16:24:59.4949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xcIeuilRUyhlm0I016NiES+Qb+j9sWO1U+tL3uSJexzXrDkJ8l7ingI9YdAJhj73jRjyWe6zBHhudSrUKwqYY692NNkzLEER8A5a2YHY6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3768
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe1f::70e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe1f::70e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Add possibility to limit block_copy() call in time. To be used in the
next commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h |  2 +-
 block/block-copy.c         | 28 ++++++++++++++++++++--------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 68bbd344b2..1c9616cdee 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -40,7 +40,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
-                            bool ignore_ratelimit);
+                            bool ignore_ratelimit, uint64_t timeout_ns);
 
 /*
  * Run block-copy in a coroutine, create corresponding BlockCopyCallState
diff --git a/block/block-copy.c b/block/block-copy.c
index ef948dccec..e0f07e64ee 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -882,10 +882,18 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
     return ret;
 }
 
-int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
-                            bool ignore_ratelimit)
+static void coroutine_fn block_copy_async_co_entry(void *opaque)
 {
-    BlockCopyCallState call_state = {
+    block_copy_common(opaque);
+}
+
+int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
+                            bool ignore_ratelimit, uint64_t timeout_ns)
+{
+    int ret;
+    BlockCopyCallState *call_state = g_new(BlockCopyCallState, 1);
+
+    *call_state = (BlockCopyCallState) {
         .s = s,
         .offset = start,
         .bytes = bytes,
@@ -893,12 +901,16 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
         .max_workers = BLOCK_COPY_MAX_WORKERS,
     };
 
-    return block_copy_common(&call_state);
-}
+    ret = qemu_co_timeout(block_copy_async_co_entry, call_state, timeout_ns,
+                          g_free);
+    if (ret < 0) {
+        /* Timeout. call_state will be freed by running coroutine. */
+        return ret;
+    }
 
-static void coroutine_fn block_copy_async_co_entry(void *opaque)
-{
-    block_copy_common(opaque);
+    ret = call_state->ret;
+
+    return ret;
 }
 
 BlockCopyCallState *block_copy_async(BlockCopyState *s,
-- 
2.31.1


