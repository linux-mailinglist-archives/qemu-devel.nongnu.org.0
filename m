Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B6330A394
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:52:29 +0100 (CET)
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Uwe-0002uU-Uq
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6UvV-0002AO-IH; Mon, 01 Feb 2021 03:51:17 -0500
Received: from mail-eopbgr140129.outbound.protection.outlook.com
 ([40.107.14.129]:24882 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6UvO-0004VW-Mt; Mon, 01 Feb 2021 03:51:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXPLlXopk+MIlKOpvrnlYGg5zroYmsmgT0L3EHef9YfC0YDlCF5KpamEgt3OZFB1BXJ6sC4Qj+YsmKPU0YdpmyCsBFV6NwyWbzmOYm7z3jmXkAGygOp9QhEctFjbJVaQI+RFqeozeGMjrVZCEkrf7cItDdN8yW5X6M5pyMTI2A9rp80tNVaLjYVvXCLy1alYiFx4yyEyGUbxiQJ3jGOGJTGxM41vE7/cJ+WDWlY/MdMMhXb3z1L8glwMsTgdIayqECyLLV/6EzbNEVBCi6D7ET7PM+4B6xYojcKC5SNXUbOaMOLR42mKKV7HiZPdT7Tx1hiwPSKxznj+b8dHu9Zvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ruqxm3C+CPqINA3MNp4b7WZIw4AD9/9B2YllE7JZm3Q=;
 b=iNe6Fk2Nq4elh2ETb85YFFNElGoN72E+sA2Ft5t1jRcKRssl6sS2KD4M5y4ZXbkoDSb+5LO/w198eDPMsgZI5zb0yFOQX7PWjAyitLQkFITv0BtmBRlri5sZMAbs2yfxQu+Jaaiy9Uz37a2J5ph9nl6N+SB/yjpLMEwo7M94vpjBAMkGNWv0x8zfy53qviKnO/CeJzUs7Kn86s+v12CleV7t5RQkap6KMBlBSpc9Q1RLWCP5dFE0wdXjZbeoAux8I1i9EzkAIqG+68g0LbTaHgYCOeiAShF2yaAmLrL0fMzV193LApPo0BGYeDSj3zHBsnqrqewiQYLkYSz/tvnTGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ruqxm3C+CPqINA3MNp4b7WZIw4AD9/9B2YllE7JZm3Q=;
 b=I3MwWjUuOnSkdI8bqMTgidiXS7eQvGa4wHvgu2/RA5labnp81tSm7IQ1X59MyqUte88uGIDvogA05I6LOc2dEIXuHvKM+eHmu0iUs6SfBgXwsnQ/PMBD54SmCJecEq5o5prMlCZzvo9k6frgDo8yE2GKGHDarFaYI49yycNmiFE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Mon, 1 Feb
 2021 08:51:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 1 Feb 2021
 08:51:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests: check: return 1 on failure
Date: Mon,  1 Feb 2021 11:50:41 +0300
Message-Id: <20210201085041.3079-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.160]
X-ClientProxiedBy: AM0PR04CA0034.eurprd04.prod.outlook.com
 (2603:10a6:208:122::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.160) by
 AM0PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:208:122::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Mon, 1 Feb 2021 08:51:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3122ee4-8314-4104-b8a8-08d8c68e832b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62164DEE2785C710016173B6C1B69@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s+TIeyBpQAmxKtIAMKaUD5A/o33qvQqaQZlwNiknG0yoHWxL361fTVAak3CmmGdOM1gyhInYBAVxBq50uaxWoHxqFvg/mbLDR1oMRUmKGIVMTG3hArIqHM1x8fh7AzVBCi/UEPZ7hoK+cPVsH779XkUoEc75HUs0S5vdfkRKgPaWrezug477yEcubr31sjI5B2ybUojVQ/6PolOfCKCLhqMVaObfFoeB11h2zp2LUgqsgl/uVKYOmjrTD+IKQM/rovZepD+NWtTQaKafAPKI47QBthSEVGqwVXmes1NSLWHXvKfUuNEyWGUXlhd8sq3QjJ8Qyuu5mnJOEmAzbWEz4WT8gp+RSVe4aLCvsa8HY+UnXGvyNpSIXXfDaPZ+tb307Sck5KC0pEC7cvTp4ccdqcs8lP35nYXjCxLpePB4pTueDQR4KgPF6vtFBNafD4tw8IaeOf458zsr04KkgoPiiFhr21X03xZ9jpc2ZWMF856HCxkn7S5YfEVrgUZhFD0C+DT0WpwDno+SC4C0RAZ5xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(2616005)(2906002)(956004)(498600001)(5660300002)(6916009)(8676002)(66556008)(66476007)(52116002)(66946007)(36756003)(16526019)(4326008)(6506007)(186003)(6512007)(83380400001)(6666004)(6486002)(26005)(8936002)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ThkcKO+Y5KMO6OU8u6aE77H96GZ/XmoHkRktdPvLO52GrFe4lYK+vfaTrlYe?=
 =?us-ascii?Q?De/1JHE5lKkF3NxTJGvuj5HrTZIiP41NTYz68ejcS4Otjkmf/gjM5tVJjPgy?=
 =?us-ascii?Q?zZ5iPsbbZEYwtrtIgtdCrhQkmzA3tkujbGQPcZ8RZKZgQP+isRnMrkUxsNXQ?=
 =?us-ascii?Q?2KJljM92HMbaW90T70S4YMq9QtqI2oMF3bDV4kbLfzEDzJPjCyDERjidSpV1?=
 =?us-ascii?Q?nAHlbBDw6GcyHnYyStlUKLTuDmPkOmA3fpWG2yrB3qET1i0yQPsAQM5eZhtH?=
 =?us-ascii?Q?uCckE/RqNj9HUK/vVrhBJWotUr4V4YA8dvKiP/5nAqBeMqM4fhR8fhKPawHf?=
 =?us-ascii?Q?OoQJ+VKhfXDE8tJbRmIkKh30l+e9saUkr1aolnzmXXNmYbQ9bLXePqbpQG8L?=
 =?us-ascii?Q?/ySQr2dcq9mvN/KAKh6jsgPQGUfBpEqVQ4kr12m+4RllF83LKgadF8NVWHJG?=
 =?us-ascii?Q?R5f4HMMAfVwWi5Dm2I4lMPvHy0Cp6pDe14a/n4qhQywE0BYT4AgSGtaipU0O?=
 =?us-ascii?Q?5ImmTNzqcixIJz8n6477ahzVyxBodEnonNLTWd1qfVNfWB/SwfUgAcIjpTbS?=
 =?us-ascii?Q?2H+M1vhVb+IF+4ZFJClSuxSPWqo//6W2EurpWS9ZjdU0NB/W5WX57CAT5wwa?=
 =?us-ascii?Q?Of60Gf/TJaYG5nPkjGI6OTAc/TtYwevo5uOB5m924julwCGjXln+fVaAP6fA?=
 =?us-ascii?Q?dvUTuMo/hPLCbF6J63/6tVaiviiqmKorrS2fyuwBZr0WiQqBRwUirgMNvtSd?=
 =?us-ascii?Q?5Y3NAcStZ0ABSaoRLj6tNrwqHrfroD8MnbQosnyt3nVj1InIL452Xez8K3An?=
 =?us-ascii?Q?0wJxvYjEIMbUGIhRpcmdrrmWyxC+DdycR6Gn14KPNyy9Z3qq7yuidO/aZ1CX?=
 =?us-ascii?Q?NN9Ot939MicmutFqqURO7EQLbxQGHG3OpXx7y7lLQfnn+sQYhc5Etnc4EnKm?=
 =?us-ascii?Q?s34rhuTRvFVYGNB3UFATAOnLrRSdmLFpY6zCbZBWK30gPKLAVdL8eNvYgf2m?=
 =?us-ascii?Q?tOJoTyMxnAbb5et5aQ+EAnat5ryKzkrt1ux66c2TsZOams7A0xXJ2rtlr58q?=
 =?us-ascii?Q?iH317nbj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3122ee4-8314-4104-b8a8-08d8c68e832b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 08:51:06.2804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ahmgFS91w7BoiYY4xk9dUZ1bB1FFJll526Lsp4/fwtQkwzacq2ac5J6iASIjqcw4wYi4H3cXhD7r84myxFrOWUvKYFu/VbJlwkTAe0fzTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.14.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should indicate failure by exit code, not only output.

