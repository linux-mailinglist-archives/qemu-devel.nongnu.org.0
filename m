Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D861846EAE3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:12:30 +0100 (CET)
Received: from localhost ([::1]:49018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvL5y-0001Dw-1F
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:12:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvL2E-0003jk-DM
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:08:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvL28-0003Bl-Mj
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:08:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639062511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjKkbz9e2NQHuJ/E7pYJEZVq3T4KeFMzli+qfH98KmY=;
 b=UtEWlyTaYT4/u3Lt/vQ5AXxzIXctEwl2ELZkSepcRB9+Aen/TU+eG8MqMZYuS3HeA7tZ1X
 hg/7kz3P6T8TO4iFNosFGVPoUHuABllgtLc9bJqLbuiKyhHNZXqQN0AS1zSu0hhJHSqNUr
 oYd0SE9M6to3/8K8hIQBssI8cbksUp8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-AHa6G0UMPpWwkEoqD7GRAg-1; Thu, 09 Dec 2021 10:08:28 -0500
X-MC-Unique: AHa6G0UMPpWwkEoqD7GRAg-1
Received: by mail-wr1-f70.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so1497422wrc.22
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 07:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KjKkbz9e2NQHuJ/E7pYJEZVq3T4KeFMzli+qfH98KmY=;
 b=Af/lIJr4p0JUxzOeRFFTC3FYfn1MGMwJ81Bx5KoRz8MoxzlnUvcMIGvh16p9JAtdQ5
 U8QTajnv1olF1ZWwBvWRVFSt0ILOnV4jhqIYmXukan1j5t1M+RyQugVqxd9onW14ZLaN
 0zOQ6YZUTdBYSp/CcHgHs5WKQfslJDgU2X+O7G8YzoH58v4SsEMFW6PWtLC0tISBkj03
 MapnrLVAmLiaurpdeUp4Ah9tfJa7I8F1EuFugn6iqwPbYJ159V0diM8BVriEZwZQ56tB
 eF+vC7yTwEwn+GYFuxLrECSGvcEZTp/thciyZpAKpfwExa2HgVJ79qyXPdFpaQ3no2cH
 AEyQ==
X-Gm-Message-State: AOAM533cNmNd9yvynO/XGaunNvWGMsIz1Y4j/tQAlUZGEGCVX3cpZxBw
 1R7CyQ6W780dHWk9mDmT1A4+yQM6CncyydIHd+dbEV3y90rLQ4uuFTRn6BCTNq35Q4yh8Yv8Oyf
 7iqy/EYpgV1BHDxc=
X-Received: by 2002:adf:c186:: with SMTP id x6mr6971043wre.580.1639062507057; 
 Thu, 09 Dec 2021 07:08:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznlInQhbJlXveO66i6Bd94nQ1YXYdsesMCqENCSdpthgCK9t0LfO+x9Rk/IAc+QuwbTiQIYg==
X-Received: by 2002:adf:c186:: with SMTP id x6mr6971020wre.580.1639062506824; 
 Thu, 09 Dec 2021 07:08:26 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id f15sm94328wmg.30.2021.12.09.07.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 07:08:26 -0800 (PST)
Message-ID: <b59169e2-409a-75e0-339c-4021499d7131@redhat.com>
Date: Thu, 9 Dec 2021 16:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] Move the libssh setup from configure to meson.build
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <20211209144801.148388-1-thuth@redhat.com>
 <20211209145501.GK1127@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211209145501.GK1127@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.803, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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

