Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E9D373CD8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:01:05 +0200 (CEST)
Received: from localhost ([::1]:39316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leI5I-00042O-EK
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leI3G-0002sb-Fo; Wed, 05 May 2021 09:58:58 -0400
Received: from mail-eopbgr60134.outbound.protection.outlook.com
 ([40.107.6.134]:4891 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leI3D-0005lY-62; Wed, 05 May 2021 09:58:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=novVdmQ1sJTo3CYE5o5XvicLPrzY+qgHwxspIos1LiMr0LuMTtdrAV9TtnQt2jLKFfUGBszIMQ4L4AmYBLWN9LBxW2ckAfPJlyNNX0eg+oGzfGM2Y7EK179eLOG+eo75ViOzXzvifGVJSAZ2V/Io0hwx61+TpKxbSRmum/99QNLj7vjtqS2sI+QBdSpYGZnsKYS4NY7yUFvUN1mw9b2FiO9ehbOSImwXNMjGoJQ5Y6wdbo4+KV4l+KrbJdlNe9hIM7eMlC6LCltqajFMQt7ndwTDmWrCSuxIGZV6k3EaSttOa2gTNMNzRTQfjW877Nw/sX7eC0GLtY5THgsB/xEilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgj5qnhGVZKNnbNKtNHI21rN8MpZyMShhEV8JeorHoM=;
 b=J3Bh8YXyoVr1bl6kfIkHtWd0LIxpe1CJOsf6u/kq/He+/wdzc8i6Pt5aQUcO9A4zf2bgMzYETwn6B5CVoZDck/JCaE8eVfNlCjz6yvmZSxnpgg5L4WMNCgaTdnNbFrv4pmP8EXtvF8HXUy6rIO+POqn7fB6rroRFT771qoR0N0iYppY0GKsfx8obKstYhdXFI9/JH3+p9LaiMXh/d9F76VkKqM2D3JTvxl7zdpXrujyQK9e3DnobY3EvfsfJEc8fczQJ3S38MpD0icpwmNaFqCZqez90U5Hd9OJBy8397ROlOHPYEENpu7reF4WnW6WAz7VbL5CjnyDsF6JS5QSrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgj5qnhGVZKNnbNKtNHI21rN8MpZyMShhEV8JeorHoM=;
 b=CMX8a260fXPbY5moWUrPIiR1Nis1EYeE6cTf//GEcW78Rdij9DIdyvlbYW1MB+w1h2tcOMXr4vg+AOLP6EeOwNtDVLQrwy9Yw/p/lgi+FrSTk0tX0HXp0vPkugYz1rfI6AA74Is/7QofiruwsXRiz+fVr8Zj46i2n6GXXpyibAo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4071.eurprd08.prod.outlook.com (2603:10a6:20b:a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Wed, 5 May
 2021 13:58:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 13:58:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, libvir-list@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 xiechanglong.d@gmail.com, wencongyang2@huawei.com,
 nshirokovskiy@virtuozzo.com, pkrempa@redhat.com, den@openvz.org,
 yur@virtuozzo.com, dim@virtuozzo.com, berrange@redhat.com,
 kchamart@redhat.com
Subject: [PATCH v2 0/3] qapi & doc: deprecate drive-backup
Date: Wed,  5 May 2021 16:58:00 +0300
Message-Id: <20210505135803.67896-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Wed, 5 May 2021 13:58:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90a5beb0-bce5-47f7-2957-08d90fcde9f4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40711E8E8DCAB530EC01F6D4C1599@AM6PR08MB4071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0fJxBQlfLVGs3TmUIHK8GBLll6qW6POGflzn2QuPi/6yU4zdbk3TlFzftPirVUnfHqKfhRqoie2NcwvTUUnC9f1ZUUJY/5g75aQWwtiem3hI7sKaUyQ2Y7zSKqudPf5WpYnvRC16utScOGRrV8gpQWRFSnH9SrQxIJ/9TYWw0nYyeKAXeZza0uugswHaAdG9d4AJYEli5Pm6KFpk4DqhUjhFnCvM8JUk3xf+H21++/PMQl9hdyDNkkn194oxhRPQNWhhcYlyuHMPsW3WF6AjdFxnsicNX8lwWbqNJdO4+OjltEnn9eRwBSpFYvtE5XsNhqQGqQ2txipIJOxo0R2KMVe8OWhiG+9/xryESIpgz4MiKNoWEebF7nYVN1ifpUMlaf+dHRDl3b1g8RYcvXyPvvJG8Zjc1Ax4uVCBtlE4CrRJm3X41xPiIcVFN8UIBAVXjM28d0GDOuyEsLvGJ6ps5GAZQmRuqnK6FNhgvW8AK37qzZiTsrf85p5YwTVHxVrM6jU1U6LxAPJYB88Ipxv98X2IeU7E15mb4E3ScjrVOGlhUfeRT6Ess5CTmZuspfGIfEHdJDOQ9Iig/6dj2JIdTq60nKkwPvMbDywmj/1C2rz4k52/iSEYRUaq1inUJimKxlEbeuXZJdVaRAJVYkfdMDtc/gk0PvxY8/GH3lcyLSOcjFw8kW+zrtzr4UFSzA2Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(366004)(346002)(396003)(376002)(66476007)(6916009)(2906002)(36756003)(26005)(316002)(6506007)(83380400001)(6512007)(956004)(186003)(16526019)(6666004)(478600001)(52116002)(86362001)(7416002)(38100700002)(8936002)(6486002)(1076003)(4326008)(8676002)(66556008)(5660300002)(38350700002)(66946007)(4744005)(2616005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?46FTODTb2nw95XIC/yPk2tT3sL9FTkPLSZFalFJdfOBl55Y+tukwvxBetiyJ?=
 =?us-ascii?Q?t9npJ8lCu8VjPfDhcVEiiGXTR2MJ2LvxQBqbtFEmxn4WAiJch+gq0oYNYZbU?=
 =?us-ascii?Q?zxQnIHgNFSxcn4q38QllVSdzPqrBAzxZskrgkKFLlbgErdvrnzPCDbVktlIO?=
 =?us-ascii?Q?H2S3LeHMC8AYnQmZCeIinAQXKKWCw5dE9qqaTNNhR/Q5ri0hEEqoEu7/LvM/?=
 =?us-ascii?Q?67XKipqmLHoc8ZTL4UjgqC2SgJVHNBvRs4G/LKDVAE+swWR/XiUj3VMyeYWX?=
 =?us-ascii?Q?/8AySsaGloDf37vWtE13+c/Odf5/I29l+3zFGXiQxPMR6r3aTesguXQk8wtS?=
 =?us-ascii?Q?hdghv98n7ymaEGxCiGGBz6vEv+fyvMZ7jOlBFdKXbzFbtzpU6m5mNG6GDA1Z?=
 =?us-ascii?Q?IkZa1Mt6ygsfjIfFhA6OwrMJCeWNy2Q0zzd90105LO9mv3iTigKAn8w4yRzN?=
 =?us-ascii?Q?xsxGHAVQ+LKPPZnGuwqzqsJm/AnBn+NeU+IoHDEWswspiJlagtBDReoZ1RVv?=
 =?us-ascii?Q?WSTQ0tKkGpmtQ+3x++GFdlLLQtqSjYbyWU2y80GpKeExmFUBDgj8FSaCyUh1?=
 =?us-ascii?Q?5uEMQ5wJHh2vhZCwKsP4o9vV4RLd1rO+TlWbSuf6VqkNhnfE4FTgn9VgKn6j?=
 =?us-ascii?Q?OADFUrlOngXTTSyOAZ5N72bFscxDBVjX3Mu1TeeQZa4jc06A+UdYwtIdYxQu?=
 =?us-ascii?Q?BBg9dI0CEFvWWkczpclTjsMuayRW6LXvOaVy7EKJM9S1Ri+GwbBr0FthJZpX?=
 =?us-ascii?Q?d//hQiJDeQgE55sBVa6i6MkntlL/5Lt/JFsIRd4KmVGvIeK7isdP6pv2gpd9?=
 =?us-ascii?Q?2CBDYeaI+oDAQidKxyuSC+WrOfTZTtSpVLjRZ3KytsiL8Tpw4AOTOG//mv+n?=
 =?us-ascii?Q?JeCQFe8nIOx3woksFseN9ZvwkjKpPfzgQWW6n+SdwjOvlNft2PDnNGqv+1HO?=
 =?us-ascii?Q?KVp7MkYm8w0GM+YqCmBk7GgLAdRgkiKEA4LEsG+rZPBP16geN25o7ERzWD5P?=
 =?us-ascii?Q?JVD4ttXkxt4zzYRNum3wk3YataWEAts0T5OhmOXrH4kmBE6E1KDO8m3/xb5W?=
 =?us-ascii?Q?TGad76Nsn+qFuSza3cvzZUexHpBeTqeEpD6HK1ALp3ls6VBAbkNjuX8kbg5s?=
 =?us-ascii?Q?rj5iWiF9gqCiUOSF0Y3jCODdsylwUEpJH0+skXzGnkefKzGYLIq8WmPGxR54?=
 =?us-ascii?Q?k8l18bI3L9wKgv28ScvWA/FXHajUEFacAHHYfM4tvs+XTDja5tdoMQbvbj6e?=
 =?us-ascii?Q?ehKrMW9hahlyKw9M2LagPWG6lnXpkfPXB3cKAcoMrlwRycxTgasEG48zL3+v?=
 =?us-ascii?Q?wA3D+FfFhwGBVZ/PYtRDt5gC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a5beb0-bce5-47f7-2957-08d90fcde9f4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 13:58:51.8735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sSuOzg27zdJBX8SUdBzOTQATSADzXKWPYr37JQrLx3AOP9rhBcjUTmKT0dOu6ShOBrQlkKt2WhOAToJlzDBJqFpMSExz0Fzpj++VogWPa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4071
Received-SPF: pass client-ip=40.107.6.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

See 03 commit message for details. 01-02 are preparation docs update.

v2: add a lot of documentation changes

v1 was "[PATCH] qapi: deprecate drive-backup"
Supersedes: <20210423125900.3640-1-vsementsov@virtuozzo.com>

Vladimir Sementsov-Ogievskiy (3):
  docs/block-replication: use blockdev-backup
  docs/interop/bitmaps: use blockdev-backup
  qapi: deprecate drive-backup

 docs/block-replication.txt             |   4 +-
 docs/interop/bitmaps.rst               | 285 +++++++++++++++++++------
 docs/interop/live-block-operations.rst |  47 ++--
 docs/system/deprecated.rst             |  11 +
 qapi/block-core.json                   |   5 +-
 5 files changed, 263 insertions(+), 89 deletions(-)

-- 
2.29.2


