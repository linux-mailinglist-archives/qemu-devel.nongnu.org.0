Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A233C6ED5E9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:09:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2Ov-0007nV-Pa; Mon, 24 Apr 2023 16:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Os-0007jX-EY
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Oq-0000wv-As
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kOo7dSyIG8DYno+AxpA5II1Cc5cRU+Bp4ZgeSQSSi6c=;
 b=bXN0+YXESOmW2d/xC3hTa/4d6OaXfdgno/aFC9cTCqDWg9KzqKaODpvKfvsGALYW9Ooztz
 4A2/33KFlMeaSrKQP4hiX546mQdP3M+2/xkCguRw2ajhmtmvrF3EmfxDpdIAdTSybTG3q2
 1CWq30P/1HSGAAM0Iy0HtMkkH0ZLLg8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-3IVgkhjoN9OBRVC9GlbUdA-1; Mon, 24 Apr 2023 16:02:55 -0400
X-MC-Unique: 3IVgkhjoN9OBRVC9GlbUdA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB329101A54F;
 Mon, 24 Apr 2023 20:02:54 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23E891121318;
 Mon, 24 Apr 2023 20:02:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v3 07/20] mkvenv: add nested venv workaround
Date: Mon, 24 Apr 2023 16:02:35 -0400
Message-Id: <20230424200248.1183394-8-jsnow@redhat.com>
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Python virtual environments do not typically nest; they may inherit from
the top-level system packages or not at all.

For our purposes, it would be convenient to emulate "nested" virtual
environments to allow callers of the configure script to install
specific versions of python utilities in order to test build system
features, utility version compatibility, etc.

While it is possible to install packages into the system environment
(say, by using the --user flag), it's nicer to install test packages
into a totally isolated environment instead.

As detailed in https://www.qemu.org/2023/03/24/python/, Emulate a nested
venv environment by using .pth files installed into the site-packages
folder that points to the parent environment when appropriate.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 72 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 3 deletions(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 445f4eb092..45d1b772e5 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -51,9 +51,11 @@
 import os
 from pathlib import Path
 import re
+import site
 import stat
 import subprocess
 import sys
+import sysconfig
 import traceback
 from types import SimpleNamespace
 from typing import (
@@ -74,6 +76,11 @@
 logger = logging.getLogger("mkvenv")
 
 
+def inside_a_venv() -> bool:
+    """Returns True if it is executed inside of a virtual environment."""
+    return sys.prefix != sys.base_prefix
+
+
 class Ouch(RuntimeError):
     """An Exception class we can't confuse with a builtin."""
 
@@ -82,9 +89,15 @@ class QemuEnvBuilder(venv.EnvBuilder):
     """
     An extension of venv.EnvBuilder for building QEMU's configure-time venv.
 
-    The only functional change is that it adds the ability to regenerate
-    console_script shims for packages available via system_site
-    packages.
+    The primary differences are:
+
+    (1) It adds the ability to regenerate console_script shims for
+    packages available via system_site_packages for any packages
+    specified by the 'script_packages' argument
+
+    (2) It emulates a "nested" virtual environment when invoked from
+    inside of an existing virtual environment by including packages from
+    the parent.
 
     Parameters for base class init:
       - system_site_packages: bool = False
@@ -99,11 +112,51 @@ class QemuEnvBuilder(venv.EnvBuilder):
     def __init__(self, *args: Any, **kwargs: Any) -> None:
         logger.debug("QemuEnvBuilder.__init__(...)")
         self.script_packages = kwargs.pop("script_packages", ())
+
+        # For nested venv emulation:
+        self.use_parent_packages = False
+        if inside_a_venv():
+            # Include parent packages only if we're in a venv and
+            # system_site_packages was True.
+            self.use_parent_packages = kwargs.pop(
+                "system_site_packages", False
+            )
+            # Include system_site_packages only when the parent,
+            # The venv we are currently in, also does so.
+            kwargs["system_site_packages"] = sys.base_prefix in site.PREFIXES
+
         super().__init__(*args, **kwargs)
 
         # Make the context available post-creation:
         self._context: Optional[SimpleNamespace] = None
 
+    def compute_venv_libpath(self, context: SimpleNamespace) -> str:
+        """
+        Compatibility wrapper for context.lib_path for Python < 3.12
+        """
+        # Python 3.12+, not strictly necessary because it's documented
+        # to be the same as 3.10 code below:
+        if sys.version_info >= (3, 12):
+            return context.lib_path
+
+        # Python 3.10+
+        if "venv" in sysconfig.get_scheme_names():
+            return sysconfig.get_path(
+                "purelib", scheme="venv", vars={"base": context.env_dir}
+            )
+
+        # For Python <= 3.9 we need to hardcode this. Fortunately the
+        # code below was the same in Python 3.6-3.10, so there is only
+        # one case.
+        if sys.platform == "win32":
+            return os.path.join(context.env_dir, "Lib", "site-packages")
+        return os.path.join(
+            context.env_dir,
+            "lib",
+            "python%d.%d" % sys.version_info[:2],
+            "site-packages",
+        )
+
     def ensure_directories(self, env_dir: DirType) -> SimpleNamespace:
         logger.debug("ensure_directories(env_dir=%s)", env_dir)
         self._context = super().ensure_directories(env_dir)
@@ -124,6 +177,19 @@ def post_post_setup(self, context: SimpleNamespace) -> None:
         """
         The final, final hook. Enter the venv and run commands inside of it.
         """
+        if self.use_parent_packages:
+            # We're inside of a venv and we want to include the parent
+            # venv's packages.
+            parent_libpath = sysconfig.get_path("purelib")
+            logger.debug("parent_libpath: %s", parent_libpath)
+
+            our_libpath = self.compute_venv_libpath(context)
+            logger.debug("our_libpath: %s", our_libpath)
+
+            pth_file = os.path.join(our_libpath, "nested.pth")
+            with open(pth_file, "w", encoding="UTF-8") as file:
+                file.write(parent_libpath + os.linesep)
+
         args = [
             context.env_exe,
             __file__,
-- 
2.39.2


