Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8D83C8956
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:07:31 +0200 (CEST)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iM6-0001tD-W1
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iEk-00069n-2e; Wed, 14 Jul 2021 12:59:54 -0400
Received: from mail-eopbgr10112.outbound.protection.outlook.com
 ([40.107.1.112]:36877 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iEi-0005As-I4; Wed, 14 Jul 2021 12:59:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5P5QTCBgD8I0gJa5ClcOVx2H+eXkOd51dzbQaBMaI9mq2Xj1ruyLL2sz/UOwi+btldRtTZbmpyTqB0IQzYvGOpEKF8v/MUI2FNo/f8PFiAoh9w0+I1UOKM3pRtqu9x5q9J7KH97HFjdGjp92kh+L2/1jVU5CeHBG13mOksYIrDOpcCnKRsZ/fXNFW2zfHUHwbj059b3a8TwqKGgGQkjN3AGxDRpZA3chnZTPsWQDj/nT8lj0WkZTvT+kWyIDg+mETsqxcgmofjryyURAMC2xW/OhLY0mYG3G0BKuJi8UdBEbvEq4a4nohgBT0DGK1/CBZWWE/mRftVxPy7K31cWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrTwqBbG0TlAFOJCTqilArXoSFLFM320tB6wqGiro8c=;
 b=GWt/ZOUIP/rgFMyw16N8RtLR3j6PobyhsP3C/Pu8O0NuCl1JyOkNbMKd28oC1KVWUNelVUEYwIf+ZVpT6cBJjifEf1gqoMgW63q1bJAfvqGZiKwP/ayWB4qmmbo4kjbTKJARqdgSlsu7lQlwdNMxepWJBAPFEDy43hfUiTGhiED4ydNMM7FFX/Ksq7UbJJNjyy2qHPA0oyMgkmugCUzPtycyqmAtA4+w/8JV29dRPyncnHEgrkL1sjsgKhUEErSMOfGRXpEAo2TnSu6CIsZ1t9Wy/k4XNk7bZtI6YAFSnjhPDHgzLzGW1VdYlMbsma6BTHYLUL4q72n7yj2n5+7FBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrTwqBbG0TlAFOJCTqilArXoSFLFM320tB6wqGiro8c=;
 b=DoQfLw4kfE162VS/eqZFP21zJE7oaFJ3WOWT3C0M+llGLxyyymD/s2BXbhQ4k4PR5kz3yVPX6xsvsIyqEH91xU54fMthhhhxI8vMjqJmDtfXFnaZcX4zxmto/nzqsaBoUox5SiLE9GxpFkHFsc3C1SL2yed0u1Sm12WH94Z6zP8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 16:59:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 16:59:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v5 5/5] block/nbd: check that received handle is valid
