Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D9F380EB3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:18:20 +0200 (CEST)
Received: from localhost ([::1]:47644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbS8-0008Dg-05
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawg-0005nm-Mo
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawd-0005yq-IZ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OcC0s6nNByGRH1N2Y38t2CkOB1c6Qov0rc2isEqLJf8=;
 b=GhSKAG1KmvgPXGrXTTcYiIiLum4QESxw9+vkRYZRbBUX9H1Dda5591+2VH8n1D7K8rDH7E
 iEc2kjVstsUJbgl1soBP+NLrvnGcrWXxjG0mE9OnZiuu3pvaLwDpU/tiaI/yLeoaDG5sOW
 or5t5XwR4FvHVp6BNz4wWREv28EMlE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-ORFoxgmvNsGLOzaxknB77g-1; Fri, 14 May 2021 12:45:42 -0400
X-MC-Unique: ORFoxgmvNsGLOzaxknB77g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90CBA107ACC7;
 Fri, 14 May 2021 16:45:41 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35E7110016FC;
 Fri, 14 May 2021 16:45:41 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/19] qemu-iotests: fix pylint 2.8 consider-using-with error
Date: Fri, 14 May 2021 18:45:07 +0200
Message-Id: <20210514164514.1057680-13-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

pylint 2.8 introduces consider-using-with error, suggesting
to use the 'with' block statement when possible.

Modify all subprocess.Popen call to use the 'with' statement,
except the one in __init__ of QemuIoInteractive class, since
it is assigned to a class field and used in other methods.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210510190449.65948-1-eesposit@redhat.com>
[mreitz: Disable bad-option-value warning in the iotests' pylintrc, so
         that disabling consider-using-with in QemuIoInteractive will
         not produce a warning in pre-2.8 pylint versions]
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py    | 65 ++++++++++++++++----------------
 tests/qemu-iotests/pylintrc      |  3 ++
 tests/qemu-iotests/testrunner.py | 22 +++++------
 3 files changed, 47 insertions(+), 43 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 5ead94229f..777fa2ec0e 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -112,15 +112,14 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
     Run a tool and return both its output and its exit code
     """
     stderr = subprocess.STDOUT if connect_stderr else None
-    subp = subprocess.Popen(args,
-                            stdout=subprocess.PIPE,
-                            stderr=stderr,
-                            universal_newlines=True)
-    output = subp.communicate()[0]
-    if subp.returncode < 0:
-        cmd = ' '.join(args)
-        sys.stderr.write(f'{tool} received signal {-subp.returncode}: {cmd}\n')
-    return (output, subp.returncode)
+    with subprocess.Popen(args, stdout=subprocess.PIPE,
+                          stderr=stderr, universal_newlines=True) as subp:
+        output = subp.communicate()[0]
+        if subp.returncode < 0:
+            cmd = ' '.join(args)
+            sys.stderr.write(f'{tool} received signal \
+                               {-subp.returncode}: {cmd}\n')
+        return (output, subp.returncode)
 
 def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     """
@@ -236,6 +235,9 @@ def qemu_io_silent_check(*args):
 class QemuIoInteractive:
     def __init__(self, *args):
         self.args = qemu_io_args_no_fmt + list(args)
+        # We need to keep the Popen objext around, and not
+        # close it immediately. Therefore, disable the pylint check:
+        # pylint: disable=consider-using-with
         self._p = subprocess.Popen(self.args, stdin=subprocess.PIPE,
                                    stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT,
@@ -309,22 +311,22 @@ def qemu_nbd_popen(*args):
     cmd.extend(args)
 
     log('Start NBD server')
-    p = subprocess.Popen(cmd)
-    try:
-        while not os.path.exists(pid_file):
-            if p.poll() is not None:
-                raise RuntimeError(
-                    "qemu-nbd terminated with exit code {}: {}"
-                    .format(p.returncode, ' '.join(cmd)))
-
-            time.sleep(0.01)
-        yield
-    finally:
-        if os.path.exists(pid_file):
-            os.remove(pid_file)
-        log('Kill NBD server')
-        p.kill()
-        p.wait()
+    with subprocess.Popen(cmd) as p:
+        try:
+            while not os.path.exists(pid_file):
+                if p.poll() is not None:
+                    raise RuntimeError(
+                        "qemu-nbd terminated with exit code {}: {}"
+                        .format(p.returncode, ' '.join(cmd)))
+
+                time.sleep(0.01)
+            yield
+        finally:
+            if os.path.exists(pid_file):
+                os.remove(pid_file)
+            log('Kill NBD server')
+            p.kill()
+            p.wait()
 
 def compare_images(img1, img2, fmt1=imgfmt, fmt2=imgfmt):
     '''Return True if two image files are identical'''
@@ -333,13 +335,12 @@ def compare_images(img1, img2, fmt1=imgfmt, fmt2=imgfmt):
 
 def create_image(name, size):
     '''Create a fully-allocated raw image with sector markers'''
-    file = open(name, 'wb')
-    i = 0
-    while i < size:
-        sector = struct.pack('>l504xl', i // 512, i // 512)
-        file.write(sector)
-        i = i + 512
-    file.close()
+    with open(name, 'wb') as file:
+        i = 0
+        while i < size:
+            sector = struct.pack('>l504xl', i // 512, i // 512)
+            file.write(sector)
+            i = i + 512
 
 def image_size(img):
     '''Return image's virtual size'''
diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
index 7a6c0a9474..f2c0b522ac 100644
--- a/tests/qemu-iotests/pylintrc
+++ b/tests/qemu-iotests/pylintrc
@@ -19,6 +19,9 @@ disable=invalid-name,
         too-many-public-methods,
         # pylint warns about Optional[] etc. as unsubscriptable in 3.9
         unsubscriptable-object,
+        # Sometimes we need to disable a newly introduced pylint warning.
+        # Doing so should not produce a warning in older versions of pylint.
+        bad-option-value,
         # These are temporary, and should be removed:
         missing-docstring,
         too-many-return-statements,
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 2f56ac545d..4a6ec421ed 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -246,17 +246,17 @@ def do_run_test(self, test: str) -> TestResult:
 
         t0 = time.time()
         with f_bad.open('w', encoding="utf-8") as f:
-            proc = subprocess.Popen(args, cwd=str(f_test.parent), env=env,
-                                    stdout=f, stderr=subprocess.STDOUT)
-            try:
-                proc.wait()
-            except KeyboardInterrupt:
-                proc.terminate()
-                proc.wait()
-                return TestResult(status='not run',
-                                  description='Interrupted by user',
-                                  interrupted=True)
-            ret = proc.returncode
+            with subprocess.Popen(args, cwd=str(f_test.parent), env=env,
+                                  stdout=f, stderr=subprocess.STDOUT) as proc:
+                try:
+                    proc.wait()
+                except KeyboardInterrupt:
+                    proc.terminate()
+                    proc.wait()
+                    return TestResult(status='not run',
+                                      description='Interrupted by user',
+                                      interrupted=True)
+                ret = proc.returncode
 
         elapsed = round(time.time() - t0, 1)
 
-- 
2.31.1


