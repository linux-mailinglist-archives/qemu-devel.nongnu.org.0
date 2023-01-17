Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577A066D9AB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 10:17:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHi5O-0004k2-1f; Tue, 17 Jan 2023 04:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHi5L-0004jm-Uv
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:16:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHi5J-0005gW-Fp
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673947008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QB4PUAYRScqFK02Rkaov1sFhtVMsAMc+bIu9gsoecTM=;
 b=imJCGYV8tUuqOWwmh6FlhFRftPlTeiulovOZo12RhGeT14n6jQ4l6S0WRC9/nX4TaAumGO
 S1rM1Dcugm1JK5QdMnQ4c2AlDM2q2ie+4qHavxr4Ak38RZXpH1AL7SvKnWTvA9I+rcOyCw
 VyfsqK7LXkoQNaAe4Li2POLzf6g7vqE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-6CCwUdEJPH6JoKk05Vcl4A-1; Tue, 17 Jan 2023 04:16:47 -0500
X-MC-Unique: 6CCwUdEJPH6JoKk05Vcl4A-1
Received: by mail-ed1-f69.google.com with SMTP id
 e6-20020a056402190600b0048ee2e45daaso20626527edz.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 01:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QB4PUAYRScqFK02Rkaov1sFhtVMsAMc+bIu9gsoecTM=;
 b=X0siLyN8g/o6pQl+sJGs88PGmqLabaFqvbeegt36xu0RvdW8G4evpfGaiKWQgEerr9
 o9YeOsjby7tDwmycMyN0jU2g7G2+jjyl+VxzEWgP5IHrl7fJC0/hIn/8J9vLL6E64xtM
 imzbkZbc2nMt7tFK87PJM3SYOpINO1KbCG1sK0fApJYgHxFabDb9BjkM5kgbUZ0iPYwR
 E0s4yUTMpV7eP3zdQU2HsYfUNbL00JavltRA7pORW1hhoj8HgfIrfUrnP+ZeNKC2gpRf
 KkgqTUaWxKzELb9pGKIik/ahAG9zBf0v+AkRt5w3JhKefxi3EqT+rAxRj1ufjxTG7+A9
 yMcg==
X-Gm-Message-State: AFqh2koaFwfvwFx7KJIUaFfFIIuFI3YyCs4ynjaUerYAba7hO7ejPrmo
 zmFLHSyP566GpKZJIev9lBucAWtZeAoMuaKW5ogZp6+f+e/3hzD2MB5N3UnWDzd4wXkelWFxHAP
 T/SGm5g9zqT4KfQ+okVoigq1qzq/LnYd1mxsel3hIF98Bn3aIy9AUUG8j7nU3IBczPxA=
X-Received: by 2002:a05:6402:1770:b0:48e:9afd:de66 with SMTP id
 da16-20020a056402177000b0048e9afdde66mr2172479edb.34.1673947005565; 
 Tue, 17 Jan 2023 01:16:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu/AGq3QltvOoAiP8E433x2Or6HYl2bApEu+qrH/VXwLohAA/TmjGDZGJ5aHoDd+RCFS0Z2Ew==
X-Received: by 2002:a05:6402:1770:b0:48e:9afd:de66 with SMTP id
 da16-20020a056402177000b0048e9afdde66mr2172458edb.34.1673947005171; 
 Tue, 17 Jan 2023 01:16:45 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a056402344400b004822681a671sm12505266edc.37.2023.01.17.01.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 01:16:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	berrange@redhat.com
