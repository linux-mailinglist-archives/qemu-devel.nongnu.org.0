Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E3F33F3C9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:03:44 +0100 (CET)
Received: from localhost ([::1]:46444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXi3-0007xU-ER
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIE-0005AY-0e; Wed, 17 Mar 2021 10:37:02 -0400
Received: from mail-db8eur05on2106.outbound.protection.outlook.com
 ([40.107.20.106]:39072 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI5-0007Ew-MJ; Wed, 17 Mar 2021 10:37:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QN4ag6TIGkmTaoaJNm/rLw8rE3s6mD9lu8/SdbsQVo1Gs6qz7c97dOo1EH9s+N9f5wx/wSXBB0/EKrVqOHQELdcsxK30aTQgdEA89oV6cKs8eKJ01smldTz3wEFB/OK7i2AsiA8wsru6NC4r/7EYVe4VZsa3JOC8CnMOLV0WQa5ikzLDOHBwb4+CKJroiaROJouwa9CLtUlkvvEUE4/LZnjAALSz+8k2j888HLE1VqheZtfdW1Edhvh3f4FZPuhmbOYAzPOxP0O6YNkqy3sANlXgewbLqXYeBnzqHu+S2zxzAeWLK42GDDltRX5WawbeSr/bK+5VAL6gU0PBctl3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Khf4uu4m3sGzA1YESu49VBYhoIrICHcfWORP9DnyklE=;
 b=ndPsrQIKbcR3oKBl/4AVYkItbiTwNRoWJ/0IIRQh4V30PIRy0INudwmUY5a3yDpGsTDtVskMLZPd79YH0oeo5Hts/C4Et3nxblC3O75XgXSJSoS7ECrwVFuFbTHZYFVXagCtZQgBZPwHhvTmv9sB0U68SbdX/G+wyp6r7M5VFQlmQHuVp5gQjk3XwpFF1UqgOeFga5f2XzsOxy0SlbD6AEUyAaqchzE7nt64jQQJSOWrz9iGeKvO2nSVHwORGscDZWzh40JtSJ/cFS2zT0MGM9LyT0oslULysibxSreaucJ0BUYzWyIap8lZ+iLnjtjD5lW4xRqfWuOkCuhLD7MhYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Khf4uu4m3sGzA1YESu49VBYhoIrICHcfWORP9DnyklE=;
 b=jLh1YizkCoSoOeh/ssL9+dCyr0/Zg7RBei06DpSKwcxT7LJOcajGyecwsbiccMi6pS8cagdz3ES353DYKgQIkjy2/cywHDe08m8k+Vl1JRH1DXcmJMPa0e/npyozsfXNJhN7f7vebFsQrbvQrgCZltSuSRV0ZQuuiQqYPKYIZWg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 26/36] block: make bdrv_unset_inherits_from to be a
 transaction action
Date: Wed, 17 Mar 2021 17:35:19 +0300
Message-Id: <20210317143529.615584-27-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c456bd9-d97a-4197-a985-08d8e952140f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6216959215D0841F6E4CA8DCC16A9@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:49;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qxVLWjFATSzQpd+QOpBTYa9UpcRsb/kXyYizMVnX+qF41QjM0xhOmFJgJeBGtjjfuQ0rvMp3Ihwxd5hHHO606te6v2huUTsdpY/3PvNI+8TPWqph1sa1aGbIWxbDXmFlqEvT8BI8xVk1yYq/ol7xH5ZGG8Ba/Vt+l6JkenMncWY4erXGwfNxXGB5PJSh3eCQSyjJ0m89VjgGJ9K50IFJXDkntoawqLBs7HimgMq2f6aN8nYY0y4zMDUMQHzeDuJXCoFeiN3ZiMKupqwrufqClVr9Q1c3/22V2MgVvr3HOcMZ3giRuzXSiL/Zr2rrCbi6r6pctAp4CvH4fZ2ptJRuAgQjUQRXiSHnYZiuv18Yjg0OWOgYDx1mfpD+lTSfHoG1JIesHVyNeKc0EJw1YwL3uUfURDTr9tcFa3dXNXp1XcWJt0ua1ZLfuyoTeRkEf+S8W6jsY/89w0stZby6CoI7GzQysfw+YZQItzsovV2AQQgkQaPEfvZlrz+LFMtw/NDDZ6HUrZ5VptPKDpAGOkwV6JrFKf+Rl9h/qp45HcFZqskiFdDK8fTQDsZkMF38ihZUlUL1bS+5er7kFgMWdi2jBaVSlwznbrUNyabpVEAMujptgBqyzd1MjGjtZPvPy7PK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39840400004)(136003)(6916009)(83380400001)(316002)(2616005)(66946007)(6512007)(66556008)(8676002)(956004)(26005)(1076003)(16526019)(6486002)(186003)(4326008)(36756003)(8936002)(2906002)(6666004)(5660300002)(478600001)(86362001)(66476007)(6506007)(52116002)(69590400012);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?X69UvH1Ti6f/XMlgxV6hDTyyx8NEU9U/9JE5yAyT16Y2uS/05vmJdqMzeZsg?=
 =?us-ascii?Q?Nkqc5tG7UYDe6mmS6h6fLvu4Fl3GMktRzvy/VcMmY2w94qN5nvT9wPNFm0+h?=
 =?us-ascii?Q?Sf5hbDN/JDBeWnc4/Jeb9qR4MchtIslzMcBZhq/DUxmt7ijS2Sgt74vTOOYg?=
 =?us-ascii?Q?72Bm4IkTbMF34HjZx59fxwa7MYjH4X0vq68VcjIReDFyoRiFK5xAyIOOlMqQ?=
 =?us-ascii?Q?0FDoS8iyKFDqvrG/EPbSWSiiHeCComHJQKyYDD34+qLjDBXlIpkD9P9fJKHe?=
 =?us-ascii?Q?bzLJNPnBe6qIKyC871YGl4uViSCpgPoIrVf8YS2H+qs3KgqGetH32duNr/xM?=
 =?us-ascii?Q?QT9zflH0GDqJBUPeOZg51e1dQUxI5CHrrFgtMDVDQmFzOL9YWf+PDhIlpef/?=
 =?us-ascii?Q?96ELBQ8mA/AybE3KmeltlQaYdOsz23OKyXCt+GD+2SQmiQmT9JSYOql1ryeP?=
 =?us-ascii?Q?kP9d6Xvco/31PENbyUwVX5/X/x1JCCIes6ioW1nS86H7FrG47oB04VUn/s6l?=
 =?us-ascii?Q?ArV2glTcp7fgOoPiESoiquVC0Eu0bNoqij7Q7AyWs7m3m4J82GW2Qze4IkCI?=
 =?us-ascii?Q?V6Tg/6HDC/oe1QnWPr8KpTkvEh71bfkntJpXRI9QYb3OnNVDwsMWq4+ZAk2N?=
 =?us-ascii?Q?f25rNqZMS2X6UptrDSY02TOzsQHn5/Xk6CW/rUye/LFC29SPV8DihHEEKnS6?=
 =?us-ascii?Q?P4lKLZdjDvuJ6GWHCI540Woxu8yGf5itwKc5cO3igC7jak0jymEh0CTY/Pin?=
 =?us-ascii?Q?LeP7ZXqkqiVk9hANp8kp0TS0h31i5J4Fiy5tUnVxcG4ROp9sGdGPPUN09saH?=
 =?us-ascii?Q?DfHPxAkBfUFCM/D2liNj0LwljRyCawOPypy3DPwTueSvRNMUqtMPhC9T9NGt?=
 =?us-ascii?Q?Lp8RXgNSUvFQPhoTHA3e3AmhQwDH3uCsSVEnh2pUpZH3+Iy5v9qdtb/Gfng+?=
 =?us-ascii?Q?exFoOwrTT7FFsqzNSXATEqGtH1gn2UVM2my5iaHzbOheK0us/d8R8F5PZ99G?=
 =?us-ascii?Q?w82unDSX89DYN5fhGytKcT+zaS1XfolP09V0/ya+NuK8JUhW39+MW4whkDZN?=
 =?us-ascii?Q?+WUivH4yxj3YAjEcGHPRGWv5yl2u0XPUvIrzXyX31DQOIWdFtrLCE2izrY9L?=
 =?us-ascii?Q?kkihALHULap6YefWKloxatC68BYhceLQA3eOWcf/CB1aCj7ro9FwzYHpFNie?=
 =?us-ascii?Q?E/RDWsvRfuDJIK2+P0orCiO0YNVrjlT0hTDZit6d3wpxs2LyIjY2O/S5gBuv?=
 =?us-ascii?Q?vJqm06JriNxXP5gGWCmRT4YnIC9fD+Y2cW69gmPG1bB6/M9KuQGYqtnXOeAv?=
 =?us-ascii?Q?OkUT9/4+Q8+e7d2JOauN/120?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c456bd9-d97a-4197-a985-08d8e952140f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:40.7828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yaGKtw6PU7lNRHkXQZzGrN5X0/GvE2F69Mrkp6xpwrNTx/IC/MifnjPgRyi5MD6Q1xVvERTJZFny50iGi5h6O0XGK9nn0ezLGD1myviUKv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.20.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

