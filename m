Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5793F4910FF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 21:37:05 +0100 (CET)
Received: from localhost ([::1]:50020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9YkS-0004Qo-F2
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 15:37:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9Yi7-0002fg-To
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:34:39 -0500
Received: from mail-eopbgr80119.outbound.protection.outlook.com
 ([40.107.8.119]:15504 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9Yi6-0005XV-0W
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:34:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UveZEBSQt+aOlatA6Ga5uqghnxAPtpPznNeDvkqbTSb0mYbJv5m4ESHRYQtKuvi+Y6lfvCAvkb7vl1qMZpwFVtoG2BAT0w4zNgIE3DSZR4Q2eQWjUeA0+aRyolhMoajtnZMA6rRJrdsxqsWEGa4XWKWckAAYcErKmkq+4Q/bDq4ZXztzr6cK6QJpYebC3L294+CrnxMfBQpmTL2NFiVO6EKNE4K6RO8sSOSO73IxewKYvIwQebXrK+qjmlZ9Cm6mnDdEZGmipb7T0/1KDqWp6cwG0hcPIrQnsPlt74OK4GsyeM+ZuMZ/CV5TYQNKsWTgsyythlCd0Db+n321iGOgxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDwvLaRDASiBcfXBdY961IPfvAM9042F6XrHquKdjDI=;
 b=VVsDFHafK+T47zLfDB8SfkjnUfpU0USRpaL/k+FVuBALveh2j3c+eFiNpYT/rKpGk6qSDDbzfYJLylxxW932KWPGJ0l0n/wOokv21rvuD3jefcOwDHjJzE53n6O+cHGmTP+uTSTnM64TdaFq9293yT+rK4jGFqeLaC6/OwndJhQRAwNt4Bf8aK5GFvTvIT1A+HeeX7+p8Dm7ZDW9/cnR6HYZ7ddizQp5l2q0yHYIQ1KO7SHxd/iaQXtQiwYfq5MeAJr/RQKr30kiu8uqiES3rqvcjXGhw8Riz7E0R2x/Kdmt2xWNz9h7H2HePEp0G3JDFLxZ9j2AED/og6wpMprY8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDwvLaRDASiBcfXBdY961IPfvAM9042F6XrHquKdjDI=;
 b=p6KNn1XJ29s5W8mkO7hmRSHSdSfbbEL1LBSsX8tqk+qBYvejB2Dlnjq4EDpas0uO3cFgDRkhepIZYcKwoT81yFHxj77sjQcHmD89BnIAsgEqAJZK6CsRmr/ikcA/+RK4dLq2Zsz1XrkXysGMz0YWp7VxZhDJhnQEIsJ8XUP/nfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB2957.eurprd08.prod.outlook.com (2603:10a6:803:43::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 20:19:03 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 20:19:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v3 1/3] scripts/qapi/gen.py: add .trace-events file for module
Date: Mon, 17 Jan 2022 21:18:43 +0100
Message-Id: <20220117201845.2438382-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
References: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0069.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::46) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4da2df6-75ae-4dbf-22cc-08d9d9f69a9c
X-MS-TrafficTypeDiagnostic: VI1PR08MB2957:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB2957893B27005CD3AD64630BC1579@VI1PR08MB2957.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hqEZJYkR2WDksdLsvzi8CGSumIOJ47+gvcejRQU9yelgQ2tbmlqmxkFBR1pJfLVK+eZFX0bW1svO88S2iBBz50nfLKiGql0OnaZDDwdOJ06xYQubyMWyq1uLY8A+M+zCOMv/4btIePmF+j5/KCpimI1tiifzADUd4aXCs93rY4TkluvkCu5c0ebXHDXCxYvn9FnDShp6jV8sLDAtSyj2LGRvJov9M/S51MVin1stC/l8MR736iI6cvU5krotEj9MPe4eSHa/MC73bzC2ZeMiaK/8xhesM+g04vl9798RUavQd58TVWlUFpGXFTC9J3BTyjBPPLpM6fSlreZ0063iXTv70IpB8GXVwTIyGTLGrhLrhN7yb3d406RAdGMyppAg9qpUyy/Ok9mVJBkGIAKzmBdY8iwOLG0XYYaDaRXjLSPPphyqbUqicUw0+tUbJ9QjXl67TGL2433FFGDDwG883kyu9P9L4FQCRo/FB8SupDXSfr6K2wzJK4b84u/V3teSEK4GQ2bMT0NSyn83u5aZJJ3F8KOiSNwsCft6lwxEZsZWV8fwFW1K7ByFfER41hcom0KQ+hxTKXPk4autdg5cUbzVHs5RRHA9Df6DUZxi9QfJsOQyqACsDUWp8W3IxnR+PGwtTou/Fu160TKxoousC8de0q7gy9Pm1KnQu3Aj8z2TdXTWvEONORGTomWfqGZ/ADnJfCS8OnGyIURMJNgw9pJn2xHHD9/9SoCIdRHtfME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(8936002)(4326008)(86362001)(66946007)(508600001)(26005)(6512007)(6486002)(66476007)(66556008)(52116002)(6916009)(2616005)(186003)(38100700002)(38350700002)(2906002)(6506007)(5660300002)(316002)(8676002)(1076003)(83380400001)(6666004)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cXeZ++kgKeQJlxRXUrZhtlyGqUrVmUvznLHp6B8rBryTvUDAu81GHMt+d2nu?=
 =?us-ascii?Q?E6PCEiUkWBfD5I2iGooZAhxzUsnISDAuhGnVViq6n0KM/lJdmVdxRFrH8I/p?=
 =?us-ascii?Q?sMJcwK2cHAvIuCMkmqo/375K4twRCA/bxkUKilI2LSB7YQgdtayeUZUWeuTU?=
 =?us-ascii?Q?7nBoBS7pi/oaDfYfK0QcLO6dqtyCppWRaoGyGQlqfzpfvRLP1V21cfkkbMxc?=
 =?us-ascii?Q?th7QQF1ri7mlu9qQICg3Z0gBjyj53+AX+yNwzmWsrB12OKsbUKOwns2v46r1?=
 =?us-ascii?Q?hCkcfbLXcZNvcDEbTG86mOYyg/a1EWXGCyqKoIXfKSo0DV3LqqrNeWD4eeRZ?=
 =?us-ascii?Q?H+SrCLHOG0u6hYvWoL1RUDwHB+4xjdBDt/IRzSA+4mL2AfQ0aKioIdMKBsT+?=
 =?us-ascii?Q?7yVc/z4QkEr8GFnDKtvfL6FtRuyoS10e2iCSYaWX6Q4dEy456aSQ55YOOIOO?=
 =?us-ascii?Q?rtUGOKsMik7RjnA/d9TiobGCQz0tWAB4NWsPwQEF8V4Zni9uccYrQgZLZdiR?=
 =?us-ascii?Q?2Ie2suIHFmAIGn0wRj5tx8g8ApPeadEGSFhfeV/UV6w73fbIzSjDK0E/wq21?=
 =?us-ascii?Q?ELQ4s6zduxW1UtneIJnhpedUM2H5u7V01NBW1/W3Fbvmv7fib54odnwSt3g3?=
 =?us-ascii?Q?HBGd7yxDxsBwpd80c+a54r2P/Y/kFLDh1rzry3RJw5j0HJ4RcBDHCeDcCyfP?=
 =?us-ascii?Q?g4RYeRKERXwGlBpwUI8NvoWrSC56Ic8gcGNMUYwoIBjW0XU7aFUHhEpkAPSg?=
 =?us-ascii?Q?Px/wP3MxpRvkCYJI95t8BWUiGP271Rju1FT78Fl/N4578DijH3m334kjiRrp?=
 =?us-ascii?Q?6bS4J+hh/zwV3xjlUwMR9qPjuKmyGQ82gEYYgWG4DeHCk8i1dvIoHEofvPej?=
 =?us-ascii?Q?ByfgjSxlz2de92vCa+lSSiFT4QZf10Cld5RX32zbTnqceoBQuMZLN/J0/znk?=
 =?us-ascii?Q?nIlBHI2L8/ro+A1RyWemeoAUOu1HlIx2pgteomVQWt3vvopILzVWZEGqtaeY?=
 =?us-ascii?Q?UU3c/57+mFAgm+4pLRWC6ifMS711Ym9HMj+9xbD+0rdE5xYik8a9EREmBFEK?=
 =?us-ascii?Q?AcZnzAM9MQ6cr8EYEYSCd1HwCVbBQXfFuZhHKgBm3HgnIStiG0OzIt2BCB0+?=
 =?us-ascii?Q?842y/JcocEvLwmahtrKRYnpqNvqbyx3oBBZfHhz5vxYNiwLPQoZxQ6O/ziFw?=
 =?us-ascii?Q?lFqHAjPPtIl2xwBq3CzAte0XwxWutS9dvDHHQoLhdKArqU9tJBQhwFP+IbK+?=
 =?us-ascii?Q?NrlBHGGdWkHPsrx59suA0IaZYiclF0K6Y/EwIMVX8NltmuzP+N4EvXfV5EOm?=
 =?us-ascii?Q?Z7foDl7nrNTTlSiSomwvPaCAk/B3jx6TKRIw4ErU7zAaqvCrGz3VHrlsYcEP?=
 =?us-ascii?Q?Tq0CZAuO+zfrWIahoVvEVZeZunmr6hgMGSzyCkcONt9UNVZKGjtLLBWq+GpR?=
 =?us-ascii?Q?pnSqlRqxAFxOK3qtf8ARYxwx52Gs80zxSNAAT3hDc0ylhIhGvIKFLwRJumMt?=
 =?us-ascii?Q?QgTtRPZDc2v/2d1bXyPbAeBJmaVZQHb2xUMQckm4TKY+4NF89gArbHDlGu2S?=
 =?us-ascii?Q?Xn2sXQOXq2y5sIC6QZwbXm61UxgMs3OJRT/N/9Mefa1PngvHFLRJIX26XZRK?=
 =?us-ascii?Q?99nMTByslNUInfgg6uJbFhiG4EU/AEKvMOPjWKce6WR0je8BIlJRSmjmONyb?=
 =?us-ascii?Q?ORc4FgHnNRqYTeJFp9Iqme0lkG4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4da2df6-75ae-4dbf-22cc-08d9d9f69a9c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 20:19:03.4692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqMjUNc2gUBAeRZNu/f04329nFlAC5WDZZ0NRRaFw4TVTrhf53XTBFUNPg6w0o2fS9Dp+RXeNtoUFGuFKVcJE5OwFsQ8uZDKBNu2uL5Ky2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2957
Received-SPF: pass client-ip=40.107.8.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

We are going to generate trace events for qmp commands. We should
generate both trace events and trace-events.

For now, add .trace-events file object, to be filled in further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/qapi/gen.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 995a97d2b8..605b3fe68a 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -251,7 +251,7 @@ def __init__(self,
         self._builtin_blurb = builtin_blurb
         self._pydoc = pydoc
         self._current_module: Optional[str] = None
-        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
+        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH, QAPIGen]] = {}
         self._main_module: Optional[str] = None
 
     @property
@@ -264,6 +264,11 @@ def _genh(self) -> QAPIGenH:
         assert self._current_module is not None
         return self._module[self._current_module][1]
 
+    @property
+    def _gent(self) -> QAPIGen:
+        assert self._current_module is not None
+        return self._module[self._current_module][2]
+
     @staticmethod
     def _module_dirname(name: str) -> str:
         if QAPISchemaModule.is_user_module(name):
@@ -293,7 +298,8 @@ def _add_module(self, name: str, blurb: str) -> None:
         basename = self._module_filename(self._what, name)
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
-        self._module[name] = (genc, genh)
+        gent = QAPIGen(basename + '.trace-events')
+        self._module[name] = (genc, genh, gent)
         self._current_module = name
 
     @contextmanager
@@ -304,11 +310,12 @@ def _temp_module(self, name: str) -> Iterator[None]:
         self._current_module = old_module
 
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
-        for name, (genc, genh) in self._module.items():
+        for name, (genc, genh, gent) in self._module.items():
             if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
                 continue
             genc.write(output_dir)
             genh.write(output_dir)
+            gent.write(output_dir)
 
     def _begin_builtin_module(self) -> None:
         pass
-- 
2.31.1


