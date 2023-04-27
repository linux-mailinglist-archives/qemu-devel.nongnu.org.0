Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B186F060C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:44:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0z4-0007OC-2O; Thu, 27 Apr 2023 08:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1ps0yy-0007Kp-Rv
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:44:20 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1ps0yt-0001tb-GB
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:44:20 -0400
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q6b245w0Yz6J8CF;
 Thu, 27 Apr 2023 20:41:00 +0800 (CST)
Received: from DESKTOP-0LHM7NF.huawei.com (10.199.58.101) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 13:44:08 +0100
To: <qemu-devel@nongnu.org>
CC: <quintela@redhat.com>, <eblake@redhat.com>, <armbru@redhat.com>,
 <berrange@redhat.com>, <zhengchuan@huawei.com>, Andrei Gudkov
 <gudkov.andrei@huawei.com>
Subject: [PATCH v2 4/4] migration/calc-dirty-rate: tool to predict migration
 time
Date: Thu, 27 Apr 2023 15:43:00 +0300
Message-ID: <644a9e7f2bff9d36716a3722c729dc88ea40a35a.1682598010.git.gudkov.andrei@huawei.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1682598010.git.gudkov.andrei@huawei.com>
References: <cover.1682598010.git.gudkov.andrei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.58.101]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=gudkov.andrei@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Andrei Gudkov <gudkov.andrei@huawei.com>
From:  Andrei Gudkov via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>
---
 MAINTAINERS                  |   1 +
 scripts/predict_migration.py | 283 +++++++++++++++++++++++++++++++++++
 2 files changed, 284 insertions(+)
 create mode 100644 scripts/predict_migration.py

diff --git a/MAINTAINERS b/MAINTAINERS
index fc225e66df..0c578446cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3167,6 +3167,7 @@ F: docs/devel/migration.rst
 F: qapi/migration.json
 F: tests/migration/
 F: util/userfaultfd.c
+F: scripts/predict_migration.py
 
 D-Bus
 M: Marc-André Lureau <marcandre.lureau@redhat.com>
