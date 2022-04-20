Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D76508C1E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:29:34 +0200 (CEST)
Received: from localhost ([::1]:58388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCGs-0005cH-0Y
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhC0o-0007mO-GF
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:13:01 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhC0m-0005pe-Pt
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:12:58 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso1433057wml.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vDwbXYE4+06IJkfUBvyYkAyqqD26VkulRPtHxpi+rP0=;
 b=KrQgOOKrIfm3J6xBFWVGUqMFrG2+x3CrWJlxLGU7MHErAr7pNpPwFOPLf7M3Y5DGPH
 mxVWwn8Ooh8P8FXDUclpNc1NXjHplNbwVtlpux6uTFar87k2RT8sy9VvMH/OCOq7edNX
 B5osfFJVxtLEZynzRgS5ru5KJyXNM/12W7EczVPLzMIb/4ckrDFECTlvhJcXefDG99ky
 7Qi76SS7NNK9fveQ0X05/pFKjtGDugObge2lb3Qvo2RH+BWyG4C4kaPQbcu5x5U3Lu1Q
 ShVMTsUJV7+KQxHMY6Uj16xD9tSS+XDL75JgGGtN1oPP5AhUBiLmYDhEJ6mRA8FHXuNC
 dfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vDwbXYE4+06IJkfUBvyYkAyqqD26VkulRPtHxpi+rP0=;
 b=kCHzDfba4RXGF2lVsos8AObdMzVUb8LNwxxLyGXEfPDm3zvUyy004slP0oWAWVCoA1
 XZuUSXeaiURIp17TkUYgKY5hHg+hkYqrwonCYJJRMAhDOkdviPZQ2gbHu6pid9l1tdxh
 Ahq9VU1FpNCzlO7kRePJ3ebo9jZ0upMnkkWkQ8ZqxUtMZvh8KhbmZNX5pBiQJYOYOrgN
 hvKdjUFmbsWhMa/8hWemkBwppXe4eVWd05OZtlU+lY7/Sw13wGY+RRYqUGdojVY5oSKu
 UPQBXtEoQbIEpUHFvxdJ/K1tpLWNdH9V9Vjd/rsxAxofPyKa/fkPjW9S+ZkdwWE4waz+
 Nqig==
X-Gm-Message-State: AOAM5311HFrhpcfOs/OYziSg5Myelnf4gOYpMD8V9hN9PK4d8K6mahNR
 2cJuZ8iLAXQQ8avamh74kbY=
X-Google-Smtp-Source: ABdhPJzWUqVGe9cNWSqJ8gdDzwNk+36jIFjcLfa/uBNff4luDfiAox8Kiy4PhaM9e74IpbjDRAovpg==
X-Received: by 2002:a7b:cb05:0:b0:38c:7910:d935 with SMTP id
 u5-20020a7bcb05000000b0038c7910d935mr4189938wmj.170.1650467575387; 
 Wed, 20 Apr 2022 08:12:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 u5-20020adfed45000000b00207a480e6aasm77562wro.116.2022.04.20.08.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 08:12:54 -0700 (PDT)
Message-ID: <1e607128-3239-dd54-a730-71f6e8b1f455@redhat.com>
Date: Wed, 20 Apr 2022 17:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 07/41] build-sys: remove MSI's QEMU_GA_MSI_MINGW_DLL_PATH
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-8-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220420132624.2439741-8-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/22 15:25, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Since the introduction of the variable in commit 9dacf32d2cb ("qemu-ga:
> Building Windows MSI installation with configure/Makefile"), nothing
> makes use of the Mingw_dlls variable in the .wxs file.

I think it's a typo for Mingw_bin, i.e.

-                              '-D', 'Mingw_dlls=' + config_host['QEMU_GA_MSI_MINGW_DLL_PATH'],
+                              '-D', 'Mingw_bin=' + config_host['QEMU_GA_MSI_MINGW_DLL_PATH'],

but I am happy to get rid of it.

Paolo

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   configure       | 3 ---
>   qga/meson.build | 1 -
>   2 files changed, 4 deletions(-)
> 
> diff --git a/configure b/configure
> index 7c08c18358be..8cbe55ac82e8 100755
> --- a/configure
> +++ b/configure
> @@ -2704,8 +2704,6 @@ if test "$QEMU_GA_VERSION" = ""; then
>       QEMU_GA_VERSION=$(cat $source_path/VERSION)
>   fi
>   
> -QEMU_GA_MSI_MINGW_DLL_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
> -
>   # Mac OS X ships with a broken assembler
>   roms=
>   if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
> @@ -2792,7 +2790,6 @@ if test "$debug_tcg" = "yes" ; then
>   fi
>   if test "$mingw32" = "yes" ; then
>     echo "CONFIG_WIN32=y" >> $config_host_mak
> -  echo "QEMU_GA_MSI_MINGW_DLL_PATH=${QEMU_GA_MSI_MINGW_DLL_PATH}" >> $config_host_mak
>     echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER}" >> $config_host_mak
>     echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
>     echo "QEMU_GA_VERSION=${QEMU_GA_VERSION}" >> $config_host_mak
> diff --git a/qga/meson.build b/qga/meson.build
> index 392d56094198..da5e5efb19e8 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -129,7 +129,6 @@ if targetos == 'windows'
>                                 wixl, '-o', '@OUTPUT0@', '@INPUT0@',
>                                 qemu_ga_msi_arch[cpu],
>                                 qemu_ga_msi_vss,
> -                              '-D', 'Mingw_dlls=' + config_host['QEMU_GA_MSI_MINGW_DLL_PATH'],
>                               ])
>       all_qga += [qga_msi]
>       alias_target('msi', qga_msi)


