Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E422A33C622
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:51:09 +0100 (CET)
Received: from localhost ([::1]:43550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsJ2-0004E4-U5
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs6x-00043U-BD
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:39 -0400
Received: from mail-eopbgr750120.outbound.protection.outlook.com
 ([40.107.75.120]:38565 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs6r-0006Ga-NR
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1aasfUlY3t3A7V1N3llEP5T1woLYcPRPKWAEkckfcjKri8iA8N7NwLGPhgFrPlB3nsHKqVE6mYI/0XAVNw5iU+bIC8pyOWxQfImP4F15wiUoqJLhjfCYlweUEFq82bVienrCfGvM8q6x5awLuVnM7GBYRM4TqyC7Ukhj2B+4HxV8QUsmokrYozCS/lr2aAKX0rdgnEdAN3BAvVydki+lAUohZPvbZ6fdG8k5ptMsA4zNWHYKqwwmxE0G6zJA85hmlri8xH5isN82sOb20m+KAQsrxAQXzBxH2gEEVe/4aiaO+TC0bTGdg4gOSfKajYI2LRhvdeGscWZm8bFEYbGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOxFnzRV0wq6rZGeRspbedk6biu/qP5/AlrN9JrA7II=;
 b=F/4Yi6/0xD/t6YVg7kDdhYK4To5Nt6XumskpYIR6hXqJUSzSi10sTbRaxC2xolV7vltvafS1vn60H1qPpnfRpPARcTkFfle8Y+fppVRaG58bN5/zFk+a8mdD8/hPl+LkvRn0aQVt7Aj6Hp5OlN+joj3IQjpDG+kOnP8peiI8foiACC8GQ47gSgSRb6cpIFpjcEpmVjKMIhjHQo4XUBQx+BLIaMt2RBO6JYngTCra4G/MAI0OaFd5xQ9fvaNY7xfdo51IMjSsM7eJYF6Eo0E3tvTJaj7xgceTZvi8PnhTXXcKBzkVQvVqtL7NwYB5fmM6E+DRl54XbX8TJ96IlnG2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOxFnzRV0wq6rZGeRspbedk6biu/qP5/AlrN9JrA7II=;
 b=17ilh69DsVV4QT/ma5CYlVP/PulD5jUpI49JEsa52TEYmfWV/1rACQfW0Sc8B765jTHkdvZKaqaU7+3++xe+kagces5N43Dk0SyS1Vl/g7N7AiiAjyulghd6xte1MObgtQv8flyM0UHWqmgLgTcHp1RBNCcxDTXnpIIiZ1of6uc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5724.namprd03.prod.outlook.com (2603:10b6:806:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 18:38:28 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 18:38:28 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/11] fuzz: add a script to build reproducers
Date: Mon, 15 Mar 2021 14:38:07 -0400
Message-Id: <20210315183812.27760-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315183812.27760-1-alxndr@bu.edu>
References: <20210315183812.27760-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0323.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::28) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0323.namprd13.prod.outlook.com (2603:10b6:208:2c1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Mon, 15 Mar 2021 18:38:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98131b7d-fe52-4847-6864-08d8e7e1866f
X-MS-TrafficTypeDiagnostic: SA2PR03MB5724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB57244F244272529A5253C364BA6C9@SA2PR03MB5724.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwBYjx8w/+9U3+UXOYl4O/q75FARqJ/SMXoMUXmHbaneePxNzR965uwBvsol+ZidmwABiUg98ycpmPef+NOR3MhX6Msel5L5W1zrhbuKZj8S/udt2N6yQ1yzA30OAa58wknM7w0jEtDXBHYPUGRCAF1YsuGDzlCbX2GOarg1rvTDQ+djXx6WSzcQvu4xXgo+kDXm7N/K6g2kOh4qITkEfwI4XHuChvZAQWClFTHcK3kb4YU+KpSD7i8j1MP7W0wNqF78RKfJ4+i8zXLcJpuF5fot+JAUoMEtxQg/qr4Hh9nINain9POuCk3nd/sXoodksin8I2FoW+esc5Ns2ZL7g5kqNZNuFpSakEZUbUu8Zzxy3VuEratO9a/ZuT3vCqje8MwCY71nOt5z4vtb2IuN5m/D5yeb8YzbtYyGMpNdoHUrBpKW2ZLPdTmlWVm3+0ygGbmM4qXLKM3hgN2mQM6Dh3AiaHPCnumGRMqMG/fJLQuc2hMtdJ8+x88/OxY5Z2Lc226f/QmCfSelXvzNHCrIS+FkYipIO+lylfiHxkImSPTfM/WrYAU4RSBkmYKl+S+W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(4326008)(7696005)(36756003)(52116002)(83380400001)(6916009)(6666004)(6486002)(86362001)(8936002)(66556008)(956004)(2616005)(54906003)(786003)(2906002)(16526019)(186003)(5660300002)(8676002)(75432002)(26005)(66476007)(478600001)(316002)(1076003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?INc6lx0wnITOEutf+Zv+SNsbdRs/Iw5h8ScxTDNopjs6RfRC2C6R8AjuA18D?=
 =?us-ascii?Q?yAzEmOOwM1elgXVS3EvEHFLx9qzRw/JCK2/O19EDel9I92fZCET9tVmMc2pi?=
 =?us-ascii?Q?MZwmFeiU2DEa6eOSmsH1S+QN1aryAxNLq0kVzdTBHPTR9fFMKeqAFCwtVaOP?=
 =?us-ascii?Q?W8nwtam2Bwrbt5+4zZHXUltdgMh2vKm7yGJq0awDBc67T0bScxVWIITiVn8M?=
 =?us-ascii?Q?EV0EKKLFv6CyUhluyiIThVKQfqtkCfxY5YNcJakQOpx18zw4J+CzWh57AIav?=
 =?us-ascii?Q?dOvvygcdYoLOTlTuhXWlvxyD/XrQ2FcccxYUq5kxcIkckv4kaYebO5FC6hrG?=
 =?us-ascii?Q?iIo94OGYTfIZjc2lNKoh8HDgJEzpKg86U4u71GFCGXiy891NOdnzLNA8l1ar?=
 =?us-ascii?Q?h8sPocD4gjjNJZPoCaXn5qyikLIO8ovEn8yQ1FMLaoS/UgOEAV227RQTta+7?=
 =?us-ascii?Q?sc4WGaA3BVZKM9lofbAD/Whacp3dWPkZmLttdfyjVTXFz73A6cNEC3OeQk6O?=
 =?us-ascii?Q?ZVkhuKybwH8wrdfrXrrjyLkgoSsNQz3sc9uIK9FIxf+pZLU/5GoB85j2AYdK?=
 =?us-ascii?Q?wQDCnRe+Sj5kvtL+6U4hQWBDuaVgclnVBTYjLY4HHlM37LP4ps1xV2/T4ko5?=
 =?us-ascii?Q?9SclphLxVkJlVCAGXT5/Xfl4E4RgpMAvPPfUQ+KkXQJwA/OXa7nZkZCAjh/Y?=
 =?us-ascii?Q?dmQYywB2Xhv+P0EzXQIGIcR0vclhAB+2pje58H1jSuSSLKdHfwQlvlqGXAR5?=
 =?us-ascii?Q?63yMU9c+DflwmauTZofh3ElKwA18YA4ikMqIlc/3nt1a+uVXJmGGOgHiYGSt?=
 =?us-ascii?Q?2R1ZJiDaBJIDoz2uvWKepCPi0fsP9sfDwaHggiB3P41pXMiSnwwt9RUNCCZK?=
 =?us-ascii?Q?y8nrKBOf0V97+vujieP/tg3v9vEnlY6mSqF8Yqxa0cBcfjggYaasTFZdhofS?=
 =?us-ascii?Q?tVWHWyyR76fiUeNt33YU0sa2c1k/gaB+Xoio8ZpSwY6Fl4gso0XTiJZEz7p/?=
 =?us-ascii?Q?v8WcqMJGl7iWQvH4sX673if5HdKql1DrmVCN5jBT8tJ0QG7aWs/kyUIjEgT3?=
 =?us-ascii?Q?5dQADpQcnVqewWroWxr38SRzSjer7Dlhwl5qFuILSNiaxqy6OV33MG+nBlxP?=
 =?us-ascii?Q?mSOfjH5Bte0EFTUlDwUjCXjxkv3JaZDfv53+svyo98dDKX7AMTh9MmVUTcOw?=
 =?us-ascii?Q?zUHrhEtnbuZrdSec992wc04N3SsGGFfnhEGIjwfKxcMK8+eMrO0FtMwLNxRS?=
 =?us-ascii?Q?cgDojW+dkIKIScNWzNCAMOv45GfMl7qlDTIeVZjkfR/nxpOUIKzGXCFyG5Gf?=
 =?us-ascii?Q?/IB5uHnYgFd9vuJ2qL/i0XW6?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 98131b7d-fe52-4847-6864-08d8e7e1866f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 18:38:28.3420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BI3o1k1XDzuocfnzyXAPtcLpQZyr+6dPk5vvCHaKzHgm2cb41RNVozyqnxmzcihE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5724
Received-SPF: pass client-ip=40.107.75.120; envelope-from=alxndr@bu.edu;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, bash and C crash reproducers are be built manually. This is a
problem, as we want to integrate reproducers into the tree, for
regression testing. This patch adds a script that converts a sequence of
QTest commands into a pasteable Bash reproducer, or a libqtest-based C
program. This will try to wrap pasteable reproducers to 72 chars, but
the generated C code will not have nice formatting. Therefore, the C
output of this script should be piped through an auto-formatter, such as
clang-format

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 scripts/oss-fuzz/output_reproducer.py | 160 ++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100755 scripts/oss-fuzz/output_reproducer.py

diff --git a/scripts/oss-fuzz/output_reproducer.py b/scripts/oss-fuzz/output_reproducer.py
new file mode 100755
index 0000000000..3608b0600e
--- /dev/null
+++ b/scripts/oss-fuzz/output_reproducer.py
@@ -0,0 +1,160 @@
+#!/usr/bin/env python3
+# -*- coding: utf-8 -*-
+
+"""
+Convert plain qtest traces to C or Bash reproducers
+
+Use this to help build bug-reports or create in-tree reproducers for bugs.
+Note: This will not format C code for you. Pipe the output through
+clang-format -style="{BasedOnStyle: llvm, IndentWidth: 4, ColumnLimit: 90}"
+or similar
+"""
+
+import sys
+import os
+import argparse
+import textwrap
+from datetime import date
+
+__author__     = "Alexander Bulekov <alxndr@bu.edu>"
+__copyright__  = "Copyright (C) 2021, Red Hat, Inc."
+__license__    = "GPL version 2 or (at your option) any later version"
+
+__maintainer__ = "Alexander Bulekov"
+__email__      = "alxndr@bu.edu"
+
+
+def c_header(owner):
+    return """/*
+ * Autogenerated Fuzzer Test Case
+ *
+ * Copyright (c) {date} {owner}
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqos/libqtest.h"
+
+    """.format(date=date.today().year, owner=owner)
+
+def c_comment(s):
+    """ Return a multi-line C comment. Assume the text is already wrapped """
+    return "/*\n * " + "\n * ".join(s.splitlines()) + "\n*/"
+
+def print_c_function(s):
+    print("/* ")
+    for l in s.splitlines():
+        print(" * {}".format(l))
+
+def bash_reproducer(path, args, trace):
+    result = '\\\n'.join(textwrap.wrap("cat << EOF | {} {}".format(path, args),
+                                       72, break_on_hyphens=False,
+                                       drop_whitespace=False))
+    for l in trace.splitlines():
+        result += "\n" + '\\\n'.join(textwrap.wrap(l,72,drop_whitespace=False))
+    result += "\nEOF"
+    return result
+
+def c_reproducer(name, args, trace):
+    result = []
+    result.append("""static void {}(void)\n{{""".format(name))
+
+    # libqtest will add its own qtest args, so get rid of them
+    args = args.replace("-accel qtest","")
+    args = args.replace(",accel=qtest","")
+    args = args.replace("-machine accel=qtest","")
+    args = args.replace("-qtest stdio","")
+    result.append("""QTestState *s = qtest_init("{}");""".format(args))
+    for l in trace.splitlines():
+        param = l.split()
+        cmd = param[0]
+        if cmd == "write":
+            buf = param[3][2:] #Get the 0x... buffer and trim the "0x"
+            assert len(buf)%2 == 0
+            bufbytes = [buf[i:i+2] for i in range(0, len(buf), 2)]
+            bufstring = '\\x'+'\\x'.join(bufbytes)
+            addr = param[1]
+            size = param[2]
+            result.append("""qtest_bufwrite(s, {}, "{}", {});""".format(
+                          addr, bufstring, size))
+        elif cmd.startswith("in") or cmd.startswith("read"):
+            result.append("qtest_{}(s, {});".format(
+                          cmd, param[1]))
+        elif cmd.startswith("out") or cmd.startswith("write"):
+            result.append("qtest_{}(s, {}, {});".format(
+                          cmd, param[1], param[2]))
+        elif cmd == "clock_step":
+            if len(param) ==1:
+                result.append("qtest_clock_step_next(s);")
+            else:
+                result.append("qtest_clock_step(s, {});".format(param[1]))
+    result.append("qtest_quit(s);\n}")
+    return "\n".join(result)
+
+def c_main(name, arch):
+    return """int main(int argc, char **argv)
+{{
+    const char *arch = qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+   if (strcmp(arch, "{arch}") == 0) {{
+        qtest_add_func("fuzz/{name}",{name});
+   }}
+
+   return g_test_run();
+}}""".format(name=name, arch=arch)
+
+def main():
+    parser = argparse.ArgumentParser()
+    group = parser.add_mutually_exclusive_group()
+    group.add_argument("-bash", help="Only output a copy-pastable bash command",
+                        action="store_true")
+    group.add_argument("-c", help="Only output a c function",
+                        action="store_true")
+    parser.add_argument('-owner', help="If generating complete C source code, \
+                        this specifies the Copyright owner",
+                        nargs='?', default="<name of author>")
+    parser.add_argument("-no_comment", help="Don't include a bash reproducer \
+                        as a comment in the C reproducers",
+                        action="store_true")
+    parser.add_argument('-name', help="The name of the c function",
+                        nargs='?', default="test_fuzz")
+    parser.add_argument('input_trace', help="input QTest command sequence \
+                        (stdin by default)",
+                        nargs='?', type=argparse.FileType('r'),
+                        default=sys.stdin)
+    args = parser.parse_args()
+
+    qemu_path = os.getenv("QEMU_PATH")
+    qemu_args = os.getenv("QEMU_ARGS")
+    if not qemu_args or not qemu_path:
+        print("Please set QEMU_PATH and QEMU_ARGS environment variables")
+        sys.exit(1)
+
+    bash_args = qemu_args
+    if " -qtest stdio" not in  qemu_args:
+        bash_args += " -qtest stdio"
+
+    arch = qemu_path.split("-")[-1]
+    trace = args.input_trace.read().strip()
+
+    if args.bash :
+        print(bash_reproducer(qemu_path, bash_args, trace))
+    else:
+        output = ""
+        if not args.c:
+            output += c_header(args.owner) + "\n"
+        if not args.no_comment:
+            output += c_comment(bash_reproducer(qemu_path, bash_args, trace))
+        output += c_reproducer(args.name, qemu_args, trace)
+        if not args.c:
+            output += c_main(args.name, arch)
+        print(output)
+
+
+if __name__ == '__main__':
+    main()
-- 
2.27.0


