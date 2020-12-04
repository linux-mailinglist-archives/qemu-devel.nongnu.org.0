Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6D52CF6B4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:22:26 +0100 (CET)
Received: from localhost ([::1]:46712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJT7-0007WA-Po
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFn-0003WU-MC; Fri, 04 Dec 2020 17:08:39 -0500
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:46336 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFi-00029T-8B; Fri, 04 Dec 2020 17:08:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjvG/LHRiZ7o77id5BGCJX5LFG7rX5Uh3uYKx5xgt8BFhhP1pKyYCXm9ULH2QRo4W6fCk2O/Qeqdnz4Ajp3sVGyBEoC4QJYfYHz76EJlupDx+90eWQOLxoUs2qyKpVqUPl1Sg272Yd20Lr9kgK/g5POQGvkWXuFHfV6zgFzSLQZn5paacsMdRnMmm363DcOe5tYnXUfdQ171aDfRVKw4Pa34BQRjNZPjvmUOLTNluDo664LUTO+P+xB7RQpzYGkqMoDjKA95oQjtrTuynqskMvqwWy26dGlk0PMr17G75M9sbgghsOshvd9ZHIaf4Ufh6pCFrQPk2pdhM1vdJ4pVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xnVXsl90TiPFBTKl0BlWd1jBpxp8GuzTkLjGlr/LNY=;
 b=EpNtpG++WhW4e5vVC5OrLkU3JxvWPmp6l2/3oCpYYQKLneD7dZ6/c2CpQpTFkZS8SuitQDqOug3hs5XaTeXIGlUerVfkXHZG2cjVph5f/pIdUXesdiEfLFK//UZmdep80JJQxuabTuTz5ZZaCUjzxQhagGt5W0FXIcKzitJllN0WQRxmokmsZIfn0smDjatWES8ROV0hTnith3zykpvJkE5H45M9yUd7dRS1QSJxziCeId+WX2ckxfbAB1SoutqQLiRo2CJSTB83l5hyXqRlJ9rMA7NV9JOteOUdoP8FtV05+mPLuKW5Qojs9ikdGuqyBATjne+K0ITOU1FKJv8pBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xnVXsl90TiPFBTKl0BlWd1jBpxp8GuzTkLjGlr/LNY=;
 b=hV/02+/CqhDDzf/MMZi+cB+Ln/w0zO1LscKqucCjAV3s/rW+rOp8sOZzaD2OtewZvIhvC476O+XzxxaNdSr2TjdxT0r6Sm/5YucaO28f5zxk7APCRrcQSCrX0E7bWAJPecnOhn4ESewPEAMWyE/cU2Ic9RwDX2Oz2ulNEj4bwMc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 08/13] copy-on-read: skip non-guest reads if no copy needed
