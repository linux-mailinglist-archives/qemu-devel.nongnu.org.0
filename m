Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B849CFBF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:31:50 +0100 (CET)
Received: from localhost ([::1]:34524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClD3-0007cG-88
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:31:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCku7-00022I-1N
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:19 -0500
Received: from [2a01:111:f400:7d00::70c] (port=30528
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCktt-0000NL-1G
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+LyhL31dkZWKf/Vyso1dlSpjygH+CoCqNvD+SOBzHbBZ4cBUm5488C9QzoHCB5mjd+yZ7ddiaTu8YoQYNcBuvlFzEnLwBnGrTowp57wzLwRH7y3Cpz7xpnO8vr3sY75q8IoZ6wYWN/SSHOWge/woHrbAA2ZSCASXGApaz+bJKPiSGAC/9ZK2nRAP4oVHBZEvy7dySjEY6Hcz2wnuGeywH8yzo+3uDE2MDslAYyqpLuYElRgd5/fdmwSBsOKsbTWmr/UfylYKOkipLquFwr6tLoDkMfEXJWn3WODopUSv3nvNGKoZfHvRpY/RqGqk8FBnXjDXtLX01TmJPhkHVDg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXlFE9Oo4V/0BtkaOYTWKCdG9hpw4qkC60YbLHTzK4E=;
 b=MkPCr6ObKeMowC7rcY5d1lE3ERrxdap2w+RmteHXbjQEe2uED/+TxicPrikTL0gYZnzfdyKMB2RQgMAsRp7W+E+MUdYBWJenH7GlNLeKxjMj+3H1Wmc6SexUgRyvTblHrIIUCGO6QPp2SJjRswjs960n+XRH8qyd4GBcB+Thv6HrdZSku60Y0snlYcBk6FWYv7afkvDvc6Ki1540sHDDZn6NB0ZwBEbyLbe/ud2O0KoQ1IvpZbNMXX1bzzLXhpJqEjO5aRLAdoYrswsYHyinh8vw5XvKIb5QykDAa8pQQ6VGG//nq64T242KYANtCKBThWU94nKQQXn7we7KqvS7Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXlFE9Oo4V/0BtkaOYTWKCdG9hpw4qkC60YbLHTzK4E=;
 b=WlJvBtyZyleN7wNcHUFeugSyECc8iACiYrN+QZCXsiKGN4SofT2pzK1AHrQvZ38cvsRvhSESPjfqTKMm7y200hp7wzHO5XjL67VzGN466m9s+2bphbc2F/OCEp3h7QipN3ZgR5j/bcAMtfwiyh13f0KO7OTB8WOZYnlAQ+49I/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:11:41 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 16:11:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v6 3/7] qapi/commands: Optionally generate trace for QMP
 commands
Date: Wed, 26 Jan 2022 17:11:26 +0100
Message-Id: <20220126161130.3240892-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a212f26e-65e9-40bb-01db-08d9e0e68a0e
X-MS-TrafficTypeDiagnostic: PR3PR08MB5868:EE_
X-Microsoft-Antispam-PRVS: <PR3PR08MB5868FB89E9A995BF4D341730C1209@PR3PR08MB5868.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qnyX0TxJh80qHbM8/IzYmC0pIqzzQSWbBFDJVoc/hzq1h6JdyHbBjo4gscSsZvkF8+/cETfG1JyOXCb2dQUVyfzDAfPjaX1BRUc8kBInk3hrPty7qYX36mV5fKJDDkz9TtaYrXX7y+DPbDxukY7JtAl7nDfHL+uXHn666Eq2/BCZ9aY45Ah8jn1SCUcH9R4A4qVQ1qC6V+cWuXzIzXCynex5lkJseVaQJA6qR1A8nY1O5hlN4kZ3UGKcI2yLAYO0kfS4E8YoF8qFCJJJcVLem8Im+/tTXTOBP6cLK/BDA+jfzKPSloHS8GtC4U7XhsuliDlo2ADDtll228Gx7YcyOS7dtYRPwBw1aJvACpefWrm6MQcPfvOX/rXqJW1awJdNLPNLVCnANzQUHudqPCTGpuzeD5e7DwFE3DoChsyaXra98Y6q7DKYyjR48jed+kihi6XLeGMj9Va8HZm/nGxqIiVSLZafxOrrg/3pEu2viEm3d3AamvdEKUKUnwu0NYzXV4+L+OMO4o0tlnu6+Qsyj6TvnsSRweaagsmEkejtH3KTb9vQSL6r5jBQjokJJgBIm99rRnjZAo7Flvgsu9QK5mgJojmDBdx+6nV8XwvFBBLnEfIxw9iI0WLOq3cFn3a6FMnBEhOQf44h0y6t8k5vYhahD6f8ed6CBiCpAN8oSa/k4gtjYvL70U4D9r76KaGddNte14mAWR1doXFKvBUpIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66476007)(83380400001)(8936002)(6916009)(4326008)(8676002)(26005)(38350700002)(86362001)(186003)(38100700002)(1076003)(36756003)(2616005)(6486002)(2906002)(66946007)(6512007)(66556008)(508600001)(6506007)(52116002)(6666004)(5660300002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HT0otSJehR96usXahGAsN4yb3dwdBu2nsinCn5uVKF8unDnigYffymn1r+ft?=
 =?us-ascii?Q?YUl6QdMKzcVDPDshkd6tAEdVKMVdMpFbp1PhxVZarvZnoffbDhHmL5yHy8zD?=
 =?us-ascii?Q?oWAFj+/4tcZHxVKr7dEGMppQ2iLc8QdqQxtZshACHA1ZXIzQ460oGPrMW8Bk?=
 =?us-ascii?Q?l20rWYvkdQR6mRQOovET0pipgKjcLxUxeLbCnyLvqstdVjmxhlZW4DQBwjXV?=
 =?us-ascii?Q?nPNQa7p1ZHRSN7uACBDtOa+A30HmNSaeGTN+dXfER9XNOq2SSvrWYrs2hwy+?=
 =?us-ascii?Q?bfiK9U+Kbo9rCrg77h7WOmYUyjkUto4RyB5BigcIENibPvxyF9MNFgnDD+nY?=
 =?us-ascii?Q?IIBrByEaOSGAab++A4tLXjEnpXYXpgZOYsqPaz49+lN/rwOW3xwq8x6njK0G?=
 =?us-ascii?Q?IQzgndNWO8+1wJYBF6FUi3jgBXft0WDnJXuSmxVDUB41Bunra+omzexlTYtQ?=
 =?us-ascii?Q?NkVpxlh1UdSPKKZXMtwiF1m6LMnhoI8aMFk++h90N0916NbzPFbyWVvZktc1?=
 =?us-ascii?Q?OZdHYhkIN/WspAthusIRhoYoDy9h8bQN2Csk2jA1Dm1pZ+1V+Rg3xUAnL6XP?=
 =?us-ascii?Q?lchj11Gr3l0XSqvOhcsrbPXbBKFgrOucIAGSnoCG9rOzZTFlpXpOBIWtyEOo?=
 =?us-ascii?Q?sZOjbud9nXwlUsKkINSAQ535bSmnsl1ux944ifL5TLeT+orAQ9qO7HkvO1GK?=
 =?us-ascii?Q?/NS5ueelIrfCh1dk1UrcuLNSdmlaiYu0aGDVRcwz1Hfm1kESKnMOIFaPUW1j?=
 =?us-ascii?Q?J3w8pMxYUGfJQ3XU1iP9CDoTEUTvEShd0JKHdfQJHSTMdGZvspRRmXknDMav?=
 =?us-ascii?Q?0rKygsYvN9eIrYBMb6AXsvEuV7hto9QNUek5MkLk0yEXW+AWYFU3StYzKVAw?=
 =?us-ascii?Q?OqXRja2DVF9Nx6U92dRJYFPcTCAHIMBqUpHpIdK426vh45NEnOqtAPA42q0C?=
 =?us-ascii?Q?oIIO+gsyeWHGJ65yssoSlBkIbYc6+Mp1hZRnSTzUkQRCvZGdu+N3GoVnLR1Y?=
 =?us-ascii?Q?po6izu7vwbmy1+mJZOr5TAE23VtjkSqVugO/ANYwioHzzP1Lu9MVHhj2isgN?=
 =?us-ascii?Q?LZui/LugFQgoKhcO1HAs74xHk6wvNC30YcMU95OVaPMllHUehv/rHtGfcSm+?=
 =?us-ascii?Q?Rq5fjCdlwmVacxzMJ24MBUDjslQAjUAcoKTYHGB5Cv9Fez4QcaN14w9N1rSM?=
 =?us-ascii?Q?MlYMW3SgC3vff7eOMcUCTJTG9mYNdjYnnwaK0JLzH1ZeqC5kSgvLMpz3poYf?=
 =?us-ascii?Q?GU2VA2kIn++aVKV7UxthAtG4SKM7XEalpO7cmuEibiD8aOQx4zcr2D+JWhjd?=
 =?us-ascii?Q?5bwvzydYNsOIedMpKzDxb3R2JKF7Hb3Nas56uzMVvKw7cxwXpj190I2O6Wra?=
 =?us-ascii?Q?yLfwAtt3jY66Y4M9jnQEaAdn/CmOQYC9ASKcTqUXOblyD0oftEAPYXDHYhSz?=
 =?us-ascii?Q?KXAB/dB6m9peQxHzoGAPE8fQab04GmAPaBxg6ziOmcnL78+GZdtWqR7m8EP5?=
 =?us-ascii?Q?MFbIDJygYloiPLomF67NuFYcYI1cZ6KTYIvojg0wqAgFu3w9Ssi1j5fiV+h2?=
 =?us-ascii?Q?7o5D/HU/Pbfrl/SoG3EH0ggu8rqCT4h90P+p5NH9ovR5TYQUfaE+N2O7HMJ5?=
 =?us-ascii?Q?1oeygo0hAjKP9WPrtqAI1UcOFw798jeOxOZvZx6fLfKpzqfwRLgB1EbKDn1U?=
 =?us-ascii?Q?MkGyEYk2q7POku/64d5HjwqBa5c=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a212f26e-65e9-40bb-01db-08d9e0e68a0e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:11:41.4471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPJq5Oihzr2KR3WlyxrEyCGOsIJqHUcIBjFwLltrroG0TU3fAd4NPu6T0nxBUJLgTmBJvsQZdSU7f1p4PovbUpwSva8ris3AQwQOCf9FyiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::70c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::70c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Add trace generation disabled by default and new option --gen-trace to
enable it.  The next commit will enable it for qapi/, but not for qga/
and tests/.  Making it work for the latter two would involve some Meson
hackery to ensure we generate the trace-events files before trace-tool
uses them.  Since we don't actually support tracing there, we'll bypass
that problem.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 scripts/qapi/commands.py | 91 +++++++++++++++++++++++++++++++++++-----
 scripts/qapi/main.py     | 14 +++++--
 2 files changed, 91 insertions(+), 14 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 17e5ed2414..fa90b6246b 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -53,7 +53,8 @@ def gen_command_decl(name: str,
 def gen_call(name: str,
              arg_type: Optional[QAPISchemaObjectType],
              boxed: bool,
-             ret_type: Optional[QAPISchemaType]) -> str:
+             ret_type: Optional[QAPISchemaType],
+             gen_tracing: bool) -> str:
     ret = ''
 
     argstr = ''
@@ -71,14 +72,37 @@ def gen_call(name: str,
     if ret_type:
         lhs = 'retval = '
 
-    ret = mcgen('''
+    name = c_name(name)
+    upper = name.upper()
 
-    %(lhs)sqmp_%(c_name)s(%(args)s&err);
+    if gen_tracing:
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
+    if gen_tracing:
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
+    if gen_tracing:
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
+                gen_tracing: bool) -> str:
     have_args = boxed or (arg_type and not arg_type.is_empty())
     if have_args:
         assert arg_type is not None
@@ -184,7 +236,7 @@ def gen_marshal(name: str,
     }
 ''')
 
-    ret += gen_call(name, arg_type, boxed, ret_type)
+    ret += gen_call(name, arg_type, boxed, ret_type, gen_tracing)
 
     ret += mcgen('''
 
@@ -242,11 +294,13 @@ def gen_register_command(name: str,
 
 
 class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
-    def __init__(self, prefix: str):
+    def __init__(self, prefix: str, gen_tracing: bool):
         super().__init__(
             prefix, 'qapi-commands',
-            ' * Schema-defined QAPI/QMP commands', None, __doc__)
+            ' * Schema-defined QAPI/QMP commands', None, __doc__,
+            gen_tracing=gen_tracing)
         self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
+        self._gen_tracing = gen_tracing
 
     def _begin_user_module(self, name: str) -> None:
         self._visited_ret_types[self._genc] = set()
@@ -265,6 +319,17 @@ def _begin_user_module(self, name: str) -> None:
 
 ''',
                              commands=commands, visit=visit))
+
+        if self._gen_tracing and commands != 'qapi-commands':
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
+                                       self._gen_tracing))
+            if self._gen_tracing:
+                self._gen_trace_events.add(gen_trace(name))
         with self._temp_module('./init'):
             with ifcontext(ifcond, self._genh, self._genc):
                 self._genc.add(gen_register_command(
@@ -336,7 +404,8 @@ def visit_command(self,
 
 def gen_commands(schema: QAPISchema,
                  output_dir: str,
-                 prefix: str) -> None:
-    vis = QAPISchemaGenCommandVisitor(prefix)
+                 prefix: str,
+                 gen_tracing: bool) -> None:
+    vis = QAPISchemaGenCommandVisitor(prefix, gen_tracing)
     schema.visit(vis)
     vis.write(output_dir)
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index f2ea6e0ce4..687d408aba 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -32,7 +32,8 @@ def generate(schema_file: str,
              output_dir: str,
              prefix: str,
              unmask: bool = False,
-             builtins: bool = False) -> None:
+             builtins: bool = False,
+             gen_tracing: bool = False) -> None:
     """
     Generate C code for the given schema into the target directory.
 
@@ -49,7 +50,7 @@ def generate(schema_file: str,
     schema = QAPISchema(schema_file)
     gen_types(schema, output_dir, prefix, builtins)
     gen_visit(schema, output_dir, prefix, builtins)
-    gen_commands(schema, output_dir, prefix)
+    gen_commands(schema, output_dir, prefix, gen_tracing)
     gen_events(schema, output_dir, prefix)
     gen_introspect(schema, output_dir, prefix, unmask)
 
@@ -74,6 +75,12 @@ def main() -> int:
     parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
                         dest='unmask',
                         help="expose non-ABI names in introspection")
+
+    # Option --gen-trace exists so we can avoid solving build system
+    # problems.  TODO Drop it when we no longer need it.
+    parser.add_argument('--gen-trace', action='store_true',
+                        help="add trace events to qmp marshals")
+
     parser.add_argument('schema', action='store')
     args = parser.parse_args()
 
@@ -88,7 +95,8 @@ def main() -> int:
                  output_dir=args.output_dir,
                  prefix=args.prefix,
                  unmask=args.unmask,
-                 builtins=args.builtins)
+                 builtins=args.builtins,
+                 gen_tracing=args.gen_trace)
     except QAPIError as err:
         print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
         return 1
-- 
2.31.1


