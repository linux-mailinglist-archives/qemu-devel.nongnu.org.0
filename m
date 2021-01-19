Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD432FC05C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:53:12 +0100 (CET)
Received: from localhost ([::1]:49756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1x3v-0002YV-5q
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5B-0003Ka-0g
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w58-0003RG-RY
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611082221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ik06c8Y57UOuW4MapfWrFiiX4eYUGe157fe/fvcAg6U=;
 b=IMNlKM6/x/SjPK6eGDW8gyk9lHvJ+OOEN6U1SOISkU49XLx9008Ekt9IV5AbwuCegDQOov
 +wWxzUd0G0OszTDnmFKQCw8hKNZNaFqvneAS/BMLIzuZ3FZgLaT0Xg5z69DeXkheSCxyFk
 6n2DnvyJCrKRfxlKIKRl5mTsnvUBRIk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-6wc0werRMaGgf_D-tezGsg-1; Tue, 19 Jan 2021 13:50:19 -0500
X-MC-Unique: 6wc0werRMaGgf_D-tezGsg-1
Received: by mail-ej1-f71.google.com with SMTP id le12so3554035ejb.13
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ik06c8Y57UOuW4MapfWrFiiX4eYUGe157fe/fvcAg6U=;
 b=rd+XR+FDBhKQswXQKGcCtqKn7J1qLgC6hGmnXS/P/zCLWhHq/61U205ZlVP4/YmHFe
 W/A4FgO/1vxZDqR3oOmSCFV8lHG6+8klHVN35lU+BIHnmDl7cSsh+ZkQ2+LYFEnCrwpX
 0RbLEaKjQqlHYYBMhpSyq7a02Cq0s9UB5ClloCBHpqWJzXW4Ew3oGgyeYZPFBdiKViI2
 w5xN0Md7jN1N4oUbKng5MU53NBAdNuqI6Lyix5ADx0YmArmdL2cc3O47CMjX4ELHAsX4
 lSGiCb2CK6+WBo1OFfDU2wP3J4TFgYyQ2QRmg+w0625rIh9bTq0Ec03Ve4oqdIX2W4lD
 ZbUA==
X-Gm-Message-State: AOAM530Bj0PuIeqkG1RTbgPZwKz+ZZVARr/+16XoKt+b2LcylcwDD9De
 MApfEh5zfyeKwVP58UPM4QGKPMT/awJWIa8kvjhdvhc6ZIUpIR6Z1b9QMil2qIxyDr+51aa2OQ9
 iPDNogKXGE8BnVBPrLp7OhAHudX62ew7k+ylp+KuKxsAvAsqLkK8qpO1HGyOcdpyr
X-Received: by 2002:a17:907:a06f:: with SMTP id
 ia15mr3906513ejc.328.1611082218254; 
 Tue, 19 Jan 2021 10:50:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySRmXI2j6nqDhE54R6WGZR7GIdzJXl1sgEu6lP/5L+1D+1zSxeNYO56pBZ9XcqmiBYvA9fWA==
X-Received: by 2002:a17:907:a06f:: with SMTP id
 ia15mr3906499ejc.328.1611082218043; 
 Tue, 19 Jan 2021 10:50:18 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a22sm9679099edv.67.2021.01.19.10.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:50:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] meson: Summarize compilation information altogether
Date: Tue, 19 Jan 2021 19:49:58 +0100
Message-Id: <20210119185005.880322-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119185005.880322-1-philmd@redhat.com>
References: <20210119185005.880322-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 53 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/meson.build b/meson.build
index ddac09ca159..27a2b67c42d 100644
--- a/meson.build
+++ b/meson.build
@@ -2304,6 +2304,8 @@
 summary_info += {'Documentation':     build_docs}
 summary_info += {'Install blobs':     get_option('install_blobs')}
 
+summary_info += {'host CPU':          cpu}
+summary_info += {'host endianness':   build_machine.endian()}
 summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
 summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
 if link_language == 'cpp'
@@ -2329,6 +2331,32 @@
 endif
 summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
+summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
+summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
+summary_info += {'PIE':               get_option('b_pie')}
+summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
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
+summary_info += {'mingw32 support':   targetos == 'windows'}
+
 summary_info += {'make':              config_host['MAKE']}
 summary_info += {'python':            '@0@ (version: @1@)'.format(python.full_path(), python.language_version())}
 summary_info += {'sphinx-build':      sphinx_build.found()}
@@ -2342,15 +2370,8 @@
 if config_host.has_key('CONFIG_MODULES')
   summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
 endif
-summary_info += {'host CPU':          cpu}
-summary_info += {'host endianness':   build_machine.endian()}
 summary_info += {'target list':       ' '.join(target_dirs)}
-summary_info += {'gprof enabled':     config_host.has_key('CONFIG_GPROF')}
 summary_info += {'sparse enabled':    sparse.found()}
-summary_info += {'strip binaries':    get_option('strip')}
-summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
-summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
-summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 if targetos == 'darwin'
   summary_info += {'Cocoa support':   cocoa.found()}
 endif
@@ -2382,7 +2403,6 @@
 # TODO: add back version
 summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
 summary_info += {'curl support':      curl.found()}
-summary_info += {'mingw32 support':   targetos == 'windows'}
 summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
 summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
 summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
@@ -2400,7 +2420,6 @@
   summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
 endif
 summary_info += {'brlapi support':    brlapi.found()}
-summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
 summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
@@ -2415,16 +2434,9 @@
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
   summary_info += {'TCG interpreter':   config_host.has_key('CONFIG_TCG_INTERPRETER')}
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
 summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
 summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
@@ -2461,15 +2473,10 @@
   summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
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
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
@@ -2481,9 +2488,6 @@
 summary_info += {'zstd support':      zstd.found()}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
 summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
-summary_info += {'memory allocator':  get_option('malloc')}
-summary_info += {'avx2 optimization': config_host.has_key('CONFIG_AVX2_OPT')}
-summary_info += {'avx512f optimization': config_host.has_key('CONFIG_AVX512F_OPT')}
 summary_info += {'replication support': config_host.has_key('CONFIG_REPLICATION')}
 summary_info += {'bochs support':     config_host.has_key('CONFIG_BOCHS')}
 summary_info += {'cloop support':     config_host.has_key('CONFIG_CLOOP')}
@@ -2504,7 +2508,6 @@
 if config_host.has_key('HAVE_GDB_BIN')
   summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
 endif
-summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE exports':      fuse.found()}
-- 
2.26.2


