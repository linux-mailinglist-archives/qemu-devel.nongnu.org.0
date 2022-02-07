Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC474AC78A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:32:11 +0100 (CET)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7s0-0001zE-RD
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:32:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71T-0001mA-76; Mon, 07 Feb 2022 11:37:51 -0500
Received: from [2a01:111:f400:7e1b::708] (port=37729
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71R-0005HI-01; Mon, 07 Feb 2022 11:37:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnzdDe8qoIC9Et1m4XnrnrQ56BZK8ZyGAItfQXJ2MNwgTJWzBDrT7Z17fdsVFZDYcudpF4idbtyVN2zzJRzGwEZZPh9iPze/EV1rJ6YG0Ugpvuht6Rg0We1lT/o4EAZNs2bO3WfvRRgJu/swBN/NB2mj4c8It1TRromBk55an/ueJaBl1CaMbj9XCtKllgLCXY+sGjyxtQ9aIfv7UlIEh2OWkKBA+dbjh0+nDl+Io3DnyheGXL1i7cOThQ1t7Lx+49k5O5BiWnmZ9eQqzk1GZryIQeayS4TfJgbdyr+67CnLTRQqxcvBjfJj4NAawgGSIVg4flpE6Po3pzcqe8ho8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7GFdhK9WnFzKeTGkO6aPU0eFbuWIrLwLe2fmSJOgXY=;
 b=et9p7xv82GBpnfeaBOs+peKBnPBlg0IFgYMRsORq7z+eFNxO+nYtFlXcUiObFcLnWj8d7iCTG6asOzUxHNvNcDUKfmaC5MV0K50oDp7tTubqKT2i6L/h7Y6diucwHsybOGC8L+yGOEZ8QU54tDmRt8c36l5hJud35eORRWvpzVR65fNx9H4AaEvBKsHlgR56E4SzHJ6ceprb3zTBEx23ggI+Wly+TWXVPiKFyQJ9rJXD9JjtoIPUqdpsMVvTq9fG+j89bBaJlooCHn+qqhYAdE5HEoNfjhJAEeJDTZvelxocWAIb9vqk9zzLHj0mSg5B9OYSy7uglW6xcZzKkPropA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7GFdhK9WnFzKeTGkO6aPU0eFbuWIrLwLe2fmSJOgXY=;
 b=P8FTCcfd+C+d6437sHuvWQcJvkWh56RkQRgoUo8SzLSRP3Q+VFYxUeI9PBUnamti6RsDEOhQchcdQWTP44SmFMDlhFTTUXCAHqgu280mIPm1GslGtaD1/m++5N1E85qCJrFYuxjm4AxwWH4jxaNC8h1+nHlMkb1J7dqD784KmF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 16:37:40 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 04/14] block: add bdrv_try_set_aio_context_tran transaction
 action
