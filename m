Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A5A442D79
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:04:13 +0100 (CET)
Received: from localhost ([::1]:59576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsWS-0000sb-Ct
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhs4G-0007Rk-A0
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhs48-0006MV-0N
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635852894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyYEzFsC1lEPGMjmxWNUHqcjgY+eGv6GJfb5jZzlzhE=;
 b=NtNVAVhXduHAMaYLDsjWUzSXJLjhz10SnX6d9t4axFaTN4P/3LaPgLesTDJYKxHJwtGbcd
 WPaODZhjjjBqcing8mXzMRgTMldmwO1HYX/IE8vvyExgvz4K7I/XZuvgiMC8Bp8DL8vAXU
 sKNgfNTTISBV0gxvAyUyoHr1uwhFUSE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-xWpRm-KJOjGRrmpSXrfIlQ-1; Tue, 02 Nov 2021 07:34:50 -0400
X-MC-Unique: xWpRm-KJOjGRrmpSXrfIlQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 i22-20020a05640242d600b003e28aecc0afso5975344edc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UyYEzFsC1lEPGMjmxWNUHqcjgY+eGv6GJfb5jZzlzhE=;
 b=Tfwr6/KhBWpFoYvTUOxEVLMnQjb6hJBf18Q3dn1dku0sK8SM6zFtNgTg1jomtjdOlY
 xBOwmYeSyw3F1BlsDaQtpURGbZM3amWEKd6/vHsrWsgXx+WH7AMNoIDbEUNsVlEyYR1r
 GL61p6b0JVU6yTR7GhWDGQ6FBLiUJb04JA3sdBTeHUZJ93qrnQ4S5EPZrkQibW1GN3+Q
 nuOoHuemJgTVu1Q9W7tdrbX1/x7qBzJBp0F6VixQaUctmwlJCvhWoZcfLtfSgiUS2z7e
 z7Xw5NQlUvch+IbZBH/VKP9NeDKICNKfbv5Gdt4uWnSOGkvLJw2TNRE3FzI8GKE0VKkq
 TmKg==
X-Gm-Message-State: AOAM531EfTwfmejPlMGlGiizzKpy5XxzMuR8xFQGtPvmIBc+vaT270Wh
 ZUpqqZG7eRoDiJiZnji4XcwQNOy9OgcBwVGK2qHGFHpZ2em0z1ukVIvLp7B4Im/ma/1+DUw4o9E
 qP76zaKSd0fQXbnw=
X-Received: by 2002:a17:906:7954:: with SMTP id
 l20mr44350891ejo.11.1635852889039; 
 Tue, 02 Nov 2021 04:34:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKjFrxf46C9juZ9/1BKGE7O/JvwnDBafAY9KmSj5xwbfwmMuApl0h19tHiurYikZMMRPpO8A==
X-Received: by 2002:a17:906:7954:: with SMTP id
 l20mr44350860ejo.11.1635852888794; 
 Tue, 02 Nov 2021 04:34:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a20sm7999857ejd.112.2021.11.02.04.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:34:48 -0700 (PDT)
Message-ID: <e02332c0-7c4e-18a2-5c33-b00e8045f6da@redhat.com>
Date: Tue, 2 Nov 2021 12:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/4] Move CONFIG_XFS handling to meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211028185910.1729744-1-thuth@redhat.com>
 <20211028185910.1729744-4-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211028185910.1729744-4-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/10/21 20:59, Thomas Huth wrote:
> Checking for xfsctl() can be done more easily in meson.build. Also,
> this is not a "real" feature like the other features that we provide
> with the "--enable-xxx" and "--disable-xxx" switches for the
> configure script, since this does not influence lots of code (it's
> only about one call to xfsctl() in file-posix.c), so people don't
> gain much with the ability to disable this with "--disable-xfsctl".
> Let's rather treat this like the other cc.has_function() checks in
> meson.build, i.e. don't add a new option for this in meson_options.txt.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

I think we should just use ioctl and copy the relevant definitions from 
Linux:

