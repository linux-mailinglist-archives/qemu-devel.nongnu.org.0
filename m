Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE586ED5CD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:04:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2Oq-0007ci-N9; Mon, 24 Apr 2023 16:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2On-0007Zk-PW
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:02:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Om-0000wJ-4B
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrQG5EG4WH92khExZ1+Awaq414GPQVReIfZciIMh9fo=;
 b=ZWWY2fLow4jC6IDg/ob/SHD0y3Bkw7Mo/ZB/wMJHMNWr264Z3erIGC6GUqLlITEcRlxYj0
 3inahq1PdzcOeFAs0xKg1dZg+EFzU5+9JRGSRAGTqXpjm+B7g4Ln/ea7kv5x3+8xXPjBQz
 25vwKAz9nkN4Srxa4NF0qYvEeS7hemQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-7RqXZyvYPWeFs6BWN6UXXA-1; Mon, 24 Apr 2023 16:02:54 -0400
X-MC-Unique: 7RqXZyvYPWeFs6BWN6UXXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4918AA0F392;
 Mon, 24 Apr 2023 20:02:53 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97B591121319;
 Mon, 24 Apr 2023 20:02:52 +0000 (UTC)
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
Subject: [RFC PATCH v3 05/20] mkvenv: generate console entry shims from inside
 the venv
Date: Mon, 24 Apr 2023 16:02:33 -0400
Message-Id: <20230424200248.1183394-6-jsnow@redhat.com>
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

This patch is meant to ensure that console entry point scripts will
always generate on Python 3.7 installations where we may not have access
to importlib.metadata. By running it from a separate process *inside*
the venv, we can be assured to have access to setuptools and by
extension pkg_resources as a fallback.

It isn't strictly necessary to do this for Python 3.8+, which will
always have importlib.metadata available.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 99 ++++++++++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 14 deletions(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 2172774403..4daa652f12 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -11,6 +11,8 @@
 Commands:
   command     Description
     create    create a venv
+    post_init
+              post-venv initialization
 
 --------------------------------------------------
 
@@ -23,6 +25,15 @@
   -h, --help  show this help message and exit
   --gen GEN   Regenerate console_scripts for given packages, if found.
 
+--------------------------------------------------
+
+usage: mkvenv post_init [-h] [--gen GEN] [--binpath BINPATH]
+
+options:
+  -h, --help         show this help message and exit
+  --gen GEN          Regenerate console_scripts for given packages, if found.
+  --binpath BINPATH  Path where console script shims should be generated
+
 """
 
 # Copyright (C) 2022-2023 Red Hat, Inc.
@@ -59,6 +70,7 @@
 # Do not add any mandatory dependencies from outside the stdlib:
 # This script *must* be usable standalone!
 
+DirType = Union[str, bytes, "os.PathLike[str]", "os.PathLike[bytes]"]
 logger = logging.getLogger("mkvenv")
 
 
@@ -89,23 +101,42 @@ def __init__(self, *args: Any, **kwargs: Any) -> None:
         self.script_packages = kwargs.pop("script_packages", ())
         super().__init__(*args, **kwargs)
 
-        # The EnvBuilder class is cute and toggles this setting off
-        # before post_setup, but we need it to decide if we want to
-        # generate shims or not.
-        self._system_site_packages = self.system_site_packages
+        # Make the context available post-creation:
+        self._context: Optional[SimpleNamespace] = None
+
+    def ensure_directories(self, env_dir: DirType) -> SimpleNamespace:
+        logger.debug("ensure_directories(env_dir=%s)", env_dir)
+        self._context = super().ensure_directories(env_dir)
+        return self._context
+
+    def create(self, env_dir: DirType) -> None:
+        logger.debug("create(env_dir=%s)", env_dir)
+        super().create(env_dir)
+        assert self._context is not None
+        self.post_post_setup(self._context)
 
     def post_setup(self, context: SimpleNamespace) -> None:
         logger.debug("post_setup(...)")
-
-        # Generate console_script entry points for system packages:
-        if self._system_site_packages:
-            generate_console_scripts(
-                context.env_exe, context.bin_path, self.script_packages
-            )
-
         # print the python executable to stdout for configure.
         print(context.env_exe)
 
+    def post_post_setup(self, context: SimpleNamespace) -> None:
+        """
+        The final, final hook. Enter the venv and run commands inside of it.
+        """
+        args = [
+            context.env_exe,
+            __file__,
+            "post_init",
+            "--binpath",
+            context.bin_path,
+        ]
+        if self.system_site_packages:
+            scripts = ",".join(self.script_packages)
+            if scripts:
+                args += ["--gen", scripts]
+        subprocess.run(args, check=True)
+
 
 def need_ensurepip() -> bool:
     """
@@ -359,6 +390,13 @@ def generate_console_scripts(
     """
     Generate script shims for console_script entry points in @packages.
     """
+    logger.debug(
+        "generate_console_scripts(python_path=%s, bin_path=%s, packages=%s)",
+        python_path,
+        bin_path,
+        packages,
+    )
+
     if not packages:
         return
 
@@ -392,6 +430,17 @@ def _get_entry_points() -> Iterator[Dict[str, str]]:
         logger.debug("wrote '%s'", script_path)
 
 
+def post_venv_setup(bin_path: str, packages: Sequence[str] = ()) -> None:
+    """
+    This is intended to be run *inside the venv* after it is created.
+    """
+    python_path = sys.executable
+    logger.debug(
+        "post_venv_setup(bin_path=%s, packages=%s)", bin_path, packages
+    )
+    generate_console_scripts(python_path, bin_path, packages)
+
+
 def _add_create_subcommand(subparsers: Any) -> None:
     subparser = subparsers.add_parser("create", help="create a venv")
     subparser.add_argument(
@@ -408,6 +457,24 @@ def _add_create_subcommand(subparsers: Any) -> None:
     )
 
 
+def _add_post_init_subcommand(subparsers: Any) -> None:
+    subparser = subparsers.add_parser(
+        "post_init", help="post-venv initialization"
+    )
+    subparser.add_argument(
+        "--gen",
+        type=str,
+        action="append",
+        help="Regenerate console_scripts for given packages, if found.",
+    )
+    subparser.add_argument(
+        "--binpath",
+        type=str,
+        action="store",
+        help="Path where console script shims should be generated",
+    )
+
+
 def main() -> int:
     """CLI interface to make_qemu_venv. See module docstring."""
     if os.environ.get("DEBUG") or os.environ.get("GITLAB_CI"):
@@ -429,19 +496,23 @@ def main() -> int:
     )
 
     _add_create_subcommand(subparsers)
+    _add_post_init_subcommand(subparsers)
 
     args = parser.parse_args()
+    script_packages = []
+    for element in args.gen or ():
+        script_packages.extend(element.split(","))
+
     try:
         if args.command == "create":
-            script_packages = []
-            for element in args.gen or ():
-                script_packages.extend(element.split(","))
             make_venv(
                 args.target,
                 system_site_packages=True,
                 clear=True,
                 script_packages=script_packages,
             )
+        if args.command == "post_init":
+            post_venv_setup(args.binpath, script_packages)
         logger.debug("mkvenv.py %s: exiting", args.command)
     except Ouch as exc:
         print("\n*** Ouch! ***\n", file=sys.stderr)
-- 
2.39.2


