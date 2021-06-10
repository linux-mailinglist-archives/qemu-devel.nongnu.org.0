Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6246A3A2954
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:27:55 +0200 (CEST)
Received: from localhost ([::1]:37394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHuk-0003fh-F1
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcm-0005kP-3M; Thu, 10 Jun 2021 06:09:20 -0400
Received: from mail-eopbgr50133.outbound.protection.outlook.com
 ([40.107.5.133]:23957 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHci-00051Z-7v; Thu, 10 Jun 2021 06:09:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrpaYCnrHPjUv5qPji1OiPVRnSyJYbSDfB5Dexh44WX+TJkrMQxpjOLraK1A3CnjkE83NZIm28t+HG1UYSm55/zIZri1LXvNZ1dT4P/NcXVMgbNSM8QTjWJDND6cU6+BcsOT+PwZEzMWoSECMdX7SUVrlcExCuywMuTMrYeYBey/KXksD6mVThqPQ2bZQ7/yJTX9XmVk/CrYJX8q1qzomRnGBW7icgSKvJRItsnICvOF6fY26FVqy5ZJCGkm8U0EJzavTJw8Zd6GSu9MjE93Xx7nuIogIqnZg80wF7sK/LoKoJhx0mva7U9Wj6qzBZa1MPYthnz7OPnwTBb/GnyEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3Xh+L13NpA5OJsyK5mcKeXTGfdp0dFKgj1ke2TWB8g=;
 b=mV7ZDOEp3A3TBgPuKAJOdxseAvqsVGHoaZB/Qe+DOFdWZguDnrPoABnBVxiu3Cp2VWNurgd1K98ot+erqV2Nr71Hx5cHm9BlUu7IrBCe7OfDJhu77D+LcXjttmHEeDBX+g95hMKDiTf9MqrjzXbP9LD9T762lPrU6ueNdVY2LtdfoYDJr9UkvBnKVHOPDpSm2TtVS0x7H6dU5aqXHNnExp/NkZaoy/RD2vGD3ixvD0SILyL7mln79a9FhT4QaQcaUwdJtHnyd63zLnrp4aBJE7l7pT8rNvAX959wtZppJSupRy81Y/PlqqjXU5vm+Huxit63ud0XOPjWKcIrg67Gkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3Xh+L13NpA5OJsyK5mcKeXTGfdp0dFKgj1ke2TWB8g=;
 b=TDoBj/o713LNqhR8mYqSrEsqB7VfcmSw6SzlXUT8kt5xS2vr+zgZYCi9O82e9P8jFektrRFFsPsU9+10kbeFsMoeZyrRX85/hsscERtHoMAm58UQAWIvWx/gJ2hgYpVNuHdfEIL90YsoUfFsLG/v7j0X6xTURFIRWV0hUMqUpZI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 10:09:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 Roman Kagan <rvkagan@yandex-team.ru>
Subject: [PATCH v4 15/32] block/nbd: introduce nbd_client_connection_new()
Date: Thu, 10 Jun 2021 13:07:45 +0300
Message-Id: <20210610100802.5888-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610100802.5888-1-vsementsov@virtuozzo.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac8a6788-a971-444e-37bc-08d92bf7c5d5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6502E936B2DE3F42AC739919C1359@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:92;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZnO70OnEFPt4SRZ6u4FolO+rj+yvWYi5YAPYsHNFjdKbidK+53F1zcsURpk95htXd9PkY4lN8ZiDqLWpmt3kP9uVZSm3wpWxK8wxCF0kUHsbYs1ybuHotcZ2iLxLPLDdej7NIbYBdpuUEI6PnKNlsQLkx1gzfgVC6O1nctC5IRHq1rBmW9mDrxMNhAKA3gI7lE+pw6uGtbv9vKRegYA37kxckf+iLBZc+8FtWY5BYKX0q4lnMaooXbk6+sXEljuPWtgE45r3LHnG7gyj88k3jOJtZ3I/Ffm/ySaO+1G0bWX9VeDmzUbWYHRlneeUsSpcJw7GBakziWHzVWGgDtuy4i1nBlKZ9/+Le6KgpNkFaNot2yzCXNjcwhw/6i7uibWnvfOTpEGnxoxFajMK1n4ijDWS/fhMtAGhbuMdBeWOPTcNtmyahh7Exklk9K8qs/Z6EJI32XEZHmoOfJsePds3Tax9ffbCfUNOgfwCjHv6Oi9fwQVFQGi0P/maOZiy+ud/yMtaw3oNx6xnyS8fi6Nb1YEv/R00mYhJoPoLbwwoq/xl9FC4+kVDJae5cuQRSQiQ0PtiZWe6ikOGb0xD77453H8IPizMvU/2Gy7b2ObtmcHdWvRFD+0zS5mhvKQKzUAnQC73bdWkmmXfuuB+NtpQHYhBt3izJ3za92xTyEcSmkcUmTnLgidXU9OyQ2VW8HuT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(136003)(366004)(2616005)(956004)(6512007)(66556008)(2906002)(86362001)(52116002)(36756003)(6486002)(6916009)(478600001)(16526019)(66476007)(4326008)(186003)(8936002)(1076003)(8676002)(6506007)(26005)(66946007)(38100700002)(38350700002)(6666004)(316002)(5660300002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Gsz+1vNNMwL/pmujLMt2tf4MYw8mDi1148E3rH9pi7ehMpDGP/srm7qXco67?=
 =?us-ascii?Q?aZ67hzI8lMNKVHgZ6SMfqHDQQWNW3G2Vjf2c41utbdGzxvHUYLX++Z9f8bgk?=
 =?us-ascii?Q?kxvDysE+v5DS3R3NQTDJvaEyGtNxkji9mV6Hskj1/2Yxq7L2IfUlAns7Xx1q?=
 =?us-ascii?Q?dJpVoEuhfnK5ZfgJBA7irv572D6u+dH9P8hb+j8Qxp3m1rR1gq5syPsrnXj0?=
 =?us-ascii?Q?rHCNqbVrsr6E7gl95NUKIHWFbgvGlDrEla7nB0+NWImZkjnCW0+jxlXqWaNR?=
 =?us-ascii?Q?XNwOvuSGfjGHEew4905sI15JlH2Aipcorxf8g6U5gyXHt2pxns6x6/TQLuJ5?=
 =?us-ascii?Q?TIzY/z4yLaB1H1KK+mBnHIh3hZdUfqXVmIYHdrClVns5hZrwTFVUKj7S1iDy?=
 =?us-ascii?Q?ggUtQ+3vaEGe/hcZJs8zONyluF0Jt4q9b48bYvwYi6cQjnbjjf37zm3ooagw?=
 =?us-ascii?Q?CHYo2ncDxDYVY1EmkBZmA6pjE8+WsgQEVT5cS7TRRWIHRkTh+bCyBNo6dGqx?=
 =?us-ascii?Q?nQ1h7fmHI6oAqyQI9JIv9mEPlw26vCz22tIGLJquMfZnp83rm0J+K1jPoY5y?=
 =?us-ascii?Q?VfYF3+Tv8ULoRQdbG3TnvWzoZenA/4EZ+UkcPbo7vXJhcsGf/qv5wd3f4dfU?=
 =?us-ascii?Q?aRDJXS2Mi/X2Wbw1Z2RvfTGsfRyhag6EbSJGrj9GYhlfmeZlPBGZIB8LaP0t?=
 =?us-ascii?Q?Ry1tzmMXwTMhQorzaXKzg5PVaw7sLqWrn8iv2i+zw2zHZPGeuJPhS8KPnKBn?=
 =?us-ascii?Q?QUhJ5Ow2NGZ2xZMVG4Mxl+lNj6BHNhb8NACze9E+g74lQQ/EoihJ2kayaVUG?=
 =?us-ascii?Q?1nMH+rRxCRHWLapwkYvkTorgGsSswxkeHYSVEXqGZ9RPdwYj9cibIfxxWWfX?=
 =?us-ascii?Q?5PXHyH4ES6me9tqbFKELrvlaF+XHNN9MEMnvvhVaIjq1kx/j0bjpWRyZYHq/?=
 =?us-ascii?Q?X3ZWbYmO6At8JaUZDmbp32f8rIpOpQsyB8z1SJ+8Bdhq84fuw6d6F/qod0TW?=
 =?us-ascii?Q?0hZeNiZ+lPxcEg/BSj4qWmcfgJvzNsL3+ZftCDG5LYEfUw1u9CvLc2bZGnq3?=
 =?us-ascii?Q?Ad2ucByXjAZbO74igH+zSshpoTXxKBizGkDw0EssZUsNIM5EaNcCXZIkMv9Q?=
 =?us-ascii?Q?Wiio/F/bkP0ddv5g0YHv3pqgaQ2Xvu6EcdpwZtE45s6AQ7Gz0xy+xn2vtHPD?=
 =?us-ascii?Q?VfWcxl145N1vwwHROVB3M7U1JnaWRYCz9vmxIOiq/Mrir6MpRtyzbIWAYQN8?=
 =?us-ascii?Q?OOaod3iq8Jd8hUyObsk/3FO1BtSoWccY5qPldbnPZEisOczZwbJln56916Ao?=
 =?us-ascii?Q?RFRxZFBaPRx+tAGYndy6eWzq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8a6788-a971-444e-37bc-08d92bf7c5d5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:02.6981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51vReQuG1TrHAilug3gLp/5JiFfuscoCOi1toyctRFPi/r0MycSBnBaeaqr+YaFIyXpysKBXM5C7ZtXWkpOg0aLk3RY+9Ra26VHPvpWEZ4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6502
Received-SPF: pass client-ip=40.107.5.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

This is a step of creating bs-independent nbd connection interface.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index a7f1e4ebe3..1acac1953e 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -357,15 +357,18 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }
 
-static void nbd_init_connect_thread(BDRVNBDState *s)
+static NBDClientConnection *
+nbd_client_connection_new(const SocketAddress *saddr)
 {
-    s->conn = g_new(NBDClientConnection, 1);
+    NBDClientConnection *conn = g_new(NBDClientConnection, 1);
 
-    *s->conn = (NBDClientConnection) {
-        .saddr = QAPI_CLONE(SocketAddress, s->saddr),
+    *conn = (NBDClientConnection) {
+        .saddr = QAPI_CLONE(SocketAddress, saddr),
     };
 
-    qemu_mutex_init(&s->conn->mutex);
+    qemu_mutex_init(&conn->mutex);
+
+    return conn;
 }
 
 static void nbd_free_connect_thread(NBDClientConnection *conn)
@@ -2229,7 +2232,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    nbd_init_connect_thread(s);
+    s->conn = nbd_client_connection_new(s->saddr);
 
     /*
      * establish TCP connection, return error if it fails
-- 
2.29.2


