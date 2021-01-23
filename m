Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0616D301600
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:40:24 +0100 (CET)
Received: from localhost ([::1]:53152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3K5O-0007ST-U1
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxI-0003fc-4D
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxF-0005sk-Kl
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xycjg178nf9H3ObF5Leh9S5Peb7Fd6v0CS4DI8VdzgU=;
 b=cGfkMly3lIMvHvb5eL8IAM/4STd1978xD2G2z4jHH9j0VRNf1O7jUzY6ujUAh87Lk077bd
 xgVuMquI0jiRd7+1UzC5s0J8pEcfMRLpPd7DYVvEKBq58omkcJb1GrG2z6jMpl9WO/924H
 krmjRfCXA7Wrd9WCaSukznRlCS+FQ6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-tQmdjyMCNDqufVlAP_mwDw-1; Sat, 23 Jan 2021 09:31:54 -0500
X-MC-Unique: tQmdjyMCNDqufVlAP_mwDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8A86806677
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 737B819C44;
 Sat, 23 Jan 2021 14:31:53 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/31] meson: Summarize compilation-related information
 altogether
Date: Sat, 23 Jan 2021 09:31:15 -0500
Message-Id: <20210123143128.1167797-19-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210121095616.1471869-5-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 66 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/meson.build b/meson.build
index b1d12d8c74..3b2332b94d 100644
--- a/meson.build
+++ b/meson.build
@@ -2304,7 +2304,10 @@ summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
 summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
 summary(summary_info, bool_yn: true, section: 'Configurable features')
 
+# Compilation information
 summary_info = {}
+summary_info += {'host CPU':          cpu}
+summary_info += {'host endianness':   build_machine.endian()}
 summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
 summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
 if link_language == 'cpp'
@@ -2315,6 +2318,11 @@ endif
 if targetos == 'darwin'
   summary_info += {'Objective-C compiler': meson.get_compiler('objc').cmd_array()[0]}
 endif
