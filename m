Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A8633A29F
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 05:26:04 +0100 (CET)
Received: from localhost ([::1]:34858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLIKJ-0004ic-Fr
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 23:26:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLIIb-0003n5-B7
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 23:24:17 -0500
Received: from mail-dm6nam10on2128.outbound.protection.outlook.com
 ([40.107.93.128]:27905 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLIIZ-0007Pg-Hc
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 23:24:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7kngSbZIpZQh5cNFu9ZSZ+mHoSdeDRR7UKo8Hh/6RmQZ321SDemoZk7VqwNMTDnuIb8FVL5i0yvZ0EVPUaExdWCQiWEr6L+PvEhqBBILhvPE1v3rXI/oNlnREay54rCc9RloEl24caYPOOZT1FcvAv043yjIRO0Gi3egY9qcGxbjmHJ38InunB1+W5Oc+be4wDb1pdYeEP0WAKdpW6vJKZY7jxGvNyYbx/3dRP2dqaGY/tm8xgHBdSD1YNgSV0Dpoy23Y3snNXAmje1VKs99cqSxrUiXsGAD09pH6qCfb9kw87qF822TkLoLZ0kGcvNb2wtb1+9q0pm+DTzKH/zOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqv793K1IY3eTKoNiKLgSCFnIZDybz3bHwH1yegpDBo=;
 b=cddq8za+WFPa7D0+JxKEsYN2tb+jnoe5ObxzsG55PoQ2b51nLUSmfmj8H/wZxAsuveAHNy055w5WFrt2ZjCTcCjjPOKjFju0NRwq1IIS8UFwxxPV+ZwQKND92o9ZbEyTm/KFClbyt4MqlYnz52dU+usJ/0wjfng9KC3P0Z5STRUlFnpA7Cj0BAd5sPTOqa0J43bitldF90r3oYT8/NC8gD0UA/bXqdeUCpJrw14s3MnaLFw2R92kV44FwCT+xaoVeRvyRwaJiPcyMtONPH9igaqGCTkWQLSu+8GO7voADfNUzy7AcGa/GGq+ZIIw0W0cbrxlq/LaCO7deh2teQaF3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqv793K1IY3eTKoNiKLgSCFnIZDybz3bHwH1yegpDBo=;
 b=51tCQ/WbUGp+hSG5xpozcLsx1i+a1DE0iYM5vuzzq11kSBYp07cYmT5wFBnzsmtFPaIbp/dv+UTZ5MsdViWucadH7adWl2b8MT5cD4Iu74Zemlp5r3R1Y90KRK3JsVXL6z6flFX2CY1iy9HOQCZ0a4Abqbi661tQRgY07Bp/HrQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3854.namprd03.prod.outlook.com (2603:10b6:805:6e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 04:24:10 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 04:24:10 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] fuzz: add a script to build reproducers
Date: Sat, 13 Mar 2021 23:23:56 -0500
Message-Id: <20210314042358.682136-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210314042358.682136-1-alxndr@bu.edu>
References: <20210314042358.682136-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR22CA0019.namprd22.prod.outlook.com
 (2603:10b6:208:238::24) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR22CA0019.namprd22.prod.outlook.com (2603:10b6:208:238::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Sun, 14 Mar 2021 04:24:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f2f6be4-dca7-4688-a545-08d8e6a103c1
X-MS-TrafficTypeDiagnostic: SN6PR03MB3854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3854F654B59CAF6C09E862C1BA6D9@SN6PR03MB3854.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g/q1E5bhwgXUzP+uaOJ/Rp4Bfr5zTcVCFyk1YZznPP6XBe28nqa7knzGYHRv4UY9HhNI5nZ3sfs6DLP9XPfxM6d8b71CPNTz6JVRdAo0cazB9Pqs/URB/sACz1yg2+6+/h3mN25EoiOQJORo/45SWznpJ9YVXBtIHVowuNnEFW517MnhkHFqSbqmiv9oVT/N6K9huGxy+AxZObxQ4WIBuY5F+5EnfAvTZh9T2uk/MpiyuyqAXRACSdAqsEnOCivBHJZO3vrVmbL1R/NnOotasiVzrDzywTfO256qot4yUXCoyIrF/qJBqgdV69BfQJpLXm3D158PvW3vWt6nTJkaUxXOGgCWyjB00Gfwr3xOdDYNKpqdoykr9UFqVlUnOuaUJDjNIUJmG1i1Rz6JcQ9q3qPfwF9okq1yE/mQ5VdDIT4azjiJo6bLDDYl3RNnmfHIh8vc1JSX8BLMbPbD5DwihPBl4hbnZG/TrkNshDFAmwIW5hUHgoR7o0wWTZg+fWd0/Jlv7YD3IAqJHDkvNyk8b/V2ojn9rm8cPYknDiy/4O5i3zRy4UTs3PyALCjIEZn7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(66946007)(52116002)(66556008)(66476007)(54906003)(2906002)(186003)(16526019)(86362001)(2616005)(956004)(6506007)(4326008)(8936002)(8676002)(478600001)(6916009)(75432002)(316002)(1076003)(786003)(26005)(5660300002)(6666004)(6486002)(83380400001)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SBJF7I4eqC6WCnLZjMiKoQuDMm8PHB46ipMHlIg8ERh5QSJyD9SgZMZD63BL?=
 =?us-ascii?Q?SUn1lC2kzFUFT94fCDLa9hctwqbvZQf+NNaz6AaRxWz01qCXoYOG+Bmzg4je?=
 =?us-ascii?Q?tWHfEfjrUxeY2p5VCI1Plbz80jnGKEJSGtGFE/XTRkH+y+64Upfs75szjqfN?=
 =?us-ascii?Q?5ptlZlK5ajqkH3rwDi56FDrBoWZAAbjhYKYfFnChD0f1M48/shDYYOOcS6X9?=
 =?us-ascii?Q?iqEvSNodbSCXohUfE+AVcG7dU3ku22cDux3naMONU6q1aCT7bMQyL/SH6RpA?=
 =?us-ascii?Q?Kq5ZhaK3lkZLHKqKPWYaCfMED3hlRFl0Q/kWpsWq7irxutn4T6pTcBT/pIfp?=
 =?us-ascii?Q?bVAzFI0qeTr6SCajnM11omad6rBPKcZ2OSDSAc3YG+Lw3aRHCOMFpsisNY3H?=
 =?us-ascii?Q?vCa8jM15wH9qDYzObmtmAM7/OUEIxgevmvOMMcffvrsW0PbCpaf4pYZf6K21?=
 =?us-ascii?Q?TIupCmvEtTZnBj6JYBPq/famOF6vik51Utl4JKEFdVLArYTltjK/g/T57MgM?=
 =?us-ascii?Q?ut2nCibfytrXxuOXxc89npK4/aQH+IzMn5cojYoCsnd5fnvq3sfFCJoTP2qq?=
 =?us-ascii?Q?xefmtAeb2La7l5NtxoL2fOxyHV01pKsH+CfHSrrkjUizjhvyu1uqdYPbPjiP?=
 =?us-ascii?Q?aVzH135Kb96WTYDh40WgVSqJs9+mr78DkyQhXgApNrzgHffb6eFK2Gn8GBW9?=
 =?us-ascii?Q?+ZpKkOwLu49PMC2cRJsijjYdZ448FMuqBT+Gb3ucLjQ2B/dWENfBeGjkyWBF?=
 =?us-ascii?Q?rIwSYVBJLzjDJqYIOGUjZX4LkgT19HumEoEhrC/Q9UKcgYUwqecmHrZ1ae3I?=
 =?us-ascii?Q?KX8NBJ0OgqoOl6YvdR788zgOmlt6Fbbp8ms51QzdaF7ok9wYpb6EfxwKzCOH?=
 =?us-ascii?Q?VuWXP3wG8y9pS7jv51lNrPTcuoej+B+P9kdAPa2EA1ZYLzePUiLZ0iXMveCx?=
 =?us-ascii?Q?uprX6QghRmQbviSf+82KqOWcA/tHfHxiRUcw/7xnExO2zrXhornJuQw52D7p?=
 =?us-ascii?Q?Bu9VSEyggS4IPGZFyfKHcQOGqLg2BfNSXjm8SqbbKtwLYhwJNC6xvnLAnUk7?=
 =?us-ascii?Q?bGrsJ6bzyoNa1Cv3gLhOLWZAWfozu0cVYHE1kkUv96pLlyWSc54y4Wpes0jp?=
 =?us-ascii?Q?E+mlcjCaG1NlAVqaYPoumRWrD7JDAujmqb28ERtnpFg+ttELYZa6jjQXW8mx?=
 =?us-ascii?Q?d97X9W2S7Phi2/+gF5h9T2qss78NK8lGOVffqRCkcxWhoGZZML2ECZGj84mR?=
 =?us-ascii?Q?ZOJikZPlEVLSdCBil8QpFi9ABVmFsXiNRPVZnDrl5KVTPILtgl1wFZHlC7x1?=
 =?us-ascii?Q?qxJou4yeNKWsXlOCQQa+oMOT?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2f6be4-dca7-4688-a545-08d8e6a103c1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2021 04:24:10.2249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ober8LoU7aezQtIZLXo40mWVzwMoWvUgnP3Ut8C5Xl23tQi4nZHdG76BPln/C4oh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3854
Received-SPF: pass client-ip=40.107.93.128; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Cc: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 f4bug@amsat.org, darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
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
2.28.0