Reported-by: Peter Maydell
Fixes: f203080bbd9f9e5b31041b1f2afcd6040c5aaec5
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/check         | 5 ++++-
 tests/qemu-iotests/testrunner.py | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 5190dee82e..d1c87ceaf1 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -140,4 +140,7 @@ if __name__ == '__main__':
     else:
         with TestRunner(env, makecheck=args.makecheck,
                         color=args.color) as tr:
-            tr.run_tests([os.path.join(env.source_iotests, t) for t in tests])
+            paths = [os.path.join(env.source_iotests, t) for t in tests]
+            ok = tr.run_tests(paths)
+            if not ok:
+                sys.exit(1)
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 24b3fba115..25754e9a09 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -318,7 +318,7 @@ class TestRunner(ContextManager['TestRunner']):
 
         return res
 
-    def run_tests(self, tests: List[str]) -> None:
+    def run_tests(self, tests: List[str]) -> bool:
         n_run = 0
         failed = []
         notrun = []
@@ -363,5 +363,7 @@ class TestRunner(ContextManager['TestRunner']):
         if failed:
             print('Failures:', ' '.join(failed))
             print(f'Failed {len(failed)} of {n_run} iotests')
+            return False
         else:
             print(f'Passed all {n_run} iotests')
+            return True
-- 
2.29.2


