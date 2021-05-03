Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAEF371474
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:44:47 +0200 (CEST)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldX0I-00085M-Ax
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqL-0008Mm-7i; Mon, 03 May 2021 07:34:29 -0400
Received: from mail-db8eur05on2096.outbound.protection.outlook.com
 ([40.107.20.96]:36951 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqJ-000054-Bg; Mon, 03 May 2021 07:34:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgZVBk1YDFvRHFV2sw5k6ZNKsHBhJijxIBS75fk+1A+v7GzFfH83cTGgO1C2DDij5moROdmWdJfMGkQk0Vb0gHNvlagdp1FsSg+94s5ouXEXMN0Nzj/gAW/Jm0HVi3iXpV7QsnHFD3V6tjRXYuC+IoBc6DXpSO2w7s3B9cY9gbNKb3NvSqzq7olE68Y5LJRcd0lOogADjwSu1R2Te36zDZPF6PIMx9c8jQgTW7Jvu0clNPNv7CYHBZEBzDl5L8S0Uz4MIQhTpS5bj/XPgVTXW2WhF6vOsNeDVOGEJf36G2fY27QSfRJaHbhc9u8b3bAk9xU1tZqxU3aojLmgQui9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNLEK2UMFxhDvPu4OGsI8kMBYCx4x7REl4afS56K2no=;
 b=AlU3Cp8EpJ7gCTVI+zML1QU3Xjdro+BupKprBGWrcmJwlVVDsN5rTG/zKbtqDmdoUjnLHC3SsflxaAr/we6+L0ntmCuwI6hDdj2Bj/LpPthZtrF+pmQDWfhPMH73qcHBtDp/j/28cwli3jfYKsOogi+Rgbq7nOwIoxsLtWH9aRLnaeMnOH2zqtpxQMyG2mvAsy2Qz64eF5P7CX+5NmqgnecX9xXt12WlQI5KqvpU2zZLqyeQu6eS2k4IqCuzLQhsmKkYIaUM8D/IIn+gni2RgzjwyLM7RdRoEchfNTpAmy2Ch2ERvFoFHWDmeMvo17QHfDGQjwfxhwdH9KohgDfgCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNLEK2UMFxhDvPu4OGsI8kMBYCx4x7REl4afS56K2no=;
 b=jcDdRDlFgCICHUNqjmdnboGFy2Sbp4M8D7qg3wR7O6DZMZ1LBpgbhiD63Z6wHub3N84aLxcLTYIFvKpdnbT81c1uiKJ4W1jeLs5fWjmtU8ZSdYJLAsjRHYPlmGLBUVWtuFzMfU8Yk6I7V+VJZyq3V7gXGGQbE5DCJ8gkxLRUAvw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Mon, 3 May
 2021 11:34:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 11:34:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 3/6] block-backend: improve blk_root_get_parent_desc()
