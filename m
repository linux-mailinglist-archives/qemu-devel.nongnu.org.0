Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211CC453828
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:58:30 +0100 (CET)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1mv-0006Vv-8m
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:58:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mn1jP-0002xV-Ge
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:54:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mn1jH-0000Fr-QU
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637081683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sbkXkWwBgv3fMCj8AFErpK/J39o4GEKSzoSUCtIP5dM=;
 b=EL7U2fotpVduC7fbqShxt32TGVylh7EoNH1ctte2cUWIQHxYGcTaAUJfENwqOkySGRX/QH
 lRPglX7rYR89civ5vzUdWsvZ/YXWx+fkYw8TPVDQYFouH96uY9qxcGP4gGYL8vpkvJvJov
 zJfeyfFWh1HSLBHFDbK9qa5cuYs+l/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-VCkL3ITJNCqNpMK_ODJY7g-1; Tue, 16 Nov 2021 11:54:39 -0500
X-MC-Unique: VCkL3ITJNCqNpMK_ODJY7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23B76804143;
 Tue, 16 Nov 2021 16:54:38 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C952E1981F;
 Tue, 16 Nov 2021 16:54:15 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] nbd/server: Add --selinux-label option
Date: Tue, 16 Nov 2021 10:54:08 -0600
Message-Id: <20211116165408.751417-3-eblake@redhat.com>
In-Reply-To: <20211116165408.751417-1-eblake@redhat.com>
References: <20211116165408.751417-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Richard W.M. Jones" <rjones@redhat.com>

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

[eblake: rebase to configure changes, reject --selinux-label if it is
not compiled in or not used on a Unix socket]
Note that we may relax some of these restrictions at a later date,
such as making it possible to label a TCP socket, although it may be
smarter to do so as a generic QMP action rather than more one-off
command lines in qemu-nbd.
Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20211115202944.615966-1-eblake@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
[eblake: adjust meson output as suggested by thuth]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 meson.build                                   | 10 +++-
 qemu-nbd.c                                    | 46 +++++++++++++++++++
 meson_options.txt                             |  3 ++
 scripts/meson-buildoptions.sh                 |  3 ++
 tests/docker/dockerfiles/centos8.docker       |  1 +
 .../dockerfiles/fedora-i386-cross.docker      |  1 +
 tests/docker/dockerfiles/fedora.docker        |  1 +
 tests/docker/dockerfiles/opensuse-leap.docker |  1 +
 tests/docker/dockerfiles/ubuntu1804.docker    |  1 +
 tests/docker/dockerfiles/ubuntu2004.docker    |  1 +
 10 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 2ece4fe0889a..084806a9415c 100644
--- a/meson.build
+++ b/meson.build
@@ -1201,6 +1201,11 @@ keyutils = dependency('libkeyutils', required: false,

 has_gettid = cc.has_function('gettid')

+# libselinux
+selinux = dependency('libselinux',
+                     required: get_option('selinux'),
+                     method: 'pkg-config', kwargs: static_kwargs)
+
 # Malloc tests

 malloc = []
@@ -1479,6 +1484,7 @@ config_host_data.set('CONFIG_SPICE_PROTOCOL', spice_protocol.found())
 config_host_data.set('CONFIG_SPICE', spice.found())
 config_host_data.set('CONFIG_X11', x11.found())
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
+config_host_data.set('CONFIG_SELINUX', selinux.found())
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
@@ -3054,7 +3060,8 @@ if have_tools
   qemu_io = executable('qemu-io', files('qemu-io.c'),
              dependencies: [block, qemuutil], install: true)
   qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
-               dependencies: [blockdev, qemuutil, gnutls], install: true)
+               dependencies: [blockdev, qemuutil, gnutls, selinux],
+               install: true)

   subdir('storage-daemon')
   subdir('contrib/rdmacm-mux')
@@ -3430,6 +3437,7 @@ summary_info += {'libdaxctl support': libdaxctl}
 summary_info += {'libudev':           libudev}
 # Dummy dependency, keep .found()
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
+summary_info += {'selinux':           selinux}
 summary(summary_info, bool_yn: true, section: 'Dependencies')

 if not supported_cpus.contains(cpu)
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 9d895ba24b1e..c6c20df68a4d 100644
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
@@ -454,6 +462,7 @@ static const char *socket_activation_validate_opts(const char *device,
                                                    const char *sockpath,
                                                    const char *address,
                                                    const char *port,
+                                                   const char *selinux,
                                                    bool list)
 {
     if (device != NULL) {
@@ -472,6 +481,10 @@ static const char *socket_activation_validate_opts(const char *device,
         return "TCP port number can't be set when using socket activation";
     }

+    if (selinux != NULL) {
+        return "SELinux label can't be set when using socket activation";
+    }
+
     if (list) {
         return "List mode is incompatible with socket activation";
     }
@@ -534,6 +547,8 @@ int main(int argc, char **argv)
         { "trace", required_argument, NULL, 'T' },
         { "fork", no_argument, NULL, QEMU_NBD_OPT_FORK },
         { "pid-file", required_argument, NULL, QEMU_NBD_OPT_PID_FILE },
+        { "selinux-label", required_argument, NULL,
+          QEMU_NBD_OPT_SELINUX_LABEL },
         { NULL, 0, NULL, 0 }
     };
     int ch;
@@ -560,6 +575,7 @@ int main(int argc, char **argv)
     int old_stderr = -1;
     unsigned socket_activation;
     const char *pid_file_name = NULL;
+    const char *selinux_label = NULL;
     BlockExportOptions *export_opts;

 #ifdef CONFIG_POSIX
@@ -749,6 +765,9 @@ int main(int argc, char **argv)
         case QEMU_NBD_OPT_PID_FILE:
             pid_file_name = optarg;
             break;
+        case QEMU_NBD_OPT_SELINUX_LABEL:
+            selinux_label = optarg;
+            break;
         }
     }

