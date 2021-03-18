Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4F0340A40
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:33:07 +0100 (CET)
Received: from localhost ([::1]:49984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMva6-0004bz-4d
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lMvIR-0003Iv-Ge
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:14:51 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:33947
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lMvIM-00083G-F7
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:14:51 -0400
HMM_SOURCE_IP: 172.18.0.218:3050.1946000287
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.98.62?logid-98a8b1c14c194512bf09e5bccc0e7986
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 40D2D280072;
 Fri, 19 Mar 2021 00:14:32 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id 98a8b1c14c194512bf09e5bccc0e7986 for
 qemu-devel@nongnu.org; Fri Mar 19 00:14:36 2021
X-Transaction-ID: 98a8b1c14c194512bf09e5bccc0e7986
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] tests/migration: introduce multifd into guestperf
Date: Fri, 19 Mar 2021 00:14:02 +0800
Message-Id: <dffa589aac2f33488f3568c76db048a26612754c.1616082131.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Hyman <huangy81@chinatelecom.cn>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman <huangy81@chinatelecom.cn>

Current guestperf tool does not support multifd migration,
introducing multifd is good idea so that we can compare the
performence of all type of migration.

To request that multifd is enabled, with 4 channels:
$ ./tests/migration/guestperf.py \
    --multifd --multifd-channels 4 --output output.json

To run the entire standardized set of multifd-enabled
comparisons, with unix migration:
$ ./tests/migration/guestperf-batch.py \
    --dst-host localhost --transport unix \
    --filter compr-multifd* --output outputdir

Signed-off-by: Hyman <huangy81@chinatelecom.cn>
---
 tests/migration/guestperf/comparison.py | 14 ++++++++++++++
 tests/migration/guestperf/engine.py     | 16 ++++++++++++++++
 tests/migration/guestperf/scenario.py   | 12 ++++++++++--
 tests/migration/guestperf/shell.py      | 10 +++++++++-
 4 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/tests/migration/guestperf/comparison.py b/tests/migration/guestperf/comparison.py
index ba2edbe..971e7a3 100644
--- a/tests/migration/guestperf/comparison.py
+++ b/tests/migration/guestperf/comparison.py
@@ -121,4 +121,18 @@ def __init__(self, name, scenarios):
         Scenario("compr-xbzrle-cache-50",
                  compression_xbzrle=True, compression_xbzrle_cache=50),
     ]),
+
+
+    # Looking at effect of multifd with
+    # varying numbers of channels
+    Comparison("compr-multifd", scenarios = [
+        Scenario("compr-multifd-channels-4",
+                 multifd=True, multifd_channels=4),
+        Scenario("compr-multifd-channels-8",
+                 multifd=True, multifd_channels=8),
+        Scenario("compr-multifd-channels-32",
+                 multifd=True, multifd_channels=32),
+        Scenario("compr-multifd-channels-64",
+                 multifd=True, multifd_channels=64),
+    ]),
 ]
diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 5189cf9..faf357b 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -186,6 +186,22 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
                                value=(hardware._mem * 1024 * 1024 * 1024 / 100 *
                                       scenario._compression_xbzrle_cache))
 
+        if scenario._multifd:
+            resp = src.command("migrate-set-capabilities",
+                               capabilities = [
+                                   { "capability": "multifd",
+                                     "state": True }
+                               ])
+            resp = src.command("migrate-set-parameters",
+                               multifd_channels=scenario._multifd_channels)
+            resp = dst.command("migrate-set-capabilities",
+                               capabilities = [
+                                   { "capability": "multifd",
+                                     "state": True }
+                               ])
+            resp = dst.command("migrate-set-parameters",
+                               multifd_channels=scenario._multifd_channels)
+
         resp = src.command("migrate", uri=connect_uri)
 
         post_copy = False
diff --git a/tests/migration/guestperf/scenario.py b/tests/migration/guestperf/scenario.py
index 28ef36c..de70d9b 100644
--- a/tests/migration/guestperf/scenario.py
+++ b/tests/migration/guestperf/scenario.py
@@ -29,7 +29,8 @@ def __init__(self, name,
                  post_copy=False, post_copy_iters=5,
                  auto_converge=False, auto_converge_step=10,
                  compression_mt=False, compression_mt_threads=1,
-                 compression_xbzrle=False, compression_xbzrle_cache=10):
+                 compression_xbzrle=False, compression_xbzrle_cache=10,
+                 multifd=False, multifd_channels=2):
 
         self._name = name
 
@@ -56,6 +57,9 @@ def __init__(self, name,
         self._compression_xbzrle = compression_xbzrle
         self._compression_xbzrle_cache = compression_xbzrle_cache # percentage of guest RAM
 
+        self._multifd = multifd
+        self._multifd_channels = multifd_channels
+
     def serialize(self):
         return {
             "name": self._name,
@@ -73,6 +77,8 @@ def serialize(self):
             "compression_mt_threads": self._compression_mt_threads,
             "compression_xbzrle": self._compression_xbzrle,
             "compression_xbzrle_cache": self._compression_xbzrle_cache,
+            "multifd": self._multifd,
+            "multifd_channels": self._multifd_channels,
         }
 
     @classmethod
@@ -92,4 +98,6 @@ def deserialize(cls, data):
             data["compression_mt"],
             data["compression_mt_threads"],
             data["compression_xbzrle"],
-            data["compression_xbzrle_cache"])
+            data["compression_xbzrle_cache"],
+            data["multifd"],
+            data["multifd_channels"])
diff --git a/tests/migration/guestperf/shell.py b/tests/migration/guestperf/shell.py
index f838888..8a809e3 100644
--- a/tests/migration/guestperf/shell.py
+++ b/tests/migration/guestperf/shell.py
@@ -122,6 +122,11 @@ def __init__(self):
         parser.add_argument("--compression-xbzrle", dest="compression_xbzrle", default=False, action="store_true")
         parser.add_argument("--compression-xbzrle-cache", dest="compression_xbzrle_cache", default=10, type=int)
 
+        parser.add_argument("--multifd", dest="multifd", default=False,
+                            action="store_true")
+        parser.add_argument("--multifd-channels", dest="multifd_channels",
+                            default=2, type=int)
+
     def get_scenario(self, args):
         return Scenario(name="perfreport",
                         downtime=args.downtime,
@@ -142,7 +147,10 @@ def get_scenario(self, args):
                         compression_mt_threads=args.compression_mt_threads,
 
                         compression_xbzrle=args.compression_xbzrle,
-                        compression_xbzrle_cache=args.compression_xbzrle_cache)
+                        compression_xbzrle_cache=args.compression_xbzrle_cache,
+
+                        multifd=args.multifd,
+                        multifd_channels=args.multifd_channels)
 
     def run(self, argv):
         args = self._parser.parse_args(argv)
-- 
1.8.3.1


