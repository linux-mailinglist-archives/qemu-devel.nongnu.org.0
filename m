Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399996ED5D3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:04:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2Ou-0007lJ-BR; Mon, 24 Apr 2023 16:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Oq-0007eQ-RC
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Oo-0000wo-Lr
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vMhulmk5OML72JeUi2RGWnSylGPWl5bnlwsN1SoB3nM=;
 b=XadXVMWJntvB12QbvDzjehsFWrEdj0n+/N/koNCxNk4QlCrvCawAsWa8/FX+QjtI1PP1E9
 p5peq7ZfVOZ+mjP0cQKwUSJD2fXmd5/4/JB81VXsJG5Qan6fGkZn+kO822kpfAZ+jotN/G
 3/XjGo8udN0zgG8UxbW7LOhyBIXbIkk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-uYsexOANN2mSB2g90lY01g-1; Mon, 24 Apr 2023 16:02:54 -0400
X-MC-Unique: uYsexOANN2mSB2g90lY01g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 145F8185A78F;
 Mon, 24 Apr 2023 20:02:54 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58CB91121319;
 Mon, 24 Apr 2023 20:02:53 +0000 (UTC)
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
Subject: [RFC PATCH v3 06/20] mkvenv: work around broken pip installations on
 Debian 10
Date: Mon, 24 Apr 2023 16:02:34 -0400
Message-Id: <20230424200248.1183394-7-jsnow@redhat.com>
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
 python/scripts/mkvenv.py | 67 +++++++++++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 15 deletions(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 4daa652f12..445f4eb092 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -151,26 +151,26 @@ def need_ensurepip() -> bool:
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
@@ -178,12 +178,15 @@ def check_ensurepip(with_pip: bool) -> None:
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
@@ -238,7 +241,8 @@ def make_venv(  # pylint: disable=too-many-arguments
         with_pip = True if not system_site_packages else need_ensurepip()
         logger.debug("with_pip unset, choosing %s", with_pip)
 
-    check_ensurepip(with_pip)
+    if with_pip:
+        check_ensurepip(suggest_remedy=True)
 
     if symlinks is None:
         # Default behavior of standard venv CLI
@@ -430,6 +434,36 @@ def _get_entry_points() -> Iterator[Dict[str, str]]:
         logger.debug("wrote '%s'", script_path)
 
 
+def checkpip() -> None:
+    """
+    Debian10 has a pip that's broken when used inside of a virtual environment.
+
+    We try to detect and correct that case here.
+    """
+    try:
+        # pylint: disable=import-outside-toplevel, unused-import
+        import pip._internal  # noqa: F401
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
+    logging.debug("Attempting to repair pip ...")
+    subprocess.run(
+        (sys.executable, "-m", "ensurepip"),
+        stdout=subprocess.DEVNULL,
+        check=True,
+    )
+    logging.debug("Pip is now (hopefully) repaired!")
+
+
 def post_venv_setup(bin_path: str, packages: Sequence[str] = ()) -> None:
     """
     This is intended to be run *inside the venv* after it is created.
@@ -440,6 +474,9 @@ def post_venv_setup(bin_path: str, packages: Sequence[str] = ()) -> None:
     )
     generate_console_scripts(python_path, bin_path, packages)
 
+    # Test for a broken pip (Debian 10 or derivative?) and fix it if needed
+    checkpip()
+
 
 def _add_create_subcommand(subparsers: Any) -> None:
     subparser = subparsers.add_parser("create", help="create a venv")
-- 
2.39.2


