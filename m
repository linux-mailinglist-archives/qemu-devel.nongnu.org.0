Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795354C5243
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:48:34 +0100 (CET)
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNkK9-00022P-Iy
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:48:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFZ-0006sC-9x; Fri, 25 Feb 2022 18:43:49 -0500
Received: from [2a01:111:f400:fe0e::72e] (port=3086
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFX-0005gS-Az; Fri, 25 Feb 2022 18:43:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSI9V++zplX03HFl8nZxJ7TOd47tnVP8D5O2CIKzU8xYCgCrzcVolHNrk+0GvViKSCUJ8BBHlGgNZwb21YtA7CNl2stqLU0/XxnYjr76Gcultfo7L1GsRCys5lWeOlot80L6vveUGaKM2xYnnQbOnmxpRJJ+8hLX+RjWKOd57bQ9hYheHeSoTCn6k5g69Le055/E/3Pfzfb3hTNn/E6FPx9Rhs9OWwawruVsHgG4/GJrJ3AHdoT7RlLJ8cLWWDUmgj6PaDRXG4gejYmIS0s2SWyheJuMTxFSGKAdc1OMv8C+r6iQtQEedTCG9tzACJM2XFsKh6UKVMvDE+dOZag3Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAmHzuvr7cTAck8HY5ku8maRymxvp5VpmeTXxb2WcIA=;
 b=QImI78cQ/XpcdqtdxgzWr9xnb5Ec3m0DrHNyrxdqLwFS96y7Zc5ng/uqLn7czzYPwQ4gEP1SddlbiwgmgQQcvmNjM0VRp4spjsnrfyHjnLdUMzVFkUsBhlp2/Wk9Y/XHzejPNyjSXn0vNGj1eeYXleEp3/Noy3g+hzhTIMzziLYRN9Oop0hsNEI0TMR1I3hEiLeQLeBeZjm+sz2SHMLx1iI0D9ZijvuRM1l+Ulbz2jQ7ZQhsevavVmjucrG0hbhxLVnLT9ALPPRbHCmIfrZXPTVt6G6wK3AsvKmXP2x9KrM7Boz7+hvvaColYL5s6hxWYRE7euQADcP4Ps/jLz3rVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAmHzuvr7cTAck8HY5ku8maRymxvp5VpmeTXxb2WcIA=;
 b=DdwG4i1I9pVX3M8LPasMhEIX6drdEDusicHrErvD5/QNR9tb3LDxNhFS7Voj/jFYgkAtaFR7+pmROhVJ6+d3OZWtJEwrPH33vofzR6MKWmYtRwofZjvIthIPJOXFq5D08/N7OMGIyxJWO0G6y8gbeTCpC8aS4lwGPYsldsUOSx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 23:43:41 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Fri, 25 Feb 2022
 23:43:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nshirokovskiy@virtuozzo.com,
 yur@virtuozzo.com, dim@virtuozzo.com, igor@virtuozzo.com,
 pkrempa@redhat.com, libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v3 06/11] qapi: add x-blockdev-replace transaction action
