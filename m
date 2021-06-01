Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D54D3978D3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:10:59 +0200 (CEST)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7us-0001FA-E7
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bu-0002o5-QH; Tue, 01 Jun 2021 12:51:22 -0400
Received: from mail-eopbgr150112.outbound.protection.outlook.com
 ([40.107.15.112]:35829 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bs-0002O8-SY; Tue, 01 Jun 2021 12:51:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7zwe9h8ckH25+6IEJFBgP72VcBvIxoIIMETpHfWR4Ns7Iwb+F28cb3996btXFmsHK2YkPs8INGPbrLjj42QNTtHutNWa8qCiYL07BZkVBdBskOLqKtT95KcZH7fLj7VD+4TaaPIAfiLBb6BaVKILRZ4Sz+ygaXTX8T5semAzmRR0zl6nboE9A37vOEm9nEQbwnpw6S+hVyqv5VFPNf/RMfwFUWcKPLcu+DKgVVkaQz4fHLiMzabgppd5ejT7vkBtF35x9J+5kiSKmwmPaHiHOwkKd5bNi/jZ4gFfCgYbv7NBVjRIzxReTQb8gF1bVEVDN0PI61dfrrfe/QuCwN/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzEbTus52yZW9/K2jWF0Zh8FB09qCBl7UQJ9/5sI064=;
 b=Q7mZ44ZiIsNpofYvw0xB3epS7D9lQa05Gd7NBxqGl+HDqS0aboHBoHZF8Moy+j2HlH5WP2r/A5bGFO337erZN//ywtMc+uYVn4OrTsvm10mocov+SezqCV2tmDvKB3KXoWGwrOFnUqJJuZh/G8BuHnnI3ZuMxm/pFaZISESCIujUT6RbDkAmsyD3z+OohJJOTj7syNEC/uk3jSXGTq0jb/c42pnDXM1CYCZvxJNmAWwGZx0pYpp+uonJy7UVMxrtqhTTqkPvPZiOrfUVdYKulEPod16HqMboZZu8Wubw96EuPJt3LQZUIEvz+FSG8fV+wUUsZ/h/0TGEIAGPbzawpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzEbTus52yZW9/K2jWF0Zh8FB09qCBl7UQJ9/5sI064=;
 b=QvZxGquFa8GSh07x7BqlChiBC3lJwja2a3o7sFEicKvxN8qb3MKE5wCHIW8v8Afb5vHu434hWi3/Y0r1w4t6+ukTH3VTGMimkXBVFPEn8tuBZDepvNCOwmbNg0X25YiC/9cQEafOChuKTvnugU0NPdGizx1liP+oGvvIem7jz5s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 19/35] block/copy-before-write: bdrv_cbw_append(): drop
 unused compress arg
