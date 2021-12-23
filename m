Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B3247E214
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:13:00 +0100 (CET)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0M1r-0007P0-CN
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:12:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LxI-0000Xk-Fb; Thu, 23 Dec 2021 06:08:17 -0500
Received: from mail-eopbgr50093.outbound.protection.outlook.com
 ([40.107.5.93]:38670 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LxF-0003iq-MI; Thu, 23 Dec 2021 06:08:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RroFN2eoUAPVQZw7+6P/mjbVWbEPOU66UWaHe+4fLCGcocj8ogrVqi3TbVKJGlwco8YJnVW+XExHl6XaWHhSX1ctLHakoWj7HFO+lMrv2j6ejJduaBo5Yv6Rzt3RdC6CvEk+gSj+/OG6enSsaQOVbjPFPxzU7zymVW2xeUtsksHkmIHuQ/ObTAN1jcYg+gBF/bkHgLbJTuu+136+sDn0EDQPGRNxchNG/EpVt3sdu54B+nis5jl8FoxHKgwNtWi6tw/xAM4a9q+SUzIgoUiO43p9HU/zBv4DIPOuXwjLa8kpMZOaEuupCGfdBSuNVkDzc/9ZbodY6kMTf9vZFYZguQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJaGIh/3xopj49PzeEdLsu8Tx6bAR649CU351bHiaaQ=;
 b=ZVQzPAPbX04RFP51BqlIngThsrJ1TeeVIsfYXj58Pit0R67flim9ksg86NkjIfXqtSox06f9RLVejgL29lckS4Mrp43iBFoGhUnOGCyHccau66UxyN1esnRrhOyggOK6PERsGv1PXhGpvw4N+tY9I0ORqOey4GWdFBL1oZ6syGZnToeAlRWH4thLcD62ldewE8AN/SyIdKQyhGS4s892QYlaqfG/vATX5fk4wT5mrSMFOW2xDC5n1UVi2sKzD23A91oULkkmVvkHV89uapJWgXtfGktNaVu6GGJGGhURglJapHiU8+EUjIspbD4riJnD4bKpyWLmxIPHln2c1Lu0lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJaGIh/3xopj49PzeEdLsu8Tx6bAR649CU351bHiaaQ=;
 b=WHggWozujgVahvwjDFZDPeNWix5QLvw5fIcB6ISy1A2/lt0Wg2fjPz+DeAzXJoCQcHGHdmN8vtctQ3j20M5lFrehJOixRWLgR5RRalc9rrDh0F2n8b1w9MZoKY9Iu8MEUdsGs5D8llGqshH74rHdd14kd6dQskVenEccBeXtobM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB5393.eurprd08.prod.outlook.com (2603:10a6:208:18c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 11:08:06 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 11:08:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Subject: [PATCH v2 2/4] scripts/qapi/commands: gen_commands(): add
 add_trace_points argument
Date: Thu, 23 Dec 2021 12:07:54 +0100
Message-Id: <20211223110756.699148-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223110756.699148-1-vsementsov@virtuozzo.com>
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0094.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae8dd8a2-d52b-48a7-1b48-08d9c6047f02
X-MS-TrafficTypeDiagnostic: AM0PR08MB5393:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB5393D2E5FCFD839B003118D5C17E9@AM0PR08MB5393.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: srf1f0N91xMpaLl1QHJJWh44xOyozWPh04zg+zdrCW8umjKnZC73f7DEptcEfDMtZJFwAmUQStNWgEPE41KLfd/WbV9+ZNVuT0k3iywqzryUcSogQm38WCcmILVRLlty2Va1Jkg/a7NCaN34KtukuRLJaCrkSACNLZfP07OteUyxprdLF4//TBn2zhuhPIwhcU+oS82/1lt1AvtUl8GvR4ezJrGnPmQHnJbe7Lb7fKRu4nhCbjF6grNGv8ZuqrhhtjUUXlCvizCo9h7CVtcLg97EiUsQpOLORSVgxsc3+cCeDNfjjOjBTNjvPdnvkaC6JLouvySbIGalOUVo0jtNyy3DQ7k8C4KtEyd7IyfQn93l60hL5cxSVPNYqo4sO31LZZCCTPS3TvmZilyonbvbJnaosVRRVgw+vL2y8d0qq1qkjlX+OSH+3g0N17QRZhT/MJIBONuyA8iqXFDnSici+2vTqGMLkIZP7fRGP4ytFJhQBUn3KIEN9fKPfTCJgaqm3L3xPff92hz97DVyVHN+JcujgQWvQGcjS0rXSD9tYZsO7Yr7+NlVuGGg1os5FdO6+3zZWprMHrb1w9rPN0ReD2b2rPPxAdImXp6xjitIgvourRadHaAHnW1fIK39l732zUdD3Ia0pSugWA6ylMt/GbgCSdu+dDpluirk2OQ4WiSijildOVtVZonqQ18MMc3Mkgqp1wdKsZjBIvOz+Qi6JXWcBKxbTAYrLLJ8eqG8INkhChRBLQxNPyGcn52Sprm1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(8936002)(26005)(6506007)(52116002)(6916009)(36756003)(8676002)(316002)(508600001)(6512007)(38350700002)(5660300002)(4326008)(38100700002)(7416002)(2616005)(1076003)(6666004)(6486002)(83380400001)(86362001)(66556008)(66476007)(2906002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?urnhwqb+pTFheB9suuFrQ4zOJYogUuM+mqVJUGwwTBktL9PbIgGlcT4yOLFv?=
 =?us-ascii?Q?iFmMBxb8vBBXApVrgXB6C/gPD0ArzB5eh68RBajZ8+tl5C/tMFtcnm2i4eiD?=
 =?us-ascii?Q?u+CL7hf9/EJJCkxMRRv7iqfXUBSsDO8KapYiK6QvBQ7D3MyBOlkONdKPPOug?=
 =?us-ascii?Q?W9KoQeEU0E4LWFtCSXPH1BwubAlJ8D14M3Ma7yy6Dkb+hy9V142EgxLuWEgM?=
 =?us-ascii?Q?0pnv1GBkjlggrbZKufKY4+eDzxBXUJIM+WYJyvsztUqKcGnZwoLKnwrADi9E?=
 =?us-ascii?Q?1J5gwe4y1JAcfpdESuVINByAHJOKV79da+s4S8JH9RdBUIt0HsrJ3pQ6OL5F?=
 =?us-ascii?Q?ERmllOkelcSo7qu+hOpjpfLmwRjpQHBbuzuWZ1yeyLIl5mygEpRldLyxp8kL?=
 =?us-ascii?Q?QKSdQBSWFaU1Gf1euDnGpiqlApTidP1NDpQcRNj7R4+5B2O6zfa2LXHR3/f9?=
 =?us-ascii?Q?I2iWrpgqiAeS6UbC2KBZuq7nJIoPO3K3ghK5I083lh8C/XQ3kLY2UQ7cpzPz?=
 =?us-ascii?Q?nCiWLWON5u942UN7F1SYGvyjVb0e61C/TuaHkHFRdlWQaJ3++FykN5LWHDa2?=
 =?us-ascii?Q?Uv9iiBB88crIZTC7tywstSTnk44Wcuf0vcfmmLv6CsUQBTzz7vTykk6VIN48?=
 =?us-ascii?Q?a6O1z5f3PrumMhouw0VKNgmSTPfYarPlzTEc1rqnd7gZERMcsRSKmdCokLV7?=
 =?us-ascii?Q?u6phTiKAQIWw0HM6emenAPmM8UQTuE9Wo+akaUKIdxsdRKJZJGcC7jBmCIvm?=
 =?us-ascii?Q?BIAMqfdHgHjc82230//J2SrPw9ujbIJFPwrAELGz3RwrajPUmEnh2V4RZVQj?=
 =?us-ascii?Q?A80Zz/3mLadgFoWY3u+h2fsg8XTajP/QA93oQAxgcYDMDC7LrmPGShd5dHtN?=
 =?us-ascii?Q?kTgNODfOjpf810knM+e7CgO6P2F92xQVlq3G7mDd0hPWTHvLeOUSOuZM881n?=
 =?us-ascii?Q?HPU/JiaOD2wgK88hq3TrhsoY1eBjtX0fLL0XdskZak9aDvlbFaJs80K5PiSi?=
 =?us-ascii?Q?Tqhkcpxlkt6jihCfQ4jA9aqGKkV9s88gSPBL0wG5QHWdeIcx751ev3c7ZFAv?=
 =?us-ascii?Q?FMScDbjRxIFk9ndIYyNW0tjC7IA/5bHZNLzH678lubrTYHS3mzWG3zlYHh9g?=
 =?us-ascii?Q?eZ/oxGyI5oTd/qQYk/GydVpkuNBsxympEz5+cYxBv5gAFJCdC3LHiRrMR+zJ?=
 =?us-ascii?Q?XfYUYF8QWPreyYOWjgG/XIXCM58DXBGJBR/kbUgxeYjQBAYBzFG3R0UGaQ45?=
 =?us-ascii?Q?qLezRHNVIQhfykO3ke/4IlkXOtlceaOJIeY5lViaEfsN8IhCNH9rxX90Cu/L?=
 =?us-ascii?Q?6Qr66t1d0MytiT3HrvKjIl1ZH9yNksvBrAhcdbIn94+MFvHg2n2fBY+3TymJ?=
 =?us-ascii?Q?TNv0y3EmxAJxN5g2/4S2YFmCrhJwkpTpZUigjeW6U6Om7MaRsBRPgcW16WKa?=
 =?us-ascii?Q?1oTyNEPI/CFnvtYelF9CAT7Y+0fR0weuw1O7U9+iNv4ZWAZ6JeH+DB4Dpk0R?=
 =?us-ascii?Q?pxzOq6ZddH1qoLAs81pWkFYmij793SUoMxflcaT/hmbW5AbeqVtN0Xau4A1C?=
 =?us-ascii?Q?fsbPcPfgcp/hPvUp/dBX2BndpYpad8j5LYSjtoYjRGsE+bMsh5zFCaOKM2o1?=
 =?us-ascii?Q?oCZwFT/Pjr7Hn0nkMCEf4wBMWcRfrcw1kHrExzo+znVRQvsDF6F0bskBPel7?=
 =?us-ascii?Q?TJIAE9IH3Zm4or/xz/6cwwXVu/w=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8dd8a2-d52b-48a7-1b48-08d9c6047f02
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 11:08:06.4536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHLdroIXTAdawZ0jLQC+tUFwMkOq+XgMq5NtCBNmKGFpisl10pIVg3Q4KWkh/ih4l334hoAlyi6888M3OuiRWyTeimAWlVP1LlJ7O14sJug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393
Received-SPF: pass client-ip=40.107.5.93;
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

Add possibility to generate trace points for each qmp command.

We should generate both trace points and trace-events file, for further
trace point code generation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/qapi/commands.py | 84 ++++++++++++++++++++++++++++++++++------
 1 file changed, 73 insertions(+), 11 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 21001bbd6b..9691c11f96 100644
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
+    qmp_name = f'qmp_{c_name(name)}'
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
+    return f'qmp_{c_name(name)}(const char *tag, const char *json) "%s%s"\n'
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


