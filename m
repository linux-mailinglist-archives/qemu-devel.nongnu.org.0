Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5481C43F711
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 08:18:18 +0200 (CEST)
Received: from localhost ([::1]:38010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgLDU-0001F4-9X
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 02:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgL4x-0007Qf-Ur
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 02:09:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgL4r-0002Pp-FX
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 02:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635487760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t55+wSaGvWXJYymjyyzrSISnve1y5tS8Kp6no4+nJAI=;
 b=jCJNwQskVmIBYdzoZghXHa64JrEr1YI4SuKVCM/QtYOcIfKEmCuBh5L0EiNJ3hVxyhgOl/
 39p6UNDPRSr4QHDXyR2PJhjt+6sPLJM3Q325Q54K9ZB6V6qOLBuWEFo0YFepw4NGyNmcU/
 +f/Lr4j/U/gmoTtGtNbRVawn8TcJXc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-dXex_LSQNmCN1ZqOagAdfw-1; Fri, 29 Oct 2021 02:09:16 -0400
X-MC-Unique: dXex_LSQNmCN1ZqOagAdfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AC391006AB4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 06:09:15 +0000 (UTC)
Received: from thuth.remote.csb (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B17817CEE;
 Fri, 29 Oct 2021 06:09:14 +0000 (UTC)
Subject: Re: [PATCH 4/4] Move the libssh setup from configure to meson.build
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20211028185910.1729744-1-thuth@redhat.com>
 <20211028185910.1729744-5-thuth@redhat.com>
Message-ID: <7392e626-93b1-76f8-b7b7-b08af277d70f@redhat.com>
Date: Fri, 29 Oct 2021 08:09:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211028185910.1729744-5-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/10/2021 20.59, Thomas Huth wrote:
> It's easier to do this in meson.build now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   configure                     | 27 ---------------------------
>   meson.build                   | 12 ++++++++----
>   meson_options.txt             |  2 ++
>   scripts/meson-buildoptions.sh |  3 +++
>   4 files changed, 13 insertions(+), 31 deletions(-)
> 
> diff --git a/configure b/configure
> index 2296c3e194..e6cb3528f2 100755
> --- a/configure
> +++ b/configure
> @@ -339,7 +339,6 @@ debug_stack_usage="no"
>   crypto_afalg="no"
>   tls_priority="NORMAL"
>   tpm="$default_feature"
> -libssh="$default_feature"
>   live_block_migration=${default_feature:-yes}
>   numa="$default_feature"
>   replication=${default_feature:-yes}
> @@ -1071,10 +1070,6 @@ for opt do
>     ;;
>     --enable-tpm) tpm="yes"
>     ;;
> -  --disable-libssh) libssh="no"
> -  ;;
> -  --enable-libssh) libssh="yes"
> -  ;;
>     --disable-live-block-migration) live_block_migration="no"
>     ;;
>     --enable-live-block-migration) live_block_migration="yes"
> @@ -1466,7 +1461,6 @@ cat << EOF
>     live-block-migration   Block migration in the main migration stream
>     coroutine-pool  coroutine freelist (better performance)
>     tpm             TPM support
> -  libssh          ssh block device support
>     numa            libnuma support
>     avx2            AVX2 optimization support
>     avx512f         AVX512F optimization support
> @@ -2572,21 +2566,6 @@ if test "$modules" = yes; then
>       fi
>   fi
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
>   ##########################################
>   # TPM emulation is only on POSIX
>   
> @@ -3644,12 +3623,6 @@ if test "$cmpxchg128" = "yes" ; then
>     echo "CONFIG_CMPXCHG128=y" >> $config_host_mak
>   fi
>   
> -if test "$libssh" = "yes" ; then
> -  echo "CONFIG_LIBSSH=y" >> $config_host_mak
> -  echo "LIBSSH_CFLAGS=$libssh_cflags" >> $config_host_mak
> -  echo "LIBSSH_LIBS=$libssh_libs" >> $config_host_mak
> -fi
> -
>   if test "$live_block_migration" = "yes" ; then
>     echo "CONFIG_LIVE_BLOCK_MIGRATION=y" >> $config_host_mak
>   fi
> diff --git a/meson.build b/meson.build
> index 2bd922f2f3..7d43e6b5bc 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -871,11 +871,15 @@ if not get_option('glusterfs').auto() or have_block
>       ''', dependencies: glusterfs)
>     endif
>   endif
> +
>   libssh = not_found
> -if 'CONFIG_LIBSSH' in config_host
> -  libssh = declare_dependency(compile_args: config_host['LIBSSH_CFLAGS'].split(),
> -                              link_args: config_host['LIBSSH_LIBS'].split())
> +if not get_option('libssh').auto() or have_block
> +  libssh = dependency('libssh', version: '>=0.8.7',
> +                    method: 'pkg-config',
> +                    required: get_option('libssh'),
> +                    kwargs: static_kwargs)
>   endif
> +
>   libbzip2 = not_found
>   if not get_option('bzip2').auto() or have_block
>     libbzip2 = cc.find_library('bz2', has_headers: ['bzlib.h'],
> @@ -3433,7 +3437,7 @@ endif
>   summary_info += {'seccomp support':   seccomp}
>   summary_info += {'GlusterFS support': glusterfs}
>   summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
> -summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
> +summary_info += {'libssh support':    libssh}
>   summary_info += {'lzo support':       lzo}
>   summary_info += {'snappy support':    snappy}
>   summary_info += {'bzip2 support':     libbzip2}
> diff --git a/meson_options.txt b/meson_options.txt
> index e740dce2a5..da46a55984 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -105,6 +105,8 @@ option('libdaxctl', type : 'feature', value : 'auto',
>          description: 'libdaxctl support')
>   option('libpmem', type : 'feature', value : 'auto',
>          description: 'libpmem support')
> +option('libssh', type : 'feature', value : 'auto',
> +       description: 'ssh block device support')
>   option('libudev', type : 'feature', value : 'auto',
>          description: 'Use libudev to enumerate host devices')
>   option('libusb', type : 'feature', value : 'auto',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 55b8a78560..2b9e51455d 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -54,6 +54,7 @@ meson_options_help() {
>     printf "%s\n" '  libiscsi        libiscsi userspace initiator'
>     printf "%s\n" '  libnfs          libnfs block device driver'
>     printf "%s\n" '  libpmem         libpmem support'
> +  printf "%s\n" '  libssh          ssh block device support'
>     printf "%s\n" '  libudev         Use libudev to enumerate host devices'
>     printf "%s\n" '  libusb          libusb support for USB passthrough'
>     printf "%s\n" '  libxml2         libxml2 support for Parallels image format'
> @@ -177,6 +178,8 @@ _meson_option_parse() {
>       --disable-libnfs) printf "%s" -Dlibnfs=disabled ;;
>       --enable-libpmem) printf "%s" -Dlibpmem=enabled ;;
>       --disable-libpmem) printf "%s" -Dlibpmem=disabled ;;
> +    --enable-libssh) printf "%s" -Dlibssh=enabled ;;
> +    --disable-libssh) printf "%s" -Dlibssh=disabled ;;
>       --enable-libudev) printf "%s" -Dlibudev=enabled ;;
>       --disable-libudev) printf "%s" -Dlibudev=disabled ;;
>       --enable-libusb) printf "%s" -Dlibusb=enabled ;;
> 

D'oh, this needs this additional hunk:

diff --git a/meson.build b/meson.build
--- a/meson.build
+++ b/meson.build
@@ -1467,6 +1467,7 @@ config_host_data.set('CONFIG_EBPF', libbpf.found())
  config_host_data.set('CONFIG_LIBDAXCTL', libdaxctl.found())
  config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
  config_host_data.set('CONFIG_LIBNFS', libnfs.found())
+config_host_data.set('CONFIG_LIBSSH', libssh.found())
  config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
  config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
  config_host_data.set('CONFIG_LIBPMEM', libpmem.found())

(CONFIG_LIBSSH is only used in tests/qtest/modules-test.c, that's why I 
haven't noticed this immediately)

  Thomas