Date: Mon,  3 May 2021 14:33:59 +0300
Message-Id: <20210503113402.185852-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210503113402.185852-1-vsementsov@virtuozzo.com>
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR05CA0255.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR05CA0255.eurprd05.prod.outlook.com (2603:10a6:3:fb::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 11:34:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec87e897-91d1-4190-0669-08d90e27638a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1713475D639F6C6167320A0EC15B9@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mL8hBpV63WhusOU3ivaQ0ZT7dkEAevbWjGUk2CicMxw/MaDb922ZRHw6ciHhGQ2IMxKKISQ5nbw4XfvPZ98JLEwoLe2AEilane8vqFikxmsNBfMGuesDIx646BzIEtHkTbDdUJBRxjCcx6KZm5MudpS5eMcKS9AjTIQhquZVk0EiwYG2xZKUSm+2Me8W6bZo/AG8vEV/B3ZERgxk+7Le6pfkLI+duB8iTFMEaQaxYeFKZMuHYtvuXjmGrBy9nkcL0pnl7qgMVqqr4X0qxUhoStVCJOuPV006SMhdzg5CHDkrosnyEA89Pplyv0NLfc4kogkAkCmtbNPVn7kzo2v4niabjC0xq/XDAWzdHP6XaiR1+cyx7hdXBpecYe7T89bjhRzauz4NPKI5oe6VkjlLzABHQ1ADkKyg6rxJaojOWCpmKu73B34adcxAcJSTr63s8/VjYRhiB5WtcY9Th+b3zomkrLIVZD7K42gP3ZCCxsjqxcEEhc6OU19Y57mnZ+pTsPT1YXaSHrKuWof12L+wv3jTjP3l/BghAyrSgp11X9TZBForyce2JHzZxosucgLtLx5b+kuQQZzfCURJrJwz6uyoIPHfhSrnNDwysYAV80T48zpGovD1LT2lbBcue1/2Mq/DbGC9ilfMsSrRbGS3oi3GYN9jFFrt2KwzHBLq+/V7O5wdrEDDlFxDSZ1zQnYc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39830400003)(346002)(396003)(107886003)(5660300002)(6506007)(956004)(1076003)(2616005)(6916009)(6512007)(52116002)(4326008)(16526019)(2906002)(186003)(36756003)(38100700002)(83380400001)(66556008)(66946007)(66476007)(86362001)(6486002)(8676002)(8936002)(478600001)(26005)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nsqri4pQw3I/3lm3Lr5WfGaSVNAvABRgE10cyMUUIQNo0PoAYZeJCT3FmKrf?=
 =?us-ascii?Q?bZQTbspj927izQZWk/gOeunE3hMIK3dw/zTMuJppJ5+cSZKf0HtV/9k5fbwv?=
 =?us-ascii?Q?nZv01mcNvjDu6TX17J8seYC5qv1Ev5XGrTBC1SVm1GSgKBfmHmFJb/bjyqwU?=
 =?us-ascii?Q?4+vz+9jPvNYA8SToGS1a0LP30kV2L9sPq1PTDdKMMB8tSlXRKr23uLvlYoKU?=
 =?us-ascii?Q?CUk5IPBUw8W3PRFeoR48Gujr97cFCtnBWITK8cFVGKrrF1mv5FU6neP2BHAb?=
 =?us-ascii?Q?puHHnuLrY1atA3W99rder+w5AT/zmojdtAS3O4sSjNajg9zYy69pCR2IyNbp?=
 =?us-ascii?Q?jiGnMTzz9o39ou7u9QhnSOsNsoz++N6V6IKt8h2/eZb/s1Aq5/Neu7fb+iD7?=
 =?us-ascii?Q?wRk4qWOrS2UBgwjHT9cZVAIakuVCmuP38NP1U0dS2YP8hrYD3Oo9axwj+F2w?=
 =?us-ascii?Q?j0jv5SXJVzQAp2bEpOzusiEhpydA9YGx3NyIpux3Lf3Vf5H0CTwO38CQyXox?=
 =?us-ascii?Q?aDntSoK+Xzb/hMEPAg+xysDgJk8Lb32POeMN+t+vFAhXvrByfwMDMJ+PDeqY?=
 =?us-ascii?Q?TxsTk3+/6ysETNQ3qR1Ha0hNBqUqnNMwAeuqrhNMKfLhHXUZb2tbahfRJKBe?=
 =?us-ascii?Q?ee6K6TG+2npkNZ83Tp/7/FuR7Fmct4SG/8VPRKKEeA3+BEfYDUQny4qnrem3?=
 =?us-ascii?Q?FIhd2a8AP1S6J4i/dHNeAYB5Yc+tFkpej1mVZHvjxqKiuX0qVRfLnrVc0Q7c?=
 =?us-ascii?Q?+uOqY6hAbN6Jpz4rocX09+tKqcNa8sofqM/1WeRk1WxKQfo5aKAdrihmbEZI?=
 =?us-ascii?Q?5YJWkBOPQ32NoQdup8knM40cRcpsxPcy2IFtrx0T0ZAxv7oFe/Bgfzh0w8Bl?=
 =?us-ascii?Q?+HKz5NTDzPI6g6XoQPn2uYNiy3sGji4+O7L20AkiBEAq7VL9TczFIuNWyYKm?=
 =?us-ascii?Q?QzZMGdT24d6l1cvgy64cQ8lZOcqca0+8QPTYvZwB6zfm/0fAgRCEUIPBoOtV?=
 =?us-ascii?Q?4b7H7ygbhLqg7B7HtApBc1+eCcCJOUAkqfc9FWHi7TERBL7H23h1XVEEd6gK?=
 =?us-ascii?Q?aLUa4M+fcYTYKSAx3VT/0FPuarok4b37gHlHGmU87zvTr9wgq6dpTLyQbR7G?=
 =?us-ascii?Q?7sdY1qJBj0EYmnj27WG0dZW+VP13I4ouqFEOGKSWw9vpFzL27oOEbjtc9cMq?=
 =?us-ascii?Q?iVtIP1kbHlh3aDcjwxLgb97dTthCH0/Nq8DNik3fskl0WlnfzuzosBuFHdkF?=
 =?us-ascii?Q?5QXc0tvAZKmpRUB/lvsckqm+Hjc+kpGAGcEO8ZaYXLHWrZdZvA+GDdh3QqsC?=
 =?us-ascii?Q?zLIKQceKBlVYl6HNNq+1YpKk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec87e897-91d1-4190-0669-08d90e27638a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 11:34:18.8279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R80bYTb9f/zJkJFRm+zoG2RJBvKt/Fb4MHzxjSeXtXtmgjAG3Nuakn5za7pP60Zfr93XCAt9sFhT23fptaTDwhELLWnehQOgRy7Z+pxefSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.20.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 block/block-backend.c      | 9 ++++-----
 tests/qemu-iotests/307.out | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 6fca9853e1..2b7e9b5192 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -142,19 +142,18 @@ static void blk_root_set_aio_ctx(BdrvChild *child, AioContext *ctx,
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
+        return g_strdup("unnamed block device");
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


