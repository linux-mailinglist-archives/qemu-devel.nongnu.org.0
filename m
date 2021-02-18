Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9D231F194
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 22:15:44 +0100 (CET)
Received: from localhost ([::1]:57834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCqeF-00050a-5r
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 16:15:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCqbq-00049C-PU
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:13:14 -0500
Received: from mail-mw2nam10on2129.outbound.protection.outlook.com
 ([40.107.94.129]:11137 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCqbn-0004Bf-Qt
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:13:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOlRwUvvVOft5svXetVLCOkxxfgjc84BBmRA5C8H4Nz3R7k8jk8eg0uM36XGvgH5sNHlz1wuGnfazIvN8YxYY7vPUvvIE0c1IINmr746Csj/VGfUJHdi7BC4q6fyzf1wtB8bDqEg7C+cXNq76f/3kTbtRZsvSsNZQlYVEFzQS5yCXbFAhSxXRCvKJtxoY0eo0gq8JkB9HLXjlyKBLRrz1i9v0eH9sYUXalPlHIPMtO7oXHjBHH7tEvk+J2XcmWslCDC6ifhtz58yuVxy6w+LuMWvWNRYOpIFIVKbep2g5KU0UY1iDO6kLlWtm6Z5JyvMFtW0dHRULiX/EnXnqRmraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4CviGRNADMEy0H7II6FfDzVrMMDGvPJ/gNliTBhIAE=;
 b=OPedb8uGRr5A8v1Sm/k3SxCaKUWzJDmbtD1Y+0bPmwzzI9Iw0kK3sBxi3Z3i0LC4l0QUfGXNASHgiZMSZGGNV+Zs5xjfYmxSLUjTBwuDldTuMWIDIZNLn3b+zRB8/QISoH+uavHQfwYfBo2L4LWEcun9ATPkzuv7FscaW7NIqKu6yyLRXlM1t6EcZNwl6xRLjSjFQ24r3UIIoVGr+IiUas9xwH945PZn6byOYoI/DrgsPnzrH1HPBFLavOqkXM8VPE+JFd9Y2FOnXjr73PHD0EI37rUJxkinMmJ9g/W6GIq+sB+tESRYSk7Scn7R5oZsQQfDMqkXxOumqFxniQvo/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4CviGRNADMEy0H7II6FfDzVrMMDGvPJ/gNliTBhIAE=;
 b=q1wqSa6mtTktYjJP/eW63PWv7BofWikJ0gHmrM13x7LTulEcsZKBg/2QOBhXqvUo3SnijqBNtB9Ai13aa9ZCG3VsCiulYHaCOT8VwmS+OZu/tmxed2Sz7rL6eSM+uNUtzWghcnrd8abSuk4LmgfSuvLI1D1J/xjgsGBT4Mw5MPE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3936.namprd03.prod.outlook.com (2603:10b6:805:72::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 21:12:37 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3846.041; Thu, 18 Feb 2021
 21:12:37 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/5] fuzz: add a script to build reproducers
Date: Thu, 18 Feb 2021 16:12:19 -0500
Message-Id: <20210218211224.2513413-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210218211224.2513413-1-alxndr@bu.edu>
References: <20210218211224.2513413-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:207:3d::43) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR02CA0066.namprd02.prod.outlook.com (2603:10b6:207:3d::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.28 via Frontend Transport; Thu, 18 Feb 2021 21:12:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89e5a865-1356-4744-4908-08d8d451eb1c
X-MS-TrafficTypeDiagnostic: SN6PR03MB3936:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB39361FF38098A6BFB5D2B63FBA859@SN6PR03MB3936.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 24Fp/iltUckst2SIdKD9qMzQU1/ABo6uydOuygATjNLcDryQaEsOes23SHNDBtKQEG/EOEVUOZ0w5ZO7tByJg3JlEr+xG7iyUdz0XccoluqWlvw6Ngy+MQKR6l/2+Y3pYIF2F5/EqgFyVs7/OBsxfU5MKDN55cv6p5E4gTCEIgHo0++Sl5af0trQ49g3IctpAfpIffBX5Z0J5tRPa5IffRS4aDCQVuEZ1xb7dg7jKm7bnzINYA1jhciIyffgtivyG0OAd6AF9KKGV4qljK3N4QQ/n0Exr0/AS4mH+DkzR8rjumaF+/m3Uz6dhpO5EjUahaI6RttBtAaJEDkzTbOID5zWHb90qy44pfhz08YPKSGWFy4KyXQ667VteOWMl62uVj7922Qcv+M0aqMkIPmaVsFM3Ne9I1FhZJawJRjzGybMIK8jGr9N75pm42U99TdtwImTGH81xfOmnwhgOBSK57o0k+G5BhmitXnpQVoDoSZSLMa4cuP8y6Kdug+ZfeIjyHfuG8IGeRhXqTkX68pJ4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(52116002)(6916009)(86362001)(6506007)(2906002)(478600001)(83380400001)(8676002)(75432002)(8936002)(26005)(4326008)(6486002)(2616005)(956004)(1076003)(66946007)(54906003)(66476007)(6666004)(16526019)(36756003)(316002)(186003)(66556008)(786003)(6512007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?H8jAMU4HLqTkHsS3p4Nr+aKl6elA/H9YTaM6/MgN4KFmthiZ667ZAFCAu4ZJ?=
 =?us-ascii?Q?xBLRZV/HLUTk4IwFvSALb1jsagSzmXUIy40iFH+KGd+MJnWfVU/PDGhlO/+a?=
 =?us-ascii?Q?gytWmGq5QeGpadLs5EZv1KckufXfEQ9VIz/4VSFlDMoYQf8VgzPjEeEtPki3?=
 =?us-ascii?Q?+ZBajfSNCcl4y5To6wXY5JgbeN0XRr9gGaKRkGXUo+O4kNXP0Lm56WEKMaRg?=
 =?us-ascii?Q?yaB/nwPNtrd6OYhVXMMKO/J2KEHYqEvi6Yg9hivYJ6+pdPHi45JYvR/QkPlp?=
 =?us-ascii?Q?zkhf1rvA9V5WEzlD4Sn4+5UNnwwNYBMSUj02v11lV5X4xx8xZwYMsRdwVyFY?=
 =?us-ascii?Q?0C4ZXDQRTBtgVmTGcZ9vRI+eZML5PpGP0KXNkoZjdrNBbxTJCFvCsqXzvULm?=
 =?us-ascii?Q?3FWdvjr3pojNYnqxXVFRHP2sApEhGgikeh9xSVOepNveeY/zBV7SIzAVNa2H?=
 =?us-ascii?Q?joXN9u2dvhip51p9OSBdpZm/G/3tfyodUPdDUJ1iHG7PNz/Fo5sSh7rw+Zzg?=
 =?us-ascii?Q?gALGHGAqXdwLEq8509u5u44FAL5Qxq1vNbUfvdyTrMd3JlCUewsP/Ml3RE6N?=
 =?us-ascii?Q?BgBDvijdkuoM7FTfasLkGIH7uMpCkMC7J0kJ6WaHwh2PdGN6gHdNXSHvLGZ1?=
 =?us-ascii?Q?g0HAIc4JC2brqdz2DNNt6W2k8SRNd0meGRMaPlHVDhZk/fygiFHLaiBpnS+7?=
 =?us-ascii?Q?CoGwCMTQP47er58Z5awoyPJ8tOF8pkWOaOJBb2UmY/XfJYqj+unIknKuabQT?=
 =?us-ascii?Q?oZZi+VLr9aNCi4G4AHoRPmpqnXRfFhVXJBCk2HS5gYRb87V4A9dn6q9Fs4oQ?=
 =?us-ascii?Q?5QjoWVd8jPPnR/BmUNGBiMFsZ/LZU/t6cg0BsEpDAzDvCPuAryUpy9DUrzHx?=
 =?us-ascii?Q?iekZ+IqgGOit77Ckwu85OVv0rso7qgvgD3pmcCcdwsB+YvEJIkbFk5Ro4A+n?=
 =?us-ascii?Q?lwDzfC+4sx/gTLB4H+UOtvvXeyasSO7KK3cI0+oKDyLS5qMD145MJYvj3utK?=
 =?us-ascii?Q?XSALrri5jQuKJJflLs7KfCUoHtXS/Wy/T/iDKM9mM17iwRzxhLcoE7bHPvEn?=
 =?us-ascii?Q?Zblrw6PoqqqcWiKopRFYN5p8iS0sQXIFwxM+ZGtMPkRBJxVnYQRlMdp9E9Ej?=
 =?us-ascii?Q?lmTLpaxApf7OhYIjQQCEKPZHHJP7luNIZn/YUVFbIXhzf2EUmHv8f/JXfqT9?=
 =?us-ascii?Q?fJ3l1sq9cs4PbsTQpwOc7nA2xbCSbgENgzJOL7jvMCa4Peb6owOnPFAqCXYR?=
 =?us-ascii?Q?xF+UeVXRVk++qjQI34HgAScTPbC3LdA2NkZVphfUDOJLL2fqMxBB+0u3ebws?=
 =?us-ascii?Q?Wl6xMVuUIi18bsEmkDjNYsbM?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e5a865-1356-4744-4908-08d8d451eb1c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 21:12:37.7302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvmuGe5Kn7RCky3CuOduEJTiN+a3KVivmkEgaADkzBp+MQYUnWVVTYBV3KxUXH0G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3936
Received-SPF: pass client-ip=40.107.94.129; envelope-from=alxndr@bu.edu;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
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
---
 scripts/oss-fuzz/output_reproducer.py | 161 ++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)
 create mode 100755 scripts/oss-fuzz/output_reproducer.py

diff --git a/scripts/oss-fuzz/output_reproducer.py b/scripts/oss-fuzz/output_reproducer.py
new file mode 100755
index 0000000000..f6f5f1fb55
--- /dev/null
+++ b/scripts/oss-fuzz/output_reproducer.py
@@ -0,0 +1,161 @@
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
+        print(c_reproducer(args.name, qemu_args, trace))
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
2.28.0