Date: Sat, 26 Feb 2022 00:43:03 +0100
Message-Id: <20220225234308.1754763-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
References: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cee00592-6548-446c-74cd-08d9f8b8a733
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB417245EEAEC97E9EA68EC80FC13E9@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WO6fAP8VrfijoWZc+i67vFSH+hvuyd/0dn2tYM+vDjJHSB5BA2C5gEag5EA1+EPOhBJGTv0O+lSChXOGZioerd6wTHDc4ISn3NhmmQ9M+z/1ezrX67UPIFwPL1Cq75UbEqK7EuEUHVhL7U4oaj4goB/mek7MdDr1xua6VFL1jPRL5YQiyszG+yfo1qzJpEfv3XZSvF772cCd2Z9pY5pIe3Wnp7bMPzK4ptu2+o93ka5//IOfsHrbGoioypFj9cyoi9r8Vq+4lT2dVpdfeWq7VHjro4uSyDRn7bUMG5ir/KEBPONNfhbEQDSJcq8VSFG9h+E6EFZ/6kRS8DqAUVujZhWasy9CmokOYfReFCUYzOHYBfiOExBCdiuJOZxSQZeD0G5rUz8cQLgxh8RUleZ0ujc7zlQjj+HHzHc6rAOf2lB5wd0F96LDJv890/gm8Ht4bqf+sckXd/Lj+9hF4toE4tJFz2UNGoS6SePyCjehbrc8j0FXjwU4diJ3VzLtP4z/2m9/BaJLIuD6SGzl1zYXA/34HXVapMAyjMu/tZo6NOeribdGDPaUMrykLQukGErX/idTsQMV0rwad2sdMgZGRYXshnMUSBI0xxv8QEL0JYsTdLetITxNQ6wAxvTtYn3FCn9RsG/8t1YUBxR+fNP6KyH3ENTdrsPCdPIUfWCxTWsuo5V10mZEsOWkCl5fDrgOLt+nWiQkfz8ILgPkGLXgsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(6506007)(8676002)(66556008)(5660300002)(83380400001)(6666004)(7416002)(8936002)(52116002)(508600001)(6486002)(6512007)(2616005)(26005)(316002)(36756003)(38350700002)(1076003)(38100700002)(2906002)(86362001)(4326008)(186003)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PAzmZr6IrNyjGYk1mS0Y3vnuTpkzDvP/sX+9ogFsf6EeVsk0ArvKD7WWjQQ8?=
 =?us-ascii?Q?5Np4E3r+FFA79tSaedExHqPQUIX/q9LMk4fY2IKfxfgg+1lKs2b/b2zxl4x4?=
 =?us-ascii?Q?KQ3mbR2AkA888s2DQ2Tz3c0VYOtTlnTP1NX7yuHC4p2EA6RoGJsmuEXFfw6x?=
 =?us-ascii?Q?HlJ5ABtpbe6VlqN/jGCd0t97xXdCvpdOal5Htc1nBux2N85LJC8xZU6eDl3J?=
 =?us-ascii?Q?pGV29Ua6h5fPpZ4qR9ibG8cBCJlwePgAvxBb7xlToFlXH3VesMWc0ELM6PS/?=
 =?us-ascii?Q?LVAWeM31Ra+e1lXAQdYUZ52M5PJQTctyPntgleIi1B/CVRwt9AGDP95cUYmN?=
 =?us-ascii?Q?j96xsTrf9ts/KCWtgEoT+00Jta2EFTiemhBJEDTLNcUiq9EGKwZviRo8+cNs?=
 =?us-ascii?Q?xFsTevVti1lgSka1INz80zmrTeG3yVIvr0P3hqhmmbsmQLaAVC1UNdNvDcEI?=
 =?us-ascii?Q?AgZcqlViUwCcXmgJ45oLNXshJlwf4m2F+kvE1JAmV3s2I8QSFGZW7zolgtsK?=
 =?us-ascii?Q?5PJAtdtNdE2CzjrVm/qT5l/DLO15WGdFhj2PyL1E9J1GYLa+AnqB1KVj0xXN?=
 =?us-ascii?Q?fEvi1+ytULzKmrBW/whJ6EvJE+AtqvSI9IPmr2fAGApKcy++3/DT9NN/ybl7?=
 =?us-ascii?Q?h3b1Gg0WX9voa3hoqzJGD/PrGMLuTGvoxcrZJGu+rWieljGHWumB4MSaxKmr?=
 =?us-ascii?Q?1hSE30PiXv022nrfBUdmkS0afmCVvvaWF6OxVt7cQjSVx4tRnrlsY5l1/Cgf?=
 =?us-ascii?Q?Q63u3x97l2GEDiZ26UjO+Rzr7XyPhl1LNuGVXcpuL7xsjJhwUwETYFuSIGVH?=
 =?us-ascii?Q?miJ5y3fO7CIix/UQQOFq9WJMS8P/8jchGjD3nAmsPd4O2u6+SnD3IguPCUmp?=
 =?us-ascii?Q?+kQqfPMGMRSkzaGanUMOnAhKeEmDvB4lYtJ8P4Rv2BIf/O5/bYpr+RjHVmdN?=
 =?us-ascii?Q?nysjJYa/+WrBlJASe8DdMlfOXlJaWf62yktIPsRU7Xg1eD9Th1P8Ubc8M4yD?=
 =?us-ascii?Q?NDzYsO2I3wV6bY6TTW1ZiTaSn0Le0/cSECR+2ecW7vdTkP+IFo9JGMX0jxY/?=
 =?us-ascii?Q?VPltxCl4seGq0wkdd2F7Ufc1Ta3nh2SJjDQOGDce5hbrwk35TwsgzUyv1EBC?=
 =?us-ascii?Q?pg5iXsKq06HIjyDgZJkHgf9Ij/MrkZCd7/rvzS97n4ENyDmIU5KNjAj8uFp3?=
 =?us-ascii?Q?BZq9cyId8J2DiN+aNPtoPGeFky4sS7qGxCMxgtbz9ECYpnyZZ3EgbtyaOt8i?=
 =?us-ascii?Q?nly5t8vQUwNh2bXdJjtEoH0YSK/u1hoM4dCMP8N/aG5hxoxRzuJIUfgdF4Bs?=
 =?us-ascii?Q?3cujU11w1Bkklrfp7q620K9y6boN2T9crcj6IvjudQ0IKlxPVoufpnOBYAl2?=
 =?us-ascii?Q?+HqezjvNrgPLFtUBc7toYdBD+QBeqtVEXl5svQLUIBaY37fD06kgbzcchh7Z?=
 =?us-ascii?Q?PwXpvIWCV0ao++1tguy+CLoTKcvWLVHkZgKCKMwDQXzDGwPz17zxwFmqu9m6?=
 =?us-ascii?Q?S7Nd+MJ53dZyVWP7j5FKe0Z4MW2+JCOQqZobkTdw6RMbKAvQGFVuEU8mGx4Y?=
 =?us-ascii?Q?7pKe/0L4P8hIYFERIxxlIIzvCgZO4UrnmOLk4C5HCKeZSbrHsy5CYxU/5WZR?=
 =?us-ascii?Q?xpkpM61wD0AkDAXtf3X8Pyz5jB8rswn7Le+lksQLH79lagIa9K5jKgc6MNui?=
 =?us-ascii?Q?Fsd5iw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cee00592-6548-446c-74cd-08d9f8b8a733
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 23:43:41.5914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGdplenZhS757+r7l0lR8qI8vIIszG7C0aPK6+9sV1HIwVbHrRBKd6UCsxaOT1pJf+xqF7ZrQNrkoNt9k7fLT3OJNne/QicVt2b5eNVFNFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::72e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Support blockdev-replace in a transaction.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/transaction.json | 14 +++++++++++++-
 blockdev.c            | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/qapi/transaction.json b/qapi/transaction.json
