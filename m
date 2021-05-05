Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2D3373CE1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:02:05 +0200 (CEST)
Received: from localhost ([::1]:39616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leI6C-0004GO-Kw
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leI3I-0002v6-6i; Wed, 05 May 2021 09:59:00 -0400
Received: from mail-eopbgr60134.outbound.protection.outlook.com
 ([40.107.6.134]:4891 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leI3G-0005lY-CE; Wed, 05 May 2021 09:58:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmmG+f1tMFQBQwT5JKUXyGoPI9CGBDu8q8TGOISVtbkV+QWfZrc1h+pySdDdVY7gGpSgtghFijEdjeZl7icDuwvXDANp3YqnLXcFX39fgWAmREKR9Itk6nD+Aurpo14jDYLMrmsdJ6zVuWKoL4glTrEW4CzWamkMGrmDKD6pgvjMVZyohc4B4ad8xr6bsBTUjU5cKtfVr+1X/FFrdnXHpWMYZA202hXqLZ2HY5sRL0zKKrpIWabSQUqq7bkie91JEDCquqsMlLnQnPfQ2njhEONeeZldnzF5kKm6zKz6LLau8wwZXjv2eVbV+Q8T+z7mxrlRySmQDcV8/zs8RPGBoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cf/gKI8A7e3AgnRc6byagRGRWcWvYjlZnrE7Uyq5v8E=;
 b=F6xU9Styh4ab1bhSdS08HlAaJ6W/eHQE9c2UrlYny5p7zIVU4ji0RtfFDsbByxWZugZkl7KOTx1dITRXnzkCL2QUH9bsfv8jcwUuQ7ncBwvc5XQrQZUEMhWdoFkmxxKxF417g3j4cmzT/hz7A+42AwMtjAscJA0C7mOMyGaJjTjPxABaPj9TQlBrjyhTyT2hderqpc6xRjDki+JEZNAIZekmzW+69cvjH4ruQszG56rQL9sertYEHw/A5ABKrLIDXWouMQkbs6/1bqZio+ZhyRnvD4ZM25ieQPq6xolJfzq5vp2CIqnDrocnlOWeqLpBrEY5JAbJQvsLctSCQuAR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cf/gKI8A7e3AgnRc6byagRGRWcWvYjlZnrE7Uyq5v8E=;
 b=hYplZvWQl203qB5a2W0/CHo469k7MYyTPwBUpzD+1QtG7MKhB2d8uFep523PEdsNSFM+in2jACjdjEcb0uJUjYAQXgF3xC83FWxo+8ezwKhELkVDeF1HXDgLk2iA5VX4zq2Fz6tTzHGfUMJIwdGiEEnNGpuBSHSkJsArFRUaxCE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4071.eurprd08.prod.outlook.com (2603:10a6:20b:a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Wed, 5 May
 2021 13:58:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 13:58:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, libvir-list@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 xiechanglong.d@gmail.com, wencongyang2@huawei.com,
 nshirokovskiy@virtuozzo.com, pkrempa@redhat.com, den@openvz.org,
 yur@virtuozzo.com, dim@virtuozzo.com, berrange@redhat.com,
 kchamart@redhat.com
Subject: [PATCH v2 1/3] docs/block-replication: use blockdev-backup
Date: Wed,  5 May 2021 16:58:01 +0300
Message-Id: <20210505135803.67896-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505135803.67896-1-vsementsov@virtuozzo.com>
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Wed, 5 May 2021 13:58:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93b473d3-86ad-4f95-1dc1-08d90fcdead2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4071DB61F92AB24EDCC9E2CFC1599@AM6PR08MB4071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0L/EqRy6vSOLJMmasxQ8EOlFlpSAoImMbljmy5oe5PuBCjYDJveA55nD+tugkR9W8bzd+eZDtH2x28skfA5DGdzzRMrB+xXpfxvc+4vycNeEudr8dDWpuZHXS7Q/7jeIL8nflg3/KBkKBwdV4fLorOgssLNiME3Fpxw/gnpmRQymTS1G/MLsHWWUqNp4HtTkQgiWgmXIyZwM4nN13zMhtP+CNCWeSyaCZTTv0yYIcojJCmKqzqPZ7DCA09I/ljxfWKe15v0GaKl8dwOrp9MusQtmHHFajoeQkmdflz2nyQ7ba8L6qFHScX/sOTtwKOqkfdh7nWkaqUHzvJ+OGskAyb5EKf8/akdI7Qu3kobTnxrmI8NIQO7nT4bQbtcEAoAQDyKFm9pPos+0AelCWbRgvaVzCUVGA390yyOVk7dl4ZGUUCuRxXLRzRn8TeSKWN6JUx2GJwAwZ6vJqvY3PaJe1os3WG+n3dkzDy23TPZPZSVWLuDsC2PYfC0UYXbv6Z+nay/bIn6W/kF6aHyJ8iMC8RrnFqGFIg9IACbXxjwrJqoQj6eSceXM2leiN4C8Y+vAwYvMyKwKaXAA+b9FVCmzgJAAqLnWFF2GkZF8ZAjjYwmWfH+NZPK7XAkD98cNhWn6aDsWE0UuxL6l8xUEyQAEQwAx9/T1sIHA31vxL3LCayV76TlQ7f/k8TgGrpALc5Zh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(366004)(346002)(396003)(376002)(66476007)(6916009)(2906002)(36756003)(26005)(316002)(6506007)(83380400001)(6512007)(956004)(186003)(16526019)(6666004)(478600001)(52116002)(86362001)(7416002)(38100700002)(8936002)(6486002)(1076003)(4326008)(8676002)(66556008)(5660300002)(38350700002)(66946007)(2616005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rwWVME2aHVz3Q7RlzfecpG2dBKwmIyTSu+PQE2q9a8DaPPF1oerYYUJbyWvu?=
 =?us-ascii?Q?d8rOyQXq7gTcWVy7rHLQY+hS03/r3aT7XISxIcmD2bOkWim3z8ynSiAmc4Bo?=
 =?us-ascii?Q?4EPtK0uvznOT04hrdWq2YCF/LLmoln6LCyM/nwlG+GD5pW/Mi8MqZ0f6otvJ?=
 =?us-ascii?Q?5dfBeP7MsiOrftnjTYPu+cC1YFBYK4CEHlIBzAt7SbpgjEDzr38Xhg5EvVNK?=
 =?us-ascii?Q?mdtWgr9XKtGcg5uYPmtpXrfFzYTrUC/GCPTetcYu8pA4NU7qcUwAJOnj6pTL?=
 =?us-ascii?Q?dhQqjYQQU3fU6BudcyqruunkyH0o+uNnGdttLjB4mPbJLAekcwRwx2u1j/6f?=
 =?us-ascii?Q?7n607GklOqQgoJp9fS1bsp7LigSSEY1ccYwgqLX9JIZyh5JFM7hGYKCP11D+?=
 =?us-ascii?Q?/7XxRa/jKWntPCJl0Pj21dEb8p3oqU764CEbk8yPik9c2oCcS9KCQ2trvWGd?=
 =?us-ascii?Q?eiQVoYJQO7JT1WrMBnND4lHY/IScTuCWFkffeWHrvbIcdolnZzRcENkORKV3?=
 =?us-ascii?Q?qJC3iQrJpopUnHNyoPOm0AZRUG8QeN13jqF5IitSKX0L0k53AD3tm6m64zJL?=
 =?us-ascii?Q?07xB85PGV/iAyyrF0eCS/8DJbNGmIpash5qZ9kzw42buh5x0fEvq1iVpeVuD?=
 =?us-ascii?Q?xXELZd73azQC/IBRzuwKajvAtKKbU5ZPPXfJxSJCS98TUUUwzdDuC732yl7m?=
 =?us-ascii?Q?j+BUNUYl09C4JFE8yjSHscMz0c4hpPczT9vlyk1apY1aLqtn3F0TnklxwwUs?=
 =?us-ascii?Q?IDKW1tvL52Of4sfiUr4YGXaGyX8Te3atgbSD3oVH3h/SrHIH3X3369M7l04c?=
 =?us-ascii?Q?J4uC1iAGofpFckSnzG4m53MGQmd6cNT/aHAEYOrrSNJMs0JmehN7gf9H7lYC?=
 =?us-ascii?Q?TUxH/7/yITORDTsUFpq/FP9v4PxK6yVR+hu8bQAtN3yqdLLeud4FoaRYBJ/a?=
 =?us-ascii?Q?A18C0RRgAn0NFmXz/XP2+gb52BlmSko32yzg2wt6TLXZXnNocosT93DAA8iK?=
 =?us-ascii?Q?lkdLdcvttwTpILo5wYM6QgWfUZgb3fnXc2TtNMla1AjlKvnaiEZ3l/K0tWD7?=
 =?us-ascii?Q?gSC9TEFalhXozsilS4T7qRty86+wGQ5EyoKxUQ+5jZue/SMgFKRj5IIRC8I7?=
 =?us-ascii?Q?K3QrRCBD9/kieQAOIKcy3yoGRZu1KllCByjf0brgXvoJDzoaX3yj5fnz1Yic?=
 =?us-ascii?Q?BP3KXBLQ/V09ld9vHiyNC/jnurOZ19pk39WMdeXuITT53lp6tTeQdNsWJXh/?=
 =?us-ascii?Q?fFtbR/cHVmHsEoHcY+4j9dROZxXQ7WiE0OOXFVJ1P/uwOo0kXJe+CG4fnd12?=
 =?us-ascii?Q?A6/DQ5CXm12r1PtL2okvjtsq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b473d3-86ad-4f95-1dc1-08d90fcdead2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 13:58:53.4057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/C0iu/jNVzKkOVokwvwNBJ2fSJnKs++znc2sS14M2nawMkLJaOIYvDzdgpzbsxAFI+TWA0bOsWD+yDfB5WcueUD2+JfycoVh9CpLyRjQMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4071
Received-SPF: pass client-ip=40.107.6.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

We are going to deprecate drive-backup, so don't mention it here.
Moreover, blockdev-backup seems more correct in the context.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/block-replication.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/block-replication.txt b/docs/block-replication.txt
index 108e9166a8..59eb2b33b3 100644
--- a/docs/block-replication.txt
+++ b/docs/block-replication.txt
@@ -79,7 +79,7 @@ Primary |                 ||  Secondary disk <--------- hidden-disk 5 <---------
                           ||        |                         |
                           ||        |                         |
                           ||        '-------------------------'
-                          ||           drive-backup sync=none 6
+                          ||         blockdev-backup sync=none 6
 
 1) The disk on the primary is represented by a block device with two
 children, providing replication between a primary disk and the host that
@@ -101,7 +101,7 @@ should support bdrv_make_empty() and backing file.
 that is modified by the primary VM. It should also start as an empty disk,
 and the driver supports bdrv_make_empty() and backing file.
 
-6) The drive-backup job (sync=none) is run to allow hidden-disk to buffer
+6) The blockdev-backup job (sync=none) is run to allow hidden-disk to buffer
 any state that would otherwise be lost by the speculative write-through
 of the NBD server into the secondary disk. So before block replication,
 the primary disk and secondary disk should contain the same data.
-- 
2.29.2


