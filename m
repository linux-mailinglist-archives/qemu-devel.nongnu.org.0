Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B3B66B23D
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 16:59:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5PF-0001oa-LJ; Sun, 15 Jan 2023 10:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5PC-0001lI-KH; Sun, 15 Jan 2023 10:58:46 -0500
Received: from mail-db3eur04on2121.outbound.protection.outlook.com
 ([40.107.6.121] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5PB-0001LB-9T; Sun, 15 Jan 2023 10:58:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ne3V7SqNiMUgByr4rHCY+JlT2nyjRp+ESsrVM+kCQcGZvHx7s8YnUP1IFZ29aGwTdxhBAas4xpCq+IWR74ZQyxV3iPv7aW19t3mjbwMbCYNyNdNqNLW8Ie3IfiM2BMKuhF9CKMs1EoV4C6gKPLt14fzDglk3o5Rg2wQ0Npuprsq2eI2fyPuhxJO1ERnaggF1LePaHEyiTnuI2jvjN/Q4hMrWW/heH9czsl/z3fCwRWePvVEEvbr4m8l6UobV+hZ1q2MOav+S6SJqNLkh/Nu2HW5ghFVJ1T2K5MVFcbfa6BrRtevN+AD9uSoigQ9zMr2X6RTwJxBHKKKi+gAeBdkqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cul9dnN2HoBNMYyDTLJLoytx5FGQ3oWVvLVgPjn/rQ=;
 b=mFXWA2JP9hEAAtKV1VxW6DTkj9uyx92R0JwlYROjd/I6t5ZWsFDrqr/Ikjz6uR4IZ3n4bZmYEs7slNs3jLHYBAGgfOm8eNljLLWkF7dYLjM40y5O5Uvx1AOvG+fQME8x5smm5pvg9iIzYLZUKBgii5zgi860orEsj5evBQrjH3eLgrN7zYVpDlxUvd2ORJv/yrT7zvuV4bdB56TQBA3Wf1ui3npl/J2hm/x0iTukefLFH+8lnvPQQvYXxB/uYHP6phljDMVLeP7blVuqM8n7y5weRqkQplh0RiLhSDIgSVK2gHn7oexxUkL69U7Ghz/+0HWYzUAhNoPekqPvEb+t4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cul9dnN2HoBNMYyDTLJLoytx5FGQ3oWVvLVgPjn/rQ=;
 b=Cdhnq/Z0dpgMvIHGMKFmUjFo7Lgu4AeT8MZ1Kx2c4dzsy7GqqmLuiiYLUekL58cg56gy1uKzQIQsqdavBeR9JKdWvt14R0wYstojcM7VSjYfog3wo46ScabnHXmSQSChFU/d8L7epLMGn2pWVM5cP18KCrbyVtXD0GEqeb9lZmGRzvtED0rYCzfYWpbgfjCBjaFDYc3PAIRv0GTUYpCGdfdUEfL0k7GBV4SyBf0+9D30Rqealc3xjR5TBYSrUOf737wBx79txXsLQ33WWWKoFAVToZUw5EIyKXKK0yzDBXEzq84+acQGSTfOGLsx/qXeXyLLIbY1ufqxX3FsnDpVxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB8PR08MB5467.eurprd08.prod.outlook.com (2603:10a6:10:11b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Sun, 15 Jan
 2023 15:58:35 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 15:58:35 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v8 11/11] parallels: Incorrect condition in out-of-image check
Date: Sun, 15 Jan 2023 16:58:21 +0100
Message-Id: <20230115155821.1534598-12-alexander.ivanov@virtuozzo.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB8PR08MB5467:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ae1ea0-7365-4719-feca-08daf7115bad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WzU3CLXVQMEtYwE1elCQHtu7Px/xjSer/CR3lWyNy2frInLwJ0DncsS60/i03JZd7IzGY3zBRvK4BpY46cKCNo7IT0+ooYHrCyiyr6SHrLhv5lX3fU3Mc4Coc7lOMfeo6GZZsQAb2mi8lRwTMXO7kpLquiye82Ipgh5n6u8o3Ss8qFahOzfTeu7hGiXnM6fQixtKeWYsBb13xHvDymoJPuiKMLx+MZp4zB+ToWO/mXasmI+H6R5Z18WvW7J2fV0bZAL7IRCQZT4k9yMNjFcB78yqO0zxkimXqUuzdNeY6y+k1HtOBQ2S97XDhhaxSWcCksmHV+GPCHOTY2IyWn6ozHhbzplUVLPC2xoOJaGnFZL3ZZArbUfJS3SbudAWXvgdVlKj2WCUGh4aXaPTrHDTBenDixL6gVqsNH9rkE1Wa4UmmP4gN9jdZM5zSQwbdS7qiYv+bJ+in9bD7ha7MtNgF4rIpKtT0QmqZxSq9EyCJvYMEj0b2H9l4B770Ih+GA9KMzYHMwi16T/nlZB/kLcURxTk3HkmprXMKgrpFni6gpaE0NcLlyfUcon9g25Z8KgIsviq8kzvihkluqUA/TLsYeA9tk7/YrOTCDdpSViT4zojEvMSym2luLcGMl7oAeHgQHBgtfz5U37UTpEt9zzZj2gj+EIR3s1hwTnc6SN5yOgC0jV+wo+7+ktjtRTPAEVR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(346002)(39850400004)(451199015)(2906002)(86362001)(38350700002)(38100700002)(36756003)(2616005)(6916009)(1076003)(52116002)(316002)(5660300002)(4744005)(66476007)(44832011)(41300700001)(4326008)(8676002)(66556008)(66946007)(83380400001)(6506007)(6486002)(6666004)(8936002)(186003)(26005)(478600001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zHdkoYY/6pg3eBrsOV3ZR0wJQVBx/Ge2+5WIwdf1y773nf/UtG7Mh332tLI5?=
 =?us-ascii?Q?S6EG4+nZl7/1nYkeeoGVtBZ0kJEs8U7MiIwUnN8fmkGjovd3V8ILzurzrhg3?=
 =?us-ascii?Q?CwT9NKsjqRPlYqZQj7VVTTafQxJDpgOeXzMo+nyXC4GKqrjTpRb4deNPN5/U?=
 =?us-ascii?Q?/SekyRBl8CPgnHkhlTSQqfy1AzB6t3mqkNk8KCf+wnTNFS5FF7z5Gd7vFtdY?=
 =?us-ascii?Q?U5jkzNMbu1HmSONAzwLf2cxaYip14+YlplirVVRHWwVI0Q/fTpbByXa+UooO?=
 =?us-ascii?Q?OQzvUHAkTN0wuMdxSBuPeIdqfBhKQDFippB62ZFopqYpeBouUo7P/riJmddi?=
 =?us-ascii?Q?j1UtDfsR124OLcz46EvLGha9jAzAxmInKrqtcFoeWIAM/e6QvXeEBJpg7v3N?=
 =?us-ascii?Q?Zj7KKauvKws3Cbn6VM+Yu4614W3iXRBg1hKTq4V79DlWHI2v79j+neo9YVYg?=
 =?us-ascii?Q?E7rV1xE8jadDwEhShjbzWJgSABLZdtO43UgH2IkgbmI7CqNusXAkHC+ymCa0?=
 =?us-ascii?Q?em92IGR1nO18hxcPl2wKkqXHLbQ6CcbCtMmqF0iYQcxFtPmvWmorERmkRIAQ?=
 =?us-ascii?Q?uexwB/sq0T3aPG7K3KsM7kem+fS+4zn+qMCt+/9iTx7FvwIcYLPPzZXQIq2y?=
 =?us-ascii?Q?w37HApcBLGBnKVEoPdiy4A756n2cNNacYXHNHVLNdU89j2G5v2NxSaqaJNz3?=
 =?us-ascii?Q?K3w5teyF2U6to3Mpynz6dMtIwSFqXLOekcUK/PocRqNtnXaE+qTjEzEHEwks?=
 =?us-ascii?Q?srv7eO2WkDrCrHLJwxBY+ameThoqL9kGylmHjyz3Vodx9Wi3fASJpg/S1BjU?=
 =?us-ascii?Q?h8aAe4YcbPTDiZwWv+Cs6BoWOgSoe33QqxImaGk24pRnGVZwriqQMl2530ta?=
 =?us-ascii?Q?VqxJPiCwHl069k5cfcpgVev+cqD5ZWF7fNFLWird0lhTRw8yoU/+0h9vH3hC?=
 =?us-ascii?Q?XvRPS/yvEhUn0uUjCcRkXTz94Z4bVTntILKb3VDXyG8+wFx6ZCgovdknGPoW?=
 =?us-ascii?Q?8kMhsgrHK7xNmWF7y0ytavMTiqcEyfWlpqDkA7pG68zWzzUgB/sLSPTh2lYA?=
 =?us-ascii?Q?oM8Q3ptPaqUbb49Xshf57doPtPvn1WjuEBwJBzltENgS8sOuC+dZWL+sEZI6?=
 =?us-ascii?Q?dyY9+mol3mqswREShDrWH89CFkuKiBpV69H58i5LJXuR4Fpw3tb62Ie9Dbqv?=
 =?us-ascii?Q?xe2MdJxJK5OlP4DHTs/+5X5WAr7qoGwDdjalKxPZJJdOk4zY102RW6ciqFV3?=
 =?us-ascii?Q?VN3OEXF8urjAZrdGqcfXgJUm//wvtQLoI7xR9sxOb7tsesmNpeD7YTjNMZCf?=
 =?us-ascii?Q?UYZK4BB8WL9n2KHf6yx9j+MNgtWsTmU8yBhXuPcTYWfOOUun20MmAlXBan9I?=
 =?us-ascii?Q?r6ACXy0odiLnpbmQE7+jL3aC6ze17Y7DkCfL9t7x15KQ087Lsl9dyNtoc/dj?=
 =?us-ascii?Q?QtZWfVKfzWwpMorhvzKbK/B7v7tFa9CGBvXwHTUg7vMXp3vunKcxX/QKWbeJ?=
 =?us-ascii?Q?eX/IhP1d853+enNBGzx7fh57ahkvlCBPmIyNYO3wzqUIg9gfwCISVzc7s1AJ?=
 =?us-ascii?Q?TWwqy+CzwJ7+cYGKTgF6xThmkxp2JfbvscPXfqvetXrAYCAC0HP0mw7jg0Ko?=
 =?us-ascii?Q?CVRu6a5TJf04eD0uT1dM+5U=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ae1ea0-7365-4719-feca-08daf7115bad
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 15:58:35.2699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEekeEf4lcJZcmB7BGzKIpneumt09lONbYTWPbfUbmKAfDNCK5/Wbnuc+PMdDCJzNoKLP5UCOjmhDnTnfwVFw1S/pA6pptoOt8ITOJN+BkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5467
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

All the offsets in the BAT must be lower than the file size.
Fix the check condition for correct check.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index 621dbf623a..eda3fb558d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -455,7 +455,7 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     high_off = 0;
     for (i = 0; i < s->bat_size; i++) {
         off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off > size) {
+        if (off >= size) {
             fprintf(stderr, "%s cluster %u is outside image\n",
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
-- 
2.34.1


