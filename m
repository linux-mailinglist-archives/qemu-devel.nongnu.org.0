Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352346773B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 13:24:27 +0100 (CET)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt7c2-0006ZK-50
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 07:24:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt7aZ-0004KO-Oj; Fri, 03 Dec 2021 07:22:55 -0500
Received: from mail-eopbgr70128.outbound.protection.outlook.com
 ([40.107.7.128]:26637 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt7aX-00072E-Qz; Fri, 03 Dec 2021 07:22:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBQf0H8iRSmZGcRh0G2mkgH42XUbr3gH3H8PnQoFFnx0afArxtnL0XNMyrkeKun5yS3/6MbboyHfa+KkPHuR9tLB9abeZZIs5RZjl3SIIhEucRSSt8MTnn3MEi0DXPCMUpKrNsIaPWYc5hHx69uJhyYlB2AwqeIv+FCWmqJvq47csrmDXTSxsxuDXJwTz1Kx2llQ32lw3RxvZcg9CQV9t3DD400UqkbL/sBuFoKpG9hEsczr6YSQ7ivk0JVa7Ad8M/LKLic7Z1h/d+AvjBAQO04J8TtkBR4eUn+oNQK9E3myNBZrTAJ72DQOFG5G2mL0iWqAQsY/g4aPjH4c3ZSTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EprwCYzkyzzrxWNbGWpeDBoGmOK1m4ukxaDpxzDhnVs=;
 b=PnohMUggiYMFpVGzdbbyNnvX7nAr3EjbsqKHdS5uXnK/kay6B5jWaz9C/k0RfCvduuKwq3ekr/BWeNEm3LJrR+U9okP2M9AmmZWSfvGb099jddL3raOhVnVbcqjCeWk5Lz0j/NBM3C5wEFi/OMuZ747vv7PcWPrSGeufssKxOCPSKddmpcA/v6mHtbKonESMNZAlGwCv0Z5yxmQB/5AWFusBi2T7AbT4TSOTDmTf5tjGfZyL4QquWGUKQ3DLwQOjzOXAgC1m8PTzqMC5dH7zmLM2OpF579/cEV7KMZpzNhxsV4qMRZ9NRI3EC6JBqNYpAd4nV3rBhK93d0D+BDA3Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EprwCYzkyzzrxWNbGWpeDBoGmOK1m4ukxaDpxzDhnVs=;
 b=HYKeEIQ/+BJ5nehjbLf+6YQnU1uUet6+ieaPbgJPQNPwHlT/DUpHdD8xaJyUwenm8qqzQjZ3jAhhd8AuAazG7ajfweucRm6a5qp8fYDcvojvh4pgfP7kXzy9VjoVxRJBhCO/rB9f76niyMG7USAJIbG3Xefop9axmSwHr3kf4qw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2178.eurprd08.prod.outlook.com (2603:10a6:200:5a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 12:22:39 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 12:22:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 2/3] iotests/testrunner.py: move updating last_elapsed to
 run_tests
Date: Fri,  3 Dec 2021 13:22:22 +0100
Message-Id: <20211203122223.2780098-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0111.eurprd06.prod.outlook.com (2603:10a6:20b:465::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Fri, 3 Dec 2021 12:22:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82b6d393-9b27-4e43-fdd6-08d9b65798c3
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2178:
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2178758BD35A4D597B407442C16A9@AM4PR0802MB2178.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2A7LjGGrQssr9ExFK1jSMkP5m9U42AkRrykUdwtvjAEsv2qSs3qd05GXWvDjKZiG+ZZJL4tPuiG5Qa5jYNSqGR7PJ0VnrSgrazaaKCPL71OO77qiR/1hIVSbvkukug2Qo2J8CFo2gaNKxMl3Qu+9H03i1qypghkiaD/+CDyffwYX9UqT8OY1XssHc91y7RZ2J5eoe6vr4A8vz8jxkgtxxcxGoEdjREQ43QcZIf4ct4+zY6ii+WUAVUV1ucezzWkm/J3dVaRxUPy1b+BZhO8cVugHQvY9mNYjP3nM+yCun+Uq6mOxfPF7lIsL8+U2AIokTRW0zsmMTBC6pyJbLEszxy71l5jOQn4c69S/4lZBSmJpRFScFczVbMdFEbW0/ehmPZzi+TnO/FFZLJvsYL87vYjqfaXoCfFm9NIjOa1h+zyeND+icm40j/dX41dcgDFZfJ/09Vgi4MeGFzBC3G7JIiUIy54Rv+6n4LFVvMdJ2h1OMGFkOtnuygpvVoAsfXDHGpWyuEhmzXhANb+ThJE8TsyXnsoWedvzeEvGNINQ7GiDDeL90+Dv1BG2eUklWLi3XIFevGb48y9rB8qgZQYAFV75YqMBbuM6ove/puHc3CK1hhzTNx5eoVBtQeTP6hDfGAxXZsqgHNE9q8QPnKGM/JWjE/uvWRAu3WlfIfiu52wkp8BvWG97pcOqniCc7ygqknQ0LEMZcOFQl+bCOcpMlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(508600001)(2906002)(66946007)(83380400001)(52116002)(6506007)(186003)(5660300002)(8936002)(38100700002)(26005)(6486002)(38350700002)(107886003)(36756003)(316002)(2616005)(1076003)(4326008)(86362001)(6512007)(8676002)(6666004)(956004)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A6p81mZ2PWKvOdFD/XDXw/xR/zYiaodHgt9CpNUWrtHpsFwNKOkAJCx7nhA7?=
 =?us-ascii?Q?cP8KmsfFPBKmhzz5u7oOhU17qmZxe1CH2I3Fkq1s8n0LqgFt1URg64qMiHgM?=
 =?us-ascii?Q?wiNSdoT9Jhsn9MZYmiU1YnZmOdfJAh5UG6FRHQQFZlsIhCQ5sMKmmGsrfu4D?=
 =?us-ascii?Q?9jzJ3PkGCWytO9WsAUXM4K0diOVmNOrO8bXZkq1UGQJeBVIUtBeQyLVCR5oV?=
 =?us-ascii?Q?r1p9HcB0OD1SfJ4o1JaY87NaztgTx9M23mefBPMuhXMBMZfNQJ3fx6SOeh9v?=
 =?us-ascii?Q?vJrXEP9cjUosulZ9VEjkZ+IRHFkhWoUxAc+4EitEJO7gEpIy13ujEW0iPVrW?=
 =?us-ascii?Q?IVKYNFzWjnjD7j1hN5/fxCXOFxT7jG/OfkIlYciEHuLnSG+irL6yLyFPgsvk?=
 =?us-ascii?Q?wf7JKGXWyHrBdlR8pPmLrGOnSa3cIOx60aE7il4OTiwN7hYqvbbT+3ycaB6p?=
 =?us-ascii?Q?zxzaO26uN6dvH0IpPeXNbpWKx7hdrZtbausrReNu7Skm+ukxQnwgGgDa8Vp/?=
 =?us-ascii?Q?XG6fuhU3c+uqVpTEFbShMGlKQMZQHzeufWFyDrrgaKmqlSsqhyeNiooXOdeF?=
 =?us-ascii?Q?u/WSbXvrDbx6eyVKSX63ea0CuzS5FFYhlvSek0aIqRe38wvcaBwVlH5b1N4/?=
 =?us-ascii?Q?M0CZ0LNnDzQWC7dZEkQX8vj61SJiUBzREfhivL9GMRgJUNKytaMe2eubCC5C?=
 =?us-ascii?Q?iF4+8aDWhFXb8LsNt1gE+0Xk/D8P8KwO+SVfUwhv46802I60b3y1KK/e+k3I?=
 =?us-ascii?Q?3Y6hIoPKJHr9ngW4REOgSAG92FfED+qopI065RdXITOmbd6U3b/XTZK9+GtQ?=
 =?us-ascii?Q?pq4zA74cUHRBrpyg387h4fNWGqkd7XYdDeQpTB2NKvr3frAstPkWwDwh+VgT?=
 =?us-ascii?Q?DJBbn+bnI6rYujxiaZn+cvN4MRm+m2MxFkPhdgufG/xyy/tFwfbNj+nN4v7D?=
 =?us-ascii?Q?drt1qjRNeAx2T1v4rF4SW+JpQJYPP0c4FDcYIWOj+hhvYtfBLPDAOd/cBKKt?=
 =?us-ascii?Q?AIPegjnMEf0/Cgg9+ibNw9AurXVl7sQWsJAvgW02qmcNh6jfrSgxmETeymFq?=
 =?us-ascii?Q?rdt2pG7l5CuVBMD6T3dGkO2ofMrLFmPadQTRmAM/RPk27hka8YbakGYGZxlg?=
 =?us-ascii?Q?d+mKqiXDBnhoSeojq7/9KSSRGMgI2e4VvndP4z1g7Hn5CmMpD1gk8z4oVpmq?=
 =?us-ascii?Q?ixJSh+gc1DgXdX7XhAokgI5my74bnXRzigQzCUTSd+9qPTL4ZrTgBWwPLzsD?=
 =?us-ascii?Q?Z520rHDLHt/Vu/D/5+JOIjqwcMcRhCTdieMLx61cil1U0WXl1QXwHo7Z2OKB?=
 =?us-ascii?Q?gDmAfe6I3tGbgqgJ/ymPnwXhkRswctXSYNkR2/FTKpDW3HEIsmvnPEnV8ACm?=
 =?us-ascii?Q?ek4WBJu54Uh9XMFPRHXHTj26HwUQy4+0Lz99+CbPIK9P34PykDu6CnzVs6yN?=
 =?us-ascii?Q?63rZ1HEPUyIW+sgeMMrREOtJxQYOxSWEQua7AYw2xqY4gDAaVj49sSjex5qY?=
 =?us-ascii?Q?aK72njrdBhiW7pLhSQj2gf21Q3eTV1lJKaaER60+tITqZZ5soMjTfX3+AZTx?=
 =?us-ascii?Q?YntkMuYI6nn64JrqObjNaZqYSaU0k0eTGXT8YhmfAvgkPfKdSudY5pCqUTfi?=
 =?us-ascii?Q?ncRZkL4Orrbm/SxrlfolaJLczj4zx4Opic+3X107eILRn4c9xNjVpNEm4Ngg?=
 =?us-ascii?Q?oz7w1g=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b6d393-9b27-4e43-fdd6-08d9b65798c3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:22:39.2321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIkNmt3BU7lVsclZHWd+iaqP34Ebt/h4IzOzYyF0IPMJDxzPsMCBHFITv/h5h5CjLYuQ6QhLgXkcsRGV0T6UD/myZjTF01VyvY7Soo75jng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2178
Received-SPF: pass client-ip=40.107.7.128;
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

We are going to use do_run_test() in multiprocessing environment, where
we'll not be able to change original runner object.

Happily, the only thing we change is that last_elapsed and it's simple
to do it in run_tests() instead. All other accesses to self in
do_runt_test() and in run_test() are read-only.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/testrunner.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index fa842252d3..a9f2feb58c 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -287,7 +287,6 @@ def do_run_test(self, test: str) -> TestResult:
                               diff=diff, casenotrun=casenotrun)
         else:
             f_bad.unlink()
-            self.last_elapsed.update(test, elapsed)
             return TestResult(status='pass', elapsed=elapsed,
                               casenotrun=casenotrun)
 
@@ -353,6 +352,9 @@ def run_tests(self, tests: List[str]) -> bool:
                     print('\n'.join(res.diff))
             elif res.status == 'not run':
                 notrun.append(name)
+            elif res.status == 'pass':
+                assert res.elapsed is not None
+                self.last_elapsed.update(t, res.elapsed)
 
             sys.stdout.flush()
             if res.interrupted:
-- 
2.31.1


