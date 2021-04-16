Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14874361B9D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:35:27 +0200 (CEST)
Received: from localhost ([::1]:56238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJwk-0007xr-4L
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYb-0001up-UX; Fri, 16 Apr 2021 04:10:30 -0400
Received: from mail-eopbgr20116.outbound.protection.outlook.com
 ([40.107.2.116]:15815 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYQ-0008Dj-Cw; Fri, 16 Apr 2021 04:10:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c64cXQpUocz5oU46cWVJxjUNLtrq9LkdW2kzSvuXMfyhRSGqNl/NkPAnrS4c3V3wBmqBnGVKnRckAikb6RAUKJmFUoNUbVsOkZYkvtzKmkbsMH/odKac3S04yN+97NMs6Jchofi4BXEaUL1k/1tTrvR7GRejc0PNlnYPrO94gFIMN0Wq3tQnDTrkbG5fMPoxNnVZotlhvsUfKJxbV9whg3FNG6SB9PTzvv77Hp7bgcgt9iPyfzfhqlIUbVG2puv7cxgQ54F/AviaEOmVpSnB2kUrL9uaU5p5yflBIQtXG6P6D2v2eH7xRdI/MzdwXlqnQOYNX4HzfFwebu7o53SxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFvJYRTaatCxJxm5kT6oTf9PF1DMXnr6fG0CjSjJU0g=;
 b=L1peXlLgGPhege2+k3KMGmMAzGO6VY0zgfR7eH4ouhthGYCLXV3TEpHZyx3WTXh1R2/14+XaNS1s2BWkd1PTynukV0yJMW4Te5qHpYSb4aT75nD0W4xxK+IiaFpyTNGiwTgvKb/TatubkhI2TtSsYd7MuCsEKaifS00bor30p/PGUMAT7ruPCIIJ8dYdC9k5NohsysjUAnaqcPdDH99jWL9/gp+vF7FkTs7DhGE3P1kT2xs5TSrMXqzAV66J5usmPckcMYfb8dUAVo290ePqaUk+eo06pV5G7JJmLRz02B54/0EHxdIslioZvVpL9sbQpbrrSDyUmsmplTGDsjBjOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFvJYRTaatCxJxm5kT6oTf9PF1DMXnr6fG0CjSjJU0g=;
 b=OWsH310pvSQqzUnyXG6vM7YIEiOBw4KVs//bs1fUxHJVTRGUu7lSHxYuEAv3uPDVZVQEZ3APxhxTA50hMqCJa9ycnOqz3O7+0MWyK6lFV22yFjfIO3l5ztJj9xDuN5qjn+7R+LA1eNVXbRzFZavO2/30PMoXi+i95vIVnhDGJuU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 08:10:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:10:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 32/33] block/nbd: safer transition to receiving request
Date: Fri, 16 Apr 2021 11:09:10 +0300
Message-Id: <20210416080911.83197-33-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:10:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef38c525-8e66-4932-54e9-08d900af0e1a
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59098CEABBD37DCA6A8FADD0C14C9@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tYAp+5y8PV/ZJZDHcMRnpDNbh26uIB6moV4rM5RChlcs5TbhGMwfBmTEVQsSNqR2cAp4oMAesfQExTax5kgJzbukFMpy9Psj367TASM6wAfDqFZEAXO0Ka64PtFAIM9mBkbkgvLIU/3bBl3wCRZYpiPNj3fpc3R2xfJ7kJ5zNT4no71wHOcg0hIX9QJg3KisAAiwxzsj045JhWzU8dYIBIleQ6vJJW7ngqzW9af9l9QEG8PRICQaCORKQ2GGfidlZ336G5ywPd4VeBy0YrdVWnxqRJHFEm3YOGn7eyeQ7DTIBqDXNfhgFvO6V1/yVHt0khpKn3Rs/9cdEYXW+wQIimZoiGA/Inl3elezbkfjeFsOJptUsrlFd+OziuOAe/KQWJg+oPNrbMegT0Ws7AYuYlyfJCyB+Xd2Uo8X0lDdNVtGFCUhFdkcQtTrGTpbZLqNBmDgxZmsa3JtMkWlYRJHM7IxdCdDNjq1uL0qSrbOmnbhvlsp6L4wmZyU75YWDpcZMYq4Lsy5mc6sunfaBBQfbPT3LYvoQxYnLX5fvTIO/Lxlvdx1zx/Wo/4UP1CwUiNd/aYmHngjP5ltrlboBF6i2/3yN2Aoo5oDixn1oKBowUQUkq0zBM+CPPVGnKh1RRBouq79nUKApOdY7WVn9zgINePplmXotDqUJL+I3hDN5e2oQ9bqWltEAFr9Pn2/0lPv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39840400004)(86362001)(2616005)(66476007)(1076003)(956004)(52116002)(6486002)(107886003)(6506007)(4326008)(6512007)(16526019)(8676002)(8936002)(6916009)(66556008)(66946007)(6666004)(186003)(69590400012)(478600001)(5660300002)(83380400001)(36756003)(38100700002)(2906002)(26005)(38350700002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IRhLo2RDeJsMxNLpmxXQDpzyGXNUGNpRfz2RZybH0sY1BjwzXLbZCqS4EZTo?=
 =?us-ascii?Q?Hk6b/fVH8hmkpG+j1xRLRG7r2O+dQHa+OGFZr3HxA2AAl72FEEyjHBltuqIz?=
 =?us-ascii?Q?YzflooDLKuB4OU7u0OtZcyGphZ0Gobm32eNb5nCFVgZDLAM0I28sybSo7kPi?=
 =?us-ascii?Q?oLgmu1EMRoqiEHke+g7viTjm4uaIJAjIIhNOA145MBXCzeRojW5hieTAtVlt?=
 =?us-ascii?Q?buS5LSYiv8w5e0HuYeLG+8fpgsfp8/piYbG7MzOdNKzZ9S63lKuOwSPA7hNX?=
 =?us-ascii?Q?gag5ImXowX/1V7NUZSP9kyBIUaneyhKaErlPi1u2jkacKIIL2nEYDq9k6bL2?=
 =?us-ascii?Q?K1JLUkuj0FdwTsJrJ7R6VlVCACCkqSN8fod/Sz9wtvWSYQ0hEPiyzTMKik96?=
 =?us-ascii?Q?2jJ8CICHUYGv6WnHXdPkwkntuiDYHOTOcR6/X8sdqWV5jkvFzNPIM5AWg9+Z?=
 =?us-ascii?Q?rGiEVKBHE654t1kXPkmqAfUAGXuWb4Whsc5S/SURvAdAqLmv15Y15eu2Wqsh?=
 =?us-ascii?Q?67VYhszaN4/CJob8GbiNRUwGn9YOvAJbC16OGZ7EgULpUbcraujtoE3IC2ZS?=
 =?us-ascii?Q?U8qPCPFm4NL+OjAEQ0R55gywoB4yha/Uzxe9egXTcqxeW4iWyNwWCATkJe1S?=
 =?us-ascii?Q?mluSEZgJ1Yn60/WExn6ycdwyxRfqVgdDL3rwVkElkkpbd+dIIkHakutP63PW?=
 =?us-ascii?Q?1WhsrUcDR0zsEGcYv/Jx877yPN2OaP7+vTngKbjtxhnNhKcE6qd1oQDWnG5c?=
 =?us-ascii?Q?GB64tG2vlfRrUeuu7/CJLmlbTwSItPfxWZZRUSFPQd0ArQrMzED+l4j4+mRD?=
 =?us-ascii?Q?IMn6eQ6ZvCpN8VpdisLzWlkaWzAtXfCSnBgjua8fAs/ZOlD7gK+Pd19cpuJ+?=
 =?us-ascii?Q?NKXeePBdzbK1Si5XlryKP8eli6DHGJdOohGWYKUiy3mYtLuU7wpHQJUNhKul?=
 =?us-ascii?Q?tDdvROLpmR2G4lWtxHPkBNMVuQsfa50Oq5YqVvSAqSaPXBZeplRe+Y8x7s9Z?=
 =?us-ascii?Q?1dIQRjKrhSTmHpldthax+ZA9GnoRQb5Lsv06FAuQyvyNsrrBLveQ4uouzZiN?=
 =?us-ascii?Q?1bvDoDBsnqMdV82dseDvBxps/EbEBZ8JmPzI8F20mnt6Qmq+97PJYHgwttUW?=
 =?us-ascii?Q?ebOSiRVrdPGQDbJKn9xBuDsqhNzzH5S495Af2JuukPrV7/QtTTtcpd2umPo1?=
 =?us-ascii?Q?jhG481CaaH0wkwGD8B54MXq23G4rVYhLl1EjYVmw3hH+abQuYXZavI+UNTun?=
 =?us-ascii?Q?Cd9On8zcay2kwYErysMVf3TRMQ3F2HC25jAc1MONTggJ4l3375LpqG84Zlt9?=
 =?us-ascii?Q?Ovsk7SVrtKz22KzzMXzdN+nP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef38c525-8e66-4932-54e9-08d900af0e1a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:10:10.7152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDDroiBxCbVwa4aTJdS1wvyEcfysWf/MDN3ldqRh4AD8oPJokReoji7VjAy4EmKxIvcPjKfaqfJrs2G6rbOaOBx/+AbwqoA9Qic35Sz9Wew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.2.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

req->receiving is a flag of request being in one concrete yield point
in nbd_co_do_receive_one_chunk().

Such kind of boolean flag is always better to unset before scheduling
the coroutine, to avoid double scheduling. So, let's be more careful.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 6cc563e13d..03391bb231 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -152,6 +152,7 @@ static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
         NBDClientRequest *req = &s->requests[i];
 
         if (req->coroutine && req->receiving) {
+            req->receiving = false;
             aio_co_wake(req->coroutine);
         }
     }
@@ -552,6 +553,7 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
          *   connection_co happens through a bottom half, which can only
          *   run after we yield.
          */
+        s->requests[i].receiving = false;
         aio_co_wake(s->requests[i].coroutine);
         qemu_coroutine_yield();
     }
@@ -614,7 +616,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
     if (qiov) {
         qio_channel_set_cork(s->ioc, true);
         rc = nbd_send_request(s->ioc, request);
-        if (nbd_clinet_connected(s) && rc >= 0) {
+        if (nbd_client_connected(s) && rc >= 0) {
             if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
                                        NULL) < 0) {
                 rc = -EIO;
@@ -938,7 +940,7 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     /* Wait until we're woken up by nbd_connection_entry.  */
     s->requests[i].receiving = true;
     qemu_coroutine_yield();
-    s->requests[i].receiving = false;
+    assert(!s->requests[i].receiving);
     if (!nbd_client_connected(s)) {
         error_setg(errp, "Connection closed");
         return -EIO;
-- 
2.29.2


