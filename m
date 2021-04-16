Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFEC361B47
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:25:38 +0200 (CEST)
Received: from localhost ([::1]:33672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJnF-00072i-My
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYO-0001jf-RT; Fri, 16 Apr 2021 04:10:17 -0400
Received: from mail-eopbgr20116.outbound.protection.outlook.com
 ([40.107.2.116]:15815 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYH-0008Dj-UW; Fri, 16 Apr 2021 04:10:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6WmF0wx+z9cw9i2/o61ZEnaxI7EjLdhR7YsEhH7BasRXnRiw/GVCHYSaym+y+lwxvd1HRIb4PVbH+prmRoNBiJy80CpWw8JIpLZvjSobd6tdiKwljYPiumRd9sYMiRX6uCA4xFSCSVfuXXcS8PG5vsPzVIcUWcVtiVI859SEHxlFD5Ih/zTcTN2qGC8UUiePH0axY795CmQg8pfPx4qPvkrr3qUMNmNaJAjUlL5oc3w1KpWqu54gP6hkEmX9kGH/S+ctbb4CW98bdTDrnJcX2UfWL/Ja080fq7g/x+99VvOKjWQqb+j8paRQxiI4Ktr1gRtnq9k6LAaE6Bi8xj0JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gd8kO89PN5zYxm5bj/esnR0KEElbCAwbgycBrAD3VJ8=;
 b=FrLxme5EGtTPbQntx7YaPzVjJl8dKt4Jw+32Simdi9HgdxUf9RoMBEX6RK0w0o4uwCuMW3jhBYrLMw0bkJ/WEDDcPTMgkUOXaXzB5QKTMDYvW/ND6ev4U27gx45dcQRk9tvynIRFirL+AW3usBEuPsI74qnbIbCh68RosBptVXCQM2svRx++cf41XB9cnDfM2CfSv2lZ3rYo5CZ8N58SwN/KdI9pxQ/IlQySPdBBbbKcbqQNNjpaPymlzfpsvgeNLPDW3MwlFPdy7CTSiXyZ5GH5vV/0Aif4vGEPWLI1QeJVD/kIZkB4b+DwEawfgSw9zy2Pekm93tL+s0OlMh6UfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gd8kO89PN5zYxm5bj/esnR0KEElbCAwbgycBrAD3VJ8=;
 b=Vt+d6Z32LFEFMXyExpLKsH2B180DflcPMjSIQQrYCqsCqxJFdHpFRF+bRKfTwbcs0pNCdAogLVJgfPUKfOd/UV6pvXizXknYA1x9L/O0gbqOBbgQOAo+pjQjltcC4AYLN0jKPEAJ/WTfzftDswQOTTH9SCxSPf8KcLmZsLoDkJY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 08:10:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:10:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 28/33] nbd/client-connection: do
 qio_channel_set_delay(false)
Date: Fri, 16 Apr 2021 11:09:06 +0300
Message-Id: <20210416080911.83197-29-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:10:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fea339c2-170e-4ee2-b742-08d900af0ada
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59099CB37F081B77F259ACE1C14C9@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UYBBVcjBKYxYqF5Wc9+3bGi5emqFfENsD070UyksXn/kh8ONp9YHKTQs6fGcdfoIapNk/gOecIlL1/yV7HIBSy8kwvmf6FmW0iMlDJtaWvts2Nzf+ARP5K2gikvMRQyCiwkEg7d4qv+JMJHu589eIIyRWkT/eCLqQV73MGgIOG+LzdBCjWs5+JC+Cvih0WoH+Sm9Bipton0sJf42/vdsYnnNasXmsg0Pf120B0x1bNOl88XYx27VjGek1T2X+zxqr+f2oylRKiEe7z25zLINn9cDI6fDKyKlTpPvRBKNMl4TvUqV3kqw4gBDzpIrUzvtBaahUzTLT9AFpvaynUhCtMEVsxspjl1fR9qpaEMNgfypmegywDcEpE0JNmEW7BwiBV6NumDAlk4FhSxbawspp2f844Ep2gnRN2VH/ncrF/n4yJnuBrKXoI8+A2dCxkwnnST6P1oiRkIMBsJsU+iLlM1kGlDX+G1PFjeAUEpIqThUPFoKZ4jJXyW2wF0UaiqnIoTQYBpiJafiIkZSu0Ne6KVuj/zfoGNqhYvo/e5c/Q6HYAlk+64E9jey2D7S3YhUq6hK+DFAvxTg9Lu+4mvpFbe3hOlylBsjIIXxsRq5BsJrZ4okD2Yy5KOSpZrxtz26XTkKwLLZFEyXNQWwzPjSJzdCwyfBM5E/kXEXm9rk+2lB2gjuv0T+C0U7gA+WOkMg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39840400004)(86362001)(2616005)(66476007)(1076003)(956004)(52116002)(6486002)(107886003)(6506007)(4326008)(6512007)(16526019)(8676002)(8936002)(6916009)(66556008)(66946007)(186003)(69590400012)(478600001)(5660300002)(83380400001)(36756003)(38100700002)(2906002)(26005)(38350700002)(4744005)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zdm2QgoNCHTIgXCPfQNJnGtbfISNMHlgTsdq/xFtJti9elv11xJRoVU+hjMR?=
 =?us-ascii?Q?1Stv4EYjCwmVBp03y55ALv+1YB9Ta/8bJ+Oy0O/y1gv/8q0qGcA0Z/BFydIM?=
 =?us-ascii?Q?pYPsHaaiHu4xDYoTStMisI2XBO9hRTHPUta8TOYB999tCEiYZEo/A7ctLGrE?=
 =?us-ascii?Q?kWjMZ5b8K4Z7G7jfPJ4BfgwqhXdcu9+PZi9Vk0mO3idYKtt4jYoLYqEMJg2r?=
 =?us-ascii?Q?aYbQjJSPdxG1mlw0Va5TmshHKsSTOyXIS9nUyvHGP/PPNEGTiIuTWK+SWQv8?=
 =?us-ascii?Q?4TiigrZsk3DuoPEO7HH8Ta+iJaCBDGYYTaagSDdMgiKhWbL0PMZdJkZX6yUi?=
 =?us-ascii?Q?3uc6ZWU2YhpPjMwB8QcXYoaeW+ssw9ZbZ5QEAp5ggjpRSVQUpcSPv0eOjgng?=
 =?us-ascii?Q?uatitkaq7DVvR10PNCqFX2Upp6sDuu98BE4WKwvuuFFIsXXlkB1fyCYePK16?=
 =?us-ascii?Q?Ab+wfivY/M1XXTfoksdOK4mVF2Nbk5QvtPeSI5a5uWFFcOBSHWVaa8nibxSj?=
 =?us-ascii?Q?EPRKAjttr9t0+KXgcM9wWm2PXLictMIz16ekafHjsrgkp7IFWzDwAXTbnwZo?=
 =?us-ascii?Q?cIUQXHwPlkbO+x0wAAjW/NjDlxvMcvBa7gvyvuUQ9ymoaM+2PpWYPnEdp7Ed?=
 =?us-ascii?Q?7LtOBm57ihRkblbKc4Vh3QlmzUPgRVVAg6hlQNkbH6tIXPSeH4kkLjuMLwFs?=
 =?us-ascii?Q?kLRkzsPUufwoqMmm7dunehWUBS6P82HiRynLlyzLpar5u4QBGaw9EEyNLkM9?=
 =?us-ascii?Q?R1IwpvzRnb9I+f478lN5smGrX7tTByIWrvrmK5JLL3jaf7WayExAFFvgTzw1?=
 =?us-ascii?Q?vDk9LoNsgJ3YaffQzwbK58Hx1q7wSec5sFDJBtrd7+8nQ9EkA3qc5hvgDPd9?=
 =?us-ascii?Q?2nr+dVg9p/Bia1eCsg9njsuFv9izbKzyMdRBTEgnqSUTdXCYgbNeYxF7EAli?=
 =?us-ascii?Q?F4Z0WoRiLM9oAB91YEDK81bJbINbs6vy+QOXnv7rJ6Yd/Le6V3wTSAtycF8E?=
 =?us-ascii?Q?JvOznKuSTp6lrYjWtfNRxy3F2C45R3xqNHsy7A5LH90Dm8lexLX2dFqp+yRL?=
 =?us-ascii?Q?URtNWQkNSRHud7JORCvJgpDUBngTnhwDaMGT/c5J7I8rnrnJF94RzpO5afgG?=
 =?us-ascii?Q?kDCnBwPNHfi3mRZyXCasl4woyY5cgRrxykLaB+8T8SRgsLwByywe6joe2lHo?=
 =?us-ascii?Q?QB7A6zRujDkgFn/4gaTul+bC1YrHlLGI38HTJO972Xsb0MsTTC/dHBj7htx2?=
 =?us-ascii?Q?G8lGrahQeCvO3tPdITyvPrGHkgxzlA++1G42o43JKNDViQv6BwZ7f8ecjEue?=
 =?us-ascii?Q?quzIrtCMzPMXzX0+QE0kgvv6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea339c2-170e-4ee2-b742-08d900af0ada
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:10:05.2611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMI/Y5x3vmivOw6YGy5k1TwXyb6doeUKlLfp0p8/ag/2GjXpJCSWh1aTWHwkjWzF0tqWrP2me/YZnoekHHPUVuOhvuZIo2X/YasRSrk0QD4=
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

nbd_open() does it (through nbd_establish_connection()).
Actually we lost that call on reconnect path in 1dc4718d849e1a1fe
"block/nbd: use non-blocking connect: fix vm hang on connect()"
when we have introduced reconnect thread.

Fixes: 1dc4718d849e1a1fe665ce5241ed79048cfa2cfc
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 nbd/client-connection.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 36d2c7c693..00efff293f 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -126,6 +126,8 @@ static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
         return ret;
     }
 
+    qio_channel_set_delay(QIO_CHANNEL(sioc), false);
+
     if (!info) {
         return 0;
     }
-- 
2.29.2


