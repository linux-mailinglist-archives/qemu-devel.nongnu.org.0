Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDB899587
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 15:54:47 +0200 (CEST)
Received: from localhost ([::1]:43332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0nY6-0004eu-KL
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 09:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44992)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1i0nRi-0006cR-0Q
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 09:48:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1i0nRg-0006Er-Ii
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 09:48:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60858)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1i0nRc-00068K-Ik
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 09:48:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E57107F767;
 Thu, 22 Aug 2019 13:47:55 +0000 (UTC)
Received: from localhost (ovpn-116-85.phx2.redhat.com [10.3.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF6AC5D772;
 Thu, 22 Aug 2019 13:47:47 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 17:47:21 +0400
Message-Id: <20190822134725.32479-3-marcandre.lureau@redhat.com>
In-Reply-To: <20190822134725.32479-1-marcandre.lureau@redhat.com>
References: <20190822134725.32479-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Thu, 22 Aug 2019 13:47:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 2/6] docker.py: add podman support
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 alex.bennee@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a --engine option to select either docker, podman or auto.

Among other advantages, podman allows to run rootless & daemonless
containers, fortunately sharing compatible CLI with docker.

With current podman, we have to use a uidmap trick in order to be able
to rw-share the ccache directory with the container user.

With a user 1000, the default mapping is:                                =
                                                                         =
                                                                1000 (hos=
t) -> 0 (container).
So write access to /var/tmp/ccache ends will end with permission
denied error.

With "--uidmap 1000:0:1 --uidmap 0:1:1000", the mapping is:
1000 (host) -> 0 (container, 1st namespace) -> 1000 (container, 2nd names=
pace).
(the rest is mumbo jumbo to avoid holes in the range of UIDs)

A future podman version may have an option such as --userns-keep-uid.
Thanks to Debarshi Ray <rishi@redhat.com> for the help!

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tests/docker/docker.py | 48 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index f15545aeea..ac5baab4ca 100755
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
@@ -340,6 +366,11 @@ class RunCommand(SubCommand):
         if args.run_as_current_user:
             uid =3D os.getuid()
             argv =3D [ "-u", str(uid) ] + argv
+            docker =3D Docker()
+            if docker._command[0] =3D=3D "podman":
+                argv =3D [ "--uidmap", "%d:0:1" % uid,
+                         "--uidmap", "0:1:%d" % uid,
+                         "--uidmap", "%d:%d:64536" % (uid + 1, uid + 1)]=
 + argv
         return Docker().run(argv, args.keep, quiet=3Dargs.quiet)
=20
=20
@@ -507,6 +538,8 @@ class ProbeCommand(SubCommand):
                 print("yes")
             elif docker._command[0] =3D=3D "sudo":
                 print("sudo")
+            elif docker._command[0] =3D=3D "podman":
+                print("podman")
         except Exception:
             print("no")
=20
@@ -602,9 +635,13 @@ class CheckCommand(SubCommand):
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
@@ -613,6 +650,7 @@ def main():
         cmd.args(subp)
         subp.set_defaults(cmdobj=3Dcmd)
     args, argv =3D parser.parse_known_args()
+    USE_ENGINE =3D args.engine
     return args.cmdobj.run(args, argv)
=20
=20
--=20
2.23.0


