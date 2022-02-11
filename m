Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90A94B2780
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 15:03:34 +0100 (CET)
Received: from localhost ([::1]:38570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWWL-0001D5-Uo
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 09:03:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVtA-0000bL-BP; Fri, 11 Feb 2022 08:23:06 -0500
Received: from [2a01:111:f400:fe1e::71c] (port=25931
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVt6-0008IF-SD; Fri, 11 Feb 2022 08:23:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7tIqml7lgsZmcmGoW0cuzrYYq8L7DAWBDrxlQLRlcujiga+rtlyPvhADCXyUuqshUTSIut7StWHYesIydpMTCwiLgmRXrIp9K9+4kBGepzTfxbdC4x5+Eo0C7yT6yjCmdXxd5xxTnQEYk4Xv6W7hhhwkh7dcoBWxEEF7W6ZP2XJpHnEUevSPuJH+zxlhWIIT8hr0O/Dh0eoLeVlzcyUKaontkYkbrAPycm8gzfq9NS1SDHYebdY4+QkkQVvEECH8JudFHf9yuV19IM32rjlN9h60B4qM1AuRkefUDrRk/MydEoBrMieDzpseYSxQOusQ5sxlf/688//tLsNXYyJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0US65Qe/Fsnkm0uOLTc6MQTkPaMMeKWAlGCAp8VUMA=;
 b=hiMzi0dp82rdSBoNI0o/pOa0DP+I2JM17i1tC1ctJ8yfS8lCprv1Ni4rHSA/OU1ATg+54AwETUxbvyZgKSKsC3jkuK5oanh+G5e/6hQqPH5N7zZb5t4t3mRG4WoXkFWUS92IL3/TuIH3HpVdO/D0ZTVdZPlXW9LXQXpuG21msiAtE4F4f0fMqWnR0SdGpscx1q1sUzxi7LWEx0/f0ZtV9JWvvaGRz4sByS0YJKU0nkhay5sGA2exlurVIvUx1m6IpUi+RjalECFmqK8bMeHCsbl7nrfjGmt44rBWF1qHvYsBqO+BEFazn98aN7x9DpZQ4GQDmAN3Zx2qk9N7b+3S1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0US65Qe/Fsnkm0uOLTc6MQTkPaMMeKWAlGCAp8VUMA=;
 b=uVdwNr5fDwCw0hxqa5Ia2X0R/qVhD8jN4pvIus3i08LWZAliMA7J6q4Ud9XF4A5e2juTiRdSVFJOPw9vmEwlSC0yi48PVhb3PXW4mgZmefjw9idgDccZIpQveQzMk41nM9rKN9NuumsEhWUnNQwzaxSQsHb9tD29tlOIuFYeL+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3865.eurprd08.prod.outlook.com (2603:10a6:10:74::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 13:22:52 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 13:22:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL v2 3/7] block/nbd: Assert there are no timers when closed
Date: Fri, 11 Feb 2022 14:22:36 +0100
Message-Id: <20220211132240.781958-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220211132240.781958-1-vsementsov@virtuozzo.com>
References: <20220211132240.781958-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0601CA0048.eurprd06.prod.outlook.com
 (2603:10a6:203:68::34) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d14c226-8b06-4364-f394-08d9ed619b26
X-MS-TrafficTypeDiagnostic: DB7PR08MB3865:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3865225EB2E2D3FC7A264FAEC1309@DB7PR08MB3865.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:191;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uzi0Xf57CN1pRb7CxrADGCpdnI5/0gbMb3nxhhLt3si/UhHEg83rGPnJjENQdNG+STMsQZg7t9JPKuk0rCVMlyw4XWL24KfBdVEfXed1db1R8F+vMbixEybHEQdQ416Ku9g0YIc8OB+UHuECa8SZ5sxbrR2AeIVaehyYBUS15U8RKMmLZVsRgUcmDU6pa7DtCjg/Hq8PfWa63RyDIFwENqPZRFWS7Fp4zvlBAZusgHd1LR+GCwRRNIw88qxqqE4a202/I7vGZxamuRqiGH+vs6CJWRassFha7lrpyKG7Hb6YhsL966ubB4hXuAtZLkOCU3Sibqdo1U3p7TVS2Gv1p0WBldSkpDKH1NZ69lO0lUiIsk5VYXZZwYW8rARnx7ddFUwtMJc7Ali0KcQhJfGrs4XS8tkOQdQt8aLBkbUb9XKQU6FChDoAXDGdECcQAmxoCagkXDnQWlOFkYGJ2xw1xscZ60NuP/hr1bTzmR0filrA2a+b5KX5OuR3rZcInXmRv4TYcGJuO6cezLY/Ujwq+P//4ZDB2OkhB3buNTZgOns5tj3AE8pvRCEp3gG3CxBx1oZBHJaTb7Je7jA1EC44j/mtxgkxLLwt3zrZp0uu75w4qFM4KDJUlPleeR3hEfGQFU3DGbD1SNiglHVvNp3xptVDLjTy6+L2qFVo1qUGRppVBXu5AmyrxsuSJR2PEuz/Sw0CnAcnDixuYYyxrmHjCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6916009)(2906002)(38100700002)(86362001)(508600001)(38350700002)(6486002)(36756003)(83380400001)(52116002)(186003)(26005)(5660300002)(6666004)(1076003)(8936002)(4326008)(6506007)(8676002)(66946007)(66556008)(6512007)(2616005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VJ44APOF1Ilk6ByM5q5Ty8V0g1u9xZulEgbTBMC060nkvLV2jSOPIMywlIdH?=
 =?us-ascii?Q?iS/ITelUb7Jbg3Y7n/ljfWBNZ7rQn1FrljnCtugN5Cl+m86uFZmoouLCFt08?=
 =?us-ascii?Q?8pQh6Uf4pMyYpoIhPtkoEvteyZDQe2uziTd9g5Al5XYGop1Y21fyMaISsIYI?=
 =?us-ascii?Q?KNNuaABb7g3piTyyR+lk6EjD+Pg78R0i46AT9f3AZGMr6McF6SUieigwC871?=
 =?us-ascii?Q?+bPxGQWhT6mWU6eTnqo4ed++wLlMEsrmX9xeQFNHAd7rCvET7vDbifUd4lIP?=
 =?us-ascii?Q?HRikK0Cs5cjwZ/i+u0eEUG1wQ/cVB0tqeoCuJxihAYmTmpH/ihtHnnBMXYBb?=
 =?us-ascii?Q?7eT4rAWqUwriBC7lZ4rLoBmFCkJr0/i/b9WdH1BKluACYfozhntHsrT3kghz?=
 =?us-ascii?Q?FO+Z6KJT4F1+MCmpdDYsCanQBolbc7ef/4M0TFQvzBpawg2saN5vePSrz6hG?=
 =?us-ascii?Q?dWl28QoYsACoZG+olckogyJ/BpI86AOvvHBRyrdRRxrhXRbAqXoS1ZJ0M2ND?=
 =?us-ascii?Q?yC5vStyM/V7G5ZqAgPe1CRUb9dDZ4QsxvzW2sli85fggZFfxvC3yQJhgH4R1?=
 =?us-ascii?Q?WhYAYksZS/yHIMJUe30CfW6OYEqmxDfpyU6sWkNMe8sxDnrTmwFc7Vbd85SU?=
 =?us-ascii?Q?7/CCZm6EwKxqkBl954GjAQwZcvPtAdquIyFBgCy/W1OULAB3SskG6Ml1Rqh4?=
 =?us-ascii?Q?KOunQllEm1vViWD+RGh9rSSfXQi8rVNvSlQQiDNYX+I26VESymCdmRC3ziSh?=
 =?us-ascii?Q?GCHaGG3GMB5VnjLUXcbiNkezfPe5+j/7pLi/DqLmtIBWdM7DZYn2C1oFEkW/?=
 =?us-ascii?Q?JxitDbt2mAhVDkQu/5vLrzUhq5EKMMeEJkTAEjmwzKAHD34oTi6J2lgSlE7Z?=
 =?us-ascii?Q?ZxorVd4dJU6fAuqxaQ3x54DbGbojJ6dtu9pEON9Fl/GGL6QttAp1QONrO0MJ?=
 =?us-ascii?Q?viPIDccnA4CGs6uj/T6ofJAoRc/6kGj6frV8fl5rK82hyP9QZCZXYu/lrHjD?=
 =?us-ascii?Q?j3U5i0gkUKELpjE/yQH1+B1vHwqjg7vYBv6ChGdumJEStLqHj4axQgGBHFVQ?=
 =?us-ascii?Q?Ggt0U5tmk+1deJZd7gajnl3WF162LTj68AELO+pKEgnOImJbKVvHn69f9lYL?=
 =?us-ascii?Q?Q4bqAz1uCMk4g8fhLdlfGwyIKFmqNXA85RaSPb9s/4dNhJlWp3lfLlAKqzo7?=
 =?us-ascii?Q?XUrVNSC/FEDGKwl+5UJXWFcNySIHwvp0QHuu0A15lnuEWuSRqn62RhRQ+mtq?=
 =?us-ascii?Q?YhAVv1OpqGDmuYPz8G4qNEAynPIyg+TQ2dYtmkYlvE6QFybgaCzIciJ4sjUQ?=
 =?us-ascii?Q?0lh3RmApLOh0NpxcBGk99H3UTLYIs6IRprIaFWTa26YX+5Rx20SL+SGTF9Cl?=
 =?us-ascii?Q?D4VQp3Mhre5R26JFyx/Hw8ummJit2j31Ca7qOt44xo1hjOPYLyKqz8Xfmg3b?=
 =?us-ascii?Q?0G1GzZaa+MU1GYW/dw3e6LHw/87/5cKMwT95Z6y9TQ3icR95XvoCWBA8OFjM?=
 =?us-ascii?Q?Bxx29TSYsHNUYFoRIMbY+mZgW04cgT/IQwaGI8NnyTL9jQPdWI9RnU9LmAM3?=
 =?us-ascii?Q?BlZ/jk5PLeLyNnxUzSS3iZ+PlC41bQHSumjhfvhssIoZPSrDa5cHTlmesrIY?=
 =?us-ascii?Q?pQ+UKQb5vyLDdsFEeP0Fp/UJTMhtCyAneotWb2YjyppIyWMhG6dJXAQ6ww47?=
 =?us-ascii?Q?aN0FZA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d14c226-8b06-4364-f394-08d9ed619b26
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 13:22:52.1517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZpnK8pa0iy4+i2L7Yd47u5zFljW0MKNorLywVJHBLuxuyxtIBosebnA9R7d7Uq0Y19QJYS1obgY9Q6L2e9eLQOcpSziWha41r6c4yYr0C8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3865
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe1e::71c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe1e::71c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Hanna Reitz <hreitz@redhat.com>

Our two timers must not remain armed beyond nbd_clear_bdrvstate(), or
they will access freed data when they fire.

This patch is separate from the patches that actually fix the issue
(HEAD^^ and HEAD^) so that you can run the associated regression iotest
(281) on a configuration that reproducibly exposes the bug.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 5ff8a57314..dc6c3f3bbc 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -110,6 +110,10 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
 
     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
 
+    /* Must not leave timers behind that would access freed data */
+    assert(!s->reconnect_delay_timer);
+    assert(!s->open_timer);
+
     object_unref(OBJECT(s->tlscreds));
     qapi_free_SocketAddress(s->saddr);
     s->saddr = NULL;
-- 
2.31.1


