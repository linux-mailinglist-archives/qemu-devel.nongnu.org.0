Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9E361BA1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:37:19 +0200 (CEST)
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJyY-0001a5-Oe
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYh-0001yB-BY; Fri, 16 Apr 2021 04:10:39 -0400
Received: from mail-eopbgr20116.outbound.protection.outlook.com
 ([40.107.2.116]:15815 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYc-0008Dj-Lk; Fri, 16 Apr 2021 04:10:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPNQueY8B1YiIIuwuUBQFWmWC3pLFYG2CjR1XPb1Cmzk+twAh5GQDHXOkij80xLDMKeKPvQSKnGLvsBp0DAfOjjmKfOeKq8eK4KsPduux6VcM/fDdYnECHDb7A66J05THDxijOweOMWo5cR7N0AVsVj1tnaAvgZjVK7uqUFF4ep10PtgcUHWl8nLCzo+HmCaE+wMUSNkPc9zvxxpI7MswwuTQUm+waoJ1YChp+CmYGnFZrFOOKLlEgYE9UbFEhmNV/hLhE7HQcOQXYFhn3yYfjz5WreOKP3C8BySDPzUbEn8oFF4+nI0f0DZ2qHx0LrM+VgrOC18fdlHsSGKJ027yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=en60MHkSNYE2+W6o1iqgx2tZJOJ1p/0dj7QM/jN4HvU=;
 b=chcIoWxyjiNkhA59c8YNv8iZvvCGTcVXncRsO0FFZ+L2do1RrDGJTRzV8zcslmvv8L+/ZZQgrc78/OCo9Mceg5/SNu/q0vTvVLV8mWO0kDIj5YQ3Lv6ELUdh7pBUzXV8XULKmYo5DenFkh7lKPWQ0jJCnE82kLLk5tdQhL0JhZCuXh0NtK2pc2YCJNuIopmNkApgeFBF7CIEWOlNT+5LEZw7npFkRuajpgXMTBq8MhNM2igCdpvoyToKfvHKQ8Ue7kLCLWeB8BFYLy0yVkdQrrltqP+5oVOaNiC/mbF+o+4kPRgzrQdAl5pwTf6k0VUNev8+W6IH5A+WWH9j1bpw+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=en60MHkSNYE2+W6o1iqgx2tZJOJ1p/0dj7QM/jN4HvU=;
 b=MwVfQpE36yYLkd4qgzvxFB7hkeHYftUQ61LBeBGNzGc0g6iYC3CHrKtRmlofxFS3k7rqg0SCONJwOEa5dxny9R01rDkORCzq6vrRowNY9KLdrs681TW74IVJVCOmSp3G4wvjxw1Y0ldFCMfq8MUPRpnOhikJMA/iSgalwE7pqB8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 08:10:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:10:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 33/33] block/nbd: drop connection_co
