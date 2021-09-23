Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6501D41663F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 21:58:07 +0200 (CEST)
Received: from localhost ([::1]:34180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTUr7-0005uJ-RK
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 15:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTUoN-0003n6-OP
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:55:15 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:59503 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTUoI-0002vM-V2
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:55:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/k+tlJrQBWx7I42qXL4aaMaloxauZKgYM5RlG3YYK3bK0kK8O8redUt9s6ZCi+Ix2a4cXd15GevYMAey8Siwbu0tO4HtpNQLaQDbKWlp87EXyiuKakbpxvFKOk038VRMp821LLtC07+m9YeP3dnWLuPRiIVAADrPEPVHdRZeadYQKc9UOGfwtIkNPGEzUzPQMBHVgZEiHBhb7F7F306z2IpzaDsx4YtdmLOND0ij5SVWW0v9I+1FVnH41/5op+GQNtH58feRMR/EmBIhKBVNdoW3ZWxsrYuNvp24LsuM9T/GW3m4aRA/psfr2qPa44o6PEJ5zHIWzq1kkXlR1eooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=sOhk7YzkHUiCqa0L/RkW6fDtCmcAMy3Q72LZ91lBB3g=;
 b=Rip4HzxeAtxhfrGnOsfBtLOTwPYeTcmIHWVv1G9578bfYSCBOKO9OQCuf2Sd9bVSHWuE/Hbx7RdjnFokqn0Kkr8eFGBX8fIckDkngkiRs+/+aGt2wF9Zfwe4iTp0aQyF7k08bCgBJ/oVtWVwcFx29o2Gid0s5MUhMOqhSXK55HRxxpUa7LpXzvTlvDIwfQB6KRR7ovtKgt8rKLiVybo7YGYreMx+vgvD7oFVara+arfip9PM6EVT0Fj97ndBoP20S7/+/xGT6H9TwoXSePGPmABCP84ytgpsvQV4fU2hLYZ+U+fKishtXCkR0VFlDBNgTiS/tO22Ixkl//0twKuBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOhk7YzkHUiCqa0L/RkW6fDtCmcAMy3Q72LZ91lBB3g=;
 b=M4V1nVhu/joMz/wHUHKcWfXYj7EeeVtybAjXbol5+pyj78Yf88LBzb7GyO5/KUqOs2m6y4FoBBBz/31hsMXUQRoqGfXZxwNt+AVfIbEaR0RXEATqvC2nyaHYns19ASIa0DGlCbW4/2Eieu53d+hgoSXqq1d6pg2/r9OoWmgWEas=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3224.eurprd08.prod.outlook.com (2603:10a6:209:47::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 19:55:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 19:55:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, pbonzini@redhat.com, michael.roth@amd.com,
 armbru@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 0/5] trace: inroduce qmp: trace namespace
Date: Thu, 23 Sep 2021 22:54:46 +0300
Message-Id: <20210923195451.714796-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P18901CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.205) by
 HE1P18901CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Thu, 23 Sep 2021 19:55:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 948ae215-c4c9-4986-c2ac-08d97ecc0a1f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB32243C26EF81DF9C1AF1F578C1A39@AM6PR08MB3224.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x5usbDlK4HLSwzGOjTUnx2BuEGw4KZhD0Np8EDE0O1rcDWXputoXdh0lJqN7azeVcRJWgv/Qwh4FSXdtYDLbtfcbEblKNmw0TlyfGt9ScRKbQ/TvsmzlygFIqi9w5wEGupb/ckAhU5YvCaw9a4ppycjdpn1cBRWpFcb2sp6QHXxgo04hs2nRHQsO/epMTA+Fhv1qiYL1WFcx8q1PdCP/JodjTrei2fFgQfyBophgYqUiKo81OQ+sJkIYpp2pun/1fdu9lb01sH0mEAeaWLdbdrS8jOfMGF2XCj6epsEqYBE27gk1GGdWwmCt3ALMAu/sboXnWKXKGo7P3y+G9efxKkbiSTXy7JNTqwRj1HUsGXUs5fuSCw+Jxex26ftgCL1WmsiVA4S40/wj4rdSsZ0N+gRFajUcnV//KMfBhAYz0X6bcVoMuElwdsSAauxd0tBfB7Mt2pkQflVE8GgWbrGf+D1BqSt+WHRrFG5Vk+0/ijG894DguEP/u7X0+yXcw5LRKOqUWWmJ71ORE2wsM4N09I+FeDjFMJ+TWqLQKfXTIsb3+dsErnU3bH6qemY9ZlMyOTR/EoAyv7cmckVbNxeryMfsA+Z33cVHZ6xfAMkrW5aYp3yDpapnRcwCF9SfHRuP7twrXPq/7MCOHvffhL51d7RQkUNkf/Sv5CAf8OaPatnoMSH3DsA+K8ynlMwgxsn0Ely7pHdUIhxcFY2FKPKwlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(508600001)(6486002)(5660300002)(38350700002)(38100700002)(86362001)(52116002)(36756003)(6666004)(66476007)(186003)(66946007)(66556008)(316002)(8676002)(8936002)(107886003)(956004)(2616005)(26005)(83380400001)(1076003)(6512007)(2906002)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WUDyCmtSR2m+gO9x+nj+uABY8KnoGmyxYZ2pjL9Pruk1IFkZ+XYZDj47fjPx?=
 =?us-ascii?Q?H/3uE4hRfD3NPT+D5tOrsBFl9PVijhDWFKZrbgmy/OMpHvEIeNaYfpa4TQ4b?=
 =?us-ascii?Q?CMIQIc9JNQ8FBPmszLfmoW5F6rSkn1SYMndlwtRmLVdbnISpfMYDAEpFrDYZ?=
 =?us-ascii?Q?vP4KjutIf4C2k16dAQKBP2l6NCTQD2hVMBpE6ye2wLCeEeBfaoDyrZoRdOfF?=
 =?us-ascii?Q?+ivoivqIXeHvxqaFW8Bg/Zd4YpM1gXXRP3/+VSYCJMD6OamXxhF82G3+P4ru?=
 =?us-ascii?Q?ODHHg5Xnz0nlKxoY8c3FgZxT6bCBwt3xFAaH43L+WMAHQ7sivORchAFrz7y5?=
 =?us-ascii?Q?0QfndvqX4sKD7XTtR6EqS26ygRUzSsR7/4KO3h/uFY89Qy+lXINZVSL+Ts8N?=
 =?us-ascii?Q?MeKziguyoTNEyCHvD4Fd0c4g65BkjLllyia1dYuILN5ANlq0MfF/W9t3tD0h?=
 =?us-ascii?Q?mN+RfzN5mxV5GkRgwx9AsANn8GUD/dgCVfCQzjKw1XDYCVtJOOvi4fjDWcN3?=
 =?us-ascii?Q?i9uuf/rHz7VLDLx7eCrs/BW8gOrToOWdUsQ1sUiqNunbGtXZM9pa00A8jzyl?=
 =?us-ascii?Q?sQ9QVMgqDMEzlaSJG/3CeLoNt2MV7cwoGlsHMslI4iiHtcdfXKOPC+5EPLWB?=
 =?us-ascii?Q?ks0/mlYl4mPmVZzRyzv/1t9zmRuIr+4N2BCX4fSvcImLGXge3gy2pfluy+NY?=
 =?us-ascii?Q?zK4uc+ydRg9jlhA47L7X1JinKCd9FVptI4uJyl7bAkNHjLfPvzy/ymfluw/Q?=
 =?us-ascii?Q?CU9LXbpSreWXI7jJ6KovU8v7d8ovPRTsZEMobqwX/hv5rwhBpKWpgYeJB00Z?=
 =?us-ascii?Q?av7jhbr7375tEst/w7p3hMdXUlwmh+RwLGdfRuZCDh6xiW6dgaqNJ2QSrojL?=
 =?us-ascii?Q?ZSdiCY3W4xfsvVD4p4Jwpm2BuWcHKUw3upt2JnyQxxz2Kx8ryL3PjYa8Yl/i?=
 =?us-ascii?Q?yZadcj7d3ivFjQNGOGE6+mPtTC10ppGNNRq6LBPCBNDZ7KNxddaTeMyV/qZJ?=
 =?us-ascii?Q?6Jm37P9QjkYBw6XVoAytPBFvkATsw07wKVVOsWPgq6hYv92EkaN4c2HEpiai?=
 =?us-ascii?Q?pzkIfJ464D8sD0d/S6Z3DYfPdLEUMenk2GUfoUr/nK6vmtSWpGHGNq38p3Nx?=
 =?us-ascii?Q?wKB1RAap85JOVumDYdtmkSIF5fgKlEayDZHB4mlH9uRNx+dXoKNyp+H+HWyU?=
 =?us-ascii?Q?dapyBXvYp8Bf/e9mGc8Ob+DTQzqHsDvO23EJ7LSR/iEI27dOc5wJXDwxsxwu?=
 =?us-ascii?Q?P7YElIWM9xGEBLVrVE2PC451YaNxEb+aFEBtwPCzGGFp51dnZ+bCQMxAbZL/?=
 =?us-ascii?Q?z50F8JGllrM5gtH8+y7b0fof?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 948ae215-c4c9-4986-c2ac-08d97ecc0a1f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 19:55:06.0526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a95IBK25gM/Nhk0vmQqFr8q8PRhjL1f2gro3qmJt5RvPO2HLWqeT3Imc5kJFs/w1HaI+RSEl+wZrJVocfTveOE8KYR6WCSyUJNwUfIdUoz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3224
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

