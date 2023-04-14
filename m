Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C0D6E1C11
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 07:57:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnCP2-0007Oe-Hn; Fri, 14 Apr 2023 01:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOx-0007Mb-OG
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOi-0000JF-Ff
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681451699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWbXIR6WGdAP0EgxpzDb1P+wi33ty82hF8pv1+xBob0=;
 b=hpWvE5NK0eOrAqJD6lKpVuwRSbc25epexAZcMygdfN/bXJuCDceq757G1s7Moo/rklWqZo
 5qQIDTBEx2bGVgL9l3zk4X4eVK1NxIjfBrEW1XSKCLngKFIf6NECUh8NQmuWQGLjzVUc8c
 Y0VvsRMTMANWk8eYVSveA9w3OTdmMp8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-w50JMwsIPKa7T080weyDtA-1; Fri, 14 Apr 2023 01:54:54 -0400
X-MC-Unique: w50JMwsIPKa7T080weyDtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10D93185A78F;
 Fri, 14 Apr 2023 05:54:54 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80587C1602A;
 Fri, 14 Apr 2023 05:54:53 +0000 (UTC)
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
Subject: [RFC PATCH v2 06/10] mkvenv: generate console entry shims from inside
 the venv
Date: Fri, 14 Apr 2023 01:54:45 -0400
Message-Id: <20230414055449.4028284-7-jsnow@redhat.com>
In-Reply-To: <20230414055449.4028284-1-jsnow@redhat.com>
References: <20230414055449.4028284-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

As a coincidence, it also gives us a pretty good place to do all kinds
of other "in-venv" setup that we might want to do later; for instance
meson and sphinx bootstrapping might be good candidates.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 71 ++++++++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 14 deletions(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index a3284e9ef1..317697a953 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -62,22 +62,33 @@ def __init__(self, *args, **kwargs) -> None:
         self.script_packages = kwargs.pop('script_packages', ())
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
+        self.post_post_setup(self._context)
 
     def post_setup(self, context: SimpleNamespace) -> None:
         logger.debug("post_setup(...)")
-
-        # Generate console_script entry points for system packages:
-        if self._system_site_packages:
-            generate_console_scripts(
-                context.env_exe, context.bin_path, self.script_packages)
-
         # print the python executable to stdout for configure.
         print(context.env_exe)
 
+    def post_post_setup(self, context: SimpleNamespace) -> None:
+        # The final, final hook; enter the venv and run any
+        # last steps we want to occur *inside* the venv.
+        args = [context.env_exe, __file__, 'post_init',
+                '--binpath', context.bin_path]
+        if self.system_site_packages:
+            args += ['--gen', ",".join(self.script_packages)]
+        subprocess.run(args, check=True)
+
 
 def need_ensurepip() -> bool:
     """
@@ -301,6 +312,10 @@ def generate_console_scripts(python_path: str, bin_path: str,
     """
     Generate script shims for console_script entry points in @packages.
     """
+    logger.debug(
+        "generate_console_scripts(python_path=%s, bin_path=%s, packages=%s)",
+        python_path, bin_path, packages)
+
     if not packages:
         return
 
@@ -334,6 +349,16 @@ def _get_entry_points() -> Iterator[Dict[str, str]]:
         logger.debug("wrote '%s'", script_path)
 
 
+def post_venv_setup(bin_path: str, packages: Sequence[str] = ()) -> None:
+    """
+    This is intended to be run *inside the venv* after it is created.
+    """
+    python_path = sys.executable
+    logger.debug("post_venv_setup(bin_path=%s, packages=%s)",
+                 bin_path, packages)
+    generate_console_scripts(python_path, bin_path, packages)
+
+
 def main() -> int:
     """CLI interface to make_qemu_venv. See module docstring."""
     if os.environ.get('DEBUG') or os.environ.get('GITLAB_CI'):
@@ -366,12 +391,28 @@ def main() -> int:
         help="Target directory to install virtual environment into.",
     )
 
+    subparser = subparsers.add_parser(
+        'post_init', help='post-venv initialization')
+    subparser.add_argument(
+        '--gen',
+        type=str,
+        action='append',
+        help="Regenerate console_scripts for given packages, if found.",
+    )
+    subparser.add_argument(
+        '--binpath',
+        type=str,
+        action='store',
+        help="Path where console script shims should be generated",
+    )
+
     args = parser.parse_args()
+    script_packages = []
+    for element in args.gen or ():
+        script_packages.extend(element.split(","))
+
     try:
         if args.command == 'create':
-            script_packages = []
-            for element in args.gen or ():
-                script_packages.extend(element.split(","))
             make_venv(
                 args.target,
                 system_site_packages=True,
@@ -380,7 +421,9 @@ def main() -> int:
                 with_pip=None,  # Autodetermine
                 script_packages=script_packages,
             )
-            logger.debug("mkvenv.py create - exiting")
+        if args.command == 'post_init':
+            post_venv_setup(args.binpath, script_packages)
+        logger.debug("mkvenv.py %s: exiting", args.command)
     except Ouch as exc:
         print("\n*** Ouch! ***\n", file=sys.stderr)
         print(str(exc), "\n\n", file=sys.stderr)
-- 
2.39.2


