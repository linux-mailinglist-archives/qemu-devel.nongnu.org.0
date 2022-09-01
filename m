Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E885A9E47
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:41:16 +0200 (CEST)
Received: from localhost ([::1]:54346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oToBi-0000zH-PS
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oTnuM-0000Ze-IG
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 13:23:15 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:56559
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oTnuI-0003AN-B2
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 13:23:14 -0400
HMM_SOURCE_IP: 172.18.0.218:57590.1734067809
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.60 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id AE2732800E1;
 Fri,  2 Sep 2022 01:23:05 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id a20a0101ac804cff9186c7f816ce7d6b for
 qemu-devel@nongnu.org; Fri, 02 Sep 2022 01:23:08 CST
X-Transaction-ID: a20a0101ac804cff9186c7f816ce7d6b
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v1 8/8] tests/migration: Introduce dirty-limit into guestperf
Date: Fri,  2 Sep 2022 01:22:36 +0800
Message-Id: <1b363679f9f2b15df7739c565256b7e7d176f881.1662052189.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1662052189.git.huangy81@chinatelecom.cn>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1662052189.git.huangy81@chinatelecom.cn>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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

Guestperf tool does not cover the dirty-limit migration
currently, support this feature.

To enable dirty-limit, setting x-vcpu-dirty-limit-period
as 500ms and x-vcpu-dirty-limit as 10MB/s:
$ ./tests/migration/guestperf.py \
    --dirty-limit --x-vcpu-dirty-limit-period 500 \
    --x-vcpu-dirty-limit 10 --output output.json \

To run the entire standardized set of dirty-limit-enabled
comparisons, with unix migration:
$ ./tests/migration/guestperf-batch.py \
    --dst-host localhost --transport unix \
    --filter compr-dirty-limit* --output outputdir

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 tests/migration/guestperf/comparison.py | 24 ++++++++++++++++++++++++
 tests/migration/guestperf/engine.py     | 26 ++++++++++++++++++++++++++
 tests/migration/guestperf/progress.py   | 17 +++++++++++++++--
 tests/migration/guestperf/scenario.py   | 11 ++++++++++-
 tests/migration/guestperf/shell.py      | 18 +++++++++++++++++-
 5 files changed, 92 insertions(+), 4 deletions(-)

diff --git a/tests/migration/guestperf/comparison.py b/tests/migration/guestperf/comparison.py
index c03b3f6..d082a54 100644
--- a/tests/migration/guestperf/comparison.py
+++ b/tests/migration/guestperf/comparison.py
@@ -135,4 +135,28 @@ def __init__(self, name, scenarios):
         Scenario("compr-multifd-channels-64",
                  multifd=True, multifd_channels=64),
     ]),
+
+
+    # Looking at effect of dirty-limit with
+    # varying x_vcpu_dirty_limit_period
+    Comparison("compr-dirty-limit-period", scenarios = [
+        Scenario("compr-dirty-limit-period-100",
+                 dirty_limit=True, x_vcpu_dirty_limit_period=100),
+        Scenario("compr-dirty-limit-period-500",
+                 dirty_limit=True, x_vcpu_dirty_limit_period=500),
+        Scenario("compr-dirty-limit-period-1000",
+                 dirty_limit=True, x_vcpu_dirty_limit_period=1000),
+    ]),
+
+
+    # Looking at effect of dirty-limit with
+    # varying x_vcpu_dirty_limit
+    Comparison("compr-dirty-limit", scenarios = [
+        Scenario("compr-dirty-limit-10MB",
+                 dirty_limit=True, x_vcpu_dirty_limit=10),
+        Scenario("compr-dirty-limit-20MB",
+                 dirty_limit=True, x_vcpu_dirty_limit=20),
+        Scenario("compr-dirty-limit-50MB",
+                 dirty_limit=True, x_vcpu_dirty_limit=50),
+    ]),
 ]
diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 2b98f00..c6b9bb1 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -103,6 +103,8 @@ def _migrate_progress(self, vm):
             info.get("expected-downtime", 0),
             info.get("setup-time", 0),
             info.get("cpu-throttle-percentage", 0),
+            info.get("dirty-limit-throttle-us-per-full", 0),
+            info.get("dirty-limit-us-ring-full", 0),
         )
 
     def _migrate(self, hardware, scenario, src, dst, connect_uri):
@@ -204,6 +206,30 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
             resp = dst.command("migrate-set-parameters",
                                multifd_channels=scenario._multifd_channels)
 
+        if scenario._dirty_limit:
+            if not hardware._dirty_ring_size:
+                raise Exception("dirty ring size must be configured when "
+                                "testing dirty limit migration")
+
+            resp = src.command("migrate-set-capabilities",
+                               capabilities = [
+                                   { "capability": "dirty-limit",
+                                     "state": True }
+                               ])
+            resp = src.command("migrate-set-parameters",
+                x_vcpu_dirty_limit_period=scenario._x_vcpu_dirty_limit_period)
+            resp = src.command("migrate-set-parameters",
+                               x_vcpu_dirty_limit=scenario._x_vcpu_dirty_limit)
+            resp = dst.command("migrate-set-capabilities",
+                               capabilities = [
+                                   { "capability": "dirty-limit",
+                                     "state": True }
+                               ])
+            resp = dst.command("migrate-set-parameters",
+                x_vcpu_dirty_limit_period=scenario._x_vcpu_dirty_limit_period)
+            resp = dst.command("migrate-set-parameters",
+                               x_vcpu_dirty_limit=scenario._x_vcpu_dirty_limit)
+
         resp = src.command("migrate", uri=connect_uri)
 
         post_copy = False