Subject: [RFC PATCH 2/4] lcitool: use libvirt-ci as library
Date: Tue, 17 Jan 2023 10:16:36 +0100
Message-Id: <20230117091638.50523-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230117091638.50523-1-pbonzini@redhat.com>
References: <20230117091638.50523-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Using the lcitool package as a library will make it possible to
customize more of the process, for example by introducing custom
mappings.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  6 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  6 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |  6 +-
 tests/docker/dockerfiles/alpine.docker        |  6 +-
 tests/docker/dockerfiles/centos8.docker       |  6 +-
 .../dockerfiles/debian-amd64-cross.docker     |  6 +-
 tests/docker/dockerfiles/debian-amd64.docker  |  6 +-
 .../dockerfiles/debian-arm64-cross.docker     |  6 +-
 .../dockerfiles/debian-armel-cross.docker     |  6 +-
 .../dockerfiles/debian-armhf-cross.docker     |  6 +-
 .../dockerfiles/debian-mips64el-cross.docker  |  6 +-
 .../dockerfiles/debian-mipsel-cross.docker    |  6 +-
 .../dockerfiles/debian-ppc64el-cross.docker   |  6 +-
 .../dockerfiles/debian-s390x-cross.docker     |  6 +-
 .../dockerfiles/fedora-win32-cross.docker     |  6 +-
 .../dockerfiles/fedora-win64-cross.docker     |  6 +-
 tests/docker/dockerfiles/fedora.docker        |  6 +-
 tests/docker/dockerfiles/opensuse-leap.docker |  6 +-
 tests/docker/dockerfiles/ubuntu2004.docker    |  6 +-
 tests/lcitool/refresh                         | 83 ++++++++++++-------
 20 files changed, 70 insertions(+), 127 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index e3fc3235b93e..f395e56fc833 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool variables freebsd-12 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 CCACHE='/usr/local/bin/ccache'
 CPAN_PKGS=''
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 9f56babd9ca7..f395e56fc833 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool variables freebsd-13 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 CCACHE='/usr/local/bin/ccache'
 CPAN_PKGS=''
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
index ef9e14b373f0..7fb182f93e16 100644
--- a/.gitlab-ci.d/cirrus/macos-12.vars
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool variables macos-12 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 CCACHE='/opt/homebrew/bin/ccache'
 CPAN_PKGS=''
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 094f66f4eb05..10f68f4e1e6d 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all alpine-316 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM docker.io/library/alpine:3.16
 
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 1f70d41aeb31..2318a95e9255 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all centos-stream-8 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM quay.io/centos/centos:stream8
 
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 5e57309361b6..bfa88dc7285f 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all --cross x86_64 debian-11 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM docker.io/library/debian:11-slim
 
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index bfeab01ee3e2..e09118c83b2f 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all debian-11 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM docker.io/library/debian:11-slim
 
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 98885bd0eedf..b20197d5b710 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all --cross aarch64 debian-11 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM docker.io/library/debian:11-slim
 
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index d5c08714e4de..792e098f273c 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all --cross armv6l debian-11 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM docker.io/library/debian:11-slim
 
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 471444fcf489..dbb9cf21e99b 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all --cross armv7l debian-11 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM docker.io/library/debian:11-slim
 
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 15b0224b76bf..712cf98388a1 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all --cross mips64el debian-11 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM docker.io/library/debian:11-slim
 
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index a5d3ca6e2f7f..c746b7ca04aa 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all --cross mipsel debian-11 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM docker.io/library/debian:11-slim
 
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index d2954e61f678..5591062a8bf1 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all --cross ppc64le debian-11 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM docker.io/library/debian:11-slim
 
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index d43ce163172e..9c14f3faca40 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all --cross s390x debian-11 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM docker.io/library/debian:11-slim
 
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index aece4f55818d..d691e54d0c15 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all --cross mingw32 fedora-36 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM registry.fedoraproject.org/fedora:36
 
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 2d573e2505f2..9f5082e02b3b 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all --cross mingw64 fedora-36 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM registry.fedoraproject.org/fedora:36
 
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 901562bb8e5a..c8e99a6b8951 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all fedora-36 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM registry.fedoraproject.org/fedora:36
 
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 4361b01464af..a98209c15803 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all opensuse-leap-153 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM registry.opensuse.org/opensuse/leap:15.3
 
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 9417bca2fa23..077460916ade 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,8 +1,4 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all ubuntu-2004 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
+# THIS FILE WAS AUTO-GENERATED BY tests/lcitool/refresh
 
 FROM docker.io/library/ubuntu:20.04
 
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index ee55ee40ee5d..31a34dce7a33 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -12,61 +12,80 @@
 # or (at your option) any later version. See the COPYING file in
 # the top-level directory.
 
-import sys
-import subprocess
-
+from contextlib import contextmanager
 from pathlib import Path
 
+import sys
+
 if len(sys.argv) != 1:
     print("syntax: %s" % sys.argv[0], file=sys.stderr)
     sys.exit(1)
 
