Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD8F358713
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:21:55 +0200 (CEST)
Received: from localhost ([::1]:39450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVXf-0000l2-1P
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVVG-0007Td-CF; Thu, 08 Apr 2021 10:19:26 -0400
Received: from mail-eopbgr70111.outbound.protection.outlook.com
 ([40.107.7.111]:49219 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVVE-0006fz-2T; Thu, 08 Apr 2021 10:19:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8yynAxxmBWIawmLLmjQP3XGrNmM/z+/2kFVYVlHbZdTeTq732cx107n4eLmKTZd1o92+fXwEtRNPO73+LBeZaxE2clZwQzj2L5kTPR2Hi5aEbjQIsXWe6bpF7ZXVo+jLSOgmwqKB/+Ei3QEr8yqhtvdGk+c81pi7lMgHQvK5MwDetWxhSJU9NTSsVcnP0foWqqL4h9lioC5o9XvI7Bb/RAjPwBoG8vSyVh56+wViUGDLXfQpxRZKZf6hHcXB6eenrv0a/A4FXPiQBPNfOFmQmVc3wia7C5PTB1Svz2AHLn6umDIZqyhzVNhIZd/MCCVlGjyuNkLeP2QQ0TWRL8cAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+7vvJCwGHy5nGzBPm+sQJcAMB+cNezxnwBTtRJgchg=;
 b=KB4QgYNBTQHKUwcyFESW0cl+PmXAk59MTKWNkxXr2H8idsCXlVERxDRQtHdxqXCjBkY8k41QBXtjLD9q87+viF2rQJsTwh9h6TX62Ct+Ma19qg2OBwTQviff4tdCsyhMUMMa+3PSg4WpuNYLInPLU2UEg14rQmc+n0j55imzQs+vLjJ7VCo76RPr88XlG9bEkyy7cxT7er5z9LfZg18zsju2Gypz+fNzgwANLaLMRvvXFv+bllQynHQ5+oFgOaYnHBPVwqh+lcUWZLbHysAsDxC8eQtvTtrIQ846BKydNqgGrT6JJfGCvkdVW0VnIR635jfo0Q9YRpU1K+8T4MYMIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+7vvJCwGHy5nGzBPm+sQJcAMB+cNezxnwBTtRJgchg=;
 b=NvAOIUvGBxJq0H+rOhwsu+DmbrlgiKy00SujK2zz6RKA1Dx15/R12es6pY9km27F2TaHvnYZZll0u8oCwDmnfSu+8372sXyw4arTfL/S76R4dQD7I89bRbirdR9FhiEFaaxjGr2qWHm8bLjx+fPJpYZmQNtgsFdRT9htOBRepeg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 14:08:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 14:08:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, rvkagan@yandex-team.ru
Subject: [PATCH v2 00/10] block/nbd: move connection code to separate file
Date: Thu,  8 Apr 2021 17:08:17 +0300
Message-Id: <20210408140827.332915-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0701CA0052.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0701CA0052.eurprd07.prod.outlook.com (2603:10a6:3:9e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 14:08:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b08b40dd-3adf-4942-eb8b-08d8fa97d08c
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59097A2C7319CB392CD2D433C1749@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BcKtPx8zdqNMqeRJoKZ7ykEaot/coKouS/vtxclIpexgOxpUizB0EOPdaOgabCGuFMdrhEV86o5AesOSdV1RuOg2JtgVECbOdS1sZ1SKFIyDewS8huZ6Z6+B61hc2Sa+qseWl8/ju2stOkGpgAM0qZMzhCfLDwzcJsTDEzIyqbNgFPMnBp9BwXkAOIuRHX0W+oiPUmhbI/QQtrK41TJN53qnJDEwpo6UKIxyqtg42zMBGGc6n+9x8MYTNBAJMfBomiGLPfeyrZbkMoOvepkRprkNUkAqXYvGMGditX9bOeElSwxKTOAEQWwqrdsk4jKikLM/yYo2foQDH0oQG0qnM3EjbdFLwEugbyV3rom0+RycYYWH5iiN3xzBli0RVJchOcFHBQ7GrFxbpTU5OeBkg8akxG/+uYSCJtPs2iyhsx7QhnxsneqQX8miVcbvE8YWsUUll/FcHzQwxoy8jQlg0J/nUcu3atJKrJxBILJ/kYKIYOCPHtDRENWsHSzKhOpufr/0YEYlgaJ4bv8oP7Ez3QJJ5PNaPiqPk2WVvc7qHzmPr50ZLSx3h4TqhnwIX6ZV1D2gt4Wk1fy0pDnw4KJK+33c+idYEqO80CIL7prrWkqMBw8D+T0UviXdQbn1T+jHXApFARvlo4A1ZsdQMjRiNac9/sKIh8ZrwqdJBtIXbT3s0u70WVXC/kZW0eTZgqTUiV7Z8zAy6YjA3C73GPxdULm2MGhk9twQAJTRguptRwQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39840400004)(376002)(36756003)(5660300002)(38100700001)(66946007)(316002)(478600001)(86362001)(66556008)(66476007)(2906002)(69590400012)(6512007)(38350700001)(6916009)(186003)(6666004)(26005)(8936002)(6486002)(4326008)(1076003)(16526019)(52116002)(8676002)(6506007)(956004)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wzprIMF3HeGgZ4XZQHeXPQIEM3DiTb1Q0ah0qCuVZuYR63PkX0ACO6iKMtnS?=
 =?us-ascii?Q?Bef/QUTIyjBjU3oP4c87SPlMpasy7XHE/Lb636+KqMJasnxSd3/WnyboRVns?=
 =?us-ascii?Q?N60oUOn5tcdjosSgXKVwlXggFaq4nZHjBRKXgtza1zQ0kvPsCBVGBHBMvLFs?=
 =?us-ascii?Q?XGC280NORC4+lDTROUH6mEtSUSbUao8ajiC+93ae9Z+iy2/X9i889oKCqipE?=
 =?us-ascii?Q?mxShWwlufm0+MqSIQostcYJN2PDea2myiQCeyPn+0fRQjl2sSsRZpfw4HBn6?=
 =?us-ascii?Q?ACSCS+mxu5sT+DazJD8Dy9evAtx/scizJnMROG3PrWk+zafBvfzzfkIcy0An?=
 =?us-ascii?Q?TGORJBBrzoVBoeP9mSD36j2aUymvEM3PTR4zoWyEXwrwsEJAMsyrYfyP814k?=
 =?us-ascii?Q?jYmYnF53yWv7fcjMxha1czk9LKjxFEQtLhFbAhLhCeaLA2SQpwMMSyb0fn8+?=
 =?us-ascii?Q?CO5MWeS88qqJHuUvO7WoGHo1tWGsSPc0Paj+i5fiiHpvxW4QmCyt0UkuF2Xl?=
 =?us-ascii?Q?/keisS76Q6+PiMBAtJLcDO9luH8zOZEE2Q5VXuQycVk1W+fXRDB8nGiaujD3?=
 =?us-ascii?Q?QFLhGXKJQBId50q/AEKlS4DSu3Dkjk3zl7Lkr39mFdvFeJDe2J3bNllDa1cB?=
 =?us-ascii?Q?3I1/zVKFVnbc4L91OHRrEKQtLF/3sZUZKmi75PwrPNj0fPTw1HbzFnMHCnZS?=
 =?us-ascii?Q?kDKgyeVH2CbJ6c65ROulawhkgwHnyyd0MSI8jE157K1mu2wyCfIOu8ZdYKDn?=
 =?us-ascii?Q?SY7ihxAr5afq6a/WNfJ0B+xlYMXXAvka9JEvB/DrqlHF3VpQNFOFp5yDAYSL?=
 =?us-ascii?Q?GhVjeXvsjB5+JYGSjmNoXsVlZDzO0FZusEnHOBR7LDLI4bBHZZ9F3XnaeDNV?=
 =?us-ascii?Q?e7YnyDDa7I7NnC84GrWdDp3gIz7Wmnr/WNw5j5EfMi9I0mXnIGYhhHCJ8eEf?=
 =?us-ascii?Q?4FrZCwNDUWgTuB+r/eK+uKb5jZzAK0xx58D/se7ZYXbb6U+6csxePHuTPE0x?=
 =?us-ascii?Q?BN2vVaBRjvTifvwTigwzlj2WnNKIInRtN/bxGl7BwvJJCl6nYfB52G2F5mI2?=
 =?us-ascii?Q?YPg2duxRko7ls+TGkQj1fB4Ixz21uZwqR8+Db+3TVpil83c8WpPM3/JBaQSM?=
 =?us-ascii?Q?ImCm1f5m6y6/SrltT8mM1zxYQBLOYzHp4Z/23V0Wtvti7gRnI241mSSPR+EQ?=
 =?us-ascii?Q?SKQbhbafUpJ5UyClZX40QuxEbTtctk9OG/oTKqB9Zwor449b5iIDZA8wOJ5/?=
 =?us-ascii?Q?TRzwohyw2QrnYPp2qlMURJjpYoc8jLh8TbirMi3fEhMsTg01seNportOfZxM?=
 =?us-ascii?Q?3DBdL1r5zz6vbIVkaPK5Q593?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08b40dd-3adf-4942-eb8b-08d8fa97d08c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:08:42.1843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMrh386lhewfXaJm9fr8iVcB2u6OTxF+OgYFbJ5yXsEJgKQoBEGY8OX7MkJEidsG+x3FE1nCLs6EPz2qDLuloNJT1swZxWaCjSTQOKyV8NA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.7.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

This substitutes "[PATCH 00/14] nbd: move reconnect-thread to separate file"
Supersedes: <20210407104637.36033-1-vsementsov@virtuozzo.com>

I want to simplify block/nbd.c which is overcomplicated now. First step
is splitting out what could be split.

These series creates new file nbd/client-connection.c and part of
block/nbd.c is refactored and moved.

v2 is mostly rewritten. I decided move larger part, otherwise it doesn't
make real sense.

Note also that v2 is based on master. Patch 01 actually solves same
problem as
"[PATCH for-6.0] block/nbd: fix possible use after free of s->connect_thread" [*]
in a smarter way. So, if [*] goes first, this will be rebased to undo
[*].

Vladimir Sementsov-Ogievskiy (10):
  block/nbd: introduce NBDConnectThread reference counter
  block/nbd: BDRVNBDState: drop unused connect_err and connect_status
  util/async: aio_co_enter(): do aio_co_schedule in general case
  block/nbd: simplify waking of nbd_co_establish_connection()
  block/nbd: drop thr->state
  block/nbd: bs-independent interface for nbd_co_establish_connection()
  block/nbd: make nbd_co_establish_connection_cancel() bs-independent
  block/nbd: rename NBDConnectThread to NBDClientConnection
  block/nbd: introduce nbd_client_connection_new()
  nbd: move connection code from block/nbd to nbd/client-connection

 include/block/nbd.h     |  11 ++
 block/nbd.c             | 288 ++--------------------------------------
 nbd/client-connection.c | 192 +++++++++++++++++++++++++++
 util/async.c            |  11 +-
 nbd/meson.build         |   1 +
 5 files changed, 218 insertions(+), 285 deletions(-)
 create mode 100644 nbd/client-connection.c

-- 
2.29.2


