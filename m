Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728874962C2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:27:09 +0100 (CET)
Received: from localhost ([::1]:39458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwkm-0002qj-Ew
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:27:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAwi1-0000bN-H7
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:24:17 -0500
Received: from mail-eopbgr50098.outbound.protection.outlook.com
 ([40.107.5.98]:38734 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAwhU-0007rD-5d
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:24:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxjc86Qe1m1kDbSpiNI6o4gm5YWLZ2LORFY3O7mI35h3rzYZbNMcsTH9DdRDZ3fFwhQzT/sKUnj51SN4B4Hd+Xx3mJXASRwfubK3h4uICFTnrrZy9y3Xn6K8FKRIjcF3H7Tep9jrRTGZ9zqb46gnTPmeTIkOM7ifQFhuxB6ofTSo/vsV3fyzRprFNitRJIT0kk87yhiTlSaklfmQYSUVVWczcaY+DbKV/iyKUXc07BmEIeAZAZgXUeiR9/z2PyMyawDIKToFJ9TRvevfrJRV0uSH1kK51RCw1F+uUhmkp5dMEURM3SwalcsuJ1k7Fuiw5ElZNFp4FpAiSUma6wzxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBcUE/FLNOpct4OXcXqZfC7bup3p46R64G9/1ABkaMQ=;
 b=OmX345uP8QT/jFoTTdOGujkCZWRYZXmI6zpNSsuzA5qh4YNpYqqQbxqjtoO75qB9BEcbSvhVUjIroxj4EXwCDze6KJUGviFPi91VPFaDO2pdhVtVosY/1ZE69QRrBHU7lSfF5IbM+R176jmOMrSpImZ/06mc+NvhFPx0gJarLtzzVAdlf6A+CH/4x0v0ObEd0m1yypsxzQEErboULpQVXQEB4Ais1Dd86+SacklGhnh3ih8FsiK7qFApqPEAUbNmK/5KJKU4MWrd1cEEQocEtckXWOSIVJbGqfyAmqHFhQ97eubGQMa9KwMVUwxezH1LASkHqSCgpSLkttrZUQdyWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBcUE/FLNOpct4OXcXqZfC7bup3p46R64G9/1ABkaMQ=;
 b=R4InWrHuQf1WgUzOPFIeCQZpzKZOx3hrDsCuFM/obE5AeE5HaVC2WaLlCHdLHOyzq/+5dDliFcBy0r1DOHUwa1XL7Zhcu14CstWRsRcHy+UFyFnofFfhoYo3kk1HwHrxq6knkTjOx/sKICKJUpvZyIvCPuCMX7kp8m8L0OJRD/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM6PR08MB4006.eurprd08.prod.outlook.com (2603:10a6:20b:a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 16:22:46 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 16:22:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 1/3] scripts/qapi/gen.py: add FOO.trace-events output module
Date: Fri, 21 Jan 2022 17:22:32 +0100
Message-Id: <20220121162234.2707906-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
References: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0016.eurprd04.prod.outlook.com
 (2603:10a6:203:90::26) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51dabd59-3272-44b1-1168-08d9dcfa4284
X-MS-TrafficTypeDiagnostic: AM6PR08MB4006:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB40068D1CDF5AD5F2AA072BB2C15B9@AM6PR08MB4006.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fW9Mzelo5HV8sox3AGxdAy5wbYz7C6IBCsaZcbPjYPMXK11rK0u7XrS8hiy/Tck8128zgRIVAaBrGw1AwufMX1Rn9Ft0rljp+WDm8KWonYb3JtLw1/d9CDQkvAY+FjU/zZic0haAxRq/KXSvroxKReO6WSZJNoRjpqfoAZ5KbK+SogiSIA+gvM2DAVSCav3LOuAmxt3xwwF+8O86bQjzqvi1x1O6aPc9gF2X5Wi5JqFyLfZr+ZFQwTed1L6Egy643yztNSYIMPtijmHGaBrAZlF1IyfdZ0MRnQlsAzzLyY1h9XV0xRSlPcTofmTfodWfA1oY30Q85pF9LXVncCa2HI5AcNNu0aR5aSWYl7K2vikG6oPAQl0OHYXhtQA95jkrFadSL6KROLe8tstrMouBH1DRei193pkA8ruvlBEpc7UXg6/NIpekmkpkHKrZtzfmOdSgYOf5xTwaOnNLWtCfTovePWS/KdkPtzUljIUvPdllyd/smFk3RmUmfK3NyDr6WWjqpQ/bvKiPwSIWlXuNINVgkizk6pAXIYzJ/M/Vn1ot6BmOFdCnURhgzJCVMiL1vVJYy+EXZZmWrLIw0q1OFaMwHIrejjcoxYhl6RkMwnT9DMCwk6aI8A+7eumV0pqO9g6qXBKheOFnbn+AiVWCJr3iHmFLwkQ4e/MJbDazyb7SwLqm6qurWzQN1sdjNjEXQc/P6rPS00lgoX7kUCp1Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(6916009)(2616005)(2906002)(6486002)(6512007)(316002)(8676002)(186003)(8936002)(26005)(508600001)(66946007)(66556008)(66476007)(4326008)(83380400001)(6666004)(5660300002)(38100700002)(38350700002)(86362001)(6506007)(1076003)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T9UU8YrsUF7qk1s/iqeGp9N52MBMbzNHuBoujzfxO4Z3MpjysBA8SfuAB7u0?=
 =?us-ascii?Q?zhxYLOFPIKt6s2dqd8A6SgPGBLe0IlBBJrMn7st2jFOBcBm0TGCr0PoLkiW3?=
 =?us-ascii?Q?5iEczMf/WsgbDvO6v4t9ZKDF3884DhlqxDhRkKyD+AMrI1SYNUswEwVK/vac?=
 =?us-ascii?Q?JzmFSFnLWjpFty0OgFj5gA1nYS6OCgznEasLBGuKl7Iyyt6iWajH0IIc9rwT?=
 =?us-ascii?Q?DnhpMQIIHWBVnkK9lwoZQ9w86hkcVdGTWNeAYdK/RTjT/gPEqOEAbBdJVigX?=
 =?us-ascii?Q?N2ioWaj/pzBQg9Zqp3nn9F4dycXN25seoWQz2SrOlS/FK0muM4RogqGNyzWb?=
 =?us-ascii?Q?kUfkDTqCb5jkHS6of6cyv3vIbj0+cTcnimzJi16q5eL+vJfoQA04fSeFqMeE?=
 =?us-ascii?Q?Oy+tMyy7EP55tSs/+VECVOK5+JGRHHJXaXSCFGga+ALmFqc40EbjJEsHFOJ5?=
 =?us-ascii?Q?c5bz9OpqVq7XvxjrunorrHl4/fHHAH2+XINbVjJuZcxEWD+OJJ5kwvoE5ZzA?=
 =?us-ascii?Q?9fL7D9cuV4gsdv7YbYQ8PjKi6L4myFyUyWHcqmDXFJB5DyopcpJK343e2Q4K?=
 =?us-ascii?Q?lLikW78+WSB/DVXCH23hS6GrGguniYA8NgTPmNz002/XEAg5vRtWN+nlyWjl?=
 =?us-ascii?Q?u8IxNKPeUPsdN1suih2CGuAFCXLG1wDaSV4nKljbdMESaTbqxhaMDQrrbAfr?=
 =?us-ascii?Q?lNX0oTlP1nMPv4Pw0eDUJp9WG0miJk+yahyDZtmk9hps0o4Qh3xOCSfseT7c?=
 =?us-ascii?Q?FxIlmOGMdiIvJlrHzqIbtq+jmsvK7Gr66BXWnO6lyUyknIitsRIpzZUOSQ+Q?=
 =?us-ascii?Q?i/7S9vM5nSHVNrZdQ5h5B9ZtFZqILoFUqogTJ88mG27jdimcuBTcb27CETCk?=
 =?us-ascii?Q?G5PPdRyI0iX+2onrwvxOd11HKta7AB4XKzvZE6Rg+KKwSbYTiyXUABfh5KGw?=
 =?us-ascii?Q?oUmTi6f1WMe7kj/3PZE4sZsA6MjfXWBRb3PwZ1ZBj/0wcc4Y4v9zCBOs+aei?=
 =?us-ascii?Q?J4mY8VFU1OilDVtse482uWMst/qYLiMV9JY2sg5j0j6I5nzypaIQVHqyBW9Z?=
 =?us-ascii?Q?LFQ+quMUnsq0evkhNSFR0kQM5iWb4hvIcVhBKQkwNBkMwg4qT0TOEpZTHz7w?=
 =?us-ascii?Q?WGjHZWHhhF1xcH9ecFZkWDosJRB6WGYIQ87maao4uU1xIZFnZ1jwovyg6OQi?=
 =?us-ascii?Q?bbn85P/+cH9zlpEO9MROIunjJaGMt7hRxg4+wC9tIyXpWUJKQLqRV/mE9X5Q?=
 =?us-ascii?Q?M3eYtyeHdU7fa+brf3HRy/eX9YN3Au0s1alUN1I+NM76qM95w/WR4i88J9DY?=
 =?us-ascii?Q?gPOzK3+38X1zLAZQ0fMghuCgGM3lXdN/wxqM+o7lkK4acl/9Fkl4ZPl6o/ap?=
 =?us-ascii?Q?mrmDf2EpYkH0FCbI4/dDvPmqIWSVyonkszuKXHuG0Ru6a+LOb6j9/OXuEles?=
 =?us-ascii?Q?eXJ/hc76km8devpNOa9Mk7IxGXryD5rC7ZnlCDsMhpixjqHvEr6KMsJqvP8Y?=
 =?us-ascii?Q?R9vK0VXikNG9rra2o17ZXm7hQKHkPeUlN/IHRDWuqnN5zKY/NDQYE0i9uiqR?=
 =?us-ascii?Q?319dr0UlS9wwMRyQi5EOJjiT6onZqAi523g6Zfo8cobO7veOuaBSBomvp8Tt?=
 =?us-ascii?Q?fI20MKjzLZQZtdR75sqYWuq2WIwOun0JxiR6IoWKzY/7WdU6hNPRB0dBe42g?=
 =?us-ascii?Q?CcVllw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51dabd59-3272-44b1-1168-08d9dcfa4284
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:22:46.7698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npP/uFrVzw9ubKGVtuFCUE2wOQMkNNcGpZCm9xHJUR9IMnIg4y4ozdoLLXhvHhSx8MvYKFAeSAztXYe1if0znMXBcqy1z+6oYnO9CnpzeSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4006
Received-SPF: pass client-ip=40.107.5.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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
generate both trace_*() function calls and trace-events files listing
events for trace generator.

So, add an output module FOO.trace-events for each FOO schema module.

Still, we'll need these .trace-events files only for
QAPISchemaGenCommandVisitor successor of QAPISchemaModularCVisitor.
So, make this possibility optional, to avoid generating extra empty
files for all other successors of QAPISchemaModularCVisitor.

We can't simply add the new feature directly to
QAPISchemaGenCommandVisitor: this means we'll have to reimplement
a kind of ._module / .write() functionality of parent class in the
successor, which seems worse than extending base class functionality.

Currently nobody set add_trace_events to True, so new functionality is
formally disabled. It will be enabled for QAPISchemaGenCommandVisitor
in further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/qapi/gen.py | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 995a97d2b8..def52f021e 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -192,6 +192,11 @@ def _bottom(self) -> str:
         return guardend(self.fname)
 
 
+class QAPIGenTrace(QAPIGen):
+    def _top(self):
+        return super()._top() + '# AUTOMATICALLY GENERATED, DO NOT MODIFY\n\n'
+
+
 @contextmanager
 def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) -> Iterator[None]:
     """
@@ -244,15 +249,18 @@ def __init__(self,
                  what: str,
                  user_blurb: str,
                  builtin_blurb: Optional[str],
-                 pydoc: str):
+                 pydoc: str,
+                 add_trace_events: bool = False):
         self._prefix = prefix
         self._what = what
         self._user_blurb = user_blurb
         self._builtin_blurb = builtin_blurb
         self._pydoc = pydoc
         self._current_module: Optional[str] = None
-        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
+        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH,
+                                      Optional[QAPIGenTrace]]] = {}
         self._main_module: Optional[str] = None
+        self.add_trace_events = add_trace_events
 
     @property
     def _genc(self) -> QAPIGenC:
@@ -264,6 +272,14 @@ def _genh(self) -> QAPIGenH:
         assert self._current_module is not None
         return self._module[self._current_module][1]
 
+    @property
+    def _gent(self) -> QAPIGenTrace:
+        assert self.add_trace_events
+        assert self._current_module is not None
+        gent = self._module[self._current_module][2]
+        assert gent is not None
+        return gent
+
     @staticmethod
     def _module_dirname(name: str) -> str:
         if QAPISchemaModule.is_user_module(name):
@@ -293,7 +309,12 @@ def _add_module(self, name: str, blurb: str) -> None:
         basename = self._module_filename(self._what, name)
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
-        self._module[name] = (genc, genh)
+        if self.add_trace_events:
+            gent = QAPIGenTrace(basename + '.trace-events')
+        else:
+            gent = None
+
+        self._module[name] = (genc, genh, gent)
         self._current_module = name
 
     @contextmanager
@@ -304,11 +325,13 @@ def _temp_module(self, name: str) -> Iterator[None]:
         self._current_module = old_module
 
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
-        for name, (genc, genh) in self._module.items():
+        for name, (genc, genh, gent) in self._module.items():
             if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
                 continue
             genc.write(output_dir)
             genh.write(output_dir)
+            if gent is not None:
+                gent.write(output_dir)
 
     def _begin_builtin_module(self) -> None:
         pass
-- 
2.31.1


