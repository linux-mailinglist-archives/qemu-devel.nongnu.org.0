Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE2A361B39
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:17:38 +0200 (CEST)
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJfV-0003Nb-FF
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJY7-0001TK-T1; Fri, 16 Apr 2021 04:10:00 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:43105 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJY5-0007xx-Kc; Fri, 16 Apr 2021 04:09:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzOTSjrB0aJOH9ZnvlJdL2J8ph4w626dJdyO4qxrPtI09GQ620JYBLy6JUWt7lu/niLREZnXpbMBkc2oVmhutMrAlflzoolS1udHy39YTOfQHeZ/3QetiB6Ns6Kn1h6R38b3BY06pNdJBfi/A1fy9D04ciSttbkk3T3jRtPNRRi00wPvC57trhzOpJFKlJkKH3CMiSfg2D21MHX9f7BOSupqjJFn4pXp9NHyqW4TG3hqWXgNEMVe21BvQd7nFWapFY2Bt72XUMpUnTL0lK09wsKSV0bCIFl4WG2lT+p1rklDo7el93r7/mq4z+qBP18/XyX+CRxmghkPdl3m9cCwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyLFtyvqd9vWQR68F+LPTxA6XgmQma/UqgmxnnZ6OuQ=;
 b=cEkCpjee4oeSGJ4s3TaWJ1xqcoGNhFPptw6hfyjwzIGkwCXdJ29njfh4M+8p/b/Mz87zKqcj0Z2oDJIlces32kuRwO3eo5JRpujC5+fvzsLEeB1rJeGnJkWVObrmOUHLqtpFx/Aqzyni31cdMku1lQ9H/YP2qGGn+lP2tISIFRjoG1/jlDSTdKCVB50Fs/H8Xn7NiQ+CVTTJzqTxwRH4Ytm+ewQHZTMnkfo4Uqtx2U/H9I37ikRzTi/FgR/X2Vfj02WR/Jyw15IAFOwBWl9JUBjz5fS2zG+xgdi+CNYfdRkVr8yu+4JYHrqvU/bUWZk0Xp23BRB44FG4iOQymCdHzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyLFtyvqd9vWQR68F+LPTxA6XgmQma/UqgmxnnZ6OuQ=;
 b=FDGj6x2lbfQ5qC9kWgRl0tnavSG8OFjIIBf5pAe2slv2oZkANz7X2lb4SATIdpAvaDddnod+C7oB8whb/F/d/4beeZ9vf/8cYbHS1xb7x11zBSg8QIGxe+FQ6VtIPylg4elKqLWUXZORMSPM2g0vCZXC3Zh0oYstGt0u19q2lck=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 12/33] block/nbd: introduce nbd_client_connection_new()
