Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63D43A2974
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:38:16 +0200 (CEST)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrI4l-0000V8-GD
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHdN-0007CH-DT; Thu, 10 Jun 2021 06:09:57 -0400
Received: from mail-eopbgr60127.outbound.protection.outlook.com
 ([40.107.6.127]:21154 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHdL-0005b1-KG; Thu, 10 Jun 2021 06:09:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVp/anu15VMS6DNSXRg6kLW5D6BsrgsAnw6EftcWOfxs/+OarEz8bB9roB6j0itWH5+xz2nYUX9AiUYYoCSVlZdIA1nxWN6puPwCmonwq9x3quNzu6GiA+ws+1eTFqe5ALn9BZbwmJgh4khUNZ/pZ0cpquOuEymYWFjQKOvFKDhzkC7IP6NU7jz0n1i16Pgf3moMeeWUfqPJBVu6oLDh9umZIwrdCD3/gzG1LcjG/kCZcCsLfOf81iHepOES72a4ZMiRdeJNbBraxEOkeans+tt8S5HYfv1ofdwTZX6d2QFNZsV1fUtF8dR+Ux2VkmH4RyDG/d2AerK7ODk/nAs96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiWfvx/qPjuzWzxF3Dw9i2QEBqemCyDAWdRisvyleBY=;
 b=a1sGADNR9GNfR6LkyJYxNF+JhrMO0QgB1JulL2c8i61+dFfJvWCqBO+1mk5A+CsoRfc9hXc6AtTqPTolKnKwMGp1FwKIEa4+LVX/y3mREi4fQCLLlWqKw2P0HgsmyaR3nxOJGURxxgGgp4/aQzjO6vroDidvWbIIBS8edK//Pbkj1pc+NdP3YznA0oWl1ldC1aY28iprNv18fjOVqjYp3FrYlmZ543zEok/IPftkZGsuHYRsbkb6vX4B5hnLQbsN8yQTg3tjg1leFRg3c/QRq5LuHUZjgWfvCZtFu2Q/6Jb6RwQCTgOUHzXg7mYI+oui7K8VyWI5krj0bRLTdp5H1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiWfvx/qPjuzWzxF3Dw9i2QEBqemCyDAWdRisvyleBY=;
 b=ZInI8XdmMY5I9S8jV45ojQGFtc6cUuogZDTqTYABggKiZkpRW9wo30nQGF8zRv/xXiHaebJkFrpR5LQ8uzWQmGYi1/oWeX98kJH04biTbrX2sW4CMzHoC3+8DUbJgmO93sJjknTcfCRXouYv4CyGD0c/v0hHqxXp/Iw5RPsONzg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6806.eurprd08.prod.outlook.com (2603:10a6:20b:39b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 10 Jun
 2021 10:09:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 32/32] block/nbd: safer transition to receiving request
Date: Thu, 10 Jun 2021 13:08:02 +0300
Message-Id: <20210610100802.5888-33-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 787fcd65-6ad1-44ec-cd15-08d92bf7d1fb
X-MS-TrafficTypeDiagnostic: AS8PR08MB6806:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6806790E97C4D67DDB83BF23C1359@AS8PR08MB6806.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GLWwuB18WY9wN1sfsg1wgRkFqZDREbGxzkIhgmOqLaiEPDW7RHe1n7V/2R6sX+nWgIi4176h1kzgbQ/A7G131PPhszshpzFGCp4Eeul2pu983iJ3VKe5ibXLY+Ta5RDJbiQSUfcOHJsS9jghN42yfl7UwKBj1grSEsgbvw0/12UouOKDn5klddvRFpn6yAWeduuy2KIoluFDCFcayFUvVSOjlKs2/9ZEPRFe6m6QYJ4oa+StBdN/Iatm6m8HM36Q8qPTyDSvi4BLUnZiCfH1EhpLxJ3NREavhNDBiZvd4hpWF0n1r+ELUdSUAEglGBFq57r/66nK0qnIYjTZ673m76RpDA3oLwh7cIu71sUPFe/7Lz+298LKGFt3fQnAYD2ZgiLIIEJzmdeQghX+aEAlyxNANlB6AjBOMffjnHG3KMLAGY2j9YBS5Mwof8edl9ftLCRB1/Rs/fHxZ2M1UP85OyNyzidy5P/IR3ltuYburi7Bz1PfvUUcwzK1nhiiWVGUBiz75bq7vy6oHsOBcRxP6CAvGsDmIw2YhBFJ1sGLkddRlVoVpyr75ZGMAlGNGps8iS5vGpuFNQCnVXzgDPnSlhBN/mRrjG7bglqT9pa07NzHto5OHYyhhhj6ouysON4H1ISM86/E7VicHtg6xlMtfP3ulhWCfvwyWxOzm+r2MLfAMZQPkCF+oGOL3UfCkgyy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(376002)(396003)(346002)(2616005)(2906002)(316002)(6512007)(5660300002)(8676002)(1076003)(8936002)(956004)(6506007)(86362001)(66556008)(38350700002)(16526019)(186003)(66476007)(478600001)(6486002)(6666004)(4326008)(38100700002)(26005)(66946007)(6916009)(52116002)(83380400001)(36756003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/izKs9RdxAaeiHBpff8PeLIb51p25kPjy2at+BAxIeWJ23eFRlNYEFG5DLSq?=
 =?us-ascii?Q?DlbpFLbtoCVEnPRERwctNcrl2BHUE7AJ5IT6SdNvb23pUfVfOA/0hhPhaoip?=
 =?us-ascii?Q?OUZIzGTZq3wFWlyd+9G6Eaa9It/b9r5WKXWyM3QnErf+gvcKA+G3RoUR/FIp?=
 =?us-ascii?Q?IcuuoxIA4TPsWz0hqmd2nzbXmVQ2UyfR7dmRw8K59FPaQn8KjuZjlQkfDNnM?=
 =?us-ascii?Q?Vqc8JWExnbm6fFP+KZNNAc5dgPNk9LN4VmIqVm+QTSaNx4Xn/STxvkPgidtT?=
 =?us-ascii?Q?49sk9rlWpCkNGel/FWSsURiGWS9znSXE8AIgY+Gsip+cYv145T39JH17JhBq?=
 =?us-ascii?Q?LkHO+90C1sczTNTVX4sxHpPIt1fQZi73ldgn+3DQiqWkftmhghOgRGmsgpXm?=
 =?us-ascii?Q?BtkeOljEmJ7Xab4/hy5y0+4HxxeC3FcXzseHFu8/qVityA4Glzxqi3R8hz/Q?=
 =?us-ascii?Q?kIa9xxD6MQqbl6u9W/rlJW97yG77cY563PWcaJWsp7832MlBjD9Ag48Htgcn?=
 =?us-ascii?Q?vU20XySLIek8CMtDHeUyErzwleOenbm+cTk5LQ82vHc3Xf/8uK0odjecPf8M?=
 =?us-ascii?Q?OivD86sj5BO8BKVzyPabRE0PG1K6quc77f631Sw9vzeqqnynhVOxQSRKFinr?=
 =?us-ascii?Q?H3HbP9FIggN/WAnxEog5eZ+Lv31+jytXFQjkEHgZtl4Lfa/nm7/e9N6XbtmQ?=
 =?us-ascii?Q?WC21BSlEMWXDFr//jRxijFAu/EywyvR09lvWdplXCcPXOoWLsaxEtQ7ab/cT?=
 =?us-ascii?Q?MOS2n1YGB9erqZeSW0Dh9o8xHz2KaF56Iwee7fxWo4Q8ol2ktqyjpe5U/ZD2?=
 =?us-ascii?Q?RYnlPyndTilPqMMqOy0Ypl0quH8JIZtICkmdSTuFUiinozFYT7MPYcx4bnB8?=
 =?us-ascii?Q?WTxaxjxp3ia1X9k6W8CdHXGy3Vql/MpqPC7pSGpXXf75zXUbn9Qk6jpOotmE?=
 =?us-ascii?Q?vDVEM20znXgFnSKT1nlvLHbNoBkiGdGpX3yygW3WHrrbgitv+D4TdqX+HL0R?=
 =?us-ascii?Q?PF3zoCS6BmwULQ40UnyjazPx1BaXSYMEulFVAR6mqUJTfQACI7o5To30v4o4?=
 =?us-ascii?Q?LuvmEkm9gGrAxsqlhxIaG7M8WkBGW8BGM/VSWtEi8fsZoATMyiJEoa4vpIUy?=
 =?us-ascii?Q?K2+evQOrlBKvmID74QlFZo3bM75no61OGLY1rfxP1iLUPrAJTdJUF6p3R28T?=
 =?us-ascii?Q?msTG1uUHkUYXDmcahl6GGWtDg5UglP298vTD5Th++5wWx9iF2DQ1JlzJk7TJ?=
 =?us-ascii?Q?1MVFLaJeHW7+47guuReSctugGnkgjp6aMwDSoEmcgeDQ/GKJiFROT7Fs2C10?=
 =?us-ascii?Q?o2i5BYFMH8mvKkAYuhdb/avI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 787fcd65-6ad1-44ec-cd15-08d92bf7d1fb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:23.1075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s11ntUznXvq8lIaPkQO8Sb18uShvT9K8Dor4DNUU+ZAjpeiOhtyTr4GfcTzBL6Br6ye+Q1GEcuM/R288j6hoGipeIyPgYNdgOBgGFhpxCa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6806
Received-SPF: pass client-ip=40.107.6.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

req->receiving is a flag of request being in one concrete yield point
in nbd_co_do_receive_one_chunk().

Such kind of boolean flag is always better to unset before scheduling
the coroutine, to avoid double scheduling. So, let's be more careful.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/nbd.c b/block/nbd.c
index 5cfb749e08..3cbee762de 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -150,6 +150,7 @@ static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
         NBDClientRequest *req = &s->requests[i];
 
         if (req->coroutine && req->receiving) {
+            req->receiving = false;
             aio_co_wake(req->coroutine);
         }
     }
@@ -548,6 +549,7 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
          *   connection_co happens through a bottom half, which can only
          *   run after we yield.
          */
+        s->requests[i].receiving = false;
         aio_co_wake(s->requests[i].coroutine);
         qemu_coroutine_yield();
     }
@@ -934,7 +936,7 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     /* Wait until we're woken up by nbd_connection_entry.  */
     s->requests[i].receiving = true;
     qemu_coroutine_yield();
-    s->requests[i].receiving = false;
+    assert(!s->requests[i].receiving);
     if (!nbd_client_connected(s)) {
         error_setg(errp, "Connection closed");
         return -EIO;
-- 
2.29.2


