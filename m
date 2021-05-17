Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC1B3824E4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:59:12 +0200 (CEST)
Received: from localhost ([::1]:36540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXDb-0001Z7-Cv
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX00-0003hP-QA; Mon, 17 May 2021 02:45:09 -0400
Received: from mail-eopbgr10124.outbound.protection.outlook.com
 ([40.107.1.124]:1412 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzu-0001ta-9g; Mon, 17 May 2021 02:45:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVJTi0XD4p4xc3+s5p5sfHFU24JcAzGtl5bEhPzMAXzs6lGR31VALGVrXogmEVepW+Jx3lzhXKzQnCHeD6CgCtRCHIXpaAY6AWKqk7w3JeJ/4ANG/P7YASqcR1ljD6VnXNPzBw+9bfDTVqTBZ4UrPZI6K8xoHjOIDZKtp/9KFtwLx5aCGah8B3SxhroAFZ3kZp9VFm6uFcL5c6ciNVy4yeCQKZajvmBKOJcTdwAPYNHd2172scxnIZXPahlugFqlplryBC31+1zl8JD/4HU26PJFCL//paNkvXAUzwZ69wQRsneG2Dc91DvXJaxijvKecdu+cPYJrYAQSk8B540kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4E2XWACg3coUwhucaKGu/vx3ES3DDOYorlvJpdOlFE=;
 b=nXDXyyWpM+6/8Pi+5Bx8i8RcnTxesrYGAEdnWckIV+wgGvAtXXtQR+l8Dp3lFUDXUEa2B1mMK9y/YWSqQ1QLrP29raF2db3PniW6W55Nb1okz+5aU26im+3yRFm+NxWYy9giT3+fYRRxUv8woCZ2UcIw8xOwI/XMs7Eg5mKhEZvK2ziGAz0mqLaMNqdi0dehOIR4d+TP+9kCDmWDy4nbX5MPrb7ztmXloGd47nR2Glx/UX8P+0pozT9ztVT4Cd/hikqHs205apIxWeQWAuZrjN7hh/qrt684TdpiU3dhJrFwUkn1D5CGzbMpasP9oqBmlMPQJJjSymvLhAgBTY0+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4E2XWACg3coUwhucaKGu/vx3ES3DDOYorlvJpdOlFE=;
 b=C/PrcveeZkuImcJXd3ZJTs5JeoKGNuCwOB/1pFe8G+GjSAVOxkiZiYoGPZJPq+r4SiXurYaP2VMKyZgAU2zdAm0cMhOYRtajlG6XSBvqarVaOSob6xgzVOOMBOxmeX1u6QEz4Y/lGy96XhnjeIfUcu6XslCNNeQz0bdpV8GZaB8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 06:44:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:44:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 10/21] block/copy-before-write: relax permission requirements
 when no parents
Date: Mon, 17 May 2021 09:44:17 +0300
Message-Id: <20210517064428.16223-12-vsementsov@virtuozzo.com>
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
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:44:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05de687b-b0b0-454d-a22e-08d918ff4a1f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB43411C4BDC044C07572C1113C12D9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kXW6UEKyMcxIE1qqsYFjg0TOg1T97Kur4mwGSrQbXwDB+VLHCZnr0WlnSvgv6y0j+wiIVlZS8No/mUXI14lwLCyPnFmwnjaYbIvrunrALiP4DiA/XYVtgCMsIHWmAqnoowSLzJI4te41JiU/AnbQXFgrTq04/WQaE7ezrJl73s+YbboVXmSBCICQDPiMXvQ6pzBIgi/dX2Ns/hMGzrmLZCcGGS0kLnjsoUTu64jaoqyyvX+atkj6qqPeCpBmxwMk6hdZmnsyV/Q0dgonZfxeSFMsQp+b3JzlJdiLwqCkCsu2EGM8MJax/6hxAd3py7igSPFFj+y1bfvpKBgfwT3bd/6e4N4p4mI0aNrlUULkSz0BLQXZmWpO1apmU97VcCRTQPGMm3E1ca75zEaaq5aHVpLA5Li+FB521paIgq2xD8Fy003Xikp+X4O/qpUH1EICNv936mOLH97hjKzZ1VuK7QCdFJoq94hqtHp8xhkttm7sZXc1TAI36DbZUJqASXr/ZWu10ADFnMryWwYgwgiTrQNAQDAOnCfZrx6lzixW1h0xNHGdJG0+Y/qLs33fOTmSlT1rvMe2wkJmioKRfu6HHzfYLTeXLf95kicfSaeoiQ490mEVX/0rmmYzpdJPU3gZ/MD3sf2fo6Nb3n5SghaFIw0PNd2HQnfti1O/KQ0+EbT5ib1o8Ea6q/1R66S8G0MK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39840400004)(366004)(1076003)(8936002)(316002)(107886003)(4326008)(6916009)(6506007)(38100700002)(26005)(8676002)(5660300002)(86362001)(38350700002)(186003)(7416002)(2616005)(6666004)(16526019)(66476007)(66556008)(2906002)(36756003)(6512007)(6486002)(956004)(66946007)(52116002)(83380400001)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lpzeIPJ0q+ldCnDaKFR7phcnJNxHxDZyXEkOGWKdeTE5UOFhuKhOdhkxoOWn?=
 =?us-ascii?Q?gjK4hJLXWOL96yHaNw6sZ91vezu5oHS0ubtJue61GI+0Wx7EJUQPqbygge0v?=
 =?us-ascii?Q?C5BkVaTdX7atWm4mOjGr+SgzcBfebuIAe81guNC9pQAyNH2e8yESvcEFHM2i?=
 =?us-ascii?Q?vou8P+IjIGrC9oCpj8naW9PgbtnQOU0DdZQpRFY8i82kUHXkP3cS+JFF27By?=
 =?us-ascii?Q?CgTtLMx84FyDiFdCOE/LwFfX4P9LAvnKTYKy/4nIRr1wkBKszEd/2WpTwEce?=
 =?us-ascii?Q?7lalAc1v4r/YE36zn/zHcyOKxrWkKN6/5JoXku73W6/gT+TWf+4IzQkHs1VR?=
 =?us-ascii?Q?6hmY/zk6RZ4PLv2FXaQWb/XXZS0P8Jq+5H3532gl16HE+3mZ4TizOBxoI72G?=
 =?us-ascii?Q?ZtVUyPcAiOJzn1+DE9sdb+p9l0hlFIw1bGUmFnDWYUymaIYjCWsz1rpayTLc?=
 =?us-ascii?Q?M/lapbroe3kVXxXpYA0IDMJyhwyXydkHNKL9idM45+vGTvpaFhPNEikPdrAF?=
 =?us-ascii?Q?UeHmBNKCEFfcoi0QKFpqGyN5K329D5N/+2EIFlkWxxaC+gW7cR4uV99szm9N?=
 =?us-ascii?Q?g33/3KajMZ0dTjhZQu9i9Yiz3jc5BCKl5nWqDNKq4MY7tCtX5daVNTUNtpfM?=
 =?us-ascii?Q?2c4Fsm3L5xTmVKyC/y6MFQr/kZ4BlJLF0G1rGonBrpXrwtPM0p/MPPJYz9YF?=
 =?us-ascii?Q?iue9w7XbHb48i/NdP8+hdDOxJyT1J8BUlxeNTMfL0j4w9hwSnU9RhfORiOMZ?=
 =?us-ascii?Q?0hPRZe2GPfYjGeMjDEQQdU7YmNPGGMrUmdDByt3WeXHbe9Zfx0tvSBL4boMO?=
 =?us-ascii?Q?0vjsYNCePG5byhqEamwIYcqi5qDhpAHlpx3yarVOQRxXQyACiB0HsG2zUxIA?=
 =?us-ascii?Q?y01K0q8VwdmxZyih8QWZDMCu7EYHQuBWOkNtHoSLJ6HFyBZQVaEou8T5/Nay?=
 =?us-ascii?Q?J5FDHBGxtgKH+UcfKDRW4gy7AWawQqxE67LlNliwfJZ0m75P/hF6GBkhykrs?=
 =?us-ascii?Q?tTBl7WEvjmmV05xBHOyRhg26Bgn5pLsuaKCWq0dqGeaavcqVMSQUYd0eNTdV?=
 =?us-ascii?Q?zggNXNMcGkq7SAQjzXuBTwQDv8z5pMuT4ko78XV9hPmscRI9rEJDfAWm5/5X?=
 =?us-ascii?Q?Zb/ou2CwnVjGxivaDzzDTBqpcpOYHKjz86+BTzPQcoS0Av+Onqp7CEz+DVSe?=
 =?us-ascii?Q?GYHCa6/wOHxMDWe6rrs14bIo/ld/KTFwI4YNNI21r0VnoX+pRpU0FL7qXY7n?=
 =?us-ascii?Q?MqEHZKf4gv6Nlau9iafntZvw8wnebKhqHcCEt3cmCtgjIz/LmtWK4+sM5n01?=
 =?us-ascii?Q?IFamGu/aXIQmLUPWH/HXMnWb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05de687b-b0b0-454d-a22e-08d918ff4a1f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:44:59.0363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMyrYoahuG6TdvpDsCGI158C/YfG+1nPmmCQwTFSuN9oWFIrEV6bcZ0Nb4PJfjqAKDEPgnTvSY/z6rj82EIsPtVdAS13E+RYiBVx40qNfWI=
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

We are going to publish copy-before-write filter. So, user should be
able to create it with blockdev-add first, specifying both filtered and
target children. And then do blockdev-reopen, to actually insert the
filter where needed.

Currently, filter unshares write permission unconditionally on source
node. It's good, but it will not allow to do blockdev-add. So, let's
relax restrictions when filter doesn't have any parent.

Test output is modified, as now permission conflict happens only when
job creates a blk parent for filter node.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c  | 8 +++++---
 tests/qemu-iotests/283.out | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4776172f77..af2bb97a30 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -142,10 +142,12 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
         bdrv_default_perms(bs, c, role, reopen_queue,
                            perm, shared, nperm, nshared);
 
-        if (perm & BLK_PERM_WRITE) {
-            *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+        if (!QLIST_EMPTY(&bs->parents)) {
+            if (perm & BLK_PERM_WRITE) {
+                *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+            }
+            *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
         }
-        *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
     }
 }
 
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index e08f807dab..d5350ce7a7 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append copy-before-write filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Conflicts with use by source as 'image', which does not allow 'write' on base"}}
 
 === copy-before-write filter should be gone after job-finalize ===
 
-- 
2.29.2


