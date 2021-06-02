Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D93398A6A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:27:48 +0200 (CEST)
Received: from localhost ([::1]:35458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQuS-0001KW-1e
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfP-00012C-MJ; Wed, 02 Jun 2021 09:12:15 -0400
Received: from mail-eopbgr70104.outbound.protection.outlook.com
 ([40.107.7.104]:36580 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfK-00035G-Pg; Wed, 02 Jun 2021 09:12:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+uBoD6tBfBX+QCm2BhIYFbYTAVnuQk8tLT7lAQnXhypmXh4lFC5qimK79tewj+No34STMrYcPy82nC006xEQfZj1OMaL4CSlBUnie30C2ZIMlEhDJZ1pft8XJeJ9WUm3L9TyeWhGTs/+btfoRC3iOAi/0m87naw576a7frcWNF1YTXbh6h2rKZQlC3XMgBFJ1bdJJ/ISjtIBmafouaoODgB7AjYeseSs0CrGBKMJu8Pu6e8ji+s/gDhuY3+LqfKj9Snjft5yb46z6uLyNzVXOE/Inzb9Boobaev3F/G77mEgwhqzUfOcXPH8mZoafEtMmAQRHy3XGiaQ1SHLprsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcDmkRP6T7exeOjoWL2xQA2aYy/2vOsfdDVeTK8LJ8w=;
 b=VPQg9F4dcDwlvGTrzJpbpCPtVBjFkjqyz+jKL8gcrQJrtcVDEMy5ochb5+csLV6QIDa3/dnwaTZ+AIOSocR9hFTo3HLvigVIn3/+tW9cNzts9HJIgZKf6XlF2YA0L0U7cLFFmeIPIv61MUTU7RWSHjM9dukH+kh9N7hp9+qfDWRe0evsE8RNGsaslsKfmt/3En4pfVCAXzetWVAIcptFSHbD4k7AZvtIBk8jSJPQ1/H6BPZhQM1MvNkD6614xaH7zGWnewt8nPVjXQqryfq3c8SDWr7/Fbf712vHlkVXJLlSdOD3TGv545BLfhPo7RqqgkS39VqZcYS/HEppP4Z1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcDmkRP6T7exeOjoWL2xQA2aYy/2vOsfdDVeTK8LJ8w=;
 b=gF6Dms5dn4u93tx4KGgAuP7OUcN7DX8WrYuvueOtz33xYGvro75+kUp2MjppwWdaMWTqMq+W/xRDynrjQvJvsj6TmGXKQjDr0s4OXUxmDwXDp6YzLqgnmyYdwTK4DUE3e0s7SiXTZCGVnqvtW1PDF50GcSTXUaEJsD5xLX0lUKo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 13:11:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 10/35] block/backup: set copy_range and compress after
 filter insertion
Date: Wed,  2 Jun 2021 16:10:43 +0300
Message-Id: <20210602131108.74979-11-vsementsov@virtuozzo.com>
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
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c61c9a43-7497-47c7-cb92-08d925c7f59b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63762FE6CEF22DFAA42C4C05C13D9@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yCbOuk2VZP9if/fcIfX6ZXkTJ1bgBZDotnSVqAT+1XYFVMy9XmvpO3Cmj38qogRg6SKwkB/GFo2N46RPnqh6BpMJd3N/X2x4o7Kh8F0IrpjaROuJzeU+xuN0+EXhfhbJx/iGmvGTS8c0iF+xmpsy2L9zl/v95DZqMWcJb90aHfcTWi+MZgL6UTqUbazgAksQAeoSRVuhpAyTmbRHfDvclAcH1zcP3GlhYomnFq9Ikg8k+ydIq7dW7VfYVAyVxzVlkH4+qlZmiXWmNL10DyNSQkO8HF2IjxcM1JwgjTVE5mZ6Oqdlu76x27/lArxBWolgmwFhoV6Zuvnp0b0NVYRtXPloa9lds8NAp3lFmfGoBbKiZFLPcP8rWsa4Zk/Mg/BPlzkhOdl7ICatj1q4VdiPceMuAJLMJtPW2Ont0ycrVvqJfnZo9xGmFYTOlynnpJWIgm0hD1WqxoEH1QxbrkWyhAmfcNPHaB7UUPJPsNxozqUUoye3/jHuxr26FLbZqD9xVoqVYDh0cK7nSlI3uXoXaMnkZqSHT+fyNjGOqpFpDKUrjh/eR52GA9lzBhkMzX+aiHv6xF6W0dNNqUqL73AO8dHiI/CftxVQy+LvnC57zRy20wPxFtDBfxweSSxUeDmIdggLGX5scXWSasiZgBDnDUDg9XtEGUo+5TFdw6pib61bcSZ9zQyhfPvdJU0N5r/L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(8936002)(66476007)(66946007)(6512007)(86362001)(1076003)(36756003)(6486002)(7416002)(956004)(2616005)(83380400001)(52116002)(38350700002)(6506007)(8676002)(5660300002)(26005)(6916009)(2906002)(16526019)(6666004)(316002)(186003)(38100700002)(478600001)(4326008)(66556008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EuQyBCW/AmRymuhfWsFupNt2gRLs8xq47ZEnJ4X1VaS2hOmF+x0DqWpyG8Iy?=
 =?us-ascii?Q?f3eCIw4+UDckUXzzlSUclVw8S3CF48xYvbBUSsuWrCguuBO1rx4oF3MBpqgL?=
 =?us-ascii?Q?bg07eKQP0Cb4orfaO9pYuAopkFt9MzxFVhcnqJ1hOzpoKexPHNlhrP/6rTB8?=
 =?us-ascii?Q?Gt5is1ZQIYq1t4rLUEnxMlDpk5X3JglI46MvKPucsgsAS/xHsyA+Lg8cC8UE?=
 =?us-ascii?Q?UC3LiH/3ewFk7DUW5z/GMtGklHGr1a9lHYhpoppf3XL8ueSDWwgP3ib/N04c?=
 =?us-ascii?Q?av/qYkIq02ZG44WXQF6RoY9HR9Te1B3BdKIjz49AKvgfoOBilpv3HLGKd7QV?=
 =?us-ascii?Q?yi1xCiHcFGbyWCrqWMR7x/zlJfP6i3bz682vDp3kj3ySSUIRtgW4MlvDbclL?=
 =?us-ascii?Q?VcuVCx+BclExOxTD7wFYxzsfhyyeVWeoWfHkC04QnkTcfLk6OlT5wMEh2tK8?=
 =?us-ascii?Q?iKRdE7ixtPj3tMwVrVjPOWIFiRKqWa8tZN9xVeMuX+L/LvayNDkOLWcB35R2?=
 =?us-ascii?Q?6Tesj+PC+9BEUiQ1F/N5olXcO83SClHiEqgYzhFDOXi6tV6/EnQJRPHqAPUI?=
 =?us-ascii?Q?RN82adS2ab9oQKpyERxBV0gw3vJq7kssROmj9z+lnjx/qDNrOJdEfNVJKWeR?=
 =?us-ascii?Q?s686s1BJBnoX51cWa9DO4UCUhx+SF+krcpNCJssDa/MUPTVqOjGi/+9aClNz?=
 =?us-ascii?Q?n/z4RGpE/G9R9G/lAw6V74MwrfhPsJIbsZSHYgzm38fjg0TghnJNWLaH2G8l?=
 =?us-ascii?Q?7mmBdwTlsphodWMesspcZE5Z19si6pejqjt6+unniicHPfo7f9woC8yggSgs?=
 =?us-ascii?Q?TJb8h30oQcYM1q/8dMbsCy2Iv5re2htO87CQUMmJJHt7RkwZbLOlTwQT52yO?=
 =?us-ascii?Q?e7nd35p9EkAZ0zdDqot1zqsjmIsOsKapU401fKlmfkm04Pd1YiKVERBRokzB?=
 =?us-ascii?Q?iLLAoLyN5D2R0yNbN86Bd8gbNmzxSSamzsyvQy8dZZSpXNu72nKRB4VHSeY1?=
 =?us-ascii?Q?HMFhdc10wwAUlt8w2SCLqSPyWGejMMt1tz5k7phIqk+RtwoACvDy5UB0/5aa?=
 =?us-ascii?Q?rqY2bOAgJFq/JByQYxoPiNAecq7EZx+BwEYm1YzVGGfphaXazZcYeD2sznIy?=
 =?us-ascii?Q?qBtENgoimtkao3S+yQRgx5WDWamFxpy96ShZGnHKBWRfF/GzhK6nqdlxEEX5?=
 =?us-ascii?Q?huVbioI8h20AgEzYX4TTLEksvniD50MjuMcGViUUfbaWjtdVlqmYUViBAzlQ?=
 =?us-ascii?Q?OZlz49LgP9QjvBZrGfldRTa64gZWiraI9quJlxtaj7qJVmMhstNKPiReD9T/?=
 =?us-ascii?Q?r8XkFLfr8bObbVnECL8H8Gc4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61c9a43-7497-47c7-cb92-08d925c7f59b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:40.0337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xwTccNnvbM7Zr9rwHEyWneWUG610xK5LUg0DFgPwG6zG779VS6XVA6RlINipv4QDnatVIl4y4joG/gCSKRDmv2DAlRNbrRgFiW0iNL+LRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.7.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

We are going to publish copy-before-write filter, so it would be
initialized through options. Still we don't want to publish compress
and copy-range options, as

1. Modern way to enable compression is to use compress filter.

2. For copy-range it's unclean how to make proper interface:
 - it's has experimental prefix for backup job anyway
 - the whole BackupPerf structure doesn't make sense for the filter
 So, let's just add copy-range possibility to the filter later if
 needed.

Still, we are going to continue support for compression and
experimental copy-range in backup job. So, set these options after
filter creation.

Note, that we can drop "compress" argument of bdrv_cbw_append() now, as
well as "perf". The only reason not doing so is that now, when I
prepare this patch the big series around it is already reviewed and I
want to avoid extra rebase conflicts to simplify review of the
following version.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h | 1 -
 block/backup.c            | 3 ++-
 block/copy-before-write.c | 4 +---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index f37e2249ae..538aab8bdb 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -33,7 +33,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
-                                  BackupPerf *perf,
                                   bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
diff --git a/block/backup.c b/block/backup.c
index 84f9a5f02c..b31fd99ab3 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -504,7 +504,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     }
 
     cbw = bdrv_cbw_append(bs, target, filter_node_name,
-                          cluster_size, perf, compress, &bcs, errp);
+                          cluster_size, false, &bcs, errp);
     if (!cbw) {
         goto error;
     }
@@ -530,6 +530,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->len = len;
     job->perf = *perf;
 
+    block_copy_set_copy_opts(bcs, perf->use_copy_range, compress);
     block_copy_set_progress_meter(bcs, &job->common.job.progress);
     block_copy_set_speed(bcs, speed);
 
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4337076c1c..235251a640 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -170,7 +170,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
-                                  BackupPerf *perf,
                                   bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
@@ -217,8 +216,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
 
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
-                                      cluster_size, perf->use_copy_range,
-                                      compress, errp);
+                                      cluster_size, false, compress, errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