struct dioattr {
         u32           d_mem;          /* data buffer memory alignment */
         u32           d_miniosz;      /* min xfer size                */
         u32           d_maxiosz;      /* max xfer size                */
};

#define XFS_IOC_DIOINFO		_IOR ('X', 30, struct dioattr)

Paolo

> ---
>   configure   | 31 -------------------------------
>   meson.build |  2 +-
>   2 files changed, 1 insertion(+), 32 deletions(-)
> 
> diff --git a/configure b/configure
> index 170b1b237a..2296c3e194 100755
> --- a/configure
> +++ b/configure
> @@ -287,7 +287,6 @@ for opt do
>   done
>   
>   xen_ctrl_version="$default_feature"
> -xfs="$default_feature"
>   membarrier="$default_feature"
>   vhost_kernel="$default_feature"
>   vhost_net="$default_feature"
> @@ -1019,10 +1018,6 @@ for opt do
>     ;;
>     --enable-opengl) opengl="yes"
>     ;;
> -  --disable-xfsctl) xfs="no"
> -  ;;
> -  --enable-xfsctl) xfs="yes"
> -  ;;
>     --disable-zlib-test)
>     ;;
>     --enable-guest-agent) guest_agent="yes"
> @@ -1477,7 +1472,6 @@ cat << EOF
>     avx512f         AVX512F optimization support
>     replication     replication support
>     opengl          opengl support
> -  xfsctl          xfsctl support
>     qom-cast-debug  cast debugging support
>     tools           build qemu-io, qemu-nbd and qemu-img tools
>     bochs           bochs image format support
> @@ -2385,28 +2379,6 @@ EOF
>       fi
>   fi
>   
> -##########################################
> -# xfsctl() probe, used for file-posix.c
> -if test "$xfs" != "no" ; then
> -  cat > $TMPC << EOF
> -#include <stddef.h>  /* NULL */
> -#include <xfs/xfs.h>
> -int main(void)
> -{
> -    xfsctl(NULL, 0, 0, NULL);
> -    return 0;
> -}
> -EOF
> -  if compile_prog "" "" ; then
> -    xfs="yes"
> -  else
> -    if test "$xfs" = "yes" ; then
> -      feature_not_found "xfs" "Install xfsprogs/xfslibs devel"
> -    fi
> -    xfs=no
> -  fi
> -fi
> -
>   ##########################################
>   # plugin linker support probe
>   
> @@ -3538,9 +3510,6 @@ echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
>   if test "$block_drv_whitelist_tools" = "yes" ; then
>     echo "CONFIG_BDRV_WHITELIST_TOOLS=y" >> $config_host_mak
>   fi
> -if test "$xfs" = "yes" ; then
> -  echo "CONFIG_XFS=y" >> $config_host_mak
> -fi
>   qemu_version=$(head $source_path/VERSION)
>   echo "PKGVERSION=$pkgversion" >>$config_host_mak
>   echo "SRC_PATH=$source_path" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index 5bb6b901b0..2bd922f2f3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1532,6 +1532,7 @@ config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and cc.has_functio
>   config_host_data.set('CONFIG_SYNCFS', cc.has_function('syncfs'))
>   config_host_data.set('CONFIG_SYNC_FILE_RANGE', cc.has_function('sync_file_range'))
>   config_host_data.set('CONFIG_TIMERFD', cc.has_function('timerfd_create'))
> +config_host_data.set('CONFIG_XFS', cc.has_function('xfsctl', prefix: '#include <xfs/xfs.h>'))
>   config_host_data.set('HAVE_COPY_FILE_RANGE', cc.has_function('copy_file_range'))
>   config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
>   config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
> @@ -3415,7 +3416,6 @@ if spice_protocol.found()
>     summary_info += {'  spice server support': spice}
>   endif
>   summary_info += {'rbd support':       rbd}
> -summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
>   summary_info += {'smartcard support': cacard}
>   summary_info += {'U2F support':       u2f}
>   summary_info += {'libusb':            libusb}
> 