index a938dc7d10..48dd2db1ed 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -54,10 +54,12 @@
 # @blockdev-snapshot-sync: since 1.1
 # @drive-backup: Since 1.6
 # @blockdev-add: since 7.0
+# @x-blockdev-replace: since 7.0
 #
 # Features:
 # @deprecated: Member @drive-backup is deprecated.  Use member
 #              @blockdev-backup instead.
+# @unstable: Member @x-blockdev-replace is experimental
 #
 # Since: 1.1
 ##
@@ -68,6 +70,7 @@
             'blockdev-backup', 'blockdev-snapshot',
             'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
             'blockdev-add',
+            { 'name': 'x-blockdev-replace', 'features': [ 'unstable' ] },
             { 'name': 'drive-backup', 'features': [ 'deprecated' ] } ] }
 
 ##
@@ -150,6 +153,14 @@
 { 'struct': 'BlockdevAddWrapper',
   'data': { 'data': 'BlockdevOptions' } }
 
+##
+# @BlockdevReplaceWrapper:
+#
+# Since: 7.0
+##
+{ 'struct': 'BlockdevReplaceWrapper',
+  'data': { 'data': 'BlockdevReplace' } }
+
 ##
 # @TransactionAction:
 #
@@ -174,7 +185,8 @@
        'blockdev-snapshot-internal-sync': 'BlockdevSnapshotInternalWrapper',
        'blockdev-snapshot-sync': 'BlockdevSnapshotSyncWrapper',
        'blockdev-add': 'BlockdevAddWrapper',
-       'drive-backup': 'DriveBackupWrapper'
+       'drive-backup': 'DriveBackupWrapper',
+       'x-blockdev-replace': 'BlockdevReplaceWrapper'
    } }
 
 ##
diff --git a/blockdev.c b/blockdev.c
index 9fd1783be2..8ff0e2afe8 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2294,6 +2294,34 @@ void qmp_x_blockdev_replace(BlockdevReplace *repl, Error **errp)
     tran_finalize(tran, ret);
 }
 
+typedef struct TranObjState {
+    BlkActionState common;
+    Transaction *tran;
+} TranObjState;
+
+static void tran_obj_commit(BlkActionState *common)
+{
+    TranObjState *s = DO_UPCAST(TranObjState, common, common);
+
+    tran_commit(s->tran);
+}
+
+static void tran_obj_abort(BlkActionState *common)
+{
+    TranObjState *s = DO_UPCAST(TranObjState, common, common);
+
+    tran_abort(s->tran);
+}
+
+static void blockdev_replace_prepare(BlkActionState *common, Error **errp)
+{
+    TranObjState *s = DO_UPCAST(TranObjState, common, common);
+
+    s->tran = tran_new();
+
+    blockdev_replace(common->action->u.x_blockdev_replace.data, s->tran, errp);
+}
+
 static const BlkActionOps actions[] = {
     [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT] = {
         .instance_size = sizeof(ExternalSnapshotState),
@@ -2372,6 +2400,12 @@ static const BlkActionOps actions[] = {
         .prepare = blockdev_add_prepare,
         .abort = blockdev_add_abort,
     },
+    [TRANSACTION_ACTION_KIND_X_BLOCKDEV_REPLACE] = {
+        .instance_size = sizeof(TranObjState),
+        .prepare = blockdev_replace_prepare,
+        .commit = tran_obj_commit,
+        .abort = tran_obj_abort,
+    },
     /* Where are transactions for MIRROR, COMMIT and STREAM?
      * Although these blockjobs use transaction callbacks like the backup job,
      * these jobs do not necessarily adhere to transaction semantics.
-- 
2.31.1


