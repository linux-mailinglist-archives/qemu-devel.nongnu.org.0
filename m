Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B9C3043E9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:40:19 +0100 (CET)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4RO5-0002ZW-Io
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4RIk-0007MT-HO
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:34:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4RIh-0002Uf-Ha
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611678881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sciEVgy9NxSStCU5tGPHm6cWTA/2X0a3Lgq6u8BbA2I=;
 b=gPSWXo0Tf7FPivpZHHPZMlrlNruR5qC8zeZITdIGzDO/JiJNfIeNndrLFcghx9cgbHkH84
 zKDiA/HY65aFR8bjtcWdQnT6lu18rvFuus0iLJ7YXXpeGZjfA6xWvsiLuYAzSgil5uCbg0
 k/CPMAmEcnwvAOpxAvooUbtuWwqq8IU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-VqYHyebsPhKoyhAMdSj5JQ-1; Tue, 26 Jan 2021 11:34:39 -0500
X-MC-Unique: VqYHyebsPhKoyhAMdSj5JQ-1
Received: by mail-ed1-f69.google.com with SMTP id e25so9613078edq.6
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 08:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sciEVgy9NxSStCU5tGPHm6cWTA/2X0a3Lgq6u8BbA2I=;
 b=pQiDWBGt9+QRhth9bDNgeItL356YtMtb7Zrf3uci2O6l0uKDdn0UrU5twbkDKf9lYQ
 gGNUaXd1qMJ4bmNTbQIl715IdE2fFzF7JV8dNS5k2LJ/o89ij1jwyLlrjo+Us40+SP4N
 ZJkrMMM/0JyyDfxX/4rbyBI4+9WGMa5c1E8XoGraZhD7n7doMrpbLSPmOZ+zDj52A3KB
 fHAJQXAr6Q+UvEqn65Y3dtAo14yHVavsP/ACifX/rnyMeYUv8SoSR3IPvNHQMmBPjAS0
 TPWIIfj1OM24Nzr1M4zL1kj4oxbaiZlIBJfdINPRPQjqm4GiMbSuFl1KtU42LaA9RsqB
 ayIQ==
X-Gm-Message-State: AOAM532xQRVfpGAyKTwV2prqmi5VqnJY2Sx+khp3yYyQneLNJSa80nai
 8JTC6v0V+/Lkm2Zo5HeVVF1m/oUpY0geTuoQis/u/47xV9BNuWKecZWVjMkV+MifDjDaRJqskT/
 8avf2O7s7pJSi840=
X-Received: by 2002:a17:906:f991:: with SMTP id
 li17mr4053623ejb.31.1611678877334; 
 Tue, 26 Jan 2021 08:34:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyf591k3cv4aRfG+h38wErCnxiJMvgz/Brn17pWSk3lZmOjxsvGAC1fiMVH5/qczUBZCE9uCA==
X-Received: by 2002:a17:906:f991:: with SMTP id
 li17mr4053612ejb.31.1611678877183; 
 Tue, 26 Jan 2021 08:34:37 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y8sm12584046edd.97.2021.01.26.08.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 08:34:35 -0800 (PST)
Subject: Re: [PATCH] configure: Move preadv check to meson.build
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210126155846.17109-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <18aaae06-3ae7-e7b4-2118-466f5c3a52d6@redhat.com>
Date: Tue, 26 Jan 2021 17:34:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126155846.17109-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Alexander Graf <agraf@csgraf.de>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/21 16:58, Peter Maydell wrote:
> Move the preadv availability check to meson.build.  This is what we
> want to be doing for host-OS-feature-checks anyway, but it also fixes
> a problem with building for macOS with the most recent XCode SDK on a
> Catalina host.
> 
> On that configuration, 'preadv()' is provided as a weak symbol, so
> that programs can be built with optional support for it and make a
> runtime availability check to see whether the preadv() they have is a
> working one or one which they must not call because it will
> runtime-assert.  QEMU's configure test passes (unless you're building
> with --enable-werror) because the test program using preadv()
> compiles, but then QEMU crashes at runtime when preadv() is called,
> with errors like:
> 
>    dyld: lazy symbol binding failed: Symbol not found: _preadv
>      Referenced from: /Users/pm215/src/qemu/./build/x86/tests/test-replication
>      Expected in: /usr/lib/libSystem.B.dylib
> 
>    dyld: Symbol not found: _preadv
>      Referenced from: /Users/pm215/src/qemu/./build/x86/tests/test-replication
>      Expected in: /usr/lib/libSystem.B.dylib
> 
> Meson's own function availability check has a special case for macOS
> which adds '-Wl,-no_weak_imports' to the compiler flags, which forces
> the test to require the real function, not the macOS-version-too-old
> stub.
> 
> So this commit fixes the bug where macOS builds on Catalina currently
> require --disable-werror.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   configure   | 16 ----------------
>   meson.build |  4 +++-
>   2 files changed, 3 insertions(+), 17 deletions(-)
> 
> diff --git a/configure b/configure
> index dcc5ea7d630..0e672c3e291 100755
> --- a/configure
> +++ b/configure
> @@ -3525,19 +3525,6 @@ if compile_prog "" "" ; then
>     iovec=yes
>   fi
>   
> -##########################################
> -# preadv probe
> -cat > $TMPC <<EOF
> -#include <sys/types.h>
> -#include <sys/uio.h>
> -#include <unistd.h>
> -int main(void) { return preadv(0, 0, 0, 0); }
> -EOF
> -preadv=no
> -if compile_prog "" "" ; then
> -  preadv=yes
> -fi
> -
>   ##########################################
>   # fdt probe
>   
> @@ -5742,9 +5729,6 @@ fi
>   if test "$iovec" = "yes" ; then
>     echo "CONFIG_IOVEC=y" >> $config_host_mak
>   fi
> -if test "$preadv" = "yes" ; then
> -  echo "CONFIG_PREADV=y" >> $config_host_mak
> -fi
>   if test "$membarrier" = "yes" ; then
>     echo "CONFIG_MEMBARRIER=y" >> $config_host_mak
>   fi
> diff --git a/meson.build b/meson.build
> index 35a9eddf5cf..c4a66d87793 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1128,6 +1128,8 @@ config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
>   config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
>   config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
>   
> +config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
> +
>   ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
>   arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
>   strings = ['HOST_DSOSUF', 'CONFIG_IASL']
> @@ -2411,7 +2413,7 @@ summary_info += {'PIE':               get_option('b_pie')}
>   summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
>   summary_info += {'malloc trim support': has_malloc_trim}
>   summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
> -summary_info += {'preadv support':    config_host.has_key('CONFIG_PREADV')}
> +summary_info += {'preadv support':    config_host_data.get('CONFIG_PREADV')}
>   summary_info += {'fdatasync':         config_host.has_key('CONFIG_FDATASYNC')}
>   summary_info += {'madvise':           config_host.has_key('CONFIG_MADVISE')}
>   summary_info += {'posix_madvise':     config_host.has_key('CONFIG_POSIX_MADVISE')}
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks,

Paolo


