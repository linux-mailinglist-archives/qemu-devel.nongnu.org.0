Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D333727E1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:11:57 +0200 (CEST)
Received: from localhost ([::1]:40674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldr5w-0001If-8H
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqwM-00011Q-Gs; Tue, 04 May 2021 05:02:04 -0400
Received: from mail-eopbgr70111.outbound.protection.outlook.com
 ([40.107.7.111]:44193 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqwI-0001yk-Tq; Tue, 04 May 2021 05:02:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzFm4iB7eedG2bQhChlrAIVUloJpbQ/Hp0ibhBETYscQUHegylKYz0qNNuZFth6IMFT+9QpH5U9qh4AVmc9gN3h1WfzUHGyOW8cIeHWPc51ZEkq6UvgBFx49LFGWpMauQQmiRLBGwZ6w0KLCd0yJCkA/2tupcZjynfSmR5yC71c+J+GR0fLxVKorDWZ7h2IFNG3BDhfs7HWyc9MYCPpIDGPkWJwv7TyBMV6YvPgRUKccOu1aXKqEoWDeWy4vk1EzI2iXR+ZUf8QhVgTw7So6ZzIbVXKqwvdrRv3pFbNBIWk4pjsVJeCntomoM9oyXSgmKs4Fv3qVcu3gvgCen/GCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8LQU1ypnAYg+A00+udoj7tUB7p/guL2En4vz9Z7lOg=;
 b=CgWuIK8TosZSoiiut6lW62c9SMhdh3gOF8YfnkzGM/ZxydjSdxXqeYY+dwvkaMGBt7Ozrv+yos377lRmBVmdh5jIMlrsIzBeUreYf6Ca1LQDBo/NJqx4IlqXuO73JWDQiUyZlDmZd8xKKIJROyf+zffvn0J7FxvgzFrTmXao7VbwBw5u+AWsAPWzIQOAqm9nKichc5WnTB5LjwtR2Fo4FK/SDh3fFVEVaAa5sk3TpwuhPKSWs0O9uhyZ0zRmpwt8jlrrSJdroqCOjda0m7Wr12r8MWE67foMASR/AesNXYgEQrfb6V+L8zXwRMAllRC9WDdUDpbO+noAcCnkUlMXkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8LQU1ypnAYg+A00+udoj7tUB7p/guL2En4vz9Z7lOg=;
 b=df6B8gju/Qq71fOkh8LC8JVrUOKUIInDQhDshaw+q9JSMzjlHPJKocwW+H9Y1tN94B66bMzmn3G38SJ0A2a0F4HhGc8jsn1dYexBxs1X81XGjrv7Z1V/Kd7Eiz1ObhlSKYvYJ910thS365PME5nB+bHgMXQy/lvIhMi3KmLgIBI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4280.eurprd08.prod.outlook.com (2603:10a6:20b:b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Tue, 4 May
 2021 09:01:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:01:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, peter.maydell@linaro.org
Subject: [PULL 7/9] simplebench/bench-backup: add --count and --no-initial-run
Date: Tue,  4 May 2021 12:01:11 +0300
Message-Id: <20210504090113.21311-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504090113.21311-1-vsementsov@virtuozzo.com>
References: <20210504090113.21311-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 09:01:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dde73d92-b34d-4cc3-f6b3-08d90edb3801
X-MS-TrafficTypeDiagnostic: AM6PR08MB4280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB42804CB84BABA6FC5F28B8C8C15A9@AM6PR08MB4280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hNulB/UB8h/9etq5uMI0U+7P6E+eJXaukj6+PTFnPe0mOnO4rIiB37tnVRxVQ+Ia8/7uj3Z3ACimp6SKVy1HXhol124YWG0KVPeEu1hCYfCXYtCKiXKi/FDwnf0ffYZ8ZKuk3KC72m8XV0wV9j7Tg7jZX9g3WrucHdyvKX7CbIuGrndg2OtWlvbiwxDZh2vQjT17RtwzHhtXfy3T7aIZvaqReaWPZBY1MeMBXwya5sFrxh6K4HmCp26Db+JJYk42ZIHW6htJqc3r3/gzOXDXpHFIQZqPBFbdytk2oJodx5h8gh4BcKQa28X+5xoJX5qMObTokZCRLDtShG1Db0V+/E7eeB+RxFghx5YF6Ih8q86BxW5Qpn9S1Mv3HzD8mLs6KQNvs//6NurzM/Ci9Gv+a7mNTgWfDovuNBSGMGbVYmvVIjfjrMTICv8mWh3QI78SnNnSaY817q6kki8Vt4H0lgyYb4B1aNsC+fAwqoSinmGIpJPwrBkSK6uVEBo3kYxj9X8Dgj8WtCoG/EHc+25c/RdUpq+ufBdVOd2aXUoyCsqPXSDu7F3glDQyXNdxfp5yCpnINmSinQGRTEDWCW1XCUwfV45MGxgxA1x/FL2OUo2NZiiUqEktOf9ktwC1mT+NJR4PIhnXtzLJ9ePpzgU4h5ZjF21vldHO+noOuSWwmvBmMTpmKL/6yRMy79iOeSX2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(396003)(346002)(376002)(366004)(1076003)(66556008)(52116002)(6486002)(6666004)(38350700002)(38100700002)(4326008)(66946007)(66476007)(316002)(26005)(5660300002)(36756003)(6916009)(478600001)(8936002)(2906002)(86362001)(16526019)(8676002)(2616005)(6506007)(6512007)(956004)(186003)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?x0i9/QaIx4xAJvYY8NLnrMSgflkumW8s524RdmAEF5tw5py/SNX4prOzc/DP?=
 =?us-ascii?Q?Vr8VV2fl+Ag1F5Q2TnlP+QEnw99KN5drG/N0vmJnH+FyIA2bITpRgR5xvjWr?=
 =?us-ascii?Q?KTr/eZNsum71A7mMixfOgoGBJ+2yzZVp17hpE6SEbXGbPOV639luo7tKP0gm?=
 =?us-ascii?Q?Qyg8xHsJhe1Br5Cfv4n590jgamFo6jT1PgP9u55kphVICuboF44RUkWZ2gLG?=
 =?us-ascii?Q?bdF5iVSYUegDsUWksAXwyxm/kcHg9ggs3ZN0s2Ke72lmKJCh7QWkqqyP9Irb?=
 =?us-ascii?Q?K3tRdEX0gzx1JLlUZUOAtMyptpRxBO3y9sXgJSFX31ahLNUMP6oDgR87Rvl8?=
 =?us-ascii?Q?gTYmoxnBzHDbqzEW/4t1yFjQJAJkIDQoIWjXu+qxk5Pnt25scYveKeEPUupB?=
 =?us-ascii?Q?YpilEkvd9UCipmbSRLMWk09wu6fMILB9rQNo2tth+jza6Q1G9/8fDoE4WbSr?=
 =?us-ascii?Q?jyclLkAeykqeKfnrNl1hnLgjNTf4uOvxBZIRcGEnwMGuj7ZgoW3tQFcBEqra?=
 =?us-ascii?Q?kslNyIeThpy4TQaUzWS/dQv6dNJ7JrP9KGZJrvM8K3CR7Uys4jJCWo3TmSVu?=
 =?us-ascii?Q?r9q0VOGOBHD0Ck3tYSBPDoyBO9kuEFRJ7usHWF3/SklhMxHUSAVow0lMeBG1?=
 =?us-ascii?Q?QRr57K2MJ5mA2e4BKeARzo3LQyhb5HJQ7vRDnfpzC5R+wwTbixTQyPUthLEy?=
 =?us-ascii?Q?SRTK6zqKeKJjQogMvLHP7n+vRO5TAxxCBn1vL/G5Dl35NAIxrGeKnSBrma93?=
 =?us-ascii?Q?kTo9L2+znjAgwNZmC11B/0BLAsrqXrRtGVElmIzEK5mYP+ZJBmEZmrezr3PF?=
 =?us-ascii?Q?h19DpyCGP4NhmOVG5ZTtZHBEZzrRI/A4U8gCGw3kQismAyHaNsyG/ERBWiV7?=
 =?us-ascii?Q?Nvhctlt5HFzaIK8uTIHblYi18ZEJRBgK+9pzK6Ia7j0gI0/mecx0vciP+NX2?=
 =?us-ascii?Q?P9l6o1YYQp17kyI+StqSbEtO1yu9V2zBcDvvbuutbWlNWeki8FMpMBVYt4jf?=
 =?us-ascii?Q?72fiRcbmZQS0PAgKp9q+o7xyZ0w8boKdJ6kSP3nFidUXJyiu1h1oJcy8taWo?=
 =?us-ascii?Q?RXv/qMCTtcJBnbPku13qRq6vo0nJByJjwYXOihyg+MbHHk5lV126ZUKRnol+?=
 =?us-ascii?Q?mvqyjkrqGDBUpOu48xeWrixAl6LWonheTlvT8l1zA3PVQEVYnlWmTb2zT8zo?=
 =?us-ascii?Q?yetKHk83NMirppfu8dyugz0Ccjko6Q1/nd15xIVk7KfeiXZn8ulBmKmmUsLO?=
 =?us-ascii?Q?sBxjXRfCDjOKs7kwN5qObWVmeNZeqmuWbesIew3BRKlljIRHVdmIRLJRR4uO?=
 =?us-ascii?Q?4tiKJzdL7cBW2QD/EGiFBet+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde73d92-b34d-4cc3-f6b3-08d90edb3801
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:01:35.1468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8jXAJdgpuZcg/0B20U2Hjx0C/LTBsPahBKYhu9pTqYrEqVRt6RVI8ESAdhC2h+gB8wOMs6AOxHOZUQ+q1UBalILNp9KFGvWkIcAwfOTYbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4280
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

Add arguments to set number of test runs per table cell and to disable
initial run that is not counted in results.

It's convenient to set --count 1 --no-initial-run to fast run test
onece, and to set --count to some large enough number for good
precision of the results.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/bench-backup.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
index a2120fcbf0..092fed5816 100755
--- a/scripts/simplebench/bench-backup.py
+++ b/scripts/simplebench/bench-backup.py
@@ -155,7 +155,8 @@ def bench(args):
                 'qemu-binary': path
             })
 
-    result = simplebench.bench(bench_func, test_envs, test_cases, count=3)
+    result = simplebench.bench(bench_func, test_envs, test_cases,
+                               count=args.count, initial_run=args.initial_run)
     with open('results.json', 'w') as f:
         json.dump(result, f, indent=4)
     print(results_to_text(result))
@@ -211,4 +212,13 @@ def __call__(self, parser, namespace, values, option_string=None):
    both: generate two test cases for each src:dst pair''',
                    default='direct', choices=('direct', 'cached', 'both'))
 
+    p.add_argument('--count', type=int, default=3, help='''\
+Number of test runs per table cell''')
+
+    # BooleanOptionalAction helps to support --no-initial-run option
+    p.add_argument('--initial-run', action=argparse.BooleanOptionalAction,
+                   help='''\
+Do additional initial run per cell which doesn't count in result,
+default true''')
+
     bench(p.parse_args())
-- 
2.29.2


