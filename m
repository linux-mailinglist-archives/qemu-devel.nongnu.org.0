Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5CD470BB4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 21:16:53 +0100 (CET)
Received: from localhost ([::1]:41004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvmK3-0001Jx-NH
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 15:16:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvmIQ-0000Q8-M3; Fri, 10 Dec 2021 15:15:10 -0500
Received: from mail-eopbgr70125.outbound.protection.outlook.com
 ([40.107.7.125]:1253 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvmIO-0001WA-2K; Fri, 10 Dec 2021 15:15:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEUfR2uLl7Wo6EHRyXJhHNyGYNVQOc0ODA2cE/tQfpS9aOJ7ke8JQAGUNGekrlDDpuqdSCaKxZfVNI24bbypKs5X25kQUlvRDCTaJi4wiXy7/RdcZc88uZ/VRJVXmz0bkqIWj6YcCJvneKi8tyZ2PBL7qoKmYydCfZT3z7+q2ixxnR21dlZT2bP5A2PFuhbO92Yxnwma5UAl761dAZIUhknCEvwNSVBcXxo8EKFA+6IXpIaa443s3Ov0iqnNMGNV5jRQVAdQ5rYmWMaGg7kaKwG6cBDKPq08hGftzQlWh4ikm2ABwhAotRY46GdYZB5yv9Ps49+Zi1SspWVVf1GQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6F9ZwMPSTHPncnGyjp4LaAV6nohA2ZX0lT5XTfaZ5k=;
 b=OOv/xPme3xJxWBdi1PPFEJLZ6blZSqPBi0HrjSfkH/XDuJSE73oEBxYWdpYvoED/xAzPpP4APTNTF7J0pn1+Ixs7cFjtYwQziNqgeFQP5tzmWBfcWjV3JVOzkQPuHZ/l24CmzXYcY2UHgow1NvKRH+TQWKFhcvA9FBu5OSR9eZ1I3xHXm7n9S2pVolAZx9BD06X10FAZMoKRsw4pAbagaxVS/qQ6KV/+0BPlpZjPZgm5ynBLEAoqTbeobBoiWpLCs3dOOZSGh9AyGISg/jqgnwuzaHcJw5nZr6y2R+B98uYcm6ewWCKA1qcJd3AF3DYJkZapkNGuM4yGvtMjsMoHQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6F9ZwMPSTHPncnGyjp4LaAV6nohA2ZX0lT5XTfaZ5k=;
 b=JWUjuliOYJk2X8LYchD33lReH1omoy5bfCKM+SCKTGgLPI/qQQ7veasFDpCdDSTc0Wk3G1jzYcNDlZMzS5A5HnBQl1EyAP1cJ8NBa8eXIk/V4vbo3aSi7gedBDlEW/8DQImaSsRVcUmXjC3cMvHgTNcqXj55Y+jaHI9Fty8q+iQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2756.eurprd08.prod.outlook.com (2603:10a6:205:c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Fri, 10 Dec
 2021 20:15:04 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 10 Dec 2021
 20:15:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH] iotests/testrunner.py: refactor test_field_width
Date: Fri, 10 Dec 2021 21:14:50 +0100
Message-Id: <20211210201450.101576-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 20:15:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd4a6421-e7d4-47fc-acdd-08d9bc19c09a
X-MS-TrafficTypeDiagnostic: AM4PR08MB2756:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB275619FCEC3A5A10C4B2A4FFC1719@AM4PR08MB2756.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0p0kiheUrh9zpkc5mLxG27ikDd8HqD/qVa0aXtKYhKGT3XhPLieJ9ZnXVmBOcjISbiVp/CTTwC548wB/oIaXST3+O2PMJ3jvMSy89bN1AbcZPUsZy7kjKH+H0fK+und2aX+VICTV2EdSQMPCO2Fzr5FNzWl8FQGroVjMofNnA155s4uUHKaMdlAq7LobMm1cN+PtamF4Z8gEOrR5uLYNw8uKR84WqktwdFyHg6Q/6Mt+1l13ty6KXTtcaOYHPUhNnIfEJhHwG3tJoU2pxMzivJm8Fk6GUB88KEQUjaw6EWsy2RFqZ8Oylialz9X81BhDekhEeGBSxA6obblR1wXUsBYLncmnimOs8Kbv4GeDT1z7qhr44zR1Z80KviOaT/lqd1T0oBroD4kqXQcR5tqiD7s6DtYaB1l1eSZStjCLRmlD1wOLB5J+o50tWt5kBKBjPDbFC0GXJKgITM4sxP4TGFm13G0BBRSR/2o9EEBDm+ubuxntD757d+K+0WHEqh8qRg6W2VSVJMWP6DWIIMU98q1ATB+ezGOk7X8ntV4CtWaI8BizS0A3S7RWfjNqV716hDjbNg8m7ssAZzdUTRNW3Rc8+1Q3NYBx9Ope/of0VRNRh80BeCa46QotA39xsItQGREBC2Cxzk1esw+LVfhlOgmmBHiqVyuZFZLuD22bzm5Te6cO4488Pgm3xa2lOZDXGecvlk1n9lWSMv4LcerMjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(36756003)(86362001)(8936002)(6512007)(52116002)(508600001)(6486002)(6916009)(8676002)(5660300002)(2906002)(1076003)(66946007)(6506007)(6666004)(66556008)(66476007)(186003)(4326008)(107886003)(38100700002)(38350700002)(83380400001)(26005)(2616005)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DyZtACdhtaAiq/JY+Kj/oorsFmoBqrSXplUD89Pp3vtsD77C8ABAP3xUtF3O?=
 =?us-ascii?Q?2BXQNxYT3yQ9kYhd3cVzOvCm6XdMh6d2BNAFzkoFlMUig2CW66w5LKpmtnV2?=
 =?us-ascii?Q?dY0lQi/og1VFt7isdrueBhoQ6t/w9DoJ8q/G7kC840d5GVWctU5rEi4WeuUe?=
 =?us-ascii?Q?IAunNDV8D6hFpHBpJPioDbFwgZqsYNhYmd4f+7k73omt0US5YRQqGoZnq2R2?=
 =?us-ascii?Q?j+AX5q85au9Ya7WP4eSWnEcD2s1YeYRxqJUqb2hamsDSeQiDyGAIhzxlME+n?=
 =?us-ascii?Q?pqFRyHDo0Ebxxkh4RdUVAkCsfxhV9+ar46Ac89ljUVhjhONSKAqJ2m/rEb5p?=
 =?us-ascii?Q?bPW+Jrp7bTDosUxRL+tmxn9MsMYFR+3en08nPNhrACjNRXLHT7G/EpTgEGDE?=
 =?us-ascii?Q?iKHXyKt4oRBOr7lbP0d8JV9AgBHILOOhjvGUN/sGavX6thpN2ZZr7vT3jdMQ?=
 =?us-ascii?Q?Gy57CxYH36/4HR9Gfh9aoK6ZHoX7yt60V6mPpDpzVfjR3UecAC0MAPGPNLOj?=
 =?us-ascii?Q?kEVOwPiuVtkehBSG1v2WXLAQw2Eu828Q7gl+ZL+k3Xo5mEfRFlNPEFROEX57?=
 =?us-ascii?Q?aTdhg67G/T95rEZFoGOt0lY0oayV1uH+ByxXo64TlseEBLLZ1Iza4/xh5J6y?=
 =?us-ascii?Q?YWE3UuTz+HP2Z7Fs+/G0yTtw58tQkQJD0q0eWcMRZ77cEpAFo8Ea4l8AU2ez?=
 =?us-ascii?Q?gCfx4ZmpNf5cmLqfiHLkW7n+IJMpCJAfZQC6rpIDrZ0z9KWGoOTy8QZqCiF4?=
 =?us-ascii?Q?UfkzSFPfWcG+idFlBBLpzO39C41R148UdRN6gNAk/hD6sznBq2rncxKy+EEp?=
 =?us-ascii?Q?0yZl8oMfP/EhJlreTK2SdYX7ZlzwTEOWzpuKXZvIUP5xXp86wGGVgAQenjrP?=
 =?us-ascii?Q?TawD4laBpN2x0XkG3FPd3BWKFUwOx7LmNx6nR9HLFzhe32ZNBdIWWFtDSB4T?=
 =?us-ascii?Q?3F242sJShKlLbdw5XyqymXBa+e6ypTIVgB233Tn8b7PzSVeRQtFaWY9bSf5H?=
 =?us-ascii?Q?pi/o2J5tSWPziZLFxQWh4iVzQIjIgkbgjTqmDi6mwFS4PSZcMYmI1ri1dvK5?=
 =?us-ascii?Q?U6QPhqnqqDvBKa9kQaTE5mKmYwZ+5EphBDtAlLQNZB8ZhocVv/FvG8Jk6V0T?=
 =?us-ascii?Q?r/fLsKg3QBOY7tGzWxRsyJOs6sW/f2x6Hv1Uvvv+ulrk7Fx+SJU5+igIul3d?=
 =?us-ascii?Q?XFZ+Obd9FUc5g1D2lrenRolF7x/3Xq5EX4zAfXvs+3MZdSc/nEfXZiGUvmPN?=
 =?us-ascii?Q?V2pv9no7PZo+D0S6UwUYZcbIzQwUejRxsPMbldWedigNGHzzmKoHQJFN8Jf3?=
 =?us-ascii?Q?OtZBBtWrJw8g8QsV47TNzDD3evKHh6EsRNdWUYsYzRvTZv4pmavTwkeActZ3?=
 =?us-ascii?Q?fxl+fg2bVYbAsuj6RiKPGpKx7DFhAMEhTTrcRMek3llptC/i/qXWMF/L/H0M?=
 =?us-ascii?Q?FKcWncuQWHfugCJMuO+aif9nZHagmxUElRWlJ8GaeS4/1YMFcqCYgZ0K2zCw?=
 =?us-ascii?Q?Dw7ToXYKdWmHyxXpvL6N3C5YO1PrvdVRzxcMX/WVKQ82vloBVy2kcjl0Jb7o?=
 =?us-ascii?Q?Z9jB69wunfXnR07mOIHohM2uazj3MwMOtfq9un8kUmySUU7Rigekqos0capD?=
 =?us-ascii?Q?AvKKkDsZz8oCGAfGvKf9TSKe/6IotJ/dw6V2ROoaaj/zN8IgQdNkpSPgU++/?=
 =?us-ascii?Q?Esy5XO7cfQ28yI3mT9Sn3Zk6rEk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4a6421-e7d4-47fc-acdd-08d9bc19c09a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 20:15:04.2506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heNNoprraMLctZ7DuuRBaIHVXjphPPT8Y4ydy2jFiRCX9MAxuG35dgm4AI2qf0BMO/U1v5bHfNZnbZtsep7zX8chaVfEeVJjXNYFD6ALRow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2756
Received-SPF: pass client-ip=40.107.7.125;
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

A lot of Optional[] types doesn't make code beautiful.
test_field_width defaults to 8, but that is never used in the code.

More over, if we want some default behavior for single call of
test_run(), it should just print the whole test name, not limiting or
expanding its width, so 8 is bad default.

So, just drop the default as unused for now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

This is a follow-up for "[PATCH 0/3] iotests: multiprocessing!!" and
based on Hanna's block-next branch.

Based-on: <20211203122223.2780098-1-vsementsov@virtuozzo.com>

 tests/qemu-iotests/testrunner.py | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 0feaa396d0..15788f919e 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -174,19 +174,17 @@ def __enter__(self) -> 'TestRunner':
     def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
         self._stack.close()
 
-    def test_print_one_line(self, test: str, starttime: str,
+    def test_print_one_line(self, test: str,
+                            test_field_width: int,
+                            starttime: str,
                             endtime: Optional[str] = None, status: str = '...',
                             lasttime: Optional[float] = None,
                             thistime: Optional[float] = None,
                             description: str = '',
-                            test_field_width: Optional[int] = None,
                             end: str = '\n') -> None:
         """ Print short test info before/after test run """
         test = os.path.basename(test)
 
-        if test_field_width is None:
-            test_field_width = 8
-
         if self.makecheck and status != '...':
             if status and status != 'pass':
                 status = f' [{status}]'
@@ -328,7 +326,7 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
                               casenotrun=casenotrun)
 
     def run_test(self, test: str,
-                 test_field_width: Optional[int] = None,
+                 test_field_width: int,
                  mp: bool = False) -> TestResult:
         """
         Run one test and print short status
@@ -347,20 +345,21 @@ def run_test(self, test: str,
 
         if not self.makecheck:
             self.test_print_one_line(test=test,
+                                     test_field_width=test_field_width,
                                      status = 'started' if mp else '...',
                                      starttime=start,
                                      lasttime=last_el,
-                                     end = '\n' if mp else '\r',
-                                     test_field_width=test_field_width)
+                                     end = '\n' if mp else '\r')
 
         res = self.do_run_test(test, mp)
 
         end = datetime.datetime.now().strftime('%H:%M:%S')
-        self.test_print_one_line(test=test, status=res.status,
+        self.test_print_one_line(test=test,
+                                 test_field_width=test_field_width,
+                                 status=res.status,
                                  starttime=start, endtime=end,
                                  lasttime=last_el, thistime=res.elapsed,
-                                 description=res.description,
-                                 test_field_width=test_field_width)
+                                 description=res.description)
 
         if res.casenotrun:
             print(res.casenotrun)
-- 
2.31.1


