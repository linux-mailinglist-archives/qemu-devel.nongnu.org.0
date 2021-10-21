Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640AA435ED9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:17:29 +0200 (CEST)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdV8a-0005Ys-GV
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mdV4F-0001SH-MJ; Thu, 21 Oct 2021 06:12:59 -0400
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:9813 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mdV4A-0004tm-K2; Thu, 21 Oct 2021 06:12:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TU9kOYwbSbUyycqvXbFxRHJSPPyqnq4TbTw+kOlFiXJllPzFLsYB6ZYwYPP/hJhvpiKQ5QbreUFEFes4aB7n8rDgkcQ5FtUKpnx6428g4jEatGy8Jlm8fPjPvkiDu3f8i/NJPcysQvYJxfJM6dAuQuDot+UHTx00QvZr9lHRaYlDHEClWGY8UDSkhRrhARaA0Kxz1QvrZXZ3wBBzuejztsLrOYc6hL7/hapiJEB0MxpCi3rVgfu6GthYjc19S75fpcpwRnxefTQYnOoKtO/nUkmk6+x2YW2jLckaWUue7iBf6UQju4Zmlbd7qLxN7Sw3ZDbmEtURT3QdSTPvFrzzeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWHh45/RxxgptOn2PRdEUKfBpuZl9+MgzL34bnYDOHc=;
 b=XVDo280sQOQLjzb8agjL7M3fkYuoBbKUJVzmrcq1ksoIV/IB6o8xbFOv8g9V/5SXTtyfBpC5XTwRJklZUrYGZPkTpr+poDVaI/o7gxkh4nIvmOWkABlVLWqjeEouzfy9Jx6UJIA1MW0Om+TPh+NoXWKaeNkVE8qjjjsuVPI6pZBMG3JdKi8h5Pb9jWZKFIomIrOkIOO5VfPE3xMAiey3OeOH+PqzO0gH+FwMbfp2HVL5M1doUPkH0vL2t37RsC/ylPFxvLns50svj2qOiaqMWItjhU4IuxTYpQ1sqZusl47LSeT8lIoF5pebGpv4I6obyDrmJW2DPIKRMgdSS8o2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWHh45/RxxgptOn2PRdEUKfBpuZl9+MgzL34bnYDOHc=;
 b=AwqYyCj3/qXVMMaKQxiUWYxADhYfEAJ9CvRu1BPedwAJeZbVOToTmNDZ6VX14/74Mgd91AflY5wA6g4ZEWEPZXblHqeY68IXcXD13tdrUd+fdW8S9gbwIueZPPAiUPsavf3eUr/eX7GGcYzPKpkhhlidi/NKMFxceBzeHEzNRYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 10:12:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4608.018; Thu, 21 Oct 2021
 10:12:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 nsoffer@redhat.com, eblake@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 0/4] qemu-img compare --stat
