Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716A36ED5CE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:04:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2Ou-0007lX-Hc; Mon, 24 Apr 2023 16:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Os-0007jW-Cy
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Oq-0000xF-Ah
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0FGmk7ZrXhx4D40Jtrg77ftnsvWCd0BcH5TudDIxTk=;
 b=Lb1Gdi4qng+T6mPfHh43OkBCk+HkArNOOiJz7X/2X591x2UWjhBk3iB5zcnW97QkMDV+II
 IRSdu5FCnLnUtPh1nfMT7Lb9vDrR15DYiSSGTG15lUOLk+Qc4teO5j55KWq28F8L8JK+A2
 2ebUQObb1N9pem7fKXevECPi6a0pYNg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-6Y6aY-XKP-qSvn_Uy-w0-w-1; Mon, 24 Apr 2023 16:02:56 -0400
X-MC-Unique: 6Y6aY-XKP-qSvn_Uy-w0-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DC3185A5A3;
 Mon, 24 Apr 2023 20:02:55 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D85131121318;
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
Subject: [RFC PATCH v3 08/20] mkvenv: add ensure subcommand
Date: Mon, 24 Apr 2023 16:02:36 -0400
Message-Id: <20230424200248.1183394-9-jsnow@redhat.com>
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

This command is to be used to add various packages (or ensure they're
already present) into the configure-provided venv in a modular fashion.

Examples:

mkvenv ensure --online --dir "${source_dir}/python/wheels/" "meson>=0.61.5"
mkvenv ensure --online "sphinx>=1.6.0"
mkvenv ensure "qemu.qmp==0.0.2"

It's designed to look for packages in three places, in order:

(1) In system packages, if the version installed is already good
enough. This way your distribution-provided meson, sphinx, etc are
always used as first preference.

(2) In a vendored packages directory. Here I am suggesting
qemu.git/python/wheels/ as that directory. This is intended to serve as
a replacement for vendoring the meson source for QEMU tarballs. It is
also highly likely to be extremely useful for packaging the "qemu.qmp"
package in source distributions for platforms that do not yet package
qemu.qmp separately.

(3) Online, via PyPI, ***only when "--online" is passed***. This is only
ever used as a fallback if the first two sources do not have an
appropriate package that meets the requirement. The ability to build
QEMU and run tests *completely offline* is not impinged.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 116 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 114 insertions(+), 2 deletions(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 45d1b772e5..937664ea9c 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -13,6 +13,7 @@
     create    create a venv
     post_init
               post-venv initialization
+    ensure    Ensure that the specified package is installed.
 
 --------------------------------------------------
 
@@ -34,6 +35,18 @@
   --gen GEN          Regenerate console_scripts for given packages, if found.
   --binpath BINPATH  Path where console script shims should be generated
 
+--------------------------------------------------
+
+usage: mkvenv ensure [-h] [--online] [--dir DIR] dep_spec
+
+positional arguments:
+  dep_spec    PEP 508 Dependency specification, e.g. 'meson>=0.61.5'
+
+options:
+  -h, --help  show this help message and exit
+  --online    Install packages from PyPI, if necessary.
+  --dir DIR   Path to vendored packages where we may install from.
+
 """
 
 # Copyright (C) 2022-2023 Red Hat, Inc.
@@ -530,6 +543,71 @@ def checkpip() -> None:
     logging.debug("Pip is now (hopefully) repaired!")
 
 
+def pip_install(
+    args: Sequence[str],
+    online: bool = False,
+    wheels_dir: Optional[Union[str, Path]] = None,
+) -> None:
+    """
+    Use pip to install a package or package(s) as specified in @args.
+    """
+    loud = bool(
+        os.environ.get("DEBUG")
+        or os.environ.get("GITLAB_CI")
+        or os.environ.get("V")
+    )
+
+    full_args = [
+        sys.executable,
+        "-m",
+        "pip",
+        "install",
+        "--disable-pip-version-check",
+        "-v" if loud else "-q",
+    ]
+    if not online:
+        full_args += ["--no-index"]
+    if wheels_dir:
+        full_args += ["--find-links", f"file://{str(wheels_dir)}"]
+    full_args += list(args)
+    subprocess.run(full_args, check=True)
+
+
+def ensure(
+    dep_spec: str,
+    online: bool = False,
+    wheels_dir: Optional[Union[str, Path]] = None,
+) -> None:
+    """
+    Use pip to ensure we have the package specified by @dep_spec.
+
+    If the package is already installed, do nothing. If online and
+    wheels_dir are both provided, prefer packages found in wheels_dir
+    first before connecting to PyPI.
+
+    :param dep_spec:
+        A PEP 508 dependency specification. e.g. 'meson>=0.61.5'.
+    :param online: If True, fall back to PyPI.
+    :param wheels_dir: If specified, search this path for packages.
+    """
+    # This first install command will:
+    # (A) Do nothing, if we already have a suitable package.
+    # (B) Install the package from vendored source, if possible.
+    # (C) Fail if neither A nor B.
+    try:
+        pip_install([dep_spec], online=False, wheels_dir=wheels_dir)
+        # (A) or (B) happened. Success.
+        return
+    except subprocess.CalledProcessError:
+        # (C) Happened.
+        # The package is missing or isn't a suitable version,
+        # and we weren't able to install a suitable vendored package.
+        if online:
+            pip_install([dep_spec], online=True)
+        else:
+            raise
+
+
 def post_venv_setup(bin_path: str, packages: Sequence[str] = ()) -> None:
     """
     This is intended to be run *inside the venv* after it is created.
@@ -578,6 +656,29 @@ def _add_post_init_subcommand(subparsers: Any) -> None:
     )
 
 
+def _add_ensure_subcommand(subparsers: Any) -> None:
+    subparser = subparsers.add_parser(
+        "ensure", help="Ensure that the specified package is installed."
+    )
+    subparser.add_argument(
+        "--online",
+        action="store_true",
+        help="Install packages from PyPI, if necessary.",
+    )
+    subparser.add_argument(
+        "--dir",
+        type=str,
+        action="store",
+        help="Path to vendored packages where we may install from.",
+    )
+    subparser.add_argument(
+        "dep_spec",
+        type=str,
+        action="store",
+        help="PEP 508 Dependency specification, e.g. 'meson>=0.61.5'",
+    )
+
+
 def main() -> int:
     """CLI interface to make_qemu_venv. See module docstring."""
     if os.environ.get("DEBUG") or os.environ.get("GITLAB_CI"):
@@ -600,14 +701,18 @@ def main() -> int:
 
     _add_create_subcommand(subparsers)
     _add_post_init_subcommand(subparsers)
+    _add_ensure_subcommand(subparsers)
 
     args = parser.parse_args()
     script_packages = []
-    for element in args.gen or ():
-        script_packages.extend(element.split(","))
+
+    def _normalize_gen() -> None:
+        for element in args.gen or ():
+            script_packages.extend(element.split(","))
 
     try:
         if args.command == "create":
+            _normalize_gen()
             make_venv(
                 args.target,
                 system_site_packages=True,
@@ -615,7 +720,14 @@ def main() -> int:
                 script_packages=script_packages,
             )
         if args.command == "post_init":
+            _normalize_gen()
             post_venv_setup(args.binpath, script_packages)
+        if args.command == "ensure":
+            ensure(
+                dep_spec=args.dep_spec,
+                online=args.online,
+                wheels_dir=args.dir,
+            )
         logger.debug("mkvenv.py %s: exiting", args.command)
     except Ouch as exc:
         print("\n*** Ouch! ***\n", file=sys.stderr)
-- 
2.39.2


