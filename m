Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3B16D0D55
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:05:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phweF-0004mH-83; Thu, 30 Mar 2023 14:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdx-00046R-M3
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:05:01 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdv-0002Cs-9k
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:05:01 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7D73F21A28;
 Thu, 30 Mar 2023 18:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBOn1F0mFy3EHuJgQ6+dEFU+zvI08FJIqP8WSJO233c=;
 b=JHx7iQ3kwt4vaVjtMh723zyw14+XN7UJttIuJN06F7zqynrcbDnXbihHca8b7kPwFGRDcz
 L7yKmK4tJTXTLiBnc3pK5Fi1xrok7s/4WskVBK0aNyE1rJhYGhv9uoo1wIZrHDjThSNwHy
 yajTG6cGRl/4Tzum7wsi7LHaTrhGFjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBOn1F0mFy3EHuJgQ6+dEFU+zvI08FJIqP8WSJO233c=;
 b=CbMTRIRGQa7rslgowzPZc7GWH/0qaHVIE5CvJbVOdcg+o5hYbXE0d4HWVBjmhj+aUrOPzs
 tedWINadFerVFMBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D45C1348E;
 Thu, 30 Mar 2023 18:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aGEVDUXPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:53 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC PATCH v1 26/26] tests/migration/guestperf: Add file,
 fixed-ram and direct-io support
Date: Thu, 30 Mar 2023 15:03:36 -0300
Message-Id: <20230330180336.2791-27-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Add support to the new migration features:
- 'file' transport;
- 'fixed-ram' stream format capability;
- 'direct-io' parameter;

Usage:
$ ./guestperf.py --binary <path/to/qemu> --initrd <path/to/initrd-stress.img> \
                 --transport file --dst-file migfile --multifd --fixed-ram \
		 --multifd-channels 4 --output fixed-ram.json  --verbose

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/migration/guestperf/engine.py   | 38 +++++++++++++++++++++++++--
 tests/migration/guestperf/scenario.py | 14 ++++++++--
 tests/migration/guestperf/shell.py    | 18 +++++++++++--
 3 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index e69d16a62c..a465336184 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -35,10 +35,11 @@
 class Engine(object):
 
     def __init__(self, binary, dst_host, kernel, initrd, transport="tcp",
-                 sleep=15, verbose=False, debug=False):
+                 sleep=15, verbose=False, debug=False, dst_file="/tmp/migfile"):
 
         self._binary = binary # Path to QEMU binary
         self._dst_host = dst_host # Hostname of target host
+        self._dst_file = dst_file # Path to file (for file transport)
         self._kernel = kernel # Path to kernel image
         self._initrd = initrd # Path to stress initrd
         self._transport = transport # 'unix' or 'tcp' or 'rdma'
@@ -203,6 +204,23 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
             resp = dst.command("migrate-set-parameters",
                                multifd_channels=scenario._multifd_channels)
 
+        if scenario._fixed_ram:
+            resp = src.command("migrate-set-capabilities",
+                               capabilities = [
+                                   { "capability": "fixed-ram",
+                                     "state": True }
+                               ])
+            resp = dst.command("migrate-set-capabilities",
+                               capabilities = [
+                                   { "capability": "fixed-ram",
+                                     "state": True }
+                               ])
+
+        if scenario._direct_io:
+            resp = src.command("migrate-set-parameters",
+                               direct_io=scenario._direct_io)
+
+
         resp = src.command("migrate", uri=connect_uri)
 
         post_copy = False
@@ -233,6 +251,11 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
                     progress_history.append(progress)
 
                 if progress._status == "completed":
+                    if connect_uri[0:5] == "file:":
+                        if self._verbose:
+                            print("Migrating incoming")
+                        dst.command("migrate-incoming", uri=connect_uri)
+
                     if self._verbose:
                         print("Sleeping %d seconds for final guest workload run" % self._sleep)
                     sleep_secs = self._sleep
@@ -357,7 +380,11 @@ def _get_dst_args(self, hardware, uri):
         if self._dst_host != "localhost":
             tunnelled = True
         argv = self._get_common_args(hardware, tunnelled)
-        return argv + ["-incoming", uri]
+
+        incoming = ["-incoming", uri]
+        if uri[0:5] == "file:":
+            incoming = ["-incoming", "defer"]
+        return argv + incoming
 
     @staticmethod
     def _get_common_wrapper(cpu_bind, mem_bind):