-self_dir = Path(__file__).parent
-src_dir = self_dir.parent.parent
+script = Path(__file__)
+script_dir = script.parent
+src_dir = script_dir.parent.parent
 dockerfiles_dir = Path(src_dir, "tests", "docker", "dockerfiles")
 
-lcitool_path = Path(self_dir, "libvirt-ci", "bin", "lcitool")
+sys.path.append(str(Path(script_dir, "libvirt-ci")))
 
-lcitool_cmd = [lcitool_path, "--data-dir", self_dir]
+from lcitool import LcitoolError
+from lcitool.packages import Packages
+from lcitool.projects import Projects
+from lcitool.targets import BuildTarget, Targets
+from lcitool.formatters import DockerfileFormatter, ShellVariablesFormatter
+from lcitool.util import DataDir
+
+PREFIX = ''
+
+DATA_DIR = DataDir(script_dir)
+PROJECTS = Projects(DATA_DIR)
+PACKAGES = Packages()
+TARGETS = Targets()
 
 
-def atomic_write(filename, content):
+@contextmanager
+def atomic_write(filename):
     tmp = filename.with_suffix(filename.suffix + ".tmp")
     try:
         with tmp.open("w") as fp:
-            print(content, file=fp, end="")
+            yield fp
             tmp.rename(filename)
-    except Exception as ex:
+    except Exception:
         tmp.unlink()
         raise
 
 
-def generate(filename, cmd, trailer):
-    print("Generate %s" % filename)
-    lcitool = subprocess.run(cmd, capture_output=True)
-
-    if lcitool.returncode != 0:
-        raise Exception("Failed to generate %s: %s" % (filename, lcitool.stderr))
-
-    content = lcitool.stdout.decode("utf8")
-    if trailer is not None:
-        content += trailer
-    atomic_write(filename, content)
+@contextmanager
+def generate(filename):
+    print("Generating %s" % filename)
+    nonlocal PREFIX
+    try:
+        PREFIX = "Failed to generate %s: " % filename
+        with atomic_write(filename) as fp:
+            print('# THIS FILE WAS AUTO-GENERATED BY',
+                  script.relative_to(src_dir), file=fp)
+            print(file=fp)
+            yield fp
+    finally:
+        PREFIX = ''
 
 
 def generate_dockerfile(host, target, cross=None, trailer=None):
     filename = Path(src_dir, "tests", "docker", "dockerfiles", host + ".docker")
-    cmd = lcitool_cmd + ["dockerfile"]
-    if cross is not None:
-        cmd.extend(["--cross", cross])
-    cmd.extend([target, "qemu"])
-    generate(filename, cmd, trailer)
+    with generate(filename) as fp:
+        dockerfile = DockerfileFormatter(PROJECTS)
+        target = BuildTarget(TARGETS, PACKAGES, target, cross)
+        print(dockerfile.format(target, ["qemu"]), file=fp)
+        if trailer is not None:
+            print(trailer, file=fp, end="")
 
 
-def generate_cirrus(target, trailer=None):
+def generate_cirrus(target):
     filename = Path(src_dir, ".gitlab-ci.d", "cirrus", target + ".vars")
-    cmd = lcitool_cmd + ["variables", target, "qemu"]
-    generate(filename, cmd, trailer)
+    with generate(filename) as fp:
+        variables = ShellVariablesFormatter(PROJECTS)
+        target = BuildTarget(TARGETS, PACKAGES, target)
+        print(variables.format(target, ["qemu"]), file=fp)
 
 
 ubuntu2004_tsanhack = [
@@ -98,11 +117,11 @@ def cross_build(prefix, targets):
     targets = "ENV DEF_TARGET_LIST %s\n" % (targets)
     return "".join([conf, targets])
 
+
 #
 # Update all the various build configurations.
 # Please keep each group sorted alphabetically for easy reading.
 #
-
 try:
     #
     # Standard native builds
@@ -179,6 +198,6 @@ try:
     generate_cirrus("macos-12")
 
     sys.exit(0)
-except Exception as ex:
-    print(str(ex), file=sys.stderr)
+except LcitoolError as ex:
+    print(PREFIX + ex.module_prefix + " error: " + str(ex), file=sys.stderr)
     sys.exit(1)
-- 
2.38.1


