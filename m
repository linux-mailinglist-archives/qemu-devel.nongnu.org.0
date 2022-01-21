Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2885449636E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:58:20 +0100 (CET)
Received: from localhost ([::1]:47632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAxEw-0001On-NK
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAwi5-0000lj-CQ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:24:21 -0500
Received: from mail-eopbgr50116.outbound.protection.outlook.com
 ([40.107.5.116]:56897 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAwi1-0007uB-1b
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:24:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZTvqrSV9KvUEobVhYRpA8zoAQA2tRdkM7OAAYhwuuI+BlV4alRu9Z4qcb4tiynUGvf1cruWF+e/ieLYv1US0G9H5KRR/e8wPO22Sc+PUWwz/V0Pmyz9Xfj/TsMyOc2M0g8KH4F+0z+/pTLTMkdHGZfQjOFKWThx9U4RUWO/VJ20z5jeaWGJ9ztmHeMh6TOFDuX5y8jzAkf0ur6c/BhTX6/HytJyekQcUtquJF2aPGrf+oP8ysLvfG1hUgnJkYNlBhDZLPeBvxBplE9A446fUffTWqoB6srajY4S46sXngX9tGEBDC6g5a8DNc2iYyF6hFfRIoFd/duhXuj31gNATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UL9d17bkrrBC2Ut3TwPO06SZgPV56BpBIHAMLUk7p9A=;
 b=Ln3L6uarGBP/bb8rCFd+cpuJlz2q15BMk6MWZ6vs2I+22hnoo2gThEAQvQEVEVLmL6CHmnMaut/Ewb82KqAMu3vmI56D1sSweeVpNJzuG9/on+l3vBxeHRoEkKFwHE/qLL478st3VkkD4V/OcEM/4oZzVPM7KldSeZ5LLrjiuk7J7USy1SCf9rGeUA441vzIwCDEB57gdLoZA1nWCaY3XlBB+2AgRQDEfadC42EQJWL973hDKKy+LwdNbBt4tLpbx82ls89fpcLgb4YTBm4guFTnE1H/XHL+JY8M1W6zIKrQemATy1bTRe+RkHDvMY+21JLNvttCry/3D63Y1RVp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UL9d17bkrrBC2Ut3TwPO06SZgPV56BpBIHAMLUk7p9A=;
 b=nv37P/vZfnBslYIxtT7R1Ff1tc26nHg0DIpCyLCjwtWwT8SriTKxAbC6sQqIdz0A29EyHTPEJyQ+0TrgV08soOSeKSNnjZNiDY6wky+J3B1dKsKmGNitn20RcPD5F9AQZTy+QkroWGApGapiRtiiiLcTTS/uC7IC3qrot8tc9XY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM6PR08MB4006.eurprd08.prod.outlook.com (2603:10a6:20b:a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 16:22:47 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 16:22:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 2/3] scripts/qapi/commands: gen_commands(): add
 add_trace_events arg
Date: Fri, 21 Jan 2022 17:22:33 +0100
Message-Id: <20220121162234.2707906-3-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6b00d1fa-7bcd-45eb-91c8-08d9dcfa42d2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4006:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB400692FFA0E35581C8187D3BC15B9@AM6PR08MB4006.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:102;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5pVPBdOMU6P8abUl59NhBRTj2opwR6xBrt1w5/XnSB+xeLtXJclBGpFfPSu/CJcWR0NWzX4u1WpoTxF/aCrheuymqigXPIJsCEkFRLef7vJZUgtWcwJnIvYKrA7Tf1aYbEK2vr4WWyZX2/tE33ydPLgDjPatRJvp7Yc8/1HtENja2CbwvoTAwFyvnO1e78J06O8Bpo3qT8PdCHIki+p8bjbm2fcSx6waX3zKx6Gw9iGZzA6QXch+yvQ4zkBhZZE/rJzNYkz8JKFKuV69W6RflLg/vtr9bQCKKENxZXUo57719UcQMfaQ0ylSWJE652tEeMynTO/WfJ81++6S8VaVoSVKvry3qpT+oZU1pYYCXxNsCgr+MWyEVRCsZO0Z7szE9F+X0rZ4pBoJ4y4bp1jn58ZPOxATwKlQJG8p6CaykPrM6O8z/1u2c3szmbg4f/2mk9iHeUtRbbgZthRJKJYPuQCDI/ayCxtMgN5uCBKGjixcBJlCVPdPkg/cSyBOf+X/7yOo3BxOMcnStAMZkm7+lm07iiaAYf9iMXYeqwGvtxuBELCGP9dXx8XUMPNtk1GYUxzXjgr/rCagwnO4QZ6ypooLjzWR181wIy6A4uVcsKWo4FqMTE6sLv4tnVjSzzFRBAnU3Ee5AiQRTmABIATGIdG1MT/FfwP/lcqTRNjGi7hNDIjd+V6UkRkW+YMu1DlJOLnnLcAcgL6T6QJ9okxAAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(6916009)(2616005)(2906002)(6486002)(6512007)(316002)(8676002)(186003)(8936002)(26005)(508600001)(66946007)(66556008)(66476007)(4326008)(83380400001)(6666004)(5660300002)(38100700002)(38350700002)(86362001)(6506007)(1076003)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V1D8X1XcvgfF/er2GsfE021KXXOJqHvfmd0+/PlT3PsL+Rm/UJYChGPfyaFW?=
 =?us-ascii?Q?GMwDSUm8EfeeU2c9ACIu7V1n+kROzH7IbRpvz4ihPjIg3LZEZ4H+o2YvHqTo?=
 =?us-ascii?Q?FmTvPTNO7bO/ET4L0LQur5iDVipg2ZabAooyVqFJwJ1YtwMh5agZpyS0QF5v?=
 =?us-ascii?Q?TVZyRyQVKaK6jhg0dVENAslJZuhUuhZx78iamwLc6ev33QqB6KJLgL9XW91x?=
 =?us-ascii?Q?zwXbI9Z8h89mNYEfpTW9Mo2j2yBjF/9IvRcpbEcCLlaucWHX9FwB6GFdiURL?=
 =?us-ascii?Q?yzTtVpUmJc+2e0/Sh0uqiWMBlVf1Elk3JF7uH5A3tKi5cZrlWftidpOhLBZt?=
 =?us-ascii?Q?UUl5BwHoyqzeIDmiECrx7lz6TO1QHdN+79BeYrn3DDfXixNXOZXgn0Koy9MF?=
 =?us-ascii?Q?O+wm5OzXZVv7iFUOy9WSTdaNxkL91fjGk8S83JA9ofPu5puhXjcBi0Fyr6xa?=
 =?us-ascii?Q?GS6dNKTFDBNWx7a3cFxGGemuCIrWyYGRYzFMX5RMiDGKfzovAxwY5QEU7vlQ?=
 =?us-ascii?Q?yYdXHAQQQpeH7eGBO23MyuBGMsH/e09w0RumETMuyuK3l0vdQ8WiQLzeSNFk?=
 =?us-ascii?Q?HsMKWd4S8KtWy5iHobN9gnzHNwGaggytG+o3FK1Qfc895JVzzqVd5HbYfXCx?=
 =?us-ascii?Q?XwIbz2P0O5L6dbl1oN0fFpQuGu/0i9+/K96omAC7xx4reVD9Jlt/BScKkJ25?=
 =?us-ascii?Q?QEk+l13zySf1th0paspimuNKwEcG6YjO7qwvWbaAaZFQI6UVt2+8lcf5yu0F?=
 =?us-ascii?Q?z/JViJzBjYo/YY/ul9jxWOKjO/CL7giRfoljvN6I2AKfUgg5Po/YVvKjU/0M?=
 =?us-ascii?Q?2duHIQtatKRDHnl0loHz+ZX1uguS1hDnq6QS1id89hZn4gJtEzqYkOtKbKV6?=
 =?us-ascii?Q?EEaiZg4v7oLJ58Ia4E43OYRuN6HGcFlzMqxZJeS70TTtw3D0Io8tfX6AvvR7?=
 =?us-ascii?Q?DCVmhuckwq+1qP6yZEbnI3IOijMcht6btaPiE7vbuC4fBD2ek/Sge6Npy564?=
 =?us-ascii?Q?FkYuwotWTKqDQk9XegW0Qe2Pb0gvtYyvQ+3HMVvWkQc5rF9HZ6A74UwS3goC?=
 =?us-ascii?Q?LV2YXZg2g/MTXMqA6qXIKsILadf+Cu+smbwgeQ7jNAQE4VFkxQXX65fTkPiF?=
 =?us-ascii?Q?ozyvvPc7sZd3/4sLftB3AdcrsK0n0kxdOtwtgpGz/sZTp0aW8xYr2o9Cppt7?=
 =?us-ascii?Q?PiMsdjtF65KV+NYmlzuq+w2m9V4nFm2E5nVw0gSjnPdXHIvXiQ1XUdId/JVT?=
 =?us-ascii?Q?UQqagIAae8AufcY/RoGBvTe5f31H66nZ1ae/K4KyVgOGwqk6QIv9PJV0jxjr?=
 =?us-ascii?Q?c/pho4P4fvxXtmmDgj7PkZpWAG4aahjgcCaTRfyo/2InygakUVQgNONCc6H6?=
 =?us-ascii?Q?xsne8PPM1GN3kokWHW/vebEHXfWngfTrHu+8mlSqp2jEAqj8WfHjcIC8YeLX?=
 =?us-ascii?Q?WCcCqkBgCuqiMDTeVNlUB9zW2fay4ukiUpjRWirCHz87fbxIqvtmbncD81Wv?=
 =?us-ascii?Q?AylXgjarADGZSJvImx+ieGNr9fok+VDbYYrx67jnBxcQsU/jEtuKnWqMUdSZ?=
 =?us-ascii?Q?QghGKfcH1gs61YlqeVeLg7yWSn5Ak2wtqaL8t7NYXHEb+0HYmjpAjUhNAcEy?=
 =?us-ascii?Q?UBV6lnOvt2wQWqY2VMljIysRYqOrWpVl9mnzkH36g1aFT5siYdtvuZ+1mHj8?=
 =?us-ascii?Q?l/tTDJ5tXm/bBQnLwdkMCqXq7/U=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b00d1fa-7bcd-45eb-91c8-08d9dcfa42d2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:22:47.1760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HrmTJwU/GneTlVP+w2vz+KZNVwi3KXBAnAb35WWJBC2xmwyimNuh3M5nSIOZCncaqhQ//S6UTkGL0ddKn4ljUvyTSkO5A6/3UvyRIFEojc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4006
Received-SPF: pass client-ip=40.107.5.116;
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

Now implement that possibility in gen_commands() function.

The functionality will be used in the following commit, and now comment
in _begin_user_module() about c_name() is a bit premature.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/qapi/commands.py | 101 +++++++++++++++++++++++++++++++++------
 scripts/qapi/main.py     |   2 +-
 2 files changed, 88 insertions(+), 15 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 21001bbd6b..166bf5dcbc 100644
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
@@ -71,21 +72,67 @@ def gen_call(name: str,
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
+
+        trace_qmp_enter_%(name)s(req_json->str);
+    }
+    ''',
+                     upper=upper, name=name)
+
+    ret += mcgen('''
+
+    %(lhs)sqmp_%(name)s(%(args)s&err);
+''',
+                 name=name, args=argstr, lhs=lhs)
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
+
+        trace_qmp_exit_%(name)s(ret_json->str, true);
+    }
+    ''',
+                         upper=upper, name=name)
+        else:
+            ret += mcgen('''
+
+    trace_qmp_exit_%(name)s("{}", true);
+    ''',
+                         name=name)
+
     return ret
 
 
@@ -122,10 +169,19 @@ def gen_marshal_decl(name: str) -> str:
                  proto=build_marshal_proto(name))
 
 
