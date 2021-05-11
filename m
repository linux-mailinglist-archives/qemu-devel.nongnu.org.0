Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA2B37AAA0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:25:29 +0200 (CEST)
Received: from localhost ([::1]:37402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUGH-0002Ev-0w
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU1m-0000Lt-37
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU1j-0004vE-VO
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620745827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iISPOJMl6FBrBs5a39QG2IKjK56eVxk9sjFG32WpU9I=;
 b=BTBkmXF7N0N47f3QChBmK4Q3xRHWRqKFwqy0S3ZYfxMWTRzE97i5cwUOYD0OUQlCkrZyGP
 Hg/ZvXZBa2YNl2D4e4oi5AwafUjtnuC14VQZuv+7McZH7SV5cUwvcYUvERqGALBUxaUPR7
 m4/TnJLslPzKTz/fBXrfLTGDNWTBZVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-2lM6o7oSPfO-_Tct037yqA-1; Tue, 11 May 2021 11:10:25 -0400
X-MC-Unique: 2lM6o7oSPfO-_Tct037yqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8DF280ED8E;
 Tue, 11 May 2021 15:10:23 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-51.ams2.redhat.com
 [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E53CC6A033;
 Tue, 11 May 2021 15:10:17 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, zhukeqian1@huawei.com,
 jiangkunkun@huawei.com, armbru@redhat.com, peter.maydell@linaro.org,
 huangy81@chinatelecom.cn
Subject: [PULL 17/17] tests/migration: introduce multifd into guestperf
Date: Tue, 11 May 2021 16:08:42 +0100
Message-Id: <20210511150842.207155-18-dgilbert@redhat.com>
In-Reply-To: <20210511150842.207155-1-dgilbert@redhat.com>
References: <20210511150842.207155-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman <huangy81@chinatelecom.cn>

Guestperf tool does not cover the multifd-enabled migration
currently, it is worth supporting so that developers can
analysis the migration performance with all kinds of
migration.

To request that multifd is enabled, with 4 channels:
$ ./tests/migration/guestperf.py \
    --multifd --multifd-channels 4 --output output.json

To run the entire standardized set of multifd-enabled
comparisons, with unix migration:
$ ./tests/migration/guestperf-batch.py \
    --dst-host localhost --transport unix \
    --filter compr-multifd* --output outputdir

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Message-Id: <cfeeb04d17ad932c42a9871294058b77429ad1b7.1616171924.git.huangy81@chinatelecom.cn>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/migration/guestperf/comparison.py | 14 ++++++++++++++
 tests/migration/guestperf/engine.py     | 16 ++++++++++++++++
 tests/migration/guestperf/scenario.py   | 12 ++++++++++--
 tests/migration/guestperf/shell.py      | 10 +++++++++-
 4 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/tests/migration/guestperf/comparison.py b/tests/migration/guestperf/comparison.py
index ba2edbe546..c03b3f6d7e 100644
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
+                 multifd=True, multifd_channels=2),
+        Scenario("compr-multifd-channels-8",
+                 multifd=True, multifd_channels=8),
+        Scenario("compr-multifd-channels-32",
+                 multifd=True, multifd_channels=32),
+        Scenario("compr-multifd-channels-64",
+                 multifd=True, multifd_channels=64),
+    ]),
 ]
diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 6b49aed579..208e095794 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -188,6 +188,22 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
                                    1024 * 1024 * 1024 / 100 *
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
index 28ef36c26d..de70d9b2f5 100644
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
index f838888809..8a809e3dda 100644
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
2.31.1