diff --git a/tests/migration/guestperf/progress.py b/tests/migration/guestperf/progress.py
index ab1ee57..dd5d86b 100644
--- a/tests/migration/guestperf/progress.py
+++ b/tests/migration/guestperf/progress.py
@@ -81,7 +81,9 @@ def __init__(self,
                  downtime,
                  downtime_expected,
                  setup_time,
-                 throttle_pcent):
+                 throttle_pcent,
+                 dirty_limit_throttle_us_per_full,
+                 dirty_limit_us_ring_full):
 
         self._status = status
         self._ram = ram
@@ -91,6 +93,11 @@ def __init__(self,
         self._downtime_expected = downtime_expected
         self._setup_time = setup_time
         self._throttle_pcent = throttle_pcent
+        self._dirty_limit_throttle_us_per_full =
+            dirty_limit_throttle_us_per_full
+        self._dirty_limit_us_ring_full =
+            dirty_limit_us_ring_full
+
 
     def serialize(self):
         return {
@@ -102,6 +109,10 @@ def serialize(self):
             "downtime_expected": self._downtime_expected,
             "setup_time": self._setup_time,
             "throttle_pcent": self._throttle_pcent,
+            "dirty_limit_throttle_time_per_full":
+                self._dirty_limit_throttle_us_per_full,
+            "dirty_limit_ring_full_time":
+                self._dirty_limit_us_ring_full,
         }
 
     @classmethod
@@ -114,4 +125,6 @@ def deserialize(cls, data):
             data["downtime"],
             data["downtime_expected"],
             data["setup_time"],
-            data["throttle_pcent"])
+            data["throttle_pcent"],
+            data["dirty_limit_throttle_time_per_full"],
+            data["dirty_limit_ring_full_time"])
diff --git a/tests/migration/guestperf/scenario.py b/tests/migration/guestperf/scenario.py
index de70d9b..22aacb3 100644
--- a/tests/migration/guestperf/scenario.py
+++ b/tests/migration/guestperf/scenario.py
@@ -30,7 +30,9 @@ def __init__(self, name,
                  auto_converge=False, auto_converge_step=10,
                  compression_mt=False, compression_mt_threads=1,
                  compression_xbzrle=False, compression_xbzrle_cache=10,
-                 multifd=False, multifd_channels=2):
+                 multifd=False, multifd_channels=2,
+                 dirty_limit=False, x_vcpu_dirty_limit_period=500,
+                 x_vcpu_dirty_limit=1):
 
         self._name = name
 
@@ -60,6 +62,10 @@ def __init__(self, name,
         self._multifd = multifd
         self._multifd_channels = multifd_channels
 
+        self._dirty_limit = dirty_limit
+        self._x_vcpu_dirty_limit_period = x_vcpu_dirty_limit_period
+        self._x_vcpu_dirty_limit = x_vcpu_dirty_limit
+
     def serialize(self):
         return {
             "name": self._name,
@@ -79,6 +85,9 @@ def serialize(self):
             "compression_xbzrle_cache": self._compression_xbzrle_cache,
             "multifd": self._multifd,
             "multifd_channels": self._multifd_channels,
+            "dirty_limit": self._dirty_limit,
+            "x_vcpu_dirty_limit_period": self._x_vcpu_dirty_limit_period,
+            "x_vcpu_dirty_limit": self._x_vcpu_dirty_limit,
         }
 
     @classmethod
diff --git a/tests/migration/guestperf/shell.py b/tests/migration/guestperf/shell.py
index 559616f..c51e9a6 100644
--- a/tests/migration/guestperf/shell.py
+++ b/tests/migration/guestperf/shell.py
@@ -132,6 +132,17 @@ def __init__(self):
         parser.add_argument("--multifd-channels", dest="multifd_channels",
                             default=2, type=int)
 
+        parser.add_argument("--dirty-limit", dest="dirty_limit", default=False,
+                            action="store_true")
+
+        parser.add_argument("--x-vcpu-dirty-limit-period",
+                            dest="x_vcpu_dirty_limit_period",
+                            default=500, type=int)
+
+        parser.add_argument("--x-vcpu-dirty-limit",
+                            dest="x_vcpu_dirty_limit",
+                            default=1, type=int)
+
     def get_scenario(self, args):
         return Scenario(name="perfreport",
                         downtime=args.downtime,
@@ -155,7 +166,12 @@ def get_scenario(self, args):
                         compression_xbzrle_cache=args.compression_xbzrle_cache,
 
                         multifd=args.multifd,
-                        multifd_channels=args.multifd_channels)
+                        multifd_channels=args.multifd_channels,
+
+                        dirty_limit=args.dirty_limit,
+                        x_vcpu_dirty_limit_period=
+                            args.x_vcpu_dirty_limit_period,
+                        x_vcpu_dirty_limit=args.x_vcpu_dirty_limit)
 
     def run(self, argv):
         args = self._parser.parse_args(argv)
-- 
1.8.3.1


