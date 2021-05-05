Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FAB3735E0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:55:04 +0200 (CEST)
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCN5-0002XG-Sv
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIz-0005rm-RZ; Wed, 05 May 2021 03:50:49 -0400
Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109]:41697 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIt-0002WS-Gl; Wed, 05 May 2021 03:50:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNRy5lsdUhHKTosvwW7qaWXFFJtLDgHVSNEWmN1M8pOTgA1p1UJWrG0Q/xtdef7mZqrMytBkR0UmDQilDeckyeBpff82rvq1jxR0JwbQODJ4L74jSpmS5FVZJLUW3KYIZfFToc9bT+8UH4dFe5fMuNquTB51zM/dlCOzYa1Gcd7WjoSYeTZe+gIu+Bp+ztfUvg3A5vtYHcsrQmr5kjIsZBhZtkSVn1tUHVgBqu8Bak/HU5EuP/6w/9D/ZsqxMHjMA+2p5TpiF2fnTDPNKWnXAHNKsn2eYFMLris7vE4IEqzW2KRm3kQTNnL0i9KJQlQoVL60ywo5ztDJPX3SUXAqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AUveZ1e4j04OHAbBzQRo9qu1TofSSHQQAV2vxofMF8=;
 b=JYHOD0M9gj+y4DzThGtYzMTtKfJQaI+Q6QVbkPvgfUTi9rT+T7h9xTTCi6yLJAQ67v6iM0S7o6NIAQAqzRsr7Vm0J+0U3KmKUezcHl5gtqpN8ORp9Lx3pUcCkh5bxgm5826DWIje6tQYT+EZ+opfdyerynSayGIj5jFjqWS+FMIcVeHob3UCOnmeBm6ryZ5lgsMIY/wcu8ONP+OWEZULrdl0XZH12nU3P4S5MaiUWCCHAXJDtuUkvApil+Pvn4LWbxB6mOENJohsFXKgPKMETlpvFxnS4fbtZXSs0Ku+qkDdTdsBLoag07FDJMuGZhXMnWvqLx7FmtBLLBHNaNgncQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AUveZ1e4j04OHAbBzQRo9qu1TofSSHQQAV2vxofMF8=;
 b=VaCBosVJVBNeewzc1EA9c2FSrDJvN2cM6z3IK3Uh8ctCsbSI5feWJHBIMGVYKyCR/RRNGHW9+UZPRZwNXwFCtZ5eVX0vOzA2CGafwoC3JDE9q6pIIvhZriYhMHw69tZ7WjOsfJ7pcQJW77y4fMfgepLsp9ZjuVzxK2Fe0wmWovc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.39; Wed, 5 May
 2021 07:50:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:50:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, vsementsov@virtuozzo.com,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v5 06/11] block: make BlockLimits::max_pwrite_zeroes 64bit
