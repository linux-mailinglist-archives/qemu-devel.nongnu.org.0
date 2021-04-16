Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A971361B2F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:12:50 +0200 (CEST)
Received: from localhost ([::1]:42206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJar-0003qQ-5n
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXq-0001A4-6O; Fri, 16 Apr 2021 04:09:42 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:43105 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXn-0007xx-Pb; Fri, 16 Apr 2021 04:09:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+Z+z0Nqk7/5RQS/t/rAY52nN3HhtBBcc5gJw4WlAdQVM+b0AgO3wzyfpWVjYNN9vJH9dYINXgU5o/lJMKh3KWvPipk+M3fTy92bB9xxj8u1/QcVB6RYBo5jWyAVEOt96kRa451Ik2OYORQ3Ix3mARQbtqp1NEU13XOiMwQaIUKh4NqfRfSYR5CX8QfglUtqd9ufUPg/JUzzQUTmdsEwprrmTUEC8iD6L+NsUarpPGOttjFIxvD/cVidBDtcPU267KhmDi1v5k7N7Q8GFYu1PtLG9yV0eaw4lvxdc3AqrqrvYit6Uxcg8jwYPuQIwo0TSds/QTQle86HzfGkk3GEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dkEdJbUjzw0iP9lP0eHXAeU3jqJNb+tilVCb+ppkwk=;
 b=hk7WCJZv47XEWbQzP2GaYnJuZ1RXrSHRxdPDatFkQhnkt9DRiwFeH/m/Lox1MXXpX2PS4EUVBZogoi64fWvAm+FELc6m8I7dVWDfUHTTdY+VtUCLCzrH1fvbvQGxrKY8HDMPzBhsxb8+6D48PFUMgmzJLbg4BtzPVLF2VmBp1wzEydrSejUnrz6BTUnj+4oaE4VvUtXuoOxMqrWmd14+wVPgFQOgEvplsKffTSdOA8f1fDVG3tDTJ0g6bFeW2Z7MBlJongJBEX8J3OSTnMwSsBfzbIrjmN9Gu6nbugIjnlsMCf0WEWiNZpDkry7GJm5OWgHKi3mch03t+SBVo2SUyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dkEdJbUjzw0iP9lP0eHXAeU3jqJNb+tilVCb+ppkwk=;
 b=ZxixKz1/ohpdU6kqLe0upA22VcQ9pNMq2vMh+xLSdDwsA73o/J2xMfcwoVqrfLZeiQKi+/s2aIf/6J8H/pJ0HgKTn5sYI9kYbEce8gAMIHsKxZMuwyoTk+Pn12L+7QQ6t+JYWZHi+pZQWpjrdHj6S7Koicksp/+olRdB/cRKH7Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v3 06/33] util/async: aio_co_schedule(): support reschedule in
 same ctx
