Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7286FEA77
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 05:59:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwxOQ-0007fU-DW; Wed, 10 May 2023 23:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOO-0007ez-GL
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOD-0005Kc-Rp
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683777288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NnjvUGk+e/reXokSBdweMds3juxmlQvPU+doFPG8ofc=;
 b=YHc5y6ctEhBSxTjY6+gb18r6g/GEITV1kOGZfsQFGJbqtm4JBO5wptQNOjAjIc4Iqu+Zln
 vMLuMmFTv4mjv7tMekRbgPy8IJa/zkIC2qDj7/nQtSGyI4DSkIph626blhDmEA/5U7cdPn
 4EjLWnMV5O7oBL/N5diMjWxncWTMvP0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-NPHpLntuNVqjoxt-eAe45Q-1; Wed, 10 May 2023 23:54:44 -0400
X-MC-Unique: NPHpLntuNVqjoxt-eAe45Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62415885623;
 Thu, 11 May 2023 03:54:44 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9FD140C2076;
 Thu, 11 May 2023 03:54:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 10/27] mkvenv: work around broken pip installations on Debian
 10
Date: Wed, 10 May 2023 23:54:18 -0400
Message-Id: <20230511035435.734312-11-jsnow@redhat.com>
In-Reply-To: <20230511035435.734312-1-jsnow@redhat.com>
References: <20230511035435.734312-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a workaround intended for Debian 10, where the debian-patched
pip does not function correctly if accessed from within a virtual
environment.

We don't support Debian 10 as a build platform any longer, though we do
still utilize it for our build-tricore-softmmu CI test. It's also
possible that this bug might appear on other derivative platforms and
this workaround may prove useful.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 68 ++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 16 deletions(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 7a9a14124d..1e072b3df3 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -230,26 +230,26 @@ def need_ensurepip() -> bool:
     return True
 
 
-def check_ensurepip(with_pip: bool) -> None:
+def check_ensurepip(prefix: str = "", suggest_remedy: bool = False) -> None:
     """
     Check that we have ensurepip.
 
     Raise a fatal exception with a helpful hint if it isn't available.
     """
-    if not with_pip:
-        return
-
     if not find_spec("ensurepip"):
         msg = (
             "Python's ensurepip module is not found.\n"
             "It's normally part of the Python standard library, "
             "maybe your distribution packages it separately?\n"
-            "Either install ensurepip, or alleviate the need for it in the "
-            "first place by installing pip and setuptools for "
-            f"'{sys.executable}'.\n"
-            "(Hint: Debian puts ensurepip in its python3-venv package.)"
+            "(Debian puts ensurepip in its python3-venv package.)\n"
         )
-        raise Ouch(msg)
+        if suggest_remedy:
+            msg += (
+                "Either install ensurepip, or alleviate the need for it in the"
+                " first place by installing pip and setuptools for "
+                f"'{sys.executable}'.\n"
+            )
+        raise Ouch(prefix + msg)
 
     # ensurepip uses pyexpat, which can also go missing on us:
     if not find_spec("pyexpat"):
@@ -257,12 +257,15 @@ def check_ensurepip(with_pip: bool) -> None:
             "Python's pyexpat module is not found.\n"
             "It's normally part of the Python standard library, "
             "maybe your distribution packages it separately?\n"
-            "Either install pyexpat, or alleviate the need for it in the "
-            "first place by installing pip and setuptools for "
-            f"'{sys.executable}'.\n\n"
-            "(Hint: NetBSD's pkgsrc debundles this to e.g. 'py310-expat'.)"
+            "(NetBSD's pkgsrc debundles this to e.g. 'py310-expat'.)\n"
         )
-        raise Ouch(msg)
+        if suggest_remedy:
+            msg += (
+                "Either install pyexpat, or alleviate the need for it in the "
+                "first place by installing pip and setuptools for "
+                f"'{sys.executable}'.\n"
+            )
+        raise Ouch(prefix + msg)
 
 
 def make_venv(  # pylint: disable=too-many-arguments
@@ -310,7 +313,8 @@ def make_venv(  # pylint: disable=too-many-arguments
         with_pip = True if not system_site_packages else need_ensurepip()
         logger.debug("with_pip unset, choosing %s", with_pip)
 
-    check_ensurepip(with_pip)
+    if with_pip:
+        check_ensurepip(suggest_remedy=True)
 
     if symlinks is None:
         # Default behavior of standard venv CLI
@@ -534,6 +538,36 @@ def _get_entry_points() -> Iterator[Dict[str, str]]:
         logger.debug("wrote '%s'", script_path)
 
 
+def checkpip() -> None:
+    """
+    Debian10 has a pip that's broken when used inside of a virtual environment.
+
+    We try to detect and correct that case here.
+    """
+    try:
+        # pylint: disable=import-outside-toplevel,unused-import,import-error
+        import pip._internal  # type: ignore  # noqa: F401
+
+        logger.debug("pip appears to be working correctly.")
+        return
+    except ModuleNotFoundError as exc:
+        if exc.name == "pip._internal":
+            # Uh, fair enough. They did say "internal".
+            # Let's just assume it's fine.
+            return
+        logger.warning("pip appears to be malfunctioning: %s", str(exc))
+
+    check_ensurepip("pip appears to be non-functional, and ")
+
+    logger.debug("Attempting to repair pip ...")
+    subprocess.run(
+        (sys.executable, "-m", "ensurepip"),
+        stdout=subprocess.DEVNULL,
+        check=True,
+    )
+    logger.debug("Pip is now (hopefully) repaired!")
+
+
 def pkgname_from_depspec(dep_spec: str) -> str:
     """
     Parse package name out of a PEP-508 depspec.
@@ -748,7 +782,9 @@ def post_venv_setup() -> None:
     This is intended to be run *inside the venv* after it is created.
     """
     logger.debug("post_venv_setup()")
-    # Generate a 'pip' script so the venv is usable in a normal
+    # Test for a broken pip (Debian 10 or derivative?) and fix it if needed
+    checkpip()
+    # Finally, generate a 'pip' script so the venv is usable in a normal
     # way from the CLI. This only happens when we inherited pip from a
     # parent/system-site and haven't run ensurepip in some way.
     generate_console_scripts(["pip"])
-- 
2.40.0


