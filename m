Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF5B33786A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:47:28 +0100 (CET)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNX5-0004cy-D3
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:47:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKN2R-0003Zl-VY; Thu, 11 Mar 2021 10:15:48 -0500
Received: from mail-eopbgr80115.outbound.protection.outlook.com
 ([40.107.8.115]:13537 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKN2N-0001X4-Bt; Thu, 11 Mar 2021 10:15:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kd7noQof1Hkfg2dYzU1SCYRTQI/mxfoOa21wS8r15oH2vuoRQHQ8gv+5ujVZkRdP4PirdZBM7lvm6UsKHopnwwvpGIGNFwDmt+cTuM5A39msPzKe4O/LoH18WFeNBK3ugV7i16AZZJqYHEZHwq+EQ1dlqpWYw2ftuMfYwWB5lnCjj9Qia+/gzaI7UHUsnFPq4RvUW9bBDpAA0hPHS+w4lzAICbY0aJ6MYfp6rkdHaHtwDOCcc90xrtdG++qdanLg5kdb0uiRmozR8Z1ygBoaABNbjROSfWS8tJ/ZWWD8bb2BCz38iUtIt6/IU53yAD0tBUswXAggyyHAJDUvSLZkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxIBpIHLQ2JrrzMWnpFh75+Eta7ENSFtwS/pWjDptkE=;
 b=XnKM9CFZAEOldPt9IiryTWfqKkuWnonm8puGQAQlbq4gNaITrm94z/fEAaVLIM4kjtN/BPrW1NgMU48uqYpmNvlB6NJZS0NxG5D1v9W4FU9pAzIUoPg84/8M3bGzG1FByfDjZVPu3ClTsyLwaon6EWBpg9Ml8ChTm2Lsc9I2weUk6xCiLns/o/ayuCUUJ7e+ON50Tex+8UdqT8psjqm6w4w7AJJGWSbGLSwHieo8m9ado+IStMYURyp/WTwoWSfb5+2lqj3m70F4OpHGjnpZhZ5qAsx6ULmD9e4B+M+zQU+XUOXpI8FNtOSZKqIj5reFBGQDMvXnbEtqpR5lTUJwcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxIBpIHLQ2JrrzMWnpFh75+Eta7ENSFtwS/pWjDptkE=;
 b=v5fXjn5gQ9a0Bk2yjatKB3Qz50X6z1mSITwz4DiIeeyUprzP7LSuEN3n1fovkF0q7gKmxrzsbinKb3hsibR9MXO6HLT/kEd8CxaU1ghf/7G1MAiF5iQu6opJPfRM6Xsh55liTKX7+In5Vgpzoc5zeLHMgGUpq4gl/qbua4yA57A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4407.eurprd08.prod.outlook.com (2603:10a6:20b:bd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Thu, 11 Mar
 2021 15:15:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 15:15:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH RFC 0/3] block: drop inherits_from
Date: Thu, 11 Mar 2021 18:15:02 +0300
Message-Id: <20210311151505.206534-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0247.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0247.eurprd05.prod.outlook.com (2603:10a6:3:fb::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 15:15:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b63e126b-791d-484e-0fbf-08d8e4a08698
X-MS-TrafficTypeDiagnostic: AM6PR08MB4407:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB440726B5DEBF79A1D34360CEC1909@AM6PR08MB4407.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: um2p2tVadPR8snyp1N//18MHAdRgrVLlnU+6i0QRjUwCqVILSmLejjfB8AQvOAMQhDxmj6m13C9U+sKvuTTvaw0X+4INOUCK8Wy9qIF5TA1YrCapKdr14L8yP/zcoYdfyhskAUVRgyA5OoOCm2BAA/uf1B0MCOxVEsSXrodpeMct0YCZ7f1zl1Qt5PWhUfB6pUPcO5WHcTXCpj1hAx7AXRkEi4pZoxZq742DDXyBC0LufpXZOIrg9updh6UoZFxf5xDjgoriLbPi2umwzsPmSsOD+FHYaU5UFGoMfIF80TpP9HvGqR2rQoZ8WcNe/Qwwcs9dRNimG/cccKr1hNjhKxLkZWKHOw9RQaZpboSQ19zkWkvLvfiQ/9867W8OFcZOUuhnc4lIsWNqLN03LWnVwMLPLLb72GG2aprS/Sw1eRQQFeFzlLaZCmhhhpi8/eQggCP9lcTYPtIFSStuy5bv1482HUQFC68nxWw9ub74/x+9TeQ9VYso5pySJTr3DMDo3m2TGS7O/uNiazQDOZ8eJ+bNT+JmY9GKky1qmHfw4h1pDvjL+yz+QMnqXRVJNNqfMk0I4C1VmGPeO15NzP2GWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39830400003)(346002)(136003)(376002)(6512007)(4326008)(6506007)(16526019)(36756003)(478600001)(6486002)(107886003)(2616005)(956004)(8936002)(1076003)(6666004)(83380400001)(2906002)(316002)(66946007)(66476007)(26005)(69590400012)(8676002)(66556008)(186003)(52116002)(5660300002)(6916009)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?u5X8pO99BFCchM4sszJGdMPECZGa7YLidOr5ZJiKgzD1k1wneLoN6K7oXa/6?=
 =?us-ascii?Q?S7NnFCAA+Kx7/tPbYU0KuW2QQhuiV5wgwjTjVPv5pT1OYVFPbr0+kxEHVoW5?=
 =?us-ascii?Q?Rd2kCl11uCDIzJCgKY0XdeF1TZzSZtyamIzlYTQw8aj6/D1dODGgV3bmqBCX?=
 =?us-ascii?Q?TeFcgIT0UgKA123qi+gkVWTFzXZ6Gbr4bSQh5uCpmBcqiocqokwtAXoWq1py?=
 =?us-ascii?Q?3ELigYlZej8fuaBcw7ICslUquTQD/v7mgF1DXlPN8FtEyv1VJQAGKtkxp4td?=
 =?us-ascii?Q?1cGnyz2Mi76O9N1c3hQatThRXHRjERfdezmqxwL5P3AfHJc6sG8z+zeXSQcN?=
 =?us-ascii?Q?0/0BTg9e2VxgozuPGfOc8FVnYuevaKacezHpdg8oh2Ym9dLUfzkBHgy9IUti?=
 =?us-ascii?Q?cm2Pobi8uFmZgE5M4WT3DRGDPZYdqVKeLCb4eBB888RHKEzhEhYbirl9/m2I?=
 =?us-ascii?Q?PkoUsqOqBHxkRYvtbZ1xm6PrjsjS1+a95X3UVQ1CbAtSGJdftbVs/OCnRjws?=
 =?us-ascii?Q?YwYa8VahSikb7eitE4PkTwOAZSY7nurwPqrROqarKuWoLLKymwiudTZpWXXF?=
 =?us-ascii?Q?Jteh6PCefVcUngjBLIMtuOOfWIULNj5w97xX/fQYc6PSTqV7fPc2fW4Hjexe?=
 =?us-ascii?Q?0kWlHPjG0GED05LrIyrUMPzEfNYd6mG/xjwfRVqTw/PIb5erlV8mbNuqK50M?=
 =?us-ascii?Q?d958IaOUpakEBvdEH/MdXXD+7TlxR5O5RYXzthoGtC8W2AuJHsfvr1oc74jv?=
 =?us-ascii?Q?RcM7+iJE57kslEHZzrdvGNIFz1T9r7y7EJk2vl54xFYMl+z2vBYmu22B4MZl?=
 =?us-ascii?Q?vgx5qC0wt+PEjqGV17WFqAqQxHuz/piJs29YwDlhzJ+03VYR6rUReBv5F2TJ?=
 =?us-ascii?Q?8MpyGhW5bOJLcVFk4FmWhAol6tacISroksBIesjb5iOaV46osVPmdAwBIV+f?=
 =?us-ascii?Q?R/HtFmrDVJpcEfJNRp+nIv4nsdm7RfTNCbUoCxTvIpV/FKSaQMIra3sM02ke?=
 =?us-ascii?Q?RzeH/kY8vJAXHqgSyhfRhl01mtmXVGM+8uEQjX3HkMoXk8SISFMS87J9Bn0x?=
 =?us-ascii?Q?3l1RXozFGh/TNlEoLsY130k9wjcxyZtVPgO36tN1XT3zA+F1xK9pDYJnL59H?=
 =?us-ascii?Q?TXdy1mI4mpKMoAijX+tIzj6iiBJ/IScsAFW0BFxvgbmCmvfXqxbO2+9exH5E?=
 =?us-ascii?Q?EyL1BFFVOzd5odpxC3O/4trpJBDmRDQtFyDtd2bvXDB/fhw3WlJuQdoSFeFe?=
 =?us-ascii?Q?HGR8En4hH4nu6Cryr63SfcojhxfV3ugd+OlRP+dmSZliJMLfmalBZlP8GKKT?=
 =?us-ascii?Q?hcKETRuYMVoVJHFf48Tl9mS9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63e126b-791d-484e-0fbf-08d8e4a08698
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 15:15:37.9003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDJf9a5ahGQCj45J2uyPFNPBxRgPP5EzAtGuZxLY9dR6Z8PJ3/BFFH4YAbhC7H86gqyfyDMiUKP7M4Qa9NNDrUedl8omVxklfcwEp6smIgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4407
Received-SPF: pass client-ip=40.107.8.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

I now work on v3 for "block: update graph permissions update", and I'm at "[PATCH v2 28/36] block: add bdrv_set_backing_noperm() transaction action".

So, the problem is we should handle inherits_from carefully, and most probably it should be updated in bdrv_replace_child_noperm().. And then, bdrv_replace_child_noperm will become a transaction action, which should store old inherits_from to the transaction state for possible rollback.. Or something like this, I didn't try yet. I just thought, may be we can just drop inherits_from?

I decided to learn the thing a bit, and found that the only usage of inherits_from is to limit reopen process. When adding bs to reopen_queue we do add its children recursively, but only those which inherits from the bs.

That works so starting from

commit 67251a311371c4d22e803f151f47fe817175b6c3
Author: Kevin Wolf <kwolf@redhat.com>
Date:   Thu Apr 9 18:54:04 2015 +0200

    block: Fix reopen flag inheritance


The commit made two things:

1. reopen recursively all* children, not only .file. That's OK.

2. * : not all, but only that inherits_from bs.

[2] Means that we don't reopen some implicitely created children.. And, I want to ask, why?

For me it seems that if we have reopen process.. And bs involved. And it has a child.. And child role defines how that child should inherit options.. Why not to just inherit them?


I decided to check iotests with dropped inherits_from feature.

For ./check -qcow2 on tmpfs only three failed: 30, 245, 258, not bad!

30 and 258 are easily fixed by assuming that if filter driver don't have .bdrv_reopen_prepare handler, it default to noop.

For 245 behavior changes in some places but it seems correct to me. And we have to fix commit job to keep reference to its filter node, otherwise we crash when remove the backing link from node to commit-top-filter of underlying commit job, which is allowed now.


I started this text as a letter, but finally I've fixed problems in 245 and decided to send and RFC series. Probably I miss some core sense of inherits_from, so that's an RFC.. So, what do you think?


Vladimir Sementsov-Ogievskiy (3):
  block/commit: keep reference on commit_top_bs
  block: allow filters to be reopened without .bdrv_reopen_prepare
  block: drop inherits_from logic

 include/block/block_int.h  |  4 --
 block.c                    | 95 ++++++--------------------------------
 block/commit.c             |  8 ++--
 tests/qemu-iotests/245     | 36 +++++++++------
 tests/qemu-iotests/245.out |  8 +++-
 5 files changed, 47 insertions(+), 104 deletions(-)

-- 
2.29.2


