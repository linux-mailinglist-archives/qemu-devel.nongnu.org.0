Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36FD3A290F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:11:07 +0200 (CEST)
Received: from localhost ([::1]:38420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHeU-0007xk-ID
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcO-0004w2-7k; Thu, 10 Jun 2021 06:08:56 -0400
Received: from mail-db8eur05on2108.outbound.protection.outlook.com
 ([40.107.20.108]:52065 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcM-0004zj-Jy; Thu, 10 Jun 2021 06:08:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Daq+cctQiCFsHQK58n2kQ0l0eSbPTKzhzPENaQguFqTjomsBmclO0lCj6Zrf17t0xVWnwlfR1vmhCZivBR3gnVtPf/j9ms4msmm2BhIG11pCZ84nhRI03/6ejHVumukOAxBUMPDKxDF0ZV6vJqASKkE9SbUbd0Sgdx7uZjg4Wu7WsYIZtrOydquOlayqAqbMNALWfT7o6bv7ukGm1T/IDR+p7HS/bgoXRvzBMcuBsmCBYEWHPTFKaSVBNL4ABVOLlEsb/bdC2u5D6R/EvuTZer3nl036H/D+zg5OQJNl+60bPDfAjcaQM3RLNcqOY2oOjbrJdnPakQX+UgAqj5pJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgTX3zU9mpVkO12PMV6mjN8+K4+rLAqbxNrKSCgXpRM=;
 b=ju8FDCkpCpGXRJ26F85kt0GkoxdWKiA7xemGevxt4ZVYJiDAFVwGcXQKEzyu4BA0OjdL8s3d3vPLrh6PAfxFzosiOnyOuYgZj3JWMpZ3t1P5sYUgUKOs1g7mE9h/ZW0QJw8Qr/gYXypjFjIMyTtVCtPqUNzkongu7OQWtz46+1Z5K4mPvbvwWea2btJz5AaBSyW+U1Oj60uWv9MESybn+3G2fFO9/7QJ01b0hrL1chMXfSI8ro4VWVZb9Kh1tAWrAyJFWU17Hkfe0lHnf4qeZRhkrJv2LHTxyEh7gqNsIgOGCx/6/AybiZfgeR6IPGfmSiCZyRaRq+xxcsfmPs7Nmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgTX3zU9mpVkO12PMV6mjN8+K4+rLAqbxNrKSCgXpRM=;
 b=WoOfr0v/LGjPjT8lfQSEHZAZCwWXRqH2Hp1yUBuBdneRYgBI5bGLBXtynhzdJPrFUr0Akv0X+kLvavcjm9F9tW7uDI6srYDlp8YAgEPnj+Cjc72ir4VDil9Ll3PP9yO2XiUYbI/+VOiaDVV2u4USJ44BclRIc9/MeCZdlAw8lMc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6790.eurprd08.prod.outlook.com (2603:10a6:20b:397::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Thu, 10 Jun
 2021 10:08:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:08:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 06/32] block/nbd: call socket_address_parse_named_fd() in
 advance
Date: Thu, 10 Jun 2021 13:07:36 +0300
Message-Id: <20210610100802.5888-7-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9daf8238-99d4-4c77-4922-08d92bf7bf8d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6790:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB67904D9C025D68018F70C406C1359@AS8PR08MB6790.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bQXgCt2eVdtapTM6yowQBxpVmZGC7nOhultiiFFvk47BFViCt4+fB1rmDqHOhJq4PdRZH6HCyQbwTNK9dlHEOi2kf0j8aOXQcgrm6hxF6rU4CCLZi6aFw/k6gR1x8hFMhB1blj1g2vKAPkGnImD8Hvkn0U04NoNoK13SZA2qxabIB+4GouQEvRqO32qBYgo0s+QDv3uyg+zPDPWt7FZ99uQlyFZ31QhTSNeid5MtV+ZNa2/ljG9HLTKEVxsPvQhyVw4bWbMqWN3Zz6vNfXjhk4v84Lj2TjGacSil39L1dsK5YnwbMjqwMLfuxmdMIjNiimoIaVYwxcuBtCi4hBX8ud9NSj8f92P9w8esDa0KWTpwkW343QTB8R6FgTqQ2V1vuKY0gOm0qHggdlTbaj7wgS6HKVxTpb8BmhHTyrEsre+4HYVqz3AAmh5Sqf8/rS+aEwyD1kEAOG21lHGUu6Qu4IqPUr9g0YJIVLPhfH9JK8Ccg6T34S9eMxOFACgUTTLmisi1w82TYj/cv17CdcbK5ZBb7tX/mYd9bdSqcdbQmkvHGFfivxXICj+xZgLPs5v7bYDJjDS59gAweT7LnaUG+x26ssmN2k3dnU/XmpFWf55XGYrb7ozZytDXpRaKA9fqKpmBeQr6v5aC61VN0mxuAHCTZFtr/tX2DquNPRvlz52+nrK/GwMRwynKvO/vaBZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(4744005)(478600001)(16526019)(6486002)(6512007)(83380400001)(6916009)(66556008)(6506007)(66946007)(26005)(66476007)(5660300002)(2616005)(8936002)(38350700002)(36756003)(86362001)(52116002)(8676002)(316002)(186003)(6666004)(4326008)(956004)(2906002)(38100700002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1t5+ynAM9x+4vb7bQzypkwttRPzoEaswjuU/b+wLxAuQwytvdo3JsZDRe41Q?=
 =?us-ascii?Q?U/ezJ9bHeiE59u2ZTmwGOW6nvCj63wRCl+oUOSncKs0xsm8QAsa0aAvpLULK?=
 =?us-ascii?Q?WS86FR1ge4MjUpAI6+1o53nqC1mpgPeS/aX3eRWHia6vMWqhudPuwPFp6ws+?=
 =?us-ascii?Q?AP/LWvJ8GQk9pJ6R9Slg8Z96iUBCP3BbeC00i7XolNPyEELLbmov/Fn+G/pn?=
 =?us-ascii?Q?/q5G/E3roeIgMIDHHSTCtC+HqlSG8b2G+2CiBfxCYei8wkgHlIiNaodyeJch?=
 =?us-ascii?Q?khYUjLFGMxnUKWuSXPN53xZ0dBr1zArCSlyaG6dzNPtY059kav5BnX5QFt/j?=
 =?us-ascii?Q?xCG3/lIpPxFNxQwwgVWPQ368xbYzkCJpUXNjdGNLP4rviAS56YcU94Bi9dwW?=
 =?us-ascii?Q?dRo3cP4BUAwZBO8KwHGVPJ3491id8Hsq8TRukjo/29ZPVz/cZVX4ZEXk1Cl7?=
 =?us-ascii?Q?P8mf6xinlQrKwOoa9hSgFdDjdOwMyKqZBYr/hi5uGjd0/uLzT8c5d0Zeu3gM?=
 =?us-ascii?Q?rF452G6PYWA9KP1FXzDgSR2e46cTEq68BS5huKzVb4Y7h00CC4Pxa1vCPpSq?=
 =?us-ascii?Q?dFh04rEiduEWcwFO3HSmbDtv4OdW2/wv0iLxjt9zD5yBm3SAm1kkqLCzGlI2?=
 =?us-ascii?Q?DaGPwyZBphDnWUT92l+63+pWT+6oejAI62akcporrIq2FzlyfO7352oWwPd3?=
 =?us-ascii?Q?/CyWQazRYg11qfdo5ci7ItwJpd3wj2l1ndnI8uzY01lFdhFOPm15yyCPxiTC?=
 =?us-ascii?Q?wnhaVQRh5RLlEKm+/ee7FvRI1iOLInAqSVSvdzg0bDQa0T3eO9aJHsZRM5rF?=
 =?us-ascii?Q?W2QyZFiPdA+fqcK1F3jf9yo/gS4hMT7v0gdHh5cX9XqMuabGdbHvkllo4cg6?=
 =?us-ascii?Q?PPmuvsboduhGYTeStUkTV+1olW75pBRI5H7P9baZrXn1I/3OValv1cjtiCTp?=
 =?us-ascii?Q?mWW7I2co+D3qF4TdhtFXrl1kETEpwWrYzo5774xiK5fSWYpVFwr4xtbXJjYc?=
 =?us-ascii?Q?aiJMNrlC3zvFOGXxQB62rPhRYbCanK73PmhHjw2BFRnVTRadkWZCp4cOwEn3?=
 =?us-ascii?Q?OGcUkVTMViK1ngxcz5h7RESO039/ycSfvF404EXdfl6rQlGkG066ADNxgszL?=
 =?us-ascii?Q?EdcJf566d4xUitqHlOYrJasnjkXSeBX6yZhZhisa00zODGcfIxdzDnFMM/ef?=
 =?us-ascii?Q?sSJUmsIYT1JGyymno/S0uYHA6p7nMqQes2JYEnq0lZsfC2CaKS4B0aC3+LHj?=
 =?us-ascii?Q?tgBFV7lq22A7lvslEk5FG+4pnQuH7vyjKi3BChIf+L6rn84ID3FzurLkUpDP?=
 =?us-ascii?Q?kdiB+W3pyUfBzmADUTP3yyOT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9daf8238-99d4-4c77-4922-08d92bf7bf8d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:08:52.2022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/UOx7PbIp26+1P0QtgaljXBh9lgXlmF+1U4pwIDfp6xJmwO+XC61atxBQZ3S7IGcA0hwn4THI9iYeS9p4jUsf7SPUYVok93KptN8pudRqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6790
Received-SPF: pass client-ip=40.107.20.108;
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

Detecting monitor by current coroutine works bad when we are not in
coroutine context. And that's exactly so in nbd reconnect code, where
qio_channel_socket_connect_sync() is called from thread.

Monitor is needed only to parse named file descriptor. So, let's just
parse it during nbd_open(), so that all further users of s->saddr don't
need to access monitor.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index f3a036354d..1c99654ef7 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2140,6 +2140,12 @@ static SocketAddress *nbd_config(BDRVNBDState *s, QDict *options,
         goto done;
     }
 
+    if (socket_address_parse_named_fd(saddr, errp) < 0) {
+        qapi_free_SocketAddress(saddr);
+        saddr = NULL;
+        goto done;
+    }
+
 done:
     qobject_unref(addr);
     visit_free(iv);
-- 
2.29.2


