Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ACE402916
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:41:06 +0200 (CEST)
Received: from localhost ([::1]:43074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaPR-0000Qa-U0
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa75-0001Fz-6l
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:22:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa73-00076B-3h
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=boIguc3k702SLL3dtYGl6A5xhu1pXRPkXWlbNcoqd3Y=;
 b=Jt6WfeUhR8eFOSrMaV57KcO+PYjJyfvZfmLO5PUDD2lQzmKDVUQldzVvGtZ7O8ApMYilGp
 INrcqYvrGKoQfrC+znDcf+aUEx2sWKHENor9vap/PuhbhCyuuKpmCOduwZw6qszf/dxeqO
 Itpv6RWBc5JEpg1m5wdtaUg3pTy4fHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-_uA3K8xYPTu3sqD9kuUmjQ-1; Tue, 07 Sep 2021 08:22:01 -0400
X-MC-Unique: _uA3K8xYPTu3sqD9kuUmjQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E793835DE2
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:22:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33A456608B;
 Tue,  7 Sep 2021 12:21:51 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 10/32] build-sys: add --with-rust{-target} & basic build
 infrastructure
Date: Tue,  7 Sep 2021 16:19:21 +0400
Message-Id: <20210907121943.3498701-11-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add the build-sys infrastructure to optionally build Rust code.
Introduce a top-level workspace, so various sub-projects (libraries,
executables etc) can be developed together, sharing the dependencies and
output directory.

If not Tier 1 (aarch64 and x86), all of the host architecture QEMU
supports should be Tier 2:
https://doc.rust-lang.org/nightly/rustc/platform-support.html

Rust is generally available on various distributions (thanks to Firefox,
I suppose). If not, it can usually be installed with rustup.

configure will enable Rust support automatically if cargo is present.
Rust support can be disabled --without-rust. When detecting windows
cross building, it will use the $cpu-pc-windows-gnu target by
default (more default mappings could be added over time). This can be
changed with --with-rust-target=RTT.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure         | 11 +++++++++++
 meson.build       | 27 +++++++++++++++++++++++++++
 .gitignore        |  1 +
 Cargo.toml        |  2 ++
 meson_options.txt |  5 +++++
 5 files changed, 46 insertions(+)
 create mode 100644 Cargo.toml

diff --git a/configure b/configure
index 48ff2837d9..470b90543f 100755
--- a/configure
+++ b/configure
@@ -445,6 +445,8 @@ fuse="auto"
 fuse_lseek="auto"
 multiprocess="auto"
 slirp_smbd="$default_feature"
+with_rust="auto"
+with_rust_target=""
 
 malloc_trim="auto"
 gio="$default_feature"
@@ -1586,6 +1588,12 @@ for opt do
   ;;
   --disable-slirp-smbd) slirp_smbd=no
   ;;
+  --with-rust) with_rust=enabled
+  ;;
+  --without-rust) with_rust=disabled
+  ;;
+  --with-rust-target=*) with_rust_target="$optarg"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1773,6 +1781,8 @@ Advanced options (experts only):
   --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
   --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
   --cross-cc-flags-ARCH=   use compiler flags when building ARCH guest tests
+  --with-rust              enable Rust compilation
+  --with-rust-target=RTT   use the given Rust target triple
   --make=MAKE              use specified make [$make]
   --python=PYTHON          use specified python [$python]
   --sphinx-build=SPHINX    use specified sphinx-build [$sphinx_build]
@@ -5199,6 +5209,7 @@ if test "$skip_meson" = no; then
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
+        -Dwith_rust=$with_rust -Dwith_rust_target=$with_rust_target \
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
         -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
diff --git a/meson.build b/meson.build
index cbf3ce19ae..63b61a2bc8 100644
--- a/meson.build
+++ b/meson.build
@@ -108,6 +108,29 @@ endif
 
 bzip2 = find_program('bzip2', required: install_edk2_blobs)
 
+cargo = find_program('cargo', required: get_option('with_rust'))
+with_rust = cargo.found()
+
+if with_rust
+  rust_target_triple = get_option('with_rust_target')
+  if meson.is_cross_build()
+    # more default target mappings may be added over time
+    if rust_target_triple == '' and targetos == 'windows'
+      rust_target_triple = host_machine.cpu() + '-pc-windows-gnu'
+    endif
+    if rust_target_triple == ''
+      error('cross-compiling, but no Rust target-triple defined.')
+    endif
+  endif
+endif
+config_host_data.set('CONFIG_WITH_RUST', with_rust)
+
+if get_option('optimization') in ['0', '1', 'g']
+  rs_build_type = 'debug'
+else
+  rs_build_type = 'release'
+endif
+
 ##################
 # Compiler flags #
 ##################
@@ -2916,6 +2939,10 @@ if targetos == 'windows'
     summary_info += {'Windows SDK':   config_host['WIN_SDK']}
   endif
 endif
+summary_info += {'Rust support':      with_rust}
+if with_rust and rust_target_triple != ''
+  summary_info += {'Rust target':     rust_target_triple}
+endif
 summary_info += {'CFLAGS':            ' '.join(get_option('c_args')
                                                + ['-O' + get_option('optimization')]
                                                + (get_option('debug') ? ['-g'] : []))}
diff --git a/.gitignore b/.gitignore
index eb2553026c..78715bc7c4 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,5 +1,6 @@
 /GNUmakefile
 /build/
+/target/
 *.pyc
 .sdk
 .stgit-*
diff --git a/Cargo.toml b/Cargo.toml
new file mode 100644
index 0000000000..c4b464ff15
--- /dev/null
+++ b/Cargo.toml
@@ -0,0 +1,2 @@
+[workspace]
+members = []
diff --git a/meson_options.txt b/meson_options.txt
index a9a9b8f4c6..fe9f90634b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -155,3 +155,8 @@ option('slirp', type: 'combo', value: 'auto',
 option('fdt', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
        description: 'Whether and how to find the libfdt library')
+
+option('with_rust', type: 'feature', value: 'auto',
+       description: 'Enable Rust support')
+option('with_rust_target', type : 'string', value: '',
+       description: 'Rust target triple')
-- 
2.33.0.113.g6c40894d24