Date: Fri, 16 Apr 2021 11:08:50 +0300
Message-Id: <20210416080911.83197-13-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00364896-13ab-41c4-6b79-08d900aefd9e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691139F13B5A3175E9A5E1BC14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:34;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qLxL+p2H9pBqpoveKJaiVYtglgWuQtOnR776HFhshmTSmbIonLAZxONQuQi50kdE+lOdsMYgU4fXk03BpSak8u47aUG0ORYdLfrxS8A2YT5oHZEPIbn+Yes7aneOBBKjmFjVZYDGUs8nlyWFhgbGR3oxNGUOrCDC84xDk8Hq6xXlWmk2+yB/oF4avGXwgsdonoKUxGZDb2fsyHGN6hDtQCuArY6laoT0k1Haxxgi00yGWLvoRHVVSx+uIvEwmZwpNiJFmtzQe7Fqhma/woF5SYoqeqXlCZz4dinf/RpuUSDtZ4ns3Ex97w7iJhgoBQw8bJfM4+Sbzmjd39g8UY0hE6eukUf7SqncWyNKd24rJph1ovg7IB5vreOW4Y/TWRbGn9s4lABlyKDAePn+sEfDGUJFAjgn2nNePuiwVLNWCE+CTw/JkftU51aJUgGsPbggHLD4CC3uL4x7N6ZGvVLKlScL1MKgxcsdDgmmjlTTRsZcOgAaUtnl+2t6X3Yrq6OMyvlZm4Cz1CNzjobmpPKY+TjmL6Nv4JXC2jZhzw7wtm/C5gampQAKceqNEXa8C0Up3JE390EE8ys+b6kDtCwjvW/gw7V44BdDr3PsHZAaZvHUsdzJZ0gfKOdfq9epT8D6KfCoXZ6eenob4UbmPSgOso4pHEbd3jky0VG6tjTtnALTO6jv/6YeMygXmJhBY3y7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(66946007)(107886003)(8936002)(6666004)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(478600001)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(316002)(36756003)(38350700002)(38100700002)(6486002)(5660300002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hAdjOXbB9eo92qGDRzEHL+6IK1HH1s/g4u3h1ki4u0ZoblYGAmgubfgaY5Mw?=
 =?us-ascii?Q?vsnVFROfi5KkMJP69CqCWsJmWp4OPJFf/BttkM9INV+gjnlRR8AjGOlIDX4H?=
 =?us-ascii?Q?KeSFjrJojNs0xJ2+b2PJiRu1lxYimrH2sgq32Q8sKUkrfu2jUWQJiWfz4PKV?=
 =?us-ascii?Q?AZtGKji3U9ibI16Bd3ZPYrytbrairCrkEbme+TTkOKDu9rh7OW2sldmMh8II?=
 =?us-ascii?Q?AJlY4UCCPVFC4X2DthiGtSgZ15CPTUT0EJfCrD8mV8cFZYnG6wXz8drqgC8D?=
 =?us-ascii?Q?8FW8Q8AWLeKf37TVCV5KtqanjmMJhx5iklLGtLSPjaEUJU7SLq2Z7zApR8yz?=
 =?us-ascii?Q?B9B6YPiRJtMaijuA665e32VGAq1xQCX91A/1FsywZ2c3bD8n4QUTLvUAiJLK?=
 =?us-ascii?Q?JJKKoMgYgUGVX6KlY3qfJwoIxERyb/jTjoFWRs7Jan0HmMl+hRs7wcBnZB72?=
 =?us-ascii?Q?PigL+ckBj6OlbWl0YKuY7cIn9qKz3mzTzKioOC1VtLkFitGQnLvO9/1Ze4bs?=
 =?us-ascii?Q?/h0Raq23xFQS4KtXs1ra4zSoATnmz7noIiP6UoaAhtnOEBYCNK3hWlro5IFp?=
 =?us-ascii?Q?uy6mceJHI8ONnd85Eu5OqS9BoZR68Tb3tF8UgEgOdlyzShM9BX65giaUXqsh?=
 =?us-ascii?Q?a/DgGLxKBNm1d7LiN3grPFlFGsMeca5L+NbEVeeVQLTfymKLucycAMnTdlJ/?=
 =?us-ascii?Q?7x6xsvXU2oQZmgVQGShgJcG/thymip6uj8iJnLuSDR9b9UPUQRm34yQMU0LF?=
 =?us-ascii?Q?/ER2LBRI93EJgnX4Hky6+yPgro1a4bfuo6ruhsV9fTTXJbN8jeyxDLuLJcK3?=
 =?us-ascii?Q?Fx831haxhshn7TX/EqqIGybTuQnTQ7JUTf+BHoC7Xh9ZZuWyw7ZXOcxeb12t?=
 =?us-ascii?Q?Dr3yGIqCZ/cz7eCkIV/jgVVWoU9FKHALul2q9zcuUgk8rs3uLVMHl6yRziLi?=
 =?us-ascii?Q?7kuI//oRFqe8pHt3YRtnLse8KcymLoiwQvLQ05yb4XL83md+dASQ5BfEITYn?=
 =?us-ascii?Q?RmjGjAMOlaymFrEz2Hub/heM351mn7OtYmgSkWhjasyte0q3mBzbfN7VWdNg?=
 =?us-ascii?Q?VK4tMd4+SH0EeqttJxOGOXRzhY/ty72Q6GaO7H5p0tgQcr4gGqpSsMMmLLH/?=
 =?us-ascii?Q?2eW6e72PyBCzLAfnKPz0kDEHZzYXpjclSmOKEppV1YhtlSCRJDwfM47HBUxH?=
 =?us-ascii?Q?U7JX5kHjFhDSafNJkWwmOLea7JxE7wDF5XomP6c+EW87b0NBbybdKEqKLHD4?=
 =?us-ascii?Q?uhW1JiFZtQ2FTG3HGicT77HpKkeuaCb1JQr4Vz52LrBBmhKhU/Y+ywPV5YAf?=
 =?us-ascii?Q?TKJSUHcIlsMJ4kRUK2zFiihO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00364896-13ab-41c4-6b79-08d900aefd9e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:43.0934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgJsb7Afk6Bj3FIpEEnOySa9auMvqn+u6LAdRE9RN7DJybRUurYGad6x9cFMH8g2qkKNUmRIOCq5Tr/YlbRjShTlCUpkSevLl9LLPnLUNFc=
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

This is the last step of creating bs-independent nbd connection
interface. With next commit we can finally move it to separate file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 9ce6a323eb..21a4039359 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -351,15 +351,18 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
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
@@ -2208,7 +2211,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    nbd_init_connect_thread(s);
+    s->conn = nbd_client_connection_new(s->saddr);
 
     /*
      * establish TCP connection, return error if it fails
-- 
2.29.2


