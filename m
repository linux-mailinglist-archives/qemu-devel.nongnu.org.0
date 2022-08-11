Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BE158FEC2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:05:49 +0200 (CEST)
Received: from localhost ([::1]:43972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM9kp-0008U0-O7
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gI-0002Wu-Tf; Thu, 11 Aug 2022 11:01:06 -0400
Received: from mail-eopbgr60138.outbound.protection.outlook.com
 ([40.107.6.138]:46683 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gE-0003b2-L4; Thu, 11 Aug 2022 11:01:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5hNK5wQ5dCj27Qd9JEux1ccJzcJJQyq5g/ZXthJ0wWq2s4aR3EL+1MpWwWXwG4WezsoO9bDhff6hTvCBdt3S52xtLvbbVOxrFtH/5/ilwBhS2NXVEO47MSJXueYDI6aldJxeSHjO9FCu9JFcTsQkgD/xYqJxhP/uLCk39iRwLmA7fhwIMNTuBBctMmoYwBmiW6crF5QFfpqJtaHugKLfPzKOXyMd6Hb3jWOpf/eRVdTBuYmCEB6c990+uLA+p7AC3pIAagc2L0bUjY1VFk+rwfOgad8PzvFFjldZ8pXs+gPb5rwrH56LZ/ofKR3zpMuh0uuna+8VGLIedhAPa+auw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orwHyo4qwO/qEh8wSDCfc/yRsKvHcgu1SDtc4FLapiI=;
 b=Rqu1Kqb7jnDCbxMjSEh1Lwmo7StPduEVMEvsn8YXFIhQcR7Ye9ftbSlpVHLQPkSM15uW9yzgHWL1u8oOwlhG6OCh7rUe+nMORiy2JTUdYVtZwTtYGwqTn4/UumCKRxlmzLUgUsoms2Gr95vFbc+7KSWtljdhZm/8SOXtzy/7IBTxUGXXEML7bdZmOuFyl3Dg9nIm+ZtBvOtx4AThm9S9cnqHtU7y9gLYm4hXVleRCa+J0IfcpqzxIyxeK+Kg3nEr8lGj/8BEYwsdlLIjMGqBfwHeeiJhZA1ZaO+fjMygKJnF3uEVC0HjL/+fyIHzabkW9S19QttemjhVzoGWZfjxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orwHyo4qwO/qEh8wSDCfc/yRsKvHcgu1SDtc4FLapiI=;
 b=0MLLIy8q7S54E7US2drUDRyfcbIorNNPOZYtDQ2Y8Ll0pGHxfsqvLrf4+QM5riQ2tYxflVaMV0w8FFtyIYjuLlmWZIgb8jS7eUn+QLYVugDchj20uLjmc/CmrCFJ9HO6MH3QDGJxt6y+OID2iPHEPYM8Kug9jip2xO8iwzVEIkZjXyLXUGs3ofTqjRsaCrXJC3vb7UqT5kHjhloUFju7rK/OaHs53JO1ga1QaXDtZrlNJoUG23ZzDPOskfXqAbao16EXuqnmM4znEUrMTKRNN3JUNBrecZAg6QFi2Zd3cfZn2d03NCRyoH18wUbX5GF4JUUrS9pGXt6OhLMBxqbdEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB6521.eurprd08.prod.outlook.com (2603:10a6:10:254::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.18; Thu, 11 Aug
 2022 15:00:57 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.021; Thu, 11 Aug 2022
 15:00:56 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 3/8] parallels: Replace bdrv_co_pwrite_sync by
 bdrv_co_flush for BAT flushing
Date: Thu, 11 Aug 2022 17:00:39 +0200
Message-Id: <20220811150044.1704013-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24010a97-ea16-4bdc-711e-08da7baa4b65
X-MS-TrafficTypeDiagnostic: DB9PR08MB6521:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TuoQaf6Ob+v1gN73Ap9PLcuGg/gINu92sLvtzS5865xNEx7v0DT/mdTMo1ZmWBw6a9w7Pht5XKOQRNiqTvbYV8peEY2CUb/On3sAgSyGHVnKu7BpLz2CX/PfuhHjKgHnl30iCb4YaCG4XiIrxH1a5KQDdzf/Ei12vhCS1b6y+a2cPZSWJeFjBW/PJ/irUcpi7qRoFgsE4VcZjhIkytoX93X4XQU5b/LpB8/6WxN0YmEJ+SrGYbRPNj/xuNJfRzOqRbC+2aKL3Izdxfd3yOKYTYsISe7NueOPUwZoyW1+aYSp7uhXalG8DPbwJrbQ0+bmCkb2o+OUXZlG+8uMqHtXF60hDjfdBLNYfMnJycYIY4FlSL7V2WbOBrPtv0H4gjOMeVVDvaATnrXZjq0GVwctR7kPDacc+RswsDIvq7p0JKTiOraZdltTSwPzkC9UhclY/Al/pvj2PC163FrFxMrbz0teg23J3xOpYrEHg1PFmxtVzidtTh4IsQmb+tCHHDXriYeuGj0bSQfhMkOWB43IPOXGDKLxEzGnWem/GDsHOA/aPvFZwmksd/Rzvbl7BqrjYUYJh8JGRHm9nXzxW33WhCPByr3XFqo+wjLF+JptpXucmZ+n7EyPGzF8zKjOobij9a8nH7xqG8ijQChg5+fxlIVEQTKSo+Ma3v+qivmyKMtyMfv4NPvKvvTCPB2PsvY7o+WzcJ2fvTESroHtmI7P0tmez9cfvbY0EJgF58wc33xQvoQ0fRUSLuU17fgB+abgbxpHVWuty9rbTztJWdf3Mph9ka8p0+EtvcuXHmam8zA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(136003)(376002)(396003)(366004)(346002)(6666004)(36756003)(6512007)(6506007)(41300700001)(478600001)(26005)(86362001)(2616005)(1076003)(186003)(6486002)(83380400001)(52116002)(5660300002)(4326008)(8676002)(66476007)(66946007)(66556008)(6916009)(316002)(38350700002)(38100700002)(44832011)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3u1KrATYG7m7pVuLUxQPpPYhhI6nHkug3Eq6OmAJC4ukcBCm6UAfMhw0iWvb?=
 =?us-ascii?Q?3K/ulDOEu/OwXST/LuAXt4XbG1gyJfcLSQ7Qwr8kzKHchEaKhCf4UlShEc+V?=
 =?us-ascii?Q?lRJLqsNg6BS5UiuyZKAgE+URjP449t1DN7qI/wWXd4vnY2Y19eGGD95EN7DF?=
 =?us-ascii?Q?umMqzZ5PTVRV/FJpQaS8wHqHFyROir6nB3JFyKWEM12Ylip/6rjMOZg5bLhq?=
 =?us-ascii?Q?11mFkrzu0bk7UULn5Dw5pVDXNUIjhFrid2fPfJKvpGxmGdG6joNAGazAtwHw?=
 =?us-ascii?Q?vvzodlGZYFaow/SIeyw7q9LsGSNhGn5+sC6kM3wqXUtXQiA762BG+lCJaCgu?=
 =?us-ascii?Q?lgM8mUI9UAtEsLkMdG/eNB4nFIMtZMJAq11p4CqNUNWRddZ6V/JpuQnuFSAW?=
 =?us-ascii?Q?duSnlrWItTEiRi7lDPh2NU+/T7yilWWSVTWRCHwgoePsQ3y423KrWNbNxY9g?=
 =?us-ascii?Q?pqunrGCARYla6X7/58LLhK1uGHG8NoJ0BeIhlgoj36heKhbt1PBaMHiQJNge?=
 =?us-ascii?Q?g32Tr6zjELAe7zQ9HxwJQrx4YzTTTNOAcAlwSVq1ZaFnBdUhVJDFzzaGJXA/?=
 =?us-ascii?Q?R5EyXvsJr2Sy9MFWv8s4UhzB7fQie5K4XRzHU/Fp8usccUSpAE15jksBJlla?=
 =?us-ascii?Q?pE/WEwZ0vC8roZrBdf7OU20WIf0zXYSO4VY18KlXrnYET5qTRu4rsgxzNEoq?=
 =?us-ascii?Q?gx/RzF0UhaAxoYNDM9n9vWcy+3Q/w4epc+Jr/9zdYqDQmjxt21Go0jdGWWOG?=
 =?us-ascii?Q?WTBHmVVNAKeXWcpq8QTagNl/uACkh3iV8mNL7kUfeqyPM6sQ4XSTxNakgoAw?=
 =?us-ascii?Q?bsU3MfWzW50p1gHYCkwB5OySbXkE6EbJQIUua335Vc5A8t7Vs3MHgT3DO6uu?=
 =?us-ascii?Q?6Acy1efEK2+qSXRwyXjwEzpA4fDNFUpNO07sgURilN0ooGx4nReHkagqE4c/?=
 =?us-ascii?Q?7mIAGFrF/jPUzR+0yr2280XGu4S+7EccZi/P84kVGXEw3+eBI+GvqL+QfkOO?=
 =?us-ascii?Q?nzaXC8UzZ8rswZJp0mAvpQQMNVrEKczB5DeTdgoPCq7kKkhljaTIu4uazPab?=
 =?us-ascii?Q?4SFVmUMTrYVhP2NAifDoKtK3CKcX+YlEEc1Gq7kgQyN4EwOxODMe8ZRVruWY?=
 =?us-ascii?Q?YqObJZCErlHUbSJ7MQ1D1u++hCM1R+3lC8vmwn0+ofqSO/tIg1NW8Is/gkys?=
 =?us-ascii?Q?ePSOg8I0SIhcwMa1D2dn0u28F8B3w6IjquWzIfnanq0EjIXv9Eftb183yAtt?=
 =?us-ascii?Q?ohh22OK1BPQjfMZ5wdeARxt/6fgif/TZRa9yMpDr88kK5ITVcvJesT8yPHAn?=
 =?us-ascii?Q?488umCKuLKu2QBZSPJuA6skpWVrz/EtamQ/ne3yU6ZPcf7z1ANvmuxIzLQ8Y?=
 =?us-ascii?Q?FJoCiU1kjTb2e2FIpn/ulC01DK7hT8HYDfDbNwesLx5L5Nx9phcgGirc6c5u?=
 =?us-ascii?Q?POwQVkIm3dg0YUI0xSsH6q7G4Cno+sz+267WW4V0uuP7DMbUwbAbRvLEHrpo?=
 =?us-ascii?Q?NJRCQp9kiaiDdirl9Jn4BBN73WCD4ID64h1JmcCprzBe3Q/WzLwmO221cDwx?=
 =?us-ascii?Q?HQN2p9JuhxD12H9jbV/cbohTySwxu/HC/ZRfc5Wow/c0GQjD+jzzIx0RhzV3?=
 =?us-ascii?Q?/w91qSE2Nh6dJuCD9fX5aZ4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24010a97-ea16-4bdc-711e-08da7baa4b65
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 15:00:56.8910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oGmf5vkNfKVctWjK3ZRQrRLC5WK1EFtgR7dvocrA/Gl9hscDTKFoMR4maGs0z/MdFaVwhrmv+ol6zwWXn7Zc1kYU7+t1hNwAOdPfIvziIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6521
Received-SPF: pass client-ip=40.107.6.138;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It's too costly to write all the BAT to the disk. Let the flush function
write only dirty blocks.
Use parallels_set_bat_entry for setting a BAT entry and marking a relevant
block as dirty.
Move bdrv_co_flush call outside the locked area.

v2: Patch order was changed so the replacement is done in parallels_co_check.
    Now we use a helper to set BAT entry and mark the block dirty.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 7f68f3cbc9..6879ea4597 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -428,7 +428,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     int64_t size, prev_off, high_off;
     int ret;
     uint32_t i;
-    bool flush_bat = false;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -467,9 +466,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
                 prev_off = 0;
-                s->bat_bitmap[i] = 0;
+                parallels_set_bat_entry(s, i, 0);
                 res->corruptions_fixed++;
-                flush_bat = true;
                 continue;
             }
         }
@@ -485,15 +483,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         prev_off = off;
     }
 
-    ret = 0;
-    if (flush_bat) {
-        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
-        if (ret < 0) {
-            res->check_errors++;
-            goto out;
-        }
-    }
-
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
         int64_t count;
@@ -522,6 +511,12 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
 out:
     qemu_co_mutex_unlock(&s->lock);
+
+    ret = bdrv_co_flush(bs);
+    if (ret < 0) {
+        res->check_errors++;
+    }
+
     return ret;
 }
 
-- 
2.34.1


