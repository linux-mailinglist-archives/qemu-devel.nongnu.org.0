Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6B1398A53
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:23:07 +0200 (CEST)
Received: from localhost ([::1]:44870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQpu-0005ZW-8U
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfO-0000wp-8X; Wed, 02 Jun 2021 09:12:14 -0400
Received: from mail-am6eur05on2123.outbound.protection.outlook.com
 ([40.107.22.123]:34529 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfI-0003Gh-Ck; Wed, 02 Jun 2021 09:12:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIF4E1gYr79SZXGKZjOwMvvTK7ybKwwa08UlSfYqay7mn+qABG3CIHM4QsPTQBJNvkq/t0G1bDjpYLxiZvHC6er2vqCRPalxUG7CACQ8TIGT0mnrD+ap67gyGrCQqh5iicVrkCMaCfEd0OoROZK4DMg/1mkwjv1h059dkyhn6+w7xyk/9mJk4sRKqtidweoLiwP06Wr7Mm7hHXNZJLlCsSOPQFIoyCR7/wxRbGDq6F8IrL0nehiM5Qi68uSxdceUkbDpH+R0GW7CCdclo638WApmOAMWDaHJIPVjV91+YJHY5kn47+OmRz//7z8vA/UycBgIAvHsppbCTOy8Yuwz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=P2jhSj1BOJ+4MHOP3FCtpGPwWsbNEwNz4T4XHLWZeC2PoU6kSHn8q5xphOW+y7MH2SFRfyvtGc22mLQRbBpH93yji+erYDYwRQ06sum8kTYSLoQFFW+S4Lu54WkqaRmSzCCjQYG9TO3T+KL4AwIjqfDMrZABfSJmmpfExu3DTl7lGfmWMtAUp2bWC+18oefS0kYi3c1bF+uailg+HIi2nYsfnVjYVYDLXKvWTo8VZJAnRTP33t4XVaZDu5ovwBCNcg75C6I9NgxVwy31O2dhaKaJ6dXjd9/IBhe9Udw/8UxfkAd1IVanTDccs/0PEMSp7uQqvV0CYIn/3pUKSvXU0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=XMcQP61Ssi5AdhliS4r3pXbfwWpgEGnxwY77FciPXPF92HDErOTHDEu42UmXRDqGl36IT7biSWy0eM/Zsf4Uds49oTU/VzlJq/g8XsDGpSWXkxHcvh5SR2ZDnwhSkY8GPQ0H47w+yAnLyxCqQA36FMRSgQFrnBEtypK6o544SBA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:11:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 17/35] block/copy-before-write: cbw_init(): rename variables
Date: Wed,  2 Jun 2021 16:10:50 +0300
Message-Id: <20210602131108.74979-18-vsementsov@virtuozzo.com>
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
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d02176a-7db8-4145-f3e4-08d925c7fb76
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6693FDC827B0B24E66E5EE84C13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0EXvc/KGirYBPuRnvOERGWUQJny6AWhnXbsT6cvB0kdJ2ZD+RQidOxYfKrxNxR5SFHM/i3s9LK8iFTW8PgMxMknp6q5qGchaaOukCWv+NKllNpfw718tWqWMZ+rnqxs+ZKGgv2eWGdvFTl10sGg0uj8/3TKnQIPyBEt8ZyFdzm/RAUiksUbGlpDf7YNiKV53jc47OIwJ8YQrPDUYVuAxaIbIBs7Ys/0b2V6+uMGsNh36vKgeMRn6J9SsXmZV2lYdtF1SHJO4uLrYteT5Fr/ugDxsB/c0myuA06w5Njvem62nXgEIfuPHuOv7Kxj7GI2MsltNxzC4axKkoyWD84ynSug+gD5xANk1Ximzs/vwTwmmKUYS+S5Hx+o8BFE7EM2XhJ6Av239iGdH2kXcM26Yvd2YGOt5MU0XO58ZO6eHzanJdnEBmZ77u9HsOxKO/InTzSB89vHWeu6a2yD9AqyJHdHvJzRLeYOk4svTGLBHzWPG8JFtMxqmJo/zViNPCJEaxA/mNn2wCMi/vr8LtLIEZdcBt6E19SGxjIv1nAIJWIDsIUUBDgH9E72CWGQvCXyXcEltp04Q9MKDwAL+mRmryOhneNiLXPXqwFKd1SS2M2v3Kbx4w0NqLYFmacqhyuLJe/09C/bTaEp2Km0h9nLuwRMCiICm2QthhbmuBUjslL4Kc2xeWGE4DeYvcg/HL2oc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(6666004)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2cNhhSjFe+xlGtwy8LlelIKfX3LwcLkkEWc0+dkUeENIIAWkdpT/k5RbwYJ6?=
 =?us-ascii?Q?iqQsde1qR5Z7P+w4ARVMvxFcKSyy0QtrYNtID42uuSBmg9cqBoDNxXMf2G3r?=
 =?us-ascii?Q?SY+CKSc0S+tgNu/8HWePEy2NBvQCuFeQBEJtdzB9+oo1JCoyL7PRv0vAoXIu?=
 =?us-ascii?Q?dPcM6bR3RH+OF5taZUQxma+0YgqpF2ypyyDuFRc4yB3VwNYUyB/eOK/60wq3?=
 =?us-ascii?Q?qQfRcacTVSIx59YtQbavpfzC3y6rq32DN6dvNDRcqYpdcOSf4E8Ejkq1fF7R?=
 =?us-ascii?Q?3U9eE6kx5O0ZxEAyXCY/yxXKl8teJECNbYfjfEMXmDYoKgHbb1EEJ76mBNGw?=
 =?us-ascii?Q?+OGyecIoVjF14hbDOwHWiDyIb31a9JiYEReIXrrqzBHU57t30PSGVE+jYMuJ?=
 =?us-ascii?Q?uM1Yoy5w+q0LB76EfPNEqsbq4UZ2vfb/ZvEeC5NiBwA/JJ+XHOT0eioVK0vR?=
 =?us-ascii?Q?Nfn4/3mZ+LLznCITL9bKYqF3kIz5P1G4IvYi/y2I2V8RgakuCTUSSOT7G6ys?=
 =?us-ascii?Q?iBn2B5YvyMmh+M9BKucmxX1W6yIWYu1i+XyQmNcDDsWrpf2GRLJPgnnUJn0B?=
 =?us-ascii?Q?0lnPUz2ex/M6pGER1+XJbv6ocdmQtbevLlrHY8UrUuAgJm1erRaRg4Nj8LRQ?=
 =?us-ascii?Q?WkYhzzfaSOAfPGf73oqPrf58ZwtfOEuD+W5dDtqnMerFKIdtTfm8tYYPXuEo?=
 =?us-ascii?Q?3ii2Yaxi5rnvUTWTC5SgErN8u5aCxc3819A6dutk9thXFxxKwiSaO1D5V7Od?=
 =?us-ascii?Q?l1QAMNZHmMmXy5CVNsnjLTbtim78qY56S4rLJnW2LIjk9Cr/suP9ez/uWTuK?=
 =?us-ascii?Q?k17Xhco/H+7ym3PqRP62H2FImRD5LAUCnWf54Hwcv7sdxp8gtykqRkQd0zRZ?=
 =?us-ascii?Q?JBB+NJMZg6MwlA2qS+12+mngTr9f8Gn8zm+2QkcyrkL1zB62JLQAswoplB9w?=
 =?us-ascii?Q?2FJ4RY347UANxTlnRtB86PxXSCQ03rF8Gs6QFRRzabryaS1L5JYdZasMgci2?=
 =?us-ascii?Q?+6ZHLFizs5D03xOIy8ORj2l4loKakS6OldAL8wg5o5v5L5mNzNV9q7OrFvgg?=
 =?us-ascii?Q?G31rEBoJ/jIMR/E2npyr/qvpZSv7lU50SGV3orX++MxQ1xkft6zSAwc/at4t?=
 =?us-ascii?Q?W9rFcdLMpYCPhya4BYsd5XzwHemmU+s8PDk8WgKSvRDRq0u3UkKRZOirS1qE?=
 =?us-ascii?Q?zqu86hXuII5tzKyU0gd+ei5tq6WA511V6OKvtw8ofa9PpyTHQczDLgBSZN1B?=
 =?us-ascii?Q?u7SPN6NzNM272dRg9lFKAp+YjKmIDaKn7c4LNL4N0rZJdF7qwjNV+V5vArvs?=
 =?us-ascii?Q?aXl9KTw/4e83VarPgSBFUgWL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d02176a-7db8-4145-f3e4-08d925c7fb76
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:49.8337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTCOdgIRFDlA5IeBEv9DAxCSkI07TLGuyg73nwJn8uP+CFB7qbyJur4pUny98JSuP7Wl9/SbSpq1WDXvSvflnUb/daSeWpGjmaspNXOFwjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.22.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

One more step closer to real .bdrv_open() handler: use more usual names
for bs being initialized and its state.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a4fee645fd..d7f1833efa 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,38 +144,37 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *top, BlockDriverState *source,
+static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
                     BlockDriverState *target, bool compress, Error **errp)
 {
-    BDRVCopyBeforeWriteState *state = top->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    top->total_sectors = source->total_sectors;
-    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+    bs->total_sectors = source->total_sectors;
+    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
             (BDRV_REQ_FUA & source->supported_write_flags);
-    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              source->supported_zero_flags);
 
     bdrv_ref(target);
-    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
-                                      BDRV_CHILD_DATA, errp);
-    if (!state->target) {
+    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
+                                  BDRV_CHILD_DATA, errp);
+    if (!s->target) {
         error_prepend(errp, "Cannot attach target child: ");
         return -EINVAL;
     }
 
     bdrv_ref(source);
-    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
-                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                  errp);
-    if (!top->file) {
+    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
+                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                 errp);
+    if (!bs->file) {
         error_prepend(errp, "Cannot attach file child: ");
         return -EINVAL;
     }
 
-    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
-                                      errp);
-    if (!state->bcs) {
+    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
+    if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
     }
-- 
2.29.2