diff --git a/scripts/predict_migration.py b/scripts/predict_migration.py
new file mode 100644
index 0000000000..c92a97585f
--- /dev/null
+++ b/scripts/predict_migration.py
@@ -0,0 +1,283 @@
+#!/usr/bin/env python3
+#
+# Predicts time required to migrate VM under given max downtime constraint.
+#
+# Copyright (c) 2023 HUAWEI TECHNOLOGIES CO.,LTD.
+#
+# Authors:
+#  Andrei Gudkov <gudkov.andrei@huawei.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+
+# Usage:
+#
+# Step 1. Collect dirty page statistics from live VM:
+# $ scripts/predict_migration.py calc-dirty-rate <qmphost> <qmpport> >dirty.json
+# <...takes 1 minute by default...>
+#
+# Step 2. Run predictor against collected data:
+# $ scripts/predict_migration.py predict < dirty.json
+# Downtime> |    125ms |    250ms |    500ms |   1000ms |   5000ms |    unlim |
+# -----------------------------------------------------------------------------
+#  100 Mbps |        - |        - |        - |        - |        - |   16m45s |
+#    1 Gbps |        - |        - |        - |        - |        - |    1m39s |
+#    2 Gbps |        - |        - |        - |        - |    1m55s |      50s |
+#  2.5 Gbps |        - |        - |        - |        - |    1m12s |      40s |
+#    5 Gbps |        - |        - |        - |      29s |      25s |      20s |
+#   10 Gbps |      13s |      13s |      12s |      12s |      12s |      10s |
+#   25 Gbps |       5s |       5s |       5s |       5s |       4s |       4s |
+#   40 Gbps |       3s |       3s |       3s |       3s |       3s |       3s |
+#
+# The latter prints table that lists estimated time it will take to migrate VM.
+# This time depends on the network bandwidth and max allowed downtime.
+# Dash indicates that migration does not converge.
+# Prediction takes care only about migrating RAM and only in pre-copy mode.
+# Other features, such as compression or local disk migration, are not supported
+
+
+import sys
+import os
+import math
+import json
+from dataclasses import dataclass
+import asyncio
+import argparse
+
+sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
+from qemu.qmp import QMPClient
+
+async def calc_dirty_rate(host, port, calc_time, sample_pages):
+    client = QMPClient()
+    try:
+        await client.connect((host, port))
+        args = {
+            'calc-time': calc_time,
+            'sample-pages': sample_pages
+        }
+        await client.execute('calc-dirty-rate', args)
+        await asyncio.sleep(calc_time)
+        while True:
+            data = await client.execute('query-dirty-rate')
+            if data['status'] == 'measuring':
+                await asyncio.sleep(0.5)
+            elif data['status'] == 'measured':
+                return data
+            else:
+                raise ValueError(data['status'])
+    finally:
+        await client.disconnect()
+
+
+class MemoryModel:
+    """
+    Models RAM state during pre-copy migration using calc-dirty-rate results.
+    Its primary function is to estimate how many pages will be dirtied
+    after given time starting from "clean" state.
+    This function is non-linear and saturates at some point.
+    """
+
+    @dataclass
+    class Point:
+        period_millis:float
+        dirty_pages:float
+
+    def __init__(self, data):
+        """
+        :param data: dictionary returned by calc-dirty-rate
+        """
+        self.__points = self.__make_points(data)
+        self.__page_size = data['page-size']
+        self.__num_total_pages = data['n-total-pages']
+        self.__num_zero_pages = data['n-zero-pages'] / \
+                (data['n-sampled-pages'] / data['n-total-pages'])
+
+    def __make_points(self, data):
+        points = list()
+
+        # Add observed points
+        sample_ratio = data['n-sampled-pages'] / data['n-total-pages']
+        for millis,dirty_pages in zip(data['periods'], data['n-dirty-pages']):
+            millis = float(millis)
+            dirty_pages = dirty_pages / sample_ratio
+            points.append(MemoryModel.Point(millis, dirty_pages))
+
+        # Extrapolate function to the left.
+        # Assuming that the function is convex, the worst case is achieved
+        # when dirty page count immediately jumps to some value at zero time
+        # (infinite slope), and next keeps the same slope as in the region
+        # between the first two observed points: points[0]..points[1]
+        slope, offset = self.__fit_line(points[0], points[1])
+        points.insert(0, MemoryModel.Point(0.0, max(offset, 0.0)))
+
+        # Extrapolate function to the right.
+        # The worst case is achieved when the function has the same slope
+        # as in the last observed region.
+        slope, offset = self.__fit_line(points[-2], points[-1])
+        max_dirty_pages = \
+                data['n-total-pages'] - (data['n-zero-pages'] / sample_ratio)
+        if slope > 0.0:
+            saturation_millis = (max_dirty_pages - offset) / slope
+            points.append(MemoryModel.Point(saturation_millis, max_dirty_pages))
+        points.append(MemoryModel.Point(math.inf, max_dirty_pages))
+
+        return points
+
+    def __fit_line(self, lhs:Point, rhs:Point):
+        slope = (rhs.dirty_pages - lhs.dirty_pages) / \
+                (rhs.period_millis - lhs.period_millis)
+        offset = lhs.dirty_pages - slope * lhs.period_millis
+        return slope, offset
+
+    def page_size(self):
+        """
+        Return page size in bytes
+        """
+        return self.__page_size
+
+    def num_total_pages(self):
+        return self.__num_total_pages
+
+    def num_zero_pages(self):
+        """
+        Estimated total number of zero pages. Assumed to be constant.
+        """
+        return self.__num_zero_pages
+
+    def num_dirty_pages(self, millis):
+        """
+        Estimate number of dirty pages after given time starting from "clean"
+        state. The estimation is based on piece-wise linear interpolation.
+        """
+        for i in range(len(self.__points)):
+            if self.__points[i].period_millis == millis:
+                return self.__points[i].dirty_pages
+            elif self.__points[i].period_millis > millis:
+                slope, offset = self.__fit_line(self.__points[i-1],
+                                                        self.__points[i])
+                return offset + slope * millis
+        raise RuntimeError("unreachable")
+
+
+def predict_migration_time(model, bandwidth, downtime, deadline=3600*1000):
+    """
+    Predict how much time it will take to migrate VM under under given
+    deadline constraint.
+
+    :param model: `MemoryModel` object for a given VM
+    :param bandwidth: Bandwidth available for migration [bytes/s]
+    :param downtime: Max allowed downtime [milliseconds]
+    :param deadline: Max total time to migrate VM before timeout [milliseconds]
+    :return: Predicted migration time [milliseconds] or `None`
+             if migration process doesn't converge before given deadline
+    """
+
+    left_zero_pages = model.num_zero_pages()
+    left_normal_pages = model.num_total_pages() - model.num_zero_pages()
+    header_size = 8
+
+    total_millis = 0.0
+    while True:
+        iter_bytes = 0.0
+        iter_bytes += left_normal_pages * (model.page_size() + header_size)
+        iter_bytes += left_zero_pages * header_size
+
+        iter_millis = iter_bytes * 1000.0 / bandwidth
+
+        total_millis += iter_millis
+
+        if iter_millis <= downtime:
+            return int(math.ceil(total_millis))
+        elif total_millis > deadline:
+            return None
+        else:
+            left_zero_pages = 0
+            left_normal_pages = model.num_dirty_pages(iter_millis)
+
+
+def run_predict_cmd(model):
+    @dataclass
+    class ValStr:
+        value:object
+        string:str
+
+    def gbps(value):
+        return ValStr(value*1024*1024*1024/8, f'{value} Gbps')
+
+    def mbps(value):
+        return ValStr(value*1024*1024/8, f'{value} Mbps')
+
+    def dt(millis):
+        if millis is not None:
+            return ValStr(millis, f'{millis}ms')
+        else:
+            return ValStr(math.inf, 'unlim')
+
+    def eta(millis):
+        if millis is not None:
+            seconds = int(math.ceil(millis/1000.0))
+            minutes, seconds = divmod(seconds, 60)
+            s = ''
+            if minutes > 0:
+                s += f'{minutes}m'
+            if len(s) > 0:
+                s += f'{seconds:02d}s'
+            else:
+                s += f'{seconds}s'
+        else:
+            s = '-'
+        return ValStr(millis, s)
+
+
+    bandwidths = [mbps(100), gbps(1), gbps(2), gbps(2.5), gbps(5), gbps(10),
+                  gbps(25), gbps(40)]
+    downtimes = [dt(125), dt(250), dt(500), dt(1000), dt(5000), dt(None)]
+
+    out = ''
+    out += 'Downtime> |'
+    for downtime in downtimes:
+        out += f'  {downtime.string:>7} |'
+    print(out)
+
+    print('-'*len(out))
+
+    for bandwidth in bandwidths:
+        print(f'{bandwidth.string:>9} | ', '', end='')
+        for downtime in downtimes:
+            millis = predict_migration_time(model,
+                                            bandwidth.value,
+                                            downtime.value)
+            print(f'{eta(millis).string:>7} | ', '', end='')
+        print()
+
+def main():
+    parser = argparse.ArgumentParser()
+    subparsers = parser.add_subparsers(dest='command', required=True)
+
+    parser_cdr = subparsers.add_parser('calc-dirty-rate',
+            help='Collect and print dirty page statistics from live VM')
+    parser_cdr.add_argument('--calc-time', type=int, default=60,
+                            help='Calculation time in seconds')
+    parser_cdr.add_argument('--sample-pages', type=int, default=512,
+            help='Number of sampled pages per one gigabyte of RAM')
+    parser_cdr.add_argument('host', metavar='host', type=str, help='QMP host')
+    parser_cdr.add_argument('port', metavar='port', type=int, help='QMP port')
+
+    subparsers.add_parser('predict', help='Predict migration time')
+
+    args = parser.parse_args()
+
+    if args.command == 'calc-dirty-rate':
+        data = asyncio.run(calc_dirty_rate(host=args.host,
+                                           port=args.port,
+                                           calc_time=args.calc_time,
+                                           sample_pages=args.sample_pages))
+        print(json.dumps(data))
+    elif args.command == 'predict':
+        data = json.load(sys.stdin)
+        model = MemoryModel(data)
+        run_predict_cmd(model)
+
+if __name__ == '__main__':
+    main()
-- 
2.30.2


