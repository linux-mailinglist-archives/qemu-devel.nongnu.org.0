Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33412B9381
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 14:19:00 +0100 (CET)
Received: from localhost ([::1]:48950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjpz-0007Xg-Qd
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 08:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfjo5-0006I8-9r; Thu, 19 Nov 2020 08:17:01 -0500
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:45294 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfjnz-00060R-DZ; Thu, 19 Nov 2020 08:16:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1UpX/zqdK89I0+02916b8VTIyE8KsL65Lg7qVoHSNeBGc5oYS/rGhV7Nu7TLdD6b1dBSESFhDpbDM8ZNTvbtO2bqxRlkWYO6kP7OTCEf1jsqFVrPLcOr2OzRfLXsIaXBc9wM7IyhhxrVspS6WhFy7LlEWQYJPUDuQJuQAncLsnQ6R8mhfQtZ0xwdXbTGIEUCuJQeWL0i1t+K/t3VUjczEC58cLZ9qPylUccUU/GXXDjBonpfRGYXps3ufi8+E4ioSznkK3fAyGK2dpJKxH5rTsKL3/LpIR6hi6DXskJbSxBLzeX5in1q41MsRktqeSyr0ZqxbnkxjwfYWCkRbp2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WB8tqcJ9L6MIh+r0xKQL67zRNQuMt7od73/ywic61E8=;
 b=VgP3nBjWYnBLFk09dbwjhrjtRyFcSaW1uxW2RaWLF3Q2mj1VeqoMKAFXiabx7Xz7YSGzDjD+3RsWMnR9DRCEiq2gDq4KBK7TIjOmz6gkgaoPHT11rDDMN9mONSx0k6NGzgEWE4XxxL4jgFpf4vRKfCnWXIq8khhIZPiA1uT02T9KKcnB5lFkdOqtZ4iQiFLLpwWCkHFcADDLffpJ9jS64/Fkbm7AJJaHjx/0DRYc19MZyOpKLFZ7DE7Z262BXEz0c1+Vf7N+LUvDzth/j3Bnl0LSgNuIz6P+l95vLVJw6M16W+rlOkUvC+ZC1gfMf9F07Cynr1h0+q53V4+hKPiKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WB8tqcJ9L6MIh+r0xKQL67zRNQuMt7od73/ywic61E8=;
 b=bKlgil7wd5NVXRdimtE1nwGkiBIRXQOPF3iFqcSzdOe8Lt+xHWyJk3SiYdqFgzGPqPotr4J1NKud92YtijpH/5bhuXF+9+3a6Kn+3aRqMGKzgOFgx/PLV0O4ERhWEICGzd8faRTJbI2i/l892ebbzrerNEvbvpQa0LdJ4LgX4+I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1844.eurprd08.prod.outlook.com (2603:10a6:203:39::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 13:16:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 13:16:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH 0/4] Add function to dump block layer for debugging
Date: Thu, 19 Nov 2020 16:16:30 +0300
Message-Id: <20201119131634.14009-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.89]
X-ClientProxiedBy: AM0PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.89) by
 AM0PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:208:ac::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.15 via Frontend Transport; Thu, 19 Nov 2020 13:16:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df233af6-5337-4a07-1eb8-08d88c8d5f28
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB18440F8EB716FDA802631B32C1E00@AM5PR0801MB1844.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0CV5rqA6pR5ossgCP7wwodJergeHuWaWBNew5QznC5ARbwZ9yFLz3fvh6WQB76R6zt1rVn0AUflWCGjM41uKOTJnfZD3UKb/9wyAajp5n0qgNgD2EX0SL3VhaXpJ+REfnMP4oBoGCFswmVOQK4ZUXFNxBdWyVi5EWf5v4bg3q5rSpqmLl8aGTxQTmJuQ5Xbc2RfhTZK+O/fIqF3EjiF3hvJRACxUS3PSPbC2dybPDzNuBucfEzVPPfviqBu6foYNaXQi7uqOeZlguPe2Fjb0p9hklOeNVkee8I8fSEaSbol9kv81VZikTdUv8ZvwxdGlfOlfkSiE34u2vBdWey7DyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(366004)(376002)(346002)(6486002)(36756003)(186003)(16526019)(316002)(2616005)(26005)(4326008)(107886003)(478600001)(6512007)(83380400001)(6916009)(8676002)(6506007)(52116002)(6666004)(2906002)(8936002)(956004)(66946007)(1076003)(66476007)(86362001)(66556008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: uB3qermPRzJkA5TLllERt59+DMWE+sAHbk1zCbQ+Chmo2P/2vribZavCVgW6VdNlT7IBLLpQFSCfSHgKQQTQTvBn27/QnHP9YEJubPqcssUIl3ap5Jy3M0AqQeDXqpZS9+E3vldyPqWo1UJQZ7pybslMoPHnx94iUPscJQcf5djdQum7mvOgzuDPSsbWmI+UAiSG5tffFYrMpLE12FK2QIKnkiISoSDc9DO0USUmaT7aCB6G79ExyRfu6aGOS5LPJPOKSxm84d7R7D9b9fZMBIYBnY5UF+ZhyFiFMd2wBHaXnUb6NlcnCIg1eq8bTcuAJ3hHIYgSQxF21qszQwXBPyfF6iVZeKFF/pwja6tGtnFGAOuZYFvrwYxpyFDUzEr1PgYY7xJJNWxO7jkjWHdayd7RdVRb3EnFjQHxo0uIhgSmcsnCsKsOjmQ1dbpkXQ8cYl5PkenmVilgxUnkUQ6gxGHBU2bECnB/Js9skYTyqvhZ6EPPhTWmuFHtQKOhIhiS9nNXpbBt9dPs4BMCnK62RQEQLXlsoqaz1+gJJVKd8NXwYrFq/VGHM3urdQox35Yf5hHlnVx+dkwA3iJ+Gg0nQgPmzjCwExTJxPbG17Pn1YBBSC+Hhud73TyEpVGeovmsiaoBLWXzaz3JrNVZ5wSRcw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df233af6-5337-4a07-1eb8-08d88c8d5f28
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 13:16:49.0136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YueND77nw17/KcABZhMLm4tiXPTdxK/1KllT7YnaNxjBY3NxBrT3l9gvkkrWNHh81jFVpWpXAglRCbpqeOSTdTJjTe44oe657xIFfSbTTNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1844
Received-SPF: pass client-ip=40.107.8.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 08:16:51
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

Here is a new function dbg_dump_block_layer() to help with block layer
code debugging.

Usage:

1. Add dbg_dump_block_layer("/path/to/dump.json") call in some place
were you are trying to understand the relations in block graph and run
your test. Or just call dbg_dump_block_layer("/path/to/dump.json") from
gdb session if attached to running Qemu.

2. Convert json to png image:

 .scripts/render_block_graph.py --json /path/to/dump.json /path/to/out

And get your /path/to/out dot file and /path/to/out.png image.

Vladimir Sementsov-Ogievskiy (4):
  block: bdrv_get_xdbg_block_graph() drop unused errp argument
  blockjob: add block_jobs_info_list()
  block: add dbg_dump_block_layer()
  scripts/render_block_graph.py: add ability to parse json files

 qapi/block-core.json          | 13 +++++++++
 include/block/block.h         |  5 +++-
 include/block/blockjob.h      |  7 +++++
 block.c                       | 53 +++++++++++++++++++++++++++++++++--
 blockdev.c                    | 28 ++----------------
 blockjob.c                    | 29 +++++++++++++++++++
 MAINTAINERS                   |  5 ++++
 scripts/render_block_graph.py | 53 ++++++++++++++++++++++-------------
 8 files changed, 145 insertions(+), 48 deletions(-)

-- 
2.21.3


