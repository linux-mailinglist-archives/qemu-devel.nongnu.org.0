Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6126CD654
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 11:25:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phS2L-0005iM-3B; Wed, 29 Mar 2023 05:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phS2I-0005i6-PF
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 05:24:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phS2G-00011w-Eu
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 05:24:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id u1so8454195wmn.5
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680081842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QDcSvn4fFKTxSlm6tOsk3aChvAta5OqpBrJjDDJ6cpw=;
 b=srn3PH+hOFn62zH8/AAfWSW9DE2k8MKCl48955LSeU8YfkAGnI1cdQWhnBthCeieOn
 2tD2IlhyccPPkc+b0p3g4a1Wpmvh57h8nL5WyYp+KSgVhOUyjON9P9y4KodUicpVX22t
 RVUpZAEy7RhAhPqjHLA3gPFlYVg9I8Fp9rqG2QJ4wcpLMESSPFKWw/4u80qst4lMcn2w
 YSBBQ+KJCOZtDYFa7cJPhk9QAeFQOp0e1padbv4Nl+LEm7s7SF+H6IETYVsaqIKWa8n0
 wcDIgUorzQZ6q3iFRaHllTl3y9iN9Oq0JUG2FZ+QzcVdKjGRbBQ4vm+BayecCbTSgxUl
 KjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680081842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QDcSvn4fFKTxSlm6tOsk3aChvAta5OqpBrJjDDJ6cpw=;
 b=BLU6gKgUInq1lTS5k8Tscmyb1qm5LzEX1QihVudqhaS/h/D5SIuxwZpWsF+qNbjjCe
 nQFzUS1V0hgjj67WUJGEXubJq8nUcrSZYQv3JRjXuAqEnNbCuGNQu6xjMKmSUBVq6bQq
 uDxtsrGMJP3phfygHIK0hohADb1eC2gGG/M5K5Ue+4WLGGDu3by/9qZbf7A75mYwqyua
 cJQJnPc7vmoWNofERr1i8Mt3ruA/X++elw81Dz2BQf9mK+oXD9dJE2eQCSUIxYTFaZgq
 I3kGF2MQ2yv82/TkaOjEpmoNMs/fQMbx81N+ugSg6bqFFvRb6PsdvgzAHJPTgS1yFY61
 KE1A==
X-Gm-Message-State: AO0yUKVeBrlC0V/GvE6YD/oUATeJej09vGWESHTCrn3RyrealvYDea2o
 kGQQpmQ1Ckn1ah8Itcd1v94+mQ==
X-Google-Smtp-Source: AK7set9aWbTLT7BW1iYKHfO1tEFco0QfpWIM81ezRWWouZKQ5JdSQTWNefIF5b6W6ie0ZpewiabbXQ==
X-Received: by 2002:a7b:c3c7:0:b0:3ed:ff92:dd2a with SMTP id
 t7-20020a7bc3c7000000b003edff92dd2amr14688541wmj.12.1680081842493; 
 Wed, 29 Mar 2023 02:24:02 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 bg2-20020a05600c3c8200b003eddf20ed5bsm1680605wmb.18.2023.03.29.02.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 02:24:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D31271FFB7;
 Wed, 29 Mar 2023 10:24:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: [RFC PATCH] scripts/coverage: initial coverage comparison script
Date: Wed, 29 Mar 2023 10:23:49 +0100
Message-Id: <20230329092349.3722039-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a very rough and ready first pass at comparing gcovr's json
output between two different runs. At the moment it will give you a
file level diff between two runs but hopefully it wont be too hard to
extend to give better insight.

After generating the coverage results you run with something like:

  ./scripts/coverage/compare_gcov_json.py \
    -a ./builds/gcov.config1/coverage.json \
    -b ./builds/gcov.config2/coverage.json

