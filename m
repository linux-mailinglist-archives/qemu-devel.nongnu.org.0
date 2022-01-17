Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4C2491102
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 21:38:52 +0100 (CET)
Received: from localhost ([::1]:54496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9YmB-0007O6-O0
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 15:38:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9Yic-0003j0-GC
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:35:11 -0500
Received: from [2a01:111:f400:fe0e::724] (port=62262
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9Yia-0005kl-Fj
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:35:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOLbtMYNy24E0ovnF3hVkueFgJ1NG7vOwAHdAnZnonisoeUj2g/SUUIApfahbGdwwohGDeCbiDXi5XOmaLLlozTHXDvvAZi9LfSFizvPy7XTdM9bJzfefLstJftM6Ghxu0H5WtHr+L7FJPSa3iwnUlOwT3ndbSaWe2UflrcQnV8kloNPGyduVtbGQyPDp8twIQ3EOwVQ025xzcL+0SDEHTKleEA7cqM9bM1CROCyaBZGpAD8uBmZi3tvF/83YJkV0pqYu3VWEjVybOCgez9LsqqWiPco/mxl1iXOUgk4Q2TD8NTVv61VW5lG6KkIe4mma/ck3wMv1j9H4RQhVVgrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRlCtudMBhU5tGg/wgtouuk4S3nyBRotNLey/jgSTbY=;
 b=IWkzvuWY2d+IbUYHBQnhHtFXYn70sEJqKfMs4b/7JlQ4HjoGD6ddRBx0QE4VRR/4G0XQ80lcw6MXboiyzTiXTS5uTdhsv0wiWvNg8rAnqKdVzvioMhlNuJ/80Qtirx7Ogf9kKAcJhX2gwkcg7HmqBVCQspvT+4a0JANJDMobAkOzxR19reMlbDmu+p4D1UsESoZbmCz5x+8eZq8GaUhSWtRhf+zMO3f0Si36tQHyfeZlJwVrqM+ZDP3CLcPlk1uZeabDPkSMI1EAF5ydkXSlA8916RF5IW+4J2yV4hLGkfs4IatORy68onZvyW/WnIn5tgW4dDB+AizwiXgVEtE+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRlCtudMBhU5tGg/wgtouuk4S3nyBRotNLey/jgSTbY=;
 b=akd73evppRpJpYEc8Fn+NLZ/ZMXW5F1S8jmXOeCzw+XtZrfFTL+8TkBXesyg9vO/AAeL3hXAqVAfLE34n6FyfruU5LrvuzM6RNJMkdH1iLZaHWeiuZLDG7dWnKFbt6NC92WRr21wfDOhzrIMGBbXqrwmXIA4ot+j0h4IwlmqOW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB2957.eurprd08.prod.outlook.com (2603:10a6:803:43::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 20:19:04 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 20:19:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v3 2/3] scripts/qapi-gen.py: add --add-trace-events option
Date: Mon, 17 Jan 2022 21:18:44 +0100
Message-Id: <20220117201845.2438382-3-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 248ffeec-857a-4196-d762-08d9d9f69b21
X-MS-TrafficTypeDiagnostic: VI1PR08MB2957:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB2957E6CE1190E9A6AFF397EDC1579@VI1PR08MB2957.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZXmHHVeIM+rR5C7i69V0UnlO3CaCNNsJqA8uuwATQOZFN1x3VBCcuJSP3N7sEVUCSXLLbESfqiMVeM6Law1yd0W6YljehOhJeK1DQzIW5CJIQTckgpzNPtVteqxH5muSpb2nmO3MulOr8mE9dQCQrBAgNAVEGoEJjYLoU/8rXCWa5BvVx5yJaiWab19eKZMsEPOnv14AnZ5bskGTGi34NFvNDxZFqWg0BltZUEkIqQlJfqwB2KeVNz+TZn1fNLM82c7MkMtc1kYVODUWqNBusajuKVc4ICzCnAaxSLE3yRCK7tIPX8Omdq23yTVpx2KtJD5qdT85WCsWjCngKPd7eBr3Q2il0C4EwNrR1Lw7/6SXMbNTZGcZ5e/18xdOM/TqDfBBUOF6fyyZ4ALHiVqqEfxbPUa5r+K75C8XeyIzKA5Dg7Dej4Tkzp56CUYK5uUwFBinpPN4qSweWQGwvxvojU/LJ9pXx+d9eRS/LG6y8zAa9kOL8EaVqj9UsaQub+bfLlEnq3Z7rZYwnewYYn7NcvZDTLdU50Nz+dBvnmSmOJM9gV5VwM+LTx2hh+mwuxZWL9P36FX3C+KYD0/UdlU64RT1NlXZZTZNt9tBc0LWjtdxuFB3y3bra389ym3i7+rLao2ltsobeVpTwWI4m1Fl23F5U7w3tW8K7PGie+P8+IBFu64VDzHg1pI32N67ifOb045Dt2zp7hYbWkisBja36g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(8936002)(4326008)(86362001)(66946007)(508600001)(26005)(6512007)(6486002)(66476007)(66556008)(52116002)(6916009)(2616005)(186003)(38100700002)(38350700002)(2906002)(6506007)(5660300002)(316002)(8676002)(1076003)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e/Ghz6x8RbKD1KbCYzE1FN3PENd8sPf22RRIAOf1wFKpui0zAS1vGRiRrSHR?=
 =?us-ascii?Q?zcad+bjEQDWQZt8EItRzUpFvmiaz+vkz2xNoIZn89Qw8G397ZhvuJtbJobAl?=
 =?us-ascii?Q?wEAp6x9F+MtLJe249B1oIFxvvY3O/CDhkKG8UTvQpYlrHX1qeN8tEMDBSnsI?=
 =?us-ascii?Q?51f7HcUq9rRBDVqehIRrGzW8AyojYe8aY66O7BmZzK+p6B0EgWQYCNuPm6bP?=
 =?us-ascii?Q?1/il3cgBkTSMdN4MYUWQfHgCm//wLukwkwyPfDrv4b/qAjMleYZHilDPNuUf?=
 =?us-ascii?Q?vS8uyzSRXiG9tjIdZcmiPTbRRHRGyFzP+qDA673so18NHb2lEhmmcq70hFia?=
 =?us-ascii?Q?gNjAy4o/7+ATaO3DbdpxJtZbsx+Y8/A//MSjaEir7ish4AyuH3YEZM1ctaP0?=
 =?us-ascii?Q?A49T7Vh14d3RN7kimbjh2JC3jYUo24oD+nphfKTh96P2I6cyplfBF1rDRSQm?=
 =?us-ascii?Q?yUj21ECy5kkYFvIUc4c9xVxmGmEm8Uw9yuYGZ1qLEOLxowTERJwyMmCdymuv?=
 =?us-ascii?Q?ofk2Qpl7h78jQSUE023k44uK9OQ+VXWijqBtzfrjRrXfdzg/KRm/xTKvBQIt?=
 =?us-ascii?Q?O5eIl1qQqh0to+ZItmYx7rUB60n+O9MiXcfK5Okes+YdI3HDNIfBvQuVvNGC?=
 =?us-ascii?Q?JuPP99aig0M2TozZbxbEKnSE4m3gNJ00UuvVegViprh9IHG1LC9ai36uy2HM?=
 =?us-ascii?Q?uj/WL0gsfKBPR05PISEjQdJ1XbpJE0uju7LdpgEU9e62ukadmQKvikV/D9I3?=
 =?us-ascii?Q?bhdTNL63glN7U7w4PtB0CVMnt2Rd+lgfIdbbrXP/nd39qJQtsou7T521goaZ?=
 =?us-ascii?Q?la9l1/k7FSkRYh+ftMEXtWVE9DsBV1KwOD8CddD9jKfpIaOH6u4ANujuLKkt?=
 =?us-ascii?Q?JxqgA2RgMjlxofrUJ049Q4aBbZlhh5kfd5KYGd+uVpf4daBGyQR5uq2vWzfp?=
 =?us-ascii?Q?c9/CFOBVPYdTtSlkHl/wVGpRF7RQdpMK29K/euP1PqM6dwi3qAKZSsF7wY2i?=
 =?us-ascii?Q?Fdhxzpsz/FY+eb5RoFvjpY4G+bc1Y6QCmGYZcFMQ0kaW68Tkyk/anORky9xT?=
 =?us-ascii?Q?UhI61oeFaqtB/KvceI09swwVthsKbtnbqDOTZfhoEUuWHZVuvahSw3fO7O5x?=
 =?us-ascii?Q?HQnanQz7Y9T5KzxMeE61y/t7E6vUcJSn6YWdoVcgo0R1Wx2+UCbRqL7gWryo?=
 =?us-ascii?Q?xIMZKq7jaYqlBPVW1XGBOVL820c290gr0N//YgAiIgpIQlieaunsXDWGpbPD?=
 =?us-ascii?Q?LJqHdgM8/19Kb6me2cfN5B/41p0tq1Sz0aoBlmEjP1sPv+BktesxmVg7/fME?=
 =?us-ascii?Q?fyX90SzK/8sobwPEmYWG2wCNvrHsdN1WSUgUSz7RScTAMAOJ8auz8bOkRJnA?=
 =?us-ascii?Q?p1UNdCyqnNRclUz48pLfm9SOQ3uGulGkM8/W2/Th4QOp9TAtLcF4cHxL1125?=
 =?us-ascii?Q?Oy0GYtyWqFwJuqhxO1DlOX5vXM4VWG8aOb3xhdOlGS8TBu+qrrFfl6b/Rucx?=
 =?us-ascii?Q?IJEahjRUKrdgFOklRb2rRepP6MlDs57MvQgFnHkMFszuQFdT7lSZtKIsOXMX?=
 =?us-ascii?Q?aNq36jfFWsPaDra71lvXL/RVz+TTsMcG3h2T+ODRJh+lRwGeS1HG6tfFfebl?=
 =?us-ascii?Q?FGcipQdZ+lXiPfZUTiUm/KPYDXiCnUZ2/Q8LOzKBqAnJ2WRGxTATEGFXGO5x?=
 =?us-ascii?Q?1JjI5rPpGJ1DJdegKTvGFAjB5rA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248ffeec-857a-4196-d762-08d9d9f69b21
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 20:19:03.9547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCGzfoYkyp2ge4HIgL+X77OfX+g2L3TD67eLtX4SaxSsEfzBx4Vp5dcGSFitSybXbMJaWA8EzzJAXSymvW+vJFW1y4ChN0sNbKhUMviblQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2957
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::724
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::724;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add and option to generate trace events. We should generate both trace
events and trace-events files for further trace events code generation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/qapi/commands.py | 91 ++++++++++++++++++++++++++++++++++------
 scripts/qapi/main.py     | 10 +++--
 2 files changed, 85 insertions(+), 16 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 21001bbd6b..8cd1aa41ce 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -53,7 +53,8 @@ def gen_command_decl(name: str,
 def gen_call(name: str,
              arg_type: Optional[QAPISchemaObjectType],
              boxed: bool,
-             ret_type: Optional[QAPISchemaType]) -> str:
+             ret_type: Optional[QAPISchemaType],
+             add_trace_events: bool) -> str:
     ret = ''
 
     argstr = ''
@@ -71,21 +72,65 @@ def gen_call(name: str,
     if ret_type:
         lhs = 'retval = '
 
-    ret = mcgen('''
+    name = c_name(name)
+    upper = name.upper()
 
-    %(lhs)sqmp_%(c_name)s(%(args)s&err);
-    error_propagate(errp, err);
-''',
-                c_name=c_name(name), args=argstr, lhs=lhs)
-    if ret_type:
+    if add_trace_events:
         ret += mcgen('''
+
+    if (trace_event_get_state_backends(TRACE_QMP_ENTER_%(upper)s)) {
+        g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
+        trace_qmp_enter_%(name)s(req_json->str);
+    }
+    ''',
+                     upper=upper, name=name)
+
+    ret += mcgen('''
+
+    %(lhs)sqmp_%(name)s(%(args)s&err);
+''',
+                name=name, args=argstr, lhs=lhs)
+
+    ret += mcgen('''
     if (err) {
+''')
+
+    if add_trace_events:
+        ret += mcgen('''
+        trace_qmp_exit_%(name)s(error_get_pretty(err), false);
+''',
+                     name=name)
+
+    ret += mcgen('''
+        error_propagate(errp, err);
         goto out;
     }
+''')
+
+    if ret_type:
+        ret += mcgen('''
 
     qmp_marshal_output_%(c_name)s(retval, ret, errp);
 ''',
                      c_name=ret_type.c_name())
+
+    if add_trace_events:
+        if ret_type:
+            ret += mcgen('''
+
+    if (trace_event_get_state_backends(TRACE_QMP_EXIT_%(upper)s)) {
+        g_autoptr(GString) ret_json = qobject_to_json(*ret);
+        trace_qmp_exit_%(name)s(ret_json->str, true);
+    }
+    ''',
+                     upper=upper, name=name)
+        else:
+            ret += mcgen('''
+
+    trace_qmp_exit_%(name)s("{}", true);
+    ''',
+                         name=name)
+
     return ret
 
 
@@ -122,10 +167,17 @@ def gen_marshal_decl(name: str) -> str:
                  proto=build_marshal_proto(name))
 
 
+def gen_trace(name: str) -> str:
+    name = c_name(name)
+    return f"""\
+qmp_enter_{name}(const char *json) "%s"\n
+qmp_exit_{name}(const char *result, bool succeeded) "%s %d"\n"""
+
 def gen_marshal(name: str,
                 arg_type: Optional[QAPISchemaObjectType],
                 boxed: bool,
-                ret_type: Optional[QAPISchemaType]) -> str:
+                ret_type: Optional[QAPISchemaType],
+                add_trace_events: bool) -> str:
     have_args = boxed or (arg_type and not arg_type.is_empty())
     if have_args:
         assert arg_type is not None
@@ -180,7 +232,7 @@ def gen_marshal(name: str,
     }
 ''')
 
-    ret += gen_call(name, arg_type, boxed, ret_type)
+    ret += gen_call(name, arg_type, boxed, ret_type, add_trace_events)
 
     ret += mcgen('''
 
@@ -238,11 +290,12 @@ def gen_register_command(name: str,
 
 
 class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
-    def __init__(self, prefix: str):
+    def __init__(self, prefix: str, add_trace_events: bool):
         super().__init__(
             prefix, 'qapi-commands',
             ' * Schema-defined QAPI/QMP commands', None, __doc__)
         self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
+        self.add_trace_events = add_trace_events
 
     def _begin_user_module(self, name: str) -> None:
         self._visited_ret_types[self._genc] = set()
@@ -261,6 +314,15 @@ def _begin_user_module(self, name: str) -> None:
 
 ''',
                              commands=commands, visit=visit))
+
+        if self.add_trace_events and c_name(commands) != 'qapi_commands':
+            self._genc.add(mcgen('''
+#include "trace/trace-qapi.h"
+#include "qapi/qmp/qjson.h"
+#include "trace/trace-%(nm)s_trace_events.h"
+''',
+                                 nm=c_name(commands)))
+
         self._genh.add(mcgen('''
 #include "%(types)s.h"
 
@@ -322,7 +384,9 @@ def visit_command(self,
         with ifcontext(ifcond, self._genh, self._genc):
             self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
             self._genh.add(gen_marshal_decl(name))
-            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
+            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
+                                       self.add_trace_events))
+            self._gent.add(gen_trace(name))
         with self._temp_module('./init'):
             with ifcontext(ifcond, self._genh, self._genc):
                 self._genc.add(gen_register_command(
@@ -332,7 +396,8 @@ def visit_command(self,
 
 def gen_commands(schema: QAPISchema,
                  output_dir: str,
-                 prefix: str) -> None:
-    vis = QAPISchemaGenCommandVisitor(prefix)
+                 prefix: str,
+                 add_trace_events: bool) -> None:
+    vis = QAPISchemaGenCommandVisitor(prefix, add_trace_events)
     schema.visit(vis)
     vis.write(output_dir)
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index f2ea6e0ce4..7fab71401c 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -32,7 +32,8 @@ def generate(schema_file: str,
              output_dir: str,
              prefix: str,
              unmask: bool = False,
-             builtins: bool = False) -> None:
+             builtins: bool = False,
+             add_trace_events: bool = False) -> None:
     """
     Generate C code for the given schema into the target directory.
 
@@ -49,7 +50,7 @@ def generate(schema_file: str,
     schema = QAPISchema(schema_file)
     gen_types(schema, output_dir, prefix, builtins)
     gen_visit(schema, output_dir, prefix, builtins)
-    gen_commands(schema, output_dir, prefix)
+    gen_commands(schema, output_dir, prefix, add_trace_events)
     gen_events(schema, output_dir, prefix)
     gen_introspect(schema, output_dir, prefix, unmask)
 
@@ -74,6 +75,8 @@ def main() -> int:
     parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
                         dest='unmask',
                         help="expose non-ABI names in introspection")
+    parser.add_argument('--add-trace-events', action='store_true',
+                        help="add trace events to qmp marshals")
     parser.add_argument('schema', action='store')
     args = parser.parse_args()
 
@@ -88,7 +91,8 @@ def main() -> int:
                  output_dir=args.output_dir,
                  prefix=args.prefix,
                  unmask=args.unmask,
-                 builtins=args.builtins)
+                 builtins=args.builtins,
+                 add_trace_events=args.add_trace_events)
     except QAPIError as err:
         print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
         return 1
-- 
2.31.1


