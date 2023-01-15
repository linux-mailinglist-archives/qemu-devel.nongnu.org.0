Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68B666B23A
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 16:59:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5PD-0001lB-0r; Sun, 15 Jan 2023 10:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5PA-0001kH-Rn; Sun, 15 Jan 2023 10:58:44 -0500
Received: from mail-vi1eur04on2133.outbound.protection.outlook.com
 ([40.107.8.133] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P9-0001KA-BI; Sun, 15 Jan 2023 10:58:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8ZmEwLkX3n1HZiZ+Czw+nTvtplVfW2q3YWmKgZPFGVumgYYCNIjCCskI6+6cDeXdjPhs63BOM1os/skaOsf395d2YHPZHIJximxU4ZBQYdBaiBMUntqypth7FGoTSeTPMt1TV5Rj969SZe3fg3+fbai1U7EnVR4yvyBejk0b/8sPZfs4TrUZR0xTLugdxzINsyVK7Zk/9mic1GYjVABg+6ZjW1AqnwONyBZEUFx/WbdUw7OTlzF3tAv59s68dP9mhFtF9dE+1epZp4Ti1PCpm3N29ZPznb6ySIelgytkDyLfJ/YdhDFjzKXEbwBZ8WF6O+MRyM3VJ1R7GwRXSc3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tsf78umI7yoZtB7HbQqkE2cEGfOKrX/i+TG7HBLiwaw=;
 b=lD4kFLkbe3FDQPZvZU2jrtn+A3VrjWX8KlZvoHfS2u3qffObBjlB0K0dI+HX2ixTioHeQ0mjdJ1nVjQ9c/4vUQr67jyISSEIbnzE41P6fXSB5vNv3EtZE7y1i1D5h1SYb1gw9XBur4ODVmgVBm9VcFJncJ2EgZjg141VdSpzAvsdpzCsGz2PV0vyYnvegMtCHp+rTgWnc1PIevVGTtlYaF5erRJlSPn8Lqkqjgi3WBdSy5bp2si/OYXNC+Tggxtp7TGtM1NXhn7D9yvlWZY4/MSjooqbDFf/uRKpjFfC/Vxs5At31K71ApEJt7ZD/qSpjW5rlZKZDxtKE4mnPZ+M2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tsf78umI7yoZtB7HbQqkE2cEGfOKrX/i+TG7HBLiwaw=;
 b=iMyCyJoPSNJcmrUl73wHJ8j6gdj4nrdHjh1ykMceAqSDDcKOJ/Ot9ILUT3V99w+uyZqOgLy4C+xMAf3yYeJantNJAWzjk/T5fHCCJ6W8qvMmKpJU/GC+YqCwUL19ABXwtvAiviR0R3LvzxD2Pj6gTX/NpGZHEkjB8d3SeAKgGcFxmHkD8edS6a+8GaA7q1wruvsSfuusattFFinSkjeXtaxgawc7rAK8tOKP+Y+JcqNHc2SMSOW7scpz3mVaDd7VIQJP8lr6icTlaLUwmGGZKyozRMuAptvwG4LO7O5g0CakRyeAoSFqlCBeoTfopXB+yxE33w9SWsL9uqAuM0H/QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB7857.eurprd08.prod.outlook.com (2603:10a6:10:3b3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Sun, 15 Jan
 2023 15:58:31 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 15:58:31 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v8 05/11] parallels: Use generic infrastructure for BAT
 writing in parallels_co_check()
Date: Sun, 15 Jan 2023 16:58:15 +0100
Message-Id: <20230115155821.1534598-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
References: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0312.eurprd07.prod.outlook.com
 (2603:10a6:800:130::40) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: fbfe8d6b-46cf-4aa9-4c70-08daf7115987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6EUFsGFnMgoxs/GTuFAeWdTIdl9DTJVg7fM2wNtDEdyIRE+VsYC3HofR/Fz2rspV4Ws7UeOwcbag0TlIRH1vJA2NUsuyNY15ExzI0b7eQKptzXo4R833lpNvIzJ4rDHU4yfY4qN67VJW8Qpwa40//06sJMuR8zZbDwKI1mZbuXHnnSLkkr3KRRQ80N4k+l3+RsQ/7vPhDMRVRI/Vu1qRlyHIp3JdV8MMEiFtBIbq90QE2OlW4tWLPz4mnWEjqesr3AP+TkkUyqoCbAJFxZTikRu3z3ixVU7tYikPWlwPXzKzGhGVt5jup5ctQ9NXzrXJ0JgEW3q20N1h9B4kJ19bL6ruksjAFqRcd52YODIFZAYtwkH9uixlk0bWnd5JYLjrNBeddT5iM6HC0ma7skSI9pXG6dt3aWiXdbhxQbAs5FXxjX07eETdfjt4uJqZSVb9EKMHCpnTsk+7XbykPueROPoPYh1NsrVjl7XBzoWKc6P6hJSTQwaKQ7/bkLW9oUOnmerFnPtqMp5x8+6+iLPSLZ4wPnn9pyo0M9LEWelNtRG1TFT7mSHRSYDnXVytjb8lfiBXZSQVGP/4cR+lbgXO0iDGcJ/3MuCwtSVeP9u++diw6ZDV+Pj11cnLS2sG7W9/0uAeQMtGPTzWn8cZURO5Yru0E8GddFAmSEVOKPnOoSLUMSoDk6LZCtXGK2CsLJCtddt4n5elBCYWOOw29rqdDSaOmRFhw6vkedz4EUBuGJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199015)(41300700001)(66946007)(66556008)(2616005)(186003)(4326008)(6512007)(8676002)(26005)(36756003)(86362001)(66476007)(8936002)(83380400001)(38350700002)(5660300002)(6916009)(478600001)(6506007)(52116002)(316002)(1076003)(6486002)(44832011)(6666004)(38100700002)(2906002)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z8OjKiPQHz3zGIGpyJSKpd2NEWjNljv8miZzmZzRT10rJb8EW7ZFtVbQ0W0L?=
 =?us-ascii?Q?KC/FpT3m5JWmSTqyAYDyjzbbUNTw6K3i2Wt55uw3Tjru0mrw2p3t00pwTGTZ?=
 =?us-ascii?Q?6zHhj+ho5NZftBNqav0ATNkVa8e8UBlEH1xXYMjvSmBWfm0O+i7tJQqIUGii?=
 =?us-ascii?Q?HoH8F8B9iqk+P0WPwLbdp3BtIyeaCGISTT/2hRWol0pRpnfehlR/l/ma+XoG?=
 =?us-ascii?Q?Y1nzRM/9OzBh26JT+ckPrB8O2QA08XtUuH5YxUGvRB7JQvs5l3NrBEk3QSHk?=
 =?us-ascii?Q?W2oEKfmmWcWQT9xsCHM5mDTQiwWiEvshWehgESSpoIDBqHYVlogVisqququU?=
 =?us-ascii?Q?ehCWDFEbQt/MjZbzski9lDhS/kG54VrxQnl32lZlehYpIwu+iPbOMZa2t1Pr?=
 =?us-ascii?Q?FloizuJZ1Z1aA9/dbLAl4+27L+3heUFwOP/Dcs6nvdGl48AGBB+72Nc9DPtD?=
 =?us-ascii?Q?HEelF3Cp9KbIpfY5fatJW+w8ImhPP9Ht+t5nuOOGXMpSDp2VWmn59J9mg5wp?=
 =?us-ascii?Q?QqtCdwx4+ZazhocMwyRG9+2gsy21rkDufSs/rfAbj7VSQzU0N3heeVwz2cFb?=
 =?us-ascii?Q?lV3Y09CfGLOkXMuF4iGjPMPKgYm94c0DVxFSNUvM2rQactT/ZOHRVzFsA71n?=
 =?us-ascii?Q?FDfrOoVoZkLIntWfa+yjmTohT+mjEE0phd5L6gjCus8MqUes2hp29ltNLbZ2?=
 =?us-ascii?Q?5mQdZfTOdWp9CDJgUATqIqvqT0grqzkaJR+omxTLxYxS6O4CTC1JLOk/WVvj?=
 =?us-ascii?Q?xPrzj0E0SpG6umJtjkCVwnHnJvs3SFHs1kpI3KoU7HPDvsUG+n6O5gza67st?=
 =?us-ascii?Q?930hTL4Xnh4tpYNmdchnxlI3YO/LJhL9a4In4dwRcJE/dBNLLqqHUqtmoLCM?=
 =?us-ascii?Q?rKjuQcWwUy5HN50CQw42MJXn5FmT1lsc2lSeBRvKe1cqSPrr0g9iALZQN9eG?=
 =?us-ascii?Q?HlarmxkY8EQpIur9Pay8N3J9cMn+TfKZ0dV/urm0AAedzmmoWHKP/NleSlmH?=
 =?us-ascii?Q?GuqaayoJdH8gEeNwG61Vy5GiMPtzTIOHgaZNDpuKpy2RVv9xLqRDQdOOXrK3?=
 =?us-ascii?Q?0/dBjFiAG+PyF8H7dtb1iG7Ohut/jjs+x7ftU2K6RRUjKFGxbbO47xCaf3jP?=
 =?us-ascii?Q?m1MXNrPa8GAo1KJ5EbWYqItPVE/gwOPIujEZX9UmsKIPP3s9aCrHBfML2fBO?=
 =?us-ascii?Q?uZ2eaqRfYMajbpPqWTuB/Wge3xTwrAWnzJ+XvcICL+t/+o+jmLy42vBYLqqo?=
 =?us-ascii?Q?mUZcGmhTB08/CqyQZ2u8Vy+zMORGkkJSye9zraUeyiLmvi5zYr9DMosZfQ26?=
 =?us-ascii?Q?n3xvDkZGEeejIock3VOIOb0kt84tw8ExJtQzUVSjKQ4gojT6VSgnavqEbQIo?=
 =?us-ascii?Q?TEZbFlBCEQXkYrMrCHddiWnOSSfrKx3YkxyaJJ9KHYbV3IMfM/E1wkcTxxqS?=
 =?us-ascii?Q?ZGT2mC3wPotivvOKjbG2jXTT25nw2f2DHjkaDh7pxZCx3dcEldw3o5t4R2f9?=
 =?us-ascii?Q?P3Gkp/Yvhhw3bKhd2rmv/n+rtrl2qaGvG6KCDVM1ntR2kH0l9RPNkRLDmT+B?=
 =?us-ascii?Q?wTAJuYvgY0+H45jxKHfwu87PfiytDPlXMdPkjJA5gAGPINtRlFidiCxmF9Zh?=
 =?us-ascii?Q?srEUKqooR6UOnyLn2Zr/jMM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfe8d6b-46cf-4aa9-4c70-08daf7115987
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 15:58:31.6139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75ie9uZGTPzSheqCqw+LVnX/7QLnCGmc4e7zUJD5zyyUeqbM8Ar5Yzgu8Ga+uaxV8rnC5I1PYUCkiUEjk7ljCvaspuqXWZ/ewrJexTI4YbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7857
Received-SPF: pass client-ip=40.107.8.133;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

BAT is written in the context of conventional operations over
the image inside bdrv_co_flush() when it calls
parallels_co_flush_to_os() callback. Thus we should not
modify BAT array directly, but call parallels_set_bat_entry()
helper and bdrv_co_flush() further on. After that there is no
need to manually write BAT and track its modification.

This makes code more generic and allows to split
parallels_set_bat_entry() for independent pieces.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 2144ecff7d..3ca4ec469b 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -425,9 +425,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t size, prev_off, high_off;
-    int ret;
+    int ret = 0;
     uint32_t i;
-    bool flush_bat = false;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -465,9 +464,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
-                s->bat_bitmap[i] = 0;
+                parallels_set_bat_entry(s, i, 0);
                 res->corruptions_fixed++;
-                flush_bat = true;
             }
             prev_off = 0;
             continue;
@@ -484,15 +482,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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
@@ -523,6 +512,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
 out:
     qemu_co_mutex_unlock(&s->lock);
+
+    if (ret == 0) {
+        ret = bdrv_co_flush(bs);
+        if (ret < 0) {
+            res->check_errors++;
+        }
+    }
+
     return ret;
 }
 
-- 
2.34.1


