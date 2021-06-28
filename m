Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F126B3B5DF9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:29:34 +0200 (CEST)
Received: from localhost ([::1]:59734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqOM-0001ap-0l
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lxq7Y-0006nR-Nr; Mon, 28 Jun 2021 08:12:15 -0400
Received: from mail-eopbgr10131.outbound.protection.outlook.com
 ([40.107.1.131]:39798 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lxq7V-0004eW-A8; Mon, 28 Jun 2021 08:12:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dmjp8sFwA5NUBiv/2tewDwbrU4YR1mK/SKBdSHpqiD2sdDmMQpMtiAH3m8uxICjF7OI4UyxqKLh1PdfQfwnFsxKb7VFbjePEsvtxb9M7WLVfrdUYI033DwkpEev9d43Q0set0ti5OKbAhZTgK4gfLt6BvCSq31kARLiCmSZuuGZjN8C2I6Ag3jfkstz53673eqeHIfKNCbzbIH6BhQKp8AGPN4KQ1+QocchODIYv4ZJjHpuNlwk851Hi5yAPwRBTyjtIvKoi/axt+Nt3UYuNQNEA5KLIZqXa1XUyBQ4YrZDQEBNA86bJqgkle9eK82QyNX4gqUgWR4meJywZT6dibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4KkTnXQMDLZZQjCf3rUj4yKm84YWTyVYTkbQ04b49Q=;
 b=IeFR54FZBzn4Fy8DrFxvdqWUzvoRihU2J1lYnW5CpqFfrVdsbwFzKhoSB4r8qIhMtyqz7SVNTO1oM7Dcm/cMk+AdlQycQSHwVD9+ALmyiPQFTjXgrUkBsLPehVSnreSJTJi3SkBZ93nXyGRuOe91x/R+UI5sQ9s2l+xkM+YH3oLKTu1+cKuK6RqFW1uplo1JVu/M9jxpqFRDdI/WNuNItNYul6D3SwfoPc6HFhRj9OPBvxgvzK4r9X5P1vhZ8rWgWC5e6HzeVxmM87b6xYvbfWYEeclruLxuWQcQn/9dMqwf5bAno4IGe9WbHbAecyZhe9MTPCU7Vs8Rx3KhtIxlkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4KkTnXQMDLZZQjCf3rUj4yKm84YWTyVYTkbQ04b49Q=;
 b=YDZVbaPzOcxlC+PgmMwIfPwUGxlog9hA4sCw48nckbR4uvgMHqSQgu5UBrMmei47BauG0/M+BMcz6NpiiPUkh4k2WFYUvoViV/DIKQpbkNXp+1mJJLXq+NTEmntoJf3WRBZD8yK4jg0QwCA7lwENUap2ygGgm+ZCs/LIeWKvMZ8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Mon, 28 Jun
 2021 12:12:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 12:12:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, stefanha@redhat.com
Subject: [PATCH v2 0/2] introduce QEMU_AUTO_VFREE
Date: Mon, 28 Jun 2021 15:11:31 +0300
Message-Id: <20210628121133.193984-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1P190CA0036.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::25)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1P190CA0036.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 12:12:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51a857fb-347a-4c67-3ac2-08d93a2df023
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16524D1FEAE4EAFFA686E97CC1039@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:372;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h0bdGthBbEwY0Nr3W/Q4l0yQ4YEaOfxhZm28GN2tJbnqn6nNS9QQVDBk2pJ7S5zFSUvtuZeAp6b1jQXlvju/0tu4WbDgS7KI5rLX3TsJtbjY0TNYzF41klzdgufwQFyszg4/wcVhkc6oqe/xfDGykrP1Q9k1Khoh5MdCuobPcORTxZrlaT3DMe20OJ2VaqNTDK4xF5B7KKxmstwoh2TzJvRbZvwtbaRHWkmJ0cYe2TbnZpS+SfBE2A6bFXzpiMKz9tjfKz6b3qBIp0Bpk18I9xPQvl54Rj75gw8l5iY37b1a+Yfp62yJCZu58poaW2dJpjK4j7RfizRKezsegno8RhMvmhDnrbsiSfeG4sOC00BiMg33/7jiyqTWDcTjIydRs8K5j4ibuYYaMxh3iBel/tW22YpvSWrKzsQ7ePHlKV/vOXOj8CQGzhlo8Q4d2vcfoBye1Y+TGw8xeb0lSCSTDf+tdA2oARMZK+FLtioG4Wmp4vXeo5NQ+Pkvi4J8XVd5/CCin/nWfgcUfGZkK158FYWpgvxRy9oY0xDhW3eRJyG4151Cg4J9UdcEAWtOhC0i/h72I8JVAeUKbTKO7kc2Ygc12rPPyu92QbxTL4QvdZ8rfhA8qUrYLLxsJCHcFJZk68kDSwDuVmMHv88OtCdW9bUbSWP4Fin6a2kTCra9vfS8D2TAOtcCrcjqVIE8YnGwEgPL3/zzXFmtJlCEkZ1/DZwCUMqJhTNPH8ggzgHijcTK7zNA/Oa1LCrLywPHGlS9d8nQXGFNdiCYhcaxGQkIew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39840400004)(136003)(66556008)(66476007)(66946007)(186003)(16526019)(83380400001)(1076003)(4744005)(6666004)(38100700002)(38350700002)(316002)(86362001)(8676002)(956004)(36756003)(6486002)(6512007)(8936002)(5660300002)(52116002)(6916009)(2906002)(26005)(2616005)(4326008)(6506007)(478600001)(69590400013)(84603001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?exS1KZ8b1yRlL00zAPifQaoJirhOT8NQzJ/gKDXnnvzOMSwktOqUeXCW1yIE?=
 =?us-ascii?Q?ic2mn9usrpniKw5EQMPO2VDgI7+0I05ncw8FnVC8EaXYYtO7zjznjg1+d4RM?=
 =?us-ascii?Q?6IbRVxT8yHAvervStuZxJCA7RWIr2XbKZ7A0tSy87/Xpc0gncXShI18Kh45P?=
 =?us-ascii?Q?yrN2dk8uBdmEjrqruJrmjfi+wl4EkhHU5GrUKqbnR2sFawRibqyPpomBkuIm?=
 =?us-ascii?Q?d+VCH1pLbXAbCpM7BtN4VtgUXnJo8d6lBbswM1bDyzU4GDSQF2BM0tx8qDk4?=
 =?us-ascii?Q?0yA+OiPoymvOdcBi5ATF2bP5NsEv7Z2VnLM9k/AQ+h1hOdJ3MWzZXdBd9yBs?=
 =?us-ascii?Q?1DBiwqykVa7NXB+ZGHfwWLq+y8yUK7iQuPsOHTwULibXnlhudTJRGLFAGNor?=
 =?us-ascii?Q?X0GbJfESsCOieDTepY214HxPW2zyhaT2N0l9j8PGK1z+lhfkjfjnFhn5LJsM?=
 =?us-ascii?Q?ilUlT1aEExBUg/67/Z0lwUG6BpsdgQQCFvU2wpPCmP9u+fETA8KSl1ThtLTj?=
 =?us-ascii?Q?4Q8ryE7WnjZc14NyySZqJKSAmGBo+RVtndNaImiPey3YFpxKsHvOLghLNztO?=
 =?us-ascii?Q?YQea8Qgij3gxxN7VVes83sPV8k0mc3ld/htkbz8MfaAiW3YkBtu8EAs02BHq?=
 =?us-ascii?Q?zM6UoalAeJaHoVFw/E+caETHAfDNU4rP2L6T8cNzd+SCoMTJaeslJ+ACWMlO?=
 =?us-ascii?Q?mcTr4i+ki/PghY6SLt8jZS3fxP+Z0uW9ozotmJkx41uejE4iwRkMcjJjjGf8?=
 =?us-ascii?Q?+SnROH7Jp2GGE81bPuY6aGX5sst9zpMNR7PtoUez/iJ6sKrn1hOg3VmqYSib?=
 =?us-ascii?Q?0PP3xff9g9aSCEZqZ0EiuZfAcitiDuq7GORnZ1p64byDLpqXfU5y6yeiqTp5?=
 =?us-ascii?Q?+DpfEcfcOfI3BBJ25RgIHRx0vmTksFvZowP4uI9aIMHx/qalg9FUOVQjJP1z?=
 =?us-ascii?Q?WUhcwj6MloSyR5ldTl+89eEIRrbl6Nug1tJ1brcOnmWWVSiTx8Z0O8ma6K0j?=
 =?us-ascii?Q?zBnVTP1splM8IrFjmwk0eICPYYsvPi8TODOmGooIYvUK20GL92yqJejPTaqI?=
 =?us-ascii?Q?gi/01NhgArj1KyzF/aNco+TPCTA2Aa74r1zWZglyXtFCZeD1oecwaaVVi28q?=
 =?us-ascii?Q?rjO+Qm+dlOqiebr0F5+C5vZD6qJeI/gYBBZ84/GPj8YwOy7V568+p4xAYS/e?=
 =?us-ascii?Q?/Eu0Y/2twwl3PEmx7dp/nx2s61G+5XAkgtpgAnSKW6rAVaXMkLh4Y23dkXaZ?=
 =?us-ascii?Q?6iDx46NrH4MX88rpIdz072U7x64gpApwWv3qWn6ICYjX2TTIKaWoeqgQ4J3g?=
 =?us-ascii?Q?hvBRIWx3GQ40fxj9ApYY8fDP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a857fb-347a-4c67-3ac2-08d93a2df023
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 12:12:02.8217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Da+AzgLkvx5cmCeZ17cO04d1UJcfbkkjQ0co3SjJXCd/aiq7OckqVGyeFwpWGgBDBsdJKb+Fxt40Nbv3EpJQtniiJxn7Ebkm1l4usjAGTos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.1.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

There is a good movement to use g_autofree macro, that helps to
automatically call g_free on exit from code block.

We lack similar possibility for qemu_memalign() functions family. Let's
add, it seems rather simple with help of "cleanup" attribute.

v2: rewrite 01 (as first version was just wrong)

Vladimir Sementsov-Ogievskiy (2):
  introduce QEMU_AUTO_VFREE
  block/commit: use QEMU_AUTO_VFREE

 include/qemu/osdep.h | 15 +++++++++++++++
 block/commit.c       | 25 +++++++++----------------
 2 files changed, 24 insertions(+), 16 deletions(-)

-- 
2.29.2


