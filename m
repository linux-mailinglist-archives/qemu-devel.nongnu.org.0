Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E1238E3BF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 12:15:25 +0200 (CEST)
Received: from localhost ([::1]:42472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll7cK-0002Sx-QG
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 06:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ll7aJ-0007EZ-It; Mon, 24 May 2021 06:13:19 -0400
Received: from mail-eopbgr00093.outbound.protection.outlook.com
 ([40.107.0.93]:3703 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ll7aG-0001UE-QZ; Mon, 24 May 2021 06:13:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTUur5cC3HwSQ1HnQm7NmoC3/iyupQ1uYtne94u1mJ7gBNU3jnXTzIOlPuV6sISjiDk+ZzAvMpHxWMTwp9k71cQ6Ab33s3XMqgXH0HAZVSUJ3QCKiP+AW0Gzbkqnss8eMedZHbKV3uGowHWioXYBrlsNYgiSdfhQriavViEpytOeVMXNZJnRXdFT0Iuk/OUHBqdRZZzek1w6Lpkz0eVflC9ToQdkrHGr4s48U7F4bYcFbTY+YNmTv0UkKU5aAZVZ+ei8Mntj4by9EfU4nndWuarPBIuKMfBrhTAxGnN8uC4ujNVXMs3BXIWYR4CM6idOm2f5P/bObTzKjupNHA74ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLkknFqfCIUV9jc/QW0tXPuinUU5HXV7UP7Un8FbkJ4=;
 b=LejWx+FKVIRTN1MXyJyD8mmnCf/1ZJeWcm2VDWtRWj/Tr9jvjGuJ/EYZP+PkcOJLM8piaxZDwegI/+aeNz64PnG6icDZFBHVOVcZKnFMB1IKKTVEw45ctL/PE/7vC9DyXyWj/PCNbP7yGAygLnRdzw1Pd6WG/EPXR/RNBnpqB05LnqPo0m3HsO0Mm7jGe+yuYq+yUat06MH9m6M52exaBnFHlU07JcXqma3PU9u9PaC1Tzyr3gB3Ilab8T9V36F4AcqhwaZP/o7XpVMLLPyLvO94VOyqkqzAul7xdSlb/OXz8VTh5VvIxbbNZ4iKSS+pc72szcuGqOcud+Rs4jX4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLkknFqfCIUV9jc/QW0tXPuinUU5HXV7UP7Un8FbkJ4=;
 b=REHt0OD6ZSaj0rVwinbn4hzX0YWGYhk/caaN5wU2JfKJ/AwqdW+jybrk4UwPrrDc1Ed97S5vxHlnp7IdvxRE3gmE5J/s5JRFP6EewgwuQehvy9WOZ16HV49E1TP3/EF6YhYF9BZVDaY9pzUpJ47PkF23iqFVy7hgTDbmM9nwa3g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4952.eurprd08.prod.outlook.com (2603:10a6:20b:e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 10:13:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 10:13:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, programmingkidx@gmail.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH 0/2] vvfat: fix two crashes.
Date: Mon, 24 May 2021 13:12:55 +0300
Message-Id: <20210524101257.119377-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR05CA0186.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR05CA0186.eurprd05.prod.outlook.com (2603:10a6:3:f8::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 10:13:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 562ac355-5264-4ed7-6c34-08d91e9c8923
X-MS-TrafficTypeDiagnostic: AM6PR08MB4952:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB49522047E7E141230C184087C1269@AM6PR08MB4952.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Hs0TxD5zLImEoBmXy82KH6iBiJ8riESrDWuxFTnKPTPGX5JYap711R6Utlan7FStUJ4C+JZZy2TamvzPyaUEWcByIXpm6xG4X8yQ3ufexUJxv4pG+R4nrRh5EimbPhud+yg0n/L3rk34imA4yhi1lsGD8NyAudFKNgNkaIdoFTI1r/U0XGJsiGIqGBDhWGBpvtbYrvcQFhvez7Ae8or857X4H2yHAcvPNNkS+3p+gDkwsxML9ZlKuKTaDXRg7RO3HIwqD71BMAuYAiZoOynU9iKYZYdj7RT2ZbODq5MOzTo3U1dXuiFC5jyl0yZ8WzXOWCM0ZEVmNpZ1Xxphl7QzFrCkE3WnWLPouwaRE3pzPeQ+eFPfP6D/R1luAbrGHmcnizpeAMR5pIuU37UPx6sjedSwuRdja2aTInfcGpoGcOf77XVjwvGm6GflPeIwfmeCkmE0drWKRVA1fDHfW/4vGyRKbKx42JYmZEqc4sin7KWfJ4qNIGisHIEGz+DqVsZt4pD1tYdfD/vO50CTiaj0gt3IRDtdJD7enxCtiztOozWa2oZXcZHgXSqkDiCcwdpg4VWb0d1CgEpMToOcajtecZs7S2O4bK+SBPIDzkso8QcdZgVo2Is8vXLePsMzz4TqqpkiVoH6smjXcOiGdVg4Zgj7VXCpNDdjNo+rqBC0so+jzTFXmyfkZECYyd3f5Z7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39840400004)(66556008)(66476007)(5660300002)(38100700002)(38350700002)(66946007)(6666004)(83380400001)(6506007)(6916009)(36756003)(107886003)(2906002)(6512007)(52116002)(86362001)(8676002)(316002)(16526019)(2616005)(186003)(956004)(26005)(1076003)(8936002)(6486002)(478600001)(4744005)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fwX8q8ii9VutNmzM8jDTdaSRi69bwBBkl87oqvY2/3mDIh98A34sjCtGr2v0?=
 =?us-ascii?Q?nqq3wAp5MJd+ztVxmsxYEwSbojMEGX9JqMWW1H6erG8mKbLJy9ZD103mkol3?=
 =?us-ascii?Q?OuTvp6d3ndbnnq/Ns9S3+xRNUU6cLjYjLezwKizT4DdcfhCdRKZStBrzHckv?=
 =?us-ascii?Q?2V+IyJRepTn4iTouyEPRXCYK4mZoMRaRX8rEMpRT05GQsnijuOuwV6M2gTMG?=
 =?us-ascii?Q?YTVtALhLVSLOJ3kW9MvM00rBdiJoHRZT33zRgkH17aIg8fkWzF12D+oGIAmf?=
 =?us-ascii?Q?3uFj64aKUrOzXlX4CHRBBxIo6xUnXz8PI53DxH/+hkQQB4PRKYI+ghHBHBlz?=
 =?us-ascii?Q?j0vJrLOkW7ryM4NvSVdAAGE7KAb3dVT9qpV6qaavNosLI9N0Dt9EdFKdJSE4?=
 =?us-ascii?Q?bWeTnxO4H7kQEZd6/zDQt8oPEKQ59a6Y2yUmkRIZP/U+/sM36WKv6kHNEkij?=
 =?us-ascii?Q?xpxg4iaea7LshlKru//NqWNLhW0TPQPn7sy2BmqDHzz82EzDVBIAz51j/Pl/?=
 =?us-ascii?Q?To8I8bMXJXmz1R8dqV8WeUqcIL6QR/uI35T9OYIk7/hsRz6xgsO2jzPqXcR1?=
 =?us-ascii?Q?wSGTtRWaqr0eRy2sgApv4sYGWYdGeuShR04eILs+YIlMckGvN0cCsz/sMDgT?=
 =?us-ascii?Q?Oxrr4i+8+zYiyQuJJAeTHV+WudFfg9lcs6e1nB1FBokXot/3vbFaGt26wG2v?=
 =?us-ascii?Q?c6qEyjuDT8RvaWXUKV4QxYtJXJ343Bz+0WODoBb9FBRKnnJdn/Wr4e0eC06H?=
 =?us-ascii?Q?bMunWjQ+Xyh1vwPQf/OdFszY/5u4rzMxpDuqKVsRlA2aJESZsyKttyVtRGdQ?=
 =?us-ascii?Q?cLehkPkRps7el7d91MvIQ3XeFos8Y2LTzlU8ld5D2iotFC5AygNuRBrjVloc?=
 =?us-ascii?Q?/S4lTLMt0LW+CXhu1y+52TpZn0YtkvXhHbpZxXL6mYzLLQB1MNMH5iMyxg3S?=
 =?us-ascii?Q?lgMJi+aw8qzTIpsquecJNikye/ztA72LexDaF5HONf0dGMu+Td/pU7n0jPKA?=
 =?us-ascii?Q?NLO4ei1KUMOhF9+07G9gurh4XKmGk8mI9r0BwJtqKZn3jFCiFIgj/zysma+7?=
 =?us-ascii?Q?LfkzaHaIGxqrrm9MNgMMqEReRtpsATVBAMyJI2CNg77DTUgReWN0ZWK/VCWY?=
 =?us-ascii?Q?Sr0KTt/p8RXTduKLkdVAlzDtew0uMTTQs1MFJPHIfPWUfkKkGvZnY2IxXSjT?=
 =?us-ascii?Q?U76pOqkZRTiAOxvLxL9gFH4huXdKGmZLWxeFO5eeuxEPtRLduPPw9zwh3jFZ?=
 =?us-ascii?Q?pZnwxaaRpdVdlzBfYjrsHvZzsyhonOGrIIfYzcRpO8bKlIXMvx/B10w9ba4z?=
 =?us-ascii?Q?JRnWp5+GTmyBW6TcHG3zVmFt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562ac355-5264-4ed7-6c34-08d91e9c8923
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 10:13:11.6815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6cJxELKVImokLohG5lVjC3nswKntYxPOzzsZwwSV3Nv9qtJpZII9nzcv5QsBzK4CvInWcIUDJWaNpVKv9/Xv0o7NM7yYQ7HnJcQyrbe9Hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4952
Received-SPF: pass client-ip=40.107.0.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Hi!

As reported by Programmingkid, command 

qemu-system-ppc -usb -device usb-storage,drive=fat16 -drive file=fat:rw:fat-type=16:"<path of a host folder>",id=fat16,format=raw,if=none

crashes.

I tested it with qemu-system-x86_64 and it reproduces for me. I even
kept "<path of a host folder>" as is :).

So, here are two fixes.

Vladimir Sementsov-Ogievskiy (2):
  block/vvfat: child_vvfat_qcow: add .get_parent_aio_context, fix crash
  block/vvfat: fix vvfat_child_perm crash

 include/block/block.h | 1 +
 block.c               | 4 ++--
 block/vvfat.c         | 8 +++-----
 3 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.29.2