Date: Fri, 16 Apr 2021 11:09:11 +0300
Message-Id: <20210416080911.83197-34-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:10:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d9952bf-43eb-4327-020f-08d900af0eea
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5909171A1C44C50D4A3E8038C14C9@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QHefNL7ocOWidMMdRS57VUHFLQ0n57GnqJtWB4lzrgdJBzvx4b1rbC3ExDdh0lTYIe7Owvmm2eLkLYW24wXxUUCaDqlccpUbnxMOOsl3HAngbv9Gge17+RMLorAsEcAZbIGHh1QA/EwogUT52jsXclQL9ELTbYwhYyFwWkmNY38wAdpnvB9WrfBikpUf+tMGsZPj94eiPcmMV+9FPHPuWMIGoArYPjOMQFf8WG0vVovWCsXYWFGssMVfLsuaMto6I6DgwHpf6oXsMwmjvFlNarWvy5vYFE3VEX8oylECmyr4W+HzkfiReCDXb4GZl7pconr0QiZQlqjvVSeZs9aqneUrExhExmk6pTtaiuWUu3EzfVHvAI2A37ngsQVsMY1X5viuQpSiG/HE5F+E4TKPsL4K3fmXMwScO5yza/BUxRSz8ILidhC5KEnpOOC3YolzyC9E/YlnB8ItFfyXe+W7FcivWYAEcd/s8POejtViUIQPEDnjggjKtdJBCxECttikfrgCzo9l3D/qxuec4PUELLLy8xNk4T5hLLmxLqHflfBnBoAPKg4PKtIMomrpja4NqGOmA3sRZXd3tBUkU/Ev4Bs6Xq/pjPBP1TPHfSJxpr1tRWkxEXA5e9nsjlsY/NS2jN/D/o29+jCnX4hcvVBbpe6kHgV/ADwsVQb/PzX9OQ5iOeSN0taf2f6gqwZX2cAw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39840400004)(86362001)(2616005)(66476007)(1076003)(956004)(52116002)(6486002)(107886003)(6506007)(4326008)(6512007)(16526019)(8676002)(8936002)(6916009)(66556008)(66946007)(186003)(69590400012)(30864003)(478600001)(5660300002)(83380400001)(36756003)(38100700002)(2906002)(26005)(38350700002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?U4iNxBSk/03x/h1qOrBtQPiYIpxaUqna5nvwMQ6Ju7m1fmiARJfu0KSURDcc?=
 =?us-ascii?Q?QkTPQpSzX17KUKInc7gHlEuu/FoORR4+TDPzGtvjFhKiKZ5N9gR9W/trJV4K?=
 =?us-ascii?Q?G1RLx0HllyQqZ5bRENGrbGeMJ39Q0FcX1qiyiww3/1dtTrdYrU/Ngta+sSVR?=
 =?us-ascii?Q?T8IKsV5t3w+CS6dPUE4ASFX4PGtsYG+1K1XenG2agtSEXTbswN0TI3pjITim?=
 =?us-ascii?Q?hsbaxQCvaCp+gKlLFbbgvDc+fgHGQ1c/oAs1tXPATtwp44hQibuH+jSvG43m?=
 =?us-ascii?Q?MfTKD2ak0FER4vDclBvc0f8YIZeai7e+eE69E55oN/z2JQirqIrlCmXQ65u4?=
 =?us-ascii?Q?P7NRBAqKBXhciZ0YJ2TJsh+4EOqhaexC2aVQsB3Tyhuc8ejILGTSj/giKPQK?=
 =?us-ascii?Q?zgjJ22ocyrLncZSTtxvR4R1rhTLdsfH39jIscmrozY7BV3DSqbZzEX1svlOg?=
 =?us-ascii?Q?xcQqKvTp8tMtPLhjVPg5RdYIyd+733T1zhkc1vfX7x9mAyuo91BL68HK34+C?=
 =?us-ascii?Q?uFfQNVn/kyc7tFc/fTI+b3t57BforQbR4Ek/8aKX4d/jHC6XJ0D3kDxj7Lns?=
 =?us-ascii?Q?p6kCzMonVKGBVIF8iRn5POTaaU0HUaqspuZC2jOhzxQE8/U5iqF6xRN8jlLs?=
 =?us-ascii?Q?FuF9CkigZ9HV9/8pwMYqNpI7ys0vvAz7leQirfJjd2a/2H7Ea/e3dOzVwt5s?=
 =?us-ascii?Q?zM+U0e9AHbke/FM7mWy0pPQZU+QdF+pOgyQqj4CuxgidI1JVYUCObyDd7VRo?=
 =?us-ascii?Q?WGTjCz/+F2MCgSlzjxFU9nOpQTBtDxp20xlaRAA1z/jyo8+ekSKAWqa8qCRX?=
 =?us-ascii?Q?Ti2DEk7Zkw3/o8I4zSM/94Okwfk1OTaeQgab5+FAl53bzK+X+o44/K3DC2XN?=
 =?us-ascii?Q?C018OjtwQSplkDueiD6bsuRJMCs+oYksHxEP3g11Y59eiepUHdzR3AvLfZXf?=
 =?us-ascii?Q?OPSbIw+90ljVnVslg6S3c4ldPTNZaVCY1cgD2fEpWhw7BdM5zkALINmKdFdV?=
 =?us-ascii?Q?B4cQDTGsHoY/LMiBbZzUArudEtmgKFWsV0GwnZEHsbqPx525InC/StBaLUOf?=
 =?us-ascii?Q?cVPrxKg7lyxpj/h3zfGBHvq6l1xltR2EHrbDAfCZs+7mUn0mt+8U6+y4gDdS?=
 =?us-ascii?Q?dDMLxGiSYxdgaWgEBM5b1qnDITcrARn99rchIcuK1mQ8SFm6LcTCp0JMPrFz?=
 =?us-ascii?Q?73hxQDzXugY+G6V7HrdFd9c4bBWreS3VG7SCieU81pUqBctA2/T5FAoA6CsW?=
 =?us-ascii?Q?Xe5Y95C8qchblw7+EYZiCPFRi7xs4G5Ijky09ImQrGKmpU02f7vtV4Cqu8pp?=
 =?us-ascii?Q?U16Nr2xN0s2msW9KACl8mpvD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9952bf-43eb-4327-020f-08d900af0eea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:10:12.1997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcJ4cpxgTVpHJJeozBFHvxiyKo8xzukSlO6SvBF1b9pfC//p4Zrtx/fxqiSu/rLWTc8+nspDMUV5xVP31aWe5HelFg82GaTTdXDcMN9dCMI=
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

OK, that's a big rewrite of the logic.

Pre-patch we have an always running coroutine - connection_co. It does
reply receiving and reconnecting. And it leads to a lot of difficult
and unobvious code around drained sections and context switch. We also
abuse bs->in_flight counter which is increased for connection_co and
temporary decreased in points where we want to allow drained section to
begin. One of these place is in another file: in nbd_read_eof() in
nbd/client.c.

We also cancel reconnect and requests waiting for reconnect on drained
begin which is not correct.

Let's finally drop this always running coroutine and go another way:

1. reconnect_attempt() goes to nbd_co_send_request and called under
   send_mutex

2. We do receive headers in request coroutine. But we also should
   dispatch replies for another pending requests. So,
   nbd_connection_entry() is turned into nbd_receive_replies(), which
   does reply dispatching until it receive another request headers, and
   returns when it receive the requested header.

3. All old staff around drained sections and context switch is dropped.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c  | 376 ++++++++++++++++-----------------------------------
 nbd/client.c |   2 -
 2 files changed, 119 insertions(+), 259 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 03391bb231..3a7b532790 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -59,7 +59,7 @@
 typedef struct {
     Coroutine *coroutine;
     uint64_t offset;        /* original offset of the request */
-    bool receiving;         /* waiting for connection_co? */
+    bool receiving; /* waiting in first yield of nbd_receive_replies() */
 } NBDClientRequest;
 
 typedef enum NBDClientState {
@@ -75,14 +75,10 @@ typedef struct BDRVNBDState {
 
     CoMutex send_mutex;
     CoQueue free_sema;
-    Coroutine *connection_co;
-    Coroutine *teardown_co;
-    QemuCoSleepState *connection_co_sleep_ns_state;
-    bool drained;
-    bool wait_drained_end;
+    Coroutine *receive_co;
+    Coroutine *in_flight_waiter;
     int in_flight;
     NBDClientState state;
-    bool wait_in_flight;
 
     QEMUTimer *reconnect_delay_timer;
 
@@ -131,33 +127,20 @@ static bool nbd_client_connected(BDRVNBDState *s)
 
 static void nbd_channel_error(BDRVNBDState *s, int ret)
 {
+    if (nbd_client_connected(s)) {
+        qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    }
+
     if (ret == -EIO) {
         if (nbd_client_connected(s)) {
             s->state = s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
                                             NBD_CLIENT_CONNECTING_NOWAIT;
         }
     } else {
-        if (nbd_client_connected(s)) {
-            qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
-        }
         s->state = NBD_CLIENT_QUIT;
     }
 }
 
-static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
-{
-    int i;
-
-    for (i = 0; i < MAX_NBD_REQUESTS; i++) {
-        NBDClientRequest *req = &s->requests[i];
-
-        if (req->coroutine && req->receiving) {
-            req->receiving = false;
-            aio_co_wake(req->coroutine);
-        }
-    }
-}
-
 static void reconnect_delay_timer_del(BDRVNBDState *s)
 {
     if (s->reconnect_delay_timer) {
@@ -194,117 +177,23 @@ static void reconnect_delay_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
     timer_mod(s->reconnect_delay_timer, expire_time_ns);
 }
 
-static void nbd_client_detach_aio_context(BlockDriverState *bs)
-{
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-
-    /* Timer is deleted in nbd_client_co_drain_begin() */
-    assert(!s->reconnect_delay_timer);
-    /*
-     * If reconnect is in progress we may have no ->ioc.  It will be
-     * re-instantiated in the proper aio context once the connection is
-     * reestablished.
-     */
-    if (s->ioc) {
-        qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
-    }
-}
-
-static void nbd_client_attach_aio_context_bh(void *opaque)
-{
-    BlockDriverState *bs = opaque;
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-
-    if (s->connection_co) {
-        /*
-         * The node is still drained, so we know the coroutine has yielded in
-         * nbd_read_eof(), the only place where bs->in_flight can reach 0, or
-         * it is entered for the first time. Both places are safe for entering
-         * the coroutine.
-         */
-        qemu_aio_coroutine_enter(bs->aio_context, s->connection_co);
-    }
-    bdrv_dec_in_flight(bs);
-}
-
-static void nbd_client_attach_aio_context(BlockDriverState *bs,
-                                          AioContext *new_context)
-{
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-
-    /*
-     * s->connection_co is either yielded from nbd_receive_reply or from
-     * nbd_co_reconnect_loop()
-     */
-    if (nbd_client_connected(s)) {
-        qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), new_context);
-    }
-
-    bdrv_inc_in_flight(bs);
-
-    /*
-     * Need to wait here for the BH to run because the BH must run while the
-     * node is still drained.
-     */
-    aio_wait_bh_oneshot(new_context, nbd_client_attach_aio_context_bh, bs);
-}
-
-static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
-{
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-
-    s->drained = true;
-    if (s->connection_co_sleep_ns_state) {
-        qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
-    }
-
-    nbd_co_establish_connection_cancel(s->conn);
-
-    reconnect_delay_timer_del(s);
-
-    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
-        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
-        qemu_co_queue_restart_all(&s->free_sema);
-    }
-}
-
-static void coroutine_fn nbd_client_co_drain_end(BlockDriverState *bs)
-{
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-
-    s->drained = false;
-    if (s->wait_drained_end) {
-        s->wait_drained_end = false;
-        aio_co_wake(s->connection_co);
-    }
-}
-
-
 static void nbd_teardown_connection(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
+    assert(!s->in_flight);
+    assert(!s->receive_co);
+
     if (s->ioc) {
         /* finish any pending coroutines */
         qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
+                                 nbd_yank, s->bs);
+        object_unref(OBJECT(s->ioc));
+        s->ioc = NULL;
     }
 
     s->state = NBD_CLIENT_QUIT;
-    if (s->connection_co) {
-        if (s->connection_co_sleep_ns_state) {
-            qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
-        }
-        nbd_co_establish_connection_cancel(s->conn);
-    }
-    if (qemu_in_coroutine()) {
-        s->teardown_co = qemu_coroutine_self();
-        /* connection_co resumes us when it terminates */
-        qemu_coroutine_yield();
-        s->teardown_co = NULL;
-    } else {
-        BDRV_POLL_WHILE(bs, s->connection_co);
-    }
-    assert(!s->connection_co);
 }
 
 static bool nbd_client_connecting(BDRVNBDState *s)
