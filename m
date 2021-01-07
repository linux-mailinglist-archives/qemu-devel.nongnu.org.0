Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE3A2ED14A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 15:03:16 +0100 (CET)
Received: from localhost ([::1]:53504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVsh-00051L-9e
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 09:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqK-0003wR-RR
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:49 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqG-0006uj-2Y
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:47 -0500
Received: by mail-ej1-x62a.google.com with SMTP id 6so9819809ejz.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 06:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oh9PCOgSakOP6BoAqkfwWAKJaRKuw2Mtd466eLx9XcU=;
 b=u7mHYtapDg61IM6VlwdGfyj2xIchWFnNRg4WXyEN+YKFbPVNzfMIqxZD2Bp7d+vqnV
 48x3xuyHG27TuXs+92pnt0vRE1eKgEWzPyfNDc/7rsI5Ifec4INDA0xnTLGerJy+S1/D
 PkM+nQA3Y5Tj2XTMazv7plsu8pjaom4y1MEnzLXtih1z+DgsnnkR6mqbEr3bcA1mPd83
 BsKaondHL9T/mDolZ948Rf3+J0PlEqmPIc+BW+61tbsRIiGVFTeb/RicBBOxt6kou8rE
 SAaI9T+SvElKYUmKMr520HLKCcgZFddPS3P85kITz332R0Gd5bybedZ45MxQbMuXX3nr
 jNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oh9PCOgSakOP6BoAqkfwWAKJaRKuw2Mtd466eLx9XcU=;
 b=X1oZSwbMkUWmGrb/nlNRjIf/6bUIfdLh3SSUrB/2odO27lmRotKZsNIh3TY4bj2CNu
 7N0wDivgM/BPqMsUDC/rAP/eULWwzIHfe8DOg5NZMVkWdk7ODF1pqQlohW4yuC9mS1sc
 1aeuwgIggVRjBH8zvcjWqZ6sUnPaoSPO1QFk7r2uKWhSGzmagAn1fa6icIePs99Amyik
 pSxHtCQ3+O7FRIdDoh4gQGdiJCASaLiPQEM4kMzb21st/XcsVcNIpAyn42C9xWbgwAVr
 Y4SDe4pyAI810OBNkhxU1VItivgJAnAhvM6SfWYZlqXctHhbUe0XzYfaGeLVpPDw6jFO
 6/vw==
X-Gm-Message-State: AOAM531RnE6yroq2JAzaGzrdmRU+Ct+Ws7uN3bj5cC019YIs1UuxVTO/
 GVgDj9kUoFLjkAgFCx7SqEx9sYM2aEqYmg==
X-Google-Smtp-Source: ABdhPJx4mazAi7AM6VWlXZKMRvjjmnxU5Jrpkbp2hgO+QFidG1IpGu/MeDy3b+dhvCV+lzGP5DRQ2Q==
X-Received: by 2002:a17:906:22c7:: with SMTP id
 q7mr6405469eja.486.1610028042601; 
 Thu, 07 Jan 2021 06:00:42 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id oq27sm2438523ejb.108.2021.01.07.06.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 06:00:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] build-system: clean up TCG/TCI configury
Date: Thu,  7 Jan 2021 15:00:32 +0100
Message-Id: <20210107140039.467969-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107140039.467969-1-pbonzini@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make CONFIG_TCG_INTERPRETER a Meson option, and enable TCI (though with
a warning) if the host CPU is unsupported, making it more similar to
other --enable-* options.

Remove TCG-specific include paths from !CONFIG_TCG builds.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 11 +++--------
 disas/meson.build |  2 --
 meson.build       | 50 ++++++++++++++++++++++++-----------------------
 meson_options.txt |  2 ++
 4 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/configure b/configure
index 8e0de14aa6..81801a6fe0 100755
--- a/configure
+++ b/configure
@@ -355,7 +355,7 @@ sanitizers="no"
 tsan="no"
 fortify_source="$default_feature"
 strip_opt="yes"
-tcg_interpreter="no"
+tcg_interpreter="auto"
 bigendian="no"
 mingw32="no"
 gcov="no"
@@ -1117,9 +1117,9 @@ for opt do
   ;;
   --enable-whpx) whpx="enabled"
   ;;
-  --disable-tcg-interpreter) tcg_interpreter="no"
+  --disable-tcg-interpreter) tcg_interpreter="disabled"
   ;;
-  --enable-tcg-interpreter) tcg_interpreter="yes"
+  --enable-tcg-interpreter) tcg_interpreter="enabled"
   ;;
   --disable-cap-ng)  cap_ng="disabled"
   ;;
@@ -5911,11 +5911,6 @@ fi
 if test "$optreset" = "yes" ; then
   echo "HAVE_OPTRESET=y" >> $config_host_mak
 fi