+if targetos == 'windows'
+  if 'WIN_SDK' in config_host
+    summary_info += {'Windows SDK':   config_host['WIN_SDK']}
+  endif
+endif
 summary_info += {'ARFLAGS':           config_host['ARFLAGS']}
 summary_info += {'CFLAGS':            ' '.join(get_option('c_args')
                                                + ['-O' + get_option('optimization')]
@@ -2330,17 +2338,36 @@ if link_args.length() > 0
 endif
 summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
-# TODO: add back version
-summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
-summary_info += {'host CPU':          cpu}
-summary_info += {'host endianness':   build_machine.endian()}
-summary_info += {'target list':       ' '.join(target_dirs)}
-summary_info += {'gprof enabled':     config_host.has_key('CONFIG_GPROF')}
-summary_info += {'sparse enabled':    sparse.found()}
-summary_info += {'strip binaries':    get_option('strip')}
 summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
+summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
+summary_info += {'malloc trim support': has_malloc_trim}
+summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
+summary_info += {'preadv support':    config_host.has_key('CONFIG_PREADV')}
+summary_info += {'fdatasync':         config_host.has_key('CONFIG_FDATASYNC')}
+summary_info += {'madvise':           config_host.has_key('CONFIG_MADVISE')}
+summary_info += {'posix_madvise':     config_host.has_key('CONFIG_POSIX_MADVISE')}
+summary_info += {'posix_memalign':    config_host.has_key('CONFIG_POSIX_MEMALIGN')}
+summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
+summary_info += {'mutex debugging':   config_host.has_key('CONFIG_DEBUG_MUTEX')}
+summary_info += {'memory allocator':  get_option('malloc')}
+summary_info += {'avx2 optimization': config_host.has_key('CONFIG_AVX2_OPT')}
+summary_info += {'avx512f optimization': config_host.has_key('CONFIG_AVX512F_OPT')}
+summary_info += {'gprof enabled':     config_host.has_key('CONFIG_GPROF')}
+summary_info += {'gcov':              get_option('b_coverage')}
+summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
+summary_info += {'CFI support':       get_option('cfi')}
+if get_option('cfi')
+  summary_info += {'CFI debug support': get_option('cfi_debug')}
+endif
+summary_info += {'strip binaries':    get_option('strip')}
+summary_info += {'sparse':            sparse.found() ? sparse.full_path() : false}
+summary_info += {'mingw32 support':   targetos == 'windows'}
+summary(summary_info, bool_yn: true, section: 'Compilation')
+
+summary_info = {}
+summary_info += {'target list':       ' '.join(target_dirs)}
 if targetos == 'darwin'
   summary_info += {'Cocoa support':   cocoa.found()}
 endif
@@ -2365,6 +2392,8 @@ summary_info += {'nettle':            config_host.has_key('CONFIG_NETTLE')}
 if config_host.has_key('CONFIG_NETTLE')
    summary_info += {'  XTS':             not config_host.has_key('CONFIG_QEMU_PRIVATE_XTS')}
 endif
+# TODO: add back version
+summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
 summary_info += {'libtasn1':          config_host.has_key('CONFIG_TASN1')}
 summary_info += {'PAM':               config_host.has_key('CONFIG_AUTH_PAM')}
 summary_info += {'iconv support':     iconv.found()}
@@ -2372,7 +2401,6 @@ summary_info += {'curses support':    curses.found()}
 # TODO: add back version
 summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
 summary_info += {'curl support':      curl.found()}
-summary_info += {'mingw32 support':   targetos == 'windows'}
 summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
 summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
 summary_info += {'VirtFS support':    have_virtfs}
@@ -2389,7 +2417,6 @@ if config_host.has_key('CONFIG_XEN_BACKEND')
   summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
 endif
 summary_info += {'brlapi support':    brlapi.found()}
-summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
 summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
@@ -2404,16 +2431,9 @@ if config_all.has_key('CONFIG_TCG')
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
   summary_info += {'TCG interpreter':   tcg_arch == 'tci'}
 endif
-summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
 summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
 summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
-summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
-summary_info += {'preadv support':    config_host.has_key('CONFIG_PREADV')}
-summary_info += {'fdatasync':         config_host.has_key('CONFIG_FDATASYNC')}
-summary_info += {'madvise':           config_host.has_key('CONFIG_MADVISE')}
-summary_info += {'posix_madvise':     config_host.has_key('CONFIG_POSIX_MADVISE')}
-summary_info += {'posix_memalign':    config_host.has_key('CONFIG_POSIX_MEMALIGN')}
 summary_info += {'libcap-ng support': libcap_ng.found()}
 # TODO: add back protocol and server version
 summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
@@ -2428,24 +2448,16 @@ summary_info += {'OpenGL dmabufs':    config_host.has_key('CONFIG_OPENGL_DMABUF'
 summary_info += {'libiscsi support':  libiscsi.found()}
 summary_info += {'libnfs support':    libnfs.found()}
 if targetos == 'windows'
-  if 'WIN_SDK' in config_host
-    summary_info += {'Windows SDK':       config_host['WIN_SDK']}
-  endif
   if config_host.has_key('CONFIG_GUEST_AGENT')
     summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
     summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
   endif
 endif
 summary_info += {'seccomp support':   seccomp.found()}
-summary_info += {'CFI support':       get_option('cfi')}
-summary_info += {'CFI debug support': get_option('cfi_debug')}
 summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
 summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
-summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
-summary_info += {'mutex debugging':   config_host.has_key('CONFIG_DEBUG_MUTEX')}
 summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
 summary_info += {'GlusterFS support': glusterfs.found()}
-summary_info += {'gcov':              get_option('b_coverage')}
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
 summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
@@ -2456,9 +2468,6 @@ summary_info += {'lzfse support':     liblzfse.found()}
 summary_info += {'zstd support':      zstd.found()}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
 summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
-summary_info += {'memory allocator':  get_option('malloc')}
-summary_info += {'avx2 optimization': config_host.has_key('CONFIG_AVX2_OPT')}
-summary_info += {'avx512f optimization': config_host.has_key('CONFIG_AVX512F_OPT')}
 summary_info += {'replication support': config_host.has_key('CONFIG_REPLICATION')}
 summary_info += {'bochs support':     config_host.has_key('CONFIG_BOCHS')}
 summary_info += {'cloop support':     config_host.has_key('CONFIG_CLOOP')}
@@ -2474,7 +2483,6 @@ summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
 summary_info += {'default devices':   get_option('default_devices')}
-summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE exports':      fuse.found()}
-- 
2.26.2