Date: Thu, 21 Oct 2021 12:12:32 +0200
Message-Id: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0080.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS8PR04CA0080.eurprd04.prod.outlook.com (2603:10a6:20b:313::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Thu, 21 Oct 2021 10:12:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67a32fe8-4d91-4d92-3711-08d9947b5482
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-Microsoft-Antispam-PRVS: <AM6PR08MB50784157BB3E3124B4E889EAC1BF9@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nc17fOtFW8myAaxWfQvtblXKGSDUmjIBfccnAPGEg9+aJys/XRRUXYfBWFVRSEspygi08FGA2hZxopeDj9lCQQeU5Tv03M9JvA3cgPGcT4c/EjWpXZDcEXSS4II0nsvZt8zghepvQxDoy9QuRTYKM9Nmwvni9rRQ2Xg9boFZqhdb8vprwSvBYYiQ7KFrgs46cVyNk0iTRxZ9Y6jGbKOgt5+396ASusRYxEk82Evp7kNagZK+1yZL88tjJ3hrKyy5ialPre/FchNIzl1/q7+7cc+Ecg9/VwN3RUHozXdDM/Kl9S/FIPv3S6JtsjjQ+HLwmVMHl1OVPmIAWUm/lb5CtQ1X57dTUmV37D1XA8vNwdUO/nZXOizsTIBiIP7j3WbHtd93D63oMvlaeB/rsdG8/r/s6C3gspSIX1MKUADU0tUxOHwWmnA2gh/CumIePY4xm7L/jS2m2NGUtueLG+ehSWFosJ3/gU3suNWGQm9vJx+B86g/rhho7bHBU2R2WLH9mkwreRw8uzws/2pB5Jd+aCMgzi3OvbqPv0m7YOP1vN8Y/1CS4swgCfbMvsFQOzYfN0S+NHyzJELcur1/jtLQIUEB40aTrcI0EX/MOZE1r9Di4Z9U+Lot2vcnEjANsbAK01a12CCf7X2y0Fccp8NEg+WAb+Eq80skaKiTGLl7e1Zga+twYEU1Qv1wFncdoKMDg72WgnaoWwzXVOS6H67tvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(107886003)(956004)(66556008)(508600001)(83380400001)(66476007)(6486002)(66946007)(4326008)(86362001)(6512007)(6666004)(6506007)(52116002)(36756003)(316002)(5660300002)(8676002)(186003)(38100700002)(1076003)(2616005)(26005)(38350700002)(6916009)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3vEmtaOd297T7v4P9UWtireRigHmIv398Rmue0CAf+6sNxC3IA1eVK/TnmiY?=
 =?us-ascii?Q?icqTwknM8KI/e/bYoXaqkYEbqDB1/xAcr5aWwDm66XHp9vxjxG8OOL1I4Eww?=
 =?us-ascii?Q?+uYFbQaCrpzwVnGz94j4lv8FUV6hGSTkTMQWBqFmJzdQr6ugXf3l5ZbWhyv2?=
 =?us-ascii?Q?9KY9E1MgAIJFLqrahA9uWCwtpsHNdTiiSiiqB6spS0fNx3Ut41JPrAb7spg5?=
 =?us-ascii?Q?ocI15kiVlCz+GLVKey+VcxsTOpkZ++SjwjLFv5auCrmYd2RDfwxKktGuSt7D?=
 =?us-ascii?Q?0UrC07fLQk6M6i19hjF/trUj4Cw3SvJrwp8KYzpbrLO/7IGAWjZuryNibcvD?=
 =?us-ascii?Q?7SYxJq5+dWYqwpTRIM5ON84eBNiICdxQ2nsndrLPyRHzEwmFjbjRrUkXWs+N?=
 =?us-ascii?Q?ERnqd0SQ7EVxtInVceo3wYrVc96AVFTbPy4IPPCjR5vfXusRm6rVuH5aIZ4i?=
 =?us-ascii?Q?AtBAa9xiRzpHT5qb00KVqblAmINakGTdn77levpMxKhk9QTyPayDM6hi6N4B?=
 =?us-ascii?Q?CY7fc519kx+gSSMhFgKWdpLgAXYGDd4rHmjZUpPZu7ANzuumgn2b12ExH6pr?=
 =?us-ascii?Q?JAaVYhwED5rviufdYCXe32FTcZOH8WsNHJsCfloFAAnwg0qGfpRR0T4bNqeC?=
 =?us-ascii?Q?EKoFPt7mVN2F01NfNCNr2YuNXk14Nvq0Fha6ekx4XfVmTMzqyMnM33+y8b4H?=
 =?us-ascii?Q?DPN2xRDFM2skCNywMsNF1t2dblY2b35pubRBLgIdQqQkICLK3bmGBkZyiHV0?=
 =?us-ascii?Q?Yx7GOnCE75klzLJKGbqGcjkrde/UGf34mv347lM40vFdGmZdMrxofvSprsrF?=
 =?us-ascii?Q?GYHUW8vKm/N+Dxu1O/eyWrSlXusiR62vMsPYd1IJ1zy42s4MqFS7Ym1qpFDu?=
 =?us-ascii?Q?/7VBdT8Vyrnr6u5p5BGsDrONE21PTIIJ7Z7OsjVq3nfoXwmLl+P1dzwojyuT?=
 =?us-ascii?Q?PGebCUsKF1aDnaBPhxwR45oOmIfYC8f2H6QW87Ab2tp/7C2DkYsPD00m0lHy?=
 =?us-ascii?Q?VN2mxaHksz6LBqlq+VRgipSBa+g++OgDm0YeobRYVrhr2clxgUBcp+VlaZ5u?=
 =?us-ascii?Q?yUufemMEVv9iT/I4+dEtU/EQXOdfCsvqKk1FVJs1S2pLPuETYpghzrSUdtw4?=
 =?us-ascii?Q?mnX8Q6TYnQJ99J9E3YYAM6L5NSY2lq4RbOvnNxj8yg/jqzyFfATkvp7lGY5l?=
 =?us-ascii?Q?7NP13VCmxdcQOLyr8lrkjt4OJw9UvphZyP5hUd0dYwziWnrgsJJTyeV2trwm?=
 =?us-ascii?Q?xQ6r+pfIxnxr6RYFA39heFWwwQUPbevmBlh9wGJ06c1hNQ9Stwgmar1n+9xC?=
 =?us-ascii?Q?wHka1D3lkokGj/wF5KHD4CUtQVvAJp7Xmaeao1DP/uui073Y7w8yC7gJJC0R?=
 =?us-ascii?Q?zOa+KzPCyfnRKOirXQoNCW60/IlcxHcLUYHHQDt+aAAFqYGGdJs+dtfgkv8N?=
 =?us-ascii?Q?yi52wUglwpoB3qwyMnm/iAdE/LUi0T9s?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a32fe8-4d91-4d92-3711-08d9947b5482
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 10:12:47.0917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsementsov@virtuozzo.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.21.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Hi all!

v2: allow using --shallow without --stat

Recently we faced the following task:

Customer comes and say: incremental backup images are too fat. Does you
incremental backup works correct?

What to answer? We should check something. At least check that
incremental images doesn't store same data twice. And we don't have a
tool for it. I just wrote a simple python script to compare raw files
cluster-by-cluster. Then we've mounted the qcow2 images with help of
qemu-nbd, the resulting /dev/nbd* were compared and we proved that
incremental backups don't store same data.

But that leads to idea that some kind of that script would be good to
have at hand.

So, here is a new option for qemu-img compare, that is a lot more
powerful and effective than original script, and allows to compare and
calculate statistics, i.e. how many clusters differs, how many
clusters changed from unallocated to data, and so on.

For examples of output look at the test in patch 04.

Vladimir Sementsov-Ogievskiy (4):
  qemu-img: implement compare --stat
  qemu-img: make --block-size optional for compare --stat
  qemu-img: add --shallow option for qemu-img compare
  iotests: add qemu-img-compare-stat test

 docs/tools/qemu-img.rst                       |  30 +-
 qemu-img.c                                    | 269 +++++++++++++++++-
 qemu-img-cmds.hx                              |   4 +-
 .../qemu-iotests/tests/qemu-img-compare-stat  |  88 ++++++
 .../tests/qemu-img-compare-stat.out           | 106 +++++++
 5 files changed, 479 insertions(+), 18 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/qemu-img-compare-stat
 create mode 100644 tests/qemu-iotests/tests/qemu-img-compare-stat.out

-- 
2.31.1


