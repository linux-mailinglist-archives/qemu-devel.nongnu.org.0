Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA05C2CF757
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 00:14:17 +0100 (CET)
Received: from localhost ([::1]:42374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klKHI-0007JC-NR
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 18:14:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1klKAE-0002UU-9M
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 18:06:58 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1klKA4-0004St-2w
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 18:06:58 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4N4Hbd170712
 for <qemu-devel@nongnu.org>; Fri, 4 Dec 2020 18:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PU+fbnUADiPI1WaQu2R7WKTvIHv60rwXN2hrq/pVSSU=;
 b=TpDHNve5a3DJTDbqXGKORvnmH+b4JL39h7GhrI9rHZfv4fzRsHHJMR2nmHZx8c64iAep
 6N/dFWCkeKKk/VjVy7zc3BJffawcQszO93Wthtw39l+HRKbExGiUEcR9rlfLMQ1h79VJ
 nnVO+BG/lh8lbvhb/2abRFbkJBK4YxMxD19OognV0SkKzyFN9zgn3iU9+C1ljYy74hey
 ogAyO9y1EYuCRNQVLldN1rnR/LZsX6dabGw6X+BopooFRv4RiBhgvy4dr+R5cmx2UzOL
 1lYpZe2BlZE7aVZvi5ZOZAUKM2abjsBSqbm3fDxE93x7K3rvvct8c++h7BE+t9lz3cmW tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357uqebtk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 18:06:46 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B4N4IQx171349
 for <qemu-devel@nongnu.org>; Fri, 4 Dec 2020 18:06:46 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357uqebtjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 18:06:46 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4MhDx9025338;
 Fri, 4 Dec 2020 23:06:45 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 356cbf3evr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 23:06:44 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4N6iHb24904098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 23:06:44 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 083C26A054;
 Fri,  4 Dec 2020 23:06:44 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69F0A6A058;
 Fri,  4 Dec 2020 23:06:43 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.160.122.174])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 23:06:43 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] configure,meson: support Control-Flow Integrity
Date: Fri,  4 Dec 2020 18:06:14 -0500
Message-Id: <20201204230615.2392-5-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
References: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_12:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=1 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040128
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds a flag to enable/disable control flow integrity checks
on indirect function calls.
This feature only allows indirect function calls at runtime to functions
with compatible signatures.

This feature is only provided by LLVM/Clang, and depends on link-time
optimization which is currently supported only with LLVM/Clang >= 6.0

We also add an option to enable a debugging version of cfi, with verbose
output in case of a CFI violation.

CFI on indirect function calls does not support calls to functions in
shared libraries (since they were not known at compile time), and such
calls are forbidden. QEMU relies on dlopen/dlsym when using modules,
so we make modules incompatible with CFI.

All the checks are performed in meson.build. configure is only used to
forward the flags to meson

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
---
 configure         | 21 ++++++++++++++++++++-
 meson.build       | 45 +++++++++++++++++++++++++++++++++++++++++++++
 meson_options.txt |  4 ++++
 3 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index fee118518b..c4e5d92167 100755
--- a/configure
+++ b/configure
@@ -400,6 +400,8 @@ coroutine=""
 coroutine_pool=""
 debug_stack_usage="no"
 crypto_afalg="no"
+cfi="disabled"
+cfi_debug="disabled"
 seccomp=""
 glusterfs=""
 glusterfs_xlator_opt="no"
@@ -1180,6 +1182,16 @@ for opt do
   ;;
   --disable-safe-stack) safe_stack="no"
   ;;
+  --enable-cfi)
+      cfi="enabled";
+      lto="true";
+  ;;
+  --disable-cfi) cfi="disabled"
+  ;;
+  --enable-cfi-debug) cfi_debug="enabled"
+  ;;
+  --disable-cfi-debug) cfi_debug="disabled"
+  ;;
   --disable-curses) curses="disabled"
   ;;
   --enable-curses) curses="enabled"
