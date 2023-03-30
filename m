Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798806D00DA
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:13:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpG6-0007Wm-TM; Thu, 30 Mar 2023 06:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG0-0007Td-7u
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:49 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpFw-0000H0-Iz
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:47 -0400
Received: by mail-wm1-x32b.google.com with SMTP id s13so10542748wmr.4
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pw6jPJryQU4Hi2TWQbCO6wgO0LKOGybnyV0PPfRx55k=;
 b=lkqPKwNDmg+UG9IzrG4YkOoZgYMcrCHCjnYLbteEL/fQsRbUoVtixN42H2J8FPjEmG
 N2JlifGMMdnvP8eZHiprnejbBosirRqTHlHhqyZg7Kv+rCPYm/0MdPqKeMPyeSahUxKF
 8dIOVJTAVkLwI1qM3BCmjw6FuS+OpErrukpzeJ7KFYV39GPfWWrDn4NB1s4Q28nT9KyR
 4lx8/R5g3Y+NS1T24wm146fgxHf50j4c9B+t0ZnUlQUfdlI/4BpD7qv8B4jTJAqTNnM+
 deY0+mFnZvGfZEx6p3bHdfScobAAN/qjorUPG67Am5E80NuzmGmcfuUDy0xcTMaSh+EJ
 8JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pw6jPJryQU4Hi2TWQbCO6wgO0LKOGybnyV0PPfRx55k=;
 b=lQz1bi4X4kqvDkAt20t9VidYvzhZ88Imdpbv2VfiEBkLU8vEzn6yOZfFkRYy7xMLcP
 h5S6Wx6CpggC/zhGTqNVGLYAV3ctrQpsHacIXCpBizdnjJVlbm9KuEhV2fj9nlKBdrN5
 fpSTjMQBdyMx3iM3WKIu1dLf6mNnf7CwxRqQqAK6rlmtRL4ufn5p4A0avsKJHZGa/xac
 jUB4WN5NaeqSck0zh+t7sqMPkm7uv6eWgVLWytm7FC84J2zQz6a4khlACHOKMrzkV/BQ
 nLxP1UsC3cXQZj3JJun9XD/U5t1UvesrFyaUZZpQLSPQ0rlykdh3myiNNfApVW8V2DXp
 WtpA==
X-Gm-Message-State: AO0yUKUStG0+HyKZDdfgHyrS72GcYLkQtCJFACQnS2G7nzfGzBKUojGr
 tcgtmGao3nyAulgIlPGIEwnWnA==
X-Google-Smtp-Source: AK7set/Sf3JPs8E9PFC4AGuz3dxV3R2XS/beru+eyuoQcEizsPXghYZCRE3Mjcthhwqck+xBYAypNw==
X-Received: by 2002:a05:600c:b54:b0:3ee:36f:3485 with SMTP id
 k20-20020a05600c0b5400b003ee036f3485mr17582082wmr.8.1680171102954; 
 Thu, 30 Mar 2023 03:11:42 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a05600c4f4100b003ef5b285f65sm5633643wmq.46.2023.03.30.03.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:11:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39B6D1FFB8;
 Thu, 30 Mar 2023 11:11:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: [PATCH 01/11] scripts/coverage: initial coverage comparison script
Date: Thu, 30 Mar 2023 11:11:31 +0100
Message-Id: <20230330101141.30199-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330101141.30199-1-alex.bennee@linaro.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
v2
  - add MAINTAINERS entry
---
 MAINTAINERS                           |   5 ++
 scripts/coverage/compare_gcov_json.py | 118 ++++++++++++++++++++++++++
 2 files changed, 123 insertions(+)
 create mode 100755 scripts/coverage/compare_gcov_json.py

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


