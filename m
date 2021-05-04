Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE6537273A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:29:22 +0200 (CEST)
Received: from localhost ([::1]:57370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqQj-0001QG-S1
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqNk-0007rG-1C; Tue, 04 May 2021 04:26:16 -0400
Received: from mail-db8eur05on2118.outbound.protection.outlook.com
 ([40.107.20.118]:10464 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqNh-0007EP-9z; Tue, 04 May 2021 04:26:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtWDvPe4bM3GIXWllRdp4D3vHZzptrMIrEVjf1ZyZlmse+4VoqDPfieyP1nUKeI+2Yn8CkiAHTmhA1/ugp2t6vr89fXiHFON8lGMUl+l4Z/92mIR+JW6sogVzqlm92RKFS/2pG42L7Marh6t7Vb+5QqB8rwfQOsKCIdAa3vTXiOSxh2SwTrDMqiNJ1caqaxenNqGP7RkCpBYsjZWO2N0dYFVB4xAJjz0p8ZNHZW8PlhszZ6BFJ9VVYogG1SJ3LE/0OnptVDvD/izcDStMUAcRjHMYddT2DzwbhsIjvxJ8O+idrwxIIgJ0w+I4dhveNJGlz99kCAlLpwnqPoGcJTSKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP0FBmXfcR5JgpEO0gzf3/GLQKME+3/2tQLtBg922OU=;
 b=oXKpDCF6UrbMbYseYKByHQavGdbpK6oFPcOuDfUMg7Cgfudi/1AafMMev64vE+ejszeayMSYezEXl0nxmd7ogypuSIQurJUSxOVJogXmDSwewIGluNoAkF1oHOxtW9WBZ2ya6fSKpArQpfmwvzNZ/yfpNnY+NhDHY/ocrRfG/RZ4b0iATBwfBFN5JrgrhDsRZEgBiIvRYH9FERqFc4jH7puXJ80PxIxziffylnJTqtstLeoRe9jVs+9XxRlAWQHm6pyLpzMSRfxQtfPZBy9Hz2klyYr4fLHrR52BQk7kuPdNIOuGmnITrKLUJPxAER0ScwnjCW2saPSfTNybAt2kSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP0FBmXfcR5JgpEO0gzf3/GLQKME+3/2tQLtBg922OU=;
 b=cFOImYsobx8gT2oT/essZF6Ux31Rn9NV9+ygBFCeuTGZCyKXLhqvMopzkzioHKMM2PbDqXrZ/qrPZN+uN+kTk75pg/aQxxsEBiAd8D1MyHsn/1Xbwu480em7XwvjO/0e5cS7ZiGXT+uaD/QyMYuo1I/KPYrhmNS5S8d7WdCYljU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Tue, 4 May
 2021 08:26:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 08:26:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 0/9] block: refactor write threshold
Date: Tue,  4 May 2021 11:25:44 +0300
Message-Id: <20210504082553.20377-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 08:26:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93dceea4-353d-4b2f-6629-08d90ed64412
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33811D9693DDE08DC0E3AB98C15A9@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dHfRBCREOVMO+b82pIi6L8fvO829Q5uoMVqldRBu6Rrj3HqaXeGhIpmbDLYC9bq4D1xH8zdE7V/Vxakc7tB95Xwl+UP/4H0wQxoxrV9Wgqe3e/de8KPJrETeYjylRWvETtwJSKqrxvs1bHGuBugpnGBadELnuuZVIcRHsZjVN3X4DbEjUv0Bk9hUqutw6Dy7ZS1C/VBXPv5Zis0wwuMewZFAyXsdeBqT6uLmZJ7PB8fr636+GusyPk+jxxLiGEi5pyoDOdU7YVgNGFMg4NBUCHiCvRH9fP2bVaRiTlWoAvbtXcxkbMF+vgeeqsArMd2qvPxbznJd5o+dZwo/MRf/27w8ruKquno5dMM0ZzM5xy1N6+xnKNyFcCOYL0XX13rfG2pkSwO93KYuU2/wGlNLrV4duS24MDSs7ej8HMFiJ3Yt9j5o9OSNu1xyUQ+VCCZqfDD4NvMOiqXoOKjUQzxoRsg2z1U6Eo7veqj7jQQMfJ7kSPuSys9GpO8rcG34jtowJ7xBQjJACRTDwePw5vMui/kijl7eygoCtUGmKubpqXvpXI1FkkJJjtPVdO0DBM1m4MTyhv0X47KEYXkijcLOmAy1ugKPY/6gOd94xFNR2jMQd5TiBcnNb5pCdOB989B+sDFXlJszlpn9BxnKnZINbEF8wQx8hzrPcZUM0EmpCXPwax9fNKiIn/YPVF7nk6SU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(376002)(346002)(366004)(396003)(6666004)(83380400001)(38350700002)(38100700002)(5660300002)(8676002)(36756003)(16526019)(2616005)(186003)(4744005)(956004)(1076003)(2906002)(316002)(4326008)(6506007)(478600001)(6486002)(26005)(8936002)(6916009)(6512007)(86362001)(66946007)(52116002)(66556008)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UjRqM2pTJ3WCR5OmuFdF71s4Ts3n74sfjrYvU7rpR9c5L4SRUEY0+QA0HFZy?=
 =?us-ascii?Q?p1iEIg+GG8T14Dx2GKQSqz5l41hIHvWrB7EJQX+kY/Wk/cS8TrmNfaosCj9o?=
 =?us-ascii?Q?/pZNr5S+uAyIMb/0PywZTU+0NA8GrKqQIdCuIDuDzEPWpuTL4p96f0A+SijR?=
 =?us-ascii?Q?t8a1triPBTt9dxNL3w9/fv4zotFUrN97995Aga6tjgDDxwzfuksATxcXISUL?=
 =?us-ascii?Q?mdN5MHatKsotyiBVebTFcH4jzbbInZ5Pxuo+7/3fh1Xr1v5bTa7izi/nul9y?=
 =?us-ascii?Q?SN4VBEXpZFDQNeCsJZU6DcQVtedSRfU4HJxlsUMXHOz3B0NmmQF4DnX5GNHK?=
 =?us-ascii?Q?VdVJfrY7+actD6VlVTXpq137C4X4FY5wa/gn6Bu0E02BAqMql2pq9J6aIJX4?=
 =?us-ascii?Q?M2i+WDyRkWQLF1QERHwa/NGPAmFlpUERRgBxNfLn54wbEXvaOnHUvbWVkDyx?=
 =?us-ascii?Q?F7yEa3rfzp8Wk8ncClZFvPNtTX/fMYrkGUXGekyRj9rmxAkJLAIm4zwkKILG?=
 =?us-ascii?Q?Fy9pYZBxQ+syXFkELXfXFLDfJudwSNIxVovT0MtslP9a1fHTVjEIxQK3Fb0b?=
 =?us-ascii?Q?xO1ViFCPVk/CnKDur5r84qBgJlaEs4tx6Mwxl43nsEC8mQb+4zzTSY5TqDK/?=
 =?us-ascii?Q?9/hRXNraKVyj3mqpnyVxZDQrx+UNMaKojNjDsAcp9QrGn1MuoLh9aLKr2YO2?=
 =?us-ascii?Q?2azaBrXF5Hxh0fcuSFuOR32FZnoNaEvJuuYGM2/2VYzsDmt1K6oR6nccFRK3?=
 =?us-ascii?Q?zd4h3jPrtZ4BbqQmaTXNSMLZfhHkyV1GtIICc5B7/NQUFIkoDN4gp1+rlfUH?=
 =?us-ascii?Q?o61XcMNIB6gGt7ksLjcolB20UInBR9ZHHjXwrzdEqR6tQ8hOctoMpvuaDSFB?=
 =?us-ascii?Q?Fu8pEk+xgm6fKfzNQIyyprVv75TK3gAokd9ekQAH6XgUfZSMAUZMXHdkjXoS?=
 =?us-ascii?Q?yAItGdlL1JyX1S/tKBj2tR1+BZ9XaUuGORCmMzO4UN4HdwL5EnxNT0tpT/do?=
 =?us-ascii?Q?yWiVODMwT2QufbXmzr49H8fwEb0eheMRdzkmgi+5Wpts/Htne0aGiIjPaPcL?=
 =?us-ascii?Q?IV9PrkNuJnfgE2db8itlk2Wwc1/7wqaCcJmeuU5eLMjJw1tOvqZtTxBtlTtW?=
 =?us-ascii?Q?vkF7ZhXEt3l14nuMfgcBkfYtNz+5J7AZQPsZWuWVLWl57eJkoqNv2xnEOa54?=
 =?us-ascii?Q?Q9Yqz+mITvN8fNtYfhLhktmZvXOqqZLCHGEAtcZmajFAe/Gr7yhac4kpJcWY?=
 =?us-ascii?Q?b5i+B8ozfcNCQV+sBY7HmB8SoqvPmNv8kDxZ1wl8ZK+2ccnAo2ztC48PHyA1?=
 =?us-ascii?Q?Eu8xriGqUWqMMwJQqxLl/3V8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dceea4-353d-4b2f-6629-08d90ed64412
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 08:26:07.8866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6ETMyg3xBM45KxjeAOqZEIeVNuapBmoLvB2qTn1VjtvTR2ZllYAjsg5pvb6v/65K8n/VbmTOhYhW120GGCLaJK3teXgJ5FMdQ8HyIKO/6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.20.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

This is a v2 for
"[PATCH] block: simplify write-threshold and drop write notifiers"
Supersedes: <20210421220950.105017-1-vsementsov@virtuozzo.com>

v2: split into several patches, improve thread-safety, more refactoring

Vladimir Sementsov-Ogievskiy (9):
  block/write-threshold: don't use write notifiers
  block: drop write notifiers
  test-write-threshold: rewrite test_threshold_(not_)trigger tests
  block/write-threshold: drop extra APIs
  block/write-threshold: don't use aio context lock
  test-write-threshold: drop extra tests
  test-write-threshold: drop extra TestStruct structure
  test-write-threshold: drop extra includes
  block/write-threshold: drop extra includes

 include/block/block_int.h         |  13 ----
 include/block/write-threshold.h   |  25 ++-----
 block.c                           |   1 -
 block/io.c                        |  11 +--
 block/write-threshold.c           | 110 +++++++-----------------------
 tests/unit/test-write-threshold.c |  91 ++----------------------
 6 files changed, 39 insertions(+), 212 deletions(-)

-- 
2.29.2


