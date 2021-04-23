Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C21369C3B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:50:40 +0200 (CEST)
Received: from localhost ([::1]:45312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3h9-0006qB-Ok
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xp-00054o-4k; Fri, 23 Apr 2021 17:41:01 -0400
Received: from mail-eopbgr10127.outbound.protection.outlook.com
 ([40.107.1.127]:4578 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xn-0002m3-5d; Fri, 23 Apr 2021 17:41:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocOGPggbfTqLV6JI9IGTea8hQvSFWpRHKBPnFztarbNyRZNX4nMz6INv3qvelsDAraogI3cLA6l2T8mdYlnTNj2D0thBou0zpwdcss4XqtnhcuL9iq4J6DZt+t26rvoKRX8i9v0kU5v6oGq8M4bMhnU0M7FSB3kcSidcIazvSWQQKRgjuCb9auz3Iv7mXyVhqtJ9Pg/GS/gHGh7z0teAJa/NYHdMUxsl3xp9qPktNebhxfawpNez9/SGel2N08+uS+I9Xl3ZXY3ksi41iBpopH+uqhW1Mo5NFUU3fhsUHoJoaRfLv88Z42JyWChFOzpOToe+j9H74SlEUIgvBBY5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMChjD739QMrUMm1Mr3NzNtwTiX2w76KyRY/366ZKRk=;
 b=jqeBTq814I0+BPoE6Fh3OYstp5WPCrergVqktclqEG02do/Fx9KRbHfO49eD+6SPZvtF6Qeqq8ZWhJEgYJCyQosRhKmiirfp+f7QW1FXR2rzMKIjCyNOROGj5D9tznAbS1pvqyVGUVDRGPJ80Olq5SvbUZA24zUFaBT66E4Q6vm4NzvzS3LGvs6ge0hXctzLTtpHVbVRlqoqMPXuCYn2ZYSNkKhxoPVVM1FqljoW9WG2APZ6ObrURsR1LJYjltMOM5lKy7AnVcerNGpG5dzDP1JOZQG5EbhXEM4q70ExuwWRsulHDHDVyguv7tImdT6TaajPEWkQXPKna7rIOVp1DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMChjD739QMrUMm1Mr3NzNtwTiX2w76KyRY/366ZKRk=;
 b=sE1tmAVvk2MFdi3j3bDWlZZwuua8/qqaIBQrZG1XkItHp4gOrO9JU81YP+l9SzzIPJ8DR1smKDGrB/f5CJGpZ80BTf+x4OPeoSPvEOCy9OQNPNwSMOIE/WBCZVBMoY78bxjV+m0fDxVwbZw3xYYeS1h1FVihklRlSeRnMS71/aY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 21:40:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 21:40:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 philmd@redhat.com
Subject: [PATCH 02/11] block-coroutine-wrapper: support BlockBackend first
 argument
Date: Sat, 24 Apr 2021 00:40:24 +0300
Message-Id: <20210423214033.474034-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210423214033.474034-1-vsementsov@virtuozzo.com>
References: <20210423214033.474034-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 21:40:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19dbf302-a582-45b2-1218-08d906a07736
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6374188FBA75DDAD323CB759C1459@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0dFLJngvP1PM7Jr98ZnkmN1J0Eit5bPsl0sW3CwBPwJTcL3+hchF1XW30EkPl/zYdFcwSPlDEIoL8f8eQcU1dqTIBkMOaXBY4pDrX+YleAO9gkI1/AIvQJdsq8FUzg3/C6StR+rxEwz8tWeFva4SCGB/GyjR3NmerC6XdBgmyU1lOfjGN3kA7vcQq8ybpXVi98CWQ3pEGI2jagbrCb31uvBQF/Om6qdMa6WCArOi+MliR/EYxhlkyXsjcn/ONdtR8gq8Z6xCxbA/e3d/OSTQj2UXLshE95z2TEHxIvLVuumki26EMvu5++3mK8p6MLTydUeleaYr+GgyGb93OtY17jPSeRXvkatvhycuJNnY4oTgW/dRV2CvIXkX01A0PWUVz7xfi83bLMm2x5plxO1KuFMnNt0fspnz/hGi++Xm8wl8EwSy1fk38q7BdtSKNIKKGZCR+MQkII2X+VFkqxt1jygFRfNbn8R+Y9et5c7zKCD27K0c66eMLxoXEELL2vMsOgIbSLTjtpC7grnKKV8O1VosTe1KypkyYPqQtrb3+/Sn/+Sp8cP0ARidbaRbP9uwD1u/t1PyQdizKCvhvjhMtPJZps6AYQwlaDXMjnmKWzQNspaujRhA8+sngUNp3X3+LkxCgMnRDEs1Oju0K4PQb0KGVfbwol2bmgnapvrRBNr3beX63rjiuCreKI93uUHR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39840400004)(346002)(376002)(316002)(2616005)(26005)(956004)(83380400001)(8676002)(4326008)(38100700002)(38350700002)(478600001)(6666004)(5660300002)(86362001)(186003)(6506007)(66476007)(66556008)(1076003)(16526019)(6512007)(6916009)(6486002)(2906002)(52116002)(36756003)(66946007)(8936002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FcU/Ds8LxdrkYebeyv/zgL/t98hnpsTsFyZK8MOKB90jUvdcc5FuXZLdmIN/?=
 =?us-ascii?Q?qY1gBqL7ul4VoVSNq67g2mlPrHxt0VAnGfvJIRudUSBt3CxhdBXARN+KSQLF?=
 =?us-ascii?Q?RQkyantLroJNB+b9rx/wOBAV/esc5uHwStPBplmbxBZ3KsR5rIJbHoyxJXJ0?=
 =?us-ascii?Q?ILu/O8From9s0ZiUjFKENtT1hEDodp5dFVBZ5ia0apdRT7OQDiHqqXYtdeLo?=
 =?us-ascii?Q?dCzHLLxJlL6Zy6zFd41ItktgoBJgv/UkV0D/Hu0FlryNIkqqN3QJpezS17Ty?=
 =?us-ascii?Q?jgseUCd/lT2soHtFc1ExmCTlSlRbOTyWC/7afQqRtGbRndBgF6Ffg7OcQHgQ?=
 =?us-ascii?Q?YeOEHWAIVf4Wkyf9u0DOuz+KROlyexnkfk8Rxg+JHu7fyknh/PXow24JM8il?=
 =?us-ascii?Q?ifvXc3Gp7wde/7MYmSikSgKFKr1F6JpFfi1aueGN7oUfEx4wSXTf1DjkGrEn?=
 =?us-ascii?Q?0Zqdn5Fb+61LdSVd5J31KGAMzH9PflPa/bpn+hgRjVbJmMgmNNtcop1QFVpl?=
 =?us-ascii?Q?zQtYEKWRCgNuaO4v5n5pS1GQYHKhC8OjfpiTlJyGfDrb0e/0CwUzQdV/C/qR?=
 =?us-ascii?Q?gvHjDVuuRFpMv2KRRViudiS5CCmgnn1hwEp6Xit65ejV9rDetTB9rHS3IQA6?=
 =?us-ascii?Q?wU1LzpxY1cJ16CVaGdAxL9EtBmhhJnixAdGpmEPFxgDxHds08kFKcvmWXFFo?=
 =?us-ascii?Q?Ckpz5DOWiGj9rKPI1gYiULO+pQLDKTil9kZ5Z0BmHBRKY+BjMNQdB9BRQ1FW?=
 =?us-ascii?Q?xsjhOXp/uWxwu9c76hbLeN7WUuUCeYiiLzaWUHL8AM9PFu/99pvOtkDbTAIW?=
 =?us-ascii?Q?E65aWyEr23XRyAn8ryswBfmax2GaaJerFlguazxPvHs0jqYx+JLsv3WA1V7s?=
 =?us-ascii?Q?Vq5WGFbHy7PzqNpkSSSEkxLa7yo2dsnc0k/UN2wSkZe2R42rNMQ18aLbl8tO?=
 =?us-ascii?Q?8hG9av0P2ngeClIDrYQA6XNX0hCofKqlxT4g6KpoJmxeRBlS4Fx6dtouiT4k?=
 =?us-ascii?Q?bpgZ6IaB3w4YNHBay7La08DWe/uaQtLYLN6G7oBfkMdiH63VbNyhD8UFkcZa?=
 =?us-ascii?Q?iZAk78y+pxRQbAFKC6jC9qMKoaOKUw68KgasMX2MjXW9jbqiTSWMgHpSbmGT?=
 =?us-ascii?Q?KjUdc+mSBzEKUB7SC8YUAFKf9ImQOxJiB+at9m6Z7l3i+acCu6/9RYA0TKPI?=
 =?us-ascii?Q?509m6vQM+N5mUD0jQASqmTHTLQz/Gx7zN75p/+o35jNRRjyLqw1mGdQ/P4Xr?=
 =?us-ascii?Q?qc3MvTyqehAImoIb1ZMZbrGRLYwnMEYDEtRycph+aNPwTCCRz8oG/jX7DSXV?=
 =?us-ascii?Q?uQ1dTUqKXBqaRFhDwn/JB0oL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19dbf302-a582-45b2-1218-08d906a07736
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 21:40:51.7816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJy0zCW3H089Olw1GxXeQDXhB7HH1Q12zt68pZYDg+Qa9Lo3EQSxvH+S6neekPjYLLem+oqgPiEdLOHAGdW/nfsIx6WGDe0VBgYoeTJkWiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.1.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

We'll need to wrap functions with first argument of BlockBackend *
type. For this let's generalize core function and struct to work with
pure AioContext.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-gen.h                  | 12 ++++++------
 scripts/block-coroutine-wrapper.py | 23 ++++++++++++++++++-----
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/block/block-gen.h b/block/block-gen.h
index f80cf4897d..c1fd3f40de 100644
--- a/block/block-gen.h
+++ b/block/block-gen.h
@@ -29,19 +29,19 @@
 #include "block/block_int.h"
 
 /* Base structure for argument packing structures */
-typedef struct BdrvPollCo {
-    BlockDriverState *bs;
+typedef struct AioPollCo {
+    AioContext *ctx;
     bool in_progress;
     int ret;
     Coroutine *co; /* Keep pointer here for debugging */
-} BdrvPollCo;
+} AioPollCo;
 
-static inline int bdrv_poll_co(BdrvPollCo *s)
+static inline int aio_poll_co(AioPollCo *s)
 {
     assert(!qemu_in_coroutine());
 
-    bdrv_coroutine_enter(s->bs, s->co);
-    BDRV_POLL_WHILE(s->bs, s->in_progress);
+    aio_co_enter(s->ctx, s->co);
+    AIO_WAIT_WHILE(s->ctx, s->in_progress);
 
     return s->ret;
 }
diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 85dbeb9ecf..114a54fcce 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -42,6 +42,8 @@ def gen_header():
 #include "qemu/osdep.h"
 #include "block/coroutines.h"
 #include "block/block-gen.h"
+#include "qemu-io.h"
+#include "sysemu/block-backend.h"
 #include "block/block_int.h"\
 """
 
@@ -100,12 +102,23 @@ def snake_to_camel(func_name: str) -> str:
 def gen_wrapper(func: FuncDecl) -> str:
     assert not '_co_' in func.name
     assert func.return_type == 'int'
-    assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *']
+    assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *',
+                                 'BlockBackend *']
 
     subsystem, subname = func.name.split('_', 1)
 
     name = f'{subsystem}_co_{subname}'
-    bs = 'bs' if func.args[0].type == 'BlockDriverState *' else 'child->bs'
+
+    first_arg_type = func.args[0].type
+    if first_arg_type == 'BlockDriverState *':
+        ctx = 'bdrv_get_aio_context(bs)'
+    elif first_arg_type == 'BdrvChild *':
+        ctx = '(child ? bdrv_get_aio_context(child->bs) : ' \
+            'qemu_get_aio_context())'
+    else:
+        assert first_arg_type == 'BlockBackend *'
+        ctx = '(blk ? blk_get_aio_context(blk) : qemu_get_aio_context())'
+
     struct_name = snake_to_camel(name)
 
     return f"""\
@@ -114,7 +127,7 @@ def gen_wrapper(func: FuncDecl) -> str:
  */
 
 typedef struct {struct_name} {{
-    BdrvPollCo poll_state;
+    AioPollCo poll_state;
 { func.gen_block('    {decl};') }
 }} {struct_name};
 
@@ -134,7 +147,7 @@ def gen_wrapper(func: FuncDecl) -> str:
         return {name}({ func.gen_list('{name}') });
     }} else {{
         {struct_name} s = {{
-            .poll_state.bs = {bs},
+            .poll_state.ctx = {ctx},
             .poll_state.in_progress = true,
 
 { func.gen_block('            .{name} = {name},') }
@@ -142,7 +155,7 @@ def gen_wrapper(func: FuncDecl) -> str:
 
         s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
 
-        return bdrv_poll_co(&s.poll_state);
+        return aio_poll_co(&s.poll_state);
     }}
 }}"""
 
-- 
2.29.2


