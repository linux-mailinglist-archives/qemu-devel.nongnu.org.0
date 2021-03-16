Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E3033E05F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:19:49 +0100 (CET)
Received: from localhost ([::1]:49186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMH6S-0002Pc-JM
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2e-0005Uq-Sl
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2X-0003VD-S5
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bLb6EXcUZswqceAWj3ljcHA+pAGqWxfzkflfWVrZceI=;
 b=gP9NddYabwLJzddaI/swEfRB40BycNf/CQ3z1wy3PJ45fv0Mtyk2WslcPHHkz7o2Z/hjS6
 eVvNeIwEdU9NEi+3l0geQl7V/w4bVvGNgtxKp1XN8aKjpiP5KrWNAF3WWjAMio87WJiWUL
 JTX14/i+Zk4VeYgagjLvQyPZMNgYJe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-UxWnmxvdNduKnMUiRV2bWg-1; Tue, 16 Mar 2021 17:15:41 -0400
X-MC-Unique: UxWnmxvdNduKnMUiRV2bWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 744C0A40C1;
 Tue, 16 Mar 2021 21:15:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2409C610AF;
 Tue, 16 Mar 2021 21:15:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/16] fuzz: add a script to build reproducers
Date: Tue, 16 Mar 2021 17:15:21 -0400
Message-Id: <20210316211531.1649909-7-pbonzini@redhat.com>
In-Reply-To: <20210316211531.1649909-1-pbonzini@redhat.com>
References: <20210316211531.1649909-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.26.2



