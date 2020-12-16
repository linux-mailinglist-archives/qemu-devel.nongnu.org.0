Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3792DBB41
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:33:12 +0100 (CET)
Received: from localhost ([::1]:53330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQN5-0008ID-3u
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ8A-0002vx-L1; Wed, 16 Dec 2020 01:17:46 -0500
Received: from mail-eopbgr00134.outbound.protection.outlook.com
 ([40.107.0.134]:2800 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ81-0001G1-5A; Wed, 16 Dec 2020 01:17:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuTfZY4J4wDtY40ipiwOhH0HxUaD8w/mPyWgoKxSQyrVfmN9YtgbkkOsOkuMZQS4l4/mSREHMBOVJ/oyjlW4TcmFeheRtUn5S4AgHa1iqK/r30HM7VbpYMf3x1MOYh/5zIS81RXLIRgFpIypN8cI9JVOwjE9J9vdFUV+6eyzAWLMqFxIk+k2fj9KCNWXYfmrqtKvf/Wmbb0bK6m2hZVZCmt4MDNEvWmRkKdVusSEmhDU7ztSylY6j7MA854tfCfsPpYAP+Jqv0qPh0zA9+oK9ZIbxVp5oUOeesnwhqLRxuzgDj3htTHOcJv1F3rN2C3HLWn0y5Ir7R0ven/iGozxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA8LQ4eZzyYMhSG9wyttv6NAPJeEINQsntt7+iQw/e0=;
 b=jl/zV1Wr18wkiAJ4asGInNhzN2pnBtMnz77xWuipW5OyRyKbmzMGp0JoWXlWnu/mh8Nwz6ga9iTjFsoXBy8QxCJQ5u+7ZH+WiAmXMK78W8vWOwKiAoDwBHVtOGQGqDa06ESyX9xvXwMLV0n4dkzuRKpwR3wBXJ0Aml6mYYrbRrqzDWT6lbFTlxKJNESZVIn6UOnW4O2wWVyVZt3cMTSQgh9YtkVQB4CRsrgbyo9boWokhSdTLek7UtCnuaIQxz3V9V/Hd3puVhlL5DRuNpZkZmsN+3yyqt8H/qxeYN4twkr59Q52gc1lawu5hUrq8+HDBLG/KZGSplQrEajlVaUhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA8LQ4eZzyYMhSG9wyttv6NAPJeEINQsntt7+iQw/e0=;
 b=LGB2h2sWTZAePT093RytSlUbp75kOYEGYOSy9m5X9NrIWT7b8OrSYtb/X3+knSAELC9vP8pskQ1W+N1qhd0S810i/X5RwF/WTdLStxb9ezwzh55IWmfp4YLFCAtgcmXkuehpwFgR055BZEkbGurTuwoWnMLOTq1e15Lw1vxPX4g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 07/13] block: include supported_read_flags into BDS
 structure
Date: Wed, 16 Dec 2020 09:16:57 +0300
Message-Id: <20201216061703.70908-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216061703.70908-1-vsementsov@virtuozzo.com>
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f82bec2-5c02-40af-239e-08d8a18a4108
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6309FC1AC3E5746245CF69E2C1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RY1hgH4+Ri+f7NZM4VA3YXDiAhmltTTTm+ZudWebG4AfxPcy27HPV+excdz0pD+oCkbRBh2rVO4cmCt7UjyStJ8Rd+hi+pxWjTP9Z+106/yIvcKOLSitApwACHEnjy9UOGAvffooK4yJYbHS5kzzs/iNBfZM9mHEIkHmadMf+cDIICE0Es7HTW/+qjvFt2FC0yFrM21TzI78v3MvMK8nqS2INriksaIW/Ek9O1SZZ03o1AqJsnSPTk3OopHWGZRTPOaWarTFzLbgCJMZfemfv+lYyEEeVgqjy93gX2leD5ZJYJhHRpsjvfuWcCf0qLMs7IXM389yfJ0vhXwfOd5BbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(39830400003)(346002)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pg5QtUHmhCmUrOkjbr3FMAKkOeDtm0TOUB2OGh0Q10rLWhGZyfVHyTZPT0Ku?=
 =?us-ascii?Q?DCBozX5r2TWAjskUp1aTA6HtXmJ8JJL5P/0vncUOSiDRk5G4dpe328IhHsD/?=
 =?us-ascii?Q?910KAe1oPWoL5LPoS/BWm8K7bwRrJv5BkjdKPQcyX/2/X7VfJaaTuNCx3c/H?=
 =?us-ascii?Q?t+X0tNthkvqRVLeWVYyVXu2jbkqOCSjCV7N1eTrMOxSL3OMKXR/RAJcSLUIF?=
 =?us-ascii?Q?TPl5jbF1ZrnGRrVHyDwhkQ3yWbsNTcejc5UdlWGRC3qStNKHmvZUvvFvv7Ct?=
 =?us-ascii?Q?hOi4MX6v5AE2lqnWSQLjxHDqKl2ypTDVCay//nGyEFkJvENW1OJxQLamIije?=
 =?us-ascii?Q?3Ng4gJFdMh2se3qJsyjFIUQaNX5PokEjjhtnwcMeL3Hz7eNztPeKQR+l4Hfi?=
 =?us-ascii?Q?Y1xlp3fSIKvZnX1YE2Snxv0I1Vex4Q6EbvWtaIbA83c9RRVWb4AGUN0jbBWu?=
 =?us-ascii?Q?Dzoz6OWVnS6F30Na7O14Ni0VDiQuPij14wTnx/Iw3ybqrbjMRGtqIfa+wWKf?=
 =?us-ascii?Q?O0h/lS7c2NzelmG9BI1l4htCr66Zg3yKVqVwvyLvUz0Tsm6jn21KiR2c4udP?=
 =?us-ascii?Q?jtVC/yH5sOhtXKfp2CGN/Jg8b0/sAfHZmJ7Dcbq7OFhw+3XbDe8/Cu6tsRKM?=
 =?us-ascii?Q?xJ3obmgLBZCxIaXsd5mDgNVaqjhobpmsWDeaPaUNuEmL6roFB8tFb2vSoXWO?=
 =?us-ascii?Q?zIlBUJ3gCMoPAcbztq/zsqcgE09kUepmJSTyDuU6nn26zFMC4c6Nlim0Bn94?=
 =?us-ascii?Q?dGgJdOkqSkrgtBj0RAjeaBlvQj2kA4EZMTC8GHjJHE9ZvA1Xz9YclY52uv1S?=
 =?us-ascii?Q?R4BQ3VtwfyNicCSp7xcsitxF+gVViEwXJJwWt4Co/kRBgS5m2r4mQ9v2rb5e?=
 =?us-ascii?Q?Fe+4m+ObT14MEgxSLtHcge70NMF0dUC/08w7sURYjWJMYwi1dY163J3lHKbl?=
 =?us-ascii?Q?+EMPX5R52zV82PHsYYqrP0WsJEnTXtVscFjooXvRx6cJhiT+ePrviypgMQW6?=
 =?us-ascii?Q?DOr3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:24.0769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f82bec2-5c02-40af-239e-08d8a18a4108
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQs1gYwzDgedZKF43yuJiWpOPwT0OW9gFMpeE86Vm85LjdTGN3Ibx1vx/7/Jz7gj/7XRqu+yQuXM6aOYHQ0RZp4ZiFqM7o7QM1cRoNWV+DE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Add the new member supported_read_flags to the BlockDriverState
structure. It will control the flags set for copy-on-read operations.
Make the block generic layer evaluate supported read flags before they
go to a block driver.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 [vsementsov: use assert instead of abort]
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h |  4 ++++
 block/io.c                | 10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 6f778e2517..1f56443440 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -881,6 +881,10 @@ struct BlockDriverState {
     /* I/O Limits */
     BlockLimits bl;
 
+    /*
+     * Flags honored during pread
+     */
+    unsigned int supported_read_flags;
     /* Flags honored during pwrite (so far: BDRV_REQ_FUA,
      * BDRV_REQ_WRITE_UNCHANGED).
      * If a driver does not support BDRV_REQ_WRITE_UNCHANGED, those
diff --git a/block/io.c b/block/io.c
index 24205f5168..851fe53604 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1431,6 +1431,9 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
     if (flags & BDRV_REQ_COPY_ON_READ) {
         int64_t pnum;
 
+        /* The flag BDRV_REQ_COPY_ON_READ has reached its addressee */
+        flags &= ~BDRV_REQ_COPY_ON_READ;
+
         ret = bdrv_is_allocated(bs, offset, bytes, &pnum);
         if (ret < 0) {
             goto out;
@@ -1452,9 +1455,11 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
         goto out;
     }
 
+    assert(!(flags & ~bs->supported_read_flags));
+
     max_bytes = ROUND_UP(MAX(0, total_bytes - offset), align);
     if (bytes <= max_bytes && bytes <= max_transfer) {
-        ret = bdrv_driver_preadv(bs, offset, bytes, qiov, qiov_offset, 0);
+        ret = bdrv_driver_preadv(bs, offset, bytes, qiov, qiov_offset, flags);
         goto out;
     }
 
@@ -1467,7 +1472,8 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
 
             ret = bdrv_driver_preadv(bs, offset + bytes - bytes_remaining,
                                      num, qiov,
-                                     qiov_offset + bytes - bytes_remaining, 0);
+                                     qiov_offset + bytes - bytes_remaining,
+                                     flags);
             max_bytes -= num;
         } else {
             num = bytes_remaining;
-- 
2.25.4


