Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D2841D5C3
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 10:52:49 +0200 (CEST)
Received: from localhost ([::1]:45652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVro7-0005ti-If
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 04:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVrip-0008QC-RC
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:47:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVrin-0004NH-H4
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632991636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Brd236PxLzbXQMlv8UxvR2/TGl8KnJeOwzYvKC11x9c=;
 b=SbjMiYi3E0EdU5n/IrqeoO5UnYyPXcASP9SSYrL8vbW3i+kFIcS+eNOFdSDyWfsF45cv+5
 4EX5hdgzk3WWJJvSxnuaLQzdTusibgUj+k/ZxauHA3eN41jtrhjms/xD5PyC8KqQcOYYMt
 vrWVJR3IqMdjoHmIFGCBmz6PvDEHxhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-KRbJl8tJMZy5BZqWPEbcwQ-1; Thu, 30 Sep 2021 04:47:12 -0400
X-MC-Unique: KRbJl8tJMZy5BZqWPEbcwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 757EA802C8A;
 Thu, 30 Sep 2021 08:47:11 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF84E60936;
 Thu, 30 Sep 2021 08:47:06 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: eblake@redhat.com
Subject: [PATCH v3] nbd/server: Add --selinux-label option
Date: Thu, 30 Sep 2021 09:47:01 +0100
Message-Id: <20210930084701.3899578-1-rjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, vsementsov@virtuozzo.com,
 berrange@redhat.com, qemu-block@nongnu.org, richard.henderson@linaro.org,
 f4bug@amsat.org, wainersm@redhat.com, qemu-devel@nongnu.org,
 willianr@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Under SELinux, Unix domain sockets have two labels.  One is on the
disk and can be set with commands such as chcon(1).  There is a
different label stored in memory (called the process label).  This can
only be set by the process creating the socket.  When using SELinux +
SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
you must set both labels correctly first.

For qemu-nbd the options to set the second label are awkward.  You can
create the socket in a wrapper program and then exec into qemu-nbd.
Or you could try something with LD_PRELOAD.

This commit adds the ability to set the label straightforwardly on the
command line, via the new --selinux-label flag.  (The name of the flag
is the same as the equivalent nbdkit option.)

A worked example showing how to use the new option can be found in
this bug: https://bugzilla.redhat.com/show_bug.cgi?id=1984938

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 configure                                     |  8 +++-
 meson.build                                   | 10 ++++-
 meson_options.txt                             |  3 ++
 qemu-nbd.c                                    | 39 +++++++++++++++++++
 tests/docker/dockerfiles/centos8.docker       |  1 +
 .../dockerfiles/fedora-i386-cross.docker      |  1 +
 tests/docker/dockerfiles/fedora.docker        |  1 +
 tests/docker/dockerfiles/opensuse-leap.docker |  1 +
 tests/docker/dockerfiles/ubuntu1804.docker    |  1 +
 tests/docker/dockerfiles/ubuntu2004.docker    |  1 +
 10 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 1043ccce4f..b3211a66ee 100755
--- a/configure
+++ b/configure
@@ -445,6 +445,7 @@ fuse="auto"
 fuse_lseek="auto"
 multiprocess="auto"
 slirp_smbd="$default_feature"
+selinux="auto"
 
 malloc_trim="auto"
 gio="$default_feature"
@@ -1576,6 +1577,10 @@ for opt do
   ;;
   --disable-slirp-smbd) slirp_smbd=no
   ;;
+  --enable-selinux) selinux="enabled"
+  ;;
+  --disable-selinux) selinux="disabled"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1963,6 +1968,7 @@ disabled with --disable-FEATURE, default is enabled if available
   multiprocess    Out of process device emulation support
   gio             libgio support
   slirp-smbd      use smbd (at path --smbd=*) in slirp networking
+  selinux         SELinux support in qemu-nbd
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -5207,7 +5213,7 @@ if test "$skip_meson" = no; then
         -Dattr=$attr -Ddefault_devices=$default_devices -Dvirglrenderer=$virglrenderer \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
-        -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
+        -Dselinux=$selinux \
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
 	-Dtcg_interpreter=$tcg_interpreter \
         $cross_arg \
diff --git a/meson.build b/meson.build
index 15ef4d3c41..0ded2ac5eb 100644
--- a/meson.build
+++ b/meson.build
@@ -1072,6 +1072,11 @@ keyutils = dependency('libkeyutils', required: false,
 
 has_gettid = cc.has_function('gettid')
 
+# libselinux
+selinux = dependency('libselinux',
+                     required: get_option('selinux'),
+                     method: 'pkg-config', kwargs: static_kwargs)
+
 # Malloc tests
 
 malloc = []
@@ -1300,6 +1305,7 @@ config_host_data.set('CONFIG_FUSE', fuse.found())
 config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
 config_host_data.set('CONFIG_X11', x11.found())
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
+config_host_data.set('CONFIG_SELINUX', selinux.found())
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
@@ -2759,7 +2765,8 @@ if have_tools
   qemu_io = executable('qemu-io', files('qemu-io.c'),
              dependencies: [block, qemuutil], install: true)
   qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
-               dependencies: [blockdev, qemuutil, gnutls], install: true)
+               dependencies: [blockdev, qemuutil, gnutls, selinux],
+               install: true)
 
   subdir('storage-daemon')
   subdir('contrib/rdmacm-mux')
