Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2CE59874E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:24:03 +0200 (CEST)
Received: from localhost ([::1]:35482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhNK-0007cu-Cc
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEs-0005op-Pi; Thu, 18 Aug 2022 11:15:19 -0400
Received: from mail-vi1eur05on2109.outbound.protection.outlook.com
 ([40.107.21.109]:49772 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEr-00071E-1u; Thu, 18 Aug 2022 11:15:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiBdBG2c+G0+Q3RA7Iuw5GrS2O6wHCqtjNzoLvVVtuncz6HCX9SFWXApk6m7jNmMOsBkyYSvo9MDbeur+/xOBYVGSkvRTXPhKZQaRTPiJoX/4v5B41bXr3u+coPNgYSEGO44OEKTwkqEFytl5+BKUkNRoZWYsrqCGskwzGFs6LGjLWqo6EMp1z4P9gEGrD85nTJYbVXF4SiJgeGbvB1Th5fYZ/Dh3Jz+FyUjDxL1nxtuWXij5Xab1aG6biHngjbs+tNmpWR6p8I12KLkhlNy7mGw0CL+44HS+kUDY4rY5m5aUCFUSr0j2kGfyqjFqVPlfKTPE5kIaX77tmeg+12ArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iz6VM5km79PkRBVWfJ6kxwi+m/jf3+/vMC2Fl5GGAJ8=;
 b=ARQ6MskNAMofWJ9U10Oc5Eo9y9FxLTG5mrWcXwac4NeipBRL2LBanHFPAA9NbIzzaeMp5URj1GlM+4tHQM3H6R59SACtU53jyMQ9gdEEHSQZ7DNo7s6XQO2PXlXENrG+0o4UVpPzloXLH7BQLxAIkFcF8zDfVEzFpSIywCwp/x3i3jHI0wNaWtiZxPT9Eih2SJQ1Yc+vPNCEKrTvsFdrP+rbCgFxW7jBFn7convkJxMwcqrgIRrLJsP9D0MaVBdCTaic0saIM5qCr9mVUwo8tto8qw5G1L6XPFmPcw8piye14d8ViehUHbpDOJRjWcbfXQXmszivXPPdpbsb7WLlkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iz6VM5km79PkRBVWfJ6kxwi+m/jf3+/vMC2Fl5GGAJ8=;
 b=Wj85HZnwyR2zDCtweEZwTZRjTOfBkfdDpUsr89aBXJ1Fh2ZuIYNEXinTn9iCwNLDAFlSYm5PQQo+o6i1LE9V4FyNL5kg19Rb6USZAk2iQ0/yjHZ77I3w/6Qk856gnZntnWvi1yPA57r4c9WXwkcPIamfBcjp2j/liIcch6PhBL3xa16o5ql/SfFMYQxAf7xva6YsC8GW29HxqWLHQYJ4/k9cn+mYzByqTPzqVUY8sWWrL6AMGEQyz1VonpL5DA1ash8a88mDuDjQrias/V38DvAzAG74qM8d1LHM860Clzi/Lh57npUXwULAu+yOt9Su+4h3/VM5IWLTlxTRJCjmlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3715.eurprd08.prod.outlook.com (2603:10a6:208:10b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 15:15:08 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 15:15:08 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 4/9] parallels: Use generic infrastructure for BAT writing in
 parallels_co_check()
Date: Thu, 18 Aug 2022 17:14:51 +0200
Message-Id: <20220818151456.2118470-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
References: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f67e8bb-cf0e-4673-e885-08da812c7033
X-MS-TrafficTypeDiagnostic: AM0PR08MB3715:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDm/Jon2IeNjiZIGl8R3jKX4tYFGiHSxWjeUQNIpWPqLqIIOM3mZrOQGU6vpyKpWy5J1XdgJB/O57xU11iYtXgys55qFSxECwv9fTZdkA/SGC1Cc+vDxRRjI/DH9OhwNwhWx/9IzyYZWrNeWsqGbjqa43YxQDYggzMoJma51gqQ9+gqLaqyDS88QoaV/G84grcfN/WOOxn+dGuC0c1XbFsdUj2GzvNIFISW6IWRCiI3jUZ4pmxGjKVCEmjySnWGvaiBMPKqPPtJbq9sI7koEiFm8eQ1qrNeBPQbZkwUdo18pqH48+Zpseqz/QlgEHBI+ozdy9kylUy9bsJIZyUCjDg7rN2oi+l9f/+3V6QKEjlmIYq6oklvASySQh6dME95Wgq6OSqOvTDjw1q/ViczEQCtB59lS5ESnR5/RFTFO1SqO4/63X/xsg1s3ntTmv+VMReA99ruHxqAv6C48VZGdUlD8a1lMBgCPtOj0kkIMdFdMBPe9j4gJ6fhko9B1EAhlkE9CYIn2PmU96fT8nHIoIIXMuykpWahWF1E6soh2WzT9BPt/DDyDPBn3MATG2KoCCiarqthDC6rItk/1K4xkHe37vHEZ4W+fOWonQOuXZKn9m4vsDDFlIkPqqfCE19YiHveBvY57up8q8j77rrAnNzNQfie+osiHTwlWcCGvzPVHBAPGCg2fZxe2PeAAEUD+SOF3G2XRoSr07MepeEDk+NWrhQG8ExLOB7LC5MqTZE2E3SF4yrozyKWSocGHxr4opULRv1Hrz+FOEma2K2orwppttMsQ+YGfvFC8BFwdIoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(83380400001)(52116002)(6506007)(6512007)(26005)(2616005)(186003)(1076003)(38350700002)(38100700002)(66556008)(4326008)(8936002)(5660300002)(44832011)(8676002)(66476007)(66946007)(2906002)(6666004)(478600001)(6486002)(41300700001)(316002)(86362001)(6916009)(36756003)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U+JXR29uvv5Mz7dQn9NjbV8gXxWSf1JY6bPdwI7MJkjV8uI8fvK8mNYtQZLZ?=
 =?us-ascii?Q?lJ3WIF3xDUXblIALIoA9uCicl7N8AFcYpJjXRtL+ADPrzzk7lD54rO7cRQx1?=
 =?us-ascii?Q?qvv5rMUWB0mX1ceOtelIZ2MBV2ABQ95FGa5tLId/1aO1k+R62kYrZm8nPZT2?=
 =?us-ascii?Q?0nDvjdanWjBn1EWfE5s87KO+3v/pz4mGYsR0IySjbv8gFolyrDdqEa0Lsck0?=
 =?us-ascii?Q?kK8fOtsxQbQCIRZ1sHcYjobm5U9ijzF2//WAgmVINBdp0yqIK/oFJEw6LErc?=
 =?us-ascii?Q?aah+kutz1fVRof1h9az3LP2FUyOTJuft/dS+sKRu5r268hKfKBdaEth49OgK?=
 =?us-ascii?Q?bHZI1P+ijOjyDWTsp1utwELaybVAj+oQBi4laWxhArEMniq7HoVKjd4lntOU?=
 =?us-ascii?Q?VVqjC3gK3sn5sm2aJ9GjWhX9sWD65C1z+IVIDJIiphU9MwV0oX0UiX/cIm67?=
 =?us-ascii?Q?xwreFIsPLfhRCliOC6ngW79mgMh7JsrcMpTsXH6nUmDweJa8PEqiAYV8FjO3?=
 =?us-ascii?Q?SfVSvNNWyHSu/QqdNey71rBOAPs3Fs/CsFWM+yaBewXZQkicogHfGMjXfSXy?=
 =?us-ascii?Q?L+050VSM0ERd0tlfS0gZnYsiP/8FQsKxXY535YL0GzQaHgMO4QoX735YIc/c?=
 =?us-ascii?Q?ObMznbeSAs+F2nlc6aMfAIpHNIMs3x5f2VVN7kxBDUxzF/xOtbuBxppufmMc?=
 =?us-ascii?Q?yAfr1sAuDT4HKbqVy3eMAu7c9SiBLVlZnCPLCgFkx8GUAZ/ToafBzh7F6hTg?=
 =?us-ascii?Q?TdjNmF8fRP7490qk5nkqp0j3QnhxY5VXJTWlfrau28gOv2Ctn8hJycCSDD98?=
 =?us-ascii?Q?YxCsYVrZFkyESm9PemiU+Vi/68u5PKqSboqOPTgxrpUGfFjhVWVQC7Dwcwxp?=
 =?us-ascii?Q?XDgapRjl3JGR7c7Z+NBuU+xXuNO40L5fdv7iDckZZSUXYQTM8zQJUU/yk+lv?=
 =?us-ascii?Q?pq5A2Z1SaC+P35atgL3no19iduoAYE/hsO8SjE+vG/S4DC2saBsUde16tGRt?=
 =?us-ascii?Q?wHMAoJAiV8HdpxHCtSbTTj7xGxgSyj1gwlFu0HQR2xUFngcR6Jna5DL2gy4O?=
 =?us-ascii?Q?QG6PYBlbgs3SI1eBjPHU+5btiH3rClAM5kNjScHGRGOLci5OvRhre8RLACac?=
 =?us-ascii?Q?m3ReWW4mpaROntFzUQnQf2QBLGE5B3l2X2DxDc+ZXlkIu9ASF3MmbAPnzTFM?=
 =?us-ascii?Q?rJv4LxpmILoHUvOS20TUkLcWQ0T9cp6rixQKfCFlvV+e2sK1lOWQ8gEHs7T1?=
 =?us-ascii?Q?ZwcpN3wHuBWZyQc5FGgyq6qOc3ggR5++YChObZgv+DuEUAISOwoe7H5psRUS?=
 =?us-ascii?Q?V+aq6pF9nxpQCj+5jqdD9X6XiaqDbP4XExjvSXQkTidlBkbHXz5NtAsR3mtg?=
 =?us-ascii?Q?V0awbm+iwVfRHRRUtG0E+zrCDdHDlMnG6D8mtFN7Lfy3YGiaw8vNW7LNxdTq?=
 =?us-ascii?Q?6s/D/LlCl2v9RJQJcEdMuepbcBvAVTHz8hHQRZXFEyvLhU21z9vmebV/wbR1?=
 =?us-ascii?Q?g7RL7mndUTkvVOGmNa0dh7/Py/30jZxTzZBIDZ+Aj7gVByNT7pHKpRKL6qNc?=
 =?us-ascii?Q?U/Oz39MpgXtKy0BDxpsceJXpS+d4VPWGdYK1PjfRsVc09+YU1aW4LtErL4Jf?=
 =?us-ascii?Q?v3eo08lznzFxQQ0ceR3w+Uw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f67e8bb-cf0e-4673-e885-08da812c7033
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 15:15:08.8433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLLbudINi9wUHMBGvpWW/el2yUv3pcSlmj6JgIOSlo+5zbczNqGpqH4kTbCphb6vS3U4iMeljO0H75PYvCIWX3o3WsIrnRBSzMotCAa7ZwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3715
Received-SPF: pass client-ip=40.107.21.109;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

BAT is written in the context of conventional operations over
the image inside bdrv_co_flush() when it calls
parallels_co_flush_to_os() callback. Thus we should not
modify BAT array directly, but call parallels_set_bat_entry()
helper and bdrv_co_flush() further on. After that there is no
need to manually write BAT and track its modification.

This makes code more generic and allows to split
parallels_set_bat_entry() for independent pieces.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index f460b36054..7d76d6ce9d 100644
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
@@ -466,9 +465,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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
@@ -529,6 +518,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
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


