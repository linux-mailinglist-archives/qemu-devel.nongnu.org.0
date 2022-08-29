Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AD85A464C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:42:15 +0200 (CEST)
Received: from localhost ([::1]:34836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbHa-00061O-S4
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0h-0005zh-NV; Mon, 29 Aug 2022 05:24:47 -0400
Received: from mail-eopbgr20111.outbound.protection.outlook.com
 ([40.107.2.111]:46341 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0f-0006hc-Td; Mon, 29 Aug 2022 05:24:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hreDUnI9dT2P0AZislsURGNuysaq5m4zzPf5DqWTFxEdZV1qeC9pge/vGVk2IUq2DQW+tEV+fdT8oaWOenq0RhQmYcVCmjta3CxfMo6MTnxGVs06At81Iq8GCxSBLc+zIUhsSl8LwJPAjmtEhZVBZ8MrEmsYSqdMggN9nnSVuTxb5FFfbm/uRSy1d571+qZR7dLgEtqyxH+SKysraC36nxMBs6JKxYe5fd3VA+4MfDk+btAbF/zMf2yStsplMuetiX1k5jm91Mw7JDk8MzqBzrAroN0+4TNp6tmzyVKTGNeRG/AwetmjpMVn+uR5qN9i3RP2ayN6kt3FQupdU+w4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iYReJi0zV4ezBFk28gCUFO+tGQpkythYzHceVAAbYo=;
 b=JVyDt7vK/sAyn1juRfQ1mR6cId51pICniEe3P599JqvmsHsq4T3RWwgSN1T9AI5rNiwfayK+/Mo6IGCIGqQ4UyMq+7bnGDLO1iu3kc9IxzHi4ggBNU5k06xDdQcJPXEXDjMF7Q7SsqJV80FsRgdjPsCTn8FNcYiVwU3wZTdPPPHfQWy94V8WM+/T8oOIw/UaJkiMGVycgn+E0tv5frm+IV1i+/Ar/lXJd8exHASX/mYiqgARPRFOhoCRzKXc68E30oNpWnGtHBmgZ0R6VVQQytfkJIJn5NHj1HhiKpgKVtFtCvjWQEbSb8jxj6pM7YtJyrH3OnlbHbWT9tyDr9aMWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iYReJi0zV4ezBFk28gCUFO+tGQpkythYzHceVAAbYo=;
 b=KDjV9c9AfnrU6m1MlaMAFaUYy9GDNErlIRCPjq/7FCyk7t15XrYxiqWub5ZWmWNwKZrohxD2pQJJICF4GnVjM+Edsi2k7/CRtadxxWCT6ctkWa7oWCOpDVfdAQxvoRN4uPu00rz80YKDfRKoFCnbnFRO4OMFBWotZX8c0r2C3jRgQCy2R2oh62mdSPyosuIQ1qU+EGw8JGp6xaBUZLV+VGXPqotnRTLeWb6PUc0FET2V8stdh+tWaxDTgrMZn3MgJnEVAVexpdBhLDFyftBG/9tP70tKExYhiZe+USBN/w+ge8qOMudRogL3qOyrOBexYsWXYQMfBVMtiCrN4kChLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB7041.eurprd08.prod.outlook.com (2603:10a6:102:209::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 09:24:36 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 09:24:36 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 11/10] parallels: Incorrect condition in out-of-image check
Date: Mon, 29 Aug 2022 11:24:20 +0200
Message-Id: <20220829092420.341050-10-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f150e77-5865-4f75-c1f5-08da89a04a53
X-MS-TrafficTypeDiagnostic: PAXPR08MB7041:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9cU+CZBXRd/1UDgLqp1yqJzq3ddRJKx3cgPbjgw32+fmzkYgLAHMDbrh9ku5qxsnf44Ka2bRRlXB3jeTg+En8kTfYS4jZtCtrccS03+fgtTSK0+YUphxOM0aZqumcsCtYLAWT7o4DF/wX92qyner1Dd5C9yWWQGMI8mM++rTfEwVs5Ze7lKzk1IaBafO1Lkv3HQ2rhh9tIEdmca1e8u+jbLWFdxxlnjwtWoGPSgXhxfuLmpKIG+6/z8mzQjovSNWvVWWcdQAwlIKwECjXUpm2oerDEbYHSzFw+sSOYdZUZB1YuBUEghL/XMtc8b9cv5CtFlIYKPMMkrSnIfo0KhJKBFcOsmRI097QuqM0haSzrH/B5KPS8+axyW8w4GKfM74rGKDGTq3D+pVsBS1yhD7QtD+LrLAs41mx3t1UuTn7u3A4ogt7zz00fzjKQKBLu9SiURYhBaVx6eR+NwYhDR7BBxS4ySu665i+geSGwHG5ZvyOiBNuq30qahuF3qk/2NeXhde/bJRsxr98BU67f5xmx461nuAo0kK8ncWeEu2P6lfxpB/o/sX+4fFocTchGNC8OEKmGW7VKDbIngTAO5x1twUEH743pIh5XW7YLLiH7zJdrMZhyH93hu3bDFd6GUvy7iJW3gUzMB9ZjXFXGFA2lAzzg9diM/sqULpyv5pR3oE2HjEByOFTFjuQxvOpbBVmAS9bOxyCuuGPQuYFAGB/RPksF5NzGHAn9C57EhYlq1HFybiWWb+AH0NomsujkOr5aLDPGUxxX7UgX4dP3fwdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(136003)(39850400004)(366004)(396003)(316002)(38100700002)(6512007)(26005)(38350700002)(41300700001)(44832011)(6666004)(8936002)(4744005)(5660300002)(478600001)(86362001)(8676002)(4326008)(2906002)(66476007)(52116002)(66556008)(66946007)(6486002)(6506007)(2616005)(1076003)(186003)(83380400001)(6916009)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?guZLHW54/3oeslxoSkSSbiMAkZc+2ddr1ywSV+phTtQP5KUHjJnWpqru9Zlm?=
 =?us-ascii?Q?AaBQMV8CdqhaimGCzArciWsFF3cwt8xIK2CffiLmi4Sj7+KRWgyWOWzVxljt?=
 =?us-ascii?Q?NzEZnYins+yq9SMlsvY5OUiUaBJjAs5m6ps/TlshTiev2KNj0nYW7g0nrwZj?=
 =?us-ascii?Q?aZmCNd8+oEcHX1c+DrU8ZbIeMGsERIcSt0GM1QTt+N7uVq6JfutkRfjaFd/r?=
 =?us-ascii?Q?fWdIHidYRo4lfWxryTN/FDxf0Vi2XKC2QOoUcDvOllLKfYlqNCp2+sR1wR9d?=
 =?us-ascii?Q?W3bABAJopHMg0KS01NoU0SKgw7EZ2N7+XYOGbRt3cTmkTsvdfOE0ILbShnUj?=
 =?us-ascii?Q?qvxqRRIAJklQnRosWeaMv5Xh5lu38LrftYS7KnNNbDDQ6Uwrvkxaais+t2+p?=
 =?us-ascii?Q?rULAr0o3f2WnZR/q8EivTxOEsOR10u1k9Z5/aurhUD9QSsiQNb5ncE+ym2x3?=
 =?us-ascii?Q?vHzZUUsjLnz3RPe08GO+8rDib2yFOLg1IHGl+d+nzSe/rDsWHZHPFYkbZdHf?=
 =?us-ascii?Q?TRZU6AKFHAV6MqiT4pQIr20mWumPNWMrFlmqtLT58/F4f/gub1GCzdQEmPwQ?=
 =?us-ascii?Q?dpl7QckuXNP+rrFqJ0Bm8rl1VwjXoh2OSsdnVwhys4V8VRvRL4RXckSroqUD?=
 =?us-ascii?Q?dptObWX8zrkembmsoi1+Cx/myJm/VupF1oyO1JWQ6PbFYgjrhuhy8nahgZ3I?=
 =?us-ascii?Q?+HFYkR41Q9/4cQTRDn0dI8k7oaqU9obY3J+ty6+KJzBZA1sdL/Qv5I61OdH/?=
 =?us-ascii?Q?XYlX4uPTL3MSIrzZogQUj5bX5VuvKvIEhs4Qg4malvwojKtkOhZyzL/a20wY?=
 =?us-ascii?Q?3WMsbtGWpDEOXFfmthmgp9xRdIDJwfQYqEskw9C4+WMhUWq7lxTe07EYn0LB?=
 =?us-ascii?Q?JnoCZmsFgUTzypWuMj6dgp0KgRz7nyJ7cWMLc6SbUjCo0aKKjnIGH+qoOxEO?=
 =?us-ascii?Q?3T6sm0D0fckEbX94QW14pH8tLYTuCRkxbRc6ga3vkaycGkxUhO7BKz3h9LWK?=
 =?us-ascii?Q?fc3kE4ITIwrjmwPszF6AOUFdt/3DapDqOrJp8/T1Jk8A76/L3zf4WT4CQgjG?=
 =?us-ascii?Q?zGS9kRAmTJYo/hbu/7V5Y2WnAUEGY8I5cg5ldjXQS+h6pK+wYjZ59/NAGioe?=
 =?us-ascii?Q?KN9MwGk7cwkhsHkOIB9wHlVrKOPCUZ1igaPwezSzNVdaxs7IkUKnvl50PPs4?=
 =?us-ascii?Q?/MyjNBzITxpcfMNy0AQOqdnPsdPKyRNdL5a5hJHqGFp5sUs34gJUj0JXfPos?=
 =?us-ascii?Q?HUb0tBw2P+bXBn9dJEa3GiONZ6MiZJQeBU6C3SdpUpkizOCdmzxvt/qeSqsg?=
 =?us-ascii?Q?rkRSQVdGQffeUUYI78/NvUTIuNMKLrFOz5nYAa0MTeANQb1dw6tAeWdcRBkN?=
 =?us-ascii?Q?JjzlU2oWofJ0L7vgNAPxcWUCO5ogJqSR6mBxTecHLy+AgOyXEJruSNRDZtGd?=
 =?us-ascii?Q?TlrWUWd4LMQBEEoQCjSjl7wwY8OwUymgs/6w+308mZLBVBarzyxCNXPqXgST?=
 =?us-ascii?Q?QupjHuCQhcIjPB6/x+/eYUcO9Kxh0k1KGYUtirzMFsnANLlo2zwbIrXtIFSz?=
 =?us-ascii?Q?Q/cYAxQPyBXqzVkH57N//LkJwgxnhE41WDWsAAvmrtX+VF3yNh/dpO5FsNUJ?=
 =?us-ascii?Q?Ffb2u7uwd979SnD5DpTcQ8Y=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f150e77-5865-4f75-c1f5-08da89a04a53
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 09:24:36.2372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5fMNgpWvqMWPVXnWAF4iF7+G9oecPt4AdtEgqfwn22mmZD8Q9b2EmyAsaGZlAcBG/He/ekz9uzEHaXiE6+kyrEFHmj9hOw1M51e/qwPqIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7041
Received-SPF: pass client-ip=40.107.2.111;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

All the offsets in the BAT must be lower than the file size.
Fix the check condition for correct check.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index 8943eccbf5..e6e8b9e369 100644
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


