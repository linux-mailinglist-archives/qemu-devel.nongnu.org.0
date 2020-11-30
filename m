Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE972C85EC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:54:27 +0100 (CET)
Received: from localhost ([::1]:52364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjdK-0002Qr-74
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQN-0007BQ-3v; Mon, 30 Nov 2020 08:41:03 -0500
Received: from mail-eopbgr80115.outbound.protection.outlook.com
 ([40.107.8.115]:22148 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQL-0000SL-2e; Mon, 30 Nov 2020 08:41:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nc9VdZ/ZH3yumPebzE7H8ZEn3yZMAZe0Ti9UVfueiz/y90rxrKDVxCB6zgesLgmVwPEwCfYgrMmcyrLX0sQcoDr9cx2oLpXtINbpZwER5YLCv2budf3B4JJdDAaA7E7EvRuGKIuqeYSrrZG/dcpdtziKnUteIDXYSII9S55aiFZHGigj9Fz6B1vC3F+TaolGUoEovW5IhU40V+a3f6fDKLKNsxsdZBkmUkLi5HikJcZzgRhaje69gCJOjHvcEV7LwfoaQFLW0jQJDRzig3SUdnFwlZI1Nym1mwcPpR27Zss+F3g3kQz6I3FUwOTCMn6BrCBvjx9+s6ygNYalVi8+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1xS9ZdqIIkUExBFpJgDyGIF+HBdRiuTqOqgsWR6qEY=;
 b=Kg1RTX4Evgk+r3E+9AFcMKOcxNUwfTuz+KdKu2++8xVLrMsZeSro+rZfh0RHGROW1z15z9p4yhtZldB0uKG4fiQP9gLLXjVr5fFZ1RWlNHYxYFxsQf2s2wCW7cYtDpm5ZhgOEszkH9Kx2gkwKgves0xNCs58Y2TlNlTa8JNSIzzEVjvCy9QFf27PWYjlyHoC1KyapEs+G+sdGhWO2BTw7CFTIcbCc0OTT/tsLCSEat2DvFBj28oxxZt5uPjLQHYiWaa21gXShEW0MA1rYXf3QLNOvABRR/alHgHKBpW34aggx5OgnTY91DLUH9BzsdW95iE6erxENH24wGJGo2Xq+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1xS9ZdqIIkUExBFpJgDyGIF+HBdRiuTqOqgsWR6qEY=;
 b=qaxTDjo/yY8AgtO8j0PW600qtt4LBuRr6NomE9Wigj4+xO8FhLETEvvBvn9VrMDbNuRkQc3Z04tN26zhsVgcv9AK1ZhFV0ZzF5FJ1KNSpEMoxdeMO+nUMPfjx8GzTg4NsF1QWH2iKdmq6hmblmmg64qXoSgL//iYjvBlI50uUkU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3448.eurprd08.prod.outlook.com (2603:10a6:20b:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 30 Nov
 2020 13:40:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 13:40:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v2 7/8] iotests.py: add qemu_io_popen()
Date: Mon, 30 Nov 2020 16:40:23 +0300
Message-Id: <20201130134024.19212-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201130134024.19212-1-vsementsov@virtuozzo.com>
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:208:122::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:208:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23 via Frontend
 Transport; Mon, 30 Nov 2020 13:40:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c925cc5a-192d-4558-c0c4-08d895358997
X-MS-TrafficTypeDiagnostic: AM6PR08MB3448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB344860ECC3887DF348A460A0C1F50@AM6PR08MB3448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:317;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cz13Jbp+LRkIdhXmyY06egGW1TUWIEcLwdDmz/P+McJTo9CWGQMqEInbaZqDvA8GK+JzMB+3hyk27J7tlKE/xvhTLn45bp0Xbk4W+AfWREt5tDVo3H8bbhCiiv+pgzF3hnQ7KjEgJsFDJCp7dPNMr5WvzMIn6RL4OcH0x96JjBtlKo4qmoSy49P9PDQAlAg9GJ02oNVjUYSnHP0/MER7KgPXycN0ff/NGilAHc5cNqN0WqANDY91lGrhTv2ktPVUWwBbS+pty9ofDHnskB9G9D3HIUsb8V9eqzV0GUVbTexz1ALs9WyiOr/isZZzjgtQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39840400004)(2906002)(478600001)(52116002)(4744005)(6666004)(1076003)(4326008)(6512007)(8676002)(8936002)(86362001)(107886003)(2616005)(6916009)(316002)(956004)(6486002)(5660300002)(6506007)(186003)(66946007)(66476007)(66556008)(16526019)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oaINkNalktytxke6x4PL/4htAvg0qZW5E2g/HyNqQXySKkHXwbgBHDEar856?=
 =?us-ascii?Q?ABHijj0FrJk9j2tvZ9VZr1xdqhPoRFSrKMoaxywEg6MrF5SMDVMoNGGZKIzV?=
 =?us-ascii?Q?I/SmDItsb+YknP1cIQpALa58I+viOGm9+fVUx6SYtK967vl5mEjKgZGFtcr0?=
 =?us-ascii?Q?Cp7xPoZNgPVqvE4FWPLLHArPmB4aEHnwmBW8vLEv+7OZVRiDq1umZJvT4PPg?=
 =?us-ascii?Q?8bMBxahjn0UrgII58JjNEJnIxJmbPiOFKADnDJdchZSsNyq9SFYT54eBI7Ua?=
 =?us-ascii?Q?jWEOwqXQdUyZ7zpUjVhsx5rTh1qgF4sqPln3zoZyddKbNhTZVip3nnFCRbsG?=
 =?us-ascii?Q?ix2c8PrWZ/LOPHyIl6vUOs8RISmUtge1BES2VyGGmJIxfYrPRJ9uNpdeYAgW?=
 =?us-ascii?Q?3ezy28XGau4sMKsJVruRBZni6psuOsBQyj+ovkWoJnCHKCbZMC7IcrRtOidA?=
 =?us-ascii?Q?2ZCl3TSHvnvCYRLMbQDd+CUDX0/4Zs4COKujlUUo1RtW1S4SUNoFmR/DAix5?=
 =?us-ascii?Q?EwtCvjNTm5kYLPS01n3quv6CERdt+JGni/Eq0dMuhzbcRICJap7p5mq8poDx?=
 =?us-ascii?Q?veEEsAV3uX0K3JsDBVgGyCYWJ+6ugmGw1Svnl69Ph3zIzdMLHTuHQg7PE6vj?=
 =?us-ascii?Q?TrEQGmhbC7Aw5XiPH6fc4OSNbWHTsEME0GFSE3GAP6yZ/8ewD6XZTyPa1Qyb?=
 =?us-ascii?Q?c2yGIQiUCJZmtKZfB1vaxrNevN4H659mTHcq/x0Bi4CJ+RxQHyQw0008rkHf?=
 =?us-ascii?Q?32jusWz2pJsa+duTy89ny9+iWGM8q549Gu7r+O7wNH0oxXnLhZv9H42d3ycV?=
 =?us-ascii?Q?bKeADSG7bVw1XVAoS8EYjT4RQKFusbT6Pi76UQFqbEmNkDPoEKmaf+kebB73?=
 =?us-ascii?Q?1JQZUXRwtXGIcrDMx4m8MAcQuuCoMja1JwrenmW562Ao5rlyeUmMo3Lxp48q?=
 =?us-ascii?Q?RNjq6Lt5hKGrHkWPUPri+gW/4VFZKuNIUyES4dp9yh09guIMPV6C2RimELTu?=
 =?us-ascii?Q?VqUG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c925cc5a-192d-4558-c0c4-08d895358997
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 13:40:44.8408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGOkycQjqWFRxdFcNMs7QNI4ys/FuMc29fQ3t7/cu46ULZZbhtbSui3vBE90QDUF4fGMv+frFygyxAGscxvXq2aBieD25TZ5xE5K+fmA85s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3448
Received-SPF: pass client-ip=40.107.8.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Add qemu-io Popen constructor wrapper. To be used in the following new
test commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 393028eb9a..d7b488f7ee 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -196,6 +196,9 @@ def qemu_io_wrap_args(args: Sequence[str]):
     else:
         return qemu_io_args + list(args)
 
+def qemu_io_popen(*args):
+    return qemu_tool_popen('qemu-io', qemu_io_wrap_args(args))
+
 def qemu_io(*args):
     '''Run qemu-io and return the stdout data'''
     return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
-- 
2.21.3


