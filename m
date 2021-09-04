Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E2D400C1E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:31:09 +0200 (CEST)
Received: from localhost ([::1]:46018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYZQ-0003Y4-O4
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTc-0002cy-Tk; Sat, 04 Sep 2021 12:25:08 -0400
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:18546 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTb-0007GP-5L; Sat, 04 Sep 2021 12:25:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fho6gFh7Pxm2HQF8juBDDy+194q+ckcDQvB4/CAq34bNwhxLlfl//KHl6FGkjsXYWr8HVNtK9XYcpeJ/VuQAtrHKmrBX0himpBMQ0LILnepMmb21N5JkKAvCSO2rS7FFEQ2o1G4BzpSui0Dzc2W5HV14hyy0Yq/wU7Q7DmBfSvctpoHsAfkIq+KEOdR5elvbwPu6kLPgdc+vtiAhwQE0pIES0ImnUYRSieVbePV+A4Ic623axl45ps6o0LMQpRNHg2odl+eSYOXaShlJ6N8yt4u1hmSWz5rXaTwG+tYQuHJa3WelwCz3CrV+2zG4ohybIxmTK6C1ejHeA3SUViFG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=SD8banx/qCHhvCQEA/nqA5kcEzw60W3bfEqUgLGW28g=;
 b=HQBtnyS4Pws8PcbNCKRhl4MmEyZ/C7lrSRVXutuslxuMipBiTi5qET8R3viLLtgFcmf0EhQTNimO2Qk/n52oJQz7Vck8xh45CVrb44rvp+bTeVb2JPVbgFUVHtxxys71NR8Ejj9muDSG43assxu8nMZkidPg+yNbYLt0Hvr/CINWbKIDSftE1Y6prTaa768VdIQ6JiynR6YLdE+MPTkWILP5yjF2OLZxBL85f/tcXmfZz/tXXNrGZfuESvDdTRlmA83ku73oJsJF4XXs3T5oKYHeV9c83s9OlkWQLj/M546rf6I+ZGllBUvGPnTrnmPrv6c3rqKEVJWFL/ylplhEsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SD8banx/qCHhvCQEA/nqA5kcEzw60W3bfEqUgLGW28g=;
 b=O9MLWkteErX294U8K6u7Pw8PS7ohdie48D+1z0UppGlbNKxAnVo6mX3erklfloEw6gpkwDwA0w5A4r1nRF+MrHwJl8BY5D6mEOQggpel0ZPcVkRbT8G4R26FLQICP6elZIQVeVznvjH5IitgrH3yr3UKpFqdu+yS2t/mEV91BeQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Sat, 4 Sep
 2021 16:24:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.024; Sat, 4 Sep 2021
 16:24:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v7 05/11] qcow2: refactor qcow2_co_preadv_task() to have one
 return