@@ -1760,6 +1772,13 @@ disabled with --disable-FEATURE, default is enabled if available:
   sparse          sparse checker
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
+  cfi             Enable Control-Flow Integrity for indirect function calls.
+                  In case of a cfi violation, QEMU is terminated with SIGILL
+                  Depends on lto and is incompatible with modules
+                  Automatically enables Link-Time Optimization (lto)
+  cfi-debug       In case of a cfi violation, a message containing the line that
+                  triggered the error is written to stderr. After the error,
+                  QEMU is still terminated with SIGILL
 
   gnutls          GNUTLS cryptography support
   nettle          nettle cryptography support
@@ -7020,7 +7039,7 @@ NINJA=$ninja $meson setup \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
-        -Db_lto=$lto \
+        -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index ebd1c690e0..e1ae6521e0 100644
--- a/meson.build
+++ b/meson.build
@@ -773,6 +773,48 @@ elif get_option('vhost_user_blk_server').disabled() or not have_system
     have_vhost_user_blk_server = false
 endif
 
+if get_option('cfi').enabled()
+  cfi_flags=[]
+  # Check for dependency on LTO
+  if not get_option('b_lto')
+    error('Selected Control-Flow Integrity but LTO is disabled')
+  endif
+  if config_host.has_key('CONFIG_MODULES')
+    error('Selected Control-Flow Integrity is not compatible with modules')
+  endif
+  # Check for cfi flags. CFI requires LTO so we can't use
+  # get_supported_arguments, but need a more complex "compiles" which allows
+  # custom arguments
+  if cc.compiles('int main () { return 0; }', name: '-fsanitize=cfi-icall',
+                 args: ['-flto', '-fsanitize=cfi-icall'] )
+    cfi_flags += '-fsanitize=cfi-icall'
+  else
+    error('-fsanitize=cfi-icall is not supported by the compiler')
+  endif
+  if cc.compiles('int main () { return 0; }',
+                 name: '-fsanitize-cfi-icall-generalize-pointers',
+                 args: ['-flto', '-fsanitize=cfi-icall',
+                        '-fsanitize-cfi-icall-generalize-pointers'] )
+    cfi_flags += '-fsanitize-cfi-icall-generalize-pointers'
+  else
+    error('-fsanitize-cfi-icall-generalize-pointers is not supported by the compiler')
+  endif
+  if get_option('cfi_debug').enabled()
+    if cc.compiles('int main () { return 0; }',
+                   name: '-fno-sanitize-trap=cfi-icall',
+                   args: ['-flto', '-fsanitize=cfi-icall',
+                          '-fno-sanitize-trap=cfi-icall'] )
+      cfi_flags += '-fno-sanitize-trap=cfi-icall'
+    else
+      error('-fno-sanitize-trap=cfi-icall is not supported by the compiler')
+    endif
+  endif
+  add_project_arguments(cfi_flags, native: false, language: ['c', 'cpp',
+                                                             'objc'])
+  add_project_link_arguments(cfi_flags, native: false, language: ['c', 'cpp',
+                                                                  'objc'])
+endif
+
 #################
 # config-host.h #
 #################
@@ -807,6 +849,7 @@ config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
 config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
 config_host_data.set('CONFIG_STATX', has_statx)
+config_host_data.set('CONFIG_CFI', get_option('cfi').enabled())
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
@@ -2159,6 +2202,8 @@ if targetos == 'windows'
   summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
 endif
 summary_info += {'seccomp support':   config_host.has_key('CONFIG_SECCOMP')}
+summary_info += {'cfi support':       get_option('cfi').enabled()}
+summary_info += {'cfi debug support': get_option('cfi_debug').enabled()}
 summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
 summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
 summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
diff --git a/meson_options.txt b/meson_options.txt
index f6f64785fe..8d5729e450 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -35,6 +35,10 @@ option('xen_pci_passthrough', type: 'feature', value: 'auto',
        description: 'Xen PCI passthrough support')
 option('tcg', type: 'feature', value: 'auto',
        description: 'TCG support')
+option('cfi', type: 'feature', value: 'auto',
+       description: 'Control-Flow Integrity (CFI)')
+option('cfi_debug', type: 'feature', value: 'auto',
+       description: 'Verbose errors in case of CFI violation')
 
 option('cocoa', type : 'feature', value : 'auto',
        description: 'Cocoa user interface (macOS only)')
-- 
2.17.1


