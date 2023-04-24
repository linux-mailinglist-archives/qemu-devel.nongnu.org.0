Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3156EC8EA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:32:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsYk-0007oh-Ux; Mon, 24 Apr 2023 05:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYW-0007gg-SX; Mon, 24 Apr 2023 05:32:22 -0400
Received: from mail-am0eur02on2070d.outbound.protection.outlook.com
 ([2a01:111:f400:fe13::70d]
 helo=EUR02-AM0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYP-0007RT-3z; Mon, 24 Apr 2023 05:32:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSC5mz1nH0x1R0tQ6DlpqnaVSn5xQ72Z5y26TwSWgUw3AypWHdsu+WILFfR7NT7ogaFcqcpwdTKzZal2DfkpVCEu5hRFFfkpHLOr1Uyymfl0+wtJfM3fc8RkEwEd2WOp3DGBqhcPw+H2lwyFeIf1bCUPKRYqMEtbDhD0qWezyHILPMp9+CmbggTw1BH1vzXTdeN/ksHuRbUrxwxMZ/XwnfXj2nIt5hy58MmfsFHbqETQblI96kU6RaltbZqCyyUdI/WPxK1rVx5bzd20S5n7bqQy9A3Wymhayf5/L8L9KAiyo1C1+sTncOATa6BARHZ+6aLwZqfpcJnPGBoHK0Jjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4K+8ywx4jiP8ZR36s3ypqHuxr230ENxlQ6+8WzsL5nA=;
 b=JtaKGSpGAm+ygSNtsj5d+rqMIYhmpQtAHBKS2QdFWj6OCl19YfEywS//gUk1OJQW9/MN258TaQz7t/w3xSfEynY6vGLu5vZ62fRRVerI4WO1m//HlbCnDcE/SfC/5ZSWDb3o3gbzlfizBqQ9B+BY446VrHni0W2A0ZWnyFrK2Jd/MztgxE5DujNypSVCGBPJI3foE9lZr/XTwO0CZqzhnolzYbISSyeWy1nbTFbFpcTMQUgU8ubsp+Xr8JOxZ5FLhb9tywAsTrhqFeX7NILMK+F/CDhLbtIN9j0yqTpTKoUiaRj5KtrAwmM9L450KglGXBd4igVZZ+1PFC/rYu6lnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4K+8ywx4jiP8ZR36s3ypqHuxr230ENxlQ6+8WzsL5nA=;
 b=B8LvoiCraRqmZkUPZQBv3T2v0rckoQ9Ni1ZJ9FBWjwGQD5QvAiaSykD02RDgGlHrrNMETzcrb/VdMoYppEG78tG/k0k0iTVj/yEDQHKRSTTT/kKThqcfb5Ty1PEj2abZJNLCb5ke+rB5YOZNaGZygYRLpxfxnJwolIXqV/Pw+ewf3Lu3fZBw9Jb8b9Ouj8Qk+MTTfEkSOYabHgcr1yzO0yuuAf0CgxjiWKjScSmrQVPMygF8jwbpa8XSs+5M60NJBWfJpzAsOgHegWukjF/5idow7b5G00e0shh1ILC5S0iOShLBicoxxeu5qslSw/vEVgtqwap8UVRkaF2CkOw4cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB6077.eurprd08.prod.outlook.com (2603:10a6:102:e7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:32:00 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:32:00 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v11 04/12] parallels: create parallels_set_bat_entry_helper()
 to assign BAT value
Date: Mon, 24 Apr 2023 11:31:39 +0200
Message-Id: <20230424093147.197643-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
References: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0169.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PA4PR08MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 25bb54ad-c229-45ac-07fd-08db44a6c166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C31VRbAN+ymebqdMSwf1FS8MEPpxf+Kx1px0Vt5AXZT4sxDRMbohGbibE51UUm/wxcHXlpi6/AR2+TVHB3eS+3iWi0QR8FtRUhqJgl3u/KJCmOHATjRp7TQOsla+qyHeUMlGt8Eg8jL/E0FN3B68aPpF44cbns2PxgFX9HkEVVe+qhOqsDsL8f+btyCSfJIecOQ0W3Eq+ZUIeQIUjknWW4M4ujEbdBeNKAXVZSEDtrk8FKlfjjMosDpMh7eqNR3D4MfeTvX8R5b6arcl8boMMLH5gVYQ1Ie0j0cmpb4JdIMH3veCqiOC9XQOsKjsnRTLoxbNNeOHvin+4C7+YCN36d9os4QWp9IRaobzCSvdHK3wG+JaFmFdhgx5HIFydS6fI08AV9GpKzAWBLZNj+oY3I6eTQnImmmF9WMwmcTBiKoF44q6+DLWfjM4skmCaRPa4+jAvi/67+EStajeU4+leYBjVVaudksOw2fjxBGJeyNhJNlnGkH+x+C6psbn9cHMbKzb6JbucIgKXZ9zBd/tDA0+oIuD/AGZVirbjtZkni5/hown+OZPslzS9wd62J72r0OVzSjhIRQy+StdxNMc/vzexd1wy/VsC/VjEqo+YpGPOkOOas7Da4grVLZukaAp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(451199021)(6506007)(1076003)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(38100700002)(38350700002)(66946007)(478600001)(86362001)(6916009)(66556008)(66476007)(8936002)(8676002)(44832011)(5660300002)(52116002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tQZsfHz4bAwqIe1Pl4GM19sqx1TkM514tWExYrNd5Zvqr2iGBIk8LKMNOIRl?=
 =?us-ascii?Q?qK8q2CS3Jxf0lPLyEYSj1cWC0kDeSMhQNrqlb6GO0r7ca2aumPKDljzLAPiI?=
 =?us-ascii?Q?unfHewhreRKN5Y1vt5ggk23fwhg/TQnV0MAUtqNAkdJCNtiQ7Mo2ExI4Mnq7?=
 =?us-ascii?Q?xrRSDkmeCNOxBm+skYbbDuhfxTo6V6tVMaOSa7jyLfNQ9QGPw5YUXJk/GxpV?=
 =?us-ascii?Q?OwY89BLd6UOX60oOtQQd7umBUx5J0C0In0p/aESm2XbJR8foGmlk8rfemhhr?=
 =?us-ascii?Q?sq1H+ZQQ0iQugCX8keAgxv5AnczmLfIa829d6SWj2HxZbDTbBbXxCsFUjjJz?=
 =?us-ascii?Q?TI66TSZtrNx2fTmSR+J46aCVKRyVyRVq9p8JHQhyca9mDJCJTD93rlTO0/ZV?=
 =?us-ascii?Q?/gJHGUdxY6vwtTb9xZw9r+T7q0FtHrUVUXJbLDYFNhoReZhv5AMr5mWu/0fW?=
 =?us-ascii?Q?jVSY6tt9u+Rfiqsyo4oM8atcLsAGpbpeOMBd6ovrvHwsVeGa5bDliH5OIhBH?=
 =?us-ascii?Q?3t3KI3BwSQ2Wm73sUx483tSl6hAVgxztQYP/50FPR+YhW9wc9woQzKlW9Akw?=
 =?us-ascii?Q?VN7tjuSP/AhKeq1a8sHAe68SB1znFEeDnwiMseahgjtQCY9v7dPS1unp9bhy?=
 =?us-ascii?Q?flqhCs7/hpK7Epnor+G5r2bnc21QxClwueq9MGtg3gv4k24EOx07mn+S3VdK?=
 =?us-ascii?Q?aUhGjXwnk00hJ+uFlxnqQd9GUfYYyOEuO0OyhwbDAV/1k7nWqK6/SvRZ9XEq?=
 =?us-ascii?Q?2X7Wcb+Y0/4GRGJQCL2UC5+OZjygHr2/2tPE5E9QKTx1846CjPaeJerNSkdW?=
 =?us-ascii?Q?TvYBWyYxFhhEYa0E6I2dJufspTUhs45Wh3rKfOGELJDqYTucck0R/x0wNCe+?=
 =?us-ascii?Q?cPWXatowAHk48vP9drirpdd1jg/f11X+bylVAG5UEeaKn72Pqbc0WseZAVzr?=
 =?us-ascii?Q?LrZxP7wZE1wkD8+I3GW+AolJhYwSJaQ5pSloBs0sxI9WCtOz72ykyEDmK9rq?=
 =?us-ascii?Q?LnNTC8McVJ2OBGUGD0P+OCnJRkm0jy7s8YfdO3RjgIkCNm0Y2C+4K8Usfc9C?=
 =?us-ascii?Q?9P2EgFRae59LHpIaMPW9wrJjl2OmW4SE8oWqg+/dQyT2iAaxUxAXDCqB4K9B?=
 =?us-ascii?Q?nAmxrcFBL8pB5ApuUsWI0I7PXBY30kyJYIsS8KOho7GFXYTX2VvXZ92zqSGK?=
 =?us-ascii?Q?dWPr7IBdB4cMjGdlycDvitZGmv/O25DuoUHWC0FwfxW5/REr2ha/Xt6VWebP?=
 =?us-ascii?Q?YH/y9QfYOtu31xp7qQLfWS50bqGtUhHUK4ntTZakjwJDXtSIvxtZWcux/adu?=
 =?us-ascii?Q?NOvK5c+jS2kuYMpMHMb6nG3IrCspF1j2vPr1qMW36uNSpFS2cLRCVncYlUWp?=
 =?us-ascii?Q?wMadpqYTAF8W5bhBN5VmLS6/eoztt5y8eV16rLlh1p2w66rujsyDCNxcVZwh?=
 =?us-ascii?Q?M+LjpUNHND9kXq5n2vHcqJg5az9jwyIAodS5JoNGqpQl4xUjKpK9UjNgGYWp?=
 =?us-ascii?Q?lAwylrXxYgfrakeKxb1SWYtcCTUCKoluRpLOOlCqkTePT0QRwE6fzv+DU8gs?=
 =?us-ascii?Q?33mTGJ5oBxZuvDz+lY4i1S8R5f5yXfr+n0zKpLf/9xiCNY699Weg8ALLBOIn?=
 =?us-ascii?Q?Qg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25bb54ad-c229-45ac-07fd-08db44a6c166
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:32:00.4755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KslIcm+EguEUDfxMuY9sOcJWbwAACP3cWK5w//4DY0oaAwHVYu5T38FOMIlXeW6GkvZuasf9zJqOiw8RHejRqTrVpwaJq3MMqAq23LVcpIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6077
Received-SPF: pass client-ip=2a01:111:f400:fe13::70d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-AM0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This helper will be reused in next patches during parallels_co_check
rework to simplify its code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index dec4fe1f06..14fae04c99 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -165,6 +165,13 @@ static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
     return start_off;
 }
 
+static void parallels_set_bat_entry(BDRVParallelsState *s,
+                                    uint32_t index, uint32_t offset)
+{
+    s->bat_bitmap[index] = cpu_to_le32(offset);
+    bitmap_set(s->bat_dirty_bmap, bat_entry_off(index) / s->bat_dirty_block, 1);
+}
+
 static int64_t coroutine_fn GRAPH_RDLOCK
 allocate_clusters(BlockDriverState *bs, int64_t sector_num,
                   int nb_sectors, int *pnum)
@@ -251,10 +258,8 @@ allocate_clusters(BlockDriverState *bs, int64_t sector_num,
     }
 
     for (i = 0; i < to_allocate; i++) {
-        s->bat_bitmap[idx + i] = cpu_to_le32(s->data_end / s->off_multiplier);
+        parallels_set_bat_entry(s, idx + i, s->data_end / s->off_multiplier);
         s->data_end += s->tracks;
-        bitmap_set(s->bat_dirty_bmap,
-                   bat_entry_off(idx + i) / s->bat_dirty_block, 1);
     }
 
     return bat2sect(s, idx) + sector_num % s->tracks;
-- 
2.34.1


