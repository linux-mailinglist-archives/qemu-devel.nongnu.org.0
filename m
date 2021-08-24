Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6153E3F5A38
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:54:08 +0200 (CEST)
Received: from localhost ([::1]:42052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISC7-0002Il-6d
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyM-0002qc-8l; Tue, 24 Aug 2021 04:39:54 -0400
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:13121 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyJ-0007US-Jc; Tue, 24 Aug 2021 04:39:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfN0/6XlVpOeJf98BOnCuMAX3HqXKm9jeMxhnbZk+U6kRSNu0T24VwkVP8O1wjP8AKYG9UtNs1sltaFejq4+O6k473EuLX6Uqt9L7+4/3QsVYfwMOCgk7fdQ+mCwGr8oImAW1XbBQAZwywOitTSK2b4UoAaEh2orEB4mYH4eOqcnzDqKHdQ7c7JI15UDjlNpI1fTgVOzYyaceeehusbjRYExcJHmkJfS6ufQsTTlmOz25qQvSUEU0gTKZpsbM1qLJk5+MJCpw0m+52GwIxjg4X40+RB6tXJ7CMIInRxmx853R291N9PLPzG5iIEY+kR93HdVAlixc8TC6hESkFmFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=Buy9W5Puw0ZoI75yVKpx4duHxe1f8Z7YVJQvfmtibnqcPF1PiTtm/dGdMnETOuspSQMrj1+KPfAPkrIJhumEv2ct+YzL6IDebbS+SMJ7NE5VeuU+vjZ3Sa8TSdFCIFXQg6Gy6DUQ658xEDllPDQOYAVynK1lVHOVDvdQDsnTlKsw8bPiVluJmd3fvz1FSzEcY98nJtU2KCRnNfpAzQWIOEu31nN7B1m2+xBEM6YsvRNC3RC2ezjpBGc9uBFrlAURz6QSF1RD5I9AgTeLQv6KPjlQxZnHAQYecx2vewTMtzYb+ADcIQu/mRrPfaHZdwoWmjS86AWe2/ee0d9GdETJdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=Zeaw2U02bS12aDoBJwJQq4JrEURU+U9yIWuFNqcrAaaCoNEsuVGXLRyNJDBxW+I3R1STdjUfjrBGUDWACMb1V1Q4Fx0giWVehBP8uZjiGd3HI0hrp22+FLl+easCp3egbvQ46OwT9kGF72MBfVahI+3gfwIC/bN7M4d1KOPQ5NM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 16/34] block/copy-before-write: cbw_init(): use file child
 after attaching
