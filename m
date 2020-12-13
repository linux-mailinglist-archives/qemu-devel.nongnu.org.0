Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C822D8B0B
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 03:57:09 +0100 (CET)
Received: from localhost ([::1]:34688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koHZM-00044O-9Z
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 21:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1koHYD-0003dj-Lo
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 21:55:57 -0500
Received: from relay68.bu.edu ([128.197.228.73]:56408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1koHYB-0007iZ-Jq
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 21:55:57 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 0BD2tNuG022801
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Dec 2020 21:55:26 -0500
Date: Sat, 12 Dec 2020 21:55:23 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 4/5] configure,meson: support Control-Flow Integrity
Message-ID: <20201213025523.lt5sj3k5nui2ntld@mozz.bu.edu>
References: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
 <20201204230615.2392-5-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204230615.2392-5-dbuono@linux.vnet.ibm.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.342, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201204 1806, Daniele Buono wrote:
> This patch adds a flag to enable/disable control flow integrity checks
> on indirect function calls.
> This feature only allows indirect function calls at runtime to functions
> with compatible signatures.
> 
> This feature is only provided by LLVM/Clang, and depends on link-time
> optimization which is currently supported only with LLVM/Clang >= 6.0
> 
> We also add an option to enable a debugging version of cfi, with verbose
> output in case of a CFI violation.
> 
> CFI on indirect function calls does not support calls to functions in
> shared libraries (since they were not known at compile time), and such
> calls are forbidden. QEMU relies on dlopen/dlsym when using modules,
> so we make modules incompatible with CFI.
> 
> All the checks are performed in meson.build. configure is only used to
> forward the flags to meson
> 
> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> ---
>  configure         | 21 ++++++++++++++++++++-
>  meson.build       | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  meson_options.txt |  4 ++++
>  3 files changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index fee118518b..c4e5d92167 100755
> --- a/configure
> +++ b/configure
> @@ -400,6 +400,8 @@ coroutine=""
>  coroutine_pool=""
>  debug_stack_usage="no"
>  crypto_afalg="no"
> +cfi="disabled"
> +cfi_debug="disabled"
>  seccomp=""
>  glusterfs=""
>  glusterfs_xlator_opt="no"
> @@ -1180,6 +1182,16 @@ for opt do
>    ;;
>    --disable-safe-stack) safe_stack="no"
>    ;;
> +  --enable-cfi)
> +      cfi="enabled";
> +      lto="true";
> +  ;;
> +  --disable-cfi) cfi="disabled"
> +  ;;
> +  --enable-cfi-debug) cfi_debug="enabled"
> +  ;;
> +  --disable-cfi-debug) cfi_debug="disabled"
> +  ;;
>    --disable-curses) curses="disabled"
>    ;;
>    --enable-curses) curses="enabled"
> @@ -1760,6 +1772,13 @@ disabled with --disable-FEATURE, default is enabled if available:
>    sparse          sparse checker
>    safe-stack      SafeStack Stack Smash Protection. Depends on
>                    clang/llvm >= 3.7 and requires coroutine backend ucontext.
> +  cfi             Enable Control-Flow Integrity for indirect function calls.
> +                  In case of a cfi violation, QEMU is terminated with SIGILL
> +                  Depends on lto and is incompatible with modules
> +                  Automatically enables Link-Time Optimization (lto)
> +  cfi-debug       In case of a cfi violation, a message containing the line that
> +                  triggered the error is written to stderr. After the error,
> +                  QEMU is still terminated with SIGILL
>  
>    gnutls          GNUTLS cryptography support
>    nettle          nettle cryptography support
> @@ -7020,7 +7039,7 @@ NINJA=$ninja $meson setup \
>          -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
>          -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
>          -Dvhost_user_blk_server=$vhost_user_blk_server \
> -        -Db_lto=$lto \
> +        -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
>          $cross_arg \
>          "$PWD" "$source_path"
>  
> diff --git a/meson.build b/meson.build
> index ebd1c690e0..e1ae6521e0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -773,6 +773,48 @@ elif get_option('vhost_user_blk_server').disabled() or not have_system
>      have_vhost_user_blk_server = false
>  endif
>  
> +if get_option('cfi').enabled()
> +  cfi_flags=[]
> +  # Check for dependency on LTO
> +  if not get_option('b_lto')
> +    error('Selected Control-Flow Integrity but LTO is disabled')
> +  endif
> +  if config_host.has_key('CONFIG_MODULES')
> +    error('Selected Control-Flow Integrity is not compatible with modules')
> +  endif
> +  # Check for cfi flags. CFI requires LTO so we can't use
> +  # get_supported_arguments, but need a more complex "compiles" which allows
> +  # custom arguments
> +  if cc.compiles('int main () { return 0; }', name: '-fsanitize=cfi-icall',
> +                 args: ['-flto', '-fsanitize=cfi-icall'] )
> +    cfi_flags += '-fsanitize=cfi-icall'
> +  else
> +    error('-fsanitize=cfi-icall is not supported by the compiler')
> +  endif
> +  if cc.compiles('int main () { return 0; }',
> +                 name: '-fsanitize-cfi-icall-generalize-pointers',
> +                 args: ['-flto', '-fsanitize=cfi-icall',
> +                        '-fsanitize-cfi-icall-generalize-pointers'] )
> +    cfi_flags += '-fsanitize-cfi-icall-generalize-pointers'
> +  else
> +    error('-fsanitize-cfi-icall-generalize-pointers is not supported by the compiler')
> +  endif
> +  if get_option('cfi_debug').enabled()
> +    if cc.compiles('int main () { return 0; }',
> +                   name: '-fno-sanitize-trap=cfi-icall',
> +                   args: ['-flto', '-fsanitize=cfi-icall',
> +                          '-fno-sanitize-trap=cfi-icall'] )
> +      cfi_flags += '-fno-sanitize-trap=cfi-icall'
> +    else
> +      error('-fno-sanitize-trap=cfi-icall is not supported by the compiler')
> +    endif
> +  endif
> +  add_project_arguments(cfi_flags, native: false, language: ['c', 'cpp',
> +                                                             'objc'])
> +  add_project_link_arguments(cfi_flags, native: false, language: ['c', 'cpp',
> +                                                                  'objc'])
> +endif

