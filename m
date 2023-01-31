Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BEF682A7D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:29:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnrw-0003Sv-8w; Tue, 31 Jan 2023 05:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrt-0003R9-DC; Tue, 31 Jan 2023 05:28:01 -0500
Received: from mail-he1eur04on2122.outbound.protection.outlook.com
 ([40.107.7.122] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrr-0006XE-TR; Tue, 31 Jan 2023 05:28:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1OoT6DBL0Ursq6/zBcZsP51TVCjuvatpne2OFP9euo7sFyYEFvUhbuMFAJp3SeXNfFyXmnTF3vXFZd3f4qsq5mh9vkmf+y8r1tmTSsRLUBRx28CeuD1bQZ8woG2OT4joETjRNaxzHphtfURU77/4h44F8T0Enj1eXjyjWn/+GXEeIXsLTr77ctk7ZEZOlo8gv/ycHH3CYtlCYQxTmQecWVjixo29VzkcdcdSoR4G3l+ZAkcORfvUoNUyw3cpnUQ94fgw7F7zAeRHaIgidCeSMGCF/f1sQeATtNooAmfUDtuuNgyQX8iZTEt9yO8uJuH08w2eayyNER3/xjIVQOAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTK30jiLts27gqjKEU4bHg9ETTLBBjr6Ie5jhjUAeb8=;
 b=aZVKYp3U2QtNsGHd4ciNFPbvkymSVN7T1f0Sa3dZ3Y+Yzph0BPfB02H2igDFLdzeO7Igqs7OTx8ZCjmAytKax9zJx/tnCH9VhenwuVq3nVsE7mE/R+exG5t6iRn0fsfCZnDrBC0KCMPGmslQCeZPZH4lIIuHO0Vf5alm58dfrHD3w2cwc8z93sIKyqhQ2rqbdJ9/jvqemm/zdlKUWh8w29sT4liVstIedUzHIjQmYwISoiHwymVofkUqbrdG74iQASDE0TLAVi+2u552CsB49xspGLywzKycVD+vyQpNH5qhsKUZMaENs8JrfiGP5r0kNK7TD34nvVCjiU9mnDnAUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTK30jiLts27gqjKEU4bHg9ETTLBBjr6Ie5jhjUAeb8=;
 b=PQaqjHdiq2Hl/9n+HhOrDbeTV24eYJmf6YGjFZLsnh7Wq29YEk8UwERoyr+avPDyC/8wNPWLCcY25ntpTZ8tZDhxKOG8c/ZcQGEMoHFQzbbGfSm9KM2PqiCb6zi2vjFXCr7rQRJH8uEqsGLdB5tJ9Nb/AaN0ULk3XQPhkV4AOAbEnNf+kPio0ucBe4lv8CokTr8WNi7C3VwxJnZXd5dM/dnLN2UeKgnR6zziD3bm99qIVAqP2LNdiIVG3MpAZalMky1eRt2Q9S+VbkTwjseqSdHzulTaWU9yM6yZNjrzZHyUW9ywHlI46RAxrxyMMejXcuhSYiLSgZqNJv7wdOvLuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB10217.eurprd08.prod.outlook.com (2603:10a6:800:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 10:27:51 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 10:27:51 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v9 08/12] parallels: Fix statistics calculation
Date: Tue, 31 Jan 2023 11:27:32 +0100
Message-Id: <20230131102736.2127945-9-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::26) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|VI1PR08MB10217:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a398e4-5550-4d41-3f68-08db0375ce61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wX+9tKae02G0LpBcHUiydIvvwVjYRySDT4TIzFegzIuTygB+C+9jyJZ+2w+Awy6zz0xjwrvxDTc1yINerJKlXJgq/vecvlPCSJ7GdO7sLyy59dAiIL073fc8BAaCwkqbvubKHUM5/zBksca1dECgdGUXzGW9GQxvdEjWHbGWCvb3txkaywNuQgcMPO5Kj3VRXoUP2SU+5KpbyzDwASN8YYriPNg8lII8voNywYO4R+gPGMXHzcEuMOP7tnYMiyZyK++1PEnqO4oM85EDOWi6qKoy8pNqThofPWPI5fOwFaFjmzaxoFBQPaha3Cqban2CIbVjskrdynH949l8lQHkL10+wOWt8M+l+2uYgUjV8JCD0h2vuashd9rU/jyqdR5Zwm0fV0HH9sn9H6S3lcQg/Uh9r6kUZEXl2pXOX27cXe0h7gXW6MxdvJtvmjxrpFPve9Ju3Ne+dc7x95Sf0pzIukZ4zfai7uPIy8VVOLUNYWRXLrPbTIGyWXSN9ZYW60gp8BBpUZqXXxlBcim2j52ii9bfpo2wUfpYCnJzvJe57VS7qGTdLEOsWvIQ39dTHNlA5AXZ9ownUIANetWjTRxixF6rUbr69auV0WC03JL+8xoLkBPz/rOjmo9IzqY+KqcILGL8PbsRRTr2oHJJwkpE2ohHrO2KWcEdO/5HVMDIpxuxt+R5QpiU125HLuEhnG6VTXaQtwyxIMOz9JAQr7+m4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(451199018)(478600001)(6486002)(26005)(186003)(86362001)(52116002)(83380400001)(38100700002)(38350700002)(2616005)(6512007)(36756003)(6666004)(1076003)(6506007)(4326008)(8676002)(66946007)(66556008)(66476007)(4744005)(8936002)(5660300002)(6916009)(316002)(41300700001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KToGNH51FcF/xdc0tLq429NiXVatRP9XwYIsgtt77aRFxoYYxdOKC+96h5qY?=
 =?us-ascii?Q?xRhK94vVuuBBZ42ye8fYY3tAwWBBWEx7G8/JGDpPL/xSbHPFRC/tqaN6QBf/?=
 =?us-ascii?Q?KAadS+FifToWVBVar/H07VM7Z8+tPAMQjBWsqm8cE1Cxiq9Ct5dIIjy6sCfK?=
 =?us-ascii?Q?xGKoHfosAOX7KSNgypWZXkMqlpFCOGJP6xHnw1qIZcop0DSSOoyPpMHv8W3J?=
 =?us-ascii?Q?mgRyLXKwQML7DnOm/YcG0hmuEgrNgrfzEbjtWbwDF7TAQhQRzU5z+deBP7f8?=
 =?us-ascii?Q?kO8r+StNskGk4H9c1k07fknLOe1Aor7IEe2L69UjmxP7fut4rPibUDgh3jZf?=
 =?us-ascii?Q?TRJ5USe/MttFN1AShLa8N9mztzarWZdIM+8h3es5IyrSRQngpWB2K98q2AKB?=
 =?us-ascii?Q?Qer67uMpUkzP8zysNNVyJ3hFdCXmczpUktcGsrHyjW3yvl5oC0MSL4v0tmLr?=
 =?us-ascii?Q?+9SBZpbo6vFzmm25sJaFdxsr5YEPXkwAfuFqCUUp70bakMnddoAk/VTtI5SJ?=
 =?us-ascii?Q?3pHE35jZDgD24dAp3vfXsctZc4/Jspwt5ycrKiz/WcUdeyhMlLD7SZJJRvBc?=
 =?us-ascii?Q?+pOcgum+BpwOCkFtmF2zDDNW9+LKFSHKNf2j2fQgdgeZf5Hzj1nd15Dnvz4b?=
 =?us-ascii?Q?p/1W70jC24rNUcKLGn9jMlTKWL7il7BdRxJhWd4EK7nYNQo5xZJPjWyVWII3?=
 =?us-ascii?Q?fUONR/Umo1K/rZ4lp2QaZmWjsKmwLNvSjmpJl0NEIdVVrxakPEEB2cO44ige?=
 =?us-ascii?Q?IeEwdZyddF5EIDlfTdkIKpO3qHlJR8BdDsixVqDTgpH0zpJxX8qF/zK+G8zk?=
 =?us-ascii?Q?9S0TMwqDTeUHnSoesmTscf09fKT8ASoP0FMETCnzfy4U/zUYeXc6SGYmVcVJ?=
 =?us-ascii?Q?0YpWdBlf7qk49zsMG2Vq35YPLuebQf8l+EoWLDqxnUKB0WEbJtmhB9KoZ2+D?=
 =?us-ascii?Q?25+DnhCj99p8AoTDvqmLppTqp6LNnScCeMFXKo7OYCEZTwIF0vus/t4g94ww?=
 =?us-ascii?Q?fOXJkEAyrc/qqzaL3Mi2PCjLmSHuuAXdD9+mNxEs+pMT0H743ZX8oyAERhMh?=
 =?us-ascii?Q?cn5E/0aNRt8GTZbRJ2QOQ0dMhiPMy8jUuDAcJu8XgRzBs+V+jPkI/lbOkVif?=
 =?us-ascii?Q?q83/bsaKMUVrwbG1SH+kIlFxG33EUHBfxWkzHZZYeduIkPUUGJsUhXdcbErn?=
 =?us-ascii?Q?BhASg+DzuTVBEY3eSxToDJ4y9D4q5irovYfzifcPgWS6nRU72nwaxwfyKxog?=
 =?us-ascii?Q?Dh0XR7IVruWDTVE/yJ4xoG13AWZJPaylN3GTIhkOkFmfxeJKQrQ5Fo5uGBy1?=
 =?us-ascii?Q?WdLySuxj5Cz6KyF/vs5t31/LWwIHdk4q3Wtk02COj8svILj8wlb2rRe4Pju9?=
 =?us-ascii?Q?2GBnAxyh9o14ndLUzTh29+gL36n0BYDyQL/S+KZsvTKW/lWrjoEaF6uwupZ2?=
 =?us-ascii?Q?tO1fk3tBn2sAX4NZM7FxabG5yU4jRjICykug3dh48AxmurGhC+WFpCnpEtpe?=
 =?us-ascii?Q?rdduJWNdPnYX424CKwVGPeGOFnNVsfENxMduUIZeMZSG89SafgdsPqitwLkF?=
 =?us-ascii?Q?8IHyCHhmxkwCYEEnGJUy5/u0H6/mWuIv22JXAFtPKP+HwFHX4Dgct6Qlgrj4?=
 =?us-ascii?Q?W2eBK/cgI/5LuL0ZRjWtb1g=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a398e4-5550-4d41-3f68-08db0375ce61
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:27:51.3312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWuavm5Xm/JjjJiwhcFya1KCqmSjUxqqgTRSXlikr9Z7LpMeI/O8UeXzPGqK6dnChDr6nLy/B5kYDNOsOwTm/zc9YdnhsEx+SgddDLg6Vuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10217
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Exclude out-of-image clusters from allocated and fragmented clusters
calculation.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index f9acee1fa8..7382c01191 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -510,7 +510,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
         int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off == 0) {
+        if (off == 0 || off + s->cluster_size > res->image_end_offset) {
             prev_off = 0;
             continue;
         }
-- 
2.34.1