@@ -788,6 +807,7 @@ int main(int argc, char **argv)
         /* Using socket activation - check user didn't use -p etc. */
         const char *err_msg = socket_activation_validate_opts(device, sockpath,
                                                               bindto, port,
+                                                              selinux_label,
                                                               list);
         if (err_msg != NULL) {
             error_report("%s", err_msg);
@@ -827,6 +847,18 @@ int main(int argc, char **argv)
         }
     }

+    if (selinux_label) {
+#ifdef CONFIG_SELINUX
+        if (sockpath == NULL && device == NULL) {
+            error_report("--selinux-label is not permitted without --socket");
+            exit(EXIT_FAILURE);
+        }
+#else
+        error_report("SELinux support not enabled in this binary");
+        exit(EXIT_FAILURE);
+#endif
+    }
+
     if (list) {
         saddr = nbd_build_socket_address(sockpath, bindto, port);
         return qemu_nbd_client_list(saddr, tlscreds, bindto);
@@ -940,6 +972,13 @@ int main(int argc, char **argv)
         } else {
             backlog = MIN(shared, SOMAXCONN);
         }
+#ifdef CONFIG_SELINUX
+        if (selinux_label && setsockcreatecon_raw(selinux_label) == -1) {
+            error_report("Cannot set SELinux socket create context to %s: %s",
+                         selinux_label, strerror(errno));
+            exit(EXIT_FAILURE);
+        }
+#endif
         saddr = nbd_build_socket_address(sockpath, bindto, port);
         if (qio_net_listener_open_sync(server, saddr, backlog,
                                        &local_err) < 0) {
@@ -947,6 +986,13 @@ int main(int argc, char **argv)
             error_report_err(local_err);
             exit(EXIT_FAILURE);
         }
+#ifdef CONFIG_SELINUX
+        if (selinux_label && setsockcreatecon_raw(NULL) == -1) {
+            error_report("Cannot clear SELinux socket create context: %s",
+                         strerror(errno));
+            exit(EXIT_FAILURE);
+        }
+#endif
     } else {
         size_t i;
         /* See comment in check_socket_activation above. */
diff --git a/meson_options.txt b/meson_options.txt
index 411952bc91af..e3923237322a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -201,3 +201,6 @@ option('slirp', type: 'combo', value: 'auto',
 option('fdt', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
        description: 'Whether and how to find the libfdt library')
+
+option('selinux', type: 'feature', value: 'auto',
+       description: 'SELinux support in qemu-nbd')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 45e1f2e20daa..7a17ff42182f 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -72,6 +72,7 @@ meson_options_help() {
   printf "%s\n" '  sdl             SDL user interface'
   printf "%s\n" '  sdl-image       SDL Image support for icons'
   printf "%s\n" '  seccomp         seccomp support'
+  printf "%s\n" '  selinux         SELinux support in qemu-nbd'
   printf "%s\n" '  smartcard       CA smartcard emulation support'
   printf "%s\n" '  snappy          snappy compression support'
   printf "%s\n" '  sparse          sparse checker'
@@ -215,6 +216,8 @@ _meson_option_parse() {
     --disable-sdl-image) printf "%s" -Dsdl_image=disabled ;;
     --enable-seccomp) printf "%s" -Dseccomp=enabled ;;
     --disable-seccomp) printf "%s" -Dseccomp=disabled ;;
+    --enable-selinux) printf "%s" -Dselinux=enabled ;;
+    --disable-selinux) printf "%s" -Dselinux=disabled ;;
     --enable-slirp) printf "%s" -Dslirp=enabled ;;
     --disable-slirp) printf "%s" -Dslirp=disabled ;;
     --enable-slirp=*) quote_sh "-Dslirp=$2" ;;
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 46398c61eea9..7f135f8e8c00 100644
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
index f62a71ce2296..13328e6081f9 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -8,6 +8,7 @@ ENV PACKAGES \
     gcc \
     git \
     libffi-devel.i686 \
+    libselinux-devel.i686 \
     libtasn1-devel.i686 \
     libzstd-devel.i686 \
     make \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index eec1add7f620..c6fd7e1113d4 100644
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
index 5a8bee028951..3bbdb67f4fad 100644
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
index 0880bf3e2928..450fd06d0d57 100644
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
index 39de63d0129f..15a026be0913 100644
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
2.33.1