Hi Daniele,
I think it would be nice to have a separate block for get_option('d_lto').
Unless I missed something, right now --enable-lto --disable-cfi builds
don't actually use lto.
Thanks
-Alex

> +
>  #################
>  # config-host.h #
>  #################
> @@ -807,6 +849,7 @@ config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
>  config_host_data.set('CONFIG_GETTID', has_gettid)
>  config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
>  config_host_data.set('CONFIG_STATX', has_statx)
> +config_host_data.set('CONFIG_CFI', get_option('cfi').enabled())
>  config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
>  config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
>  config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
> @@ -2159,6 +2202,8 @@ if targetos == 'windows'
>    summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
>  endif
>  summary_info += {'seccomp support':   config_host.has_key('CONFIG_SECCOMP')}
> +summary_info += {'cfi support':       get_option('cfi').enabled()}
> +summary_info += {'cfi debug support': get_option('cfi_debug').enabled()}
>  summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
>  summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
>  summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
> diff --git a/meson_options.txt b/meson_options.txt
> index f6f64785fe..8d5729e450 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -35,6 +35,10 @@ option('xen_pci_passthrough', type: 'feature', value: 'auto',
>         description: 'Xen PCI passthrough support')
>  option('tcg', type: 'feature', value: 'auto',
>         description: 'TCG support')
> +option('cfi', type: 'feature', value: 'auto',
> +       description: 'Control-Flow Integrity (CFI)')
> +option('cfi_debug', type: 'feature', value: 'auto',
> +       description: 'Verbose errors in case of CFI violation')
>  
>  option('cocoa', type : 'feature', value : 'auto',
>         description: 'Cocoa user interface (macOS only)')
> -- 
> 2.17.1
> 
> 

