Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9261C3DFE73
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:55:15 +0200 (CEST)
Received: from localhost ([::1]:33344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDcI-0008C8-Jv
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMi-0004wc-4U; Wed, 04 Aug 2021 05:39:09 -0400
Received: from mail-eopbgr60114.outbound.protection.outlook.com
 ([40.107.6.114]:45925 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMg-0006Db-Cp; Wed, 04 Aug 2021 05:39:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJQlapM75ApTCXj4p2/ZTKhp6tCXDPxAOcvJL+Al8Yg40BIhaBN0GK88G91dZ+HIXq0GdSjC3s7LE1AzgxvkqgloaZLc2kihWma031FUDOFFMO8Z28UCKjwDuch2920cE8Evf+MLmLGvzpNh1rcReKberTGN3SY2KJZp7XruMynzDcGC0GbuNu9Y8koG6L6F7zM75YEghtxXiv4U3wKwj6gIemzHj4klgV49ReGK+KRaDxhqvDwH5/DN8lGEk+gfIqSxzsiiQ2a0ZqVqk/2BTIOhfBdGJ7twQSvC4OrblckNor57Uy0E5CEONig4VW8CullRL98PWB4qhaUdyfA8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzEbTus52yZW9/K2jWF0Zh8FB09qCBl7UQJ9/5sI064=;
 b=PuY/2UC0AmdjdurJN7rDUF3TYKeXCSFLA09uDPTDJ8Dtd1NbjsEGnVRYXv14YlZNAVNVz4obywdk/6oz1RAcI/01C/CyQd84sivsOnRclVE4XwR2cLMnLS2LLoTk1lGSO+raYFeY+pOMFPVZ7X66IRWqRkBhf9JaRiWoqnozihPSsiGy3C4FQGAXhQf9DdsQdYF2HBpwwTIE4gSZi1CBHIasfjEUtda6mUKKtGh3/1KA4DzN7G+HvzTGxyVYWAcdo7tSvHut1u0qk8ZQaj475NYTFnWjtg43lUGivGSLgaVfpPxOYOITH97zDRyTr1AaI3D3OOeC649aAWDfTEMbhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzEbTus52yZW9/K2jWF0Zh8FB09qCBl7UQJ9/5sI064=;
 b=bvLgolo+DJgC1M3uhMjho3Ocak55twF25HSwl5YxweEuPSg9AP/auA7B615Osq8rB/dek2kKZ+wLmkO57k4xRjNFDUM6XV4e1TDFGDf+ie75ZQ/PtaL0jIhSzgDSdNoPxth/8LmE6t6QDr2gGs89RaMtdNr14JO6P7PoZeuLBkA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 09:39:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 17/33] block/copy-before-write: bdrv_cbw_append(): drop
 unused compress arg
Date: Wed,  4 Aug 2021 12:37:57 +0300
Message-Id: <20210804093813.20688-18-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d9ef6cf-e32f-4135-79ac-08d9572bb06c
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50327418A5D44BB612AF70F8C1F19@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lbClgGSak0BFt9dNfWZ+6YlBc0QHpEWUOctEwTlE747bz3ubbXQ3OYeECidRRxx/v2LcC1b5seEtI7O1dZXfXV2Y3UgUQ9QghYYFZ5lNeUtpJuEOYePIDqsfVYdes436waNx9WFNdGoahHclB9ZlsmSqI0Tdzd4gd8cy2usXLqJEvdyRF9Cx1qHEhnD0HvXfi5Jksib/crM30fCx/IYDkHhxm1QJ849FIk9Ok61hLvW0I0DlQGN5fX0KJ4HE0tLpUh+R3RCfjMNunWZNEgXY9O9U5+F/XJt4SJIH7uOa7ezG8c2iqIXtnRCs08J7FrLT5R2wpdbOz8pw3h+oNnHWiOGrgDmGG9lQr6X25WoA5O8FSc/7H3HTzihCZ1zwmLfz/oTDj1F0Fv1S6EbUpuLg2uu0ScNCEzovUP2SaNwYdq2A+JBrv6R4fhknoV9BhjJ2TmHcu9jcwWZ49wpkuuSXlV4921ry1Al8mo8EtuAIlwIOEAixa7u5cEsVH4g0XsBCQorj+nVnuYkNKdkj1rnkPyWXcsBOOYgIO+qsFUgGfAkVk40W9+8+Kgd1SQubZUxqpZKBroof8ZVoLQh2I8Tioi4NqIeDjCaf9rutMDqviYEsLLi5w3UyFTXOnSfuJa4Pua2UQ863bJoqY242Nod5KhAz59Q8mo9ofG/o0BIKqhgMftbYsL3PLOM0iWEj/caDQiyN9q/h1D+7Fg+Nc1xBiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(1076003)(186003)(26005)(7416002)(2906002)(6506007)(6512007)(52116002)(66946007)(66476007)(478600001)(66556008)(86362001)(956004)(83380400001)(36756003)(8936002)(38100700002)(6486002)(6916009)(316002)(4326008)(8676002)(38350700002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U6L+n3oxV5JAHPJEb5RUIv03oQrOIBDvrjHBXOtd8dc1JUSos1AD5bPjuElx?=
 =?us-ascii?Q?DQx5/sMrV58d007LPevP45bcdu7Ir38FCKpVIMyx6W7YnuCbmPCTD5jjI3pb?=
 =?us-ascii?Q?J3gNJrpGsP4HbHHql/X/vhgYK7+UZ0I3ilSJxkSnsPcugEpSt7v/po3n17mf?=
 =?us-ascii?Q?BUA2SalN1Oh2NKXm0FcCVtpVMP12SbdmCUP+YH5ZJAWjKzjdGxw86Hy8kc9s?=
 =?us-ascii?Q?yMmae4JpL05YBm4YIJb/LmU++eG6z2qsbMoJ3uOEgYQGuZvnFoFtzNSb/XHR?=
 =?us-ascii?Q?iZKMCwzyTyWKMj9QR4/ExM3K1pDfgeRm1KAjJ9d99YLhoIEib8G0uQSL4TU8?=
 =?us-ascii?Q?kMUSjwYmFaI59SXXvgTRT1zykMW9VmjPLSplDejYfUiZ4K0q8PncQj+Hvude?=
 =?us-ascii?Q?SidNENCMPLo7GpvFkE1g5hWEupLW1Z+ooCzRvBCc6g46yDpgAYUIzmYpK3Wu?=
 =?us-ascii?Q?a4Eu1wjxz5UKOKyvNxfeE1/O95hbmbNkY+H+uC3Z374CoMLR2c/NxaP6F1B2?=
 =?us-ascii?Q?SgQGyxyuSzRJ1TTl84QOQgUfeOrRSf8l+22VzeGoiGr8w66zEvPuVFdc1Lt0?=
 =?us-ascii?Q?xqvxNSNjdIvqJkVJM0vy05/9TDKhWoPK1i7gffKQbsZDl5BeXYl9loo4Rq41?=
 =?us-ascii?Q?NV22G4Mt0Zod8r4Fj7vbn3oMTzzqIPZ8+nUwbHhwn0xWrM381b7HWMuc5S7X?=
 =?us-ascii?Q?Z6XH1aghqqn2hxdazGilOiH1mtMxCU7LZV9KA5BqZkq6J0eg5wPxF0aHL5m/?=
 =?us-ascii?Q?duml56GeTskCkOIDPGF71E3UGQI3W08DlYC9XwpHnAvdqcTUm/JO+I9yL61Q?=
 =?us-ascii?Q?5Er7X1IzOV8iHh8YM/Es2jrwGzrB6PYefcx8HBgrv5XJ3q1P8So9oASdB2L+?=
 =?us-ascii?Q?qe0XWLoESdRe9XwBCFVucISc/+5tNl3+OF5nQlUL5ZgBD2yH7YAZUXfmKc9P?=
 =?us-ascii?Q?XA3p/pFR3qnF0PXmkh6nMVEHiuGyhi8WYDqLy/RXGH85bBnjed45WujPm4UM?=
 =?us-ascii?Q?2xKl1nzzN4QNdlsl3xgE5su0sme2KOufAb1M5nx5LS4FpxT2p6DciF519lmO?=
 =?us-ascii?Q?0uDxTxMVsm7e1f8NaFFfEF69MSDNxFeVp8tL63giMsm+TaNjcpNCuQRJQeCZ?=
 =?us-ascii?Q?qHRTGLZs7Y/q9iniIpWjFKW+7uRSm84lS76ztlsjMJfG6jb5VZ9DUA64G1zM?=
 =?us-ascii?Q?2/XCXO5OxkglmD9gjKEo9p0Kz3Q/ggSINWbQFLUjXnAvVzglzSWaUwmoqLlB?=
 =?us-ascii?Q?VAJ0GKhP0fqgX2E/FTCHc7WjSRfa2PLm84ACRYrrSRrstZbc3RmJEUe2Tnjg?=
 =?us-ascii?Q?IAGUABM2stit437+RSVvY1am?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9ef6cf-e32f-4135-79ac-08d9572bb06c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:00.6806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7+nvMTK5t9x1NfHM1XXkKZutCL1nOMT5wR7fCn0L6xS4vEt5JpJrq0sDHt1dTP3BmG2+lAAaiPEdOSTUEjSGy/X6TC/MJhD/oTL0gdi7f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.6.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h | 1 -
 block/backup.c            | 2 +-
 block/copy-before-write.c | 7 +++----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index b386fd8f01..51847e711a 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -32,7 +32,6 @@
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
 void bdrv_cbw_drop(BlockDriverState *bs);
diff --git a/block/backup.c b/block/backup.c
index 83516297cb..4869f1e5da 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -452,7 +452,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cbw = bdrv_cbw_append(bs, target, filter_node_name, false, &bcs, errp);
+    cbw = bdrv_cbw_append(bs, target, filter_node_name, &bcs, errp);
     if (!cbw) {
         goto error;
     }
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4858dcf8ff..1e7180760a 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -145,7 +145,7 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
 }
 
 static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, bool compress, Error **errp)
+                    BlockDriverState *target, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
@@ -173,7 +173,7 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, false, false, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
@@ -202,7 +202,6 @@ BlockDriver bdrv_cbw_filter = {
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
 {
@@ -221,7 +220,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, compress, errp);
+    ret = cbw_init(top, source, target, errp);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