On 09/12/2021 15.55, Richard W.M. Jones wrote:
> On Thu, Dec 09, 2021 at 03:48:01PM +0100, Thomas Huth wrote:
>> It's easier to do this in meson.build now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   v2: Added the missing "config_host_data.set('CONFIG_LIBSSH', libssh.found())"
>>
>>   configure                     | 27 ---------------------------
>>   meson.build                   | 13 +++++++++----
>>   meson_options.txt             |  2 ++
>>   scripts/meson-buildoptions.sh |  3 +++
>>   4 files changed, 14 insertions(+), 31 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 48c21775f3..bb99a40ed0 100755
>> --- a/configure
>> +++ b/configure
>> @@ -344,7 +344,6 @@ debug_stack_usage="no"
>>   crypto_afalg="no"
>>   tls_priority="NORMAL"
>>   tpm="$default_feature"
>> -libssh="$default_feature"
>>   live_block_migration=${default_feature:-yes}
>>   numa="$default_feature"
>>   replication=${default_feature:-yes}
>> @@ -1078,10 +1077,6 @@ for opt do
>>     ;;
>>     --enable-tpm) tpm="yes"
>>     ;;
>> -  --disable-libssh) libssh="no"
>> -  ;;
>> -  --enable-libssh) libssh="yes"
>> -  ;;
>>     --disable-live-block-migration) live_block_migration="no"
>>     ;;
>>     --enable-live-block-migration) live_block_migration="yes"
>> @@ -1448,7 +1443,6 @@ cat << EOF
>>     live-block-migration   Block migration in the main migration stream
>>     coroutine-pool  coroutine freelist (better performance)
>>     tpm             TPM support
>> -  libssh          ssh block device support
>>     numa            libnuma support
>>     avx2            AVX2 optimization support
>>     avx512f         AVX512F optimization support
>> @@ -2561,21 +2555,6 @@ if test "$modules" = yes; then
>>       fi
>>   fi
>>   
>> -##########################################
>> -# libssh probe
>> -if test "$libssh" != "no" ; then
>> -  if $pkg_config --exists "libssh >= 0.8.7"; then
>> -    libssh_cflags=$($pkg_config libssh --cflags)
>> -    libssh_libs=$($pkg_config libssh --libs)
>> -    libssh=yes
>> -  else
>> -    if test "$libssh" = "yes" ; then
>> -      error_exit "libssh required for --enable-libssh"
>> -    fi
>> -    libssh=no
>> -  fi
>> -fi
>> -
>>   ##########################################
>>   # TPM emulation is only on POSIX
>>   
>> @@ -3636,12 +3615,6 @@ if test "$cmpxchg128" = "yes" ; then
>>     echo "CONFIG_CMPXCHG128=y" >> $config_host_mak
>>   fi
>>   
>> -if test "$libssh" = "yes" ; then
>> -  echo "CONFIG_LIBSSH=y" >> $config_host_mak
>> -  echo "LIBSSH_CFLAGS=$libssh_cflags" >> $config_host_mak
>> -  echo "LIBSSH_LIBS=$libssh_libs" >> $config_host_mak
>> -fi
>> -
>>   if test "$live_block_migration" = "yes" ; then
>>     echo "CONFIG_LIVE_BLOCK_MIGRATION=y" >> $config_host_mak
>>   fi
>> diff --git a/meson.build b/meson.build
>> index 96de1a6ef9..ae67ca28ab 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -874,11 +874,15 @@ if not get_option('glusterfs').auto() or have_block
>>       ''', dependencies: glusterfs)
>>     endif
>>   endif
>> +
>>   libssh = not_found
>> -if 'CONFIG_LIBSSH' in config_host
>> -  libssh = declare_dependency(compile_args: config_host['LIBSSH_CFLAGS'].split(),
>> -                              link_args: config_host['LIBSSH_LIBS'].split())
>> +if not get_option('libssh').auto() or have_block
>> +  libssh = dependency('libssh', version: '>=0.8.7',
>> +                    method: 'pkg-config',
>> +                    required: get_option('libssh'),
>> +                    kwargs: static_kwargs)
>>   endif
>> +
>>   libbzip2 = not_found
>>   if not get_option('bzip2').auto() or have_block
>>     libbzip2 = cc.find_library('bz2', has_headers: ['bzlib.h'],
>> @@ -1451,6 +1455,7 @@ config_host_data.set('CONFIG_EBPF', libbpf.found())
>>   config_host_data.set('CONFIG_LIBDAXCTL', libdaxctl.found())
>>   config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
>>   config_host_data.set('CONFIG_LIBNFS', libnfs.found())
>> +config_host_data.set('CONFIG_LIBSSH', libssh.found())
>>   config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
>>   config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
>>   config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
>> @@ -3430,7 +3435,7 @@ endif
>>   summary_info += {'seccomp support':   seccomp}
>>   summary_info += {'GlusterFS support': glusterfs}
>>   summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
>> -summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
>> +summary_info += {'libssh support':    libssh}
>>   summary_info += {'lzo support':       lzo}
>>   summary_info += {'snappy support':    snappy}
>>   summary_info += {'bzip2 support':     libbzip2}
>> diff --git a/meson_options.txt b/meson_options.txt
>> index e392323732..4114bfcaa4 100644
>> --- a/meson_options.txt
>> +++ b/meson_options.txt
>> @@ -105,6 +105,8 @@ option('libdaxctl', type : 'feature', value : 'auto',
>>          description: 'libdaxctl support')
>>   option('libpmem', type : 'feature', value : 'auto',
>>          description: 'libpmem support')
>> +option('libssh', type : 'feature', value : 'auto',
>> +       description: 'ssh block device support')
>>   option('libudev', type : 'feature', value : 'auto',
>>          description: 'Use libudev to enumerate host devices')
>>   option('libusb', type : 'feature', value : 'auto',
>> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
>> index 7a17ff4218..ae8f18edc2 100644
>> --- a/scripts/meson-buildoptions.sh
>> +++ b/scripts/meson-buildoptions.sh
>> @@ -53,6 +53,7 @@ meson_options_help() {
>>     printf "%s\n" '  libiscsi        libiscsi userspace initiator'
>>     printf "%s\n" '  libnfs          libnfs block device driver'
>>     printf "%s\n" '  libpmem         libpmem support'
>> +  printf "%s\n" '  libssh          ssh block device support'
>>     printf "%s\n" '  libudev         Use libudev to enumerate host devices'
>>     printf "%s\n" '  libusb          libusb support for USB passthrough'
>>     printf "%s\n" '  libxml2         libxml2 support for Parallels image format'
>> @@ -177,6 +178,8 @@ _meson_option_parse() {
>>       --disable-libnfs) printf "%s" -Dlibnfs=disabled ;;
>>       --enable-libpmem) printf "%s" -Dlibpmem=enabled ;;
>>       --disable-libpmem) printf "%s" -Dlibpmem=disabled ;;
>> +    --enable-libssh) printf "%s" -Dlibssh=enabled ;;
>> +    --disable-libssh) printf "%s" -Dlibssh=disabled ;;
>>       --enable-libudev) printf "%s" -Dlibudev=enabled ;;
>>       --disable-libudev) printf "%s" -Dlibudev=disabled ;;
>>       --enable-libusb) printf "%s" -Dlibusb=enabled ;;
> 
> Seems reasonable, ACK.

Thanks!

> I should say that my interest in the ssh driver in qemu is not that
> much these days.  I've been telling people to use nbdkit-ssh-plugin
> instead.  It's more featureful and running it in a separate process is
> probably safer too.

Then it's maybe time to deprecate the ssh driver in QEMU?

  Thomas


