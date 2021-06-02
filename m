Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A48398A51
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:22:07 +0200 (CEST)
Received: from localhost ([::1]:40334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQow-0002Yf-UC
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfQ-00014w-Ap; Wed, 02 Jun 2021 09:12:16 -0400
Received: from mail-eopbgr130102.outbound.protection.outlook.com
 ([40.107.13.102]:43141 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfM-0003M9-4X; Wed, 02 Jun 2021 09:12:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UU1LEfW+d0fSiU55H+ZluVtMkDN+y6jIbl8b/DREPUBEyEjRHtXL/EK45WjQrV3qohGRUfAWk5aUbc7pVSvDVFKLzlbQVH12xuLg3+lMd+CuoiWdTdVZ6nGX7rRJyICLxJGYtpZEPjnhAScJhgECgNzmCJsduKhfpC0hxdaXEm3N3aj36PwbunNIV53nQiZXr6fcfp0pAbqAoYJ7KYTksJEHtSYA25x8PZhMzYBXyAaQfgs61XbaGqPdK9616TXn4qGDyKOgqc0VFG2Y52zejXUHtQApI/d4NPPvtTvB49yXI7b0+1/Dqt9uv2Jr/liFejv+mmAdYvhiBskotjCp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=bm/0mVtV+rsuzdMTxwdUcSy0s0zxuLHhFD0EwGxvfeYxzVrI3tDr6Lw5cN+eZetHSpvA/F4y5ks0jgHfIDgXb5Ux7GNbH/sBFJaFc3YIsLiK0mSb4do3ioYngersPzlel8uMOoNstPGFe1O1m1c/7KXP4ums+ehQ+q7JcPTRdl/HjA1ydvyh/pdnbIlkX8TTi0ChQWCUkxycEXAJkLZg4Bihf/dH/upCvnDR2p8boZbLn1lNmVdsEke4CeqrA9jRtKZMFM+u+xYTVbAa09V43ZZWfpBw8evPVR4pZea/yTIvnn11JGgYn6iAX4h2ve1xL2c5s6RW44gOzIh4s02eUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=hQe3jl0Ic6ZPIz0t0cuUsvzOecrBi8pMJu+K2cAMcfD/InYko1XwwzISxcGUXVnwmaB792Dt11AJ6fSK0azX2UNKBQ/D3xlTRsYk/zw1Zit1RuEwxiuur6zdRCfiqTdCMMkVNRNBYiI1h2M6FeVICxpIaJcIP3FStc8qU1ev858=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:11:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 18/35] block/copy-before-write: cbw_init(): use file child
 after attaching
Date: Wed,  2 Jun 2021 16:10:51 +0300
Message-Id: <20210602131108.74979-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2d10b31-c3e6-42f3-9a9b-08d925c7fc48
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6693FF9BCC85F9A03195FB83C13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sj74WamsOE2bBuHNsUkQ8smpzAQN4VDQdFs94sgDOZZ9wR7rlvw3k+GVUQFZ6HnzkC+m0/TOlY43P0llP4O7pa7UxAeRjUOZGQD8ep4yRFsA3xvnFiw2+68cUMbqt+CpkZgptWRZbtioDyVkWhuxRCK7ncZiB4FrGn2Un2cRer7i/BhV4qm9xRZ2sPWOFigkV6dIZ2e9RnrU6nl10rsOV8Mldg60vZ3644Wy5R+B+t1jNX3lgb8h2tfqCgh4qeFn8ox8vHWQLoAqMjTCFaLCEqoX4kkKLInb7w0SH+Gr4PPRVPN6eTF4nKeZOPFVOH6vi/boM2DXxR4aOMKSmcIdRnTLMN476g/8I0oFRsRRiAXwPvH+GaRXAcuu0wZX0NY0dP+J3wrBJL3y6+NhZhDU2WGo+SOfi8UU/uthVyuFv4mJRjhYicDfS2RfAYR/XnbIqwIde0qXSIYFRNh4b8+JX2RYwiyIKS7UMOFtC5DhAoWuP8I/Q0U/l7BU0W4+V9NvEtU5r6jqPHE+nOeF4D1d8baDLaMYKMUknn43/KRPtOuX5bGRUvpvdIRn2xegC5gxcS9WpWW29Qw6yYjnb/uDpi62g7fLyBRyynqJpb9oEv3jXnj5yrnu5CMOjG5gPENakSrC7Jtr9xUZX696lKi1jLBD0Irnq9Fj1gBe8pGxF0MdLG6CwZa/xt2dqc1v8z+G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?K2kDyGr6VBZ/VTtVAKDpNu8mbn2dyQm8UXIm01thUeDqG5I4b5vRB35lboKz?=
 =?us-ascii?Q?OEsb4kZBehNhcknlaDgrwJbWka85JjNfd1GuOsWCiJ4PjCuh0Y6oGMFzW83H?=
 =?us-ascii?Q?0UBjK1einqBlVzrwxGafgRdSYISldhQar3+Brm3EZNNnQBqnWV12KGJiB9Yz?=
 =?us-ascii?Q?nLSJlW23a9AMc+P+jRTt7nTSvyJ+wt5y0vBYLbThjuvn+Kjm1lXb8HngWcRx?=
 =?us-ascii?Q?ofzno6ENGobJeuH8/EaBJXVt/4eM5Z0vJp9bSuolqIDSuC8nKXwS1ShsVsuC?=
 =?us-ascii?Q?UtCKOox/9I+Ml0+JKn81ckzww+i8jxCEOVuxuk64QRUwvEUfDqBQDOWn6+Im?=
 =?us-ascii?Q?vx0t3FRdgX5MipoT4lFZIqiH8xd0ZvAjhL9zzNyAtCkL2f+mvY4he3tqL4Cg?=
 =?us-ascii?Q?xT68UzR1RAMaafaaSfMcbczvbplnPzh7MareQjARQ4f8Fun0MfxJg/clC8My?=
 =?us-ascii?Q?G1vt3t1oGZrZf/1HX0YxG/kZ+28L2xMCqjwYnQbY1FRL6Gv98HhAm1JoshL/?=
 =?us-ascii?Q?ciHJCPfnTC3awmdjfeaWQ0jACbB+ucHfzvJbeQELHQF2v/MnsKaFSBhZxedq?=
 =?us-ascii?Q?IOYztVMC2lC0refBDlgUAYbCi6m1shSYXWSltulS2CZsKXK5NidnXnGfKRx6?=
 =?us-ascii?Q?9ewXG54g4B498/q/0UbmefKnzA30+y3XjPTUA1JvCsjHusTz1eE9MvhJIM7L?=
 =?us-ascii?Q?fJ1h1alsSrPfTuSQpI5OEsp8YL9FPH0C08gFwaUONd8/5nzB8U4lI9rYe54t?=
 =?us-ascii?Q?anq/hrlVk9cqU/uhdsPA6FX+QSqkxvIjwM7sXPEGzOEz8AA2f6jxhygNkiCa?=
 =?us-ascii?Q?2flokwFgVqoo2quN/63SpG5OBOXd579lX2Baf0OsKNUYnm1e5TZLsYAxzAyR?=
 =?us-ascii?Q?ZpUYqv+QmFHwr5BSX2ajB90owDD2HGzkX06K9ZGkaLwJe8yybYJ6MMgICJ4p?=
 =?us-ascii?Q?yM83I3vDqDshtqNdYtuZuYFTkj7DHD1lnsRS4SFhusTbPARWD1NuTtvTcaas?=
 =?us-ascii?Q?CAr/VH4jQIi58RnRnCquRtk+4e1aHwoX5DMZHlDegqA2duN222wOny+uJ93r?=
 =?us-ascii?Q?eh9v2pM+okNoYUBsh6+KuCdsqwU6yNBS4k6J9YgOOMpRHHdUftVcAnPkmOVm?=
 =?us-ascii?Q?2Mvgao1SY+sz9mBQPKFjCcn0FWKHgJvuFEHobpTZi8HbPIomHCFUqfM92avL?=
 =?us-ascii?Q?ZzyIi3ZkF+P0qswLdAgh8pUPPJznH0SybPIIvleroEhlT2FkwEF85ReaRYbm?=
 =?us-ascii?Q?kT/BPA5QN0Hqao/wVvjIRDKj49+2ixmtkmPLWlzuwOU8ifb/AAMAfDHL4Xa5?=
 =?us-ascii?Q?EJ//6KKNpxNfwUlte7/sw2jn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d10b31-c3e6-42f3-9a9b-08d925c7fc48
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:51.2037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lonMUf++mRoZ+sJx99ebTru7hBRvROE0nPbdbx7a+95lfzxGwKOnLN5JI4nKw5Mubym4w2Lxf5ZpjyGOiumyFtgFVnnC0h36xVV2DzdeHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.13.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

In the next commit we'll get rid of source argument of cbw_init().
Prepare to it now, to make next commit simpler: move the code block
that uses source below attaching the child and use bs->file->bs instead
of source variable.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index d7f1833efa..4858dcf8ff 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -149,13 +149,6 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    bs->total_sectors = source->total_sectors;
-    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-            (BDRV_REQ_FUA & source->supported_write_flags);
-    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
-            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
-             source->supported_zero_flags);
-
     bdrv_ref(target);
     s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
                                   BDRV_CHILD_DATA, errp);
@@ -173,6 +166,13 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
         return -EINVAL;
     }
 
+    bs->total_sectors = bs->file->bs->total_sectors;
+    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+            (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
+    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
+             bs->file->bs->supported_zero_flags);
+
     s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
-- 
2.29.2


