Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B442F8F79
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:51:52 +0100 (CET)
Received: from localhost ([::1]:38524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tU7-0001Sp-K1
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQO-0005G3-Vs; Sat, 16 Jan 2021 16:48:01 -0500
Received: from mail-am6eur05on2132.outbound.protection.outlook.com
 ([40.107.22.132]:15968 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQI-00078U-JZ; Sat, 16 Jan 2021 16:48:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2G+wIOcPDBAEEofFJmXr68ZFyg+L0fQjb2Hi66u+7IyECcVdzkd48am9joHFfkq0kOdwhZHpnD4ArONs0SW3AmFQuL/lLpG6YQlZPZKZ4Vr3GRxuVxN2OTeXHh/b/51IQUlyZ+/h1AuFJaQyRanTjtqbTODphOQS0hhqAzWTczR6yS6tohEfrZJeCnXlU7tdVTnsoNif64Pc6DU5BrtVGhnZq+PmEsmIoRPlAb28e6XCDouNTuMnHUlyyVubRlQkdFA0fGnew5ohGcuBzo2wANpXJ+B0tehOrJ8+Mxe7d64JOqMXAR8E1Jk39GuguZMeISkA2fNIxeYC9gp0nrRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PtxKWf1gYfuFwPzKye+4OiYbfhVTDCptny3ebQxG5w=;
 b=H9Myz6Oq8oSa3HS8/WzpvMKQdyk7K1E5PZSh8fTW5HOWTlgfsO6FvNsccHNm/1VLzK9jxhhi/HhB0sKCq1GSer6bgZeusB6iQnxvpAXjdGMZSjmmY4iW3il1Ti45aGsPg2s+rZfYJG3F8zGry+rJlbpW8f66gsg+OLleQzBrGvifc3/JRhHzi2Iz39OIFfmLgHEAjE2cv6Qe8vL1E0kk5ZvpJO/bLE3Fs0rFz+ETa0KaNp9csFjikcZLthCfkm/ZhKAVmBaqJqYglyIBf18KuuuI8IKzw3YvM29bai+KAuNxDGIsm6folqWu5kj9iSIZZiqSNv4Amn2geo8qJyLI5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PtxKWf1gYfuFwPzKye+4OiYbfhVTDCptny3ebQxG5w=;
 b=UAO5ScSNkaKBXJbEL4u0r3G6VaCp+bFPt51M130QhQ43nOc135HkcfOyXg/nfpYrJNrM1COonSJQVQuH6lcfICJb6yYGQESsUcEeeXBQsa+CA5/WrxhWKFgnT7+9gwdRyqddi2Fg2KkHZvyY7oR2SiAa3HBdncWkJPGrsJXB6lo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 05/23] block/block-copy: add list of all call-states
Date: Sun, 17 Jan 2021 00:46:47 +0300
Message-Id: <20210116214705.822267-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cce1e87f-76b6-4348-7133-08d8ba685c38
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2033EADCCC43FE511B695702C1A60@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EZDHaGQAD5Ht1ZRIRlNC+pgFTAB/+MkGSpaBy0yAgNJt549HL3kB81aW6iGFk+CIm2t1byTbClVRAW9JgZhrPsz8DmMRRT5AW3Aqnhin/+b2GMbvtlD8/KuiPlbZw0qfok2Rnrc1Bpg74WqN+81RKpJ49WWLqlUZkbqhrPKH42ZsAHpjnoFNQfLvYQNV51IjmZiL8L26tPCUT2zNpJ0VUmce6YV2kMOuLvtfYtsvQbyLGqDyMIP7aoJBJA8zyZBCvdJ/An5a8nRNOwBeqvhheVxRHPlc+oU2t3US+52N85GL3X1cMb5UT+05AXRUwnu/MpK44j638q6UyaFpoalZpVi3DGNK+oVRasGCwzJmrG83MG9qLZCqgeU/FzX3sIOfowibp57wNzF7gY1K04R0Cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6506007)(8676002)(1076003)(186003)(16526019)(5660300002)(6486002)(6916009)(36756003)(316002)(8936002)(107886003)(4326008)(478600001)(86362001)(6512007)(2616005)(956004)(2906002)(26005)(66476007)(66556008)(66946007)(83380400001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?W5JAnsOksT5WaJ+GMplVuKgfXnQDHQ/aJsG57V/EKJIy0BT/6sCTTPjrMOgv?=
 =?us-ascii?Q?qtx0Jf8vmAOZENMe4zEmurd0XbIbB+4/O1MboEgtDAkGG0nv0Dksml2/u/km?=
 =?us-ascii?Q?Ul9kVN6yTlooMYa7iXkc30LJylKeS80JH3Wjw1HLXt5b4vfGNZXVqaIF/ywn?=
 =?us-ascii?Q?xhnHUqntNm9B+sG9b2GHa0DzhnKqTI4xvbZLLHTdIko5TOAg4zUvzZgseqU/?=
 =?us-ascii?Q?vW7tUnjJ0H82cQKK0uRK5TCNtmDuPuPbZ6PyMWQVjBglaXWSNB4zJeP9E5qd?=
 =?us-ascii?Q?/YKvVQtL1YK+yNzijjZkJ0Tx3iDDuvRC4K1ZGtThUur1B2/Vp+0UWqzGkWmT?=
 =?us-ascii?Q?yvwSQs2AtbGjBRUVxaj4yOhUGH3mxq76nvA4Tghg4f+Lc8PeGoapQtiQMaff?=
 =?us-ascii?Q?G57+/GYV4qsOXW1EVu3lvkpBrPN+J1ErMafJHmW1woy93WH5apZd+kjpPcet?=
 =?us-ascii?Q?E0cNQsDL4x7m5ZXZNaHlNqZHsqzcwH3VpNWZyUq/vzCJq3PNnYfSkNVDiYct?=
 =?us-ascii?Q?7Hz9KmCz5hMyOmlVWwnzhCYMrX12l3+hhhHDeYwYlzwlVdCo3tvW+Rc7sy9v?=
 =?us-ascii?Q?YaUxXRfTUWbtdnP+sCi4pUrfiiON6/o/E5olQwPq3ziaygKK9+U4LPsCaMoG?=
 =?us-ascii?Q?YQglRCCR6dSXeVWxXerlgYcV0Htxp7781mD/yNNqPx3c6cdNJPXG0y0i62er?=
 =?us-ascii?Q?vF1zAztjcdLncvxZFLdZ0ivbBW8Xhkam4GCB0tvCwzArZ3xzxI40vva8OGeT?=
 =?us-ascii?Q?r4l6uOwou6vomGXtuQ/DCK8xFdqd62a3iCg1162MO777cTIZUaALcVaRKUfg?=
 =?us-ascii?Q?z8fY09wMcnfIKfbZfH+ohZU7M7h8V5fl/ps5YXKIref3wlaIr4/svcLtBUAK?=
 =?us-ascii?Q?eC1aQAPuu1QEIOVz2T3OSedyWsii+7iuDKtSk2NNbL8X0cLUYkUjAZ5o3EEr?=
 =?us-ascii?Q?FCX2T0XKc1imOM2vnOynCG/85+vhGbVgiiwgs/ajwjYi8RKzGcvF85tuh+5e?=
 =?us-ascii?Q?bCI7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce1e87f-76b6-4348-7133-08d8ba685c38
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:46.1618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cr89tX3+4K++cs/IOUnwmQJGQx/O1DEbd/svJdGZChB39AZAMavHca4bVJf4coZAfItrfWZXpk2ADOOhwYdicVpOQc2YlbJbJtG9xakUo30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.22.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It simplifies debugging.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/block-copy.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 35213bd832..6bf1735b93 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -42,6 +42,9 @@ typedef struct BlockCopyCallState {
     /* Coroutine where async block-copy is running */
     Coroutine *co;
 
+    /* To reference all call states from BlockCopyState */
+    QLIST_ENTRY(BlockCopyCallState) list;
+
     /* State */
     int ret;
     bool finished;
@@ -81,7 +84,8 @@ typedef struct BlockCopyState {
     bool use_copy_range;
     int64_t copy_size;
     uint64_t len;
-    QLIST_HEAD(, BlockCopyTask) tasks;
+    QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
+    QLIST_HEAD(, BlockCopyCallState) calls;
 
     BdrvRequestFlags write_flags;
 
@@ -282,6 +286,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     }
 
     QLIST_INIT(&s->tasks);
+    QLIST_INIT(&s->calls);
 
     return s;
 }
@@ -669,6 +674,8 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 {
     int ret;
 
+    QLIST_INSERT_HEAD(&call_state->s->calls, call_state, list);
+
     do {
         ret = block_copy_dirty_clusters(call_state);
 
@@ -694,6 +701,8 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
         call_state->cb(call_state->cb_opaque);
     }
 
+    QLIST_REMOVE(call_state, list);
+
     return ret;
 }
 
-- 
2.29.2


