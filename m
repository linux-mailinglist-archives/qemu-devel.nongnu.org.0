Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77A640CC73
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:17:28 +0200 (CEST)
Received: from localhost ([::1]:45872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZTL-000429-O2
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6o-0006vd-5X
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6k-0006yo-Cs
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tp9T3gUpiqm09jJvfntCGMWWH/0DFA5yq3rv2TX7cNc=;
 b=fVf6YvLY5+mUimaAi+vHUDP0VItLkrb6iWue1SmYO05G3JPHph2FAawAssQGFN0UiuXBC3
 4BgOneedw91oU6ynun+PC7gOsWuvksRWfVi/rJlP/l1td9K7ZZJZtTVJurhLuCgsj3i5SM
 bj5Lr9AL/jH8Jm6Ohepwgc3W6jAZgr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-JFOYivlhPoKjWS5WcJ2Nbg-1; Wed, 15 Sep 2021 13:54:00 -0400
X-MC-Unique: JFOYivlhPoKjWS5WcJ2Nbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3246C1084683;
 Wed, 15 Sep 2021 17:53:59 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3ACB77BF5;
 Wed, 15 Sep 2021 17:53:58 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 18/32] simplebench: add img_bench_templater.py
Date: Wed, 15 Sep 2021 19:53:04 +0200
Message-Id: <20210915175318.853225-19-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add simple grammar-parsing template benchmark. New tool consume test
template written in bash with some special grammar injections and
produces multiple tests, run them and finally print a performance
comparison table of different tests produced from one template.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210824101517.59802-2-vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 scripts/simplebench/img_bench_templater.py | 95 ++++++++++++++++++++++
 scripts/simplebench/table_templater.py     | 62 ++++++++++++++
 2 files changed, 157 insertions(+)
 create mode 100755 scripts/simplebench/img_bench_templater.py
 create mode 100644 scripts/simplebench/table_templater.py

diff --git a/scripts/simplebench/img_bench_templater.py b/scripts/simplebench/img_bench_templater.py
new file mode 100755
index 0000000000..f8e1540ada
--- /dev/null
+++ b/scripts/simplebench/img_bench_templater.py
@@ -0,0 +1,95 @@
+#!/usr/bin/env python3
+#
+# Process img-bench test templates
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+
+import sys
+import subprocess
+import re
+import json
+
+import simplebench
+from results_to_text import results_to_text
+from table_templater import Templater
+
+
+def bench_func(env, case):
+    test = templater.gen(env['data'], case['data'])
+
+    p = subprocess.run(test, shell=True, stdout=subprocess.PIPE,
+                       stderr=subprocess.STDOUT, universal_newlines=True)
+
+    if p.returncode == 0:
+        try:
+            m = re.search(r'Run completed in (\d+.\d+) seconds.', p.stdout)
+            return {'seconds': float(m.group(1))}
+        except Exception:
+            return {'error': f'failed to parse qemu-img output: {p.stdout}'}
+    else:
+        return {'error': f'qemu-img failed: {p.returncode}: {p.stdout}'}
+
+
+if __name__ == '__main__':
+    if len(sys.argv) > 1:
+        print("""
+Usage: img_bench_templater.py < path/to/test-template.sh
+
+This script generates performance tests from a test template (example below),
+runs them, and displays the results in a table. The template is read from
+stdin.  It must be written in bash and end with a `qemu-img bench` invocation
+(whose result is parsed to get the test instance’s result).
+
+Use the following syntax in the template to create the various different test
+instances:
+
+  column templating: {var1|var2|...} - test will use different values in
+  different columns. You may use several {} constructions in the test, in this
+  case product of all choice-sets will be used.
+
+  row templating: [var1|var2|...] - similar thing to define rows (test-cases)
+
+Test template example:
+
+Assume you want to compare two qemu-img binaries, called qemu-img-old and
+qemu-img-new in your build directory in two test-cases with 4K writes and 64K
+writes. The template may look like this:
+
+qemu_img=/path/to/qemu/build/qemu-img-{old|new}
+$qemu_img create -f qcow2 /ssd/x.qcow2 1G
+$qemu_img bench -c 100 -d 8 [-s 4K|-s 64K] -w -t none -n /ssd/x.qcow2
+
+When passing this to stdin of img_bench_templater.py, the resulting comparison
+table will contain two columns (for two binaries) and two rows (for two
+test-cases).
+
+In addition to displaying the results, script also stores results in JSON
+format into results.json file in current directory.
+""")
+        sys.exit()
+
+    templater = Templater(sys.stdin.read())
+
+    envs = [{'id': ' / '.join(x), 'data': x} for x in templater.columns]
+    cases = [{'id': ' / '.join(x), 'data': x} for x in templater.rows]
+
+    result = simplebench.bench(bench_func, envs, cases, count=5,
+                               initial_run=False)
+    print(results_to_text(result))
+    with open('results.json', 'w') as f:
+        json.dump(result, f, indent=4)
diff --git a/scripts/simplebench/table_templater.py b/scripts/simplebench/table_templater.py
new file mode 100644
index 0000000000..950f3b3024
--- /dev/null
+++ b/scripts/simplebench/table_templater.py
@@ -0,0 +1,62 @@
+# Parser for test templates
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import itertools
+from lark import Lark
+
+grammar = """
+start: ( text | column_switch | row_switch )+
+
+column_switch: "{" text ["|" text]+ "}"
+row_switch: "[" text ["|" text]+ "]"
+text: /[^|{}\[\]]+/
+"""
+
+parser = Lark(grammar)
+
+class Templater:
+    def __init__(self, template):
+        self.tree = parser.parse(template)
+
+        c_switches = []
+        r_switches = []
+        for x in self.tree.children:
+            if x.data == 'column_switch':
+                c_switches.append([el.children[0].value for el in x.children])
+            elif x.data == 'row_switch':
+                r_switches.append([el.children[0].value for el in x.children])
+
+        self.columns = list(itertools.product(*c_switches))
+        self.rows = list(itertools.product(*r_switches))
+
+    def gen(self, column, row):
+        i = 0
+        j = 0
+        result = []
+
+        for x in self.tree.children:
+            if x.data == 'text':
+                result.append(x.children[0].value)
+            elif x.data == 'column_switch':
+                result.append(column[i])
+                i += 1
+            elif x.data == 'row_switch':
+                result.append(row[j])
+                j += 1
+
+        return ''.join(result)
-- 
2.31.1


