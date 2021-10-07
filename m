Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA22425A3F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 20:02:53 +0200 (CEST)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXjI-0005jf-05
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 14:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mYXcq-0003lh-LE
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:56:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mYXck-0005KI-NN
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633629365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHwXIBByujUL87wadOKCslJADIxWIjFhIAfdkePa9Ic=;
 b=a/IKpWj2keUa6tlHIvCCi1Fnm8xgGNcwBZvw3AVeswQ6v7riSrPVD5X7krdxR8YjKrqcYq
 D96VnltK/jzpsb32N+Qa93Qt0uCrUE+ASaGEuefI7kEXCxBKJ5sVP34Vk9kU9g/uuvV8/0
 WJXf3GOB6fC+dr1Qh3aWiR8JgW75ejo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-fGL7b1gSNUCVD-e2z35kRA-1; Thu, 07 Oct 2021 13:56:00 -0400
X-MC-Unique: fGL7b1gSNUCVD-e2z35kRA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso5314003wrg.16
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vHwXIBByujUL87wadOKCslJADIxWIjFhIAfdkePa9Ic=;
 b=YjHjBoJNGMbLE0tszub/35gr72SFIo5QvKV8eyDGWEtM8afGj1UlhwxLjOJVRXn2r5
 X1m/gZeLuSHoBsIsFZB3GCBtKJWmQWI7EV5eBqvuvJjFdWbmwwGv7a+7CCf5p0osMBZK
 CAtz7QTzBRuoOqsxscqiHx9NcaQRSYbiUfINOlNuIppQQ1FxcQ6yLQ/h8l9B9kq7kZug
 kmlaKS/r1rrVyorM33w7Mhx8Z99S5oNp4+zYMVXc/rxb9M92edkeJNWqB/PD3KmRKVDH
 4cpbCKt/IaIAMRYrcibQSItMcyYsl8sOKG/I8SN1n6sNJ5aY2pFcAaqN+XBpSJgsNDoE
 MffA==
X-Gm-Message-State: AOAM5324wzDh0SQGBJwt/vImLMBQtel3JuyM0yC9G8xZD93zlM/xo7Cr
 HAGECGOKASrqFR3o0kFe/DVZSrQF/AZ9f5HxpK/uQ8PDDyke3nPEFEh41l6PSE4XSpRKhzAbM/f
 7Q2AFCCmxEVa++yLl/4zUNESe0JMXMZc6Y0QS1ADCunTOZMG3rQ7qAPpVFmQXBqI=
X-Received: by 2002:adf:8b47:: with SMTP id v7mr7256631wra.321.1633629359080; 
 Thu, 07 Oct 2021 10:55:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzdUzcYxNf3NF4boAlYP2mlylEMFZ988BAoZr3E4lYQB0Z9uGbNvlWkGtI0DJCQLRcJyBXGg==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr7256596wra.321.1633629358771; 
 Thu, 07 Oct 2021 10:55:58 -0700 (PDT)
Received: from thuth.remote.csb (p549bb2bd.dip0.t-ipconnect.de.
 [84.155.178.189])
 by smtp.gmail.com with ESMTPSA id l16sm86863wmj.33.2021.10.07.10.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 10:55:58 -0700 (PDT)
Subject: Re: [PATCH 17/24] configure, meson: move netmap detection to meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-12-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <18b2de5f-740b-58ca-cb68-505014793f39@redhat.com>
Date: Thu, 7 Oct 2021 19:55:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007130829.632254-12-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/2021 15.08, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure         | 40 ++++------------------------------------
>   meson.build       | 19 ++++++++++++++++++-
>   meson_options.txt |  2 ++
>   net/meson.build   |  4 +++-
>   4 files changed, 27 insertions(+), 38 deletions(-)
> 
> diff --git a/configure b/configure
> index a2b1d54be8..bb3bb3e58f 100755
> --- a/configure
> +++ b/configure
> @@ -292,7 +292,7 @@ iconv="auto"
>   curses="auto"
>   docs="auto"
>   fdt="auto"
> -netmap="no"
> +netmap="auto"
>   sdl="auto"
>   sdl_image="auto"
>   virtiofsd="auto"
> @@ -701,7 +701,6 @@ FreeBSD)
>     bsd_user="yes"
>     make="${MAKE-gmake}"
>     # needed for kinfo_getvmmap(3) in libutil.h
> -  netmap=""  # enable netmap autodetect
>   ;;
>   DragonFly)
>     bsd="yes"
> @@ -1026,9 +1025,9 @@ for opt do
>     ;;
>     --enable-vde) vde="enabled"
>     ;;
> -  --disable-netmap) netmap="no"
> +  --disable-netmap) netmap="disabled"
>     ;;
> -  --enable-netmap) netmap="yes"
> +  --enable-netmap) netmap="enabled"
>     ;;
>     --disable-xen) xen="disabled"
>     ;;
> @@ -2901,34 +2900,6 @@ EOF
>     fi
>   fi
>   
> -##########################################
> -# netmap support probe
> -# Apart from looking for netmap headers, we make sure that the host API version
> -# supports the netmap backend (>=11). The upper bound (15) is meant to simulate
> -# a minor/major version number. Minor new features will be marked with values up
> -# to 15, and if something happens that requires a change to the backend we will
> -# move above 15, submit the backend fixes and modify this two bounds.
> -if test "$netmap" != "no" ; then
> -  cat > $TMPC << EOF
> -#include <inttypes.h>
> -#include <net/if.h>
> -#include <net/netmap.h>
> -#include <net/netmap_user.h>
> -#if (NETMAP_API < 11) || (NETMAP_API > 15)
> -#error
> -#endif
> -int main(void) { return 0; }
> -EOF
> -  if compile_prog "" "" ; then
> -    netmap=yes
> -  else
> -    if test "$netmap" = "yes" ; then
> -      feature_not_found "netmap"
> -    fi
> -    netmap=no
> -  fi
> -fi
> -
>   ##########################################
>   # plugin linker support probe
>   
> @@ -4173,9 +4144,6 @@ if test "$slirp_smbd" = "yes" ; then
>     echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
>     echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
>   fi
> -if test "$netmap" = "yes" ; then
> -  echo "CONFIG_NETMAP=y" >> $config_host_mak
> -fi
>   if test "$l2tpv3" = "yes" ; then
>     echo "CONFIG_L2TPV3=y" >> $config_host_mak
>   fi
> @@ -4722,7 +4690,7 @@ if test "$skip_meson" = no; then
>           -Dalsa=$alsa -Dcoreaudio=$coreaudio -Ddsound=$dsound -Djack=$jack -Doss=$oss \
>           -Dpa=$pa -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
>           -Dtrace_backends=$trace_backends -Dtrace_file=$trace_file -Dlinux_aio=$linux_aio \
> -        -Dvde=$vde \
> +        -Dnetmap=$netmap -Dvde=$vde \
>           $cross_arg \
>           "$PWD" "$source_path"
>   
> diff --git a/meson.build b/meson.build
> index 46d8798a19..96f87630f0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1659,6 +1659,23 @@ config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
>       return mlockall(MCL_FUTURE);
>     }'''))
>   
> +have_netmap = false
> +if not get_option('netmap').disabled() and targetos == 'freebsd'

The "and targetos == 'freebsd'" seems wrong. netmap is also usable on Linux, 
and I cannot use --enable-netmap anymore after this patch. It works again 
once I removed the freebsd check here.

  Thomas


