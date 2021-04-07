Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EE4356A38
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:49:24 +0200 (CEST)
Received: from localhost ([::1]:52228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5kS-0006v9-05
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iA-0005HI-Mn; Wed, 07 Apr 2021 06:47:02 -0400
Received: from mail-vi1eur05on2103.outbound.protection.outlook.com
 ([40.107.21.103]:59841 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5i7-0001Lp-Iw; Wed, 07 Apr 2021 06:47:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xn5ng5x48lMdk5EGC3yJ+RfKN7HSaYI1nJE3v83SuHNXz7a9NleRK9thaMzYmBnMxCFS4iBsaL7JU7MoE2XXo7hQ2ulnPuBmzy/aYaY6Zzes7Z5j+wG57w5h/VjBE5DhMGql5Y90Sr9OTz4POCGXcMgcuGlbTSkzR/QNk5iVISiEcnUNCRRj79b9tswBuTbxSEqgBXH+nfhgmHGJAgdDvXZUvX+DhW2KPLyUMEEVH9MOrmZ+kr0m7aqPaEPPPsuVWjHO+S4S3ObXQJrPWZDTFnxhj7uEJ4VRPOXvMCi6vv1vOYnRjh/FZc00KY7nbrM7q6vZ8hRBhPOyIAJ6mZ1flA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPGvt5xlYnV97TH5vUO9DmcVbNdtop0b2HSnPkZnJzU=;
 b=QKuFHxT2lBtvhcDRA/11EDBrNbxUPakGKiJvXC90d4KzZRxJ778piXwca8g56LK6dncP/+a8aSQpJn63+FQvPVktVwQyibM1u9fKdB5pmAHWld/EF+zdIWFKIT7/mi0qn7vev7y6N1tk9g+ZIhvRz8u6XFrJ9H+0hRVgb4wc3LdgZvFZ7FfnqBzrmRo8CHoPD0upS/YDsqMVi68UPMAAICWzIpWWIeCrxAAeogn5bbgd0yie4xjYHjJQrE2G0Fd0qGLaCnlEP9ibKX/StaqW6nmhJMMER28ei/vI+YgaQKpGVXExwbtUC3h/bJyx0UyyIMvE2V9g2kBPwIc0Ym1sRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPGvt5xlYnV97TH5vUO9DmcVbNdtop0b2HSnPkZnJzU=;
 b=pcwpcvzwsCYlIad40sFsYXHovsqYp/E40iHVWkJsUAqtlvlqe4zDejPejwoEgn1E/HyGQkMziqDEYYBUrV/oT6UqIx2Z2C6Ch+qhBBI1nb3BZjXk/BI3iYaxinsnv4gLVMfANANeuu1YRK6TPVelc4rybXqFxkg5vt5h6jzebq4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 10:46:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:46:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 00/14] nbd: move reconnect-thread to separate file
Date: Wed,  7 Apr 2021 13:46:23 +0300
Message-Id: <20210407104637.36033-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:3:e5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:46:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f9f6c17-ed08-4040-92e7-08d8f9b27682
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376DC2ECAC7FE88E3D30F09C1759@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FY3cnnYAdS3g48Yu1kSEsbqWpQK15dYn38Q869eSVUCIUmM7molIRuq1utwWsULoPOPtietUF8JkIr4D+ReeO69K1wvSp46nv0pS+dV3RUXmySCfRZ/nlQIwdofI+kd0Auia4tccETYLbJZCS0mFcGCoVOd0GJKAAoB/EmWZrlJsbRIk1zx50t+WIqpFBwfO1Z+pnrnl2N6l7UgpjSGVqV5eERs4uYuMkoNDhhCDB3z5EGOcF3eGgeX9ntHRl6CogzAZ1uB0tute/YpXmrzCfag0M/1PvbLuXwm07Mz9NnD3TTKyz5IN8wwBuhfI88NOCNlT3c9wRtU4GncHgBpgloMcEMAzxfp/Rsy5AJexkJ23Fh1dBJc0zaueayHZevS+LtceHuaEEsJ3tCkWLvIyNqneEgvVinR/kdCPWNg6y4waTAF7/Kukiiphj1+9gmcl33cpCwP64SLnCxKPhZKjfrWd9m4JERnxLltHqmo19/QPfvaBQyoB9X3awoKCenOYMGjl4w4n3YX0Sx2jSt0/iMExdSM7TypQkWBWzJRaA6GB9rz7HTniIMEPiMpjbqfAsMHcVaSPZFGAwJ+rRibq4fTP6eH0a7SF8F/0ZoxjHavU+fjKvPCNmo3m6oBMxbwOdN7CPZj0G3cKwH8MTR95KyXss0i030JGMQOJGDrV5K3wYkGiou8XrruZeyVZdWAgDAxpH/pBYZbfzSq+9Wb/eUiXCz3de5+8odxI7yci5jo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(376002)(396003)(346002)(107886003)(69590400012)(83380400001)(6506007)(6666004)(66946007)(6512007)(38350700001)(8936002)(6916009)(316002)(16526019)(4326008)(186003)(8676002)(52116002)(956004)(26005)(5660300002)(38100700001)(6486002)(2616005)(36756003)(66556008)(66476007)(86362001)(2906002)(478600001)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ic8r01cAuKu1z4wfcwzu805RzVkk/nOVjaIzKpVzIfRaLFfKEz99GdJZMyI5?=
 =?us-ascii?Q?elXQefbF+TLSJtxHNTzto5CKHSMSRscTLvs8LZzcOxFPBfJ8sTur9T0k6q1G?=
 =?us-ascii?Q?csP2Kfwww9rmwV9UIxSHhL4Wu8uq1fyMii5/iY6FpdhcoaBOnIuiUSqIjGgk?=
 =?us-ascii?Q?1F5HdCS3HPiCx7mw+AZOWY7/bblS7fjd4YwdlbaIkDKZfcdrayputS4KAVCv?=
 =?us-ascii?Q?TjAEi7gH4MXx1kCmUOTFSUkOzYNosvTtrYcjSES+Dh7dkiVvj1U09/kOw5oi?=
 =?us-ascii?Q?OyJycwyeEbOia7Kg1kCbglb3QYvBqvuJhd6A0slPRsM4ZPASyJWUF25XdFXO?=
 =?us-ascii?Q?DsYEgUQ7JAIJYlbXI2Ov2WCUX9EqmfwNT/IJ1YYE6KaZ+FDXmcgqMsOuD3LR?=
 =?us-ascii?Q?45J2c1AdC05B96rblt6Xsl9cIN46cblPioI2p2VMicvlelT5eLOId+0XoZaZ?=
 =?us-ascii?Q?UNIFWmJgtteZCbbWc7FHDFnueb1FTaeZj2GzULchQep3q5uvJEULhfn4sGlW?=
 =?us-ascii?Q?6eS3qbtjG7Q9VNnjIIz5sv32nm1j05JHr8c1eprReSe8xFIpGU+uWKzO6icm?=
 =?us-ascii?Q?xkXhAb+MA8pEqCdv3fyzBCzU0mstL0E87HYvr4Ef5nSP5qqRoYfj6tSkejrd?=
 =?us-ascii?Q?TmVFW1Zi9zAH1s8Yr+bMtM5/Q5wRfFeaJBtyxuVuwYp2VLslm/pQlISF8wco?=
 =?us-ascii?Q?mbQdMYbPZw/LAEPS67eHY8dA+r3rBMkTE9pP9IdrsNYqnUZ6yfN9ZUNn1AGq?=
 =?us-ascii?Q?EKYnGHu/CQw571zKD3f9NGDUjGOiBSHSBEGMR/5/rn8m0EwcyrPnEPXIqsnm?=
 =?us-ascii?Q?svqTOLNu4LI3QLg0WIc11MzTOcakrO4t0OpisgytC1WWzE52tevWKOEtaFDn?=
 =?us-ascii?Q?CNqMoSjX5gHfmawWGkC0RrGSXuZpkBJDHxf9hqR9kOX5w/sXYfQL+2v8k3QW?=
 =?us-ascii?Q?RxFFcPlOjW0/RWnb6ERKVGML/ysG49RVyDiTWQwhg+zm5lrw80mVmFwlENAr?=
 =?us-ascii?Q?7e7GutZeZ9pJLRMN2NCMn9dKGNm9iI4srVr/dx4TvM6/OHMyvjzLY1JQJeVV?=
 =?us-ascii?Q?NeaStiacmJ+Zhm7zAgs12RyoqvlsnAAqZYKK41hMMrX9NXOE3wfOzx8R5l9n?=
 =?us-ascii?Q?ee9wL9f0uibcy83PFFsGuaMb12C1XxGuUIxgnaN3X8YZcrp1oJM8FpU7iuad?=
 =?us-ascii?Q?bKxSvHiJ05Ctzq5UKIVOahEVeQ6dtoQ6YopINdSOWpHfRjbCU7OYgsarg3K4?=
 =?us-ascii?Q?9jjMn77/bfPWKTIqBuwrfXzB7V6BT1JUJHFBlAHOzhW1zblTSZO2n9RjE5VO?=
 =?us-ascii?Q?HeO3dCBpYE+QagWCYqaSuH4o?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9f6c17-ed08-4040-92e7-08d8f9b27682
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:46:56.2311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2UKd+crWfsSgF82ZU18FQfSu0Rwi6vaBCwqtGVc1hnuJ6sZnLjh7ZW3Tt3X4v4GZiA2ZLEKP5EIOpCPXMveRg5A4yBpCHjS8ao+yQPhU7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.21.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Hi all!

There are problems with nbd driver:

 - nbd reconnect is cancelled on drain, which is bad as Roman describes
   in his "[PATCH 0/7] block/nbd: decouple reconnect from drain"
 - nbd driver is too complicated around drained sections and aio context
   switch. It's nearly impossible to follow all the logic, including
   abuse of bs->in_flight, which is temporary decreased in some places
   (like nbd_read_eof()). Additional reconnect thread and two different
   state machines (we have BDRVNBDState::state and
   BDRVNBDState::connect_thread->state) doesn't make things simpler :)

So, I have a plan:

1. Move nbd negotiation to connect_thread

2. Do receive NBD replies in request coroutines, not in connection_co
  
   At this point we can drop connection_co, and when we don't have
   endless running coroutine, NBD driver becomes a usual block driver,
   and we can drop abuse of bs->in_flight, and probably drop most of
   complicated logic around drained section and aio context switch in
   nbd driver.

3. Still, as Roman describes, with [2] we loose a possibility to
   reconnect immediately when connection breaks (with current code we
   have endless read in reconnect_co, but actually for this to work
   keep-alive should be setup correctly). So, we'll need to reinvent it,
   checking connection periodically by timeout, with help of getsockopt
   or just sending a kind of PING request (zero-length READ or something
   like this).

And this series a kind of preparation. The main point of it is moving
connect-thread to a separate file.

This series may crash on iotest 277. So, it's based on corresponding
fix: "[PATCH 1/7] block/nbd: avoid touching freed connect_thread":

Based-on: <20210315060611.2989049-2-rvkagan@yandex-team.ru>

Vladimir Sementsov-Ogievskiy (14):
  block/nbd: BDRVNBDState: drop unused connect_err
  block/nbd: nbd_co_establish_connection(): drop unused errp
  block/nbd: drop unused NBDConnectThread::err field
  block/nbd: split connect_thread_cb() out of connect_thread_func()
  block/nbd: rename NBDConnectThread to NBDConnectCB
  block/nbd: further segregation of connect-thread
  block/nbd: drop nbd_free_connect_thread()
  block/nbd: move nbd connect-thread to nbd/client-connect.c
  block/nbd: NBDConnectCB: drop bh_* fields
  block/nbd: move wait_connect field under mutex protection
  block/nbd: refactor connect_bh()
  block/nbd: refactor nbd_co_establish_connection
  block/nbd: nbd_co_establish_connection_cancel(): rename wake to
    do_wake
  block/nbd: drop thr->state

 include/block/nbd.h  |   6 +
 block/nbd.c          | 266 ++++++++++++++-----------------------------
 nbd/client-connect.c |  72 ++++++++++++
 nbd/meson.build      |   1 +
 4 files changed, 162 insertions(+), 183 deletions(-)
 create mode 100644 nbd/client-connect.c

-- 
2.29.2


