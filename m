Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEED30414E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:03:38 +0100 (CET)
Received: from localhost ([::1]:39798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PsX-0000kG-MH
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEd-0001MT-Vy
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEV-0006c0-Ji
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gsxwadrVvqdkDS0/Q4er1w0dW+tRbzcn/NKa5/xW7uo=;
 b=XOkHCKMqqxDILw56FFy4x3ZR4Fzn0Fg3TJJAtuGQrH/g62PfG6CtwYSkKujj8+un7Mqwb6
 Oq/eR+x21quyzpgjowPJTk2W3q4uOfcuPDgcp8uEtk1V3ddHPsz12BwqkA/XM50odvrPed
 OCp5IIsWaNg2daZuJjihVo+aTRPlcwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-2M5f1ChrOaabUn6VPxKIEQ-1; Tue, 26 Jan 2021 09:22:11 -0500
X-MC-Unique: 2M5f1ChrOaabUn6VPxKIEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7F9610054FF;
 Tue, 26 Jan 2021 14:22:10 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FD035D9DE;
 Tue, 26 Jan 2021 14:22:10 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 49/53] simplebench: add bench-backup.py
Date: Tue, 26 Jan 2021 15:20:12 +0100
Message-Id: <20210126142016.806073-50-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add script to benchmark new backup architecture.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210116214705.822267-24-vsementsov@virtuozzo.com>
[mreitz: s/not unsupported/not supported/]
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 scripts/simplebench/bench-backup.py | 167 ++++++++++++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100755 scripts/simplebench/bench-backup.py

diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
new file mode 100755
index 0000000000..33a1ecfefa
--- /dev/null
+++ b/scripts/simplebench/bench-backup.py
@@ -0,0 +1,167 @@
+#!/usr/bin/env python3
+#
+# Bench backup block-job
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
+import argparse
+import json
+
+import simplebench
+from results_to_text import results_to_text
+from bench_block_job import bench_block_copy, drv_file, drv_nbd
+
+
+def bench_func(env, case):
+    """ Handle one "cell" of benchmarking table. """
+    cmd_options = env['cmd-options'] if 'cmd-options' in env else {}
+    return bench_block_copy(env['qemu-binary'], env['cmd'],
+                            cmd_options,
+                            case['source'], case['target'])
+
+
+def bench(args):
+    test_cases = []
+
+    sources = {}
+    targets = {}
+    for d in args.dir:
+        label, path = d.split(':')  # paths with colon not supported
+        sources[label] = drv_file(path + '/test-source')
+        targets[label] = drv_file(path + '/test-target')
+
+    if args.nbd:
+        nbd = args.nbd.split(':')
+        host = nbd[0]
+        port = '10809' if len(nbd) == 1 else nbd[1]
+        drv = drv_nbd(host, port)
+        sources['nbd'] = drv
+        targets['nbd'] = drv
+
+    for t in args.test:
+        src, dst = t.split(':')
+
+        test_cases.append({
+            'id': t,
+            'source': sources[src],
+            'target': targets[dst]
+        })
+
+    binaries = []  # list of (<label>, <path>, [<options>])
+    for i, q in enumerate(args.env):
+        name_path = q.split(':')
+        if len(name_path) == 1:
+            label = f'q{i}'
+            path_opts = name_path[0].split(',')
+        else:
+            assert len(name_path) == 2  # paths with colon not supported
+            label = name_path[0]
+            path_opts = name_path[1].split(',')
+
+        binaries.append((label, path_opts[0], path_opts[1:]))
+
+    test_envs = []
+
+    bin_paths = {}
+    for i, q in enumerate(args.env):
+        opts = q.split(',')
+        label_path = opts[0]
+        opts = opts[1:]
+
+        if ':' in label_path:
+            # path with colon inside is not supported
+            label, path = label_path.split(':')
+            bin_paths[label] = path
+        elif label_path in bin_paths:
+            label = label_path
+            path = bin_paths[label]
+        else:
+            path = label_path
+            label = f'q{i}'
+            bin_paths[label] = path
+
+        x_perf = {}
+        is_mirror = False
+        for opt in opts:
+            if opt == 'mirror':
+                is_mirror = True
+            elif opt == 'copy-range=on':
+                x_perf['use-copy-range'] = True
+            elif opt == 'copy-range=off':
+                x_perf['use-copy-range'] = False
+            elif opt.startswith('max-workers='):
+                x_perf['max-workers'] = int(opt.split('=')[1])
+
+        if is_mirror:
+            assert not x_perf
+            test_envs.append({
+                    'id': f'mirror({label})',
+                    'cmd': 'blockdev-mirror',
+                    'qemu-binary': path
+                })
+        else:
+            test_envs.append({
+                'id': f'backup({label})\n' + '\n'.join(opts),
+                'cmd': 'blockdev-backup',
+                'cmd-options': {'x-perf': x_perf} if x_perf else {},
+                'qemu-binary': path
+            })
+
+    result = simplebench.bench(bench_func, test_envs, test_cases, count=3)
+    with open('results.json', 'w') as f:
+        json.dump(result, f, indent=4)
+    print(results_to_text(result))
+
+
+class ExtendAction(argparse.Action):
+    def __call__(self, parser, namespace, values, option_string=None):
+        items = getattr(namespace, self.dest) or []
+        items.extend(values)
+        setattr(namespace, self.dest, items)
+
+
+if __name__ == '__main__':
+    p = argparse.ArgumentParser('Backup benchmark', epilog='''
+ENV format
+
+    (LABEL:PATH|LABEL|PATH)[,max-workers=N][,use-copy-range=(on|off)][,mirror]
+
+    LABEL                short name for the binary
+    PATH                 path to the binary
+    max-workers          set x-perf.max-workers of backup job
+    use-copy-range       set x-perf.use-copy-range of backup job
+    mirror               use mirror job instead of backup''',
+                                formatter_class=argparse.RawTextHelpFormatter)
+    p.add_argument('--env', nargs='+', help='''\
+Qemu binaries with labels and options, see below
+"ENV format" section''',
+                   action=ExtendAction)
+    p.add_argument('--dir', nargs='+', help='''\
+Directories, each containing "test-source" and/or
+"test-target" files, raw images to used in
+benchmarking. File path with label, like
+label:/path/to/directory''',
+                   action=ExtendAction)
+    p.add_argument('--nbd', help='''\
+host:port for remote NBD image, (or just host, for
+default port 10809). Use it in tests, label is "nbd"
+(but you cannot create test nbd:nbd).''')
+    p.add_argument('--test', nargs='+', help='''\
+Tests, in form source-dir-label:target-dir-label''',
+                   action=ExtendAction)
+
+    bench(p.parse_args())
-- 
2.29.2