Date: Wed, 14 Jul 2021 19:59:16 +0300
Message-Id: <20210714165916.102363-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714165916.102363-1-vsementsov@virtuozzo.com>
References: <20210714165916.102363-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR08CA0077.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR08CA0077.eurprd08.prod.outlook.com (2603:10a6:7:2a::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Wed, 14 Jul 2021 16:59:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2fc7e04-55cd-429a-bcfd-08d946e8c28e
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5334EEFEFD8D4485D9ECFF67C1139@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UraJGexogkmNDBbGQ1w7zTrH8bLbvsdES3jlWRZG5/5tiGnR0cPMfJBLSis7tR3NEgVReP3LTLQqUFHbtwsggZGUGk/ln0zfbmFnuL7OzcCYXmSaPQBlUo+PquozBlyA2iH9rvYvti/0Vc0EkX93OJ4vMAhOKIYslzUSGThCrxQs9uJKHjWGfc96NdIPalbrsJRDOX9k9shyzWSrc1K3yJvxcgVPLl5PjXGQ1/BcDaPqyyx6E0nb3ovrGzb3XT3KSN7f7KQwjagibNLeL/I+OCI+YWq04gkPZJtIBKjLB0zhMe1l9oXWo1CZgiTMo6zIY+qqncUz0v4PChy6Ot3Fs4sn2gJjREAkzXjJOcEFZWhG6ThwO/06pVFvYirA1DTQ/f/VI9Ed6RhEFp2QKFXKvQZNmHJDQpBxDzsXjrNuiHirRzttKso6GjMdVLxof69OQuz+b666Ag01AkrFCgJO6puhtIBeS8G+WFgg/lPd6GALjimiyoEuTjnkY2dCy6XsC2/pccKFiDIzKB8+bfgoV7OY+ik76zEKSyk3liqQ6lu9DyUsdr8EqC25ZWZOjId5n1H+9RC16R6hneRKH+PhXZVzteIlDv+MjBYHg+lmiBkcbbi74f6Eq9Is0Eo1LKbKT8LWu6P6eH7uzztwRqV7XdfU3mdvQZT49tAKUTIeExj0ybnPql10kjO/mOLfPVwD0dykcKYa4J7MrfO99DihPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39830400003)(36756003)(6486002)(316002)(478600001)(1076003)(2616005)(8676002)(83380400001)(956004)(2906002)(66476007)(66946007)(26005)(186003)(38350700002)(38100700002)(6512007)(86362001)(52116002)(66556008)(6916009)(5660300002)(4326008)(6506007)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qxFqONo26UsnLcLnxZYlvdxLHbrr6pxtrgNqJjCRxNzyVhX6PA2RxHROFRXW?=
 =?us-ascii?Q?Rv7BoDX9Nrow4+6GgQak1K9afrS9NGqhPFrgINeiikK9hwElU7i79/eUZORs?=
 =?us-ascii?Q?UnNDcfXP/Oihtk+TaDlQdDr/11NT74Eds6juDgXI+Xo7pkNwTGeSPjeMb4UP?=
 =?us-ascii?Q?zRPnbsuiTiWJbhRGyvQcmouYTFVz10tnavOlXuvJnDF7rnyU2rJxPkzVgv6N?=
 =?us-ascii?Q?sdCobGbhxHn2/lTwMHtOhFm+aTmokMVgDlrnoOrfke0PqE6X0zs90NjMpmKY?=
 =?us-ascii?Q?qOExnJ65Js211UEd2mk121YZdkh/2Yf4yy29e533EvPDqOHC9PoSksWHe3lV?=
 =?us-ascii?Q?4otzUCs3ALrs6mtAgs1s1kqHkvkbOInwZxhkoer6D2llxcWGHLL+T/PI5ijo?=
 =?us-ascii?Q?BK5jh6Cf2DMRbHwjUuFrqrJLJu81hVEumRXaIu778bhqelXlFw+l831cm72+?=
 =?us-ascii?Q?RAdKw5meqi3Tb3Lykd7UNQlLfegt3GMMNXbKMnLL8Kap7ln3lX6CmGAccfWF?=
 =?us-ascii?Q?jEpZkbZkVVS2ytB4wAsTtr3ikHlYUJpUekYYrA+USyoWeOb8t6zIF6voNRkn?=
 =?us-ascii?Q?T2Jnu4ZWU47q9EnIVAonK0CWjNPApQ9VwKWpJvAoG/NmdI6lwsPJF9zJqfY7?=
 =?us-ascii?Q?j/MNtumkJcljACOZox9EASE0gw46dBLN9Z01gprkmzYR+KeF2CyKU8S2mNya?=
 =?us-ascii?Q?JXy4ZItbtmgwyiDu+LR8pPz181WJ0LcWwsIl3pIZ8IEdNRRr40pZSVHiRZJE?=
 =?us-ascii?Q?5uIMY+2U7NaaGbR6DFrVjt858RkwWQVh2Tuh2atrkyCNSpN14MG5fmw53n/E?=
 =?us-ascii?Q?rBz2jKTfIeiPEOYAx5afIYLETEv3ujT7A04tgQONtxOB7AcIVcdPk4rGuc2X?=
 =?us-ascii?Q?SeAOkhnGvXATun9dtViX1HYgRsFJuE+xrKwl1+lx32yqukQ0yzdjgHzO5CvK?=
 =?us-ascii?Q?gf5CTjf8TmiTg/Xl8vYHkJ20ej5njCv49wnjwpuKsasEqWd1blm7/N+GzNAW?=
 =?us-ascii?Q?fl2SeNPIr4HEU9H2tr7dCyUvRNmlRgAFyx4fLha/Nku3KfR2YZdC1fkp7NBg?=
 =?us-ascii?Q?BKFQouUV4+pXIBjhKLCtrjWDOt5RQ1AWTPu0pGwiL5c0Pn9kLe269NLbZyAN?=
 =?us-ascii?Q?PNwmMLKhXop4LI/af/DKfL0/w4P0RqSb8cGk3BnHfCxa9Zd7QA9FRoXC9I/3?=
 =?us-ascii?Q?YzLuN0Y9XVLAE1VYUezEE9/lsoXF5Wnk5ZMO0Cy0sqzfYMNe7EEnUUfRaypO?=
 =?us-ascii?Q?aEWWNFp/4UdEbt1JrKU404ZlwZI+LX4GcxDLwbDEiNiH3t+qsRYZoIzZZm3U?=
 =?us-ascii?Q?tEB7WGJ4hUJixOYNWRL1wtJJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fc7e04-55cd-429a-bcfd-08d946e8c28e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 16:59:36.1441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAVgd/l23CBIAk0uDA4bnlxI6rB52HuRU+qBXQlTvK/bqqsAIuKR18KWxuRw4yDEquS4QcGyh0sQmbHR96OGF0UHhmkZeECAd/HnpJk1S5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.1.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

If we don't have active request, that waiting for this handle to be
received, we should report an error.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 8313937f0f..ca9fcb732e 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -58,6 +58,7 @@ typedef struct {
     Coroutine *coroutine;
     uint64_t offset;        /* original offset of the request */
     bool receiving;         /* sleeping in the yield in nbd_receive_replies */
+    bool reply_possible;    /* reply header not yet received */
 } NBDClientRequest;
 
 typedef enum NBDClientState {
@@ -415,16 +416,11 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
             return 0;
         }
         ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
-        if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].coroutine) {
-            /*
-             * We only check that ind2 request exists. But don't check is it now
-             * waiting for the reply header or not. We can't just check
-             * s->requests[ind2].receiving: ind2 request may wait in trying to
-             * lock receive_mutex. So that's a TODO.
-             */
+        if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].reply_possible) {
             nbd_channel_error(s, -EINVAL);
             return -EINVAL;
         }
+        s->requests[ind2].reply_possible = false;
         nbd_recv_coroutine_wake(&s->requests[ind2]);
     }
 }
@@ -467,6 +463,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
     s->requests[i].coroutine = qemu_coroutine_self();
     s->requests[i].offset = request->from;
     s->requests[i].receiving = false;
+    s->requests[i].reply_possible = true;
 
     request->handle = INDEX_TO_HANDLE(s, i);
 
-- 
2.29.2