@@ -3124,6 +3131,7 @@ summary_info += {'libpmem support':   libpmem.found()}
 summary_info += {'libdaxctl support': libdaxctl.found()}
 summary_info += {'libudev':           libudev.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
+summary_info += {'selinux':           selinux.found()}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
 
 if not supported_cpus.contains(cpu)
diff --git a/meson_options.txt b/meson_options.txt
index a9a9b8f4c6..a5938500a3 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -155,3 +155,6 @@ option('slirp', type: 'combo', value: 'auto',
 option('fdt', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
        description: 'Whether and how to find the libfdt library')
+
+option('selinux', type: 'feature', value: 'auto',
+       description: 'SELinux support in qemu-nbd')
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 65ebec598f..8da6cd90bb 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -47,6 +47,10 @@
 #include "trace/control.h"
 #include "qemu-version.h"
 
+#ifdef CONFIG_SELINUX
+#include <selinux/selinux.h>
+#endif
+
 #ifdef __linux__
 #define HAVE_NBD_DEVICE 1
 #else
@@ -64,6 +68,7 @@
 #define QEMU_NBD_OPT_FORK          263
 #define QEMU_NBD_OPT_TLSAUTHZ      264
 #define QEMU_NBD_OPT_PID_FILE      265
+#define QEMU_NBD_OPT_SELINUX_LABEL 266
 
 #define MBR_SIZE 512
 
@@ -116,6 +121,9 @@ static void usage(const char *name)
 "  --fork                    fork off the server process and exit the parent\n"
 "                            once the server is running\n"
 "  --pid-file=PATH           store the server's process ID in the given file\n"
+#ifdef CONFIG_SELINUX
+"  --selinux-label=LABEL     set SELinux process label on listening socket\n"
+#endif
 #if HAVE_NBD_DEVICE
 "\n"
 "Kernel NBD client support:\n"
@@ -532,6 +540,8 @@ int main(int argc, char **argv)
         { "trace", required_argument, NULL, 'T' },
         { "fork", no_argument, NULL, QEMU_NBD_OPT_FORK },
         { "pid-file", required_argument, NULL, QEMU_NBD_OPT_PID_FILE },
+        { "selinux-label", required_argument, NULL,
+          QEMU_NBD_OPT_SELINUX_LABEL },
         { NULL, 0, NULL, 0 }
     };
     int ch;
@@ -558,6 +568,7 @@ int main(int argc, char **argv)
     int old_stderr = -1;
     unsigned socket_activation;
     const char *pid_file_name = NULL;
+    const char *selinux_label = NULL;
     BlockExportOptions *export_opts;
 
 #ifdef CONFIG_POSIX
@@ -747,6 +758,9 @@ int main(int argc, char **argv)
         case QEMU_NBD_OPT_PID_FILE:
             pid_file_name = optarg;
             break;
+        case QEMU_NBD_OPT_SELINUX_LABEL:
+            selinux_label = optarg;
+            break;
         }
     }
 
@@ -938,6 +952,19 @@ int main(int argc, char **argv)
         } else {
             backlog = MIN(shared, SOMAXCONN);
         }
+        if (sockpath && selinux_label) {
+#ifdef CONFIG_SELINUX
+            if (setsockcreatecon_raw(selinux_label) == -1) {
+                error_report("Cannot set SELinux socket create context "
+                             "to %s: %s",
+                             selinux_label, strerror(errno));
+                exit(EXIT_FAILURE);
+            }
+#else
+            error_report("SELinux support not enabled in this binary");
+            exit(EXIT_FAILURE);
+#endif
+        }
         saddr = nbd_build_socket_address(sockpath, bindto, port);
         if (qio_net_listener_open_sync(server, saddr, backlog,
                                        &local_err) < 0) {
@@ -945,6 +972,18 @@ int main(int argc, char **argv)
             error_report_err(local_err);
             exit(EXIT_FAILURE);
         }
+        if (sockpath && selinux_label) {
+#ifdef CONFIG_SELINUX
+            if (setsockcreatecon_raw(NULL) == -1) {
+                error_report("Cannot clear SELinux socket create context: %s",
+                             strerror(errno));
+                exit(EXIT_FAILURE);
+            }
+#else
+            error_report("SELinux support not enabled in this binary");
+            exit(EXIT_FAILURE);
+#endif
+        }
     } else {
         size_t i;
         /* See comment in check_socket_activation above. */
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 46398c61ee..7f135f8e8c 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -51,6 +51,7 @@ ENV PACKAGES \
     libpng-devel \
     librbd-devel \
     libseccomp-devel \
+    libselinux-devel \
     libslirp-devel \
     libssh-devel \
     libtasn1-devel \
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index dbb8195eb1..91a7c51614 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -7,6 +7,7 @@ ENV PACKAGES \
     gcc \
     git \
     libffi-devel.i686 \
+    libselinux-devel.i686 \
     libtasn1-devel.i686 \
     libzstd-devel.i686 \
     make \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index eec1add7f6..c6fd7e1113 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -53,6 +53,7 @@ ENV PACKAGES \
     libpng-devel \
     librbd-devel \
     libseccomp-devel \
+    libselinux-devel \
     libslirp-devel \
     libssh-devel \
     libtasn1-devel \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 5a8bee0289..3bbdb67f4f 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -55,6 +55,7 @@ ENV PACKAGES \
     libpulse-devel \
     librbd-devel \
     libseccomp-devel \
+    libselinux-devel \
     libspice-server-devel \
     libssh-devel \
     libtasn1-devel \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 0880bf3e29..450fd06d0d 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -60,6 +60,7 @@ ENV PACKAGES \
     libsdl2-dev \
     libsdl2-image-dev \
     libseccomp-dev \
+    libselinux-dev \
     libsnappy-dev \
     libspice-protocol-dev \
     libspice-server-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 39de63d012..15a026be09 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -60,6 +60,7 @@ ENV PACKAGES \
     libsdl2-dev \
     libsdl2-image-dev \
     libseccomp-dev \
+    libselinux-dev \
     libslirp-dev \
     libsnappy-dev \
     libspice-protocol-dev \
-- 
2.32.0


