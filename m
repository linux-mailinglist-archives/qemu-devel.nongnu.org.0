Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63610361B2E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:12:22 +0200 (CEST)
Received: from localhost ([::1]:40530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJaP-0003Ae-EE
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXi-0000ue-33; Fri, 16 Apr 2021 04:09:34 -0400
Received: from mail-db8eur05on2127.outbound.protection.outlook.com
 ([40.107.20.127]:14400 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXe-0007pf-6I; Fri, 16 Apr 2021 04:09:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXx88XWncSThhZXR/8EMMX8+7Q/UBQ0uUsuAuYcVV5OGBICx60UFMXV6a5+bGGKTCs+S7ZuNYZiA4UfSKqbwPQ4baUFdtGbJHfykE//DZ5hPLUMg28TtAkfLDENCjN3irKDqvGuqsTP4i10irHbeRGoNU4yADvlJL6tHoP9g+Bzg6DeiB5WRuQRcWNNkPx7JkIw5hsOfdkq4ntipfFVN61hT26accFghb1D2HaIdXDnQL8mp96h0l3oRVb4a4fckx+QI09xcpNH4ps+fzwgjVQgtNd/JMoDT0MAG4BUNR6yyCwM7mWbq6Jlq9f7rsNlHp7LxVy3JfYVqbAi0lRH/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30pkj6QTl/9AM3wVLzBSAMxWFwdL30Z37seiuHqiE2M=;
 b=jixXUnaWxZI1pNCWX4i6EXLJFdSdjFgqDUVtDPS55icIcT7i89FO809CenplDlA9+bewJBbQ2YY9ov7s4ZlGuQKvgIKBYbKA89ud5EyAqWGGXliBIjpkilJaQ16uYOhg+JvQO35M4Hk8pJQQw16RbFv1m4t6BBdYZcLcWixr5mgm+C32sMHI712di4OgQ5qAuHRiDI+2M4dTIhUUCfLJ7cAlS4K45eJ7dS9VNnRbI2aB3GSEtgbTeZv7V0/fVAEAFaPECnXAPsPCzEZOkoV80RUu+3XIL6BlAnTZ6lnxzHweT6nVfp5lIsFqtZbFIH1FV49bGvK4V+jYZvC12Jc+UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30pkj6QTl/9AM3wVLzBSAMxWFwdL30Z37seiuHqiE2M=;
 b=K13FTp1hX5aSYWniBq6k2Ah2uKDhjQTWFIdrxBelEgesZLUbEvgju1ibgdYrmOHBJ5nLOxG3HhFv2cC3n7tPnFL0eSLu6rOfV7mYmlQupQ6H2APDvy6g91QuT8aB8FJ4dauqYLmzTtEVOS63bYF5NydJhpdGauaon+AxfeFDn3c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 00/33] block/nbd: rework client connection
Date: Fri, 16 Apr 2021 11:08:38 +0300
Message-Id: <20210416080911.83197-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16af54ee-2346-4327-1773-08d900aef392
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46916EE6CE5C96EA1522B92DC14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 71enNkarFSGdQjzzyx4hB2I8tHQIPpFmI9KAUBdQBXkV5XR6A9TRBeetrTGIEc8kZ839hIEfLCgHdsOBrVA1uDBlG9FXk5Hse87/68IL8OAP9gJ/jIvMQ1toATZK+F2myitW0UovW9Tkxozym2g4LSQP9Czcij0nMtvkUQGZp87eP3Pr+TgCJruioAqRS0y4yMKGz0LBeKjjIb8SQK9G54Q+O5rgtrEgiacJCONwxBTFjnJIhIarY/oVmnNJlf7hnjRM+kyFTepUQbYXnstsWfIjMiJu7DhMDLaV87TlihO0O3ZpH39cV4HeuIXbAG+zvKZWq0KXRjOutfMVaAbfL42YqXshP2Qyg+YvkTvGy8UaE1PrKxDBfTMcnAcqKcJjZKR59pyz8eZ6IjYL4LKuh1HcdmV1qG8SlUPmr+AqWZyG/2uvJ9EbhSJnYqmF9o+Gg2c8PrvEhWjt7i66w9TzBIAjU+MZC32+E1OTi+IjuhvCurlguxlHqrWAPUE7t2aiZexsBa+ysRaRAVDkujNJhB1LgLK4VIp8zHbVSvJ6faKFhyo+fonaf5lohjrzYyxyOZy7DQwTb4R/tlrheSdWxIZQxlSCeNF77oAnRMzyqXfCyWmFCRs4FAuxmHd/sK9/fGWZylTLJaPCVWORTkEUt50aUoP/WqUJVRlvDVvh8ZQsdC60lH8W/Lg/kgOthxkg9OXOMjqO/K2ggKB1OdbSN8rF/JsQeY1mPLREbqmygvIdYcrhiOesVhwnERsnxXCSUiu8rY4ayzyMb3Q84P6Zmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(66946007)(107886003)(8936002)(6666004)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(478600001)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(316002)(36756003)(966005)(38350700002)(38100700002)(6486002)(5660300002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SmD6UNHwRuhnfWSxWRUrHDLkRAmJUdIi+Fh+njgPOLpJcndlEIoWwT/uLmMx?=
 =?us-ascii?Q?BWO6E2us0h/HpG/DjUsfZfOKfaOmR3gcQzYrfM7c8d7AMONyGN7ZsKHVqhHr?=
 =?us-ascii?Q?OYaIn7v15A87QXLdMongJ2pekLpY55hrUrasAwAys3rDDVg9P4ovArliOk9s?=
 =?us-ascii?Q?KUYkF0QVm8MQxDfSgLfpbeZXaONPNamcmP6+T1+DCAV4HflMv1I7SRxzVGTL?=
 =?us-ascii?Q?cP+IUnSXyz/xOcO0TcmQVZcfZs2hdpIJZOOmiSaXcRZ+ouR2ToYzpL20N5l4?=
 =?us-ascii?Q?FLsB+Xwnz2G6mue9hGkwbo05zIAFKktXpJCeQ1+tqBjFYBMZQj0RyNSrV9o/?=
 =?us-ascii?Q?tdx1YD102DYPWA79quWm4JvPGkq/S3pRcBAboNRjuwNZdZcFXz5P7nOWnYTF?=
 =?us-ascii?Q?V+w4M8DPnb2XvFqsgJT7VMzw/CWcPmNtotPBVTUX4FLZ8rzKS4UU5aP4E+A6?=
 =?us-ascii?Q?VMwp/5HbdMb3PzXW0oyXVqpPkkAfcT07xTSAbEl7A/Pfd0tVUqq6BnCKHa94?=
 =?us-ascii?Q?cROMLWAlXwPXbm7C1HQR3wnB0pghZE3l6axnqtuGL0lC9W36CK1BvABweWWg?=
 =?us-ascii?Q?uLZ6XpY1cfk2xFGn3hmkUY0uyGPwUqGl7OiJbNXuzhpAYWdfWvPor+VM/nXV?=
 =?us-ascii?Q?N2WCdhxVqrp4lhSD+Bs1m/ra184cG5shSLxzQgl4s9bcWlMnoMOS1+vrrnUz?=
 =?us-ascii?Q?Ry3wW2+F+KQJhDAMebOtBLXRwUCOt8YwDlmgCnLlL+mGOckqIwfRqz1qaIRl?=
 =?us-ascii?Q?FPXcGR5CLuyzkQyCg2onhQdU5nB01SWa/5UizS3fIrq7aKtp5jLVBiFtBKEs?=
 =?us-ascii?Q?4Gcx9XyDyj/DhMqX6hLEP8a6sxvyssMWcJVVeNlj69r1AMzIN1vyNCKcJabs?=
 =?us-ascii?Q?uHCavbl7WujF4+b03gQ1+RtToANd4d6vhk8TabXj0y+qxkfkDxhU9i2rUBRj?=
 =?us-ascii?Q?8CLcwgjyQrb4++MV30NhW88C5QgwbEgFzkIsJ4z/GQUtmdUCl4p0XmW3ZuTY?=
 =?us-ascii?Q?iVPhBhHsf/QtoWV//ixbX2RLfNsP3ptXXO+YLH1gYSJG+8QanGz5ZhE/hVTh?=
 =?us-ascii?Q?sXJy7y1a2ewtr/EkI27SxJPHWSRUDe34eFIW+MaRrCs0dtYI9XWjFHLlAmg1?=
 =?us-ascii?Q?m9DlK61eTxG9UZRXSUwmvTUpJyFrde6Rcjx/I7+LH42Us1NcAjObRThwduMk?=
 =?us-ascii?Q?DiNaqmZz2A4wlSkEH9HfMmY3bQr1y+SL/Jrprr8nJqF8L9Gaag/9/Xm0ZPcY?=
 =?us-ascii?Q?iyHxqCmiCBuLdmVAOH9teNSbY+0JS3AZpAzeJpTzhMTKFKyomdX+JL26+mqR?=
 =?us-ascii?Q?4yGZvCTEtADBSEO2f1u6PkzS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16af54ee-2346-4327-1773-08d900aef392
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:26.2215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81PINeYinlm/BrU+9MHmxSbTsgVDIv6eH64GFi0sQavBUP7OZ5bTADxJRKW0d3iS6+Rq2scVN3UuRpHQeGcsP1CCiRY2B9lUu6f4Q1vcnH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.20.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

The series substitutes "[PATCH v2 00/10] block/nbd: move connection code to separate file"
Supersedes: <20210408140827.332915-1-vsementsov@virtuozzo.com>
so it's called v3

block/nbd.c is overcomplicated. These series is a big refactoring, which
finally drops all the complications around drained sections and context
switching, including abuse of bs->in_flight counter.

Also, at the end of the series we don't cancel reconnect on drained
sections (and don't cancel requests waiting for reconnect on drained
section begin), which fixes a problem reported by Roman.

The series is also available at tag up-nbd-client-connection-v3 in
git https://src.openvz.org/scm/~vsementsov/qemu.git 

v3:
Changes in first part of the series (main thing is not using refcnt, but instead (modified) Roman's patch):

01-04: new
05: add Roman's r-b
06: new
07: now, new aio_co_schedule(NULL, thr->wait_co) is used
08: reworked, we now need also bool detached, as we don't have refcnt
09,10: add Roman's r-b
11: rebased, don't modify nbd_free_connect_thread() name at this point
12: add Roman's r-b
13: new
14: rebased

Other patches are new.

Roman Kagan (2):
  block/nbd: fix channel object leak
  block/nbd: ensure ->connection_thread is always valid

Vladimir Sementsov-Ogievskiy (31):
  block/nbd: fix how state is cleared on nbd_open() failure paths
  block/nbd: nbd_client_handshake(): fix leak of s->ioc
  block/nbd: BDRVNBDState: drop unused connect_err and connect_status
  util/async: aio_co_schedule(): support reschedule in same ctx
  block/nbd: simplify waking of nbd_co_establish_connection()
  block/nbd: drop thr->state
  block/nbd: bs-independent interface for nbd_co_establish_connection()
  block/nbd: make nbd_co_establish_connection_cancel() bs-independent
  block/nbd: rename NBDConnectThread to NBDClientConnection
  block/nbd: introduce nbd_client_connection_new()
  block/nbd: introduce nbd_client_connection_release()
  nbd: move connection code from block/nbd to nbd/client-connection
  nbd/client-connection: use QEMU_LOCK_GUARD
  nbd/client-connection: add possibility of negotiation
  nbd/client-connection: implement connection retry
  nbd/client-connection: shutdown connection on release
  block/nbd: split nbd_handle_updated_info out of nbd_client_handshake()
  block/nbd: use negotiation of NBDClientConnection
  qemu-socket: pass monitor link to socket_get_fd directly
  block/nbd: pass monitor directly to connection thread
  block/nbd: nbd_teardown_connection() don't touch s->sioc
  block/nbd: drop BDRVNBDState::sioc
  nbd/client-connection: return only one io channel
  block-coroutine-wrapper: allow non bdrv_ prefix
  block/nbd: split nbd_co_do_establish_connection out of
    nbd_reconnect_attempt
  nbd/client-connection: do qio_channel_set_delay(false)
  nbd/client-connection: add option for non-blocking connection attempt
  block/nbd: reuse nbd_co_do_establish_connection() in nbd_open()
  block/nbd: add nbd_clinent_connected() helper
  block/nbd: safer transition to receiving request
  block/nbd: drop connection_co

 block/coroutines.h                 |   6 +
 include/block/aio.h                |   2 +-
 include/block/nbd.h                |  19 +
 include/io/channel-socket.h        |  20 +
 include/qemu/sockets.h             |   2 +-
 block/nbd.c                        | 908 +++++++----------------------
 io/channel-socket.c                |  17 +-
 nbd/client-connection.c            | 364 ++++++++++++
 nbd/client.c                       |   2 -
 tests/unit/test-util-sockets.c     |  16 +-
 util/async.c                       |   8 +
 util/qemu-sockets.c                |  10 +-
 nbd/meson.build                    |   1 +
 scripts/block-coroutine-wrapper.py |   7 +-
 14 files changed, 666 insertions(+), 716 deletions(-)
 create mode 100644 nbd/client-connection.c

-- 
2.29.2