Date: Fri, 16 Apr 2021 11:08:44 +0300
Message-Id: <20210416080911.83197-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416080911.83197-1-vsementsov@virtuozzo.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 570b131b-d988-47c0-fbb8-08d900aef86a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB469179B7E2D8282E67CEB248C14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WaWIrdrqkFRH3DoDiMjb8SS0j0hiWLY6s6DLvt9qxxJsX5eUcEb0IZTH0qKgtkRm2aWkt/93FLcyo6P7+JlMcG7alxLFraBhVNyPI3aZKZdL2WfTjGaJ8EXdFptYOCPbfA21kb35owpQaJW/uRHo/0jOzslnZMHe3t2UeCwrbiicr6qAKuf4KkaUoePL7e287af9v+LlPgCKqlHryiwv88I5e04nUL4yTJUCqiOi3JVCMMDRck4nJLB6tEmwCWrL0sS/ZdY4VKq3vBcQg5MYZvJvSbchn2uevpPgFSgI3X4RVZw1jpZPYz0rl1Ajs9Ha2jHs7LP54PBz8Z0iL3er8cusSeL1o1mUmD/mOrdUraOycjtbTFc7OSkQu4g3gTpuI7zibqzQpfmdpzwkvQLbZMEtmMEcOw1UI0whmj2c56AuipQLp/M0TpKNny52SoPBIIshJ0Ec9+1N7JQOSFJpPSIDpLpgjDkwSMrCFyI1f1+U2BADiQKU2TQwcbRjd1UmDJyeGEXLB9FJ8DC+FjIHkCCOEVxc3hrG15wKk1U+cfi9SYxeqzyj00pbqxw54nY9CU7QxEIw5GXQzEhsUd/PaaPdTcbRiRt+KriweUHiW5lcyA86NsNMszsvD59yVSUdiuzHHFvNwN0YAKjpElJ3y/zFVDpfiUp2RhM9xyejcfajeXZ/+CTdquOfIjpKNJTEDyGv1c9zqKFi16/S9oCybw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(66946007)(8936002)(6666004)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(36756003)(38350700002)(38100700002)(508600001)(6486002)(54906003)(5660300002)(8676002)(66556008)(34490700003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cpcxh9NBMBYarXI9xEZ+3mSn78lqdtMRT30HAioDpX8OVTlDGy0TGZeaDViM?=
 =?us-ascii?Q?dBU6AHs/VHDpnZkC3oom0VA7e/MoQGI3cE9r3G+lCsfYYMIs4hUEkZdIGO83?=
 =?us-ascii?Q?XcNdN7VEnqxrOHtAmV8wju1BkthFQ36sv0igz7PewXqqqProK7NAdkLY4qlx?=
 =?us-ascii?Q?ZWQDuKU9lLL/MeknlhdejjnyDwBZy8AHS0k9Ta3r7ZmpnLi7mQBqKLSFj9Ap?=
 =?us-ascii?Q?ZY+f1d4liDF+ZsWj6GE/nW7vpl1JmuekbDuJVi8qfeAHH1+OmFXidDn0nIrI?=
 =?us-ascii?Q?gS0OBz8OeHRNMooKxOwb7ycxVDdMrxWrtk0tfudeiZEu1AGTWnbo3Wmk4oqB?=
 =?us-ascii?Q?llx4pFY0vJfu2Tjab099CNXtp0/JoxVdHxuGv9l0aDrmP1SG/govhaSZpNY9?=
 =?us-ascii?Q?OstXnvG9FkzA/KvwGaiZ1FAHeoV/YHkqvRlnLPEP+IoEoFsLRcjdNVFfHK6F?=
 =?us-ascii?Q?CzfSMe4RmcJp54bl3LpNZW4ys2cbputfj7WnRFoWO2CojlH5qcJXUvMA9InL?=
 =?us-ascii?Q?fMt2qPa0O3BDWe4iIH9JUmJaXkeBIBeTR9QwUgwg+KTzQCL2jtP+3GFccOWs?=
 =?us-ascii?Q?KwzHmEYju+Tu91aIT3b1qDfZZwK96No2+ifHSfIngbELUZuV6BtBFv82hVr5?=
 =?us-ascii?Q?wlytS9OMdjIW6e2GSjszl68cxRxj34Ny1epw18weUGWaB1jC5JCt4HUtCsAO?=
 =?us-ascii?Q?s25XT2GfXYYMo0l71TnOnf/XI1JlKT8heFVk6BgtMW16+0sC6tZl5hlPrt1v?=
 =?us-ascii?Q?GgF+mh4rwwQtF62MViycqRi5UJN1THaipj+JmVkLS2OV1Y95fpq21fAOHQUO?=
 =?us-ascii?Q?ZFAuYfrWt6ycjoft/P7X9eS2PLLDEAfM0X0rxyvBd04AS3kZ+D3HIkQ9rqJA?=
 =?us-ascii?Q?JpgLYcdI4nNSe7mRquUt771JSye5yLW6wGEkqbjpCf/JrIqv7b6V+iiXxFEF?=
 =?us-ascii?Q?vBQlol6W0HJ776rx8HnKTkZV0Tkh/5peJnX+0osxQh7j6Xjqi4EtEjk37RpQ?=
 =?us-ascii?Q?7k2DSBR6IOuu0deM3u8hSQtzNwi8xNhKZ88eOdhtBnItHemCG4Hp8zj2vHKj?=
 =?us-ascii?Q?DEBvfbpIcWgR1BOjuN4IN1Su7uRE1A378TmWjT6/2xAlIdc0OiOwc9iESf8l?=
 =?us-ascii?Q?gBL1S3pUOkHO9kx3zIY+3SzucbH9x4Eho5aSPUQIjpR6ikHCjDpHH/6bUojt?=
 =?us-ascii?Q?Pt+Kc+b4pS5mMueA/2Jvt9K8vaK3r7w4qyem/nZhmh3GKmH7c35X5uvFojs5?=
 =?us-ascii?Q?k53s6+0KHCO42SSeEQHgUVNqGn2gjhn2oChbScJt2TP4kQblgvm1q8lPZ1Vk?=
 =?us-ascii?Q?4SguMyaPl5EvYuTFUJc1arTd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 570b131b-d988-47c0-fbb8-08d900aef86a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:34.5041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXNoPBJLZU29gMaOI9s3TWcZ13fjVT60MWyXOaCQBVxqW5xIOeGjLalvO8amrrO+CmjD8zzHp6v7m3WojDxqiSyNECrA6YZALnX+uNoIVuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

With the following patch we want to call wake coroutine from thread.
And it doesn't work with aio_co_wake:
Assume we have no iothreads.
Assume we have a coroutine A, which waits in the yield point for
external aio_co_wake(), and no progress can be done until it happen.
Main thread is in blocking aio_poll() (for example, in blk_read()).

Now, in a separate thread we do aio_co_wake(). It calls  aio_co_enter(),
which goes through last "else" branch and do aio_context_acquire(ctx).

Now we have a deadlock, as aio_poll() will not release the context lock
until some progress is done, and progress can't be done until
aio_co_wake() wake the coroutine A. And it can't because it wait for
aio_context_acquire().

Still, aio_co_schedule() works well in parallel with blocking
aio_poll(). So we want use it. Let's add a possibility of rescheduling
coroutine in same ctx where it was yield'ed.

Fetch co->ctx in same way as it is done in aio_co_wake().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/aio.h | 2 +-
 util/async.c        | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index 5f342267d5..744b695525 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -643,7 +643,7 @@ static inline bool aio_node_check(AioContext *ctx, bool is_external)
 
 /**
  * aio_co_schedule:
- * @ctx: the aio context
+ * @ctx: the aio context, if NULL, the current ctx of @co will be used.
  * @co: the coroutine
  *
  * Start a coroutine on a remote AioContext.
diff --git a/util/async.c b/util/async.c
index 674dbefb7c..750be555c6 100644
--- a/util/async.c
+++ b/util/async.c
@@ -545,6 +545,14 @@ fail:
 
 void aio_co_schedule(AioContext *ctx, Coroutine *co)
 {
+    if (!ctx) {
+        /*
+         * Read coroutine before co->ctx.  Matches smp_wmb in
+         * qemu_coroutine_enter.
+         */
+        smp_read_barrier_depends();
+        ctx = qatomic_read(&co->ctx);
+    }
     trace_aio_co_schedule(ctx, co);
     const char *scheduled = qatomic_cmpxchg(&co->scheduled, NULL,
                                            __func__);
-- 
2.29.2


