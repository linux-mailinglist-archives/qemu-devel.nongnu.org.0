Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF8C2DE6A7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:33:50 +0100 (CET)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHlN-0000rD-Qy
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHS9-0002rt-0v
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHS6-0005a5-Uj
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZ3AVDP7PsFCYzw2Z6tAtH2iScmw91K0spC2J2QZIqI=;
 b=VfL6VA6HXbDdT/54q5OegFaBtXgjD0dt8+Zl+ZkNQvPp2gma8o/wqnsMjex5SZ6Ic90pLU
 rSDS/XaZphuyqLf6bjHQ/Vggii9Gng8u56lSUKaUfQhQV4YB3nITudHiAU1jVRKbMsYl2C
 CF7DOmo2jpiL2qeoCKge5SQwxURF6x0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-0vW932ugM2uohay7av6rZQ-1; Fri, 18 Dec 2020 10:13:49 -0500
X-MC-Unique: 0vW932ugM2uohay7av6rZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B2F71005504;
 Fri, 18 Dec 2020 15:13:48 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD6FE47;
 Fri, 18 Dec 2020 15:13:47 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 25/30] scripts/simplebench: add bench_prealloc.py
Date: Fri, 18 Dec 2020 16:12:44 +0100
Message-Id: <20201218151249.715731-26-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Benchmark for new preallocate filter.

Example usage:
    ./bench_prealloc.py ../../build/qemu-img \
        ssd-ext4:/path/to/mount/point \
        ssd-xfs:/path2 hdd-ext4:/path3 hdd-xfs:/path4

The benchmark shows performance improvement (or degradation) when use
new preallocate filter with qcow2 image.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201021145859.11201-22-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 scripts/simplebench/bench_prealloc.py | 132 ++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100755 scripts/simplebench/bench_prealloc.py

diff --git a/scripts/simplebench/bench_prealloc.py b/scripts/simplebench/bench_prealloc.py
new file mode 100755
index 0000000000..85f588c597
--- /dev/null
+++ b/scripts/simplebench/bench_prealloc.py
@@ -0,0 +1,132 @@
+#!/usr/bin/env python3
+#
+# Benchmark preallocate filter
+#
+# Copyright (c) 2020 Virtuozzo International GmbH.
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
+import os
+import subprocess
+import re
+import json
+
+import simplebench
+from results_to_text import results_to_text
+
+
+def qemu_img_bench(args):
+    p = subprocess.run(args, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
+                       universal_newlines=True)
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
+def bench_func(env, case):
+    fname = f"{case['dir']}/prealloc-test.qcow2"
+    try:
+        os.remove(fname)
+    except OSError:
+        pass
+
+    subprocess.run([env['qemu-img-binary'], 'create', '-f', 'qcow2', fname,
+                   '16G'], stdout=subprocess.DEVNULL,
+                   stderr=subprocess.DEVNULL, check=True)
+
+    args = [env['qemu-img-binary'], 'bench', '-c', str(case['count']),
+            '-d', '64', '-s', case['block-size'], '-t', 'none', '-n', '-w']
+    if env['prealloc']:
+        args += ['--image-opts',
+                 'driver=qcow2,file.driver=preallocate,file.file.driver=file,'
+                 f'file.file.filename={fname}']
+    else:
+        args += ['-f', 'qcow2', fname]
+
+    return qemu_img_bench(args)
+
+
+def auto_count_bench_func(env, case):
+    case['count'] = 100
+    while True:
+        res = bench_func(env, case)
+        if 'error' in res:
+            return res
+
+        if res['seconds'] >= 1:
+            break
+
+        case['count'] *= 10
+
+    if res['seconds'] < 5:
+        case['count'] = round(case['count'] * 5 / res['seconds'])
+        res = bench_func(env, case)
+        if 'error' in res:
+            return res
+
+    res['iops'] = case['count'] / res['seconds']
+    return res
+
+
+if __name__ == '__main__':
+    if len(sys.argv) < 2:
+        print(f'USAGE: {sys.argv[0]} <qemu-img binary> '
+              'DISK_NAME:DIR_PATH ...')
+        exit(1)
+
+    qemu_img = sys.argv[1]
+
+    envs = [
+        {
+            'id': 'no-prealloc',
+            'qemu-img-binary': qemu_img,
+            'prealloc': False
+        },
+        {
+            'id': 'prealloc',
+            'qemu-img-binary': qemu_img,
+            'prealloc': True
+        }
+    ]
+
+    aligned_cases = []
+    unaligned_cases = []
+
+    for disk in sys.argv[2:]:
+        name, path = disk.split(':')
+        aligned_cases.append({
+            'id': f'{name}, aligned sequential 16k',
+            'block-size': '16k',
+            'dir': path
+        })
+        unaligned_cases.append({
+            'id': f'{name}, unaligned sequential 64k',
+            'block-size': '16k',
+            'dir': path
+        })
+
+    result = simplebench.bench(auto_count_bench_func, envs,
+                               aligned_cases + unaligned_cases, count=5)
+    print(results_to_text(result))
+    with open('results.json', 'w') as f:
+        json.dump(result, f, indent=4)
-- 
2.29.2


