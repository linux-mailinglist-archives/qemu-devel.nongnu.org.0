Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3141396E77
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 10:02:40 +0200 (CEST)
Received: from localhost ([::1]:50874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnzMF-0006bV-Vm
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 04:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCk-0001kb-UF; Tue, 01 Jun 2021 03:52:51 -0400
Received: from mail-eopbgr140133.outbound.protection.outlook.com
 ([40.107.14.133]:29384 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCh-0005x4-SV; Tue, 01 Jun 2021 03:52:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnlBhoByHzWqO0ZImeGmloMWiFBt0f/WNorIeRXIB1ni1Cfvp/R7AGxYKg32IoyubapppSLNR0lIixWK034R9IUgLpA86JalrjRRRKdvcSJkqEHcvi0G5yTHng7RqpQZ6p4Q4GuSUsMi9XPbEB9+04NK2kp1rUb/QrTTjkaA/O9NxhUS9q2V6sINsdBgv01QQ3sN/fY3Ik5atk1j2//vwKIdRXC0aiXQPBAEqq68QsMqg2S/rrr6SzA1bsydCSf3SxKQRGhLJJt4NGig9OqC0wWnJiwjA3m9w1vbHdhBIwTLGcAbK0qatViWdaBjt69e1jvq6bUBGYXSPiiBmOEqVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfJ9NdNwslNtptKEC3Q6SJ8I0/fssllUz20VkHaj/Go=;
 b=I2rSsneK48VQ85iVEn0vxNGZyAZ2/KyorZUZu/SWirZYhlOLAeN3ULvwMyJuaDAxNi5uent02V/VZ9DZuAX+xoTRGod5ac08fHM1HX57kqfNtrP91LtWRJlBifF+EPN/yDxOUnrK93w9TyP3y+FoWPl7GpNuhDeLxYTZvjg8aUuwVZzPoPkoGE6gJMe6wKycluzYubaz8UvWgEr8hEbTDu+ChcXV4EF4549oMPtUkV7KNKDsLY8bsrb5D3NMafVdQa26/PcM4tbacQX1SPHw1CZv3lzt6F4D/+MWsYOgPjUU1hgfTdYu8QHSxeJceCgcoyt/taK7VnH/zK4kd3+1Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfJ9NdNwslNtptKEC3Q6SJ8I0/fssllUz20VkHaj/Go=;
 b=ZI6rJIcJnOJ5LOit2ajDc1Kb3lm7ZPnJO0EEw8nqC0CNFuCfhncj/jqBYxsUYc7jFKUdUWfeATt6DQJDJRnNqjIJLGizIb5A2lubZkcOMp9IBr5f5otLTmDz5cg4D2Z+VF6hJIEBlsfwwFq6QQP7KCop5PslfxtfOEwC5xIYBpw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2099.eurprd08.prod.outlook.com (2603:10a6:203:4d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 07:52:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 07:52:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, Alberto Garcia <berto@igalia.com>
Subject: [PATCH v3 2/6] block-backend: improve blk_root_get_parent_desc()
Date: Tue,  1 Jun 2021 10:52:14 +0300
Message-Id: <20210601075218.79249-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601075218.79249-1-vsementsov@virtuozzo.com>
References: <20210601075218.79249-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1PR0802CA0018.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1PR0802CA0018.eurprd08.prod.outlook.com (2603:10a6:3:bd::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 07:52:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ad232fe-6948-4ce8-b394-08d924d238f7
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2099:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2099A8E2AC5DE2545BCB3CD9C13E9@AM5PR0801MB2099.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5xRLFmvlFZvjF7g6Tq/hchc6TxPhGQRG4p2E3eM8m8B1Skb4oBnzuiyMKhMEIOpot2fvn6ivPuFwv1Unz5b3xSSrWWos4GKlQAZfESJ+IMaAHktwSaeI6DBJl+C12ODCc0WUUHoQzb7e7RPylavlCWWUpahqVUwwlJDzRgBMRHvf+0hrk3TXfIF2QX/2Csk13trIyu2DxunfoNokDU/iCTCJH6WGAXUCfztZv529yyOT6LIQm7+Ro89wnBtLbexdcRCaDYq6bnAaXV9UwMjQvBMtXc1sVF4epaRpXboT/HlqmbzJNLLMhWh5Ye3NbeA+oX3o/KHAr65qzEzFB0ZoDxVghGJlBpBGLo3/36/tY8cSx24b8gvJ+o0SvUXsX7aE8c8g6mKCHY51Kt+DqRtYByQGuI9NXAjzDWh7oTuZPT8O9TvMunGH5F0jlEPhbhToNgf3ni+T+6xMC1XYnn46+wSH0mxpyc1xHa0lidONkgSAZkcj1mWTvWbp6qWP3rgmSqIFP4IewQQgP2skAz/nrEEHlt0743h/rKOJ9gBVuLwuRO7gihqfW+ZNSs43RASE/Rq2jkB+2RZyoi8g8mXBZzOzQGBy5iDy6FhbuOXFFG1hft2f7ppuYB31bzfKRLKjlUqnvG/ValiJCl0rKnT+5dyvK574sYUlAfX30AvYyA1yESz8NHnmZoRbEhXQKqw/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39840400004)(396003)(2616005)(6512007)(8676002)(8936002)(2906002)(956004)(36756003)(4326008)(316002)(83380400001)(6506007)(86362001)(16526019)(66476007)(66556008)(38350700002)(38100700002)(6916009)(478600001)(6666004)(1076003)(186003)(6486002)(5660300002)(26005)(52116002)(66946007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HJYO86bxYcH3iuraDcsC2kWhLvuuiI6G3z4OGbBpLiHRxxWfHJfBUf8wym5c?=
 =?us-ascii?Q?uQLWrfLsV9c3hkOCMMP8mu6HXeAFyeDW1ZPsLmubjzhc9h4QUH5JVybObCXF?=
 =?us-ascii?Q?Tweg+D2IWoZZUXaDz28j3OpJSagDxHlH2jfaAKGSBXfJnLPYyjpdZ/tdsceO?=
 =?us-ascii?Q?55x7979Bh/IeHB0Xl1aB52+zzmFnCK7+3slXqZU0OQZQEP2H16Vr0y7BFC35?=
 =?us-ascii?Q?L9VhI+vf0Oqa0+jThUJwY20M5kb+WvqwrSS0PRmMh03xCrbmFF55iqqpXCMz?=
 =?us-ascii?Q?ij/QQmtOMAmGuLjZEMurjg1058KnvDRELzeX7dkcGLGhXISir6nIryfZ9Q7e?=
 =?us-ascii?Q?odUEKtiPLJP28RA4RKoil2QOwYFhRz6LFAH95f0natpiS1b4Um5zG9CIKKK7?=
 =?us-ascii?Q?rD9Ux+/2HwFmiQ8ms2d3LvzQj6NLHz/J9PW5evkP2TA47Cv2hRUSLmuY4qaE?=
 =?us-ascii?Q?n1EBF4iyQBSa5RtYJ4rppk1SyDtzIjta/nVLYagmwh3BmX42NmW82JLdgKrk?=
 =?us-ascii?Q?X2KzHhKQbz5ttouW3E3qX2bn6+Y95k7TFNQynj8z8cRogyWDFhnc+UgHEeDH?=
 =?us-ascii?Q?XaK9Gyw34/mIgms3klImQthQW7gL+ezIzMKVrIfADX5HxHPNAS/yVUN2uVTk?=
 =?us-ascii?Q?vK2PVNLAbWxtpswIOr2iIwMj1kMi2/Gb3wyKwOtxynv+sjyvifCKYHUL2OSU?=
 =?us-ascii?Q?YR0QlpW45EvAbd7IunsK9WpEM6fFGfnE1UeFNKtvfrUfvM0arU7CJVPg9EoQ?=
 =?us-ascii?Q?mnBVhEFN3WYq1c3tZTcbj6OdJAmPLIKT+cylHSYMaosbe799YHjFfnC9mXu1?=
 =?us-ascii?Q?e9eh+ZDpeYLtwJfSontKsWApFjPB4TQD/ALpvfgjjEkcOsuDDZ1UD/2kRMse?=
 =?us-ascii?Q?9qz3RdI5GPoZSguPM8KQnIacIOQ0bfhcIiQP9pnwUzJgv+qs1Yl6viyDxCaK?=
 =?us-ascii?Q?1f6E0Gmd5SYHWLmJzYBKwtzQWSrhyVpuQEq9/PCvbmibp7/8m9BvOm5PMqBR?=
 =?us-ascii?Q?EX6D6xJrrhTfBKj2sw9y8S/FywgJtGbmQgqIByrIrAKZoSYF3OKTSTNRDSCM?=
 =?us-ascii?Q?Q7jHeCk8Vz8xRjUrLltzo3Pz+aUNTDb9ReGOuouwZyI5PMfV/okFTFy2SJjj?=
 =?us-ascii?Q?IX053XLNh7N+u9OsQtO83hFNKX7nUaRTZ1VLYSuXzm6DwZdrAUB7nGrC9ESz?=
 =?us-ascii?Q?is6RP5v/uceXQhixDG+yllAQHPnkDxXivLSNLOHuOrJCiEEgb/G/06M74JIF?=
 =?us-ascii?Q?oRUqKHlhyv8rtYn2tHgPkY24o6s8qQ7xajqv25ucxD/Nq/Asd/e8fmex1pPz?=
 =?us-ascii?Q?n//aAYDeXEHqT8WTIKn5YifY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad232fe-6948-4ce8-b394-08d924d238f7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 07:52:36.9494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vb08OdWwqaCNsi3gKaFVNLMhvsVerJhAXSjreT8ajSM6HYJJOsCVwsPDuD7KnemfgHVomrFTazE8RUEN/hK/b2GdOYk8AUpC3GpIEY5JDt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2099
Received-SPF: pass client-ip=40.107.14.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

We have different types of parents: block nodes, block backends and
jobs. So, it makes sense to specify type together with name.

While being here also use g_autofree.

iotest 307 output is updated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/block-backend.c      | 9 ++++-----
 tests/qemu-iotests/307.out | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index d1a33a2c8e..5be32c0c42 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -141,19 +141,18 @@ static void blk_root_set_aio_ctx(BdrvChild *child, AioContext *ctx,
 static char *blk_root_get_parent_desc(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
-    char *dev_id;
+    g_autofree char *dev_id = NULL;
 
     if (blk->name) {
-        return g_strdup(blk->name);
+        return g_strdup_printf("block device '%s'", blk->name);
     }
 
     dev_id = blk_get_attached_dev_id(blk);
     if (*dev_id) {
-        return dev_id;
+        return g_strdup_printf("block device '%s'", dev_id);
     } else {
         /* TODO Callback into the BB owner for something more detailed */
-        g_free(dev_id);
-        return g_strdup("a block device");
+        return g_strdup("an unnamed block device");
     }
 }
 
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index daa8ad2da0..66bf2ddb74 100644
--- a/tests/qemu-iotests/307.out
+++ b/tests/qemu-iotests/307.out
@@ -53,7 +53,7 @@ exports available: 1
 
 === Add a writable export ===
 {"execute": "block-export-add", "arguments": {"description": "This is the writable second export", "id": "export1", "name": "export1", "node-name": "fmt", "type": "nbd", "writable": true, "writethrough": true}}
-{"error": {"class": "GenericError", "desc": "Conflicts with use by sda as 'root', which does not allow 'write' on fmt"}}
+{"error": {"class": "GenericError", "desc": "Conflicts with use by block device 'sda' as 'root', which does not allow 'write' on fmt"}}
 {"execute": "device_del", "arguments": {"id": "sda"}}
 {"return": {}}
 {"data": {"device": "sda", "path": "/machine/peripheral/sda"}, "event": "DEVICE_DELETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-- 
2.29.2


