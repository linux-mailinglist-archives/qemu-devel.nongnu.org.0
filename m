Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEA354CDAC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:59:04 +0200 (CEST)
Received: from localhost ([::1]:48444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1VQ7-0002Tv-AN
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLi-0003x0-W0
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLf-0007J0-OL
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655308466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MkRklNSy2yniK/CNmaX0qG2VchhSg1earBDHS0IXhOg=;
 b=aTQzt/ljR7ibCx84+03OLHATw9sPxh5k6fXfAhMu04iL5ogx4YEz+Hq1d48LDVjjLCXZjn
 wbqiSQkE+ojbnayjHfs8Cja1uTYcHzBEoUYGPmsSPkN009+UgaTJiB+C9Q+YTMRiLJyHq4
 loGAg3gnovPAA1wChE7iexi8CPHcQZw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-bC2RbRQePk-jTlphPWz32A-1; Wed, 15 Jun 2022 11:54:23 -0400
X-MC-Unique: bC2RbRQePk-jTlphPWz32A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C0BA38005C8;
 Wed, 15 Jun 2022 15:54:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AB97C2811A;
 Wed, 15 Jun 2022 15:54:21 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 <qemu-block@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, virtio-fs@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Julia Suvorova <jusual@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PULL 06/18] vfio-user: build library
Date: Wed, 15 Jun 2022 16:51:17 +0100
Message-Id: <20220615155129.1025811-7-stefanha@redhat.com>
In-Reply-To: <20220615155129.1025811-1-stefanha@redhat.com>
References: <20220615155129.1025811-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jagannathan Raman <jag.raman@oracle.com>

add the libvfio-user library as a submodule. build it as a meson
subproject.

libvfio-user is distributed with BSD 3-Clause license and
json-c with MIT (Expat) license

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: c2adec87958b081d1dc8775d4aa05c897912f025.1655151679.git.jag.raman@oracle.com

[Changed submodule URL to QEMU's libvfio-user mirror on GitLab. The QEMU
project mirrors its dependencies so that it can provide full source code
even in the event that its dependencies become unavailable. Note that
the mirror repo is manually updated, so please contact me to make newer
libvfio-user commits available. If I become a bottleneck we can set up a
cronjob.

Updated scripts/meson-buildoptions.sh to match the meson_options.txt
change. Failure to do so can result in scripts/meson-buildoptions.sh
being modified by the build system later on and you end up with a dirty
working tree.
--Stefan]

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS                             |  1 +
 meson_options.txt                       |  2 ++
 configure                               | 17 +++++++++++++++++
 meson.build                             | 23 ++++++++++++++++++++++-
 .gitlab-ci.d/buildtest.yml              |  1 +
 .gitmodules                             |  3 +++
 Kconfig.host                            |  4 ++++
 hw/remote/Kconfig                       |  4 ++++
 hw/remote/meson.build                   |  2 ++
 scripts/meson-buildoptions.sh           |  4 ++++
 subprojects/libvfio-user                |  1 +
 tests/docker/dockerfiles/centos8.docker |  2 ++
 12 files changed, 63 insertions(+), 1 deletion(-)
 create mode 160000 subprojects/libvfio-user

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ba93348aa..d0fcaf0edb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3642,6 +3642,7 @@ F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
+F: subprojects/libvfio-user
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/meson_options.txt b/meson_options.txt
index 0e8197386b..f3e2f22c1e 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -88,6 +88,8 @@ option('cfi_debug', type: 'boolean', value: 'false',
        description: 'Verbose errors in case of CFI violation')
 option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
+option('vfio_user_server', type: 'feature', value: 'disabled',
+       description: 'vfio-user server support')
 option('dbus_display', type: 'feature', value: 'auto',
        description: '-display dbus support')
 option('tpm', type : 'feature', value : 'auto',
diff --git a/configure b/configure
index 4b12a8094c..c14e7f590a 100755
--- a/configure
+++ b/configure
@@ -315,6 +315,7 @@ meson_args=""
 ninja=""
 bindir="bin"
 skip_meson=no
+vfio_user_server="disabled"
 
 # The following Meson options are handled manually (still they
 # are included in the automatically generated help message)
@@ -909,6 +910,10 @@ for opt do
   ;;
   --disable-blobs) meson_option_parse --disable-install-blobs ""
   ;;
+  --enable-vfio-user-server) vfio_user_server="enabled"
+  ;;
+  --disable-vfio-user-server) vfio_user_server="disabled"
+  ;;
   --enable-tcmalloc) meson_option_parse --enable-malloc=tcmalloc tcmalloc
   ;;
   --enable-jemalloc) meson_option_parse --enable-malloc=jemalloc jemalloc
@@ -2132,6 +2137,17 @@ write_container_target_makefile() {
 
 
 
+##########################################
+# check for vfio_user_server
+
+case "$vfio_user_server" in
+  enabled )
+    if test "$git_submodules_action" != "ignore"; then
+      git_submodules="${git_submodules} subprojects/libvfio-user"
+    fi
+    ;;
+esac
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -2672,6 +2688,7 @@ if test "$skip_meson" = no; then
   test "$slirp" != auto && meson_option_add "-Dslirp=$slirp"
   test "$smbd" != '' && meson_option_add "-Dsmbd=$smbd"
   test "$tcg" != enabled && meson_option_add "-Dtcg=$tcg"