-if test "$tcg" = "enabled"; then
-  if test "$tcg_interpreter" = "yes" ; then
-    echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
-  fi
-fi
 if test "$fdatasync" = "yes" ; then
   echo "CONFIG_FDATASYNC=y" >> $config_host_mak
 fi
diff --git a/disas/meson.build b/disas/meson.build
index 09a852742e..da341a511e 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -22,5 +22,3 @@ common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
 common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
 common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
 common_ss.add(when: capstone, if_true: files('capstone.c'))
-
-specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tci.c'))
diff --git a/meson.build b/meson.build
index 2742b37e14..36f1d02190 100644
--- a/meson.build
+++ b/meson.build
@@ -109,25 +109,8 @@ if targetos == 'linux'
                         language: ['c', 'cpp'])
 endif
 
-if 'CONFIG_TCG_INTERPRETER' in config_host
-  tcg_arch = 'tci'
-elif config_host['ARCH'] == 'sparc64'
-  tcg_arch = 'sparc'
-elif config_host['ARCH'] == 's390x'
-  tcg_arch = 's390'
-elif config_host['ARCH'] in ['x86_64', 'x32']
-  tcg_arch = 'i386'
-elif config_host['ARCH'] == 'ppc64'
-  tcg_arch = 'ppc'
-elif config_host['ARCH'] in ['riscv32', 'riscv64']
-  tcg_arch = 'riscv'
-else
-  tcg_arch = config_host['ARCH']
-endif
-add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
-                      '-iquote', '.',
+add_project_arguments('-iquote', '.',
                       '-iquote', meson.current_source_dir(),
-                      '-iquote', meson.current_source_dir() / 'accel/tcg',
                       '-iquote', meson.current_source_dir() / 'include',
                       '-iquote', meson.current_source_dir() / 'disas/libvixl',
                       language: ['c', 'cpp', 'objc'])
@@ -224,14 +207,31 @@ if not get_option('hax').disabled()
     accelerators += 'CONFIG_HAX'
   endif
 endif
+
+tcg_arch = config_host['ARCH']
 if not get_option('tcg').disabled()
-  if cpu not in supported_cpus
-    if 'CONFIG_TCG_INTERPRETER' in config_host
+  if get_option('tcg_interpreter').enabled() or cpu not in supported_cpus
+    if get_option('tcg_interpreter').disabled()
+      error('TCG interpreter disabled but host CPU @0@ supported'.format(cpu))
+    elif get_option('tcg_interpreter').auto()
       warning('Unsupported CPU @0@, will use TCG with TCI (experimental)'.format(cpu))
-    else
-      error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
+    tcg_arch = 'tci'
+  elif config_host['ARCH'] == 'sparc64'
+    tcg_arch = 'sparc'
+  elif config_host['ARCH'] == 's390x'
+    tcg_arch = 's390'
+  elif config_host['ARCH'] in ['x86_64', 'x32']
+    tcg_arch = 'i386'
+  elif config_host['ARCH'] == 'ppc64'
+    tcg_arch = 'ppc'
+  elif config_host['ARCH'] in ['riscv32', 'riscv64']
+    tcg_arch = 'riscv'
   endif
+  add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
+                        '-iquote', meson.current_source_dir() / 'accel/tcg',
+                        language: ['c', 'cpp', 'objc'])
+
   accelerators += 'CONFIG_TCG'
   config_host += { 'CONFIG_TCG': 'y' }
 endif
@@ -1833,7 +1833,9 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'tcg/tcg-op.c',
   'tcg/tcg.c',
 ))
-specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('disas/tci.c', 'tcg/tci.c'))
+if tcg_arch == 'tci'
+  specific_ss.add(files('disas/tci.c', 'tcg/tci.c'))
+endif
 
 subdir('backends')
 subdir('disas')
@@ -2392,7 +2394,7 @@ summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
-  summary_info += {'TCG interpreter':   config_host.has_key('CONFIG_TCG_INTERPRETER')}
+  summary_info += {'TCG interpreter':   tcg_arch == 'tci'}
 endif
 summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
diff --git a/meson_options.txt b/meson_options.txt
index 7948a8255c..41f9c2cf6c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -37,6 +37,8 @@ option('xen_pci_passthrough', type: 'feature', value: 'auto',
        description: 'Xen PCI passthrough support')
 option('tcg', type: 'feature', value: 'auto',
        description: 'TCG support')
+option('tcg_interpreter', type: 'feature', value: 'auto',
+       description: 'TCG bytecode interpreter (TCI)')
 option('cfi', type: 'boolean', value: 'false',
        description: 'Control-Flow Integrity (CFI)')
 option('cfi_debug', type: 'boolean', value: 'false',
-- 
2.29.2