Date: Tue,  1 Jun 2021 19:50:10 +0300
Message-Id: <20210601165026.326877-20-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 668d026d-6ab3-409d-d7c1-08d9251d743d
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19720C73705141E1D9DF2962C13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vTR7X+WFwPdT5I1XTKyn5sv/nG+AA7IQBatF3X4SiXPIJodePnXj9o7YjaPBBAZt3s9pbp+AiryVFw/aC4X4NZuNVMOnz52Am5v2PcioXAcSxX9XSXkr5x74Ff3IqLiAddn8IfMA0winwBgfSmFwzYezs9J6FYpv8b0tt8rkl+ZPUmmPSKIkH1m31WUk6Q+T8lFvAXNkY89g0QPsAHdcYhFzkJzBbsXNrn5IV3V8UCO8Vpdpt56UBxl2M5cm5dIbhlElnmBLCEKlIdUkjRlvqpiOkoMuCrWQt//lWMo2LBF41jwiySnJcOPAZZc1Tdxq1CK2NGFzs/zsSjirXoPMQ0zMTD4F2M6wmAh2bdH32dkdfyGeT1s6bbyGEXwFR6hVyFy337D62b8R2kI9K/SPqcd+tU00dDJnVxhp/HbZOY/d5SOmDxNye+AGJIlhFkjtqGZF3hMbchzYnHN0z+K2F7FuriS3J21eJywfOWjSOmkmyE+LDkpUlojh3oySmBNufKJ0GFw/jcJaWUbi5vftxMhp62q7qB6ZDtMX5LdIgyqkMeGYA8iDY6hkeBqBAFiI6QZDcTz0FRGlIf1eQ0ngTbAcj1v1BF+aLQfc4s1tfP1f/nXgRV4eYurDoQ6qvTX9rFobwJsmkEd7HkwWtFeHLuXXU5R5Lk2TRaQh0SdTOpamBfjIlFX/1zvGPYO2P3fn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(5660300002)(2906002)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(498600001)(38100700002)(4326008)(16526019)(186003)(38350700002)(6666004)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?n+UNYcYltsNPaC2IvDF+8KmgpxsqtOviK4oW73JH/3PJSae1h3pblkwiYG6Q?=
 =?us-ascii?Q?dNwlli/BHXV7MapM57uBhe2E7/n6ki89OvZssZxOCM5Vfhc5e361sH9Nrwe6?=
 =?us-ascii?Q?INYzunAS53IovplOQ1Gbkt8ptMBDKxu5Zzm4P7LJiOfbd8VEr433kRTPlFmx?=
 =?us-ascii?Q?wS0+oDAD/RFUSzQEUJpfZacJ6YOmdSxf4HbEriU2Sh4bRRSeX0PVW+l84Zlc?=
 =?us-ascii?Q?4Bov0YvWFk18ZXApKhFkzEBQ6BMVLNaKMspzrDmndGuwGXgACDTu5edKzHx9?=
 =?us-ascii?Q?JOlSPDAmKG5G5LYwmfGy6XlEqfQOBE8BS9ffAjscCCXo7+0GPwKJ2g2RfsRs?=
 =?us-ascii?Q?0CEDkbieqgQir8jtxmgJWWZ+57JttpA5ePo6iHcJAXnaF3N3gMTU5Kp+kE89?=
 =?us-ascii?Q?tBYSDkW+dTeCC3m23nv25WHlr8FSwRrnxSaup3xGBfs8GIL/uQo1+HSSC95W?=
 =?us-ascii?Q?nEv2bD3UG8ZXh3PNL8ZaFUUdpjjReQOsnOKF4ckx/N8EQpNoPDYdY3vyUR3O?=
 =?us-ascii?Q?QhL15kubXI52M5fMLZejD2/RkSfYdJclLUPyWQqPhMHlok7KfJLlsccgXwgg?=
 =?us-ascii?Q?hKpzaM1lKamvODlQ6AFwy7iv8aLldZTgKMB4KyOWBQhQLIRl0eVrjNUwDRKI?=
 =?us-ascii?Q?1Xs8iN1/nBIanNdPz0J36IXC7UihfP9YYSqmuycDAKihN0dm2xlYB1QAfNcW?=
 =?us-ascii?Q?PfchcxxQwFQaumzU9xnNZlpKqv9KHNXYMLElDG8hDSelb/XfpKdgDP6CstX0?=
 =?us-ascii?Q?saFVlTrIHNHq0hNaY0WH9BrBZ4hRF7b3Ytk3aecAzRJzlddHI4R4sLSNMqzh?=
 =?us-ascii?Q?2eE3oVvj6bPef5L1jUIJXulROB9EqtPQLdcSFq84HLPlhJQnMbsa5GYKi/zU?=
 =?us-ascii?Q?MOa/5N+3G+uQo35PvWR5S3V/GNPlN76cTlM/a0hn1Fs33AKgLxfX5f5lbQ4n?=
 =?us-ascii?Q?ANh+w83AJPlXbxBuI6wFx6FqrfXSCuKdcMjhg5gVIzBy6cu0Ro7B3I7PJKxd?=
 =?us-ascii?Q?m2SaPn25J2bRgFfT1v9DfYvkBloTrFJVKWxKUzYsOrl97W1Amn3ds69qG+Wp?=
 =?us-ascii?Q?EtIF8QU1dUbP7vZaQDXqJpoC2Pn7mvRnSxjBiftT510xPxNdQ8RoYxiMLq6i?=
 =?us-ascii?Q?t/KARXLebBheF/hfJVYWgFcLnnidRf4rtQVwVawLxSyvlwZOHQyk+ZmNYPuU?=
 =?us-ascii?Q?hPupv50nDYq9DssBm3dLHF/V05iAsfC3NDXCA/oPPkqJGE4lm8rVBW7xBnwU?=
 =?us-ascii?Q?hIq63aSJDSm7qpU1s72i0nALhfV8+BqTPe1zjhn3T0Hj7ePF/InBGGBN4J6W?=
 =?us-ascii?Q?skmRd0i5sstEL13cnn0Vf2KQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668d026d-6ab3-409d-d7c1-08d9251d743d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:08.5877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+0r5yuRT/SBWXFa/P4bhGZjPbN5OcIjccS8KXsUb7/9x3fxfFkrzjnOa36Vc5RyqONQtycp7pPTYlwHZaj9qv1r06F+gwTfmxgH4RwfYHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.15.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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