Date: Tue, 24 Aug 2021 11:38:38 +0300
Message-Id: <20210824083856.17408-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24e88b88-087b-42b6-0eb6-08d966dab63e
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5333603DF779861588D66BDCC1C59@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z7mk1FQFA5//cLNvjeVKKXPInvUiUF1A7WqF1eU8NbiZ50Ehgul2cPUKC//PaGGwYODYvoS87L6piQIHtZ+sBciK+Jr7t6NWsCsUw5Zc+qm0IUH0Rg0I/KQoYHWAY480yAApOcg6GcW20H2zO+XpIGRpwrVZkgVSCz2ngHKTOgbuP0fePa+FNXrAkGB8ZtFKBIscI+WnnkI53kHOOCGG2/OsMT5VuhTHf1G1/l4nfpiu8Ypyj3CmS9G+ZQ+pzMxFKbs9Q663K2G6IMMZqfW878F7Oghk0yCpgeJMmMay99nYICvjc8bE3BFXfho+qcNS/Y4E17wP8ebzADNw8Lly5V5oLUO/dswlGq9Bsl1gp9k4PvlUSUkWH1g/IyDVpRRqSO7G5pwMttjhj+ZqQr9SdqpzpG7XXfEOO9ojwk7rQ575SUzftMgpKdn2Gs6N/2fO9tSqM+0icMxNbpy/MJ5JQV4gg70gQ6W0v9969xIDFt5+aPuFtkv/bm2Q4wO9Cl3JmUc1NBOWhWTWKOcE6G7Ivp7OCEGD/hdR2pQmf7iic19q6bR16maYMQpid72XhBaKmVlrg6xVDVsW2Xc9Q2aVATI98tibDcGv4xrZiN2eOkPBaa1pA+p+h4W3l9RullH7qIqyFpRuSPFRpEV4c87w28BTw9v7JNnWincTQLReol2a1efPczX5kZ0lRdfkRA2UuuINPZoTSHTm08q8w1pSPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(38100700002)(8676002)(4326008)(86362001)(52116002)(38350700002)(83380400001)(7416002)(8936002)(6916009)(5660300002)(478600001)(26005)(1076003)(6506007)(6512007)(186003)(2616005)(66556008)(36756003)(66476007)(66946007)(956004)(316002)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aYxu7/uCo8aAGy53AivZ3bk2d2OKHpOcgOimc9WjteSwLZmiZSmk9PdcpxGp?=
 =?us-ascii?Q?HnAVXbDCNXyi9Ng50XfW0DdO9xizxn9ORWYCX/Dj/S8TKzfAQwdmnxTGhFFv?=
 =?us-ascii?Q?je9vdE27gGDeaSMFttmhSPS0vJScpRKJDCHZ2KI5N11jgwj3IXmkTLJ3wiqJ?=
 =?us-ascii?Q?igAPAFkiPzRSH4+byz4S4IreXHYPzWf3jTTCbw//htWh5pqG0Y2hUYZYHBhS?=
 =?us-ascii?Q?Z7bZrHVNk02pwRGfdA/4su5bI/NZQ8hsqeF9gcO9PvorV01i8r+HwD5Ho9jZ?=
 =?us-ascii?Q?qI3f6fhBI2R4oX87I2pKcNwF98oZ65FOZha8PkkCHi9pk7Kff+tPMAOp5skn?=
 =?us-ascii?Q?wYUiFgm2nGR5oARZRs1KEZ2XfNMIVuABLfrgS68JPs0G6FKfpQVjfBLWmqNj?=
 =?us-ascii?Q?9bOVdRqibNkzJmvsqCzMfPYJJqKW/ppFPvOwF/LX1BtCxYGkALw7LD3oNrv2?=
 =?us-ascii?Q?GhFCBtOkxP9fixG4sY2i8ctgaq9DbAIXd8bvBBDBncj0gb0rS1l9wu5KLWwS?=
 =?us-ascii?Q?ztEzdmR+dvcWZNVRQmTr1Zpwdfkzu5s85Re3m0lgmWG6bZpO0MBlbKglf8ZK?=
 =?us-ascii?Q?alsJnLnYm81yvxRRin7dYmrWBI7PNwELB3CChRVq7okJ/WKQ9mJzmtVc9JZL?=
 =?us-ascii?Q?E/kvidbpkSvKTYRbhvFCm5NJz0Lwa8PSKpd1r7MxKc3xzqYxpduq2czW6bUx?=
 =?us-ascii?Q?vVQ3zGD+Uwkr7/KPA76wpjgfTRZEHpqp2x3n+vG0kVc1ZD/r/iXLdhWH5SoC?=
 =?us-ascii?Q?DvEdk7tVVYcIowkUTV2zJWmtgovny8AgBjUNc7me+X5VFn1YiKRT0ZO7rEnb?=
 =?us-ascii?Q?GwBGEd/IfN+7e0o8zEHjVr4S65f7FBuWhp5x7OFKXnWbaGW1P6fUGUvj8QcO?=
 =?us-ascii?Q?SN/bp+36ukugVtVoXeS2ze/kgopQYxTkPYHHM7fnox7NrUKvmRLrYUOOxks1?=
 =?us-ascii?Q?Az/D9KcVY4OT0Fcb184Oqv2nQsZKPJ0WfciF0scZNc2eJyvF2TuuG3McWRTT?=
 =?us-ascii?Q?D837DkwtONc1Z+7ALJZBnGlEGT7vqqmMwY8MERTtNgxM3aP3Gt16waThBFHv?=
 =?us-ascii?Q?g2sfm6EmE4df179B2lXnqNKRBam/7ckd4EwflwZj5wF6ksCPcs6XSRAtlWjC?=
 =?us-ascii?Q?LvExmNW6WzXgCJu29JqgVFPdIO5KESTgahj4gyZAcOn42ROAq8lSuEMR+fNp?=
 =?us-ascii?Q?aTh5+nl7IYewNsHWIr5DZe/J202rmdI2WtuGvSGHD213JXz8hwipOj4dvQxi?=
 =?us-ascii?Q?dIp8nHcHzrFZ6g5aaw4oklBdU7AeuMjQgJVQfLaplGPkmhKmFygbVsJBUIF8?=
 =?us-ascii?Q?NzVW2gSmi7lkn+U01BemUIAN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e88b88-087b-42b6-0eb6-08d966dab63e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:39.7613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfsRsJAdBfPPkjhEWT0irt+GBB5uBIFHrJ5vz8Jw1ZtOqKuu0uXJp6SMeRpCQQCCIcHHPw52Cj2Csa2LChgbCAxvvC6PKuhZWgaFcOscfJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.20.134;
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


