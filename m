Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C51F6D6683
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:00:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji8L-0004Gg-8i; Tue, 04 Apr 2023 10:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8E-0004DJ-OT
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:35 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji87-0005AH-WF
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:30 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so22012778wmq.4
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0wPinvsk7vEdGY5KkltJh2yfDiVq++tbF2ZWCeEQzY0=;
 b=AQiIE/HqEu999x1122TC93rZcWcSNo9AhLhZXJIdi771f1vO+xVZQ9NgKcIBJKU3JE
 uXtiD3mCTdx8LjoYuyBOLo8sQUtVJTsfwjv87+JFXrZ4vb5MxYGEvEc4F+O9DEYWZ8ym
 AIKdxykb/lGe3MI7IubuN+u93JibFbmmsfFc2rYE9VBDlUDRHbFxhK/yrOKejv6yPUrL
 PUB3imVeQOR2DIN64YTCCOl8NSAjlGaLjIINDADAthMBpUlFi3GigBzbvk/TgVXRHalx
 DQLCwmxN7bPh2ld2gqSzZO8aOtYy/SVMoNWQQB63tRmNZrZjdwEoW3XGeI1jybfDsQhr
 VqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0wPinvsk7vEdGY5KkltJh2yfDiVq++tbF2ZWCeEQzY0=;
 b=edoXmuOsu8SsfRfe/mtYyUuAomCqoQFulT8PSZPcw0KMq6VTHBjhgJXnufN97iHEqn
 Se0ipwsFw4g1+NqcKkDrniJqCWdtkfqRnaiJCTKK9n6HJtHtd4DoODq5q6wncByJR29f
 +XBpZDzHzjDAeQSNAZq7SxEBwTP6EpaUHUzVa6QotT71knwviZtKbFsH3A7vdlxrc7LN
 C9V4fnDNMHPpFlLAax2NKjGjEANhN9NMh2omz7CnssfPajvg/t13muIixiNzuUMPt+LT
 019W1abvWXL55ZXNXXWMh+NqNBrWRyyJdbcUQhraNCh6oAQJ0q5+KdVR3jZEcUWpyCu1
 UGdg==
X-Gm-Message-State: AAQBX9cZ8FuAVqpygnGuGrkLMO6tgx0fjsjXKDcPL1sceFx4EraWsrH/
 Q5sQFcBSC1pwIIRHpgqshzFg8p1lHZNB8+YVnT8=
X-Google-Smtp-Source: AKy350YgzfpsCrFifwMd4CE66sB18L09tExSzUUTR1GCmJnI5F9+5tsrME5rQCF7wSZ1LZpXuN4O6A==
X-Received: by 2002:a05:600c:b51:b0:3ed:2a91:3bc9 with SMTP id
 k17-20020a05600c0b5100b003ed2a913bc9mr2564726wmr.15.1680620365845; 
 Tue, 04 Apr 2023 07:59:25 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 24-20020a05600c231800b003ed2276cd0dsm15456264wmo.38.2023.04.04.07.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:59:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C33D1FFB8;
 Tue,  4 Apr 2023 15:59:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 01/10] scripts/coverage: initial coverage comparison script
Date: Tue,  4 Apr 2023 15:59:16 +0100
Message-Id: <20230404145925.2638152-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404145925.2638152-1-alex.bennee@linaro.org>
References: <20230404145925.2638152-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230403134920.2132362-2-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index ef45b5e71e..9e1a60ea24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3908,3 +3908,8 @@ Performance Tools and Tests
 M: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
 S: Maintained
 F: scripts/performance/
+
+Code Coverage Tools
+M: Alex Bennée <alex.bennee@linaro.org>
+S: Odd Fixes
+F: scripts/coverage/
diff --git a/scripts/coverage/compare_gcov_json.py b/scripts/coverage/compare_gcov_json.py
new file mode 100755
index 0000000000..1b92dc2c8c
--- /dev/null
+++ b/scripts/coverage/compare_gcov_json.py
@@ -0,0 +1,119 @@
+#!/usr/bin/env python3
+#
+# Compare output of two gcovr JSON reports and report differences. To
+# generate the required output first:
+#   - create two build dirs with --enable-gcov
+#   - run set of tests in each
+#   - run make coverage-html in each
+#   - run gcovr --json --exclude-unreachable-branches \
+#           --print-summary -o coverage.json --root ../../ . *.p
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


