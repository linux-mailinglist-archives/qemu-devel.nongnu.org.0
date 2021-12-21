Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BC647C7DA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 20:56:52 +0100 (CET)
Received: from localhost ([::1]:54508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzlFi-0006vS-US
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 14:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzlE6-00069F-2U
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:55:10 -0500
Received: from mail-eopbgr40123.outbound.protection.outlook.com
 ([40.107.4.123]:30638 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzlE2-0006qn-O6
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:55:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEw2xXPMWp4tagjWxtqjlh1AOTaLLo8rwQjn4xMpULHcoxQEfZRxfYtBAWNzPAyHcQX6Jk5Gd+W9WNM4tCMzj+vlCEq1dWeHF8vF7ZhslHDPnSFXtlfbFehAyK8OWocxQ97HARNm5/PTgTuRKM9zCmjMcgiIcA0qGrbPyKxlmBHv5jvHebRn6ixFZMMcOZfZGPUMgl4QNHBBAJa50p0kGiHGbTaFXNhzlnBTV23wNeyfTX9eYX+hq+S6oVOBThaPDz2LlBtvhyED4qr2gv+3qFhVQyHVDWC4KLuGijVJ/5MS0eN9LkJinpvzsqV8P6DA08V3wE6Hru5rhbGwHjz//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4NdJoNHJg3qS9k6I9KyJ9LMF/UeA5lxTavImM7l1fs=;
 b=LAqh/kS6Hc+sA3vMFrIzJzM97vtmLj3bHHdKxhQGytB1a5cnRVYqsNxFnRCG2YIok0+zLUCwrucY1mIgwzBPmUhwWIYYrZ5FFJOjDzwD2kdU4V9OG0px3Fg7eyvGoQnhrXpH9n4xLrUshsp4IxzfjrOiVra3waO1tZJ96tyzi2spRZEatm5v/4CAbPjaygbFg2LukTJZoS7jxl04ZjWrwc7068cypMe1cvXBevEWmF+k/MvyJNcSDp/dlEJKzCQFIoTIdlw6QKflMCbSpQ2F9U0GlJ4B0BbYAUeBRir8eS+OxiXPDFEYXC/ZeA4awTEXME+mlUmUsZto12qmKvCPwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4NdJoNHJg3qS9k6I9KyJ9LMF/UeA5lxTavImM7l1fs=;
 b=BmAP8miqlJrHRBudmpHtG1OaPz8jyQfBPP2/aw0m1w5nkZ4CjU3RUFfuP8LxC05z2XYxXGYrZdZqP3qRy2K+q/eJsYDms8e6DhMyyifWVCg6HKtsFvlzDUvo0KFRXx2zREYyqIr0pcChs0pU/RfMJxdbV0p6SO/3GpGAmU3XCcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4964.eurprd08.prod.outlook.com (2603:10a6:208:157::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 19:35:14 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.016; Tue, 21 Dec 2021
 19:35:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH 1/3] scripts/qapi/commands: gen_commands(): add
 add_trace_points argument
Date: Tue, 21 Dec 2021 20:35:00 +0100
Message-Id: <20211221193502.114296-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211221193502.114296-1-vsementsov@virtuozzo.com>
References: <20211221193502.114296-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0014.eurprd04.prod.outlook.com
 (2603:10a6:203:90::24) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d26cf303-0d24-4ed0-0d1f-08d9c4b90249
X-MS-TrafficTypeDiagnostic: AM0PR08MB4964:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4964EB63149411ECC131419FC17C9@AM0PR08MB4964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JXKaMvvwJRkBccii6l58iVoEHMzqxsIL/C7Nqtp2QcUKcF4OPtHAPcz5lXnGu40k95TTmtTEiaUzXiIXoDb6ojBV9ZiticEQhaoQ6ev4ydoijlxVMUUilhcX+a+fkKFqsM6hEMNVD42H+yPFAks3kLmYt6BRRfMLqcrWdCdz+ogt3ndetEk20o2CTTN3clFr8viq9eB5Olja2JnjnnrxjbiXLSV1tCOdGVX7q6zOlOCQ/DsYjbnX/d6DAc0NGAsuUaTlCtoz3SvZkCQGgpTmeG2Yw7tsA8GdXim8RVYswKWYp8SF0Lbi764E2O4Zpp7+oKfad9W0+j5/6+4h0fnOSUswo2AwL0lSTdDXE6gMvGKXOL4M8jMes2J7cO1AkVzFCfc0ul5Xe0a3yqG4U4KKiQMFNa8yeAEZirmVYKvK5k4qPAmdrJ2mB8FK43PlEb92XxHnjSWe88B5V70ucKhqdCf8mlu0LAjsNtCr+WMBvdHFlfVLDVjh9oRpldwqXtvQ+v8+sD+2l73lrDz8BES9bTXY82mLXzQr/0Xksgn9KdLYb9OJoN1J5nDL6WD3TSzps71nCwyYgogQX8AjK0pgRH9kvnmN9Le7YjYo3wN57OT8E/rG3xs+lOUWUiM1SBIQDpsTQuI0ty2Ykwm0GAv2oLP6xyIOniEmbVK0mtnOviSznK+r94w2uTd+O+mTRP+b32HTC/5VW/c/D95dCVKJGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(186003)(36756003)(6486002)(38350700002)(6666004)(26005)(66476007)(66556008)(38100700002)(52116002)(86362001)(4326008)(6506007)(83380400001)(107886003)(8676002)(5660300002)(66946007)(2616005)(2906002)(1076003)(6916009)(6512007)(508600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YMcVsrfJUoi4663o/pzGpwwXUlxCmXdHDIXz2u3uxGdGomAoK0c6mDHP9ufI?=
 =?us-ascii?Q?HMLJ5dJP0PDPeW9S/R4V8Qst2jC4lX+XG36bsrRXl7JK7eim5Fbq2O1RO1EW?=
 =?us-ascii?Q?wQ/vjIdoKhAAICP0A/BSDQGnXgB15LVBCsIF/KPPiW1q4+2eQdaYkxdPdA/n?=
 =?us-ascii?Q?NkkmoYgwrksZqVVmaikQz8PbnzTPCbglRn5tTBkWJEFTKIdNEn8pPtofzoaF?=
 =?us-ascii?Q?ENzucAr2I8JW+QWbg8U3mywh32xgf0NrUeAHiaFqp1dz2QiDCaW6I5sUnS1c?=
 =?us-ascii?Q?zyL7gIQTiRXvS/ovG3UZmQj4GrBAfDPlDEo51/oBaxMEBqlv3KBXFovSNXhv?=
 =?us-ascii?Q?rsDeFdjCnOblaLsQqcPf2KDhbgp3foi2l5fzcv4iBfIQ8/2mJoktUzQvy7cK?=
 =?us-ascii?Q?9YHgea3WWv5CZzaBU11ZLjPv9Oz3GTJPLhKYDQYU8vRFe8td30Nfu9iSsq54?=
 =?us-ascii?Q?ZEycYEyCW/1OtsD3q2XKHf4CQVI6UX3eEra8vZ3aojPt4KXTo4eJZurLDpRL?=
 =?us-ascii?Q?P8h9fdIABvZ+TbThCuTs04o/QdpP8np7QdtzzvwDgSEA9432Biwe53VD/xlY?=
 =?us-ascii?Q?tk3nqxRVfOSPmk/aFk7TdRxehiZRESe6qfz8p6YvZgx6x4nyPZTTWKo40t47?=
 =?us-ascii?Q?BDbJi+/mf75T+1Vis51thZAAacjwnrOrzGCmgFqYgdIrnWJc7BHofb4YeOzd?=
 =?us-ascii?Q?lprwLFtJUB0DEWXQRwxfAbgMoZRn2tq5odsEkcyLFHepnTbaowfkqNL1rbwN?=
 =?us-ascii?Q?AuiMpXCymS4ftD3P7TsnY4F8C5hA9zNRrq+0EoWyOgZ+AScjRM/vkSIlHju1?=
 =?us-ascii?Q?vBR9w2LxRUuScaoOmTVxOP4rJz3EOuBVj7pYBs51Iz1bhFj2lFbdu4Re5ILn?=
 =?us-ascii?Q?pGafvRKC4wyUcQbzyrYFP+E2Vdb/osYddqWA3kKhPd7BHDUi/24Qdd58I/jP?=
 =?us-ascii?Q?blKhKmY18GQrp625cOEVB61hUhDzCfUjWkkAceI7SYoQYcMYPb/7kVdk3nyb?=
 =?us-ascii?Q?1FJgtphaLWM5Dv3VfcdIYrKSoAlM6Q43+W/rId+z/rgxylOGn8FJHVkxshpC?=
 =?us-ascii?Q?fJhXBdEU4VuhOmSFeD+BoLa5QvNBH73Qn6QHroZvaSo3SBxRl0WUK1Tvx8KQ?=
 =?us-ascii?Q?KZ+wvcxCTyROgL4pyFnOce0aTPY66hdVzT2uabF8X9YmJyReVd32hLyP8G57?=
 =?us-ascii?Q?1p5GoMiwWf0pDBqjVXcquEy+5WE0kuFLKf0vPsWGj74dwNU22mIQk4+kdtU2?=
 =?us-ascii?Q?HjCFzFaH6YfwYscJf/L/GVW6+S+UIKnj2aN4x2VdA/PN/68TQdjX6NqkN/Rv?=
 =?us-ascii?Q?YD5GY+fsTCFOYAjkFHtuP8+FNKrslKzC8A0G1Le5BYIjdexKU69eZC3H3tib?=
 =?us-ascii?Q?lan1aJCggs6QydR3YwBp9DMxRpPmXy0+xyhYGRltOiUDTAwGYHVppfBHTmQo?=
 =?us-ascii?Q?kMQ+i5jqz4YofCYojqKVGbCR34L9ZpWf5FAgXVDVQm/4iwWdKsqxmQhXSFmz?=
 =?us-ascii?Q?AmfZw5x9lBZjI05s/m/tyKpg5njWlbDu3ozU/oM/tFAH86YO/RAJo9Uljr6b?=
 =?us-ascii?Q?v6GyPWLPOlaG6Z2AKiy15yxDNcnRUgx8xadkVLHVWhGEWkAP4nhPovU11R9s?=
 =?us-ascii?Q?0xkQsZHKbyW2FVKAwLvDRvLlMZRiTBkwqBMnunJGaIUfN2F+2j0jMVP9DUJG?=
 =?us-ascii?Q?LNFlSDkPmJBkDK/h/auFjELGlds=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26cf303-0d24-4ed0-0d1f-08d9c4b90249
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 19:35:13.9733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0/bm6/3i8ARapEAiP1JkH5y5F4YmSrTQ69fZm7edNSRBFIz453rVDuwMGdnCWW3Y2lH8dREEfvsiRXd9IlPTBJZ2JtiqpSprBuryqINhlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4964
Received-SPF: pass client-ip=40.107.4.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

Add possibility to generate trace points for each qmp command.

We should generate both trace points and trace-events file, for further
trace point code generation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/qapi/commands.py | 84 ++++++++++++++++++++++++++++++++++------
 1 file changed, 73 insertions(+), 11 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 21001bbd6b..e62f1a4125 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -53,7 +53,8 @@ def gen_command_decl(name: str,
 def gen_call(name: str,
              arg_type: Optional[QAPISchemaObjectType],
              boxed: bool,
-             ret_type: Optional[QAPISchemaType]) -> str:
+             ret_type: Optional[QAPISchemaType],
+             add_trace_points: bool) -> str:
     ret = ''
 
     argstr = ''
@@ -71,21 +72,65 @@ def gen_call(name: str,
     if ret_type:
         lhs = 'retval = '
 
-    ret = mcgen('''
+    qmp_name = f'qmpq_{c_name(name)}'
+    upper = qmp_name.upper()
+
+    if add_trace_points:
+        ret += mcgen('''
+
+    if (trace_event_get_state_backends(TRACE_%(upper)s)) {
+        g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
+        trace_%(qmp_name)s("", req_json->str);
+    }
+    ''',
+                     upper=upper, qmp_name=qmp_name)
+
+    ret += mcgen('''
 
     %(lhs)sqmp_%(c_name)s(%(args)s&err);
-    error_propagate(errp, err);
 ''',
                 c_name=c_name(name), args=argstr, lhs=lhs)
-    if ret_type:
-        ret += mcgen('''
+
+    ret += mcgen('''
     if (err) {
+''')
+
+    if add_trace_points:
+        ret += mcgen('''
+        trace_%(qmp_name)s("FAIL: ", error_get_pretty(err));
+''',
+                     qmp_name=qmp_name)
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
+    if add_trace_points:
+        if ret_type:
+            ret += mcgen('''
+
+    if (trace_event_get_state_backends(TRACE_%(upper)s)) {
+        g_autoptr(GString) ret_json = qobject_to_json(*ret);
+        trace_%(qmp_name)s("RET:", ret_json->str);
+    }
+    ''',
+                     upper=upper, qmp_name=qmp_name)
+        else:
+            ret += mcgen('''
+
+    trace_%(qmp_name)s("SUCCESS", "");
+    ''',
+                         qmp_name=qmp_name)
+
     return ret
 
 
@@ -122,10 +167,14 @@ def gen_marshal_decl(name: str) -> str:
                  proto=build_marshal_proto(name))
 
 
+def gen_trace(name: str) -> str:
+    return f'qmpq_{c_name(name)}(const char *tag, const char *json) "%s%s"\n'
+
 def gen_marshal(name: str,
                 arg_type: Optional[QAPISchemaObjectType],
                 boxed: bool,
-                ret_type: Optional[QAPISchemaType]) -> str:
+                ret_type: Optional[QAPISchemaType],
+                add_trace_points: bool) -> str:
     have_args = boxed or (arg_type and not arg_type.is_empty())
     if have_args:
         assert arg_type is not None
@@ -180,7 +229,7 @@ def gen_marshal(name: str,
     }
 ''')
 
-    ret += gen_call(name, arg_type, boxed, ret_type)
+    ret += gen_call(name, arg_type, boxed, ret_type, add_trace_points)
 
     ret += mcgen('''
 
@@ -238,11 +287,12 @@ def gen_register_command(name: str,
 
 
 class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
-    def __init__(self, prefix: str):
+    def __init__(self, prefix: str, add_trace_points: bool):
         super().__init__(
             prefix, 'qapi-commands',
             ' * Schema-defined QAPI/QMP commands', None, __doc__)
         self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
+        self.add_trace_points = add_trace_points
 
     def _begin_user_module(self, name: str) -> None:
         self._visited_ret_types[self._genc] = set()
@@ -261,6 +311,15 @@ def _begin_user_module(self, name: str) -> None:
 
 ''',
                              commands=commands, visit=visit))
+
+        if self.add_trace_points and c_name(commands) != 'qapi_commands':
+            self._genc.add(mcgen('''
+#include "trace/trace-qapi.h"
+#include "qapi/qmp/qjson.h"
+#include "trace/trace-%(nm)s_trace_events.h"
+''',
+                                 nm=c_name(commands)))
+
         self._genh.add(mcgen('''
 #include "%(types)s.h"
 
@@ -322,7 +381,9 @@ def visit_command(self,
         with ifcontext(ifcond, self._genh, self._genc):
             self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
             self._genh.add(gen_marshal_decl(name))
-            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
+            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
+                                       self.add_trace_points))
+            self._gent.add(gen_trace(name))
         with self._temp_module('./init'):
             with ifcontext(ifcond, self._genh, self._genc):
                 self._genc.add(gen_register_command(
@@ -332,7 +393,8 @@ def visit_command(self,
 
 def gen_commands(schema: QAPISchema,
                  output_dir: str,
-                 prefix: str) -> None:
-    vis = QAPISchemaGenCommandVisitor(prefix)
+                 prefix: str,
+                 add_trace_points: bool) -> None:
+    vis = QAPISchemaGenCommandVisitor(prefix, add_trace_points)
     schema.visit(vis)
     vis.write(output_dir)
-- 
2.31.1