@@ -367,10 +256,11 @@ int nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int ret;
+    bool blocking = nbd_client_connecting_wait(s);
 
     assert(!s->ioc);
 
-    s->ioc = nbd_co_establish_connection(s->conn, &s->info, true, errp);
+    s->ioc = nbd_co_establish_connection(s->conn, &s->info, blocking, errp);
     if (!s->ioc) {
         return -ECONNREFUSED;
     }
@@ -404,6 +294,7 @@ int nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp)
     return 0;
 }
 
+/* called under s->send_mutex */
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     if (!nbd_client_connecting(s)) {
@@ -412,23 +303,29 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 
     /* Wait for completion of all in-flight requests */
 
-    qemu_co_mutex_lock(&s->send_mutex);
-
-    while (s->in_flight > 0) {
-        qemu_co_mutex_unlock(&s->send_mutex);
-        nbd_recv_coroutines_wake_all(s);
-        s->wait_in_flight = true;
+    if (s->in_flight) {
+        s->in_flight_waiter = qemu_coroutine_self();
         qemu_coroutine_yield();
-        s->wait_in_flight = false;
-        qemu_co_mutex_lock(&s->send_mutex);
+        assert(!s->in_flight_waiter);
+        assert(!s->in_flight);
     }
 
-    qemu_co_mutex_unlock(&s->send_mutex);
-
     if (!nbd_client_connecting(s)) {
         return;
     }
 
+    if (nbd_client_connecting_wait(s) && s->reconnect_delay &&
+        !s->reconnect_delay_timer)
+    {
+        /*
+         * It's first reconnect attempt after switching to
+         * NBD_CLIENT_CONNECTING_WAIT
+         */
+        reconnect_delay_timer_init(s,
+            qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
+            s->reconnect_delay * NANOSECONDS_PER_SECOND);
+    }
+
     /*
      * Now we are sure that nobody is accessing the channel, and no one will
      * try until we set the state to CONNECTED.
@@ -446,73 +343,34 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     nbd_co_do_establish_connection(s->bs, NULL);
 }
 
-static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
-{
-    uint64_t timeout = 1 * NANOSECONDS_PER_SECOND;
-    uint64_t max_timeout = 16 * NANOSECONDS_PER_SECOND;
-
-    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
-        reconnect_delay_timer_init(s, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
-                                   s->reconnect_delay * NANOSECONDS_PER_SECOND);
-    }
-
-    nbd_reconnect_attempt(s);
-
-    while (nbd_client_connecting(s)) {
-        if (s->drained) {
-            bdrv_dec_in_flight(s->bs);
-            s->wait_drained_end = true;
-            while (s->drained) {
-                /*
-                 * We may be entered once from nbd_client_attach_aio_context_bh
-                 * and then from nbd_client_co_drain_end. So here is a loop.
-                 */
-                qemu_coroutine_yield();
-            }
-            bdrv_inc_in_flight(s->bs);
-        } else {
-            qemu_co_sleep_ns_wakeable(QEMU_CLOCK_REALTIME, timeout,
-                                      &s->connection_co_sleep_ns_state);
-            if (s->drained) {
-                continue;
-            }
-            if (timeout < max_timeout) {
-                timeout *= 2;
-            }
-        }
-
-        nbd_reconnect_attempt(s);
-    }
-
-    reconnect_delay_timer_del(s);
-}
-
-static coroutine_fn void nbd_connection_entry(void *opaque)
+static coroutine_fn void nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
 {
-    BDRVNBDState *s = opaque;
     uint64_t i;
     int ret = 0;
     Error *local_err = NULL;
 
-    while (qatomic_load_acquire(&s->state) != NBD_CLIENT_QUIT) {
-        /*
-         * The NBD client can only really be considered idle when it has
-         * yielded from qio_channel_readv_all_eof(), waiting for data. This is
-         * the point where the additional scheduled coroutine entry happens
-         * after nbd_client_attach_aio_context().
-         *
-         * Therefore we keep an additional in_flight reference all the time and
-         * only drop it temporarily here.
-         */
+    i = HANDLE_TO_INDEX(s, handle);
+    if (s->receive_co) {
+        assert(s->receive_co != qemu_coroutine_self());
 
-        if (nbd_client_connecting(s)) {
-            nbd_co_reconnect_loop(s);
-        }
+        /* Another request coroutine is receiving now */
+        s->requests[i].receiving = true;
+        qemu_coroutine_yield();
+        assert(!s->requests[i].receiving);
 
-        if (!nbd_client_connected(s)) {
-            continue;
+        if (s->receive_co != qemu_coroutine_self()) {
+            /*
+             * We are either failed or done, caller uses nbd_client_connected()
+             * to distinguish.
+             */
+            return;
         }
+    }
+
+    assert(s->receive_co == 0 || s->receive_co == qemu_coroutine_self());
+    s->receive_co = qemu_coroutine_self();
 
+    while (nbd_client_connected(s)) {
         assert(s->reply.handle == 0);
         ret = nbd_receive_reply(s->bs, s->ioc, &s->reply, &local_err);
 
@@ -522,8 +380,21 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
             local_err = NULL;
         }
         if (ret <= 0) {
-            nbd_channel_error(s, ret ? ret : -EIO);
-            continue;
+            ret = ret ? ret : -EIO;
+            nbd_channel_error(s, ret);
+            goto out;
+        }
+
+        if (!nbd_client_connected(s)) {
+            ret = -EIO;
+            goto out;
+        }
+
+        i = HANDLE_TO_INDEX(s, s->reply.handle);
+
+        if (s->reply.handle == handle) {
+            ret = 0;
+            goto out;
         }
 
         /*
@@ -531,50 +402,49 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
          * handler acts as a synchronization point and ensures that only
          * one coroutine is called until the reply finishes.
          */
-        i = HANDLE_TO_INDEX(s, s->reply.handle);
         if (i >= MAX_NBD_REQUESTS ||
             !s->requests[i].coroutine ||
             !s->requests[i].receiving ||
             (nbd_reply_is_structured(&s->reply) && !s->info.structured_reply))
         {
             nbd_channel_error(s, -EINVAL);
-            continue;
+            ret = -EINVAL;
+            goto out;
         }
 
-        /*
-         * We're woken up again by the request itself.  Note that there
-         * is no race between yielding and reentering connection_co.  This
-         * is because:
-         *
-         * - if the request runs on the same AioContext, it is only
-         *   entered after we yield
-         *
-         * - if the request runs on a different AioContext, reentering
-         *   connection_co happens through a bottom half, which can only
-         *   run after we yield.
-         */
         s->requests[i].receiving = false;
         aio_co_wake(s->requests[i].coroutine);
         qemu_coroutine_yield();
     }
 
-    qemu_co_queue_restart_all(&s->free_sema);
-    nbd_recv_coroutines_wake_all(s);
-    bdrv_dec_in_flight(s->bs);
-
-    s->connection_co = NULL;
-    if (s->ioc) {
-        qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
-        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
-                                 nbd_yank, s->bs);
-        object_unref(OBJECT(s->ioc));
-        s->ioc = NULL;
-    }
+out:
+    if (ret < 0) {
+        s->receive_co = NULL;
+        for (i = 0; i < MAX_NBD_REQUESTS; i++) {
+            NBDClientRequest *req = &s->requests[i];
 
-    if (s->teardown_co) {
-        aio_co_wake(s->teardown_co);
+            if (req->coroutine && req->receiving) {
+                req->receiving = false;
+                aio_co_wake(req->coroutine);
+            }
+        }
+    } else {
+        /*
+         * If there are still some receiving request, it should become next
+         * "receive_co"
+         */
+        for (i = 0; i < MAX_NBD_REQUESTS; i++) {
+            NBDClientRequest *req = &s->requests[i];
+
+            if (req->coroutine && req->receiving) {
+                req->receiving = false;
+                s->receive_co = req->coroutine;
+                aio_co_wake(req->coroutine);
+                return;
+            }
+        }
+        s->receive_co = NULL;
     }
-    aio_wait_kick();
 }
 
 static int nbd_co_send_request(BlockDriverState *bs,
@@ -585,7 +455,15 @@ static int nbd_co_send_request(BlockDriverState *bs,
     int rc, i = -1;
 
     qemu_co_mutex_lock(&s->send_mutex);
-    while (s->in_flight == MAX_NBD_REQUESTS || nbd_client_connecting_wait(s)) {
+
+    nbd_reconnect_attempt(s);
+
+    if (!nbd_client_connected(s)) {
+        qemu_co_mutex_unlock(&s->send_mutex);
+        return -EIO;
+    }
+
+    while (s->in_flight == MAX_NBD_REQUESTS) {
         qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
     }
 
@@ -636,10 +514,10 @@ err:
             s->requests[i].coroutine = NULL;
             s->in_flight--;
         }
-        if (s->in_flight == 0 && s->wait_in_flight) {
-            aio_co_wake(s->connection_co);
-        } else {
-            qemu_co_queue_next(&s->free_sema);
+        if (s->in_flight == 0 && s->in_flight_waiter) {
+            Coroutine *co = s->in_flight_waiter;
+            s->in_flight_waiter = NULL;
+            aio_co_wake(co);
         }
     }
     qemu_co_mutex_unlock(&s->send_mutex);
@@ -938,9 +816,7 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     *request_ret = 0;
 
     /* Wait until we're woken up by nbd_connection_entry.  */
-    s->requests[i].receiving = true;
-    qemu_coroutine_yield();
-    assert(!s->requests[i].receiving);
+    nbd_receive_replies(s, handle);
     if (!nbd_client_connected(s)) {
         error_setg(errp, "Connection closed");
         return -EIO;
@@ -1033,13 +909,8 @@ static coroutine_fn int nbd_co_receive_one_chunk(
     }
     s->reply.handle = 0;
 
-    if (s->connection_co && !s->wait_in_flight) {
-        /*
-         * We must check s->wait_in_flight, because we may entered by
-         * nbd_recv_coroutines_wake_all(), in this case we should not
-         * wake connection_co here, it will woken by last request.
-         */
-        aio_co_wake(s->connection_co);
+    if (s->receive_co) {
+        aio_co_wake(s->receive_co);
     }
 
     return ret;
@@ -1151,8 +1022,10 @@ break_loop:
 
     qemu_co_mutex_lock(&s->send_mutex);
     s->in_flight--;
-    if (s->in_flight == 0 && s->wait_in_flight) {
-        aio_co_wake(s->connection_co);
+    if (s->in_flight == 0 && s->in_flight_waiter) {
+        Coroutine *co = s->in_flight_waiter;
+        s->in_flight_waiter = NULL;
+        aio_co_wake(co);
     } else {
         qemu_co_queue_next(&s->free_sema);
     }
@@ -1980,14 +1853,13 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
                                         monitor_cur());
 
     /* TODO: Configurable retry-until-timeout behaviour.*/
+    s->state = NBD_CLIENT_CONNECTING_WAIT;
     ret = nbd_do_establish_connection(bs, errp);
     if (ret < 0) {
         goto fail;
     }
 
-    s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
-    bdrv_inc_in_flight(bs);
-    aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
+    nbd_client_connection_enable_retry(s->conn);
 
     return 0;
 
@@ -2141,6 +2013,8 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
         qemu_co_queue_restart_all(&s->free_sema);
     }
+
+    nbd_co_establish_connection_cancel(s->conn);
 }
 
 static BlockDriver bdrv_nbd = {
@@ -2161,10 +2035,6 @@ static BlockDriver bdrv_nbd = {
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
     .bdrv_getlength             = nbd_getlength,
-    .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
-    .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
-    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
-    .bdrv_co_drain_end          = nbd_client_co_drain_end,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
@@ -2190,10 +2060,6 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
     .bdrv_getlength             = nbd_getlength,
-    .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
-    .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
-    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
-    .bdrv_co_drain_end          = nbd_client_co_drain_end,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
@@ -2219,10 +2085,6 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
     .bdrv_getlength             = nbd_getlength,
-    .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
-    .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
-    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
-    .bdrv_co_drain_end          = nbd_client_co_drain_end,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
diff --git a/nbd/client.c b/nbd/client.c
index 0c2db4bcba..30d5383cb1 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -1434,9 +1434,7 @@ nbd_read_eof(BlockDriverState *bs, QIOChannel *ioc, void *buffer, size_t size,
 
         len = qio_channel_readv(ioc, &iov, 1, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
-            bdrv_dec_in_flight(bs);
             qio_channel_yield(ioc, G_IO_IN);
-            bdrv_inc_in_flight(bs);
             continue;
         } else if (len < 0) {
             return -EIO;
-- 
2.29.2