@@ -417,6 +444,10 @@ def run(self, hardware, scenario, result_dir=os.getcwd()):
                 os.remove(monaddr)
             except:
                 pass
+        elif self._transport == "file":
+            if self._dst_host != "localhost":
+                raise Exception("Use unix migration transport for non-local host")
+            uri = "file:%s" % self._dst_file
 
         if self._dst_host != "localhost":
             dstmonaddr = ("localhost", 9001)
@@ -453,6 +484,9 @@ def run(self, hardware, scenario, result_dir=os.getcwd()):
             if self._dst_host == "localhost" and os.path.exists(dstmonaddr):
                 os.remove(dstmonaddr)
 
+            if uri[0:5] == "file:" and os.path.exists(uri[5:]):
+                os.remove(uri[5:])
+
             if self._verbose:
                 print("Finished migration")
 
diff --git a/tests/migration/guestperf/scenario.py b/tests/migration/guestperf/scenario.py
index de70d9b2f5..29b6af41ac 100644
--- a/tests/migration/guestperf/scenario.py
+++ b/tests/migration/guestperf/scenario.py
@@ -30,7 +30,8 @@ def __init__(self, name,
                  auto_converge=False, auto_converge_step=10,
                  compression_mt=False, compression_mt_threads=1,
                  compression_xbzrle=False, compression_xbzrle_cache=10,
-                 multifd=False, multifd_channels=2):
+                 multifd=False, multifd_channels=2,
+                 fixed_ram=False, direct_io=False):
 
         self._name = name
 
@@ -60,6 +61,11 @@ def __init__(self, name,
         self._multifd = multifd
         self._multifd_channels = multifd_channels
 
+        self._fixed_ram = fixed_ram
+
+        self._direct_io = direct_io
+
+
     def serialize(self):
         return {
             "name": self._name,
@@ -79,6 +85,8 @@ def serialize(self):
             "compression_xbzrle_cache": self._compression_xbzrle_cache,
             "multifd": self._multifd,
             "multifd_channels": self._multifd_channels,
+            "fixed_ram": self._fixed_ram,
+            "direct_io": self._direct_io,
         }
 
     @classmethod
@@ -100,4 +108,6 @@ def deserialize(cls, data):
             data["compression_xbzrle"],
             data["compression_xbzrle_cache"],
             data["multifd"],
-            data["multifd_channels"])
+            data["multifd_channels"],
+            data["fixed_ram"],
+            data["direct_io"])
diff --git a/tests/migration/guestperf/shell.py b/tests/migration/guestperf/shell.py
index 8a809e3dda..0cb402adce 100644
--- a/tests/migration/guestperf/shell.py
+++ b/tests/migration/guestperf/shell.py
@@ -48,6 +48,7 @@ def __init__(self):
         parser.add_argument("--kernel", dest="kernel", default="/boot/vmlinuz-%s" % platform.release())
         parser.add_argument("--initrd", dest="initrd", default="tests/migration/initrd-stress.img")
         parser.add_argument("--transport", dest="transport", default="unix")
+        parser.add_argument("--dst-file", dest="dst_file")
 
 
         # Hardware args
@@ -71,7 +72,8 @@ def get_engine(self, args):
                       transport=args.transport,
                       sleep=args.sleep,
                       debug=args.debug,
-                      verbose=args.verbose)
+                      verbose=args.verbose,
+                      dst_file=args.dst_file)
 
     def get_hardware(self, args):
         def split_map(value):
@@ -127,6 +129,13 @@ def __init__(self):
         parser.add_argument("--multifd-channels", dest="multifd_channels",
                             default=2, type=int)
 
+        parser.add_argument("--fixed-ram", dest="fixed_ram", default=False,
+                            action="store_true")
+
+        parser.add_argument("--direct-io", dest="direct_io", default=False,
+                            action="store_true")
+
+
     def get_scenario(self, args):
         return Scenario(name="perfreport",
                         downtime=args.downtime,
@@ -150,7 +159,12 @@ def get_scenario(self, args):
                         compression_xbzrle_cache=args.compression_xbzrle_cache,
 
                         multifd=args.multifd,
-                        multifd_channels=args.multifd_channels)
+                        multifd_channels=args.multifd_channels,
+
+                        fixed_ram=args.fixed_ram,
+
+                        direct_io=args.direct_io)
+
 
     def run(self, argv):
         args = self._parser.parse_args(argv)
-- 
2.35.3


