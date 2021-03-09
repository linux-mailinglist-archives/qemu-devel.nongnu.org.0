Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641AB3325ED
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:58:52 +0100 (CET)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbwp-0000Xa-DT
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJbEU-0000uz-1b
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:13:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJbES-0007M9-4n
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615291976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHO/a15bwcocGbGc55AboGwHoInofVBTPvIRW1fMhiA=;
 b=Ev910bjAZoNApMk9lVxVaHPerLZWVm/AXJwlCxK5YH9PvWxC+4fMLFWcUIIhRWmfHFTc5I
 3BtjaPIzD3gRAMeir9268lAzHGrycB5ZR20LmpvAP6roclq5HfIdyulXVEbeuh57PHHS8D
 SqPgqDL80wnvtnI7hSPEgfLF9qFDOOo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-vJGPv429NyqMeiBOT3X7KA-1; Tue, 09 Mar 2021 07:12:55 -0500
X-MC-Unique: vJGPv429NyqMeiBOT3X7KA-1
Received: by mail-wm1-f69.google.com with SMTP id z26so1050254wml.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 04:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mHO/a15bwcocGbGc55AboGwHoInofVBTPvIRW1fMhiA=;
 b=PpB5JIAzGch2niHZHS0hQuqOzb+0AawtAT/LutYw4YTIHaUwvlDPDwPo+9M0JJmcJp
 2D3oWzW0heLbEngJmNZ57SAThOv8D4xguktDPAwnIdwSueHD4Bjx4CP28wrc7V6DAkx/
 9XKpQvms3fksmUzyjPHIvxO/CUhQgptHVoR9O9vq66MXuVHuufb1G6vhjUc32tz1cCvo
 T7Xx5u+n3NMgvWgwAEGTLrFZYJ0sQyDSkeDMUI0E7z5anaQpbNWTkWQBle/4iDhdQyre
 d2yRds/W82Z/Ow5GqsNZpyDC1xkR2AuPh727vitcBF/N6kcKjyG7sYdDA1MtQC/gtWua
 hfgw==
X-Gm-Message-State: AOAM531wcHecerHDuBibszVWlbmoNjIp2NATHqjV0E9+KoQNShweRZYm
 8zp0iL3e/kUivU6LV70Va+6jYgwgL2+iSvm6WEgtbFcQP1mQoieoMrvqJUmdFoN/wnR86wuEO15
 Yq3Dx1MxsZHI3aks=
X-Received: by 2002:a1c:7715:: with SMTP id t21mr3666773wmi.132.1615291973894; 
 Tue, 09 Mar 2021 04:12:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdmsM+0piJVOpETIfhJ2mSxFN6S8sXCTAL/si9y0OG14v7469oRogRL+8IsiibIS+oQfMPuw==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr3666750wmi.132.1615291973713; 
 Tue, 09 Mar 2021 04:12:53 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s23sm3719130wmc.35.2021.03.09.04.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 04:12:53 -0800 (PST)
Subject: Re: [PATCH v2 4/4] slirp: feature detection for smbd
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20210309002741.85057-1-j@getutm.app>
 <20210309002741.85057-5-j@getutm.app>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <808bb587-cce9-7118-5c05-f7b1680dd7e5@redhat.com>
