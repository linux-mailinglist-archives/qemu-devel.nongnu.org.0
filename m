Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA0D23698
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 14:55:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35131 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hShpY-0007pD-1H
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 08:55:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hShhi-0002Tv-1v
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:47:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hShhg-0006CI-09
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:47:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hShhd-0005w2-V2
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:47:42 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9748C307D860;
	Mon, 20 May 2019 12:47:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A25E5129E;
	Mon, 20 May 2019 12:47:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 02EDA11AB8; Mon, 20 May 2019 14:47:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 14:47:04 +0200
Message-Id: <20190520124716.30472-3-kraxel@redhat.com>
In-Reply-To: <20190520124716.30472-1-kraxel@redhat.com>
References: <20190520124716.30472-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 20 May 2019 12:47:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 02/14] tests/vm: python3 fixes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Ed Maste <emaste@freebsd.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Kamil Rytarowski <kamil@netbsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add proper unicode handling when processing strings.
Also need to explicitly say we want int not float.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/vm/basevm.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 0556bdcf9e9f..3126fb10a819 100755
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -73,7 +73,7 @@ class BaseVM(object):
             "-vnc", "127.0.0.1:0,to=20",
             "-serial", "file:%s" % os.path.join(self._tmpdir, "serial.out")]
         if vcpus and vcpus > 1:
-            self._args += ["-smp", str(vcpus)]
+            self._args += ["-smp", "%d" % vcpus]
         if kvm_available(self.arch):
             self._args += ["-enable-kvm"]
         else:
@@ -85,12 +85,12 @@ class BaseVM(object):
             if not sha256sum:
                 return True
             checksum = subprocess.check_output(["sha256sum", fname]).split()[0]
-            return sha256sum == checksum
+            return sha256sum == checksum.decode("utf-8")
 
         cache_dir = os.path.expanduser("~/.cache/qemu-vm/download")
         if not os.path.exists(cache_dir):
             os.makedirs(cache_dir)
-        fname = os.path.join(cache_dir, hashlib.sha1(url).hexdigest())
+        fname = os.path.join(cache_dir, hashlib.sha1(url.encode("utf-8")).hexdigest())
         if os.path.exists(fname) and check_sha256sum(fname):
             return fname
         logging.debug("Downloading %s to %s...", url, fname)
@@ -134,7 +134,7 @@ class BaseVM(object):
         raise NotImplementedError
 
     def add_source_dir(self, src_dir):
-        name = "data-" + hashlib.sha1(src_dir).hexdigest()[:5]
+        name = "data-" + hashlib.sha1(src_dir.encode("utf-8")).hexdigest()[:5]
         tarfile = os.path.join(self._tmpdir, name + ".tar")
         logging.debug("Creating archive %s for src_dir dir: %s", tarfile, src_dir)
         subprocess.check_call(["./scripts/archive-source.sh", tarfile],
@@ -256,7 +256,7 @@ def main(vmcls):
             vm.add_source_dir(args.build_qemu)
             cmd = [vm.BUILD_SCRIPT.format(
                    configure_opts = " ".join(argv),
-                   jobs=args.jobs,
+                   jobs=int(args.jobs),
                    target=args.build_target,
                    verbose = "V=1" if args.verbose else "")]
         else:
-- 
2.18.1


