Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FCF41C603
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:48:28 +0200 (CEST)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZwi-0005lj-1g
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVZjT-0008RY-7Y; Wed, 29 Sep 2021 09:34:47 -0400
Received: from mail-db8eur05on2139.outbound.protection.outlook.com
 ([40.107.20.139]:18880 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVZjQ-0008Cl-Vk; Wed, 29 Sep 2021 09:34:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAJdFqVm4Cv9c6wel1lzV3+DIuAYvIGWPRs913GBXgGo/gDxXWEBryPbrbzHjPPE6fWnFAiUh52f4ArOVXUS0bpCh3LhAa3QBoUfPxY9M8f7MIr8pJAAyEHKa3VIDgm7JfHcWb2p7pDUTOic67Sv7rkp0+NloBeIX0DERJIywfB6F5Ryh9Ynh7y59MW1dEIY38iCawo1ZsqzPwi6gu/quMdf0TNZE0QMWSYN3mNuRuxFpCy1u02i7Vjrj2mIdq8XL422c5lhPqQKtvtlyWPGq1/AmpM/L9XEbyVdA5lKbM4ZqFFJd+tONGMDB/dobBZCCrp3KVETGomLamYPBuMqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=tC8ISTtvcgwNpK0XA8LNHVYW74Fr+GZvHitw+TlATxM=;
 b=errhXYblkPqWh3WZH/FMSjlDjiNezx8wzHWxsycC4sdF6i4QOvGcTX8QbkwY+79TNfC3dXjb3Naoe727kQumBjNNa9V9N1Y2CT3ooPMhb/bg3P+L0xTmT+FT1RoZHJFBdjDKxVsNWRb992bigm8aHO4LmQYM9t3lpwS1HiusLQAOmtbStyepiJAILKLMoNUTiBJdcIoJf8dcv/hs9TxX/VMd9emw3Hjmkq09CS5tWqpn631fQGZMXwtCmTmoH6t+BCHCDDjWOHPc4d4ZLAkzq1GzMIRe6cvUNNL/8lswHVIZ40j4tAWFyC4fU/Dqt69AAA5y/psmt/PkJ2Q+OqMa2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tC8ISTtvcgwNpK0XA8LNHVYW74Fr+GZvHitw+TlATxM=;
 b=rVHPY2CZkTMcA8U6QP2ValunYJnsRty1QhLGnghwTPVbdH+enPNfjJOErX1EXKAB6OQ+y1Wdu6LiGKYX82AlzkMGzIHYBmZBVaxtDmEO1TpgfJWRiYQOL34KE3q+N6JR9H8zsJ6KFJXXr+ukkNmeYqQTpPgFw0cEEwDnnW0aXnQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4069.eurprd08.prod.outlook.com (2603:10a6:20b:af::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 13:34:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 13:34:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 0/4] qemu-img compare --stat
Date: Wed, 29 Sep 2021 16:34:23 +0300
Message-Id: <20210929133427.44923-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0102CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.227) by
 HE1PR0102CA0012.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 13:34:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 354ef50b-612d-48ee-6f6a-08d9834de36e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40691A201A721D9DD66253B9C1A99@AM6PR08MB4069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qw6QsainCc7g+SJMCCQSoTO0z1QZFEgPkh9kVtFtRo+BkfYjIO2jv+L93zaBIacD2YwPX1pQ3NaTbqYOGWJo902pnvd7hcT1ipYVfOS8k9u3KuRSDixx5E+Z3bQMFOB7KoLO50+jWG5YPh6O2NxsBBf73pQD3RPNR25mcvHlOhh2woAJjZgZvwJ8ifkQS8MEKlagBwDIMqSr1PEdK9w1OceroMG9HdD9IFgeHY6qyqCQCSZgoR+tnKh1BbU+8N2m7VyzWVVFgur+a4+RHFmNV8dJWbQL1LCySYNg4MaRCY6CGh4b2vk77Py4GLthsqOOBDnZrT7QcBC0I8LwpekNaZA3XaE4XyIQGYy/Ve5Ne7sXoExdJPns7NzR2n0EWej+CjPVHIXE8CG0pkRINe+qMbc2b/XkNDHf6JSzFSsm0URYfgtp601qfpNm7DfBfCCKMF5TTvk/iCxxcu4qp6WV/xktlcT7nb88wLmLFZZDYWOxAZPDj1JC0QSTnNA7gZ2bw9H3/XsnBwz5EHWx8hueVg8catvPJEIr0tlUEHrtWrfnKT1cOlxdbjfeczt5Qde91C/iEG/PI90Vu6PbPTQaSCo5fn81ut8icbQl+4blre7hkwW8b7Y+CrG9SQlYWpKevbUlT0NZiIWP5VktmvAEiFVGTCDBh95Xb0OwhSToog575rzodsp6wJgIiJcCTV07m4sTYQy7sTOJI76mUpsKaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(1076003)(36756003)(66556008)(5660300002)(66946007)(66476007)(86362001)(4326008)(2616005)(956004)(6666004)(6916009)(38350700002)(38100700002)(2906002)(186003)(316002)(6506007)(6486002)(8676002)(26005)(52116002)(107886003)(8936002)(6512007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?toLutgIt22p/5SdzF6Ok004BUQyK28ptpzkLe0WV3rm1rif5M92HIKfeuBB9?=
 =?us-ascii?Q?7eoJDCCgyRquWdiqAouQ/loDG1l34XmDs9zfaK12fKcoCNwiTMeOfhMtAP6m?=
 =?us-ascii?Q?JPnfWGoV62umpy53noJRlFT3ABRjms9Sh7wyZgxDb+hTd61M8uLvNEA8KPTg?=
 =?us-ascii?Q?AznqCpcVdkGz2oBx38srW3Xg/ri+lqP71NamspmoymE++2Ky8wTXjkrEwaPw?=
 =?us-ascii?Q?DfsbXrgcE95nEqOb4967JDIvnEjFlZ5MyZSEhKys/Xd1gr/gBmJW624QdIJ4?=
 =?us-ascii?Q?PN2qVZat2r+ZyEpx1BSTNbtSk5zJ2ns2SYbx61zm+5okB1VHYuXRaLJFwTKP?=
 =?us-ascii?Q?/jyIA+oR0VEzU5WedOEPhGTtb6LXosCGnLp6HfAZBv38P2rxoAOnkKuqQaeB?=
 =?us-ascii?Q?isaZ5E76GVheA2HcBdLjFsVZ3z8I683SGXKov0KuVniHhHnGCEI6oGRE2fwu?=
 =?us-ascii?Q?LOZXtXOKvC4GaaEW7nPG9x8s7JLrYdXUQ+a9h9hIgLqQkO7xWnKWUOMrIvyh?=
 =?us-ascii?Q?omIpyrmTOQN9NEaA4wg476CuGS9vck2MIYGCJAiJLzzOy9K6TJU5EqR3lQRp?=
 =?us-ascii?Q?T4xZ6TGgqCmaGEKtAJeIE2CpEAYFfKsmP6yrJfUbZSplo8BzyWhBxtaaD8Kr?=
 =?us-ascii?Q?Sc9SkAF8f4r6/98/yNdQMsW9C+vbNqpg+iq8mTzR2hSXLhgm5mcHWYBwXccT?=
 =?us-ascii?Q?lVt2sNdlujN5ejY2cL873NoxqxtixNXGkn0CDwzrYPEmeK6raKyPLSnqsRWt?=
 =?us-ascii?Q?/UAlxC8+7/ozpmJ03cHwfUbBe/Isu+UQAuaE1HdSKmWLZnYJB3xSLqSqybN1?=
 =?us-ascii?Q?SQhp56Fd6wVAW9ZiV7I5+9Rt5ceifc0c4YR1dmF3NGoFffGHNmKHtXPRnakJ?=
 =?us-ascii?Q?XlRa3zD7Vk/suGIz9qE6XBB8k3bP03k+iZw8ELcKXzqexoLzqjoQuro0IDSo?=
 =?us-ascii?Q?r6Duu0fD+nao8NbZvZySHeCJfRL2PXUXnfRi5MBCg4UoDeSTM+tTVa54NX/N?=
 =?us-ascii?Q?cuptJ79B3gRvOQn6HIgdhw/v5AemJHsQvCxx0t6vjjEJnjL+qt9QLrREUqmM?=
 =?us-ascii?Q?Rhy7s/wYoXBqrofRmGqWdhNzk4THkkLG5vlTn1QiiOM7MXhoaHzcPbeQpIfe?=
 =?us-ascii?Q?z7WjGyU6nXHwP6HP7WNqyJn5w3oby9v+Qo5/PfJkNrQePR55VqnStIdVNUFd?=
 =?us-ascii?Q?xy6T64H3TD+affbzs0x6dxqKDGip21qIluouD1j/OOPFtNNR6zaC/M0gxQSn?=
 =?us-ascii?Q?XHQDBwMkatQm0O8M8XixoPxsTop8jvNjg3xy6uiU19+vNSwX4dFtI6jYejFv?=
 =?us-ascii?Q?7F0SByTG+gSJuH9ncEjP4Hm6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354ef50b-612d-48ee-6f6a-08d9834de36e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:34:40.3889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0O8MtRtvDa2G9z5kdEf0K31Rk8SgMSpB0/eYMEpx5m1rNzUOGqG1t0keiUvZBaHaugm1Fkl0MsShk2AX/wUP5xRw3DExf07R1YYAd827cfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4069
Received-SPF: pass client-ip=40.107.20.139;
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

Vladimir Sementsov-Ogievskiy (4):
  qemu-img: implement compare --stat
  qemu-img: make --block-size optional for compare --stat
  qemu-img: add --shallow option for qemu-img compare --stat
  iotests: add qemu-img-compare-stat test

 docs/tools/qemu-img.rst                       |  29 +-
 qemu-img.c                                    | 275 +++++++++++++++++-
 qemu-img-cmds.hx                              |   4 +-
 .../qemu-iotests/tests/qemu-img-compare-stat  |  88 ++++++
 .../tests/qemu-img-compare-stat.out           | 106 +++++++
 5 files changed, 484 insertions(+), 18 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/qemu-img-compare-stat
 create mode 100644 tests/qemu-iotests/tests/qemu-img-compare-stat.out

-- 
2.29.2


