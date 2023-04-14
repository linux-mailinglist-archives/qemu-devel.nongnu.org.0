Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00156E1C0F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 07:56:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnCP6-0007Ph-5F; Fri, 14 Apr 2023 01:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOy-0007OZ-Ul
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOk-0000JB-7F
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681451698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5H8/uHXs7YBOGUYE/CWcIe1725RoVciWQKk9ZWDMi8=;
 b=LaVxqvZx1MBEa2WREYavc2LGUV5mnLF9YdIvCzZ0TI4MiB3zS3pMpFJPum4N7vlWSFTgjS
 UAX635b2Lvr6IMSXVWbOFKFJGgPL+uFueBPabuwZXc9/iw1yToO8iXYJT/YZ9Uphbd86QQ
 +94Ue+5/HK4PG1aZz4pp74OnOCUypls=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-KzR5LbaXMPC3ND56hAyc1g-1; Fri, 14 Apr 2023 01:54:55 -0400
X-MC-Unique: KzR5LbaXMPC3ND56hAyc1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1842101A552;
 Fri, 14 Apr 2023 05:54:54 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FAC0C1602A;
 Fri, 14 Apr 2023 05:54:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Kyle Evans <kevans@freebsd.org>,
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 07/10] mkvenv: work around broken pip installations on
 Debian 10
Date: Fri, 14 Apr 2023 01:54:46 -0400
Message-Id: <20230414055449.4028284-8-jsnow@redhat.com>
In-Reply-To: <20230414055449.4028284-1-jsnow@redhat.com>
References: <20230414055449.4028284-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This is a workaround intended for Debian 10, where the debian-patched
pip does not function correctly if accessed from within a virtual
environment.

We don't support Debian 10 any longer, but it's possible that this bug
might appear on other derivative platforms and this workaround may prove
useful.

RFC, a note from Paolo:

"BTW, another way to repair Debian 10's pip is to create a symbolic link
to sys.base_prefix + '/share/python-wheels' in sys.prefix +
'/share/python-wheels'. Since this is much faster, perhaps it can be
done unconditionally [...] ?"

I was slightly apprehensive about this as it felt "hackier", but it is
indeed a lot less code and much faster. It's probably low-risk. Should
we do that instead, or should we just scrap any fix at all under the
premise that Debian 10 support is dropped anyway?

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 61 +++++++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 17 deletions(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 317697a953..6e1a979355 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -103,27 +103,25 @@ def need_ensurepip() -> bool:
     return True
 
 
-def check_ensurepip(with_pip: bool) -> None:
+def check_ensurepip(prefix: str = '', suggest_remedy: bool = False) -> None:
     """
     Check that we have ensurepip.
 
     Raise a fatal exception with a helpful hint if it isn't available.
     """
-    if not with_pip:
-        return
-
     if not find_spec("ensurepip"):
         msg = ("Python's ensurepip module is not found.\n"
 
                "It's normally part of the Python standard library, "
                "maybe your distribution packages it separately?\n"
 
-               "Either install ensurepip, or alleviate the need for it in the "
-               "first place by installing pip and setuptools for "
-               f"'{sys.executable}'.\n"
-
-               "(Hint: Debian puts ensurepip in its python3-venv package.)")
-        raise Ouch(msg)
+               "(Debian puts ensurepip in its python3-venv package.)\n")
+        if suggest_remedy:
+            msg += (
+                "Either install ensurepip, or alleviate the need for it in the "
+                "first place by installing pip and setuptools for "
+                f"'{sys.executable}'.\n")
+        raise Ouch(prefix + msg)
 
     # ensurepip uses pyexpat, which can also go missing on us:
     if not find_spec("pyexpat"):
@@ -132,12 +130,13 @@ def check_ensurepip(with_pip: bool) -> None:
                "It's normally part of the Python standard library, "
                "maybe your distribution packages it separately?\n"
 
-               "Either install pyexpat, or alleviate the need for it in the "
-               "first place by installing pip and setuptools for "
-               f"'{sys.executable}'.\n\n"
-
-               "(Hint: NetBSD's pkgsrc debundles this to e.g. 'py310-expat'.)")
-        raise Ouch(msg)
+               "(NetBSD's pkgsrc debundles this to e.g. 'py310-expat'.)\n")
+        if suggest_remedy:
+            msg += (
+                "Either install pyexpat, or alleviate the need for it in the "
+                "first place by installing pip and setuptools for "
+                f"'{sys.executable}'.\n")
+        raise Ouch(prefix + msg)
 
 
 def make_venv(  # pylint: disable=too-many-arguments
@@ -169,7 +168,8 @@ def make_venv(  # pylint: disable=too-many-arguments
         with_pip = True if not system_site_packages else need_ensurepip()
         logger.debug("with_pip unset, choosing %s", with_pip)
 
-    check_ensurepip(with_pip)
+    if with_pip:
+        check_ensurepip(suggest_remedy=True)
 
     if symlinks is None:
         # Default behavior of standard venv CLI
@@ -349,6 +349,31 @@ def _get_entry_points() -> Iterator[Dict[str, str]]:
         logger.debug("wrote '%s'", script_path)
 
 
+def checkpip():
+    """
+    Debian10 has a pip that's broken when used inside of a virtual environment.
+
+    We try to detect and correct that case here.
+    """
+    try:
+        import pip._internal
+        logger.debug("pip appears to be working correctly.")
+        return
+    except ModuleNotFoundError as exc:
+        if exc.name == 'pip._internal':
+            # Uh, fair enough. They did say "internal".
+            # Let's just assume it's fine.
+            return
+        logger.warning("pip appears to be malfunctioning: %s", str(exc))
+
+    check_ensurepip("pip appears to be non-functional, and ")
+
+    logging.debug("Attempting to repair pip ...")
+    subprocess.run((sys.executable, '-m', 'ensurepip'),
+                   stdout=subprocess.DEVNULL, check=True)
+    logging.debug("Pip is now (hopefully) repaired!")
+
+
 def post_venv_setup(bin_path: str, packages: Sequence[str] = ()) -> None:
     """
     This is intended to be run *inside the venv* after it is created.
@@ -358,6 +383,8 @@ def post_venv_setup(bin_path: str, packages: Sequence[str] = ()) -> None:
                  bin_path, packages)
     generate_console_scripts(python_path, bin_path, packages)
 
+    # Test for a broken pip (Debian 10 or derivative?) and fix it if needed
+    checkpip()
 
 def main() -> int:
     """CLI interface to make_qemu_venv. See module docstring."""
-- 
2.39.2