Date: Sat,  4 Sep 2021 19:24:22 +0300
Message-Id: <20210904162428.222008-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210904162428.222008-1-vsementsov@virtuozzo.com>
References: <20210904162428.222008-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Sat, 4 Sep 2021 16:24:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0de04fc9-8639-43d6-7d22-08d96fc089ca
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB69047BF54AFFDB08E7EAF5CFC1D09@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EnrKJChrjdKBbc7J3cxkTJPJhkljaww58gkX/ySp0CcKrRnN93mzRZiWsPyI8l8U5ttiJoPQlA7OEvY92F/8JKunoNIyxFlFumEJARdq/oSQutJuy2x0L9dgdPeTfbj3Wxy+SOjvkiGX3QbjX4ebOmdJ2XtdrahYl/N8kQqEOwSBlzqmq6m0hoKMA194/nOf6frcd9bHYO8FTE7KtQyoMCB0ZFl7BWUDnjRj/PeHdkSFJSeTaB5BvhigcGyI+2toBe1YuLZypHlTLqeH0PQIln1oL+Ya3J0K639HujLTxPebsE7IKy3cEkhIpSzaXYoiPrA2hjgB/RR0qkRWkSzuo5vHwXMXa2VkTDI/LsUHKlUXRpsy+4ASBVMQFzOxOISHJC6fW/sJ665HLFvrjKob7DoDCEAPsne3leLJpO/rWKoqgBXDg+ytr3+NRZPHhZnL0i3oOW2mWcILLpHUK3PDHn9PAmB1A6lYR3PcYSSApF4SWdcKg2zP3WuAIshe5ofPlxHAzQD/dA6KpmHJm0zxckCz/DhLjP5Pcljf3SWgOP83k3UrAoRg3EbJxvxmGDnsx/FaITBmWv8boulWdHoIodtOW5eMmcljU0LC9FWsMwX6Jrk/Aud9BqL8Z0Ek9vq2c0E+Iu4VhkPduBoJVzDMBT+1W2jCrtDgOCR2qKjy3cxex1Qz93/CgLYHNGtPoLgQsBdE1cteZQ/Zp0Kjq1hEzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39840400004)(396003)(366004)(6486002)(66946007)(8936002)(52116002)(6666004)(83380400001)(478600001)(4326008)(38350700002)(186003)(38100700002)(5660300002)(2906002)(1076003)(8676002)(6506007)(86362001)(6916009)(6512007)(66556008)(36756003)(26005)(2616005)(956004)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7cTYGOWpWcxcG/8QLQc1Wmn5RwIQvU2SX5MFtRSpesDJdwrF3u7V9wAWdAij?=
 =?us-ascii?Q?KO/QZzHCZbbgqtsO7VYSDF9HwMV103eM4OyWJlQZgh92WefJuTjYotP1q9Sg?=
 =?us-ascii?Q?T9O/WiKcalWfW1YE403lzo6SPxM5RvYzyqaNTe7JrT1X6NVwrbe4rdBT1ZDW?=
 =?us-ascii?Q?OcOZz/2jbcTpQVTxExLKGuzNVuJ77UHKM84YyLmmced8lSslXW2sDpmyObta?=
 =?us-ascii?Q?0ZAoTEktuLOjC3w6Bb0UlwuWfwE5a1iCZKIsU/eQphvWLUkiyzl4zhfOzdto?=
 =?us-ascii?Q?Z04jXo24960uONUqPsD1UJUzpJ8LEEGt5il/mqsOOAqvLgWT0AlzDYKNt7BF?=
 =?us-ascii?Q?Em66ShTyEtSv9Qs4nKs5UyBosKqrLogtgThHxqy7XANBUnKH/CAqwLNdDmCn?=
 =?us-ascii?Q?MvxUQ0gsH4KCBrbC7q7GY7L7GglvtNUPHeIGYbZqBjpdoHIA4EMun//8URAb?=
 =?us-ascii?Q?NXdfxMuTMNVKj2HGUrNcyI/LbnYY0dGP7KGOCzzsRVlK4FnbeV6SeRF2J51n?=
 =?us-ascii?Q?Cr3T4PdwBL1GN6jLfbp3aRy/wSvzdQcw7z634PetL405+cc745lTGRR1xhzh?=
 =?us-ascii?Q?EPk0JA3Jn+1397ZUn3FHo52R5xx++ST3wn8DIVh8OV1HWWTI+HZrTUFKaYHk?=
 =?us-ascii?Q?b1+G40cFynPoDlT6k2VTeyoTpY0lloxhnLOB39QwqyEIHepPk+ISQl3v4gDG?=
 =?us-ascii?Q?sBL7T0WT48g64bAsclBkVjIAI2Brjus7JF0QrXPX9b69IMAhC5PdsqhfcRff?=
 =?us-ascii?Q?kMGsHPXywK5OxdKqdz3tzSbJUkl/xJQQhuMPMmMs17HkP1oaaOQwq7yB4nBZ?=
 =?us-ascii?Q?HVLJgHsBxPNI9fjTlpF50POUXXgDR+XUjkDBieTLqTSWRyA3GUeA8tnTeKBE?=
 =?us-ascii?Q?+fTCOOueBmlYCBfMiGT8TAEb7k2+vrXTYy3Is7FJtfza+YujH/lqd/FMLcV3?=
 =?us-ascii?Q?yA2ZEkUcyYq6b3jnvKoe0pLMs1Usag6pEpb/hapuF0aRD0uDF8I5M3lxZHPF?=
 =?us-ascii?Q?IhnuL+335956fqzWohajFjYbqb1Q7XGJJYhFVfrCfsDlvslv7zO80uDZ7Phu?=
 =?us-ascii?Q?eitgEKcBVe0kGc2Tg81PBVqX0SPoRVwgzeBk2MNcwRIWziNTmrZkBfIKT2RJ?=
 =?us-ascii?Q?OGoPLDMVr1YeLQk93x90mdmjvZRG9qKvEMBrmz9mmUPhaTB2/qLnDQQPhspp?=
 =?us-ascii?Q?UGuPb8CD3sg8MQUpaW6znrI2bYn2g8VAQjR2Bu7K5fIOvpyycVogqwDV/4Ny?=
 =?us-ascii?Q?yFBIgZQ+ddG4zOR1CD6y4uzUrhN7BfOMxgGRwWfhyMywNhgrTw6M49s8Rbph?=
 =?us-ascii?Q?KvLVUytvUK0Ak/8dwxKPDZk/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de04fc9-8639-43d6-7d22-08d96fc089ca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 16:24:58.7083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFwISxvRl/3RUHOx9RmsRU/S1ekM/2h3txIF1nTBoIWZHVcn+eqM7Fo6OeOkC7Xv+g/UAjzA6QgaNQIeJLOruGL6JuBGB4+EH+XQ5QjEyQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.21.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We are going to add an action before return for this function. Refactor
