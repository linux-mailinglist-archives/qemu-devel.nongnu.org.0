Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822994CAA2C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:29:34 +0100 (CET)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRr3-0003Jj-Kc
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:29:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPRmk-0003w6-Nv; Wed, 02 Mar 2022 11:25:06 -0500
Received: from [2a01:111:f400:fe1f::70e] (port=25703
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPRmi-0007jt-TS; Wed, 02 Mar 2022 11:25:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGoZUdI74f+ooRBdpU9YH9pvKpXeJIqXVS0+M5yhR40KOUbyz8ARwVGfMGwr81YF6tOluaYjdux7WgkRMTH4Rg877NdlhpH5OSV2C5N/ifB9ehGd3xF7Qb0pQmAI/gRiWHoj4GMvjCIscubqpLUNeIH/ubA5/TSe3+F7xfad78OCkL3oR3BpazfMpOXGgcdZTV7TUK6FxF1THy0r2SkudDVQPOO8wqirOpXtfNyFcp1CWAuN1WQ90ImDLV0ZHv05+lQc6lF/MVA9LWWud+rQhGXN/OjFYBrYKpsU5sCh2mGgGZKzkdwGU/4+AbWjc/Zh/c9y/pfty01sviqXiWffvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfaujT/65kfb2UByGD6ASV/gXT6CqqY6QsptqLKoffU=;
 b=mfAEwZjmoOMNCHEt4RWI38ZU6qdT8yCXM6HuB1kTAq7ZqkUWNC5EgoPCdGpw67HcB6f5APRziGEpzfvjdUTblkaCNSjZYWzbqNt1o01xdtKSgI0CFzqg8npefu6XdX8GqTRbteH833KtLPKamNyt7LUjEhT8/RifmK9ozf/Fox9S/YOIxobOtNpzlAmAIMBuOglYrHf8hsST3liGSGwFNLjeT9JlGJG17R9BvFL+Jbg/fDar06NFap0VSoz0++0NEssAKammNEakJywuIm46qgjFRzLPk8GOP1C2YTV0UHdNuHbhDFAApJyYMRmQICq6BDWOPVz4PTuLSQJsmgxM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfaujT/65kfb2UByGD6ASV/gXT6CqqY6QsptqLKoffU=;
 b=OUOLyJhvuhBmcZ09S3ssMxAt7gaO73dE9cSSLuuGDLlxVTVB7eAAKdpcW+aHPavpqyzPdT5YyPn5jy8xqlYpj9zEh+nowa3rNTLLQpRvZN7MKENMgIwEPH7ZMApLQgpFrj2NYNFBwDG4S3+rkoHO7MXh+2qr8Og+odVByi4zsY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM6PR08MB3768.eurprd08.prod.outlook.com (2603:10a6:20b:90::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 16:25:00 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 16:25:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 stefanha@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 3/4] block/copy-before-write: implement cbw-timeout option
Date: Wed,  2 Mar 2022 17:24:41 +0100
Message-Id: <20220302162442.2052461-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220302162442.2052461-1-vsementsov@virtuozzo.com>
References: <20220302162442.2052461-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0064.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::15) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e5c811d-10aa-46d3-69d4-08d9fc6932b0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3768:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB3768960E7147D7346BEFBBA8C1039@AM6PR08MB3768.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PHPaGudwH8WjNSMLnPGnUY0+uuxXnwAJ79La7ewDTT7yN7LbYxnnig+y1AmJbAWSlV+BbEu85htYBdv86TwTV6FFfx5TCHShuqgELqb5O2VHK/zpOJfOS6IU+XYjv/Q7bNqlg7kY3WAaF6DgQBvmhFS3nUAw7s6vGXoRh+hoPYGcFbg+Mk4QiR08of0ZuaMntjcGg+Qy4mMyut6qB+6V/Jjaqk9JKA7d/BuwUstKWdeDRMWOaBc90LNcfqlNWYC219lVeR1KXa2tdCx/xXPFGUmdEMOvo3EvnZtxj/ah2JW5ouhA+Dp4o4o4oQvuVtMxQD+MXQSBL0cxa3u23AkEFk9Idm1zjjALidOwpvfammZatTSKWCqWTjw5W+JT4RpUUfQYcTf2I9UfqVeVZKRrLaU6zL36b6/5+vUQC9tlwo9tQSecl54CTidwED9G9CWG9fiI5TsrPdHoEwsg9rwoogZylor4SUNvyAGTZTOJ2hhrxh1KICenHy5AxN3XqcJ2EET+3vkAGOWeX8mrl6dgLtM8v8cXH3Y/due51EAmwPaIyhqrFLIb6X/4yw8HHZu9toXPcRFJvBUENQUrm3J6iA4oH7fDTv0Kb6aocCt+RjLlEPmOQAnOziYmJBnq9gbDBQDDO5Tb8pUnvHvAmIdIxRi/AE+1SGt+z8yc2s9m9hscOmAl8mKjI5t2KfVJC/ZmtUF87AM0zh6+WSOfN0kloA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(2616005)(36756003)(8936002)(6512007)(38350700002)(1076003)(316002)(6666004)(6506007)(66556008)(8676002)(5660300002)(66946007)(2906002)(66476007)(52116002)(4326008)(38100700002)(508600001)(86362001)(6486002)(83380400001)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JKcsqa8j+nZTRYX5vMd+IrhmsKMCtD4ZY8NGEU3Eiq4mdIae+5FXU3qZgH27?=
 =?us-ascii?Q?pUOK5s+2To0C5wrfjbqcwztKOQKBBBinRR+k2UWuFw33Q6coXiogVcgofbvS?=
 =?us-ascii?Q?SqEm0L/jdeU3cOPa4GHVVV+HApnlXmo6tjBXxwfhXvREYG4UOEtx3D8wWZf6?=
 =?us-ascii?Q?cOCCr/uZZdaUM16wlLudMXeh+Ippb5LIKE5zEI/+eEZuElLsz8Vy+QdK+ijc?=
 =?us-ascii?Q?IAghuMd/P40oyyKdcOKilAiAQothyZ7caW9vBnB/ggk/jf5zfx+ZsV1Wou8T?=
 =?us-ascii?Q?2RWKUknM2tP9oouP01rc7CHaHjHyRksLdH8HxLMv46dP5yKkn9A4Lf6y9Hwj?=
 =?us-ascii?Q?gDfvcTxhPJKUJ8eYPglblVBItjpmXNW2dUoITOAUlt2xLj0Oa8bFCImgmwgS?=
 =?us-ascii?Q?aMgQ0vuRir0sPY0rqG1wg+TIX5vVOYLX4ks4dDO+HckJPb7HaTg+okTU9wJV?=
 =?us-ascii?Q?vwZ/qDNLT7XQAjtDhsIBBYUGy1fPzA8AwD9Rry3JO+ZXZAqGZl0uIlzeU0YD?=
 =?us-ascii?Q?KntZB3oEoRZBWzLq5mn274qEY02Ex7hU2fkyLPcx4xaK9flZPaNKglM5QdeT?=
 =?us-ascii?Q?D4howh2bFfzqaelpK6HzXg8YTh144FrBvOPQU10/U1lpgfv6rl3Ix48V2yqU?=
 =?us-ascii?Q?UMU9U96T6jILgTvcrtfkrJIFfzyLzplVlLZ/NWeZOmwet5H85Zxe76TQeRaL?=
 =?us-ascii?Q?DOLhn56lePIGhVDEe6GFA6+MwNcMHBg6ODPl+aq5P//S2iMVlXi6kZag1W/C?=
 =?us-ascii?Q?0HDvFUmWaYpYoHfMOI48wMEpJ43bga66tM0SKyxOYQTXhc1C+7dCvWkQHSBj?=
 =?us-ascii?Q?CYUftQA7Lp5JaH8ED9BGjv6FLRDsbE3ohq8nx/p4e5C2eNnNWke36e9SZU3j?=
 =?us-ascii?Q?oz8fT6Zfi6PfTj4bQ1NW4xhvT685GptJvOlEafMBJiBmlEscrdL1LdKB4Hfa?=
 =?us-ascii?Q?SP4rOXe8eYCKHQuoOyDovsS3qrqVIDesODpqphncwagJUCW3Y51HI/u9/vd9?=
 =?us-ascii?Q?budvE940XF3y9eQEbexc9YQquGfaFdh9Iwr1jcRv7ETBLr7el1pAQIQ38DK3?=
 =?us-ascii?Q?r+dW6llV3bIclQkG8HtbNOkUc5cpbi/udYVcRsgYo462GvjgZJRIbFMrwV1X?=
 =?us-ascii?Q?zW7v1SSKQBDVoL4af2Cbvf+cXGATCPM+Fr+DJv54ZmmsMv+2FsUd4D0VSTPq?=
 =?us-ascii?Q?2rNqFivZg6/FOg0K3PdQrk1i/YlN5W+eZ+l7q2djMDeD2vazhGintY6dToJK?=
 =?us-ascii?Q?6iA6tblnvxfI08IT5looTaclbmR/MMHn4hqaDJOMLzRbAtaJSuHGotMF2X9z?=
 =?us-ascii?Q?Qacg0XP0XQOVQOsNQnUA6Ptx3gke9qfgz/DaUx3Y+teZoJR0eQMPm80pgIcM?=
 =?us-ascii?Q?aVwQeOE8Tx0gA+ltWgtj1IwQMQ1KD+hWXWUBHF2bt4WVkvRIa6XQ1THgF6DI?=
 =?us-ascii?Q?cW3M7THWcHyMI4Rn7Or+MBJKeyw1Wo2IkzUnEfp1B1qBdzeVR3CLL6jLO41e?=
 =?us-ascii?Q?xLTwxA+cy0+B/C+zTfr3orDA8FkyQqsX+1jIeg3wzWV2EdPG2bhusu22eeyu?=
 =?us-ascii?Q?7A9HAmOIRaekVy8QskVCrkgf5tJKFDOabTCLU296gVW+uixJFgdVqnyigXVZ?=
 =?us-ascii?Q?WGZkBN/8ekqKaelMcUymIROh2RF9P2VWuF9UCV465aIRU4//Xa6zls/tJRLZ?=
 =?us-ascii?Q?A9my3w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5c811d-10aa-46d3-69d4-08d9fc6932b0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 16:25:00.2776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xF1DZsmbackoyGf69gU+PGtVSI6WcPmpZvaOOMlpcGPqHsP9hDQn+U+gmxMsBTgPUhttIOKz7P2bTCeEs/klNATOdDE88QnRsEMkC1auCZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3768
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe1f::70e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe1f::70e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

