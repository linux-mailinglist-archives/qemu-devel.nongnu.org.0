Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA6391F56
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:42:10 +0200 (CEST)
Received: from localhost ([::1]:52706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyTp-0005yz-Nc
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lly5x-0005i5-UZ; Wed, 26 May 2021 14:17:32 -0400
Received: from mail-eopbgr80118.outbound.protection.outlook.com
 ([40.107.8.118]:45828 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lly5p-00006L-DX; Wed, 26 May 2021 14:17:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJtOMDjNt9LM2snIUihVuISsLik37Y3xv/KvBIPGiMlFZeVfGjPFWc0KQME6LVr5Rg8XdU0DNq8feJGc6mowZD+i6o/95cJ5k3m8l2FYH9G2FWuAwTkFBwHv29HkxJG8QJxoMGSFDkvauiprxtpnPr6qThjg8z8SyhCjFuZr7RWlWZABkzee5BYXZP3pRrZhrCOIIR0brpupBG5QyRMbNcsLUrGxhdO/H+288fIDWquVDiiW57q8vMcG7n/GiqOy3MU0yo95rGgtomTgUcSEbOIi6E0BfGrTW48CRxKdjxHcvJvx7Yttt7yBAxj7UIO/rdK0red2q77CGqlGg0ihmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt/GAPwGEUaTGTo/EhF3rHAVxtlueW60mMOdeBHihBw=;
 b=m2R01msFEQgNcwFl6a0m1gLS57vJXmoIIfR2gzbetolKlqk+FHjwgScEi6K6yuMHEB0AY/b+6uV3WU0lox+C3/UvED+wm9ckmLTBcdRPkK/np0VhK3ktWy/JWj9NDq6ma5VjncVFRRmXeO7NCK8GEsXHMvXTwtCUjgGXg/FruemOIhu3isuXqCcAP+FjNjXlAZeX8oZGvwYRZbgJdj4dWe27GI1wNWaQQpPGQAgHNjwIvGRJgzmaM87drqNsu0VYvJdHbZc39T9mirXOyOLlDzEGwvPJcXUjDb4uZWNakYk8tQvYpcrLqTGzsvTPyK4u/BQC9/w+pZg1O1jXxlWkIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt/GAPwGEUaTGTo/EhF3rHAVxtlueW60mMOdeBHihBw=;
 b=npSTF6IHwpEo1rLNMuQ8yrmWamqSKi1hjdcHlkZkDiRF/urxa4bnPhjpSpH3WIgbsHRjiRwD9ZKMfprKdSFlVY4kCjLfKWqTfWGYhqhx6uNaR+CqnXDbO1kTUBgLbio5JjGdhq+Z77VIwuN/IwLIjNLV4pXb4BXK9rmkLUCsWO0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4408.eurprd08.prod.outlook.com (2603:10a6:20b:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Wed, 26 May
 2021 18:17:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 18:17:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, mreitz@redhat.com, qemu-devel@nongnu.org,
 eesposit@redhat.com, pbonzini@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH] iotests/check: move general long options to double dash
Date: Wed, 26 May 2021 21:16:59 +0300
Message-Id: <20210526181659.365531-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: AM0PR02CA0186.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 AM0PR02CA0186.eurprd02.prod.outlook.com (2603:10a6:20b:28e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Wed, 26 May 2021 18:17:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93d591df-4739-4ac5-1122-08d920727cca
X-MS-TrafficTypeDiagnostic: AM6PR08MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB440839159310FB0DE0B491AEC1249@AM6PR08MB4408.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NNUEcEJ/oWVpjkewD0F3Pe4gb8+oUfpOmRvwmbxccpDnvQSYOBvvrgIPgp1qAgnx4QqTE109NA8OfrUl7Hg0mtBfJRAsYClfz38aAvP8BIENed9MpCmdkLd0fQvUiO2nbrHcopAyl3lnCV6Gi+NamOZcIvu7XIoh0mQ7pNZXZnZmMzx6/G5n7ehM+BusDU1XAx/4SP/J8goOfTYHuyQKsQtU+QgCE3TotZ2xyeWneBJYxldRL6RQUJ/nUknCSinJX6wQUmVHH2fgoSulQ7wzKtJbXhlbT0un4LJ9BA1Q+qeUnl8ydPBCrnOm3nTrg6KQ+vbFgQUG+KtMJqI/0gacyLFZKLc1VIgsfV49hU1x3yIDhblAjZT93fPt5iec5FdQetB8LwEI+3fANJD7vmJZHMmwrxp2+u0dUCl0MzJVJqvI3CVgLtQsfeDHvB/ei+NnGdO11E9vw+QlyzGCiuvQ/W2sdMfhrsNDecSTTPDENdBfV79MVWyM0fMPTSzgF+ulhE4D+qU1ZGJwljj65oqW136K+CqXU5Xb7Ygtijh7u2bBTDUyx6cItHai+Ttefju8EbV3TIpPh6DScD+taLTnPh82qeaz27MNhi3kZG8lvq1c/KDHZtPyPj8vX/3DRMympr2zXo16NzAAJGrOWHZkruNTzS2SEy/+Jn63FmpREwzSpKNrNn5KvnVaeVsDw1y0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39840400004)(136003)(376002)(4326008)(36756003)(316002)(186003)(8936002)(16526019)(5660300002)(26005)(38100700002)(86362001)(38350700002)(8676002)(6486002)(66946007)(1076003)(83380400001)(66556008)(66476007)(478600001)(956004)(52116002)(6916009)(6506007)(6666004)(6512007)(2906002)(2616005)(107886003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?S+PPGk9KLsW8X5jkCGPF6TpAyH/LILBiKA+MtXQLuXx2VI2V86Tp3A6cvI8S?=
 =?us-ascii?Q?bguAsaF2lB0vZW+sxMxKQYHLyZga6v32i7OjjIeVbgB1aq7dHiew+S4tJzEd?=
 =?us-ascii?Q?Kajd2mvVUCW8iPyAio+XWJfR0uO0s0CGTYhn8Y+SxI05c68noRIG0+M7JMaj?=
 =?us-ascii?Q?F3KI1qacj+4rC+xD1fMelBOkqVS/iNKGtxc9v0ljkwBL4S8DEwhdyrGTnu8y?=
 =?us-ascii?Q?GtLVutl48rvWz/mJdO++cQeAD92oxk97YoyQ+b0WDBnCIIr+2O4vMtWxwBh2?=
 =?us-ascii?Q?M/TBu+S1G4nVvwxQzEbKy3zE91040RfOQa/EuSgpT2AewulmJ/pnF4lNTRLs?=
 =?us-ascii?Q?O768uQd2gt9/ZtqE1/wpw27JEpJEWH/xylEfD9mCbhp8teCVlHamrCRp6CsX?=
 =?us-ascii?Q?K3AKK6exE6NNyChvBaW1RwUGu06VtBIAbMwDyVe3xMsk9To532WDXCA1Cw4K?=
 =?us-ascii?Q?SCVbh8W5DEsekjMFWJONc0kSB1pwpvWdkoKJXUgxy/6abjMVNXpySeNATMUm?=
 =?us-ascii?Q?2lr0Tf8Mu9s0ITN+XczehvFbqTdjdBDx+CLlbs8cPtWgThtG0GM3bcTf0q+W?=
 =?us-ascii?Q?vDyu6C7JqbX2o1QaHfAj9KlNKqgC/1IaGcbkqlm8jDV6GcgIdfy6OrFGfhbm?=
 =?us-ascii?Q?bdl4gWMRIPy+msQVWxA7PBe8OL80gXvLuN7xtiWmlbV9V9yMfncFB8hQ6UrP?=
 =?us-ascii?Q?DzNaSkHT9kM2WQ7nRwFwZPTxw/4mOmnnK44XGSRrzATOhcFv/qsQd3MGLhdX?=
 =?us-ascii?Q?792glVPZGi2AGm7Fn9dIFSXLbKql9V1van0r5nz2EotQVuPuxm0mgMXXqQD8?=
 =?us-ascii?Q?C3yDkXKA8MzE3061o81klgQTc8lpAYFNH/rY7N73FbDeR9qIFISQLgggtmnK?=
 =?us-ascii?Q?ZhijV1I/lmDR6WQnUxUvNKQwQI2HJX7RDh1XldXXNYXzISZHphI+mKYpknF0?=
 =?us-ascii?Q?4zkTy9qdDX60ABKmBuhyW29M0pnoJwDsSdpf34g8Frz6o6Sf6IeaFbq5HmRs?=
 =?us-ascii?Q?nFgcNps4fQv6XTEZoMRBiQWaGk2oMOXx+zOoz+N+Kpo1gpKVHz35uoEwq9Qc?=
 =?us-ascii?Q?5hwudOlS+dyt+wUdSFR2Yp4PVFyKHyluxU9ICW3kOZlqHl6JoOZ7rlTHyOxZ?=
 =?us-ascii?Q?s0s/47F7rGTuYrL3uhNcdGB14NgvrbQk+WP8K6gxNYDeavN2OYsPqzKqx6Hu?=
 =?us-ascii?Q?ZIEw4HWUROKgcxkARy3VqpBn10zmMK1Q18ZVvA6nAA8ha2Dpu6hqwhPrC29O?=
 =?us-ascii?Q?oZ4pXDJ2T2uSwP0rjTu8gUY2YaRAmjjdWBeZYdi6fZIDm1JjxPpGaMYY/ss/?=
 =?us-ascii?Q?TSVwRlN3SpfSjukYTfV95tby?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d591df-4739-4ac5-1122-08d920727cca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 18:17:14.3027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olRmBlwBtAxka3V8b+r7436t6PNAo0eAK6hmaQePDrd+cJZvmELFMwHw4BdyJBS0GIGGWMtvl1k1QOo9OrJ8bCKSCiqw2L3tz0B0MVS8h9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4408
Received-SPF: pass client-ip=40.107.8.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

So, the change:

  -makecheck -> --makecheck
  -valgrind  -> --valgrind
  -nocache   -> --nocache
  -misalign  -> --misalign

Motivation:

1. Several long options are already have double dash:
  --dry-run, --color, --groups, --exclude-groups, --start-from

2. -misalign is used to add --misalign option (two dashes) to qemu-io

3. qemu-io and qemu-nbd has --nocache option (two dashes)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/check-block.sh         | 2 +-
 tests/qemu-iotests/check     | 8 ++++----
 tests/qemu-iotests/common.rc | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index f86cb863de..90619454d3 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -77,7 +77,7 @@ export PYTHONUTF8=1
 
 ret=0
 for fmt in $format_list ; do
-    ${PYTHON} ./check -makecheck -$fmt $group || ret=1
+    ${PYTHON} ./check --makecheck -$fmt $group || ret=1
 done
 
 exit $ret
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 2dd529eb75..3f3962dd75 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -32,11 +32,11 @@ def make_argparser() -> argparse.ArgumentParser:
 
     p.add_argument('-n', '--dry-run', action='store_true',
                    help='show me, do not run tests')
-    p.add_argument('-makecheck', action='store_true',
+    p.add_argument('--makecheck', action='store_true',
                    help='pretty print output for make check')
 
     p.add_argument('-d', dest='debug', action='store_true', help='debug')
-    p.add_argument('-misalign', action='store_true',
+    p.add_argument('--misalign', action='store_true',
                    help='misalign memory allocations')
     p.add_argument('--color', choices=['on', 'off', 'auto'],
                    default='auto', help="use terminal colors. The default "
@@ -46,7 +46,7 @@ def make_argparser() -> argparse.ArgumentParser:
     mg = g_env.add_mutually_exclusive_group()
     # We don't set default for cachemode, as we need to distinguish default
     # from user input later.
-    mg.add_argument('-nocache', dest='cachemode', action='store_const',
+    mg.add_argument('--nocache', dest='cachemode', action='store_const',
                     const='none', help='set cache mode "none" (O_DIRECT), '
                     'sets CACHEMODE environment variable')
     mg.add_argument('-c', dest='cachemode',
@@ -85,7 +85,7 @@ def make_argparser() -> argparse.ArgumentParser:
     g_bash.add_argument('-o', dest='imgopts',
                         help='options to pass to qemu-img create/convert, '
                         'sets IMGOPTS environment variable')
-    g_bash.add_argument('-valgrind', action='store_true',
+    g_bash.add_argument('--valgrind', action='store_true',
                         help='use valgrind, sets VALGRIND_QEMU environment '
                         'variable')
 
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index cbbf6d7c7f..e2f81cd41b 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -124,7 +124,7 @@ fi
 
 # Set the variables to the empty string to turn Valgrind off
 # for specific processes, e.g.
-# $ VALGRIND_QEMU_IO= ./check -qcow2 -valgrind 015
+# $ VALGRIND_QEMU_IO= ./check -qcow2 --valgrind 015
 
 : ${VALGRIND_QEMU_VM=$VALGRIND_QEMU}
 : ${VALGRIND_QEMU_IMG=$VALGRIND_QEMU}
@@ -134,7 +134,7 @@ fi
 
 # The Valgrind own parameters may be set with
 # its environment variable VALGRIND_OPTS, e.g.
-# $ VALGRIND_OPTS="--leak-check=yes" ./check -qcow2 -valgrind 015
+# $ VALGRIND_OPTS="--leak-check=yes" ./check -qcow2 --valgrind 015
 
 _qemu_proc_exec()
 {
-- 
2.29.2