Date: Sat,  5 Dec 2020 01:07:53 +0300
Message-Id: <20201204220758.2879-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201204220758.2879-1-vsementsov@virtuozzo.com>
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 4 Dec 2020 22:08:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be51230f-32ca-4d91-eecd-08d898a11cb7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB407254A81BE3CC928387B632C1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4+iop8y0IP/Ngbw+tvDHnD5tIKxhkEy5cSlPgAKtTwXTJV8PrcTpEfmgwmWw1wVJfnYJ+ZD8XjkMlpNMjVp/97nLFWajPJFwfgT6bQx1XreT6OsYA4mGXH+DsVbM4mAkxiu6eAYgVjp6F4GDlhxsLW5sM9IqPgXAjPy8mg+AI2ky13cod0V5wpQ2OQp4xE8XBa9/rdBa1cXHVZi7Z0uMCWZ+/5WDLsD4//AVgOVo10pHjxKhjdlAodzknsifswCKw+sg+tGELF/7yPBusvn3dN/kws4sP7dx+qtVG0EMotIzN1wQrQ+3ph8NBXNIPB0u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(8936002)(2906002)(6916009)(52116002)(316002)(478600001)(6512007)(6506007)(83380400001)(2616005)(8676002)(6486002)(956004)(5660300002)(6666004)(107886003)(66946007)(1076003)(66556008)(186003)(36756003)(86362001)(16526019)(4326008)(26005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nZAGNTs7KwrXd9uj231lQSYK81FdgehnOynH3cl7eM8lLz4bUdrYY0WwUFKB?=
 =?us-ascii?Q?Ot8qmcLaDCCPEMwBPrXrmsO8JSHgshUga2fW4datHVEHteoBn1Svy7QVutZU?=
 =?us-ascii?Q?INwnyfnJ575gGOp4MLFBbExubU4BmKru/Dv7ea6oW7Y4epJX5Y+I/j9dhKXq?=
 =?us-ascii?Q?RWZb5Yk53FNnZyCkrfDZtxNLnDbd9sw8nduYqFcxPI8DzSKAsWhaL5B1Cnjp?=
 =?us-ascii?Q?oFZcdIrUPP9g9/yQ8sPTGGeVchnVog8mECGA5MaXQHXQ74nXj/1VPBT0S4gR?=
 =?us-ascii?Q?ek4w7acQ+fsV0YIpGutLAphFHPOhuwz5ObBmX8NQBFmBsR3o2Fm+e3NAJpAO?=
 =?us-ascii?Q?sBE1mhzwaOwm+pV3P2J3Hxlujlq8f6CHTfDc/8BeaFLu8lKIOdnYCTymMyeK?=
 =?us-ascii?Q?HdTBV1pqAdG1KQL9pnVn4CjCzYif2plnuer6Oedd9oMSKVN8eitN/YIuqGar?=
 =?us-ascii?Q?1gCzI2Zcv8fULur6T6HhI8wu3/CVLt6x+YSyP1oG4puFYyP5yFlrxko45Vqv?=
 =?us-ascii?Q?MF10UcBRKY/4nzaUbHfwaGxL8XOZu/YBwuMMRRYPn2z02DQ1qyN8PiW24gPs?=
 =?us-ascii?Q?vaj4zVniUjwbsVIJREDecaJvWGIymqVDi+33TsemzOV9rCaebO2i2JDF49xX?=
 =?us-ascii?Q?90GKo2NSDJ6vZTXiNMS7aiiMcRklyByNmgJDidKdClh2vnKzdSPerB+b7KK2?=
 =?us-ascii?Q?UZ32tfvNP2oS8HiLMul65IQZpKHumHabbkxSVPGaxUKd42y+vCt2nIkFPDUT?=
 =?us-ascii?Q?T80dXGh2+5rILCIDlMButT/ewIyGVt2vLnJtlAEAexBSIh0EXtBQUfUr4YIl?=
 =?us-ascii?Q?qm4AtRjd06I53UbhnANX18DnVEpj/9rXbQuUZjcR8lkf2Fh9jPO7csl2iO5Q?=
 =?us-ascii?Q?4K2EOh2jVI8Pd/yDbbUZlaLYQT4qRFa39i/3o9OmevqoDT6K+VY+aRsnPfTt?=
 =?us-ascii?Q?3KFkeCq2UIKyQCURGXYnb2Hp1W/Bdj/RCRbAj8N1do7otPWdfcCeRQ1HBURs?=
 =?us-ascii?Q?zMut?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be51230f-32ca-4d91-eecd-08d898a11cb7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:21.3660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YsIypCgMwVSom4npan/qi7VBzTfsEsboggnuNwtMx4p6+bScZuVA1601+2y6LtlaM3IMLx+Sl+8+evdt5jd/s8fgRifplKRsMGMjeKWAkiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

If the flag BDRV_REQ_PREFETCH was set, skip idling read/write
operations in COR-driver. It can be taken into account for the
COR-algorithms optimization. That check is being made during the
block stream job by the moment.

Add the BDRV_REQ_PREFETCH flag to the supported_read_flags of the
COR-filter.

block: Modify the comment for the flag BDRV_REQ_PREFETCH as we are
going to use it alone and pass it to the COR-filter driver for further
processing.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  8 +++++---
 block/copy-on-read.c  | 14 ++++++++++----
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 81a3894129..3499554d9c 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -81,9 +81,11 @@ typedef enum {
     BDRV_REQ_NO_FALLBACK        = 0x100,
 
     /*
-     * BDRV_REQ_PREFETCH may be used only together with BDRV_REQ_COPY_ON_READ
-     * on read request and means that caller doesn't really need data to be
-     * written to qiov parameter which may be NULL.
+     * BDRV_REQ_PREFETCH makes sense only in the context of copy-on-read
+     * (i.e., together with the BDRV_REQ_COPY_ON_READ flag or when a COR
+     * filter is involved), in which case it signals that the COR operation
+     * need not read the data into memory (qiov) but only ensure they are
+     * copied to the top layer (i.e., that COR operation is done).
      */
     BDRV_REQ_PREFETCH  = 0x200,
     /* Mask of valid flags */
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 67f61983c0..8b64e55e22 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -49,6 +49,8 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    bs->supported_read_flags = BDRV_REQ_PREFETCH;
+
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
         (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
 
@@ -150,10 +152,14 @@ static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
             }
         }
 
-        ret = bdrv_co_preadv_part(bs->file, offset, n, qiov, qiov_offset,
-                                  local_flags);
-        if (ret < 0) {
-            return ret;
+        /* Skip if neither read nor write are needed */
+        if ((local_flags & (BDRV_REQ_PREFETCH | BDRV_REQ_COPY_ON_READ)) !=
+            BDRV_REQ_PREFETCH) {
+            ret = bdrv_co_preadv_part(bs->file, offset, n, qiov, qiov_offset,
+                                      local_flags);
+            if (ret < 0) {
+                return ret;
+            }
         }
 
         offset += n;
-- 
2.21.3