Date: Tue, 9 Mar 2021 13:12:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309002741.85057-5-j@getutm.app>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 "Danilo C. L. de Paula" <ddepaula@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 1:27 AM, Joelle van Dyne wrote:
> Replace Windows specific macro with a more generic feature detection
> macro. Allows slirp smb feature to be disabled manually as well.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  configure   | 26 +++++++++++++++++++++++---
>  meson.build |  2 +-
>  net/slirp.c | 16 ++++++++--------
>  3 files changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/configure b/configure
> index 34fccaa2ba..8335a3e6a0 100755
> --- a/configure
> +++ b/configure
> @@ -465,6 +465,7 @@ fuse_lseek="auto"
>  multiprocess="auto"
>  
>  malloc_trim="auto"
> +slirp_smbd="auto"
>  
>  # parse CC options second
>  for opt do
> @@ -834,8 +835,6 @@ do
>      fi
>  done
>  
> -: ${smbd=${SMBD-/usr/sbin/smbd}}
> -
>  # Default objcc to clang if available, otherwise use CC
>  if has clang; then
>    objcc=clang
> @@ -1560,6 +1559,10 @@ for opt do
>    ;;
>    --disable-multiprocess) multiprocess="disabled"
>    ;;
> +  --enable-slirp-smbd) slirp_smbd=yes
> +  ;;
> +  --disable-slirp-smbd) slirp_smbd=no
> +  ;;
>    *)
>        echo "ERROR: unknown option $opt"
>        echo "Try '$0 --help' for more information"
> @@ -1913,6 +1916,7 @@ disabled with --disable-FEATURE, default is enabled if available
>    fuse            FUSE block device export
>    fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
>    multiprocess    Out of process device emulation support
> +  slirp-smbd      use smbd (at path --smbd=*) in slirp networking
>  
>  NOTE: The object files are built at the place where configure is launched
>  EOF
> @@ -5252,6 +5256,19 @@ case "$slirp" in
>      ;;
>  esac
>  
> +# Check for slirp smbd dupport
> +: ${smbd=${SMBD-/usr/sbin/smbd}}
> +if test "$slirp_smbd" != "no" ; then
> +  if test "$mingw32" = "yes" ; then
> +    if test "$slirp_smbd" = "yes" ; then
> +      error_exit "Host smbd not supported on this platform."
> +    fi
> +    slirp_smbd=no
> +  else
> +    slirp_smbd=yes
> +  fi
> +fi
> +
>  ##########################################
>  # check for usable __NR_keyctl syscall
>  
> @@ -5527,7 +5544,10 @@ fi
>  if test "$guest_agent" = "yes" ; then
>    echo "CONFIG_GUEST_AGENT=y" >> $config_host_mak
>  fi
> -echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
> +if test "$slirp_smbd" = "yes" ; then
> +  echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
> +  echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
> +fi
>  if test "$vde" = "yes" ; then
>    echo "CONFIG_VDE=y" >> $config_host_mak
>    echo "VDE_LIBS=$vde_libs" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index ba0db9fa1f..cad70a8fc5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2424,7 +2424,7 @@ summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
>  if targetos == 'windows' and config_host.has_key('CONFIG_GUEST_AGENT')
>    summary_info += {'wixl':            wixl.found() ? wixl.full_path() : false}
>  endif
> -if slirp_opt != 'disabled'
> +if slirp_opt != 'disabled' and 'CONFIG_SLIRP_SMBD' in config_host
>    summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
>  endif
>  summary(summary_info, bool_yn: true, section: 'Host binaries')
> diff --git a/net/slirp.c b/net/slirp.c
> index be914c0be0..b3ded2aac1 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -27,7 +27,7 @@
>  #include "net/slirp.h"
>  
>  
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>  #include <pwd.h>
>  #include <sys/wait.h>
>  #endif
> @@ -90,7 +90,7 @@ typedef struct SlirpState {
>      Slirp *slirp;
>      Notifier poll_notifier;
>      Notifier exit_notifier;
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>      gchar *smb_dir;
>  #endif
>      GSList *fwd;
> @@ -103,7 +103,7 @@ static QTAILQ_HEAD(, SlirpState) slirp_stacks =
>  static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp);
>  static int slirp_guestfwd(SlirpState *s, const char *config_str, Error **errp);
>  
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>  static int slirp_smb(SlirpState *s, const char *exported_dir,
>                       struct in_addr vserver_addr, Error **errp);
>  static void slirp_smb_cleanup(SlirpState *s);
> @@ -367,7 +367,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>      struct in6_addr ip6_prefix;
>      struct in6_addr ip6_host;
>      struct in6_addr ip6_dns;
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>      struct in_addr smbsrv = { .s_addr = 0 };
>  #endif
>      NetClientState *nc;
> @@ -477,7 +477,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>          return -1;
>      }
>  
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>      if (vsmbserver && !inet_aton(vsmbserver, &smbsrv)) {
>          error_setg(errp, "Failed to parse SMB address");
>          return -1;
> @@ -592,7 +592,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>              }
>          }
>      }
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>      if (smb_export) {
>          if (slirp_smb(s, smb_export, smbsrv, errp) < 0) {
>              goto error;
> @@ -784,7 +784,7 @@ void hmp_hostfwd_add(Monitor *mon, const QDict *qdict)
>  
>  }
>  
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>  
>  /* automatic user mode samba server configuration */
>  static void slirp_smb_cleanup(SlirpState *s)
> @@ -899,7 +899,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
>      return 0;
>  }
>  
> -#endif /* !defined(_WIN32) */
> +#endif /* defined(CONFIG_SLIRP_SMBD) */
>  
>  static int guestfwd_can_read(void *opaque)
>  {
> 