Date: Mon,  7 Feb 2022 17:37:18 +0100
Message-Id: <20220207163728.30362-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220207163728.30362-1-vsementsov@virtuozzo.com>
References: <20220207163728.30362-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b1f7695-2840-4329-f471-08d9ea5827da
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB228871D1A64DCE9D0F310E89C12C9@VI1PR0802MB2288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:14;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B9mpEobuZjif9iXzTtc6Lh7ND8+8FIaMgJ9ljyZ0f42559Lcew8eZUC0btaMuoLYsnnt43yxlrtcFtfxG8RmaEVU0JcMt2+8IJGsEJotHRzj5iqwOzkhaOpPDdp3bbl3jHBKPxphRe+uP0RPhcGVRqtJ1CiihxYTJ1tm50Q/TRPX9cd2WXzB2PobP5mgyXc8h2DyhJVxeCeuAYyEQzNMUzPKDGEjrMNIH+MB8uPCza9cT+beAwK9DYXXErYTbQJebaBr0J3LzkgRAXuPKqg/xYnXXB1j2q/RJ6hye4JblSfKsycOwLb2W17ncwJMx2OJJKxTCiEMgNqC3lN6mgdH50aNAWr9EIhZZaDFIUcsUBu9yNDdhM3lsIwz+h+169yh1P3IWgyxnhC2/dgtmVnBt4G2NRJ0BXdUbeCOEEpy4YkkNxJ/SSTQZkGX/RF9TGWwTPCrTDdgwy06IpCbqo2Y619OP/lkCDj2Z6QgufkK/yD1eSsOWrsfFwRyFXSfsYb3CwJ4Qlzr1WicfiFYYXI2ve8N4z28tuTYTLLYblIcvPB9uQRFg1eB41x3OIMSYeUMh8zO1ECrKSsFl182kLNCvxJCBhpGR7jlmNOYHuohGHzHIp1dHpZjgy9zY3/JmKtzJjU0C1OGqROV6QPZLUxXS1Rai2ezTAyIQhLc5fHrV3n2Sqk26VgWoOmF/QTHDvyy7DvlQHPuahjU497h85xjWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66946007)(66556008)(8936002)(8676002)(38100700002)(83380400001)(66476007)(5660300002)(6916009)(4326008)(2906002)(508600001)(26005)(1076003)(186003)(86362001)(6486002)(38350700002)(2616005)(107886003)(6512007)(6506007)(6666004)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kny8ZL1UyAsR7Y21+34fncLDnw4oE9Qg435xOnPZd1tX9NdLQp/qRVArVuHR?=
 =?us-ascii?Q?rDpRB6OWtysUChkF5Rmusgh0woH6+M/ddjDWPTBoIXt8vGljwBT30d/Bp6Id?=
 =?us-ascii?Q?cyGEUDE7Ia1iX8JtryoqjEqbWZehmamn4ebh2TztN7jrgj4AjouFrNRPzVZo?=
 =?us-ascii?Q?4GiKNTWmZpA/tfDq8VjvTY921/u/Ny2x2i8VUaa13FyhRRdNeB7AgTqa/6md?=
 =?us-ascii?Q?3ln5wo19MNVp7ksKlX/JjDOftLf6ekk7shTr/1nRgywYD5Ih5I8gsOVghPc+?=
 =?us-ascii?Q?QWQt+Ya4ZeU+vYgkKeri8K6qgSSE+nj4PVaBlHOO95qfaqt/eeswRZGUHC6f?=
 =?us-ascii?Q?JkzhPpWqLNZ66YQhUr6uiXVn/qvXEObU+ghWx9BoJahovJoZ/gDJf75CA0Zx?=
 =?us-ascii?Q?9oNUtwK/KJ00E9ErhV2cYI1dy8QrHk4zsIIyMqGPSCH/hsUQy9zneyzuvL00?=
 =?us-ascii?Q?tB2VhSs0k5d+W2/0vWeYeGhH63irGPsMUEVxaEikiwgr9r8jJiBYyJR7wqoY?=
 =?us-ascii?Q?fxEPwbAtBhJChUAV+PMu+6mpdMe3JCk+qB5RN4kUIWXGXgHKCMKCtzbRfY18?=
 =?us-ascii?Q?A05T0stdZGaI6TZvrpYg8tTU8z6PDho8v3VxDaV5RfTSi70EQ4r/gPDazVWJ?=
 =?us-ascii?Q?qOomRIpIyqDDD7LZZtpfa2Vq/bhnosWh6pZpDdvQDfD0z7S17QA28qQGeajK?=
 =?us-ascii?Q?hjvtLQ46bWLeXGoga76gCJkj3Jeim5ftGKyYckFrcj3A1BnMGtQxBfiyouc7?=
 =?us-ascii?Q?gjLoeR8VNfJKU6G0dBwyzFB7w/u2sCje11pocYtNu3OQR0TAfCea2GAQTqe4?=
 =?us-ascii?Q?Z/shtpE51zeam3NqPUi8QErRpKLRMI8ewmESD9/gI0hcatynoZ/VsQoDv51B?=
 =?us-ascii?Q?qyW21sNiEl7GfmVA6/69KJw2Da9sB8ScKQX9093SYhC9XbfCM027yYE1Pr/e?=
 =?us-ascii?Q?u5o4hhPJbzw3jI+U5NmHz4HYFFXLhygR3lERO22PANtngmlc5tS0KBviFeas?=
 =?us-ascii?Q?NfSBxx3fWnOZPpqoJs7YZwpWWs+Jn5dHJb6GQQJZVhVNsEZUlPneMtpfwGLx?=
 =?us-ascii?Q?ryvcHUZCACK/Ails1qSK7MIviN3KLsGKOSYOETKcNAK7UDTVRAxXVYshQVd8?=
 =?us-ascii?Q?XjgsuCtidWtzqu9mv2k07l6HDcHvx8WueYN97aod8duAS7I1iJ1sFnyANZCm?=
 =?us-ascii?Q?gT9LqxCInolqOifA28vpxjndv8loTJse+H7eilWaGNUrBPnqb6mqG5hyhpAv?=
 =?us-ascii?Q?r3CRR+Ai9/0UtY42zofJeLkjPCYMl/Dyvy0F5zDIegokctDOi7/ijHHJkOIO?=
 =?us-ascii?Q?hzPCQlMEuuP5SLbu07k/1oGPe/NUzX5q9xudf93Cb7E9RsWfTAuJWW5/OZ5x?=
 =?us-ascii?Q?Ju/KVvedrKo/LHs3nV+HeHj4uX30D2I6+la4SHqNrcE4fs3YMlHzVqIe2vKq?=
 =?us-ascii?Q?E6tPOFSstTrnnHfSB6BQx3hFMDHGe1FhekYkWiw6vyOTNjTtJiloq3AKUvei?=
 =?us-ascii?Q?COBX/jEY1J1QNutAyfgmuENhxYUacX6u3XZqsTZ9PVNu6/jjPmOPtOzczMpC?=
 =?us-ascii?Q?JJsjyYoM92wc6uB5C79Wj71kas1QyCz/cYJdv6OlBFJm3RXs42Sfv70qpFsT?=
 =?us-ascii?Q?g6fY6LqMRQhUYc0VzWmNpA4yCOmXt+ypOiU4LyF+7Y+TJFM+/A/PCrNYJexW?=
 =?us-ascii?Q?kuIp8A=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1f7695-2840-4329-f471-08d9ea5827da
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:39.7880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0gYkYvSFGd/qBG0yjOoS/qq96hpD6kN0/3fuZf5s7IvWn0vZ2Gjg7PLqwsEg77glpm+O+htXdf3EMcz75qhGzSCQ7OmsVKW/ThiYDoWBHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::708
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::708;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

