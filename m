Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E2257EC99
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 09:57:50 +0200 (CEST)
Received: from localhost ([::1]:51744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFA1F-00014j-Mx
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 03:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oF9ta-0001aR-9i
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 03:49:55 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:53990
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oF9tV-0000Y8-3f
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 03:49:54 -0400
HMM_SOURCE_IP: 172.18.0.218:34686.1353564676
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.4 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id D16A42800BB;
 Sat, 23 Jul 2022 15:49:45 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 1c3f498501884087a6f0a6b3c24e6ad6 for
 qemu-devel@nongnu.org; Sat, 23 Jul 2022 15:49:47 CST
X-Transaction-ID: 1c3f498501884087a6f0a6b3c24e6ad6
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, peterx@redhat.com,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH 7/8] tests/migration: Introduce dirty-ring-size option into
 guestperf
Date: Sat, 23 Jul 2022 15:49:19 +0800
Message-Id: <78a4287b5190fd3a355a30908ec3bcf2509a69a1.1658561555.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1658561555.git.huangy81@chinatelecom.cn>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1658561555.git.huangy81@chinatelecom.cn>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Guestperf tool does not enable diry ring feature when test
migration by default.

To support dirty ring migration performance test, introduce
dirty-ring-size option into guestperf tools, which ranges in
[1024, 65536].

To set dirty ring size with 4096 during migration test:
$ ./tests/migration/guestperf.py --dirty-ring-size 4096 xxx

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 tests/migration/guestperf/engine.py   | 7 ++++++-
 tests/migration/guestperf/hardware.py | 8 ++++++--
 tests/migration/guestperf/shell.py    | 7 ++++++-
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 87a6ab2..2b98f00 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -304,7 +304,6 @@ def _get_common_args(self, hardware, tunnelled=False):
             cmdline = "'" + cmdline + "'"
 
         argv = [
-            "-accel", "kvm",
             "-cpu", "host",
             "-kernel", self._kernel,
             "-initrd", self._initrd,
@@ -315,6 +314,12 @@ def _get_common_args(self, hardware, tunnelled=False):
             "-smp", str(hardware._cpus),
         ]
 
+        if hardware._dirty_ring_size:
+            argv.extend(["-accel", "kvm,dirty-ring-size=%s" %
+                         hardware._dirty_ring_size])
+        else:
+            argv.extend(["-accel", "kvm"])
+
         if self._debug:
             argv.extend(["-device", "sga"])
 
diff --git a/tests/migration/guestperf/hardware.py b/tests/migration/guestperf/hardware.py
index 3145785..f779cc0 100644
--- a/tests/migration/guestperf/hardware.py
+++ b/tests/migration/guestperf/hardware.py
@@ -23,7 +23,8 @@ def __init__(self, cpus=1, mem=1,
                  src_cpu_bind=None, src_mem_bind=None,
                  dst_cpu_bind=None, dst_mem_bind=None,
                  prealloc_pages = False,
-                 huge_pages=False, locked_pages=False):
+                 huge_pages=False, locked_pages=False,
+                 dirty_ring_size=0):
         self._cpus = cpus
         self._mem = mem # GiB
         self._src_mem_bind = src_mem_bind # List of NUMA nodes
@@ -33,6 +34,7 @@ def __init__(self, cpus=1, mem=1,
         self._prealloc_pages = prealloc_pages
         self._huge_pages = huge_pages
         self._locked_pages = locked_pages
+        self._dirty_ring_size = dirty_ring_size
 
 
     def serialize(self):
@@ -46,6 +48,7 @@ def serialize(self):
             "prealloc_pages": self._prealloc_pages,
             "huge_pages": self._huge_pages,
             "locked_pages": self._locked_pages,
+            "dirty_ring_size": self._dirty_ring_size,
         }
 
     @classmethod
@@ -59,4 +62,5 @@ def deserialize(cls, data):
             data["dst_mem_bind"],
             data["prealloc_pages"],
             data["huge_pages"],
-            data["locked_pages"])
+            data["locked_pages"],
+            data["dirty_ring_size"])
diff --git a/tests/migration/guestperf/shell.py b/tests/migration/guestperf/shell.py
index 8a809e3..559616f 100644
--- a/tests/migration/guestperf/shell.py
+++ b/tests/migration/guestperf/shell.py
@@ -60,6 +60,8 @@ def __init__(self):
         parser.add_argument("--prealloc-pages", dest="prealloc_pages", default=False)
         parser.add_argument("--huge-pages", dest="huge_pages", default=False)
         parser.add_argument("--locked-pages", dest="locked_pages", default=False)
+        parser.add_argument("--dirty-ring-size", dest="dirty_ring_size",
+                            default=0, type=int)
 
         self._parser = parser
 
@@ -89,7 +91,10 @@ def split_map(value):
 
                         locked_pages=args.locked_pages,
                         huge_pages=args.huge_pages,
-                        prealloc_pages=args.prealloc_pages)
+                        prealloc_pages=args.prealloc_pages,
+
+                        dirty_ring_size=args.dirty_ring_size)
+
 
 
 class Shell(BaseShell):
-- 
1.8.3.1