+def gen_trace(name: str) -> str:
+    return mcgen('''
+qmp_enter_%(name)s(const char *json) "%%s"
+qmp_exit_%(name)s(const char *result, bool succeeded) "%%s %%d"
+''',
+                 name=c_name(name))
+
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
@@ -180,7 +236,7 @@ def gen_marshal(name: str,
     }
 ''')
 
-    ret += gen_call(name, arg_type, boxed, ret_type)
+    ret += gen_call(name, arg_type, boxed, ret_type, add_trace_events)
 
     ret += mcgen('''
 
@@ -238,11 +294,13 @@ def gen_register_command(name: str,
 
 
 class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
-    def __init__(self, prefix: str):
+    def __init__(self, prefix: str, add_trace_events: bool):
         super().__init__(
             prefix, 'qapi-commands',
-            ' * Schema-defined QAPI/QMP commands', None, __doc__)
+            ' * Schema-defined QAPI/QMP commands', None, __doc__,
+            add_trace_events=add_trace_events)
         self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
+        self.add_trace_events = add_trace_events
 
     def _begin_user_module(self, name: str) -> None:
         self._visited_ret_types[self._genc] = set()
@@ -261,6 +319,17 @@ def _begin_user_module(self, name: str) -> None:
 
 ''',
                              commands=commands, visit=visit))
+
+        if self.add_trace_events and commands != 'qapi-commands':
+            self._genc.add(mcgen('''
+#include "trace/trace-qapi.h"
+#include "qapi/qmp/qjson.h"
+#include "trace/trace-%(nm)s_trace_events.h"
+''',
+                                 nm=c_name(commands, protect=False)))
+            # We use c_name(commands, protect=False) to turn '-' into '_', to
+            # match .underscorify() in trace/meson.build
+
         self._genh.add(mcgen('''
 #include "%(types)s.h"
 
@@ -322,7 +391,10 @@ def visit_command(self,
         with ifcontext(ifcond, self._genh, self._genc):
             self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
             self._genh.add(gen_marshal_decl(name))
-            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
+            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
+                                       self.add_trace_events))
+            if self.add_trace_events:
+                self._gent.add(gen_trace(name))
         with self._temp_module('./init'):
             with ifcontext(ifcond, self._genh, self._genc):
                 self._genc.add(gen_register_command(
@@ -332,7 +404,8 @@ def visit_command(self,
 
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
index f2ea6e0ce4..2e61409f04 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -49,7 +49,7 @@ def generate(schema_file: str,
     schema = QAPISchema(schema_file)
     gen_types(schema, output_dir, prefix, builtins)
     gen_visit(schema, output_dir, prefix, builtins)
-    gen_commands(schema, output_dir, prefix)
+    gen_commands(schema, output_dir, prefix, False)
     gen_events(schema, output_dir, prefix)
     gen_introspect(schema, output_dir, prefix, unmask)
 
-- 
2.31.1


