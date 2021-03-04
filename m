Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBC432D0E8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:36:22 +0100 (CET)
Received: from localhost ([::1]:40806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlLB-0005gc-59
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHlKH-0004za-Dw; Thu, 04 Mar 2021 05:35:25 -0500
Received: from mail-eopbgr70111.outbound.protection.outlook.com
 ([40.107.7.111]:35469 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHlKD-0001aM-Vt; Thu, 04 Mar 2021 05:35:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFELj7DbwK3ncYMww+pvEWc7ESpyUuR1bgBNEliMsKOfbTSpdPC9lUl9vYpp1j1HtptPa2Duvb4Usgj7v4IZFJLfbY6dz4/j3/HMnYd7bKaY+Og3TNmVNR/jx8Vca0EjQsFijjRMk2QZisqQqKNsHTmvVXHQ2a18cTXrNaVzAoHwMQqHrozU4EoCAebKbrbotDFwOptUqJP994L8YP5mw3mdT64ZrXNcO0CFcwZKRvQGY8krXD/aUT1wzfQVwZges3CRjVq/DtEScoZyIUoIo6Vs3wbkbeArgWdg1q4IA8Vmsu2ztAU/KIb+6UW8H7rxscmK4W1Qr27Fkl6Q13TuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n35oN23l8USGsAkzJBCabTi5MUQ7c+HyRPhzDTLPFSc=;
 b=Bx+Qbxa5QCrG3Iiwsp2hpYhoDz3eYtQVUXvXse7KNIoHm30TLwOctgY5zhodk4Nf8w3kH397cYdGKOul/S2QeYxd8s3X6Sn/38EubDNUXQZr7IS5bFaqB5aY9VJD8VGYTXYmCJpg6hHcLAldH8S8dU1LD1kDM0rAgaozxHaEhdcCDaY6JCEfwXOh0DyvqeVLpbbJbFNCEpC7rtSXyEQAmdFdzHe3AVgjrBRzbEVb3ZDgQAfu7+tVdmNfP7UzvcrZCheZeYjm6quvGv6mWSN3njPwqUs6GlhYxbr3/bflAUCIq+ENUAyRiMF+abSzjWqz6CGj4qUMqFvbpnP5u0/+qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n35oN23l8USGsAkzJBCabTi5MUQ7c+HyRPhzDTLPFSc=;
 b=Ru3ZJlmDSZ/iARfaMWmztOl3/zSwV2TmsnV3djQeyA1dEAaH5Hr1N9Pybw3Q39+DGuJr7DX3Lge3haj/ggD6OdsXIXspBCiZN50EnHqddq4X6IBod1PYrwWv/QW64Ex/Onr7k1t1mX9YOjq8i73mATU4GX2O9sIif4pbMODm3EM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Thu, 4 Mar
 2021 10:35:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 10:35:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH] MAINTAINERS: add Vladimir as co-maintainer of NBD
Date: Thu,  4 Mar 2021 13:35:03 +0300
Message-Id: <20210304103503.21008-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.246]
X-ClientProxiedBy: HE1PR0701CA0054.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.246) by
 HE1PR0701CA0054.eurprd07.prod.outlook.com (2603:10a6:3:9e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.13 via Frontend Transport; Thu, 4 Mar 2021 10:35:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05bb74cc-c8c3-4c9a-af8b-08d8def93487
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB615183FEEEDE88C2ECE5394BC1979@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4AT9ejijRRNpDN0jiX9Y6hljdf2tBSZWyYNtrJM8GKF72FoWxHeaJ0o/5XGN92DBpGngQJ4b1BFyFr7SCTr7X8oAu5anXQO8NFbAcvr0y3wb0cbqMZrZPkCpeQiTKynrDwtFrMx2jUYCyuEWD4XyLLZOypIRmTxy618gvq+qz5/qg5IuA7xSgF06v+eCxcyVLq8M3KJ86n8dacKqZnHuOuQEQxrHSoVQFaseKXAjITE4ZWBz1RGcS/xgPU+G21+GMBocjLjVh4i98+YX4mGSfw152X9SFF9oVWh2E6jWsgtQZ19L8t9ofvONNQNxWLaTEF+efqSJIv6YuJ4uWJw7y+WWeft6AsqokPBoyuBCuOrX3MYdp7FCJE0Yqg94nM8orGlGJSWOs9bCzQBMyB3NsjBhLQ+7JMS3cB/Pb2qbbvdoxtNxAz8+u67OUTgF7sv5rLbHGuNNHrS94I4xWI2aQgJfNPcI0H0Tc0iIqV8Vw7uZk8govZD6fRv97K0SN8k0JaMe5m+8HRy8B7n0tuc3rT08Wyka3YN+t5tY8vMz9dFSnfJ4DdUUD00F84ufAt/NyjSVJj2JLcN5glPiO7wsfsMzOu5sNgqEqpS5wSfdPc1MPG9ZpMCnhQOSTj2eBvdzn0ZPOqJBO5RJnmIqS9Ng10F8q1Jc+AB3u83StU/4zZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(136003)(366004)(376002)(83380400001)(6512007)(4744005)(5660300002)(4326008)(86362001)(36756003)(107886003)(6666004)(8936002)(1076003)(6506007)(966005)(478600001)(66946007)(66476007)(69590400012)(52116002)(66556008)(2616005)(6916009)(956004)(16526019)(186003)(26005)(6486002)(316002)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CV+kPbAWxpCcGHJS1g28ZXSNboX4hCI3qMYJoyTfiK/a1sOOetJc+2RU6DF5?=
 =?us-ascii?Q?tN6ITRNtsn/CLQJfXkeJI/HsbnN6K6N67L1pRGYgXwzx8L8InlzMxnVh2hpK?=
 =?us-ascii?Q?UAEg8lXuiO6Qa9PdQ7Bw2mihYfGuhNHA6hmDgS4rOcewK5shDRBCFgEqKzqN?=
 =?us-ascii?Q?2KzYeGauvCwVOw63aI0atrNBF2wBHlINoTKA/v3adTxq7R3IJb5bz1BF70c6?=
 =?us-ascii?Q?rDNcRbl2wSGOVdN12ZUpwRShZgVDXum46keo035ZSZaHjpx8wJ5ALK2gPawb?=
 =?us-ascii?Q?AE0ER38hNt/PPpA7LapGUgg/ZD6mU6kkHG+t4ttAN6Ytnk7Nuv41MuEhQn6R?=
 =?us-ascii?Q?G5s5m8lhMbyjaBRFy2doROYaHcLJ/a9E/oi94PIdYbznVHFkMHvPxZTy2C/7?=
 =?us-ascii?Q?VGTo6ZfFAMlIVm5sQnI4Qu1XNey8QDJTi/Kvuf07irX7bYtkNE90hwGVaMCh?=
 =?us-ascii?Q?21IxwwNsHtASChy/paI43JsSc1TPm63s13KWr9bKJg0vJX+tVmrmJQrJ1jaj?=
 =?us-ascii?Q?US8wRAj18k3pxc14J7WIHpvi0eqButCAdJwHBWvMafUv8Atsh8V7CKfic4+u?=
 =?us-ascii?Q?dWSCv9jlRBxR08/djCUe1waEdqAIeZJFhoyZJ0OY7ckh3cq4sK3rjO1PuW66?=
 =?us-ascii?Q?uGAQU2oZC7acLRHAYBEpak+xSEFqJ2pFbOk9Gu8EKwH/Y7m5KYXosdLA8wox?=
 =?us-ascii?Q?b00/GyIr0i1LyHhF7XEQIYE0p5UFGah476OUF4+ot8lTIyCnnhJIaCMpZUkx?=
 =?us-ascii?Q?Nfhlx2exbxZG6brUGx+U2HxeRoc+NSRh6kZDWjBkF1tfWfDhdGJYGo0AFYDe?=
 =?us-ascii?Q?+M+CMOOzvhD2FOjw4/nq4S82yC2iw2rcG73sh8nWe+LOz1kwHBTS5PAn8E0K?=
 =?us-ascii?Q?28eieqDTM13TI8Ese6dQ8NXYhlCGVhmnX5i0ykSkM9hYbQeUd/7KgxdJbol0?=
 =?us-ascii?Q?DVxUbtBbZonxaQmX16HGP2HJ6kRVDRjGggcMJfpbIJxX/pVBU43Qh3FQdI3U?=
 =?us-ascii?Q?MQVRE8/87xjqAhl7QDQuvwN2NEQNfysMHdn9o7UdH/6uAhVoKDNWudzcl3ms?=
 =?us-ascii?Q?jcGTWdL+rWtGcVUiXQqtmXDkz8h/N5K7ClKD+n8USdghGsLakyE7GpkfaV6B?=
 =?us-ascii?Q?7FgeZP+gCnIdqtmW/0yiTtSR5n3ziqp1qQCL4nkei/sSTBGBJ44xId+n3gSG?=
 =?us-ascii?Q?cS0oNAT6n07ybBpMTrUa+JryeLjlnrX/uphlpJW6L5BbFwj5/2K2SISD+aRO?=
 =?us-ascii?Q?9n+1PnKIIZYDT0WM85glDkXBL4go0i66KNEPi6QdPRWnMz1eDKhLirzoxO8w?=
 =?us-ascii?Q?v52cVy6ja5Z7vqoqNKiTR4w6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bb74cc-c8c3-4c9a-af8b-08d8def93487
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:35:18.3769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDl8sWYl/HaLsCLEaScSKD2Gqh6jKGBUIqxXuaYYo/YAcuFtm54TBsrdYhRb8+HJ/ypcHVky+l3C+ucAjRgZkTxub08H9F5rsjWkPYcDXxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.7.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

I have good knowledge of the subsystem and I'm an author of large part
of it :) 

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 92ba1fce5e..58994bfafc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3024,6 +3024,7 @@ F: block/iscsi-opts.c
 
 Network Block Device (NBD)
 M: Eric Blake <eblake@redhat.com>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 L: qemu-block@nongnu.org
 S: Maintained
 F: block/nbd*
@@ -3034,6 +3035,7 @@ F: blockdev-nbd.c
 F: docs/interop/nbd.txt
 F: docs/interop/qemu-nbd.rst
 T: git https://repo.or.cz/qemu/ericb.git nbd
+T: git https://src.openvz.org/scm/~vsementsov/qemu.git nbd
 
 NFS
 M: Peter Lieven <pl@kamp.de>
-- 
2.29.2