Hi all!

We have handle_qmp_command and qmp_command_repond trace points to trace
qmp commands. They are very useful to debug problems involving
management tools like libvirt.

But tracing all qmp commands is too much.

Here I suggest a kind of tracing namespace. Formally this series adds a
trace points called qmp:<some-command> for every command, which may be
enabled in separate like

  --trace qmp:drive-backup

or by pattern like

  --trace qmp:block-job-*

or similarly with help of qmp command trace-event-set-state.

This also allows to enable tracing of some qmp commands permanently
 (by downstream patch or in libvirt xml). For example, I'm going to
enable tracing of block job comamnds and blockdev-* commands in
Virtuozzo. Qemu logs are often too empty (for example, in comparison
with Libvirt), logging block jobs is not too much but will be very
helpful.

Vladimir Sementsov-Ogievskiy (5):
  trace/control: introduce trace_opt_parse_opts()
  qapi/qmp: QmpCommand: add .tracing field and API
  monitor: add qmp tracing API for qmp_commands
  util/qemu-option: make qemu_opt_del_all() function public
  trace: add qmp trace event namespace

 include/monitor/monitor.h   |  3 +++
 include/qapi/qmp/dispatch.h | 14 ++++++++++++++
 include/qemu/option.h       |  1 +
 trace/control.h             |  7 +++++++
 monitor/qmp.c               | 10 ++++++++++
 qapi/qmp-dispatch.c         | 20 ++++++++++++++++++++
 qapi/qmp-registry.c         | 27 +++++++++++++++++++++++++++
 softmmu/vl.c                | 21 ++++++++++++++++++++-
 trace/control.c             | 18 ++++++++++++------
 trace/qmp.c                 | 20 ++++++++++++++++++++
 util/qemu-option.c          |  2 +-
 qapi/trace-events           |  2 ++
 12 files changed, 137 insertions(+), 8 deletions(-)

-- 
2.29.2


