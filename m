Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D14C44B27B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 19:09:26 +0100 (CET)
Received: from localhost ([::1]:40978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVYj-0002Mn-DB
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 13:09:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkVXD-0000sz-Ix; Tue, 09 Nov 2021 13:07:52 -0500
Received: from mail-eopbgr150098.outbound.protection.outlook.com
 ([40.107.15.98]:60718 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkVXA-0003Ca-Rb; Tue, 09 Nov 2021 13:07:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yi12LIffrss1FYffmrwJYlLirli1QurEV8yMJCSJRgD5/OJ3Bgo3JLFbeOaupSD0y87lEDn1dvqFUW3EVQZebl3vuVxUBU3cYtM2f8lcvTmWARY9XtdkfE1iGwpM3rDFu+vVdxkG91CAu0+rUv7i895M7MZCg74P2JniHpYCNmfNdrJfY2bhPUl7xcN1Omfl/GUxi1VwS9yZEbqizSIEjgG7NnubYxMeEYu6dzYZL8mnUjkrd4+Zfc06dcCpHi6T8BbbCAmmPZwXWUSDdxCkvQoW1z8+qUV50acRP3i9C40gq63AVF+HzqIl0jmDva8yyzCt9PXe0SSuBzDaBaRGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/rXkJC3eXE+CkMxhb48aNddjl4f6fOe4kJYZpmuKMA=;
 b=mXMegsuCAVwBGG4stkgqGyqo9RJdAq3awoTZIeab+6ZmJI1qrQFuJxmjA3ciCWagrKMdI07TW2E1rKuPZ9sNPbEkbOvDbSKHNfE7Z520d6yZOftgMmEh22RiWIGOxPOS2IoV/sY6r/YX9QyJuL6Irw956/m5fgsErGN0H35EE6ESeOdoDIl7PhUhYjHsCusHEnbmCvgNhwygugZyM57ag19pWakphspU0kSGU/1UCayRxKNbuHG/bBwr+zfnrsxGokkynQYTrHFlgH/A+myuPlXrMiOpJxXKXhOvK2A73U/nBy9pbkk7p7eII4RVO+SlRFKT/4O3e24UalQjs7yWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/rXkJC3eXE+CkMxhb48aNddjl4f6fOe4kJYZpmuKMA=;
 b=S789BhvjRVOn24FxH3bggihs8iKMzv/g7TWHhRLBxm9a7vfC3dl7SkEiMGNqpCcMiHrShj6WWTWpTrq1zIU6GFS0aowtpDtyps0sKbvVKHRQ45EprG+86ABUWNc3wyMGr+dzRXTvpx1y2b4Ff+H8zp9ovWM9+TT53DTRjm1FfbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 9 Nov
 2021 17:52:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 17:52:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, peter.maydell@linaro.org
Subject: [PULL 0/3] jobs: deprecate drive-backup qmp command
Date: Tue,  9 Nov 2021 18:52:22 +0100
Message-Id: <20211109175225.2209903-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0059.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::36) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0059.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Tue, 9 Nov 2021 17:52:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb952bd6-11c1-45e7-41fa-08d9a3a9b7e2
X-MS-TrafficTypeDiagnostic: AM6PR08MB5077:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5077AA268BC73B7C8FBF2841C1929@AM6PR08MB5077.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:269;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KELsDvVnP1bbsEtYST2bms4LyySboPtVWHyt2OuV/Y7SQD4Vrb00u/gTDKz1PbnR68Zh5ahd2Vr6AnBB0QvKZT6PBT4HmvV9DtTQJBOyUK/4XkOF38BQkSx5QC74CeasJFnxzUOQn7Ylp+kVFgjdK6lfMtf30pgbZZCNO3holzjA7qY2lAR+F1j0lfr5Zzcz8PVOg3EL9grlwzK1pbwyZ8uIbPwLqQi+F1Mq+wJ7UgWAmT+GGzWqtlfIZU/KM3sJF0SU7gfOGdf+wfdVWO84n3/88DZgp0u6jMQk+LWEvr2NdjAYdHTiDyVBoaQIYn57grweTjOJaEd4LaSRiusUId/cYYovb8RHjSHpcSctJtTECRyXmsSSXlAneXYkMhpUY5PHzY5YpzdJmpe7ysubho77qCcMfEYc7H7SJjvjdLZz+DrC2AiossUeLUv6/rnc29hJbl2YemhjH9dLjA8IGBUuhLoezVCW4Jv6yHzQRvwzaQ/URAm+yL+fvfFAMb+NBRl6jqW6KfKz+wi6I9ZAFZxnSZcx47fycfylCxQFNR3TzAcweImNtRWTPJVxCu2CBM6yVVQmVWY2f1rxqwBeYpI0QSCd+bUxAViX6IuhlSezcVCeBTXpJhZ47PPT55ho0gH+m9Y7RqtC+5+hdpjswr+UXUmtz5uae/S5KySVrZ78iXEZTaigg7Ff27GWDZei/wn9F+kU2q9zqCjorTuVGFkXxZ2pA4LWizi7F/uAprFA06cHv2yF/6whMZN7dpFFk99ZWdyWFuJGABhEXNXHrZGfBub+FpcMxQCEvlDKb58=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(966005)(508600001)(2616005)(1076003)(956004)(6916009)(83380400001)(52116002)(8676002)(4326008)(6486002)(5660300002)(36756003)(6512007)(6666004)(38100700002)(38350700002)(66556008)(2906002)(26005)(6506007)(186003)(66946007)(66476007)(86362001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z8gfjqbM/FGY3wpMtwj36ZhVAIVqOlSBkK3+ie/LyveC2+EkQbUvrmS5NNH8?=
 =?us-ascii?Q?2j7e3Hg3dRRtgfy0+I6R/YQ9WsLARbxfIr2KtQaw5Ws0j6eUzou3uFoVMt7W?=
 =?us-ascii?Q?bNx7kYEakb79dMwtKcXPhlyec5723i+NT+9e0TG4BOrNRK9BqTH5RsNgMRGX?=
 =?us-ascii?Q?OYW+Sr+njuZ9nMWJ/uekttx1lLtpqNtapxhWWj74ln/BmyT7Cgw/u+5XDqZi?=
 =?us-ascii?Q?JYf+R45vDL1brXw2AQDWLDDfDxlfcW8MvZBX73Nn0vMAnB5gFAquyM0bp9yh?=
 =?us-ascii?Q?IdDfS85JiZ6Kg5NKv982faBbcWQj47D14bqlGuOJ6ThdCHt5SmEy3TpYFrof?=
 =?us-ascii?Q?BTKbjbortpIBQhvXoHSS2XRROufbXEjeMAxNcA0bwxVgFLW47jm34CsXd0IQ?=
 =?us-ascii?Q?yElvm4FBka+Apt2sRzjmHBDKNEvgprMuJUbAPV3rDTEu/IvX58zpup4KhLV+?=
 =?us-ascii?Q?JNckZh6/avi7UH0e/i2jE3fxb1rQLJJGXfnIl94mZkr8fOMOPs+w1tLzjc8H?=
 =?us-ascii?Q?ahIQL57O3ZPmYoOoFOoa/vZ3YJdPaRrSV9fthdsjHWwXgdy/m/HfqDXneL92?=
 =?us-ascii?Q?nJMCjkfDla4fuEGzx9Wd2nKwuniVJE37i6NIL05NKsnjt6A0b5xxFKAch1Cr?=
 =?us-ascii?Q?bYAWxEeQBFbtU6e0vz2salQcLOmWos5sln1C7awteGiJD81B9u9jMA0ucVwz?=
 =?us-ascii?Q?Dy/vtWkLM/9Fu5utRGrYf9aetQTv8HU9BwarBjNfqhuQRZIvDMJScxJrPYHj?=
 =?us-ascii?Q?oGhROZg4Ze/usvPF/1y42q5LusHohNwQ9ZWTdHKDrjOT7FW0EDuYln7HZqQx?=
 =?us-ascii?Q?GuwS4hl3n1dqtEY8kVZRm9gOTKjKroUamqSYmaGYi2P/E0gHJwz/cvgRCG4A?=
 =?us-ascii?Q?4yHLwGZ06TAY0dmnHUpqwt9LYfK8+dbhoGtsLYxepD+GRX/4oH/TAIBKQ9F5?=
 =?us-ascii?Q?zJ5jQ4wsd9yaEtlcMLjqgKEpC+5thCSW8NxzozFm8+6PxFJNsh9+ijdi5LNJ?=
 =?us-ascii?Q?X94im9dV74dlebI10KLEpo7FwzPhzi8Zl+dtcRQ66Ljg+dakpXQg65Xwj61Q?=
 =?us-ascii?Q?t31MuGmBReLVZxr7VA4ImbD84KBl92pT5vdrZGXDSXADcv4rE43bBx8G6rSb?=
 =?us-ascii?Q?J81jp3dbPIjn4qvVI+B9vowwOwRVJvjZ3mgERSDjJOXIWee2pQz7f+uJkNqf?=
 =?us-ascii?Q?rnkokGxCDYdkDdZ5NFZOrQKuGD2aNpGH/sShH00s8RywkrFCFcIXih7a0l1N?=
 =?us-ascii?Q?gpGBIGVRcAm84YXIW496vd5VB34kyiLPfB9UTyVzhARysRk+dXY/vdcji0Ek?=
 =?us-ascii?Q?TApmsCV/ObCIHv4F/qOgomCIFrHI/EI/jirdrgZMGVDWjrPdb+xcc0ttot8b?=
 =?us-ascii?Q?C6LW2XcLdYQPA1PdENkJOxhBX/IyBiSKQJfC57KIS+Zb557zC7DBSpMuW55c?=
 =?us-ascii?Q?gYWls7OGqXLu9Jq1xOR/kKO/DNi1DA4T1MMPqfy6kex9jmV0zwKbRQ2hdDsa?=
 =?us-ascii?Q?jNYJF2ijG5z+0HBU6SuwCtTZTwOw3r8CCfAZMwsH2wQCOUWHP6VQ8zKYawji?=
 =?us-ascii?Q?txKHfO46pS2YjoLAESgW0W5B5guIeZ9PyDAkFvd9YQNJBWEOQ4pnsVJB13+u?=
 =?us-ascii?Q?uM7dVxwZotn+o1URxZEd7DnFP7/haROw52hdVkIiZPraaK5kIo/k8TVbjN/s?=
 =?us-ascii?Q?7uXRVyf2SQ4p/h97y4mqaF0PCtE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb952bd6-11c1-45e7-41fa-08d9a3a9b7e2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 17:52:38.0361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slHHeeVkR/UT6ebYllvlILPmCAs/rviCBvP59l+odk9zPJHLYxRGwyLlbDs24UHTipI+CqcGkADREcwgPvVl7x+Pc97cxrMENvMTdPkJwek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077
Received-SPF: pass client-ip=40.107.15.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

The following changes since commit 2b22e7540d6ab4efe82d442363e3fc900cea6584:

  Merge tag 'm68k-for-6.2-pull-request' of git://github.com/vivier/qemu-m68k into staging (2021-11-09 13:16:56 +0100)

are available in the Git repository at:

  https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-jobs-2021-11-09

for you to fetch changes up to 1084159b31015e003946d199cbfecaec282e0eb2:

  qapi: deprecate drive-backup (2021-11-09 18:21:19 +0100)

----------------------------------------------------------------
qmp: deprecate drive-backup (use blockdev-backup instead)

----------------------------------------------------------------
Vladimir Sementsov-Ogievskiy (3):
      docs/block-replication: use blockdev-backup
      docs/interop/bitmaps: use blockdev-backup
      qapi: deprecate drive-backup

 docs/about/deprecated.rst              |  11 ++
 docs/block-replication.txt             |   4 +-
 docs/interop/bitmaps.rst               | 285 ++++++++++++++++++++++++++++---------
 docs/interop/live-block-operations.rst |  47 +++---
 qapi/block-core.json                   |   5 +-
 qapi/transaction.json                  |   6 +-
 6 files changed, 268 insertions(+), 90 deletions(-)

-- 
2.31.1