Date: Wed,  5 May 2021 10:49:56 +0300
Message-Id: <20210505075001.45041-7-vsementsov@virtuozzo.com>
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
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:50:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e97348ae-e597-4ea1-d62c-08d90f9a7604
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6839083D1C89844D119B8E8EC1599@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MNTmjNgFHsLBsXUA9NRLKeiqAZ/OR1vwatMhGStojglNRuWVyrPA4ZN4Cevf71ej0zdrpJLg6nwB8nNG7kOHigFc5fD18f5uaiql1NqeIx1ULopcxf/Yer2xDzJkSUYcJ69Tc9widWOPCjv7wajZ47z2MhOPRYv7h4AU4U7DftV5AdafcaMd+VmxHM5FAuGjxHzIlNkaNuS5yaAxp4HLlSPyBMa/hhLyV7pgZNOrGH6gHnlHuLRPaoJP5wLGMEJZJHC2IsV2m5XyoGUqmQ+juY844F8YqoE15NcW6d22UJLNR9LXhQjrZnOqCvYSYa7PhO7A9WnFnptYNwz7OM3hpXm9CyTUjQ73y0qbwRebPYTQo1mo9Ml1p79pRvoho5zgcBzjT5TTofi1TrLrPW1cuORTmeBWt0xnqWnP3ehkv+t/p/eXzxO23be5AduNgOPWdCYKKjwS41IGx4Quc4TGuutBmCXOg1ZUxqC4Ys65tmZwzUKJWvy3AEahskCrE51ocGW8yuCH/epJXFs6OVwvh5pxOSVR+FgaarFWmZ8ritJhlQ8iVz3CF/eZ/a0N9Q/DRGi/kn8LbUPLoklxa9vp9Ql7sTCB3HslZIHnFweCCSeZILm0tQdWIlyA81a9laZzKTBNvztmrXTLWyQCijbEPHFGOsKsAie8Ffz892pvJ5+CdX41CZzU6xuP4gwMLPAb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(366004)(136003)(38350700002)(38100700002)(66946007)(26005)(66556008)(6506007)(66476007)(86362001)(16526019)(83380400001)(6666004)(6916009)(4326008)(36756003)(478600001)(316002)(8676002)(6512007)(2616005)(2906002)(186003)(52116002)(956004)(6486002)(8936002)(5660300002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Z4JPKApscmte0Vdmb5QdlqlNqsV99gWWXNXqlcGh66SjmR9xzG50ktoXiKbC?=
 =?us-ascii?Q?6g0gY33aUHDUUS9bjiEEI3J6Tv3KV1wBQ52RYVeu9kTAk17oE85WcvoSrzTv?=
 =?us-ascii?Q?IUGIO89aqsFjrNL18NVUBPbWNpIh3pzhGNu8d7EtXLqBi4I5r8TsIWfMHfjD?=
 =?us-ascii?Q?+Z9u4WxfLo5ZT3WqWQtTyCYWH8dZnlliJwZuzjXhr4YqHMCrub6lwYjb9Ws6?=
 =?us-ascii?Q?FfzCU3JHtSYcz11PQ4VuCqC2lBvh23cOtiurZEDj3s9qxB3RCOeawxlTyEA9?=
 =?us-ascii?Q?nx5bIK4KbtM3Y/EmVZr0Wmm6bkLBDWHa/O+zKEaW21laIOuDmbp1ufgkOn+t?=
 =?us-ascii?Q?92uOtioAWLAi4bfwyuo8TH6anOIGc/6nh+4AszQEde44g/KAX7DBVVvrt/dZ?=
 =?us-ascii?Q?YiRwttX/Xv5OPtPrYRUOhPOkv0PPir8A1SZ3EGxIPOPuxoN1Zw8Js0J8ctU+?=
 =?us-ascii?Q?QizjQ9ww4rHdASEDLfBEe5vLtryNQhRySPDYl8qssHJxG/og6lY3k0Pkb+YG?=
 =?us-ascii?Q?NmiZfEgZ7RFnVT/XItBicGIPdnmR2NOOsjhufF66LPseXBuq0o21o7ObDFxN?=
 =?us-ascii?Q?Ak7LVCDFYuTqQd2XPAynly1Sd9WzXip2otDMEbI622XoueW9RsOm3k09gnLD?=
 =?us-ascii?Q?Az1IlbZxnq1NXTPGktiehoB8p5eyDGwuEGZ1NSXJvWzK7qvxamalhR1GzQLN?=
 =?us-ascii?Q?tHULJhBTQTaaccMRbPghCtG6tTsrrCJETXPCgySYTye6IkBUJOMnnd1FoEM4?=
 =?us-ascii?Q?mjjX+GT6WK3FfsGTDYiMh3S5RjIq/Ym39DBOf1sKYf4OqNIG0BBwGGji5Zvg?=
 =?us-ascii?Q?S0C4ItlnHpZPlKKnsn3BpFMHuZMkycdehm67748hZoXQlB/25TsgBPuJWA57?=
 =?us-ascii?Q?iCcaEl/zkGc6FWPkzjHxI2sorGsvsTAUN9i3ocoB4TNJvhkm02eIYI438l9B?=
 =?us-ascii?Q?ZmlfyWpQEsHb1jBUHwRUhgsGoy6FbKwp+zS52SWQ7t5WTLYg9iJhfv48pOcn?=
 =?us-ascii?Q?LXOKaDH5DSABZf1X/4o1EyZaKLj1bXQoBnaeO7mn6daJ2zSZq1WQsDpEZ4Ng?=
 =?us-ascii?Q?N0rTeiFSfbDV4RgYY4li23tWu50MzTl//Q2pNMhXKq0F+xJeA2BT2xI83Ak6?=
 =?us-ascii?Q?zNjzBFWsCmUPPo8SVjcCtiJqBBhTuvP17NkYKjd5lXuMIoZnVIocXxkVDinZ?=
 =?us-ascii?Q?CKn5GLwtkuSTVr30rTPxJ95jjCBYF7gNeyzZRpHo1y8loA+O2Xaa01qQuYvH?=
 =?us-ascii?Q?GPXFKRw6cMK+VOjpbZavISJMfeBN2GyDYRGwlwzEjoUjAEXsamf0HlEXjHhX?=
 =?us-ascii?Q?M6ogsCzDlJnTzT3oWERuGsi2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97348ae-e597-4ea1-d62c-08d90f9a7604
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:50:33.1155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aki4G2AcaPh777K26UIwrSJz5wqdObB3Uroaiq9M6XOa+cM6+lj8aGXHuzYAS0gRAu2ET16TkeanN0JpoyeDNULkTzPj3LEcfGvpr+I7SMA=
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

We are going to support 64 bit write-zeroes requests. Now update the
limit variable. It's absolutely safe. The variable is set in some
drivers, and used in bdrv_co_do_pwrite_zeroes().

Update also max_write_zeroes variable in bdrv_co_do_pwrite_zeroes(), so
that bdrv_co_do_pwrite_zeroes() is now prepared to 64bit requests. The
remaining logic including num, offset and bytes variables is already
supporting 64bit requests.

So the only thing that prevents 64 bit requests is limiting
max_write_zeroes variable to INT_MAX in bdrv_co_do_pwrite_zeroes().
We'll drop this limitation after updating all block drivers.

Ah, we also have bdrv_check_request32() in bdrv_co_pwritev_part(). It
will be modified to do bdrv_check_request() for write-zeroes path.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 9 +++++----
 block/io.c                | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index b614db5cf9..1f93a38a23 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -676,10 +676,11 @@ typedef struct BlockLimits {
      * that is set. May be 0 if bl.request_alignment is good enough */
     uint32_t pdiscard_alignment;
 
-    /* Maximum number of bytes that can zeroized at once (since it is
-     * signed, it must be < 2G, if set). Must be multiple of
-     * pwrite_zeroes_alignment. May be 0 if no inherent 32-bit limit */
-    int32_t max_pwrite_zeroes;
+    /*
+     * Maximum number of bytes that can zeroized at once. Must be multiple of
+     * pwrite_zeroes_alignment. May be 0 if no inherent 64-bit limit.
+     */
+    int64_t max_pwrite_zeroes;
 
     /* Optimal alignment for write zeroes requests in bytes. A power
      * of 2 is best but not mandatory.  Must be a multiple of
diff --git a/block/io.c b/block/io.c
index 448251beaa..0648561b15 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1863,7 +1863,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int head = 0;
     int tail = 0;
 
-    int max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
+    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
     int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
                         bs->bl.request_alignment);
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer, MAX_BOUNCE_BUFFER);
-- 
2.29.2


