Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05FA43DEF5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:34:14 +0200 (CEST)
Received: from localhost ([::1]:58828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg2jd-0007zo-Tt
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mg2ah-0006tM-5P; Thu, 28 Oct 2021 06:24:59 -0400
Received: from mail-vi1eur05on2139.outbound.protection.outlook.com
 ([40.107.21.139]:54305 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mg2ae-00020f-Lx; Thu, 28 Oct 2021 06:24:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Td+84w90TpyDeUB8UjAzOGLD0R5IN5FaUa0i585g1FWqNJkU7P60TZ0KOALftoghd04VDUr7yGU3v+WZqzSI2QgFWDHZTHOH4j8IXAQMhHp0mkxbYZ7FL4NKIj4+4/jnOkINdbWpObwZtFdRCqxwuTdZHQMPUyLwxvP2ecSgB3KXlMIwGU69dDywEunTWm03jZdWW8Tr+Q35zvHr+sMFTNAkG3k86IBRATz4fb/8UDmr6fGS48pF+4sonU8vnFZ+3Jr5u+rAZkorWn1vjBhql2IBXXsUHc+bUAc58aZUA9Mwe7aqrpx3ABUPZXCOoJoy6j7jLd+ySbt/O6pfNF2B3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOttWXYUN3Rc+M87P98lwp8jNScloWUBVXdMvbAHfNI=;
 b=jvJVjvQ9tbD58Z2dGTVUvPcTgjM3NFkqfg7VbQq3s0YWb/t4wUW7iKolh4VdAysMHdqm60yU4lbgdg3mITJ+Mwg2cRfaGvghYZWRUYFd5rF73LqmBkA+Abga4+5n/DKQxn2/GWdO/X/cf4LAN/lJCpSlnXJqU4J70pDCK56j0NWMB3OEQGQAQjYLdse3M6j2LSGcR0PkS6CX5SjXVTz1KZfZi1B4hhZEwBYki/d+zyGXEoTjnzCyskTDHP/4TQ2NuwnPtW1D2x2+9cUGk/+391vWOptED/pAaOb/rrBDKIbRUz+ndMLdGJcbTzLobrqaPDeUiR3ZNmCJrIV+nUmmpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOttWXYUN3Rc+M87P98lwp8jNScloWUBVXdMvbAHfNI=;
 b=CN5szFK98Limzf99bX92rvOdPxjYpkJ0rDzTU8HhkgFNbSPwOK1hSPxFNjJgjbhd+mDoBtF6EEUX+BEIOnE+BD1Dz+wmIVMa+QeNgE1p7vtSzwY8qdPsHTslvNwdOJOYCZlhknVWnm5G+17E+UPuLzClYLrNZHu2vJHNtOVxtdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4535.eurprd08.prod.outlook.com (2603:10a6:20b:74::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Thu, 28 Oct
 2021 10:24:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 10:24:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 nsoffer@redhat.com, eblake@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 0/4] qemu-img compare --stat
Date: Thu, 28 Oct 2021 12:24:37 +0200
Message-Id: <20211028102441.1878668-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0701CA0053.eurprd07.prod.outlook.com
 (2603:10a6:203:2::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM5PR0701CA0053.eurprd07.prod.outlook.com (2603:10a6:203:2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Thu, 28 Oct 2021 10:24:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 670e773d-8b69-4abd-76cb-08d999fd2dbc
X-MS-TrafficTypeDiagnostic: AM6PR08MB4535:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4535ADDA7794484AA5DBF9DBC1869@AM6PR08MB4535.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: su8UypD5k0YEGFbtzsp/kXoW15Ki3zg1LufVn6YtuZZ0wNC8hJuXg5WdWljT6axEkx6iJ5RaDZmyr2I9a+IWGnP+kXWBG05twqLr/3eO6rCd7GQf2nuvc5G9ynZ1vYWP0dYjRaoeOjLTRB8yZckxPi7gsEOkAQBy5f8HJkHKRQoEqABkzOO4Ki9vi9BWuhjpAcJoWszwuSQ2zqwmcCw7np4nBn89TZtdyoFnSd89sreuA+Y7UGLD7bjdlwSpC3Cj33YnMtGoXdMVWWifz6TYobxhIl6G86wtVL3lQzjSxZOYin8c1VBtsMaxHnUs9EkvqJm/2/lcwAzvspwTQ6gJlGmIGpIEPREqSVYKCppJF25Ij3AHyW34nNZbPpJhIMQio2mrhCPjLG0xe7JjXhdQYau8O2MHzDul6fOic2T3GOk8mMkloHQoNdjSpKlOQJfIxEwTN8cjZX+UdRMFrMa4BA8c525WawPo143OmG+/0DYYKrt/6+ujXoZAYJV/r/tqQZI3iAHlrkqoJEYKju5wymqw2suiZkTJWFNTCacHkuPm3ji6/9r1VyPecTR3Mk8Hb/l5q4ZhPaQc3VHyMUXyKVOG42hVZOykS+bL/H8zFq/a6wSZOwSx54aKSLiacBiYKB7XREeBnvha5IEm5IvzXMo9FtDMvkQuVcDPK4bQsSK5JxpUbRuBXOjg/SALhHbP/bMZt5gCnXAaKfiIuni64Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(508600001)(66476007)(66946007)(52116002)(83380400001)(107886003)(66556008)(6486002)(8936002)(316002)(36756003)(6512007)(5660300002)(86362001)(186003)(38350700002)(38100700002)(4326008)(26005)(956004)(2616005)(6916009)(2906002)(8676002)(1076003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O0WosD01UriK7VKklKkogbnwTN+olwMNWSVqa7SfdjBxcpMmHYEuDsSLcuu5?=
 =?us-ascii?Q?P5KE9tTHbORAF9N2JqPapcChOMHVkiDZQE08Qfmr6OyQuexBsQaZQptvsnC/?=
 =?us-ascii?Q?rpPO69IXitLZqiRhoPyG5vqnW/uEEAlV5zR6SUCeYp6xuJsS/Lqs0GCioaEa?=
 =?us-ascii?Q?SuQLTIqSZSGOtFvLTCNKNhntFpMZp+Xiy/15QaQgmaFrT82/qfZ4TjPnQqlt?=
 =?us-ascii?Q?NUaPgsGunglVFlLpwCC1eq1LRfCk90dwH0SnKb8cKepGqv7u6zie29VBzrTe?=
 =?us-ascii?Q?YZvuw9OWQGzpxVSgnnFjko/yO6SDJrKcgVydzCKuBPcNgX+lUNeRUpBodFbT?=
 =?us-ascii?Q?n+XDcORY+/2AL4MREkYuPaXQZe4rVFtQkD2CbgiT6wtuDNMIQbUswOOf4tyx?=
 =?us-ascii?Q?L+RDrm2BVfcn2kmWmIGHm47MfhAg4ytanUfJTNVdk3e2HgW4pYFT6qsP2OQI?=
 =?us-ascii?Q?EGSzKYwo0erP8Au4TqHjeusiX4DCZQYoPJ2PVbIF6YbvLHkk58jaCzQzwv3C?=
 =?us-ascii?Q?FQpPkSY2WkoJez3AA5QF+rnpsWJ2paAOx2/Emmm/RGkf3tJ461S85EeTI6Uf?=
 =?us-ascii?Q?HcAWUEiYXnkj37VEtiH5jSnxnuxCWvGKSgkvaJGrIBvc2XCdUXNjq+S0MKDO?=
 =?us-ascii?Q?/typMwi4dK+QBaZbaH90+NHop6jvnhF78bAD6W1wvz3wsZrYs2la3fKtlVZy?=
 =?us-ascii?Q?y6zmAYOaz/3Pcoyc449XXAVLGaTBvomvtu/WmKEfsoTWPuGOqxEnap4vbqvq?=
 =?us-ascii?Q?+QHqLx49jikxqUEkePtYvyWbeAotKcIyEKvUQbg5N3jqlzO1JTZ0FW+vur3U?=
 =?us-ascii?Q?R1UbgtOwOc2j7JrOq327AF1+Hj02IBlLPynt+mqGJAeNAu/VSsn9p5wpzh4F?=
 =?us-ascii?Q?IXTQVQROWSejP+g9/IfN1mMFeSxufwlp3ZkxSAL81SiEdnbVpaPe/nPWR1F2?=
 =?us-ascii?Q?as5QN4d1QmxbYGiHfDxwLtBU2ieJlf4L17oY201wxGarAwUscizHWLx3HL5n?=
 =?us-ascii?Q?g/b6HFiuFK/ZveIWyBAmqUvPHej3B6TA+I3F8MfIN9jjffrzJPjWXt2/yVx2?=
 =?us-ascii?Q?nJsqVsuSbdIY+DDzV5xIMqo4XCmOhU1gVjJKbBtgvuG18Sc0ET3wa9QjdaJa?=
 =?us-ascii?Q?PvUxRPHelmV0FBRAFffOGwjti/z8jTylt+92un9eJ500Brdpf9GU+sFw/pUW?=
 =?us-ascii?Q?9oyVuqXgFl1RcXYDiCs45PamsYTTckx6W+o9rQFO79AWRAjLLtvKt7K6n9nO?=
 =?us-ascii?Q?JfYnVg8c3lGBdVZpixyRn9Wxu/tmCnBJQMqUOv5jxyeWPzlD0Ijo2+B3tMnY?=
 =?us-ascii?Q?Q35epPmo4xFZNQxiY7LY7ekbSIVC1kRmflvrxk6csTOc90LZeGXqIcRHY5ps?=
 =?us-ascii?Q?6NUqxWBw8QHBiJ7wrnJ8cypoN9NHPzeYY0MVJSq6nxy4hq1ZV1dMtbRIOO9A?=
 =?us-ascii?Q?jPAwoNCeBln5CKuogPtMxT30nWBJKNDmFhcg67isbOpY0sDZNOUaCcmYg4lK?=
 =?us-ascii?Q?/rh2rexLArjpEFFl0JbKfBgNMxqVC4wc+FNddKfU3P+dltvAewnKe+fMYl/x?=
 =?us-ascii?Q?h7TZislFNloMs4HpzGZxV+pNJNqSxvw/baOdzTzkBID4bKm8o3mBFUsaKbZ9?=
 =?us-ascii?Q?2FpYElXJ4cR9GQKn3HFRVIY6Jgy/zGVqaH4dhi3zi9GQCWVAnCQK7M81ZxzP?=
 =?us-ascii?Q?1pFL6w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670e773d-8b69-4abd-76cb-08d999fd2dbc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 10:24:52.4280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXnUGJrQTdGimXOyXoXbkA5nS0ZASS6CMExGBRSO5YtJN7/gh7YeVOu4U7Q24MBpU9FYyt9BO76GAI44AqkFtbP1zC2Bqc0KgWCF2UQ7fpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4535
Received-SPF: pass client-ip=40.107.21.139;
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

v3:
qemu-img: implement compare --stat
  fix wording
  fix option numbers
  allocate ImgCmpStat dynamically
  fix exit statuses
  restrict using strict mode together with --stat

qemu-img: make --block-size optional for compare --stat
  fix wording

qemu-img: add --shallow option for qemu-img compare
  fix option number(rebase on previous fix)
  add Hanna's r-b

iotests: add qemu-img-compare-stat test
  add Hanna's r-b
  s/Agenda/Key/ in test output

Vladimir Sementsov-Ogievskiy (4):
  qemu-img: implement compare --stat
  qemu-img: make --block-size optional for compare --stat
  qemu-img: add --shallow option for qemu-img compare
  iotests: add qemu-img-compare-stat test

 docs/tools/qemu-img.rst                       |  30 +-
 qemu-img.c                                    | 275 +++++++++++++++++-
 qemu-img-cmds.hx                              |   4 +-
 .../qemu-iotests/tests/qemu-img-compare-stat  |  88 ++++++
 .../tests/qemu-img-compare-stat.out           | 106 +++++++
 5 files changed, 485 insertions(+), 18 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/qemu-img-compare-stat
 create mode 100644 tests/qemu-iotests/tests/qemu-img-compare-stat.out

-- 
2.31.1


