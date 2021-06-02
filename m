Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8913398AB8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:32:45 +0200 (CEST)
Received: from localhost ([::1]:53756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQzE-00056E-Pn
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfX-0001Xb-VO; Wed, 02 Jun 2021 09:12:24 -0400
Received: from mail-am6eur05on2138.outbound.protection.outlook.com
 ([40.107.22.138]:12054 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfW-0003Pp-0J; Wed, 02 Jun 2021 09:12:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoP+H7Gt0kQMwo02RpeuY8e5gmVZFxk94Pgawz9IOHiIZbm6wmo8Xf/voubis1zntj1cJk/y+Nd6scT61LoRdbxwWVoY6Ugigh6CfoJ6kAGiyoQSOb8OrCuNPAX5u5EuOALZ/R5h8VG6VZD/fZSKpoJO+KpPmxcFcLy/cK7Wxol/q3FWWCH2J4asjy+bsV6BCkg15NJn4VLIVjQS0g7qk2lD35ut/He6hbrrC4X77mVCvvDEE5pPk57+FXBESLEFStHGOlRgA5PxpeDZlAkW1DdUfwRfl52DOr2VEgqSYODsliUcnJFZMwnXBrS8xBjGS1VaUg6bN18pHvQs5vR6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Beh5dy+ReulH4eLaq91hbL0yXKg0RNyKzGfNw1S+Hg=;
 b=CDJz+M1hJEKgMCP75o7j1q3dI+mtClqi24JDm7Yy7QpRiCEaXHhFskB5RTJ/KdR7gxil+GJJRdJYx3dpOdpqsLbfxn9Kj7tB4b2nNPolsn5Ulh5Oep2P3KfMr6PzCGOZwvvJxB5IzWuF1bTqk+Gk+DHVmRl4mVCgl0cVNv8yMxeYGd2VHhmKGDZiBFV6gY8fKdAujZ7scf6uPA7nJLd3Kc0KQ0FqqQi/kfYcfezr54OO1CPfmuseN3VuNtbXnDyPrAw94utr6g5inlR2miYP79zDZwANSuL/8X9WVHNwmB4DqFnTCt/liRmfO36sK5zTSVEeAQk6eMlSZg7XTILEcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Beh5dy+ReulH4eLaq91hbL0yXKg0RNyKzGfNw1S+Hg=;
 b=QlX0BtZ3iJ3W3bcjxlyYuQe2uN0T9KXGIobw51qfk/WkWFDJQUOqPnpf9HsT+mh4eEQksUaUce/MjeYjPW/kNY5jsWSwSzF0QbmHE2DAsBlkjRVKgc8TjhPrFDWC7PeGL/Kv7VeW+igBis4PX79MyKcusF9ui5gEXq52SxFpS6s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:12:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:12:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 25/35] python/qemu/machine.py: refactor _qemu_args()
Date: Wed,  2 Jun 2021 16:10:58 +0300
Message-Id: <20210602131108.74979-26-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34805408-029f-41b6-c94d-08d925c80221
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6693D1E104CABCC76B47FBC6C13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kItDZeWnzZsMqAkXsQGDiUiXMmVXUhtDdYvJw1HkyHnn2Qy8j+zSwTJxNUlE5TGCSL7gcOlSeuxAI1JrVbI0a7HmFiW+gsGG//5oEWmfzuCE9TRFKg5k2C1dO/pCOw1JDgJjCpouIU6NYc/qqs7MpE14tM/JkfRMsYShk/JLjOhdQ+HPO16BXS1jD5QFEAChDp8FpbwFQt3a3fp9/BjaCt60RAC1LNJXdiaFCoBJpKSsiSVDc/q1SRF05IKpawZRBINYxWJfGCQLEUMyCqauPuOfeoul3AxAUW1BjOe9Y9ttwxXOKHzFdc+ucADs89jBSp+Ufdb5r3VSsUEg6elC+L9BSfUVuyo64KyQnke7cDZxf7BlDw2b7DdPKdTqGKQSMsFgPrqzawrorcx/ub/kUtL3fWDNZUHT83+2Ib3ZdkgjU+yWwNAS7qj9WiVO9UclZajwQvTJ7v9x91W6znc1tzTiHRjr6KvOyTG5AVY2UybAfR/8tfHDRmnHtNFatyD5HBN2/M1UUBu38aLZsVn7JIMWcHgxiuBl+2kyZXt+W7JRn3sYK0+vUw5sudleAg4jjamoE72xOCYA+zC5jQ+ro6T6cHYuE1hNRqJnjB6rm+JLQcyamGnyHs4OzPfseudzZei4QqzW7l2c+8mzOJzFDtvn9ris91jki8IAV8LNGP+4lrP/PSKd433Pqa4WfIif
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qqhQH7c/54bjkmvlyI7x/DIv/1nvPHed/vLu6ff78MWO1MmowNvfCZY4FhZ1?=
 =?us-ascii?Q?tG4M0L2QuHlS7bqdCKkOznyggozA+v3dwNdEq6emzLED1O6A9DexysGrbiGA?=
 =?us-ascii?Q?eNsupBcIGO/iaGsiHGBBwfG4lwJf8PhVGDYanVQqyO4YTIztlSDyLwzwPPi1?=
 =?us-ascii?Q?ye7mG+Q5RMZbzPFmu1itxUGQCwpkOmmsq0sgPrOP+oTKF1WiJxu/V8MnttL1?=
 =?us-ascii?Q?26oX7RQAWzQfdFdTfIyAURbtRUG7gAz1VkGNfNsGxfzOiJhqTkE+4cKZnaQf?=
 =?us-ascii?Q?OMa3CUwPsZHV2F9+mEuJ5DqbmMQ08W+fPsGiEIis99KJcXLb9sMFf75Bexba?=
 =?us-ascii?Q?fQzFQOxzVGq1+fTWcwHoPh6LWT3enZTC++4T+N/rx5KnSctH/5ikAVoSputX?=
 =?us-ascii?Q?3P9aSvO+t2H3+ASjTZId4YwIjAYbRSyHlKo2v/2nQMjzAvDKI/7qmc5fwWpy?=
 =?us-ascii?Q?TC8rXupWEOyiwy3OIR4gneM1JExJs5OeXsrte0qWP/sQgHtD9UmYiBRdnEac?=
 =?us-ascii?Q?ssr6Q6uO95syONJW9J3PJYap2DLeOG0V+3lwq9yrTUqsL0MbFbzDfFd1w2pm?=
 =?us-ascii?Q?2zuIM7ReHfT4MdXq4tAWLApjtmGH2W2WTBklMTCn9pwrm2xg3PHgT6IkLQdm?=
 =?us-ascii?Q?WHBncM7q9xixf6d98ObYsXqpz8r40f08xOhFg+MneWVARgjrUTs0zvz5UBep?=
 =?us-ascii?Q?3Z/u+CqFr5aQGNP+I4vyPBtALSbi4nxWkj5iM3njWhdYxQ7aBgOHHR7C0d0s?=
 =?us-ascii?Q?ez4OQmQ98y3/cXSRQR8L4JmJ+ex3FTa2l2YrVRSNMS99Tr+eFAVWIrKjUSuc?=
 =?us-ascii?Q?yG63OS+Oqg/N7ni6f33QrSdeVTxASmWeC0ERxfJ7RNZzclxKQPVmXVoT/oCn?=
 =?us-ascii?Q?2yiRxgVKYdzn/6ifNw82PIRImrXjt3Gf+0VAOLssP1UYWMHQDrFc1xRddlxC?=
 =?us-ascii?Q?MwbiHlnp5WULmwRKd69PR6vHRfR6mOUYvrerDNX0R0oaYg2jR/6UgT6q4Qkx?=
 =?us-ascii?Q?2co88nNJonNVzhQ/PrGC7cKmoBrDXIZEFju6D7VqqaNT/BEDSfFNgDieRp8Z?=
 =?us-ascii?Q?5ls5+gfLoej62HwiPdnmwULQZrGJfQSCk5+h+HN8bTj0yciE+KgyuK1IOXU/?=
 =?us-ascii?Q?LInjhzNuunfZgZTX1M9z4iiyuk8uB9E0nzy+5R3SoKAsP/tfagQvseiU/OuI?=
 =?us-ascii?Q?M5Et49Txb5zcHkn+qfSSdVF9YxFQJjZhwL35r44cmcRkDuaDZXf8+Wqdq/PH?=
 =?us-ascii?Q?XqaLJNT7Xr9g+untg8UpQG9gtcpoqF75nr95m71IrjReRaKZ/+2RDLiOkl/R?=
 =?us-ascii?Q?feEkIFnnbI3hxb+1TOIW/4rv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34805408-029f-41b6-c94d-08d925c80221
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:12:01.0256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JweEHCYjSab7MyHUs1yb0m9xTTUUPfPi1eeAGvKEwryBPPFDregDf0L+ZDlBVqMzJAB1NFEpAw/hW3u2Nw3CxDBn9W2Q7xwCkk8fYpvmPeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.22.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

 - use shorter construction
 - don't create new dict if not needed
 - drop extra unpacking key-val arguments
 - drop extra default values

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 python/qemu/machine.py | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 6e44bda337..ff35f2cd6c 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -541,14 +541,12 @@ def _qmp(self) -> qmp.QEMUMonitorProtocol:
         return self._qmp_connection
 
     @classmethod
-    def _qmp_args(cls, _conv_keys: bool = True, **args: Any) -> Dict[str, Any]:
-        qmp_args = dict()
-        for key, value in args.items():
-            if _conv_keys:
-                qmp_args[key.replace('_', '-')] = value
-            else:
-                qmp_args[key] = value
-        return qmp_args
+    def _qmp_args(cls, conv_keys: bool,
+                  args: Dict[str, Any]) -> Dict[str, Any]:
+        if conv_keys:
+            return {k.replace('_', '-'): v for k, v in args.items()}
+        else:
+            return args
 
     def qmp(self, cmd: str,
             conv_keys: bool = True,
@@ -556,7 +554,7 @@ def qmp(self, cmd: str,
         """
         Invoke a QMP command and return the response dict
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
     def command(self, cmd: str,
@@ -567,7 +565,7 @@ def command(self, cmd: str,
         On success return the response dict.
         On failure raise an exception.
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.command(cmd, **qmp_args)
 
     def get_qmp_event(self, wait: bool = False) -> Optional[QMPMessage]:
-- 
2.29.2


