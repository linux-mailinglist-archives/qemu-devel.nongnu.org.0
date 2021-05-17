Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD1F382504
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:05:41 +0200 (CEST)
Received: from localhost ([::1]:56044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXJn-0006Rp-6Y
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0O-00046h-9m; Mon, 17 May 2021 02:45:32 -0400
Received: from mail-eopbgr10124.outbound.protection.outlook.com
 ([40.107.1.124]:1412 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0I-0001ta-9S; Mon, 17 May 2021 02:45:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QguWEmuiATTSwsaAbE8V2T4jLcuZk8OoOFTghy2DG9ESUm3qaf2O5K9B24OGh9iI4Q7I0aPBQErGyp8XkLa07ptuploZhfrgQWiyjYmt/8S7TMxVDkzOenDGVW3IMx1GO9RDjqqG2/il2Wd+6t/hvs1ZpvunpjxmM3D9T2BsbTnXXSgo1AxE2tcxeh9RE0VEOXIE5irKxdfhpScZt+aaUn2M6T8jMtZ0tJsax+h3xZ/3moT54C+J5WCxLIIQqi8SNPnkb70OCaHoiTyVV3E9T98iUbLq3gAqL3uULL6nsus1/SutWlI7bCkI10uzE870ASQ1PbWhhSLlKVPgkXNkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guUHDQrt6Y27cgogIJk/BrlkFCoPrm/4UrA4hK+fMc4=;
 b=dV141JzZ1G4SRSaoUtpqxblx7tPCVFzU1pJfqLA6nDngJXfh6wsx9dyJmSDgKc/VUT1w8EgXN//r1hDVeholqeAql1uMM6QAGJ+P9QoSmNBQa3QDQo0M6Wry2ef64yhrjDaW5YdgPBnAOAQ0EtrQg5LPCl40YSRX6Les8eUfAH7w8VWJG4I0mgtpkSU0IewxZeESd1b4Z6UpBDPfjCzCDrhiawsZDBQ9uWjL1ZIr7133kGkculT6oneF9qQlPjATlET6PpAq1JJYWhRTD4NcJ+3HYweKCgXatpU47NwufWlstv2lxdyNoXBTT3ltL09dnSCXGJA+6ZVJPnPUkeykGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guUHDQrt6Y27cgogIJk/BrlkFCoPrm/4UrA4hK+fMc4=;
 b=iaHhPZVOK07QS5SUgREI5WwzXEo109LLR6B1hICp7h80rvp2fo7/baSR2rcYGYFc0A3kVHVic7kFXcrIK1Bsezp9iZsCH5DTP6qUeSVfuMpgFYWq/24cO/w4tJyX5LGPiDd0oww7Va6srzS+fh2JKOCDZh/KmbqrhNbf49kS7M4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 06:45:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:45:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 15/21] block/copy-before-write: cbw_init(): use file child
 after attaching
Date: Mon, 17 May 2021 09:44:22 +0300
Message-Id: <20210517064428.16223-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:45:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a56f496-dafb-430d-c370-08d918ff4e41
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB434159D9C527DD2200DACF7EC12D9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GgqfmPEXVMBMdspLohHEl5nMVZ3MJZZ0xYgBMZ4zUFzGnBuS1va6nbsYqCSn1bszfAhFgTFT7R1LClfXVxS3AY/E5uVuGDRhoL4ThBifyRb7NI0+BKqWCxMRgjDqvK4l705Py9/X5JzK9c99lpemO1MFDbP66xuI/3A7FazcxTH4R+zXScs6KbB8K8ylMus6hUNiQQSZHpmZHLkFsffSgOoB1dSOuWH/wPF/dkaVza4CHuYKYWoPjlIsDttbxVWarOIMK3+wKpm8KZ2Vz6qCQBCI2EEnuyioQl18QFtT8bGm068ndlhAMe32Z5ZQzuQnzLsShVG7UP315yuQOw5LDnkfd6iX75l+btDYFgrShN4n29/dof1SlB/m14rXUsbNwsnpvloHn5nA+Lhcnulu0EHxhiRfs0OWCEY7cYLQLsfUyFyRryT2AHpFXP4k9YFHSwRZg+4CHNXtgoVcDHwzu+AVxOZ4H2510F+l4XN+FU/zoM5kl9ttitu+kNTQF91H6gWjdrxrhX8+LccBPTRVCZXKFGyLPYWtRd5YM19jWUITWboSTt7Z1JFYC1iTAI92S7DFbG6Y6G85Zbwu6O4lr3mXnoY/wm2RyIfP6KJZ0yTS55CjV90DOvzJ2CZbRY3gF9JC5h/pzCKPxXGEqCLyY4yLFKFFaTjob1nKMmwFkJdVOFpUyZ4+z1hnmluQg4Gw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(1076003)(8936002)(316002)(107886003)(4326008)(6916009)(6506007)(38100700002)(26005)(8676002)(5660300002)(86362001)(38350700002)(186003)(7416002)(2616005)(6666004)(16526019)(66476007)(66556008)(2906002)(36756003)(6512007)(6486002)(956004)(66946007)(52116002)(83380400001)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MMIvayj8QTgatoEqPJud1UBJyehglDej4rBuEmAiIVO74ydiEU1Az3PlWwcv?=
 =?us-ascii?Q?cvB+3xUA7BA/gOT8WNy9LVvBRftHnrgNfWSgwJMWJlw+MEso9LoPz6i097re?=
 =?us-ascii?Q?0d7U2DB4rAXqvw2rJUbY7osfeM4Hi+jpZnjxX0fKefzJo82U64ZXzhhuVWXD?=
 =?us-ascii?Q?61jGPEgdp+HiOy6INWDIUwz8o8HsMVfIxp7ix4Qs7kyiq2200iQuNXZ74fgM?=
 =?us-ascii?Q?bq2U7dGa+5HCS2hLrGuQh8tThliKk5lyKPSuZn4pe+a+VNbN6+f8cCD78Bp0?=
 =?us-ascii?Q?I5+Lrsu3qQ7LIUnZpgjnVReto9fJr7FJlUd3IWp1KofxedK8h0FxQsbOUjm0?=
 =?us-ascii?Q?ePwJdbkVlgZe6DcfhD/u3vxxTTvwruWdIFNLBL5tqUwxg2WDyVJFUBkfdS8Z?=
 =?us-ascii?Q?2oEYbff3okjQie09svj+xojtPN0vxUaCvorWkhGCSeF4ycHPJEUr0z1geFOx?=
 =?us-ascii?Q?xKhlzepzjY4vMV6dd4ftWE8E++XfHfDkzwXnqS//L9SVaLUnef20X9Mq8+2z?=
 =?us-ascii?Q?1JE+l8T6jTp8ZSPK746rn7x74c6Nam8cvshVDVzh4Lt3eZU/gOMJQ2AlPNDv?=
 =?us-ascii?Q?iwReOHPlkWOcOfnPExzeHkMikiuBpUWf5L8xqAU/OxStnYexQQBHe+VqTTpv?=
 =?us-ascii?Q?UUzmE/N2C/gsXQ1WpeyOidYrBND1Z/O3zQJbKZwUHiTjT/2PqNjxCug+ykxk?=
 =?us-ascii?Q?ArB/L92y0XyC6aASj0lnAx5sk+FoVEFy9DCQ9l7rHdaZkwoS27tN/oUFm0X5?=
 =?us-ascii?Q?TfJczB+u50AJZjcTSpIoIiUO5WiWQb1NctHf9mbJPtFIE/AqMckzS/BHOImb?=
 =?us-ascii?Q?+U8c6FnQZHvdEdr3rKuxdRC22EcuPO8dmIjCJB7F3KZToHgPH7l5jAY8jkD2?=
 =?us-ascii?Q?zgTypaPdGainBimt2kACV8bw/GZeAM1wRroBHLp2QM3+Rht2TCq94yLsG/S3?=
 =?us-ascii?Q?pqkTcV4oOY3st6nw9PhgEJrEll455kTKmtAsDfL9+It/cRzdUkN9udY+Y5B+?=
 =?us-ascii?Q?1oKLJ27KGfpsa1Nr1n/3agMVEc1CihQc9irLpvEq7ngYx0ATeZpKpeGSbQDB?=
 =?us-ascii?Q?e+rw5FzoYywHadmHwvtwQ507sx4eO40DerdcNuv6P1Bp1nUAMoLYWxuzOhU/?=
 =?us-ascii?Q?Gv2Sjk8BECrmeRHHP2r7sbX+NXKqGpcN5RHKFMcNttg4zwTKrNFRA9ucPYsh?=
 =?us-ascii?Q?w/U0Qui9h33QXxDy7FfmCrf5LpwwUhjEmzXFDIsq+PrA/E5Z/OWNtz7ept3m?=
 =?us-ascii?Q?bj+2s/C1UqWFLltxFd+VYraWYE2gMZMzxbDrKniL9UXygQGg7i4FN5ReEpIz?=
 =?us-ascii?Q?Dx7skME7e9M5pYyO4M3tMcd2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a56f496-dafb-430d-c370-08d918ff4e41
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:45:05.9739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFIeqmxgwcsgEt7YkFJjZ3uKZQknUyRQ3rdPDAQYdHi+OAgEorbBv7VuSCZ/4DIPJBzHNM+r2xWBkqCLypQw+eQKvEnHJ/L0p3QoW2qDpII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.1.124;
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

In the next commit we'll get rid of source argument of cbw_init().
Prepare to it now, to make next commit simpler: move the code block
that uses source below attaching the child and use bs->file->bs instead
of source variable.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 78dc421db2..ddd79b3686 100644
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
@@ -175,6 +168,13 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
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


