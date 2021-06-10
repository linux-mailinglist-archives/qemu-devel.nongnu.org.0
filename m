Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3419C3A2934
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:18:28 +0200 (CEST)
Received: from localhost ([::1]:36408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHlb-0000Hu-4x
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcW-0005Kc-7K; Thu, 10 Jun 2021 06:09:04 -0400
Received: from mail-eopbgr50133.outbound.protection.outlook.com
 ([40.107.5.133]:23957 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcU-00051Z-8t; Thu, 10 Jun 2021 06:09:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYgXZ0tjfNpmaN9PyU8lbaIAtzcZNrXiglqcyxEBcCBvg/LNjaMbq+7hxEYWW1yo9/2LygV5Er8L/RnOzMUQMNdksogkHLPO3AtVS4kvqUjJxulZO/xsiy8enBvHn0mnTvgxy53Oph7+19yY5yJZYzV842ytrC68pY+RkY/2GYl9G35GSaDGL71mHVoR3Pvoz2X9+hs46+d3ZD6k9WgRCc2Z5BioVVf8APyzhEH7gMtrxMP8wL5aog6m/yEUbWm7JJfEA2MAd0jL5QLZsv3DpDRbAu/Yuj0tm7TGHsOgYigrHjIk6jnMBjNGzE5fEiPXPVUHV+FgGz+WMEmK0LxTng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qtL1Vqw5gCkHfoQob5NHNm3VCDQStHuKLQ8twf8Nv4=;
 b=l8iDeCEeq2zSZCDGKLTl7kisNKcG0OEwxYXkxs5DQxZXkf2IAV7koXrqMtN3r17WC3/Mt65a+XRrCaW+JZ2oh7wUcpwQvVgSeV6hdXBHsRu94E3iWaznadPktQyzquaSDsb1t8FHWxDj3VxxAkjK0yM9Uo1tczJj+8+ZzwGvSIpVESjlG9gq2ULaXsObsfmUM1zP9jNrFGbeS9ge3wvnL11UL16RG8TC8Hqvv5jC0i0UTaWZoN/pztTOaZxDkAeWvx/60Nlqx5ZoVjPl10heqGLSF0VmHb4laJksnXRgx3xjzmahyNv87yez2DpGUOy/dNBizx9D68r8/wZ7aXYw9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qtL1Vqw5gCkHfoQob5NHNm3VCDQStHuKLQ8twf8Nv4=;
 b=mo7Aw278SoFusr4f0GrGsYEhaSdijDuw4Qg/KysaYZNKuRmsTHeaAd28lK7bUqhdNoX9IqaDkUkoCj2MupHius7rzGOYEXfy7Lal9i97v/vH6RZVJjnJd4ZLtrsFM3n/2B0zswf1y7KOPpxAktklg7edc8G30WX1Jk+j0xskOas=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 10:08:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:08:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 Roman Kagan <rvkagan@yandex-team.ru>
Subject: [PATCH v4 09/32] block/nbd: BDRVNBDState: drop unused connect_err and
 connect_status
Date: Thu, 10 Jun 2021 13:07:39 +0300
Message-Id: <20210610100802.5888-10-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a623c725-b51d-4b50-3ce5-08d92bf7c1a7
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB65029A6B9C597DA35A05EDB8C1359@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:109;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bSKffn48QEV1VGx/pcfYV4cUy7W2nFvczaeyn8C5ngjXORIRq5rTBuES/uxZEg4DZeYQxlFW3O+/H7AfCPodzYK7KXczwcjHIhD4dZWsNOnj8CEouuRDzBAlKi4UkeAuAtUPu+uzfcZPF6ARXN3MnNH7JP7vKTncnBS+OvQJUn34Kwrv98lFqsge4+ZRPBj8JTOoIdcbyMz1bSkU84SNEgF/OYiNeISWRnDm7jFHvl3/QrcQ2LoBVkQJtcf4mTzu1BYdojS4V25+N4coTHal2/07eCoBOkfIGUnnY1gGVARpMvQVQ0Wy5NazPTetPO7eXddpbWT1JDzYpaC1E4DWkhS4cnT8342W48s17M1zlAdrXvAEJLyvNJ77GTrcId97UPTaIOeqqLCi3uFxzgsNo1nMjm247DeimSyOjArN2KcDW2dweXbWU2t/1VyRS8r3tC74cZ6ddJIt6TGoUpjNu1N5nqmf9dx/caoJ8icdCCA0gV1gDpBA41VZY6+SfXlx/Zmr/9R6/vB8fxuB0tJUzqVZWXJ0Owtjb2IFOf565joQslb6X543PrYOwUiK0YzHJv9HtrT6OgCGI+VI2A/4fIOTTvjNETTI2FZsorxHX4Onteg8GpSfvbMUSEIQcnfQArfYKTh7FhPR00pw86WM6jTIaAogzOP39uo6IN2PS8wIGRGJxHPNFVggJ6tCTjjC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(136003)(366004)(2616005)(956004)(6512007)(66556008)(2906002)(86362001)(52116002)(36756003)(6486002)(6916009)(478600001)(16526019)(66476007)(4326008)(186003)(8936002)(1076003)(8676002)(6506007)(26005)(66946007)(38100700002)(38350700002)(6666004)(316002)(5660300002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sybqOtRAa0tqFtcBJr14TwVDy1s4c+JnGM69kfPuxyuv4SNtBiv/oEJsftFp?=
 =?us-ascii?Q?E0cOJ+qCPsP0xkwXWGlIQOW52zLP0NbS4MXIjckPYDS+DbooVan+LaI/+K93?=
 =?us-ascii?Q?Iphxco4T0o+VF0hcaIUBK6wgFJIwgLqx+RJyjJdTNaCf58/ngh4F5AuKBCGH?=
 =?us-ascii?Q?4G+Px8o5zONQERT4Xr/P5xaMHT9wCqQ33WTmc3jhfdChc+FyhHH2uU9G0ivE?=
 =?us-ascii?Q?qgQyHItpFYHc7Fr5Ti6j8fs79DWAa+flq1Q4BksNfE3SGdTljJWLwgNr19OQ?=
 =?us-ascii?Q?vCLgpm8oRyFy15xxjycumznfIAQLiZ1hwi5RawNaPm6R7q4Bc9XbFJonvfjO?=
 =?us-ascii?Q?Ep56boD4+C31dhcQLnVdaWjs92edS/M21UJ1PNEd0BuOc/cDrxjgs2akhReT?=
 =?us-ascii?Q?PJ28ue/K9RWi15J9Ob2J9SkCoAK/wZweqsabfnckWEl2+Pb5bU684I5WIHta?=
 =?us-ascii?Q?y9y3CsxR4+ITy6kKFB80qE9y6Fc3d3bP97Fx8zHZoUdV+mS/v0EHSFdsb0D9?=
 =?us-ascii?Q?22FHylqkxNV69a0Jowg9y0onn15I3er/vMynpgaSW3MLGGAVLr8ibV31+zoT?=
 =?us-ascii?Q?rLoLeWYty5XyBa/inLL1NEYP5BAE3B8IzUTuxIajE4KhsvuR6aCibmTauQ9d?=
 =?us-ascii?Q?cXlbpmPxx0+BH9AjgBNlVZO3xGHBmCCWRTdtc18jqNndgZXrAhEtdZrIQEBQ?=
 =?us-ascii?Q?QWA3bw7HzdQMUVcYPNuXziFOrbYel/qCGaxQRpDgu1r6rgV8BXgHdZd09LIG?=
 =?us-ascii?Q?VTHiMvG09pYieOg1+A4f08O1I4x+cG92KPDPXRbcvnl6ubUKFujdHnnKAzaX?=
 =?us-ascii?Q?i8EdYU3z5RfVu2A1vPkNNdG9vToXZvz43f/i7jxISlkeWNM57NPJgpO0po3p?=
 =?us-ascii?Q?97oUzWoI6nJfg84iUjfFEuzAwaIM8XfCvAzB2kVgKUdE8EcZWss+LATQBgNs?=
 =?us-ascii?Q?Z9DStHG+ct7QYktR0XoqQ77EbOdkh+1kJTna1rWdAXu2xknJqLMtukJwDhrl?=
 =?us-ascii?Q?WXjGX5wgRhCi+JvGZ4Zk01wYyAf/ZXbbzykC3BYlZ5XysZJGV4OdFYu9OvYE?=
 =?us-ascii?Q?tmAd1bXrAcWUoHXymK3wlb5QUbV+wALmTF61pSXmBbTJJfT4PYm8vIz8v3p3?=
 =?us-ascii?Q?ci9hxyTl2CbtPAWazx8Hl120nZSkCFwFWpS/HOJ7ONKkYXhsFfdZuh26mWt5?=
 =?us-ascii?Q?XFRUkceeBIb0ps3DmqFjgrNzOH9tfC1NejpoXSVnjhB4ZXNtCNrQMlp2Qfrc?=
 =?us-ascii?Q?sYh1vLFo4esKxu/rlfYw5Ya+c/6H2Io5z9TXnrQevSk47/CUCra4HyGf1DGW?=
 =?us-ascii?Q?7tr9yHbgJIQioEpTEXN6okKy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a623c725-b51d-4b50-3ce5-08d92bf7c1a7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:08:55.6779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xvpfPM/L4isWZ+rTCgn/Xn3/xVnO9ykrYo8GzDDzP7u3AI4YWVjarXNQQluUgjaGaX+UVIS3HKCucLl/1f9BFpMCG1FZydwpq2tqn8EOps=
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

These fields are write-only. Drop them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 77b85ca471..fdfb1ff7a1 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -121,8 +121,6 @@ typedef struct BDRVNBDState {
     bool wait_drained_end;
     int in_flight;
     NBDClientState state;
-    int connect_status;
-    Error *connect_err;
     bool wait_in_flight;
 
     QEMUTimer *reconnect_delay_timer;
@@ -578,7 +576,6 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
-    Error *local_err = NULL;
 
     if (!nbd_client_connecting(s)) {
         return;
@@ -619,14 +616,14 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    if (nbd_co_establish_connection(s->bs, &local_err) < 0) {
+    if (nbd_co_establish_connection(s->bs, NULL) < 0) {
         ret = -ECONNREFUSED;
         goto out;
     }
 
     bdrv_dec_in_flight(s->bs);
 
-    ret = nbd_client_handshake(s->bs, &local_err);
+    ret = nbd_client_handshake(s->bs, NULL);
 
     if (s->drained) {
         s->wait_drained_end = true;
@@ -641,11 +638,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     bdrv_inc_in_flight(s->bs);
 
 out:
-    s->connect_status = ret;
-    error_free(s->connect_err);
-    s->connect_err = NULL;
-    error_propagate(&s->connect_err, local_err);
-
     if (ret >= 0) {
         /* successfully connected */
         s->state = NBD_CLIENT_CONNECTED;
-- 
2.29.2


