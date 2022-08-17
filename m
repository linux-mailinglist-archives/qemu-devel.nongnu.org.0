Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98525973A6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:10:42 +0200 (CEST)
Received: from localhost ([::1]:44482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLcu-0000xT-PQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLN5-0006Xb-0F; Wed, 17 Aug 2022 11:54:20 -0400
Received: from mail-eopbgr60098.outbound.protection.outlook.com
 ([40.107.6.98]:6277 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLN1-0001Kk-CZ; Wed, 17 Aug 2022 11:54:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcJzuXW5DXaW9n2Cc1vAIdqO27fQOf3nOc9xY6fwiOdrwBG8MyhkkXGHZc7fFbh0niXdIaFKoYcOMxzjG2rqWyJXJ4SDohWAubrMSJTljvJPQjNBNIrRkFQSKN2O2EeQNhpDSU+FtU2rG2v+I6VEPtU0UQ9/N3H7owm2DqGdMhiJyBCgbFJR7B2swhTFatre5ViTwiF/Gl5CGXaPQdVWuNN6WqGNgYTB9hxe9zhgNzt5mbyIBkEF2AsK1PI86OaJBDfcN0smUrhR2bpxRP4xpvsKG4cW/K6WIpglI4fuifVH9Vw9/oIsfspgT28v3ezi6i5TBilwvYyLzRgUiMGIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xX+/vKJsi24ttnJKp+p4GjUthOlW5xR2JmZqO+gA5NE=;
 b=au0apmzp3z5ay+QYqoe6WYkuCYGlBG8m6pTeia+862Uk5xvxc/lasYbgTmlGdSeIZ3xg7GpahDcNxw1s9JnoqgTLwFhN8bhAd8JrqQVa+mhq7aRGbWzYH+mbOmfkRJ/C34aMDn+T2aVBl2EGH5CLbwydAT/gQogyXCRBMSv8rcmWRT1Is4+KVmhxy40UW0MWGJ4bx5V+oGesL5wfzxTrVHKG69F/LK69WfVJLOyXWGUExxZNdPPW3ufdZwzAsu/JvwEcy962JFNDKSVIs9y/V+LDuEN7XbiiXFdixhAttbKyA9dYC2RHOpuGJlhQOtqkScyYwCuEdiooDrrqF4rMew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xX+/vKJsi24ttnJKp+p4GjUthOlW5xR2JmZqO+gA5NE=;
 b=GfY5efiWW2RLvcXIzxHGixFcFQgP+s5t5CwACdN5IhmIGD1gKWSTSZLPbNyDuBvKccXe6Edb4SIaUGvzx/Cjj5MZgeoK779p2u2Hks68ge7c8RFxryWgqJGxqLg3qMXDbEGoO4cjEcbRcE9VXDwiaRMjqO07XQd1wRAMpu9x7TPbQOvy6wmRnHUKfBfZQr3KU4iUprql+NPVFA/073x4qhbJ5kk20UFo2lQFH1MTgfOK7owfwb3MciKFDZTcaFJWJLjM1EP3f+LcxugHD6gjHJU6CFvexKqlMGA6mKGO1y6AZQAUKD2YKzjuGEqHXb9g46DpGFj/unSMjp5pYusnzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6783.eurprd08.prod.outlook.com (2603:10a6:102:131::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 17 Aug
 2022 15:54:09 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 15:54:09 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 00/10] parallels: Add duplication check, refactor, fix bugs
Date: Wed, 17 Aug 2022 17:53:51 +0200
Message-Id: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b400ab5b-edef-4412-fd00-08da8068b8df
X-MS-TrafficTypeDiagnostic: PAXPR08MB6783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7j20XUb5iiqJEMkf14wumOwG5b+HLSRL39m8wOR8D8ymhrbD5JS2ofIrJz6qP3Rx6QuuTN0zvsN3Vbhu0ijuLpveU6khDBiO2oYJz2DnGdCE1Yot9w/A2n5hdbYbmh5TuH20L/ah3Ka5thZ6PZ1bPFVIFukc+w4eeBouqGBhF5hVhd0GxWnA2fEUZNZV7TQrdraBtgAtDkPH1iDpMkBzvgZsstURj9G1JFjVNsANUy+S7+FgmTb3fZr0HYwO/2Qe0ZhXGcdPRVzt7ZOQMBZIdsO09WDJ0s9Of/jmYHMHAhKCSOX0A3MSMR7tyUrpsZo1mKy2jVyjRdb9NzI4WC49blCPJgBNtAAlPprH38OrL24ahUKfLyQDZcwRUnfLROo62Bb3tv621vI6W1BVfqjfHZte0MP/0kZLCuUIIsbmv3VB0FE4bt919MlGNkRTppzDmLOHOy7tuueiPf7oJ9SCqb0+yC5jx/k30uqDf71weuq1YZo2+3rkAvOrP+73DAYnjBG5rgW35BBZ0cYOKni6vbX2IHH5I5O6fUMvUyOBpi6wXE30OykmMQKLWhXtdvFxYHZBk6RzqS1MRMS3JdnyWT6nVRY/NhBRwZTAsBQ62/3yVd8MVGZCnufLUPvlPf+Z/qeQ07EWJZQuc7yWUFUp7/m3v8Lj13oNZByo4zwNOJCAmqs+h041jxN+o5ihmoXtI+WssqL5RHQumsLQGlhm0+bbQfJLrU+Xpir9NhEAopzmb/hicH85xVqz5G0vbd6Fru5m1BRufYM30Tx/yXM8r+ymYAGXc03TImcDzofd9tg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(66476007)(66556008)(36756003)(5660300002)(44832011)(66946007)(6916009)(316002)(86362001)(8676002)(6512007)(52116002)(6666004)(83380400001)(26005)(478600001)(6486002)(4326008)(38100700002)(38350700002)(2906002)(186003)(2616005)(1076003)(41300700001)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KqQFh6xZlynVHEQ8vXGv7Lr/xVKSXMf7EAeyaZoMyaNKGtNSHwDwSzgBfT66?=
 =?us-ascii?Q?NW/ZcUK7lw0Duu3VF7c4A0qjTb464fYcjANOQgZ6Pzjxo8zrQ6tcLJXWyeKv?=
 =?us-ascii?Q?zoanEEh43wWn9KBZRYvsSdSIDPpcUW8PxnLNKlQJb0v0mGSrEPUa8Y1/XULT?=
 =?us-ascii?Q?ZgnXtSi5zVgdlg4fWvh8fyT9sOL5ur9hTUA/tWKTonWYuqMuEPlRoVkcFvMS?=
 =?us-ascii?Q?j5KwRaiYP1oE3qP8A2Vhn+uuU3glk1+zr6XqgJO0Ml9GvmsbXANInOCKUv5i?=
 =?us-ascii?Q?HXHIlT45k5RrdxSfzHzk+KBiDflsaLmIPcplqe2sPCGls9EIp9ScQURE3jel?=
 =?us-ascii?Q?Oq8V/6Pj4GoOY8D4gBTNhzBeR8AuAbI8CR2ADu46G9XTlqD32u47IcwhpBlF?=
 =?us-ascii?Q?xo+xBWN+zod6hjde2gewjhdub0a2I4F2NMfQgziqegSJNnZHAxCEuJ+vXsx/?=
 =?us-ascii?Q?oPnFXbJGdc8ZvzLlQork2sHx/23kDVv9hFzp+pxARqV+Nn/lC7KBU76vYlpT?=
 =?us-ascii?Q?4a80e/A0wQtPqz21SsBg//v0XQYlbThYcdWpB1zmWlFfEuQcXTw8ydxi5xXQ?=
 =?us-ascii?Q?v7iRiXvZcoZF4KG3pMbgTy2hpgXiZNCLNllsNJ/qPZc2lqfXr3fiVG8OnHdk?=
 =?us-ascii?Q?pvXGZif3wkWfmXJf2XrqmxuAeZBI2bnmukixYM+x9FyCmh5zMc7foWKmuV78?=
 =?us-ascii?Q?jd3t4WvgFk6CAoPgBX++IFZ2Fh/PPFY/VYqHPYICtPKA7p8Jvnw4ELPPE8eP?=
 =?us-ascii?Q?1K8mcszlKm9OQNHZ3u2TzlnJA2hI4ed7aQGZNQ5c0gGesJo7dJWXBTFkk/1v?=
 =?us-ascii?Q?ksz7DlmI+F6PLgOSVDbnilwPl9nXeGDgJsIS4aFetGaEQyDowoUHohQKidpl?=
 =?us-ascii?Q?uPxdJSP3xqFCTYJJvHQlmm110vALPh0Vjz/ZtWTx+QgkFZ4IzCUIAdJpF4Xz?=
 =?us-ascii?Q?GixVGfMiWaGEDSoWicENg6MmUdUdGsz3ksCwqB1/RFcq7hPcWcTiYbR5KE1q?=
 =?us-ascii?Q?RuC19RaiJAjjeubIRhWPCkuRvmGkPwFteu8F7GtqJYctAAr1lVw3zJtkV8Eo?=
 =?us-ascii?Q?QC4/laQDa3tDBowesMz6k5tpDkcQS4ecMCz/L7ZV8ym+bJWhopssNPV9N/QL?=
 =?us-ascii?Q?S+TLAbVRjInZ280/CzDvFdrUgaanbrexuK+77Q3aiSMyHHZTM/SE9qUnYAR8?=
 =?us-ascii?Q?YPtcdj0O1AxspxzXXbhL5kQ3ugxjbl3OKNnNejcrvNqKRi7I/ghSGfytxsaG?=
 =?us-ascii?Q?7t4Ui/f2BXBC3bT3cnWIYYdF44JndazLs+8/wGRteYtlFQHoPVMxXfOA5heT?=
 =?us-ascii?Q?zwe3uUqTqAT9s0/71cLzZM93JIBsR12q0eRnpsrkV5XrXpWr3iaUGc5c2u6b?=
 =?us-ascii?Q?DyopvjEQks2yOTYDH2IJCWLYbDsYRlmb1cd8d8b4Uqm5ciS3m8Y0FW/oYNIk?=
 =?us-ascii?Q?inx522ZqlghrXs1U0WzyiyI/gBQQCxxBWTtRutVJZYto28U8q39NPJkLChdt?=
 =?us-ascii?Q?+PEgi5MPmGhRcEOQqyUtfnXfcQKM61fxWbOtB7ij1YTdIkArA9MFkoMK3Z2I?=
 =?us-ascii?Q?9vYhbJn+PjWtLrsU4Lc+mo4mS4VQCIQ9ELsMYFL7RnhWY/z4G0lIrsqTe9J9?=
 =?us-ascii?Q?HqA8x2+uAJKkbtW2nqSRpY0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b400ab5b-edef-4412-fd00-08da8068b8df
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:54:09.4394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PIWqOjp9rS5cZad+X9KEU9Z0JuCB26ADumVNjx3xtUpIhiOCdv1sG51XJNtxS5gKLHTnR4ogJc4aOrzRq+R1jJqeUaSgJQSdw+I4boH1ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6783
Received-SPF: pass client-ip=40.107.6.98;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patchset depends on the patchset
[PATCH v3 0/8] parallels: Refactor the code of images checks and fix a bug

Fix an incorrect condition in out-of-image check and
incorrect data end calculation in parallels_open().

Add parallels_handle_leak() and highest_offset() helpers.

Add checking and repairing duplicate offsets in BAT.

Add tests for parallels format checks.
Refactor and fix old parallels tests.

Alexander Ivanov (10):
  parallels: Incorrect condition in out-of-image check
  parallels: Incorrect data end calculation in parallels_open
  parallels: Create parallels_handle_leak() to truncate excess clusters
  parallels: Add checking and repairing duplicate offsets in BAT
  parallels: Use highest_offset() helper in leak check
  iotests: Add out-of-image check test for parallels format
  iotests: Add leak check test for parallels format
  iotests: Add test for BAT entries duplication check
  iotests: Refactor tests of parallels images checks (131)
  iotests: Fix cluster size in parallels images tests (131)

 block/parallels.c                             | 217 +++++++++++++++---
 tests/qemu-iotests/131                        |  32 +--
 tests/qemu-iotests/131.out                    |  44 ++--
 tests/qemu-iotests/tests/parallels-checks     | 136 +++++++++++
 tests/qemu-iotests/tests/parallels-checks.out |  75 ++++++
 5 files changed, 437 insertions(+), 67 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/parallels-checks
 create mode 100644 tests/qemu-iotests/tests/parallels-checks.out

-- 
2.34.1