+  test "$vfio_user_server" != auto && meson_option_add "-Dvfio_user_server=$vfio_user_server"
   run_meson() {
     NINJA=$ninja $meson setup --prefix "$prefix" "$@" $cross_arg "$PWD" "$source_path"
   }
diff --git a/meson.build b/meson.build
index 9e65cc5367..ca19ddc30c 100644
--- a/meson.build
+++ b/meson.build
@@ -308,6 +308,10 @@ multiprocess_allowed = get_option('multiprocess') \
   .require(targetos == 'linux', error_message: 'Multiprocess QEMU is supported only on Linux') \
   .allowed()
 
+vfio_user_server_allowed = get_option('vfio_user_server') \
+  .require(targetos == 'linux', error_message: 'vfio-user server is supported only on Linux') \
+  .allowed()
+
 have_tpm = get_option('tpm') \
   .require(targetos != 'windows', error_message: 'TPM emulation only available on POSIX systems') \
   .allowed()
@@ -2380,7 +2384,8 @@ host_kconfig = \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   (have_pvrdma ? ['CONFIG_PVRDMA=y'] : []) + \
-  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
+  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
+  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2672,6 +2677,21 @@ if have_system
   endif
 endif
 
+libvfio_user_dep = not_found
+if have_system and vfio_user_server_allowed
+  have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libvfio-user/meson.build')
+
+  if not have_internal
+    error('libvfio-user source not found - please pull git submodule')
+  endif
+
+  libvfio_user_proj = subproject('libvfio-user')
+
+  libvfio_user_lib = libvfio_user_proj.get_variable('libvfio_user_dep')
+
+  libvfio_user_dep = declare_dependency(dependencies: [libvfio_user_lib])
+endif
+
 fdt = not_found
 if have_system
   fdt_opt = get_option('fdt')
@@ -3790,6 +3810,7 @@ summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
   summary_info += {'out of process emulation': multiprocess_allowed}
+  summary_info += {'vfio-user server': vfio_user_server_allowed}
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index cb7cad44b5..8a4353ef93 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -168,6 +168,7 @@ build-system-centos:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
       --enable-modules --enable-trace-backends=dtrace --enable-docs
+      --enable-vfio-user-server
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/.gitmodules b/.gitmodules
index b8bff47df8..aedd9a03d4 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
 	url = https://gitlab.com/libvirt/libvirt-ci.git
+[submodule "subprojects/libvfio-user"]
+	path = subprojects/libvfio-user
+	url = https://gitlab.com/qemu-project/libvfio-user.git
diff --git a/Kconfig.host b/Kconfig.host
index 1165c4eacd..d763d89269 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -42,3 +42,7 @@ config MULTIPROCESS_ALLOWED
 config FUZZ
     bool
     select SPARSE_MEM
+
+config VFIO_USER_SERVER_ALLOWED
+    bool
+    imply VFIO_USER_SERVER
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
index 08c16e235f..2d6b4f4cf4 100644
--- a/hw/remote/Kconfig
+++ b/hw/remote/Kconfig
@@ -2,3 +2,7 @@ config MULTIPROCESS
     bool
     depends on PCI && PCI_EXPRESS && KVM
     select REMOTE_PCIHOST
+
+config VFIO_USER_SERVER
+    bool
+    depends on MULTIPROCESS
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index e6a5574242..7da83350c8 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -7,6 +7,8 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
 
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: libvfio_user_dep)
+
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 1fc1d2e2c3..24eb5f35ea 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -153,6 +153,8 @@ meson_options_help() {
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
   printf "%s\n" '  vdi             vdi image format support'
+  printf "%s\n" '  vfio-user-server'
+  printf "%s\n" '                  vfio-user server support'
   printf "%s\n" '  vhost-crypto    vhost-user crypto backend support'
   printf "%s\n" '  vhost-kernel    vhost kernel backend support'
   printf "%s\n" '  vhost-net       vhost-net kernel acceleration support'
@@ -415,6 +417,8 @@ _meson_option_parse() {
     --disable-vde) printf "%s" -Dvde=disabled ;;
     --enable-vdi) printf "%s" -Dvdi=enabled ;;
     --disable-vdi) printf "%s" -Dvdi=disabled ;;
+    --enable-vfio-user-server) printf "%s" -Dvfio_user_server=enabled ;;
+    --disable-vfio-user-server) printf "%s" -Dvfio_user_server=disabled ;;
     --enable-vhost-crypto) printf "%s" -Dvhost_crypto=enabled ;;
     --disable-vhost-crypto) printf "%s" -Dvhost_crypto=disabled ;;
     --enable-vhost-kernel) printf "%s" -Dvhost_kernel=enabled ;;
diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
new file mode 160000
index 0000000000..0b28d20557
--- /dev/null
+++ b/subprojects/libvfio-user
@@ -0,0 +1 @@
+Subproject commit 0b28d205572c80b568a1003db2c8f37ca333e4d7
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 4b20925bbf..10618bfa83 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -51,6 +51,7 @@ RUN dnf update -y && \
         libbpf-devel \
         libcacard-devel \
         libcap-ng-devel \
+        libcmocka-devel \
         libcurl-devel \
         libdrm-devel \
         libepoxy-devel \
@@ -59,6 +60,7 @@ RUN dnf update -y && \
         libgcrypt-devel \
         libiscsi-devel \
         libjpeg-devel \
+        json-c-devel \
         libnfs-devel \
         libpmem-devel \
         libpng-devel \
-- 
2.36.1