My hope is we can use this to remove some redundancy from testing as
well as evaluate if new tests are actually providing additional
coverage or just burning our precious CI time.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Kautuk Consul <kconsul@linux.vnet.ibm.com>
---
 scripts/coverage/compare_gcov_json.py | 118 ++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100755 scripts/coverage/compare_gcov_json.py

diff --git a/scripts/coverage/compare_gcov_json.py b/scripts/coverage/compare_gcov_json.py
new file mode 100755
index 0000000000..451e2f8c00
--- /dev/null
+++ b/scripts/coverage/compare_gcov_json.py
@@ -0,0 +1,118 @@
+#!/usr/bin/env python3
+#
+# Compare output of two gcovr JSON reports and report differences. To
+# generate the required output first:
+#   - create two build dirs with --enable-gcov
+#   - run set of tests in each
+#   - run make coverage-html in each
+#   - run gcovr --json --exclude-unreachable-branches --print-summary -o coverage.json --root ../../ . *.p
+#
+# Author: Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+
+import argparse
+import json
+import sys
+from pathlib import Path
+
+def create_parser():
+    parser = argparse.ArgumentParser(
+        prog='compare_gcov_json',
+        description='analyse the differences in coverage between two runs')
+
+    parser.add_argument('-a', type=Path, default=None,
+                        help=('First file to check'))
+
+    parser.add_argument('-b', type=Path, default=None,
+                        help=('Second file to check'))
+
+    parser.add_argument('--verbose', action='store_true', default=False,
+                        help=('A minimal verbosity level that prints the '
+                              'overall result of the check/wait'))
+    return parser
+
+
+# See https://gcovr.com/en/stable/output/json.html#json-format-reference
+def load_json(json_file_path: Path, verbose = False) -> dict[str, set[int]]:
+
+    with open(json_file_path) as f:
+        data = json.load(f)
+
+    root_dir = json_file_path.absolute().parent
+    covered_lines = dict()
+
+    for filecov in data["files"]:
+        file_path = Path(filecov["file"])
+
+        # account for generated files - map into src tree
+        resolved_path = Path(file_path).absolute()
+        if resolved_path.is_relative_to(root_dir):
+            file_path = resolved_path.relative_to(root_dir)
+            # print(f"remapped {resolved_path} to {file_path}")
+
+        lines = filecov["lines"]
+
+        executed_lines = set(
+            linecov["line_number"]
+            for linecov in filecov["lines"]
+            if linecov["count"] != 0 and not linecov["gcovr/noncode"]
+        )
+
+        # if this file has any coverage add it to the system
+        if len(executed_lines) > 0:
+            if verbose:
+                print(f"file {file_path} {len(executed_lines)}/{len(lines)}")
+            covered_lines[str(file_path)] = executed_lines
+
+    return covered_lines
+
+def find_missing_files(first, second):
+    """
+    Return a list of files not covered in the second set
+    """
+    missing_files = []
+    for f in sorted(first):
+        file_a = first[f]
+        try:
+            file_b = second[f]
+        except KeyError:
+            missing_files.append(f)
+
+    return missing_files
+
+def main():
+    """
+    Script entry point
+    """
+    parser = create_parser()
+    args = parser.parse_args()
+
+    if not args.a or not args.b:
+        print("We need two files to compare")
+        sys.exit(1)
+
+    first_coverage = load_json(args.a, args.verbose)
+    second_coverage = load_json(args.b, args.verbose)
+
+    first_missing = find_missing_files(first_coverage,
+                                       second_coverage)
+
+    second_missing = find_missing_files(second_coverage,
+                                        first_coverage)
+
+    a_name = args.a.parent.name
+    b_name = args.b.parent.name
+
+    print(f"{b_name} missing coverage in {len(first_missing)} files")
+    for f in first_missing:
+        print(f"  {f}")
+
+    print(f"{a_name} missing coverage in {len(second_missing)} files")
+    for f in second_missing:
+        print(f"  {f}")
+
+
+if __name__ == '__main__':
+    main()
-- 
2.39.2