In some scenarios, when copy-before-write operations lasts too long
time, it's better to cancel it.

Most useful would be to use the new option together with
on-cbw-error=break-snapshot: this way if cbw operation takes too long
time we'll just cancel backup process but do not disturb the guest too
much.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json      | 5 ++++-
 block/copy-before-write.c | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index e5206272aa..78c77049c3 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4204,12 +4204,15 @@
 # @on-cbw-error: Behavior on failure of copy-before-write operation.
 #                Default is @break-guest-write. (Since 7.0)
 #
+# @cbw-timeout: Zero means no limit. Non-zero sets the timeout in seconds
+#               for copy-before-write operation. Default 0. (Since 7.0)
+#
 # Since: 6.2
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
   'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap',
-            '*on-cbw-error': 'OnCbwError' } }
+            '*on-cbw-error': 'OnCbwError', '*cbw-timeout': 'uint32' } }
 
 ##
 # @BlockdevOptions:
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index e89cc9799c..50681cc711 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -42,6 +42,7 @@ typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
     OnCbwError on_cbw_error;
+    uint32_t cbw_timeout_ns;
 
     /*
      * @lock: protects access to @access_bitmap, @done_bitmap and
@@ -107,7 +108,7 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
-    ret = block_copy(s->bcs, off, end - off, true);
+    ret = block_copy(s->bcs, off, end - off, true, s->cbw_timeout_ns);
     if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
         return ret;
     }
@@ -405,6 +406,7 @@ static BlockdevOptionsCbw *cbw_parse_options(QDict *options, Error **errp)
      */
     qdict_extract_subqdict(options, NULL, "bitmap");
     qdict_del(options, "on-cbw-error");
+    qdict_del(options, "cbw-timeout");
 
 out:
     visit_free(v);
@@ -448,6 +450,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
             ON_CBW_ERROR_BREAK_GUEST_WRITE;
+    s->cbw_timeout_ns = opts->has_cbw_timeout ?
+        opts->cbw_timeout * NANOSECONDS_PER_SECOND : 0;
 
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-- 
2.31.1


