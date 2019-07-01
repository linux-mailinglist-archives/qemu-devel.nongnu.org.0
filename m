Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18E28DEE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 01:42:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44676 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTxM0-0007vQ-UU
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 19:42:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hTxK4-00075u-CI
	for qemu-devel@nongnu.org; Thu, 23 May 2019 19:40:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hTxK3-00033e-3a
	for qemu-devel@nongnu.org; Thu, 23 May 2019 19:40:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57046)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hTxK2-000302-RP
	for qemu-devel@nongnu.org; Thu, 23 May 2019 19:40:31 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDCA437EEB;
	Thu, 23 May 2019 23:40:24 +0000 (UTC)
Received: from localhost (ovpn-112-51.ams2.redhat.com [10.36.112.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F1AF60BF3;
	Thu, 23 May 2019 23:40:24 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 01:40:08 +0200
Message-Id: <20190523234011.583-2-marcandre.lureau@redhat.com>
In-Reply-To: <20190523234011.583-1-marcandre.lureau@redhat.com>
References: <20190523234011.583-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 23 May 2019 23:40:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/4] docker.py: add podman support
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
Cc: Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a --engine option to select either docker, podman or auto.

Among other advantages, podman allows to run rootless & daemonless
containers, fortunately sharing compatible CLI with docker.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 tests/docker/docker.py | 43 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 53a8c9c801..1f59a78b10 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -20,6 +20,7 @@ import hashlib
 import atexit
 import uuid
 import argparse
+import enum
 import tempfile
 import re
 import signal
@@ -38,6 +39,26 @@ FILTERED_ENV_NAMES =3D ['ftp_proxy', 'http_proxy', 'ht=
tps_proxy']
=20
 DEVNULL =3D open(os.devnull, 'wb')
=20
+class EngineEnum(enum.IntEnum):
+    AUTO =3D 1
+    DOCKER =3D 2
+    PODMAN =3D 3
+
+    def __str__(self):
+        return self.name.lower()
+
+    def __repr__(self):
+        return str(self)
+
+    @staticmethod
+    def argparse(s):
+        try:
+            return EngineEnum[s.upper()]
+        except KeyError:
+            return s
+
+
+USE_ENGINE =3D EngineEnum.AUTO
=20
 def _text_checksum(text):
     """Calculate a digest string unique to the text content"""
@@ -48,9 +69,14 @@ def _file_checksum(filename):
     return _text_checksum(open(filename, 'rb').read())
=20
=20
-def _guess_docker_command():
-    """ Guess a working docker command or raise exception if not found""=
"
-    commands =3D [["docker"], ["sudo", "-n", "docker"]]
+def _guess_engine_command():
+    """ Guess a working engine command or raise exception if not found""=
"
+    commands =3D []
+
+    if USE_ENGINE in [EngineEnum.AUTO, EngineEnum.PODMAN]:
+        commands +=3D [["podman"]]
+    if USE_ENGINE in [EngineEnum.AUTO, EngineEnum.DOCKER]:
+        commands +=3D [["docker"], ["sudo", "-n", "docker"]]
     for cmd in commands:
         try:
             # docker version will return the client details in stdout
@@ -61,7 +87,7 @@ def _guess_docker_command():
         except OSError:
             pass
     commands_txt =3D "\n".join(["  " + " ".join(x) for x in commands])
-    raise Exception("Cannot find working docker command. Tried:\n%s" %
+    raise Exception("Cannot find working engine command. Tried:\n%s" %
                     commands_txt)
=20
=20
@@ -190,7 +216,7 @@ def _dockerfile_preprocess(df):
 class Docker(object):
     """ Running Docker commands """
     def __init__(self):
-        self._command =3D _guess_docker_command()
+        self._command =3D _guess_engine_command()
         self._instances =3D []
         atexit.register(self._kill_instances)
         signal.signal(signal.SIGTERM, self._kill_instances)
@@ -502,6 +528,8 @@ class ProbeCommand(SubCommand):
                 print("yes")
             elif docker._command[0] =3D=3D "sudo":
                 print("sudo")
+            elif docker._command[0] =3D=3D "podman":
+                print("podman")
         except Exception:
             print("no")
=20
@@ -597,9 +625,13 @@ class CheckCommand(SubCommand):
=20
=20
 def main():
+    global USE_ENGINE
+
     parser =3D argparse.ArgumentParser(description=3D"A Docker helper",
                                      usage=3D"%s <subcommand> ..." %
                                      os.path.basename(sys.argv[0]))
+    parser.add_argument("--engine", type=3DEngineEnum.argparse, choices=3D=
list(EngineEnum),
+                        help=3D"specify which container engine to use")
     subparsers =3D parser.add_subparsers(title=3D"subcommands", help=3DN=
one)
     for cls in SubCommand.__subclasses__():
         cmd =3D cls()
@@ -608,6 +640,7 @@ def main():
         cmd.args(subp)
         subp.set_defaults(cmdobj=3Dcmd)
     args, argv =3D parser.parse_known_args()
+    USE_ENGINE =3D args.engine
     return args.cmdobj.run(args, argv)
=20
=20
--=20
2.22.0.rc1.1.g079e7d2849.dirty