To be used in the further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 46 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 922df82952..3b9681a738 100644
--- a/block.c
+++ b/block.c
@@ -3170,11 +3170,49 @@ void bdrv_root_unref_child(BdrvChild *child)
     bdrv_unref(child_bs);
 }
 
+typedef struct BdrvSetInheritsFrom {
+    BlockDriverState *bs;
+    BlockDriverState *old_inherits_from;
+} BdrvSetInheritsFrom;
+
+static void bdrv_set_inherits_from_abort(void *opaque)
+{
+    BdrvSetInheritsFrom *s = opaque;
+
+    s->bs->inherits_from = s->old_inherits_from;
+}
+
+static TransactionActionDrv bdrv_set_inherits_from_drv = {
+    .abort = bdrv_set_inherits_from_abort,
+    .clean = g_free,
+};
+
+/* @tran is allowed to be NULL. In this case no rollback is possible */
+static void bdrv_set_inherits_from(BlockDriverState *bs,
+                                   BlockDriverState *new_inherits_from,
+                                   Transaction *tran)
+{
+    if (tran) {
+        BdrvSetInheritsFrom *s = g_new(BdrvSetInheritsFrom, 1);
+
+        *s = (BdrvSetInheritsFrom) {
+            .bs = bs,
+            .old_inherits_from = bs->inherits_from,
+        };
+
+        tran_add(tran, &bdrv_set_inherits_from_drv, s);
+    }
+
+    bs->inherits_from = new_inherits_from;
+}
+
 /**
  * Clear all inherits_from pointers from children and grandchildren of
  * @root that point to @root, where necessary.
+ * @tran is allowed to be NULL. In this case no rollback is possible
  */
-static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child)
+static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
+                                     Transaction *tran)
 {
     BdrvChild *c;
 
@@ -3189,12 +3227,12 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child)
             }
         }
         if (c == NULL) {
-            child->bs->inherits_from = NULL;
+            bdrv_set_inherits_from(child->bs, NULL, tran);
         }
     }
 
     QLIST_FOREACH(c, &child->bs->children, next) {
-        bdrv_unset_inherits_from(root, c);
+        bdrv_unset_inherits_from(root, c, tran);
     }
 }
 
@@ -3205,7 +3243,7 @@ void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
         return;
     }
 
-    bdrv_unset_inherits_from(parent, child);
+    bdrv_unset_inherits_from(parent, child, NULL);
     bdrv_root_unref_child(child);
 }
 
-- 
2.29.2


