Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A363B4412
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:08:56 +0200 (CEST)
Received: from localhost ([::1]:58200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlZn-00061T-Nm
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRv-0000sN-JP; Fri, 25 Jun 2021 09:00:47 -0400
Received: from mail-db8eur05on2104.outbound.protection.outlook.com
 ([40.107.20.104]:54361 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRt-0006GP-3R; Fri, 25 Jun 2021 09:00:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nk2kASeQM6RZQxHhuQOGNzCfDkN0dbbSxT9kGZVlxUf4REx5wDRvf4Ezrkiq15V6WyovEUEP8iw7mqgCMRwwyh0LKZNtPqQnWczNSmWaThWg8bJlEyA6VgaOYn/Zhb1aRaIjBgHQzs0pEUodSl/l9dF7ptwYYy4Wlruw2iVjCaWs1nbRAxq9zRVej/sI1HeXta1QrLTRWnQcnO//zKyi0uYD1FbG+7evrXvzkUhlkGlCcGFE1Ay1P3bTbAh1TYHbmV+toq9T6tQYyQqzZbD0nHXkhvbaDf9RgoCPJK4nxvB/lNpLzOtZlx5Pz/7JO/8pTfBuIVbAV/MzM8paBlB6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5xss1+ErG+naD7Rbxlp/o1CiHhLkK4VbTTYcisYEg8=;
 b=VLJC2CL0NIjf+imRm22z+Sf9Humqzy//6zUDjZhMZlqnlyfzlce8eJksTrHQ4tojGkkvR0dbaYSBhnd9YsDA3O70G10noY1zNYfdRGnESfT+VOdWNck0OB7+ko3/0RF+mwM8fcF5GUVUBKOfYpPa232e71GftGvGHtm5mp2EguRfUryk1Oz2rqo9wcxsoWexRg+EqsL6fPRcUobJMwfQByscvHjsKt4IsJvnKDwOjjK7Rh4xEQH1nDTg9XgPbJAA0Blq4Ui/m8wr5y19ldrJsD0fKM/i65FFSxpZVuSImvkJpB7o9s363vtA2DkmO6SCKJFPMcSBB2EPiSsVbayt7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5xss1+ErG+naD7Rbxlp/o1CiHhLkK4VbTTYcisYEg8=;
 b=s5b6aSO0C40/KhEmGWt/Xe2me2cn8tzNKhzU7l+hsMjvZJdNaBbhTu+5jsB5GaRYpHOukqPrdCSLPpYi/V9/WO0Z9xjFOboU3bLtL04z5lmE3W5vQiqcsTCQA8ZdjyMEgt2a7pSQE8lq0Q2lvvwEdQ1l5I1HEbhjrqt+QrqYnR4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Fri, 25 Jun
 2021 13:00:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 13:00:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com, peter.maydell@linaro.org
Subject: [PULL 08/10] block-copy: move progress_set_remaining in
 block_copy_task_end
Date: Fri, 25 Jun 2021 16:00:04 +0300
Message-Id: <20210625130006.276511-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210625130006.276511-1-vsementsov@virtuozzo.com>
References: <20210625130006.276511-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0202CA0024.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1PR0202CA0024.eurprd02.prod.outlook.com (2603:10a6:3:8c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:00:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b346bd4-742e-4fe6-7906-08d937d93695
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6134079BA634C4D971C3008AC1069@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:58;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vmHC9Z5+ZLM4t6zwR9AbBJH0FYFYl4Imrz6gU6bQEJcQkRFHjHplmt4fDEk5uKp4TI710FMPmN4boolC88mmtf8uvF3I5YWrF0AsITQKxXPj5RT0thk1/S6Xz7Kef9KeeNFicyHAuwVYtpTrXxvPPWpyUernx6f989JS5lFqM8TfmwbQWX381kNQN5mKII6yxomlmOu+fQDBTDyv84poOFxrFHH2Ec48TrQcV592NQc5VC9n+NJSIY9Ww+6lPu5ALUkOy9V+iGQixHDsGykKWfnrBP8uuGXRRnxi/PPzKyyAIwNl8DQQDli2ifhI4NPVoOoBcWREtnakoRqB/xcNCJbgtCb0rCatHclsjJ6gr/EllkEDv2D3/aaDyrI+AilaeQS08P3GVSFcXmNDAmJtFEtgqkYFNOzcvrPHikz0oNKLk2ue9DKekhxf0oIJC2e1bunrUat0RqgXvhFugDAOiPC4gEGdx397OfQ/2d8LA6DO3PvKUCyThcpYP7V+7188lmoCKs4/Nxjx6MA17CdrUtKBPe7H05f7sm56+KRTNTsLs33QdWVMbbG2D3JAPQrdUKwA3ztBrCeUhVJwDLZeFUAEWBTfM3K7Xr9ZEZDo31gzzbhXDdtxwe1TCDvKsQ+s/bdK74xYwsvy0wWpvsNd0s7kzf9ibghK94+70mIfhmRP8J0fAMrlycGvCZxDEM2f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39840400004)(6916009)(6666004)(66556008)(66476007)(2906002)(66946007)(956004)(8936002)(16526019)(8676002)(6506007)(6512007)(26005)(478600001)(2616005)(38350700002)(38100700002)(6486002)(316002)(83380400001)(86362001)(36756003)(5660300002)(1076003)(186003)(4326008)(52116002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C+DCxIPkwy325tFCdSePRIwSkNVA7WQ7b3j2x8W//SQq/zsB/w65YEc40IE0?=
 =?us-ascii?Q?3AXWiPb+VhdvE7xhT003UKlILpIRsvox5nzva5xIKtfIC1klYYt97mPlYXsn?=
 =?us-ascii?Q?JHQkCSJcbTbvtJ+hirL8uos6okerd8enJGlFEXEZhTGjifW5lxPBApfccFCj?=
 =?us-ascii?Q?Kzg5SP7uQylZ00/aqHCubixyZlWUAqvmD1aK15LgaTkhMfqQoupkU3+URtmf?=
 =?us-ascii?Q?qavW8qArgA4fQeXbFl0gXJ6gjT19vSMxGJaBlPZHp0go8RdCZ63BRHSwkpza?=
 =?us-ascii?Q?3xvF/zSbEjwIsJoXOLMMLA11yX92atPyIjV4UndhBIlVd0Po8NMvXRUIaQw0?=
 =?us-ascii?Q?p2rRoKBbXbx7KJ2U8kyjEIqyutsqncsXShaNjiPRRxuL7/vemubKak2zKP/1?=
 =?us-ascii?Q?DjdVOAIqK1QUbfwP32cKzhO5SVmKqc5jj1cKXowvSsK3P6amK1IonmRU3568?=
 =?us-ascii?Q?7yqtOFx5gofKK3w9JgBIO7FCh7Bx6xhGa/GFiC2mfAyvYlMwpNYUz1s1eUIa?=
 =?us-ascii?Q?K9WrQQvDkv5rb6GlecSQNn0B934N4s+y/5mEeAxA8jNsVKWvc18NfqaCKupe?=
 =?us-ascii?Q?AfHdrVqeXIiiSNmULqplKnu6pINYfLY8duyWh95x9v2U/A5jeWtHmoc3PzVo?=
 =?us-ascii?Q?dKDx9bBM7oMYGV4gYuJ6/oRmjZ0I0vPHQV8RMB+VzXK7836XcN3I6L/vF0Jk?=
 =?us-ascii?Q?AphmSTd4kUgCbH6nC1dpkLCWZMbxtmv3xquS+h9gR3ljMCw/ACsAgEMXJEq2?=
 =?us-ascii?Q?nz4M3SwMlT/PX/AgNtmMMFV/mus0aXYFHu3u5wOMkQO4USVRdgtlVnQZ9QZb?=
 =?us-ascii?Q?1ag0EtGq8DWAUrRnvoLsfVgzowbDCfvoO67B3mdZWQ5GQZ2clbSJTtZhSZ+J?=
 =?us-ascii?Q?CJZGvsCyFBplRYHwntoAWwaHtb3yz/TsROVojaYLF1zG8hAOKqmA/VmaC/x+?=
 =?us-ascii?Q?JYDNNJh1KqSfSReoHU9VS9frkZTsOzdIoWXTFMXyp+8qeMtW3CIWL0vpk0PB?=
 =?us-ascii?Q?mLbcWvk1f1yXQ7+7a+yIdbsnZS/XXJbVOEvFA+LPdeCMP93yw5QxMXUfXNcD?=
 =?us-ascii?Q?KCCNqb6tzj6P2TUGeJZ/ZQwx4LEpuI9+B94x1W84U1kECDHrTX4irTFRRAsI?=
 =?us-ascii?Q?ZpO5e9ohtLAGbzpommznwIzG/VfLPSJiWxEJSWZPnqb/uf2QjLGCcc84SdiW?=
 =?us-ascii?Q?LZWv/onE2Q4oQzHAzPpYQEktf67BQXp2IVCdAnEBWIU8383OSljh1Yk47cvb?=
 =?us-ascii?Q?tHCUg0v7DWuMMyhwzxSdWJgJANc83doL8l2I5Evhzt6BNy3ELUqDs992VSvO?=
 =?us-ascii?Q?5hWZCCA1F4SQqZtaT4vuSrJl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b346bd4-742e-4fe6-7906-08d937d93695
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:00:31.5271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EvYzkgnnVatACA2Ugc/PdzytKQ2Cd1ime2NRG0jBiUyPi+PTLAdEFq+GWdV/lJUrEqqEWaaSN/pfO9TWxVu0IhCGbHEeuFsMMFIBiup9dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
Received-SPF: pass client-ip=40.107.20.104;
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Moving this function in task_end ensures to update the progress
anyways, even if there is an error.

It also helps in next patch, allowing task_end to have only
one critical section.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210624072043.180494-4-eesposit@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 0a1cf3d0cb..b7bcb9da86 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -248,6 +248,9 @@ static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
         bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
     }
     QLIST_REMOVE(task, list);
+    progress_set_remaining(task->s->progress,
+                           bdrv_get_dirty_count(task->s->copy_bitmap) +
+                           task->s->in_flight_bytes);
     qemu_co_queue_restart_all(&task->wait_queue);
 }
 
@@ -638,9 +641,6 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
         }
         if (s->skip_unallocated && !(ret & BDRV_BLOCK_ALLOCATED)) {
             block_copy_task_end(task, 0);
-            progress_set_remaining(s->progress,
-                                   bdrv_get_dirty_count(s->copy_bitmap) +
-                                   s->in_flight_bytes);
             trace_block_copy_skip_range(s, task->offset, task->bytes);
             offset = task_end(task);
             bytes = end - offset;
-- 
2.29.2


