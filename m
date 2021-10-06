Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73C7423E8E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:20:52 +0200 (CEST)
Received: from localhost ([::1]:46898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6qp-000887-Mw
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nq-0004mI-NI; Wed, 06 Oct 2021 09:17:46 -0400
Received: from mail-eopbgr50102.outbound.protection.outlook.com
 ([40.107.5.102]:17182 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nk-0004EY-OP; Wed, 06 Oct 2021 09:17:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSy9tBjUDER/dzFAnLhkUen70y5+gD8eezw0ltP6JDfg/kWiBD/9/M2RgClmcjh4oiieWWqrcbj6rnbb1sbZqP6MLGZcyFgu18bcKlrVmLnMquRZHSPNMMNAjH8IxYw44JzKZsL+z8GDmm3GthL0zt6rhsdzGtYb6wLQBZiAwXCxhTKh9NqVYbU5o783jIj3bO+AZ9Y2QJCyaAxODqs77HSy2bWcdN6XYaLu8ezQWiG/RiIrd7A8YBzgA4v7++YIsyoQSDERRUX7J1c6UGm9kggpTxIHBxSiQD/40uZVdHT5442RCpA17C8cIkVNSYJeYUV+cJJ+QALXd7aBJd/duQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCmFRhYa4tUwZwe4sDLKjkNQ+fV4T20gY4fNhxmQYuA=;
 b=Wisb6aM+5zeXvM2IGuRsXgOZ7gBdIH6q5vmyhn76fcLcV33mQ4nu+2UC0OldKeEcDsrAfljlwzGReNDCKCGxbMuVysCyL2h9bc0jCaNGJLA6c0DPZHc1A8YWHmpP9xPtTdMxEcbV034xtdDmp/A8MTUdm3u1IHhCzSWRaXpZRY8njqJLE5kWqb4nYp4Hop+1sqldIsgKOWDHq/xFgdZXSQNGxD+Po2G/RK+qtXlY1TBTuP3Pd3uKIT/2RS7QpQWPf0CqAGHk4p5nXUb3iiCbgbfVRqk242TAjYf92/31QJWlGqewKpaW68cOt4Pas7Fu48SgWr1eprzGJ4fYcJZiAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCmFRhYa4tUwZwe4sDLKjkNQ+fV4T20gY4fNhxmQYuA=;
 b=OCm96UiwHxnZz7/WDzw6GhwjYNkSUa3K7i7G/OAz7NZn065/PktLQG17f2CA9SSb1U4t548+sznXjN+pQXu1zI0j1pjkjmY8ZaX/aZXl4XSH+ZV/zC8T6TbiFcjsXPH9mthNykJ5z4GddRqLJD7HULFYCGBx9XorWhBj1FQV7Kg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 13:17:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 13:17:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 00/12] block: 64bit blk io
Date: Wed,  6 Oct 2021 15:17:06 +0200
Message-Id: <20211006131718.214235-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0296.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0296.eurprd06.prod.outlook.com (2603:10a6:20b:45a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 13:17:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 181571d9-9ee8-4251-46a9-08d988cba752
X-MS-TrafficTypeDiagnostic: AM6PR08MB2981:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB2981BAC3C7A7D9E3DB2D4C8DC1B09@AM6PR08MB2981.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eM0jj8HWrXzWIu/eZBc4z1vVE120+5KfNQfQLL+2LguEMG8Bxdu9Se5x6Q4TepzgI+apvxarXZd/QsoBS12NGBizxasBiga49uyYepW2efuTe40Iq9tgqlCZfqdR+36ReAqEzSscCmoNrJaIa0tOTlGbe+pUr2iRmIqgxqr7aku17YpsEkZDfGK/4E48ZGd93HpIUsgTyJcYV4IAlwR708vYwjRdQSudgzxcmimpHTw2kkEWUA8Gq71v2mHc9VxBD2OQmeb+N1jYFbTRYQzHOj1I8sBR6AAwuLGgGRLwDaByzi7ap3IYi2+ufX1avZ+km/9iMisRQ58X7iVB9DX/3GzXjLRWSiIt+LdmP80C+piWjYWdiWlSLPLLVRKCJT6Yd3H2yOH06LhiaOVeindTbDFfWsnHHMBIqSxkxVBMK9xfCtxFjsxAzhTxpLKihrfo0GCXgmyjJKx+BGeJR8myQMv15+cMBgvpqXI51RzbUAsozq0/bsE9teBwIgqR/5zA7Rjw79RmLK1hIrjzMEkWHirazhTWch7G8PRIMjGqpcUbOAmwUbZcV0Prk35ecrwD+vAeus8rAqZz1+HMZjNcjkv4Cwy4Bq3OjCo3zuHCFYj5HOjMrtfk7UyV77lkntxHl8GazDIev8HBcKIRn9OKE87DS4wqNM9Svm2ahJn2pfdHmnEeAlPJIfG5C6bNAmnkt1x3+P/bzTfaIg/pzajLzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2906002)(36756003)(6512007)(6666004)(83380400001)(38100700002)(38350700002)(1076003)(6486002)(508600001)(316002)(86362001)(6506007)(6916009)(26005)(52116002)(66556008)(66476007)(66946007)(5660300002)(186003)(8676002)(956004)(8936002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xSU0xNAGU37/4Vc59AOiuYPcVeYzG+b858+yZhefFDH/9CWLtjXu1T3b7Gd5wwHAf5O2LCa7G8k7LzS4j/OBCVQsQ34/ENepn2unTglgZGkrwtEN7AdNDiaQyh7SFIyHYujcOzvZKdHpFc0hZtZvgTkn7J2+q959NiE4Rr9TY9IZuluDMcAUF4/hhzvx2xQpwilpaMnmWjDqxuetFxtrHelht8yiq5Vw87+4aOIbPTL9FyzFQDY7N8KQabgCmygDB7lDEJ0l0RRLTAuHJf3g0fwPY3l9gHnGe+pcNi5/CfJwPPTGpsv/6LTq9sh+jbJr2WmW99/AKVjyBotVibw7OGPhOyNf0uxodkr4QfjLM+ngw9S0+G0Ak4CXRhwaBPrXV3w2q87AQux6CzblAruSD7iCuSdaaQ+cm/NxIfKgwBobA5lGcQakJyeVfDBa58dmQ1PzQLO2tg+Dzks1B3Opc9xPUB09OuS50e93SWuipOw8z1MFfe+8UGtUq6p1JlaJkci2dshYboQnd8ZOak8sSj9ibuy1tGYlECU8XTANSJPWoPnWwtu/r9dmvrSOkwPCSIa9nCbJ5jMfd0WKMWWCODv5MZ7DrZshnFI6LBNlSVYfPt8vW39baD3svRw0qUys3vgXsKrTZwpmQGVrLZfQ6GRezlmRKTcRm9KKHH5w4772FeNm1bioxGrHkP/VS2rHsy7bkVtBKT/mMGVRQ2gBnm9ximIT5FP2b6v1UAQbwZPE6MUYcycPouL4br5Lm9LH
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 181571d9-9ee8-4251-46a9-08d988cba752
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 13:17:32.1499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QQeFb1q1JCTzq7/XA25ZtLJpQ1YR2CwPWhQGSudCgJE8ILm5hCuxT1g54kgVZMm9sCWtY1MrnxAL/EEPBRAB0h4i775WhIqqWOUNU+SRNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2981
Received-SPF: pass client-ip=40.107.5.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

That's a new part of 64bit block-layer story, now to update
blk_* io functions.


Vladimir Sementsov-Ogievskiy (12):
  block-backend: blk_check_byte_request(): int64_t bytes
  block-backend: make blk_co_preadv() 64bit
  block-backend: convert blk_co_pwritev_part to int64_t bytes
  block-backend: convert blk_co_pdiscard to int64_t bytes
  block-backend: rename _do_ helper functions to _co_do_
  block-coroutine-wrapper.py: support BlockBackend first argument
  block-backend: drop blk_prw, use block-coroutine-wrapper
  block-backend: convert blk_foo wrappers to use int64_t bytes parameter
  block-backend: convert blk_co_copy_range to int64_t bytes
  block-backend: convert blk_aio_ functions to int64_t bytes paramter
  block-backend: blk_pread, blk_pwrite: rename count parameter to bytes
  block-backend: drop INT_MAX restriction from blk_check_byte_request()

 block/coroutines.h                 |  33 ++++
 include/sysemu/block-backend.h     |  23 +--
 block/block-backend.c              | 247 +++++++++++++----------------
 block/trace-events                 |   4 +-
 scripts/block-coroutine-wrapper.py |  12 +-
 5 files changed, 165 insertions(+), 154 deletions(-)

-- 
2.31.1


