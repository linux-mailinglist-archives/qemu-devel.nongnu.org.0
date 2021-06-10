Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569C33A2A91
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:46:20 +0200 (CEST)
Received: from localhost ([::1]:50104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJ8d-0007aK-C0
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIq3-0003xS-U7; Thu, 10 Jun 2021 07:27:09 -0400
Received: from mail-eopbgr40090.outbound.protection.outlook.com
 ([40.107.4.90]:54851 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIq1-0004Ve-Dt; Thu, 10 Jun 2021 07:27:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHJO/s76eBCY7nFgSwXYbNIVl/AIoaV6iFQMFkEqMHpO7vJz2y8UcA83BhEHXr2vVqG31f2BN73RMUYSYKz7CkNZ9ss7FBrEo3PB9VtpkR9pMOdQABPq9rIjwP/vL9R1i8z9EFcT7D2VhidnQDtnGkBPUXoGd38JFoFt0SULKQ0kFDIWEb3iPXvR0MUAEduM55LhppEpQDObZYZSU/1KQH95AD7Cz71pof2F/4wid+sAwoWeksjlF8jpEgumQqiqZGxpVhaLg2qGd4EmEjaD61ueLUcGft7RkTj5BRdFQgu/HXpBNnXF8hrETBWylw/SVDJB1GtMEyrW7qvi6VBTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=lIFk1fLMjZ1U7JpicmK76RC3zGz0eTYzsS4qcvfSZTzp3Ik/b8e+bWgb/LcXqD7pMERCDYR46dac2lYZgOCkUqq1HtANLCNjf1h6wTuwArJ7iEHFwhdS+IvKtZlnqWw1gpHift7lP9cuvlG3Ns/+RdB0AuSld+OifLj92kwWJ+7NhFslnMtvKKSMVsPdZdsfkLge+GMU3phpZfWtICLlBkxurozfT1Q8VwfXt4Bz5MHbzyoUfJ7YErUhGkjvc5u6kTYYBM5LCg+8E9uYlCt8+ZLeDlpwQmZ5zzzLSagn+7hxMa/dLuTBZtKdxiKEfEz4HTU8nO7mpmnlgOpnnS3ByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=dqSQJIbLPTSPowOvU6IjCMhjQn+rMU2Z5ebUZYiJ+MAWgVJFbDKgWxdiBY3DzoFYuVUiK8YR5D9Mq3M9yalL9a/g3yp5KbMIGW/mrlM+gcy2E8DfhYqFK9r3CJE0hLVupZWU7TKE4ETmJlF723XElJhrexMA05qNAc0AWeXyq+U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 18/35] block/copy-before-write: cbw_init(): use file child
 after attaching
Date: Thu, 10 Jun 2021 14:26:01 +0300
Message-Id: <20210610112618.127378-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52285617-095e-4319-4254-08d92c02a57f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381A2897DA45060136F75C6C1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UE8G9C/3CWGuz9kR9SBrAdXAM/9D2ueQuRWaF+/z7AdnapauE5XAZ5JHuIcqvxhRKGJ8xBhe8mST6sPr6FIb/DP/oOmTCQWrqNX1tejmhu1bFLf4jSelKbM5fQ6k4wydiQuVx65pIO/8wbyvGhdYxEOcj3zBV/ABsx71D/nnwjySug6C4Ro4CAu6aLQELLWXYu1iVEG5zEtNf5hONRQtkzw0J5ZxtiMHvWIBEa3uhozUyNdgW2xGWX2CdR+AaOStBshc4zjlTFlYHUAWsGrKAKC1UwubRvWOpqa7kvFHV9W14HGhCl6wZdZnOefx6stURFHskuR3/9OB8g1unuWJKLFdL9kJ8Qf3qmL4tDTBRbFXCRRpbJ25+0HD6sbfznv739GvcBqN/jJqmMQotM/ppOaQ70wLKuyPgp5me8vTqDHESjGobDo6xiqlcrdCWASWzY3ocAQOiHY14rFXHe6vFbxnC6Z2YYjv7sKYuTh71IjYGMBIWWMuNappUMG0p4LmlecXCyifKB8aP1wyeVv8l52bMX+/2UrsxX3691fpTL06rIgNpLQ8Yvx7RIIWXKXnziD6EoekyFlyR4ZTpcwQ0qlQuZuu/H3nN8tv3T0B3v627tmWWkqaEwdd0HtRCjfpcl614NBZCaRy4Mjq8iwYFMu2IgsGZJLEvXbZgVY2mZP92Mwt6qWJufq5kH9dz96a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5XvmndOrbCQKRLrqkdAsEhZ6ZvjT+wQwQM3ZGCMd+knGi8u0eSUYj6WZKmDB?=
 =?us-ascii?Q?9/V19HUTckmr8JYFynqztxOPYxfH8dsihtHpJ5s56jbdzr5wI5UpFSYy1TU+?=
 =?us-ascii?Q?nqoVUw5Nfptpgexzp6qKUVkJfdfX7teOiNPAXZk+t3DWOkqRrEHVVoOwhfc8?=
 =?us-ascii?Q?SAalm/0jcKpVpdqAqXpKDwJYUWV2Z8Ll9uGLSGSuEseTS7+WIEQFWSoWTDly?=
 =?us-ascii?Q?kk0sdIyOs0ZI0Ja7iFO5CzySAuyHafaMomlTjTQXMMcTXga9ZXMsaF4OVPvu?=
 =?us-ascii?Q?IzCcyVBxF0o+zWSSYL1GXRO8BRKLALbMNuOcrQzi5xFe8GVqvaeWbo55u6mo?=
 =?us-ascii?Q?Dmjtc0GDd9y4oekrqFb09h7qg/257fGE85O3+ILcvugYm5yUDSu0vGqA/yEj?=
 =?us-ascii?Q?Dg7P1vwTaczHb9InWiLIV0auHGAr145MNQE78teqoUD3BY+OzgUXOvPMzDmV?=
 =?us-ascii?Q?vj8SLbQVAiVDrA+e/k5zCrwOwBfU7CKcJ8FfkMEfYnHBKVL/uuxUJByWRUx+?=
 =?us-ascii?Q?/sBdRv59ggzyVN+obPCfKxvmIdwX5sVMAUTSdrGlX3QDPLPV5i7eCmLtTL2M?=
 =?us-ascii?Q?VI68I4KvAhRABKrhLJVF2+72gpWZFqAJhK3TiZYnoTQoobC4VE64ORHK50My?=
 =?us-ascii?Q?daJoGDH1Fun57PYx0bQSrG6l2fecuK9QWbYEN7MkR7nPReUaU4Gsx1weRiwl?=
 =?us-ascii?Q?CMu6tL/Zjat9zB3W1xyG5uEeyJoEf4KBPtk0nqAlzeLhOiPbRtZeiTV2qpjw?=
 =?us-ascii?Q?+h1lS6svQrgna23G+gyLZ2/4/52uROeaNqds1ugc0+GQfl231d4j0xotwYov?=
 =?us-ascii?Q?dlwE8EgRrzz6ATZBC/rNCNBSlfELxuWoOrlue6s8cZQvbBlzZHoAr5+Y+5ht?=
 =?us-ascii?Q?794E0IL6ufLKcFTHkwxILq4CwHBjTZ2oh1WnPMaHBM7p04V7xpTZhFj6E6yk?=
 =?us-ascii?Q?5e+KD134AeqTyeXqMVnEaT5VG7KezlO3EdJDsLXFKu275EnjA8/5Uj5S5PeE?=
 =?us-ascii?Q?R2+4HH/giPG6KlK9kpeVOLzC7wuoiGJYvohdS/wP/Zezj5R3h7BjLsio3Bgi?=
 =?us-ascii?Q?JtmUB+dkfjSVXQYXkvWcbK/lPfnXQmYTEswmHrSNcd7q7ERRda1t66/BIY+x?=
 =?us-ascii?Q?rspVtn9YPn7gP8MCes9YFj+Aa47eEMrXNmDNEGlqF2vTxF5fI6umIzsc8OXW?=
 =?us-ascii?Q?7zT9jgWEWQGYqqHxY0Y3KbRMg5jDsoJcer3pN49aBkUPWIMMvravY1J0EJFM?=
 =?us-ascii?Q?tmxHEawAMV9JmyPMgUVAUqUnxe0jl/M8OvQQDuqWhGKzTlCUYiqH9gM2hMp7?=
 =?us-ascii?Q?Ww9TudVRLHqYDeGrz23qiYTF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52285617-095e-4319-4254-08d92c02a57f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:52.9206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOi7SVQYiXOXA/h9ojJgen5JzQE/rJYf5G5jQlB/tGZnSfzReHMioJSyvRjAA0x3yCLRhdH0wa7qQDwJo3Y8raynHwWUhoHGYvnQYkiFJUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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