To be used in further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/block.c b/block.c
index 7b65c7c5c0..82fbf81a3c 100644
--- a/block.c
+++ b/block.c
@@ -2791,6 +2791,54 @@ static void bdrv_child_free(BdrvChild *child)
     g_free(child);
 }
 
+typedef struct BdrvTrySetAioContextState {
+    BlockDriverState *bs;
+    AioContext *old_ctx;
+} BdrvTrySetAioContextState;
+
+static void bdrv_try_set_aio_context_abort(void *opaque)
+{
+    BdrvTrySetAioContextState *s = opaque;
+
+    if (bdrv_get_aio_context(s->bs) != s->old_ctx) {
+        bdrv_try_set_aio_context(s->bs, s->old_ctx, &error_abort);
+    }
+}
+
+static TransactionActionDrv bdrv_try_set_aio_context_drv = {
+    .abort = bdrv_try_set_aio_context_abort,
+    .clean = g_free,
+};
+
+__attribute__((unused))
+static int bdrv_try_set_aio_context_tran(BlockDriverState *bs,
+                                         AioContext *new_ctx,
+                                         Transaction *tran,
+                                         Error **errp)
+{
+    AioContext *old_ctx = bdrv_get_aio_context(bs);
+    BdrvTrySetAioContextState *s;
+    int ret;
+
+    if (old_ctx == new_ctx) {
+        return 0;
+    }
+
+    ret = bdrv_try_set_aio_context(bs, new_ctx, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    s = g_new(BdrvTrySetAioContextState, 1);
+    *s = (BdrvTrySetAioContextState) {
+        .bs = bs,
+        .old_ctx = old_ctx,
+    };
+    tran_add(tran, &bdrv_try_set_aio_context_drv, s);
+
+    return 0;
+}
+
 typedef struct BdrvAttachChildCommonState {
     BdrvChild *child;
     AioContext *old_parent_ctx;
-- 
2.31.1