function now to make further patch simpler.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 2095188b6f..7fbcc600da 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2262,6 +2262,7 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
                                              size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
+    int ret;
 
     switch (subc_type) {
     case QCOW2_SUBCLUSTER_ZERO_PLAIN:
@@ -2274,28 +2275,31 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
         assert(bs->backing); /* otherwise handled in qcow2_co_preadv_part */
 
         BLKDBG_EVENT(bs->file, BLKDBG_READ_BACKING_AIO);
-        return bdrv_co_preadv_part(bs->backing, offset, bytes,
-                                   qiov, qiov_offset, 0);
+        ret = bdrv_co_preadv_part(bs->backing, offset, bytes,
+                                  qiov, qiov_offset, 0);
+        break;
 
     case QCOW2_SUBCLUSTER_COMPRESSED:
-        return qcow2_co_preadv_compressed(bs, host_offset,
-                                          offset, bytes, qiov, qiov_offset);
+        ret = qcow2_co_preadv_compressed(bs, host_offset,
+                                         offset, bytes, qiov, qiov_offset);
+        break;
 
     case QCOW2_SUBCLUSTER_NORMAL:
         if (bs->encrypted) {
-            return qcow2_co_preadv_encrypted(bs, host_offset,
-                                             offset, bytes, qiov, qiov_offset);
+            ret = qcow2_co_preadv_encrypted(bs, host_offset,
+                                            offset, bytes, qiov, qiov_offset);
+        } else {
+            BLKDBG_EVENT(bs->file, BLKDBG_READ_AIO);
+            ret = bdrv_co_preadv_part(s->data_file, host_offset,
+                                      bytes, qiov, qiov_offset, 0);
         }
-
-        BLKDBG_EVENT(bs->file, BLKDBG_READ_AIO);
-        return bdrv_co_preadv_part(s->data_file, host_offset,
-                                   bytes, qiov, qiov_offset, 0);
+        break;
 
     default:
         g_assert_not_reached();
     }
 
-    g_assert_not_reached();
+    return ret;
 }
 
 static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
-- 
2.29.2


