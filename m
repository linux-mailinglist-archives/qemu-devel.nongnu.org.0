Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A41E40204F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 21:11:55 +0200 (CEST)
Received: from localhost ([::1]:35296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNK26-0003UH-Hi
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 15:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxe-0005Xp-Np; Mon, 06 Sep 2021 15:07:20 -0400
Received: from mail-db8eur05on2098.outbound.protection.outlook.com
 ([40.107.20.98]:34209 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxd-0002G7-2c; Mon, 06 Sep 2021 15:07:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDg5kgKsMFPhEfJoWnbTYkYFl6EgVHgGuVgWXCbfqLetMzljYACJ33WD8pX0N/9MDpsPNUx9qg4VuKvVcB+eApN7h15Jt69MQIjGbN7u6/b2MdtfwSCflxpAl7A3ic5K+pA2URbMGqcyl+3QIteefD5vTaFP/reUE+pgvNFY7PYf9oWwS+1fEA4BJu7DEk9RyEWqqtvrKtpu81ZP3DNsOxKepzCjPX0lkWKWmTYRxXIjX/Drd659zT0smS1We5iURUBR5Dky1KLZZQLvuu+7/bByjwOHWTc2otznhKpTeW1HH+Pxsq1MvWAayQggRndao0e4ii+TcbHy0Gvty61L0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=BEQwbTZlOqPDcxNMMLcIltkMeLrNM/cwUcQgrQjsA6E=;
 b=eEnpbwo/N9yg07G7MCY1/hBgXpfuFRGeY/bii9yniYGO6DISurYEzmewJSUPGhFeU36jC046yLViF6sgHOahdxRVYl4wiZdhSqBm7kb7AibX0s9O2112VfGrWgyEUQAIuAWMKhEeSebtktq2nTcIZOkrumrNaqM3lPRovRAWJedQZgkbbG7TS6aFnNf4xA3Inpk7LjTLZ1WJaLdfmcGzVUYlMH69y105SeaCJmmdrFyVusdh5VvIffCC818cmphFXRGtltw1jMKHpHk/xJjpHllIM118kjl2KiRkKmlrYWGbZ0hNGXgXtn/P8DjKTAw8J19iQsFLBiIbYOC3DtQyUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEQwbTZlOqPDcxNMMLcIltkMeLrNM/cwUcQgrQjsA6E=;
 b=qW/eynf43yhrEbJNlSNskhLRelKpjEA6oh9YKt7YfdDTuJcvQD47wVXs9ANIVKzCzDeI+XOf/eLWnFdDbyZXyx+S11BgciDQnf+xOTUBbKju0WIpgihCK6ClMj4H2TC0PdwCtbkkmjXNpzFNH+45AY5xIDRoYeRPswq+sI4bOQc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 19:07:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 19:07:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 den@openvz.org
Subject: [PATCH v3 2/9] qapi: make blockdev-add a coroutine command
Date: Mon,  6 Sep 2021 22:06:47 +0300
Message-Id: <20210906190654.183421-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210906190654.183421-1-vsementsov@virtuozzo.com>
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0302.eurprd05.prod.outlook.com
 (2603:10a6:7:93::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0302.eurprd05.prod.outlook.com (2603:10a6:7:93::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 19:07:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6df0692-3a0c-4a44-b71e-08d97169877a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6038:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6038BFF967C0F080F1E67D90C1D29@AS8PR08MB6038.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /hU71RukdV7jPvsC7gbYKRzq2hFar7riWkEdvNSqxAss8MdhBDLTbPBHrpYw9+iv8heajD2nemxBq12o8pHAyuJYD47XDrbf7du4uy1BqkuL7wPiQzwIyuti61OxhlSkfRaTxJOav7KAcKymruxBaj8cjxQDIT6IKyTrUgmN70nFeNNZ6O5pYO2/7v5n0H+lFooTtcIrkkfXYiV/+Hnf+iUTmfZYM8Lc2aOnhh1fuVYA2rH0IFI9kvxIjG/PL28VYR+0LQrwuBz99RkWSj2/1/4xW+zdmOTyzMOl8EUNfA+ke9ZC8vHAemq9yCE1EtwZVWQKjsTdLH5tbGZ/kjF1/j+ELEz7W5Tj4v5RtdIiE5o/+He1s69jDEYEONmZlYKWrGe1IG8hj7+lcZ2aavoYf27t8Q3dzeHndnBiv8uSyb9LqHNb6VmPFG7hTnRUTlx7flhchsyaTSsOmvrV2otn+rkHkw9tuujV7oRhW+iXFpfum0+rnKwC7CFAoPlU7BHITS5J7+ciWLdOw/JVvRg7QeD/kS4S3zOdizRfwCwV1jiNDlSl8muxrDUgQSICccnPhHEqNQZle5oWlmDo16jdsl//fOc7WLj8h/xYorUqogt+iszvL39uSDfvq6eGX7WosjCbCUOjCUe6wvn5djLhGjjvxjYn6KfFN2gRgnrX7SEQ04BPXuMdVIm+7Lm5ogAKensCeaeWxzzmJAClmvFfNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(6916009)(8676002)(6666004)(2906002)(956004)(26005)(66476007)(66556008)(66946007)(6512007)(186003)(5660300002)(316002)(52116002)(6506007)(4744005)(4326008)(508600001)(2616005)(83380400001)(38350700002)(107886003)(1076003)(38100700002)(36756003)(86362001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NkooaJrg7i2JdGGDPkEIajwLJMLbMINLxCc+dammQ8rxGH4CyGF8QRbRi/qa?=
 =?us-ascii?Q?c8zWHTcK9IbdNwJG439ngc1VqdMr/YOl1VGBmzr+kxuK1TcrMtb/5Vry3Wau?=
 =?us-ascii?Q?5FPJndbuOZESBK6u/6UFzExCK9rjp/ZGnKA7zcR53IN9r5mdJzoGYN/YIDWe?=
 =?us-ascii?Q?+tq3zy5oAfad5hmQKGjRiFHPhF9fvZTj2xKIhOQ2mR239sia/TN2Pdfm7uiq?=
 =?us-ascii?Q?2lrL3JyXWKHf1UA1YIaxUVyAnxTk5s0yWVEJXjv5cRXRu9Pc2ho+Una7ELsY?=
 =?us-ascii?Q?O1JLofueGdX7tudcoZxCZYzm4GF83HTQEWRLhOBNczsBmJ4xIoVuFYCeTkqS?=
 =?us-ascii?Q?oWHiiMQh43ldEhtZkpQx2TYCK5nHTQwzRrU9YmUh8qSU96jb5O/k7mbC+lHz?=
 =?us-ascii?Q?gfa+3dqZgXnkRi+yTUFrVsusmyolNp1siHZv8tmDB+94QiIv1RNr4ZKE6sL/?=
 =?us-ascii?Q?Hbeiz98XzEGpXZfW3/WZmJxtCuXToyVu9oAuKfYyjTt9AqC7PWGwjH19zz42?=
 =?us-ascii?Q?XuBZbCSWhteAMP42LMqF5Gk0ngFgxeEpRDRBubLkkidnJunvkF34J3fD47FS?=
 =?us-ascii?Q?yGtUUvPlNGGqxfGa/om00zWvDFuRDd3u2RB+9t31Suw352dcVFNJAj+cJ6EA?=
 =?us-ascii?Q?YUgioWG2CzcjixMUanVa2zStKG4pM+1J93KfnvdqiqtjAJ+wuVW8jHUWQrwV?=
 =?us-ascii?Q?Gz7F+HNpZoJ1rmJMBSAqMz4qQdd4Rzfpzz7GQTbzjWtqonbykCV59VGViRcM?=
 =?us-ascii?Q?SSEv0q09/ZcbaFbyI+rdRRJHTGRQF4zYoiUS5it84umYLemkKfL212SyFAXV?=
 =?us-ascii?Q?j3UHCKdRepmhJ5zQ4e5NuKEbODTNH4ouo94gPFZkNW+Q92oVJnFVQV91jVeA?=
 =?us-ascii?Q?RmwQFoun0ZOuBEo3Qs2kNc/HJb/zbNu11S0QdHMqRmvrKEDlZaTvg7EXuukj?=
 =?us-ascii?Q?vOBcBgDxWYFOkx25akClJgUo3AFrKH0hBuCIyczyzPooczl6W/kUHUj1P+90?=
 =?us-ascii?Q?DWbXZGlxX6DRvqFCpwUML6jeCej0sGzIS2yxB/gNXeufd6jpycMyASXNhFam?=
 =?us-ascii?Q?Axo804YwmVqzWEWu2cOy4MAlvz5+9hHefgn4TSL6dtw1BL+AU/hTmt15AuX2?=
 =?us-ascii?Q?XHOpRUcFFTs/uPDVVu4g5X+s6zWqSAqjtKlRGocboZXdvuZ8MMk/2FAE3EDF?=
 =?us-ascii?Q?K3XFf0h5elQIMkdUT2sG/enZIGoCpCRKl5Ljx6FmduKhzHuhyi/fp4ecOuw1?=
 =?us-ascii?Q?d8QhZnQeHRFd8QaBtHbcaqQE9dkINuco+p9hU8QBpzrD8d31ei5Iv7Aj4Sw/?=
 =?us-ascii?Q?flsVjtUQJo5UMIuxj7fG0irs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6df0692-3a0c-4a44-b71e-08d97169877a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:07:10.9690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OitCPoZf/++jU3qTFAWOh8CNEWTOJWPI0Mjr8KSK1g8qyW+YgAHw0CuvtDphGZI1AuS3EUnh1o8tQ/rlxlERISsUjhc9Fci9I2jfWrngLfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038
Received-SPF: pass client-ip=40.107.20.98;
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

We are going to support nbd reconnect on open in a next commit. This
means that we want to do several connection attempts during some time.
And this should be done in a coroutine, otherwise we'll stuck.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 06674c25c9..6e4042530a 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4219,7 +4219,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true }
+{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true,
+  'coroutine': true }
 
 ##
 # @blockdev-reopen:
-- 
2.29.2


