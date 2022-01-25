Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A049BE31
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 23:05:44 +0100 (CET)
Received: from localhost ([::1]:37092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCTwd-0008SD-7i
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 17:05:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToW-0000P2-8s
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:20 -0500
Received: from [2a01:111:f400:fe0e::730] (port=45285
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToU-0002Hu-AH
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEhBsqN3/I4oqrcCStie47zUyhNPWMKUJ7SC99ZYrIKvSM2Ok+Hy3ehcBQmy+B+v+HnlfpP/KQgqjJmiFIvAEIQNAlCmn+fuE7xP9m+PW8HoXOQa0rblUfpVOV0hSN9gGKvPa6lFWkqpW32/6MQRJKHU7YYW1FRvgMFUW7g3erdUIJ6vGUGutxo1fJ4RJ+InB2ltwf5jaLfG0Sek5gZPw7bPS/tJynwlmv0L37AOdmGpS5fGfg50pyXbMd83qO63iG24VfjNwm5R0DKDkX9FR5fu6EOYQVL/qnN2zEwKH9d/faatvaVGycjg7YpaXpn109wIw7ca4wTzb5bdZiSazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVAlJimHKjh/kHgoCYGOPONZamdUMESABFMuq1nxa5U=;
 b=Vr10cUuuF9UXNVZQgm6MW+uyQwcqhUz9ER8Um/4gFprVaHyLCamkPKKYOt6NQ/UMjW5v4gDzlopuJmPL1/0mkknyzB4z5vbOXM5uygsFVimF+qJtEMXHwxIteQqGh2ruxbjfitPR/ZpVqJSa4jxZQ7y2YZqNM9JOl6PzskK/vJ1Dkj//QvbOAXvrjhiLmtxTBvVglQ4DY4iA9Sw0FarxFeFuracuUQvd2CeRtf+U7X9bWMSmq/2z3VtGKQ60UE4nEWOZ7MgUzrSFZdyqsr3xvfLziApBJul0iCHZ1I2DmarAr029bdg7qoGvb8BcDVxmKg8lxJ7lMwrNnfQ3HR1OWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVAlJimHKjh/kHgoCYGOPONZamdUMESABFMuq1nxa5U=;
 b=Y328pjhwCDKV7VtABVx4/g3mUjzBI50Ql9fmvNNHZVJiJClm4QNM3SlSAuNygKsGG1NLeVyL9Oj3SmESRW2NsGHXhIt/7ei6cglHk9H5Z6Ta2dEO2CcyO/Z3ZT7Vj1RtvsPhlJtZRR92EM1ZxmZlojctvI+A2r2zuOD0SXXai/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3082.eurprd08.prod.outlook.com (2603:10a6:5:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 21:57:09 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 21:57:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v5 3/7] qapi/commands: Optionally generate trace for QMP
 commands
Date: Tue, 25 Jan 2022 22:56:51 +0100
Message-Id: <20220125215655.3111881-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67f3f3d7-a9d9-4ec5-e4e5-08d9e04da272
X-MS-TrafficTypeDiagnostic: DB7PR08MB3082:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3082835F88E64127603F2A53C15F9@DB7PR08MB3082.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kxPBNa3MpRdTp50jgcucsGfNTNnnEJiqPt1dl54yolLTvxpUzuwE6ZNkUcp2v4ZD8xek7V9qhSR18y53F+2hVCDbrphL1JWkRYanQvQxuk9Lvy6HU37aOlSI6beyjrBnEV0klewXdCV+CsMR2uPjYtLQYeWhbURO78MrEnwFEu7Tv4MV1qxpR0DJKHYLqHqdJek4UxXM02HE/y/X0HXXk/nUL18CQFS15xzJHIJG8ssCeBhBx27B33AxsXbkDFB9e8Hlt+f1Dl9pF2B1XihcJ0k9JM9F15FMlaGudtbP+aesPyWQjgj20r2RYYz2mRXA0CIiGtMLx+jcNXu1irgnY7PR0/DtMGfxPg2CrnbLBhfu9TqDwrFksw01be9LCP/IbgMLIHZY2oGdDYpao/ERo3mmYmLanXQxWTIX1RyjIL8ARQeC5zM+aUXBrgJs18PjLM0FcgGu6tx8DEihg4koW13MlooZ3/qjPxzPhI+eHPFR2ZvxLm8GdMWi8x56leTCOrBMqggDgIKJdXrVgjxyrqujCliLYORLwpWwd371i6hskAZvHvwHmGCyL3xKtC5d2m+UYv/ZBuNKUMVTQPIJrMUae05RDvgThC/jNhPvNJKfb04Qp/O+zoI3YAkaFG1l90ty4+JsUec781uJZtwoDaMlkWIG03j9Dj8cs20vdaULXaKhiFcUTMGHRWWxEzFVwZmO2HTM98A2Lip/HFFr6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2616005)(6916009)(86362001)(66946007)(186003)(36756003)(8676002)(38100700002)(8936002)(38350700002)(508600001)(66556008)(66476007)(5660300002)(52116002)(6512007)(6666004)(2906002)(83380400001)(6506007)(316002)(6486002)(26005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WEAbLBdmY2SJWB2IMVAcu04WHlm8ll/6mx4P3sDMXTBrxsAOyGE15s1R3k2X?=
 =?us-ascii?Q?vToqVCXFtLGiuorEoLPwm5m3V8DuXn+3EGygDr7ESHvKyCLWBX/Nn1EhBWHZ?=
 =?us-ascii?Q?sTVrfsHAOpW+Vbcert+oPGWgu/2aB+fUI4OAPv7bRate8MQp45T5SmXFqc17?=
 =?us-ascii?Q?b7u2gOAeCR+YVmPBhTTkezW3nuQJeA+SxHT+/7V6u+KD8qXJDwKak9eKE+4y?=
 =?us-ascii?Q?0Ni7V1XV6izxkYwrOc8LlAHcY120IPaX6BpxienWK+OHCmm/LVqKGF5s9arh?=
 =?us-ascii?Q?xQXi/PBU9cIXZc5tVU5RIpbmgij0ECnGYAE3ze8fB/Z7wzMQbeEXZJi2l4GC?=
 =?us-ascii?Q?Hs0thnij7cihNyHMKZ0nd0IAvGXuLTTgffv0wnJXMwqZCYiPNY9kk6XXlPm3?=
 =?us-ascii?Q?oy1VC6Tr41Y8ev+1rp5+CoDVUC00nWlZFtuE+QtOsM3ikong51GXqJCmHCby?=
 =?us-ascii?Q?JHpDQe6Hbxr3Dc4YCm8WAHJSrgFW4qCBxIwRP2VqNOTVqQzbEAcALP0cpXDh?=
 =?us-ascii?Q?OplN0jA+yo9k2SsB75qSjRqA+4XS8tSKNL3KYdS57Y/fexPTN3Xr9M9zp84X?=
 =?us-ascii?Q?Ecxx5OIT/2AWZ2Bel0ydWMuzgxmMwJl410tKo8oouAvp+ZrfAClCE34xjXDu?=
 =?us-ascii?Q?cB+Iih68ahncMYmEYHv4ZrOl5dDy5TTQTSoWOh4BcqP+haQTB4TdWPoZ9qXJ?=
 =?us-ascii?Q?3YAfljV+/OzPPjbPuSDtAmLoM7lCLT+HQ3XZuZogqCCkNGIxGvavpCvA3p0P?=
 =?us-ascii?Q?mH/0MG80w1rRf3zUESjCDjmDs7tvfn+Y3VXPsVXpd8jRwQPap4W++C9aNVYK?=
 =?us-ascii?Q?/9rCFbX+RZlGG83tmVM0PL1buMoZMyQck3b0ocdCFJlyNwxZ/K+suzQycCNm?=
 =?us-ascii?Q?Lg/VqOtX7QQiC/7mUVYpBGi9fsy3PbDLXFSWyLThHjSdxHvN6Mdsz04nATOh?=
 =?us-ascii?Q?w1Rz5gi+pETQusaEYpF4kgJdI+f+nXWIsNmUFYWshnCnemTtGLf/v56ZUhiZ?=
 =?us-ascii?Q?46LQ5bBh5xdpFBu908mR1VASz6guld/b9UL+xsmWcz3mU/uFenoIrc01g1h1?=
 =?us-ascii?Q?D9XU+DruqKIh538cmBKktlr4nmz8x/Hy3OJkEUU0BY+ErDmGaIx3p+X0GfEg?=
 =?us-ascii?Q?W1Tm1Q8cL3Wyx73epGBzRjH/G/Ur2thhVafgzL7ZUmO4r1m7Gta08XjKaM86?=
 =?us-ascii?Q?NOJmBkd0qQ3KAQpCONue5Y6OObb0xi6LJNgV2G+0Fz8zcibkIZYpVjxZJuxy?=
 =?us-ascii?Q?8vjy+jIYYvfqxYI47ha1OBlNXJlsNpgdhPTZwhp94bcAvgInyyZhJz1Z7YZS?=
 =?us-ascii?Q?7/WQyQ/UsR8HxteCzrMk1u10FAH/PyAfttG9MPVwtzyzRJvYiO502S3ed9iS?=
 =?us-ascii?Q?JUiyimKDfzb4cYtA45tESB5HB3f9iRokwc972bOaoFCajb6VmfXGtvZVQQmA?=
 =?us-ascii?Q?duT8hZ4VkCwO8iueeYXdkPJoGZyI6YiKMDqBAZBU57qv1mAWpRqG+gvF4+xQ?=
 =?us-ascii?Q?B8+BV0EmL/cgKILvBi8BHpfJoB8VwZBhzhpTCpv4daetkqw4xFAP6H7U1OlD?=
 =?us-ascii?Q?KrHvLRmLAXKwpa1ktnUw24awoH+d24HcTpAeeqVU3Yngc+6QiEj6eeXzC1Pz?=
 =?us-ascii?Q?IaBrzPGpF9yV9owwl4Oa5uGOqWHoo3DACNeog94D+2gklSoGOUu0KJhdSzdX?=
 =?us-ascii?Q?YFHLYw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f3f3d7-a9d9-4ec5-e4e5-08d9e04da272
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 21:57:09.3897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmhcW5/LNeTaXf9H5mNkCCKyOpBW1S5YQ1Ue/ohx5CstBJBj4AzLapCBw1SLFysDPhs2yYVfmI43/a/+o+GGNH+igapC50uawOY5aTxkAAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3082
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::730
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::730;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add trace generation disabled by default and new option --gen-trace to
enable it.  The next commit will enable it for qapi/, but not for qga/
and tests/.  Making it work for the latter two would involve some Meson
hackery to ensure we generate the trace-events files before trace-tool
uses them.  Since we don't actually support tracing there, we'll bypass
that problem.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/qapi/commands.py | 91 +++++++++++++++++++++++++++++++++++-----
 scripts/qapi/main.py     | 10 +++--
 2 files changed, 87 insertions(+), 14 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 17e5ed2414..0c171cb880 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -53,7 +53,8 @@ def gen_command_decl(name: str,
 def gen_call(name: str,
              arg_type: Optional[QAPISchemaObjectType],
              boxed: bool,
-             ret_type: Optional[QAPISchemaType]) -> str:
+             ret_type: Optional[QAPISchemaType],
+             gen_trace_events: bool) -> str:
     ret = ''
 
     argstr = ''
@@ -71,14 +72,37 @@ def gen_call(name: str,
     if ret_type:
         lhs = 'retval = '
 
-    ret = mcgen('''
+    name = c_name(name)
+    upper = name.upper()
 
-    %(lhs)sqmp_%(c_name)s(%(args)s&err);
+    if gen_trace_events:
+        ret += mcgen('''
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
 ''',
-                c_name=c_name(name), args=argstr, lhs=lhs)
+                 name=name, args=argstr, lhs=lhs)
 
     ret += mcgen('''
     if (err) {
+''')
+
+    if gen_trace_events:
+        ret += mcgen('''
+        trace_qmp_exit_%(name)s(error_get_pretty(err), false);
+''',
+                     name=name)
+
+    ret += mcgen('''
         error_propagate(errp, err);
         goto out;
     }
@@ -90,6 +114,25 @@ def gen_call(name: str,
     qmp_marshal_output_%(c_name)s(retval, ret, errp);
 ''',
                      c_name=ret_type.c_name())
+
+    if gen_trace_events:
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
 
 
@@ -126,10 +169,19 @@ def gen_marshal_decl(name: str) -> str:
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
+                gen_trace_events: bool) -> str:
     have_args = boxed or (arg_type and not arg_type.is_empty())
     if have_args:
         assert arg_type is not None
@@ -184,7 +236,7 @@ def gen_marshal(name: str,
     }
 ''')
 
-    ret += gen_call(name, arg_type, boxed, ret_type)
+    ret += gen_call(name, arg_type, boxed, ret_type, gen_trace_events)
 
     ret += mcgen('''
 
@@ -242,11 +294,13 @@ def gen_register_command(name: str,
 
 
 class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
-    def __init__(self, prefix: str):
+    def __init__(self, prefix: str, gen_trace_events: bool):
         super().__init__(
             prefix, 'qapi-commands',
-            ' * Schema-defined QAPI/QMP commands', None, __doc__)
+            ' * Schema-defined QAPI/QMP commands', None, __doc__,
+            gen_trace_events=gen_trace_events)
         self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
+        self._gen_trace_events = gen_trace_events
 
     def _begin_user_module(self, name: str) -> None:
         self._visited_ret_types[self._genc] = set()
@@ -265,6 +319,17 @@ def _begin_user_module(self, name: str) -> None:
 
 ''',
                              commands=commands, visit=visit))
+
+        if self._gen_trace_events and commands != 'qapi-commands':
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
 
@@ -326,7 +391,10 @@ def visit_command(self,
         with ifcontext(ifcond, self._genh, self._genc):
             self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
             self._genh.add(gen_marshal_decl(name))
-            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
+            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
+                                       self._gen_trace_events))
+            if self._gen_trace_events:
+                self._gent.add(gen_trace(name))
         with self._temp_module('./init'):
             with ifcontext(ifcond, self._genh, self._genc):
                 self._genc.add(gen_register_command(
@@ -336,7 +404,8 @@ def visit_command(self,
 
 def gen_commands(schema: QAPISchema,
                  output_dir: str,
-                 prefix: str) -> None:
-    vis = QAPISchemaGenCommandVisitor(prefix)
+                 prefix: str,
+                 gen_trace_events: bool) -> None:
+    vis = QAPISchemaGenCommandVisitor(prefix, gen_trace_events)
     schema.visit(vis)
     vis.write(output_dir)
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index f2ea6e0ce4..ecff41910c 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -32,7 +32,8 @@ def generate(schema_file: str,
              output_dir: str,
              prefix: str,
              unmask: bool = False,
-             builtins: bool = False) -> None:
+             builtins: bool = False,
+             gen_trace_events: bool = False) -> None:
     """
     Generate C code for the given schema into the target directory.
 
@@ -49,7 +50,7 @@ def generate(schema_file: str,
     schema = QAPISchema(schema_file)
     gen_types(schema, output_dir, prefix, builtins)
     gen_visit(schema, output_dir, prefix, builtins)
-    gen_commands(schema, output_dir, prefix)
+    gen_commands(schema, output_dir, prefix, gen_trace_events)
     gen_events(schema, output_dir, prefix)
     gen_introspect(schema, output_dir, prefix, unmask)
 
@@ -74,6 +75,8 @@ def main() -> int:
     parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
                         dest='unmask',
                         help="expose non-ABI names in introspection")
+    parser.add_argument('--gen-trace', action='store_true',
+                        help="add trace events to qmp marshals")
     parser.add_argument('schema', action='store')
     args = parser.parse_args()
 
@@ -88,7 +91,8 @@ def main() -> int:
                  output_dir=args.output_dir,
                  prefix=args.prefix,
                  unmask=args.unmask,
-                 builtins=args.builtins)
+                 builtins=args.builtins,
+                 gen_trace_events=args.gen_trace)
     except QAPIError as err:
         print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
         return 1
-- 
2.31.1


