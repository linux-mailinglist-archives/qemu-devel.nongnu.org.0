Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B986FEA68
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 05:57:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwxOK-0007bS-Jn; Wed, 10 May 2023 23:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOH-0007aI-JO
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOC-0005KO-7B
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683777287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrpNLMmUH8QQBGE3hmT2dVSEwPqpJk/j6a6V49WnrLk=;
 b=Geuz0/d2kHWdoUadagDawg5G3fiofYguhHDWnsR1hpIh7WtFoyFUd34BfQHpwOJM2KCPSB
 A5jbCPv+N4pCpjYRuv11x/VE6ZHoKeRqAOOt349FoeSkhufQaKrVPYbaPAy5ro2KHPE64j
 K34BMQ82aCHbzLjkWCSLp/MIOZ4YMec=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-cz3_5ASKO0iwqiCPlHRx5w-1; Wed, 10 May 2023 23:54:44 -0400
X-MC-Unique: cz3_5ASKO0iwqiCPlHRx5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9970587DC01;
 Thu, 11 May 2023 03:54:43 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E104940C2076;
 Thu, 11 May 2023 03:54:42 +0000 (UTC)
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
Subject: [PATCH 09/27] mkvenv: create pip binary in virtual environment
Date: Wed, 10 May 2023 23:54:17 -0400
Message-Id: <20230511035435.734312-10-jsnow@redhat.com>
In-Reply-To: <20230511035435.734312-1-jsnow@redhat.com>
References: <20230511035435.734312-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

From: Paolo Bonzini <pbonzini@redhat.com>

While pip can be invoked as "python -m pip", it is more standard to
have it as a binary in the virtual environment.  Instead of using
ensurepip, which is slow, use the console shim generation that was
just added for "mkvenv ensure".

Signed-off-by: John Snow <jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 python/scripts/mkvenv.py | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 9c99122603..7a9a14124d 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -11,6 +11,8 @@
 Commands:
   command     Description
     create    create a venv
+    post_init
+              post-venv initialization
     ensure    Ensure that the specified package is installed.
 
 --------------------------------------------------
@@ -25,6 +27,13 @@
 
 --------------------------------------------------
 
+usage: mkvenv post_init [-h]
+
+options:
+  -h, --help         show this help message and exit
+
+--------------------------------------------------
+
 usage: mkvenv ensure [-h] [--online] [--dir DIR] dep_spec...
 
 positional arguments:
@@ -189,6 +198,13 @@ def post_post_setup(self, context: SimpleNamespace) -> None:
             with open(pth_file, "w", encoding="UTF-8") as file:
                 file.write(parent_libpath + os.linesep)
 
+        args = [
+            context.env_exe,
+            __file__,
+            "post_init",
+        ]
+        subprocess.run(args, check=True)
+
     def get_value(self, field: str) -> str:
         """
         Get a string value from the context namespace after a call to build.
@@ -727,6 +743,17 @@ def ensure(
         raise Ouch(diagnose(dep_specs[0], online, wheels_dir, prog)) from exc
 
 
+def post_venv_setup() -> None:
+    """
+    This is intended to be run *inside the venv* after it is created.
+    """
+    logger.debug("post_venv_setup()")
+    # Generate a 'pip' script so the venv is usable in a normal
+    # way from the CLI. This only happens when we inherited pip from a
+    # parent/system-site and haven't run ensurepip in some way.
+    generate_console_scripts(["pip"])
+
+
 def _add_create_subcommand(subparsers: Any) -> None:
     subparser = subparsers.add_parser("create", help="create a venv")
     subparser.add_argument(
@@ -737,6 +764,10 @@ def _add_create_subcommand(subparsers: Any) -> None:
     )
 
 
+def _add_post_init_subcommand(subparsers: Any) -> None:
+    subparsers.add_parser("post_init", help="post-venv initialization")
+
+
 def _add_ensure_subcommand(subparsers: Any) -> None:
     subparser = subparsers.add_parser(
         "ensure", help="Ensure that the specified package is installed."
@@ -790,6 +821,7 @@ def main() -> int:
     )
 
     _add_create_subcommand(subparsers)
+    _add_post_init_subcommand(subparsers)
     _add_ensure_subcommand(subparsers)
 
     args = parser.parse_args()
@@ -800,6 +832,8 @@ def main() -> int:
                 system_site_packages=True,
                 clear=True,
             )
+        if args.command == "post_init":
+            post_venv_setup()
         if args.command == "ensure":
             ensure(
                 dep_specs=args.dep_specs,
-- 
2.40.0


