Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AA246EA6E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 15:57:55 +0100 (CET)
Received: from localhost ([::1]:43198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvKrp-0002Su-Lw
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 09:57:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mvKpO-0000wA-1H
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:55:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mvKpL-00012A-Rw
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639061709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oQ/ZMIVfHOOoEH9Teyc5nVz3SecV8reOghp4mU2Kh8k=;
 b=I68LxBWcVt3JFXu9alQZ0CsMWW1p6HjfOi9lowNsgFEQfju8H6dBv7ua8f8aQHVzWASBBo
 QD4No8uiid8aSvqKueoz9fPlHPGNlvYvmJpfhCro0Bj0dRlks8HcxF0jJkUHbQnnUPU5zi
 dLP5iNkpnBrBHA7+gy5HOORtN6pOXT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-KwTrslruOmGIY9FD6ZjKSQ-1; Thu, 09 Dec 2021 09:55:03 -0500
X-MC-Unique: KwTrslruOmGIY9FD6ZjKSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC2E81006AA8
 for <qemu-devel@nongnu.org>; Thu,  9 Dec 2021 14:55:02 +0000 (UTC)
Received: from localhost (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F9F85D9D5;
 Thu,  9 Dec 2021 14:55:02 +0000 (UTC)
Date: Thu, 9 Dec 2021 14:55:01 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] Move the libssh setup from configure to meson.build
Message-ID: <20211209145501.GK1127@redhat.com>
References: <20211209144801.148388-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211209144801.148388-1-thuth@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 09, 2021 at 03:48:01PM +0100, Thomas Huth wrote:
> It's easier to do this in meson.build now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Added the missing "config_host_data.set('CONFIG_LIBSSH', libssh.found())"
> 
>  configure                     | 27 ---------------------------
>  meson.build                   | 13 +++++++++----
>  meson_options.txt             |  2 ++
>  scripts/meson-buildoptions.sh |  3 +++
>  4 files changed, 14 insertions(+), 31 deletions(-)
> 
> diff --git a/configure b/configure
> index 48c21775f3..bb99a40ed0 100755
> --- a/configure
> +++ b/configure
> @@ -344,7 +344,6 @@ debug_stack_usage="no"
>  crypto_afalg="no"
>  tls_priority="NORMAL"
>  tpm="$default_feature"
> -libssh="$default_feature"
>  live_block_migration=${default_feature:-yes}
>  numa="$default_feature"
>  replication=${default_feature:-yes}
> @@ -1078,10 +1077,6 @@ for opt do
>    ;;
>    --enable-tpm) tpm="yes"
>    ;;
> -  --disable-libssh) libssh="no"
> -  ;;
> -  --enable-libssh) libssh="yes"
> -  ;;
>    --disable-live-block-migration) live_block_migration="no"
>    ;;
>    --enable-live-block-migration) live_block_migration="yes"
> @@ -1448,7 +1443,6 @@ cat << EOF
>    live-block-migration   Block migration in the main migration stream
>    coroutine-pool  coroutine freelist (better performance)
>    tpm             TPM support
> -  libssh          ssh block device support
>    numa            libnuma support
>    avx2            AVX2 optimization support
>    avx512f         AVX512F optimization support
> @@ -2561,21 +2555,6 @@ if test "$modules" = yes; then
>      fi
>  fi
>  
> -##########################################
> -# libssh probe
> -if test "$libssh" != "no" ; then
> -  if $pkg_config --exists "libssh >= 0.8.7"; then
> -    libssh_cflags=$($pkg_config libssh --cflags)
> -    libssh_libs=$($pkg_config libssh --libs)
> -    libssh=yes
> -  else
> -    if test "$libssh" = "yes" ; then
> -      error_exit "libssh required for --enable-libssh"
> -    fi
> -    libssh=no
> -  fi
> -fi
> -
>  ##########################################
>  # TPM emulation is only on POSIX
>  
> @@ -3636,12 +3615,6 @@ if test "$cmpxchg128" = "yes" ; then
>    echo "CONFIG_CMPXCHG128=y" >> $config_host_mak
>  fi
>  
> -if test "$libssh" = "yes" ; then
> -  echo "CONFIG_LIBSSH=y" >> $config_host_mak
> -  echo "LIBSSH_CFLAGS=$libssh_cflags" >> $config_host_mak
> -  echo "LIBSSH_LIBS=$libssh_libs" >> $config_host_mak
> -fi
> -
>  if test "$live_block_migration" = "yes" ; then
>    echo "CONFIG_LIVE_BLOCK_MIGRATION=y" >> $config_host_mak
>  fi
> diff --git a/meson.build b/meson.build
> index 96de1a6ef9..ae67ca28ab 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -874,11 +874,15 @@ if not get_option('glusterfs').auto() or have_block
>      ''', dependencies: glusterfs)
>    endif
>  endif
> +
>  libssh = not_found
> -if 'CONFIG_LIBSSH' in config_host
> -  libssh = declare_dependency(compile_args: config_host['LIBSSH_CFLAGS'].split(),
> -                              link_args: config_host['LIBSSH_LIBS'].split())
> +if not get_option('libssh').auto() or have_block
> +  libssh = dependency('libssh', version: '>=0.8.7',
> +                    method: 'pkg-config',
> +                    required: get_option('libssh'),
> +                    kwargs: static_kwargs)
>  endif
> +
>  libbzip2 = not_found
>  if not get_option('bzip2').auto() or have_block
>    libbzip2 = cc.find_library('bz2', has_headers: ['bzlib.h'],
> @@ -1451,6 +1455,7 @@ config_host_data.set('CONFIG_EBPF', libbpf.found())
>  config_host_data.set('CONFIG_LIBDAXCTL', libdaxctl.found())
>  config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
>  config_host_data.set('CONFIG_LIBNFS', libnfs.found())
> +config_host_data.set('CONFIG_LIBSSH', libssh.found())
>  config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
>  config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
>  config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
> @@ -3430,7 +3435,7 @@ endif
>  summary_info += {'seccomp support':   seccomp}
>  summary_info += {'GlusterFS support': glusterfs}
>  summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
> -summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
> +summary_info += {'libssh support':    libssh}
>  summary_info += {'lzo support':       lzo}
>  summary_info += {'snappy support':    snappy}
>  summary_info += {'bzip2 support':     libbzip2}
> diff --git a/meson_options.txt b/meson_options.txt
> index e392323732..4114bfcaa4 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -105,6 +105,8 @@ option('libdaxctl', type : 'feature', value : 'auto',
>         description: 'libdaxctl support')
>  option('libpmem', type : 'feature', value : 'auto',
>         description: 'libpmem support')
> +option('libssh', type : 'feature', value : 'auto',
> +       description: 'ssh block device support')
>  option('libudev', type : 'feature', value : 'auto',
>         description: 'Use libudev to enumerate host devices')
>  option('libusb', type : 'feature', value : 'auto',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 7a17ff4218..ae8f18edc2 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -53,6 +53,7 @@ meson_options_help() {
>    printf "%s\n" '  libiscsi        libiscsi userspace initiator'
>    printf "%s\n" '  libnfs          libnfs block device driver'
>    printf "%s\n" '  libpmem         libpmem support'
> +  printf "%s\n" '  libssh          ssh block device support'
>    printf "%s\n" '  libudev         Use libudev to enumerate host devices'
>    printf "%s\n" '  libusb          libusb support for USB passthrough'
>    printf "%s\n" '  libxml2         libxml2 support for Parallels image format'
> @@ -177,6 +178,8 @@ _meson_option_parse() {
>      --disable-libnfs) printf "%s" -Dlibnfs=disabled ;;
>      --enable-libpmem) printf "%s" -Dlibpmem=enabled ;;
>      --disable-libpmem) printf "%s" -Dlibpmem=disabled ;;
> +    --enable-libssh) printf "%s" -Dlibssh=enabled ;;
> +    --disable-libssh) printf "%s" -Dlibssh=disabled ;;
>      --enable-libudev) printf "%s" -Dlibudev=enabled ;;
>      --disable-libudev) printf "%s" -Dlibudev=disabled ;;
>      --enable-libusb) printf "%s" -Dlibusb=enabled ;;

Seems reasonable, ACK.

I should say that my interest in the ssh driver in qemu is not that
much these days.  I've been telling people to use nbdkit-ssh-plugin
instead.  It's more featureful and running it in a separate process is
probably safer too.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


