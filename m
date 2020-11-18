Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0576D2B842D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:51:33 +0100 (CET)
Received: from localhost ([::1]:55980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSYG-00065J-0q
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfS2C-0007EZ-BJ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:18:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfS29-00021J-TT
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605723501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/MAPLde6svfklGp+MhK3CCzyOevO4MxWuHlirBRUxo=;
 b=LD9vONcvQhht5nLpFjGM4/myB+9rGsWapjQCshO5E6q3ExP8qW0LYuynBT6JHWZ9HYQIzE
 isbSZv7S3ryYnh/WyNTLFoGqwVWTqPvhoY1HHufc2L3lIfuX4sfNrQaopnof9N9BpPmeuU
 Kj5EZx/DSj4CSEeY0Rqk6BP0KYUYrcE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-oMLnSjZgNYmMWbiGI2nYBQ-1; Wed, 18 Nov 2020 13:18:19 -0500
X-MC-Unique: oMLnSjZgNYmMWbiGI2nYBQ-1
Received: by mail-wm1-f72.google.com with SMTP id y1so1354827wma.5
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v/MAPLde6svfklGp+MhK3CCzyOevO4MxWuHlirBRUxo=;
 b=XAf2qWoThWb/mFjTlKBm+ZXzBXbNMeYqwLg+rS/w18TLAKlkmYie4ZycctzIkxnxKk
 lXo9Qddxxw3Kh5Jzkpf+6di3TOYcW4ulR/FZQT8bPUrY5b0IQPInDitsZ0dfmN89e98k
 yQX2oNpqUCvGKm8ryOdkt1C8mIDeBnxGslRTgujwbf/+K07RHMwuHJ5ZBnkblogVMAPi
 g31s/v2itKXm9koPJoKg74vngXsegxRZQZilWXW339i7G3BvXvmKrHzzXT0gC+LxURXv
 leIolOUrSNPfqheZFe5y9v/b4F3M2wp3LFtcLDNxYdNc4hffCUa8ICWllqXoyxBtKJcz
 Rv7Q==
X-Gm-Message-State: AOAM532PBpdj7F+LWuHckHAmELkuB0z0oiddSQytyPO+3s3NE6DtTWqB
 NPUYaWo/4onhrUQ8YZdxEUntEzfN5N2gwGPFRHsadLLDewerU9WReF0cKbs1rYJqQi1//w8drZp
 HGKaPLI/tvSDSIiY=
X-Received: by 2002:a5d:488d:: with SMTP id g13mr6040335wrq.274.1605723497926; 
 Wed, 18 Nov 2020 10:18:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz77I+q+bcHg2DiuguNAu/5KM3y/iERETt50Id7EiLGrBwsT1082l3uAPHb+RI+eqLYO+YWXw==
X-Received: by 2002:a5d:488d:: with SMTP id g13mr6040325wrq.274.1605723497761; 
 Wed, 18 Nov 2020 10:18:17 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id p19sm5193845wrg.18.2020.11.18.10.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 10:18:17 -0800 (PST)
Subject: Re: [PATCH 6/6] configure / meson: Move check for linux/btrfs.h to
 meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-7-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <908bff29-6d4e-7c56-0795-b798d5ca8022@redhat.com>
Date: Wed, 18 Nov 2020 19:18:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-7-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 6:10 PM, Thomas Huth wrote:
> This check can be done in a much shorter way in meson.build. And while
> we're at it, rename the #define to HAVE_BTRFS_H to match the other
> HAVE_someheader_H symbols that we already have.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure                 | 9 ---------
>  linux-user/syscall.c      | 2 +-
>  linux-user/syscall_defs.h | 2 +-
>  meson.build               | 1 +
>  4 files changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/configure b/configure
> index 8d40a0beb3..1ba4bf9a3d 100755
> --- a/configure
> +++ b/configure
> @@ -4389,12 +4389,6 @@ if compile_prog "" "" ; then
>    syncfs=yes
>  fi
>  
> -# check for btrfs filesystem support (kernel must be 3.9+)

Assuming it is now OK to drop this comment:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> -btrfs=no
> -if check_include linux/btrfs.h ; then
> -    btrfs=yes
> -fi
> -
>  # Search for bswap_32 function
>  byteswap_h=no
>  cat > $TMPC << EOF
> @@ -6086,9 +6080,6 @@ fi
>  if test "$syncfs" = "yes" ; then
>    echo "CONFIG_SYNCFS=y" >> $config_host_mak
>  fi
> -if test "$btrfs" = "yes" ; then
> -  echo "CONFIG_BTRFS=y" >> $config_host_mak
> -fi
>  if test "$inotify" = "yes" ; then
>    echo "CONFIG_INOTIFY=y" >> $config_host_mak
>  fi
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 063130be04..7bf99beb18 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -112,7 +112,7 @@
>  #include <linux/if_alg.h>
>  #include <linux/rtc.h>
>  #include <sound/asound.h>
> -#ifdef CONFIG_BTRFS
> +#ifdef HAVE_BTRFS_H
>  #include <linux/btrfs.h>
>  #endif
>  #ifdef HAVE_DRM_H
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index cabbfb762d..b934d0b606 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -1006,7 +1006,7 @@ struct target_rtc_pll_info {
>  #define TARGET_FS_IOC32_SETVERSION TARGET_IOW('v', 2, int)
>  
>  /* btrfs ioctls */
> -#ifdef CONFIG_BTRFS
> +#ifdef HAVE_BTRFS_H
>  #define TARGET_BTRFS_IOC_SNAP_CREATE            TARGET_IOWU(BTRFS_IOCTL_MAGIC, 1)
>  #define TARGET_BTRFS_IOC_SCAN_DEV               TARGET_IOWU(BTRFS_IOCTL_MAGIC, 4)
>  #define TARGET_BTRFS_IOC_FORGET_DEV             TARGET_IOWU(BTRFS_IOCTL_MAGIC, 5)
> diff --git a/meson.build b/meson.build
> index ab9571a354..bf62e260ed 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -808,6 +808,7 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
>  config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
>  config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
>  
> +config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
>  config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
>  config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
>  config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
> 


