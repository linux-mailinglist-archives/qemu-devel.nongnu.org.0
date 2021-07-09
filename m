Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040D43C20D9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 10:31:32 +0200 (CEST)
Received: from localhost ([::1]:54786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1luz-000419-Q2
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 04:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m1ltO-00032B-5i
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 04:29:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m1ltJ-0001h2-S7
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 04:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625819365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Fr3UnEyk3XLr+zIRvIaXlRU58mKR+36Xxz30SJKVOM=;
 b=Wvrc1sJDMpj1OTLq4C3AVwM4igBiCEoE2kaaB9YoK2M6ufmBwL5Q8ZXg0AAgqxPoKVsB9S
 dw3OFSEQQRBHwInBDVQYFzlLvBMEoJBZfTsictH1cpiPs+1lhcIxm+Yj54EKxu9pNc9xCj
 fbpfbRj8EGWUjd0GHzoaXcbS6RUbY/s=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-O7CK5NLAOb2G6yT6h6Hi1w-1; Fri, 09 Jul 2021 04:29:22 -0400
X-MC-Unique: O7CK5NLAOb2G6yT6h6Hi1w-1
Received: by mail-ej1-f69.google.com with SMTP id
 j13-20020a1709064b4db02904f6bfa03ec1so2498384ejv.16
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 01:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Fr3UnEyk3XLr+zIRvIaXlRU58mKR+36Xxz30SJKVOM=;
 b=o5/tFWZfzRJdFW8qMAx6dCYcmLLFBRNQ8pdbG56ijr5UGU64PbiWsxanwAXwwDCM+s
 knFizJh/iTkFd01aaaN2uPfG9z0Vb+pDpiaBO8O1KwLKRCd40qqXNzPcd/7LBoFo0bQg
 rj1u2+5P1TCaWjqUZOWQ818E6nN4c4ybn0yqHt4YNhj1V5SvQbAy3AuLI7siviXFyAyE
 v6cbIIp+hIHbQzbnrNIlfdMjFXR7oyMqZIUqw6d1tYDyA38xfGrGDnmRMjGAapdAs813
 9CKcRxHnxymgfP1pBJl6msli8UQfw/z/F3zVM7180WrAermBcJidLEW79U9mqQwLYEPh
 XzMg==
X-Gm-Message-State: AOAM530tDvh2gOb1e3fIWGCEz5nDwboMBZ4sYdjg36vlC657WjmycsGT
 p9d8YFCa7x9s4m6w4U6jmJMaSPjXeJ7Y2B1NJvBveVRJaVHnHtMGY/xyzXnA3YBLslAc4a6/Niw
 +Z70CxgVPWacKm38=
X-Received: by 2002:a17:907:778a:: with SMTP id
 ky10mr35971278ejc.32.1625819361008; 
 Fri, 09 Jul 2021 01:29:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9TKjihcZbnst4sntCpZ6JtcywRqWPj8LMVLJ5ujwiHbqHoZ6Z3VDZFG25t2QVitrP4H5yNg==
X-Received: by 2002:a17:907:778a:: with SMTP id
 ky10mr35971257ejc.32.1625819360777; 
 Fri, 09 Jul 2021 01:29:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o9sm2509549edc.91.2021.07.09.01.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 01:29:20 -0700 (PDT)
Subject: Re: [PATCH] meson: Use input/output for entitlements target
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20210709012533.58262-1-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d1e23848-9aef-28b3-f199-aee64b2887c2@redhat.com>
Date: Fri, 9 Jul 2021 10:29:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709012533.58262-1-akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Frank Yang <lfy@google.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/07/21 03:25, Akihiko Odaki wrote:
> input/output parameters respect dependencies.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   meson.build            | 30 +++++++++++++++++-------------
>   scripts/entitlement.sh | 10 +++++-----
>   2 files changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 7e12de01bec..d21adecc0d8 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2521,28 +2521,32 @@ foreach target : target_dirs
>                  link_args: link_args,
>                  gui_app: exe['gui'])
>   
> -    if 'CONFIG_HVF' in config_target
> -      entitlements = meson.current_source_dir() / 'accel/hvf/entitlements.plist'
> -    else
> -      entitlements = '/dev/null'
> -    endif
>       if targetos == 'darwin'
> -      icon = meson.current_source_dir() / 'pc-bios/qemu.rsrc'
> +      icon = 'pc-bios/qemu.rsrc'
> +      build_input = [emulator, files(icon)]
> +      install_input = [
> +        get_option('bindir') / exe_name,
> +        meson.current_source_dir() / icon
> +      ]
> +      if 'CONFIG_HVF' in config_target
> +        entitlements = 'accel/hvf/entitlements.plist'
> +        build_input += files(entitlements)
> +        install_input += meson.current_source_dir() / entitlements
> +      endif
> +
>         emulators += {exe['name'] : custom_target(exe['name'],
> -                   depends: emulator,
> +                   input: build_input,
>                      output: exe['name'],
>                      command: [
> -                     meson.current_source_dir() / 'scripts/entitlement.sh',
> -                     meson.current_build_dir() / exe_name,
> -                     meson.current_build_dir() / exe['name'],
> -                     entitlements, icon
> +                     files('scripts/entitlement.sh'),
> +                     '@OUTPUT@',
> +                     '@INPUT@'
>                      ])
>         }
>   
>         meson.add_install_script('scripts/entitlement.sh', '--install',
> -                               get_option('bindir') / exe_name,
>                                  get_option('bindir') / exe['name'],
> -                               entitlements, icon)
> +                               install_input)
>       else
>         emulators += {exe['name']: emulator}
>       endif
> diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
> index d2a7079ce3e..e2c956a3ac9 100755
> --- a/scripts/entitlement.sh
> +++ b/scripts/entitlement.sh
> @@ -8,10 +8,10 @@ if [ "$1" = --install ]; then
>     in_place=false
>   fi
>   
> -SRC="$1"
> -DST="$2"
> -ENTITLEMENT="$3"
> -ICON="$4"
> +DST="$1"
> +SRC="$2"
> +ICON="$3"
> +ENTITLEMENT="$4"
>   
>   if $in_place; then
>     trap 'rm "$DST.tmp"' exit
> @@ -21,7 +21,7 @@ else
>     cd "$MESON_INSTALL_DESTDIR_PREFIX"
>   fi
>   
> -if test "$ENTITLEMENT" != '/dev/null'; then
> +if test -n "$ENTITLEMENT"; then
>     codesign --entitlements "$ENTITLEMENT" --force -s - "$SRC"
>   fi
>   
> 

Definitely better, thanks!!  I queued the patch.

Paolo


