Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888564BAD88
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 00:53:08 +0100 (CET)
Received: from localhost ([::1]:49868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKqaB-0006rM-3W
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 18:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKqXf-0005X4-QH; Thu, 17 Feb 2022 18:50:31 -0500
Received: from [2a00:1450:4864:20::532] (port=37471
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKqXd-0004qh-1Z; Thu, 17 Feb 2022 18:50:31 -0500
Received: by mail-ed1-x532.google.com with SMTP id q17so12523657edd.4;
 Thu, 17 Feb 2022 15:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3SUncBg7tnXt+1SvYlz1kZnuraD/uLu0eqBrmfIGZj4=;
 b=Y/DyDggO3nBxioI+IZH7rDbf6JYTFMvE3SwrQrPW9ieaLLQkmikgh4ga3BzYSKmg7Y
 IuDkxkcYUZSkZoqA4LtxhsQavNGpiInuvEx5G58Ix35NX54OTJ2xHFNRP5xkNWtehac6
 9NdmOG3PKd2fnASF52ygQdt+gnNbKfw3VVCnBpn2tw6+6s/ghbwRteyUEJw5hOimPrxl
 4jdcr0MlskabyBEGmsUVSC63Qaw3KyAy49VrWGLY33BuWwSihDy9CUbi4TSwHaIHwD2f
 hFY3ws2AyPTxP1CbL1GTKiKf/B6u2qteSHlWcZG7fZDWaIW5kUHJSS4t6m+JQggpWiwe
 NC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3SUncBg7tnXt+1SvYlz1kZnuraD/uLu0eqBrmfIGZj4=;
 b=exokdwQKkpW25ZxjKb4jSOBBdUHfY0gApD6Uj2s9t1Gt/34F9Yt4nsBeLpKK7hHwfN
 BUfGDqfkC8LJIoSPapKDjKQ4UoCGnHwfnAhTfbZzh/bekcv3rCgVj1FFF6G4pGCf4UxJ
 SoLMTeR3kr1zzV2FulRCU/y8pKSGC43N7s9GCj6AJAzr1rpMG0BLDlBPQhNDcpR51Pnc
 8IGb4Oz/ug5Nla/NztIwZSh3znrpfMQsvCX1+WIOpRPfsazpIYwWF2lV+ztTziI/6G6x
 zFdEq6dFFChHDO6+Sp0Svz/b9LUdmvypjgMDcDf7k/OcNw6Az6HkxAy3Xu/haQZ6ARio
 AJiA==
X-Gm-Message-State: AOAM532Y831Ha8fnCA/7IpmMyIK8JhxNoMlBhSYTmZXUDQyOyAP5RmZh
 aju6JyOnpG1qEiUoUwZ10sA=
X-Google-Smtp-Source: ABdhPJwEgPoHXC2ogTtvRJzTzzC0UtCybYUWcavQ1tyPrOfIJeLeLFXZ7BzCfHA3aYwSLLukrK731A==
X-Received: by 2002:a50:aac8:0:b0:410:ae77:c484 with SMTP id
 r8-20020a50aac8000000b00410ae77c484mr5271501edc.431.1645141826848; 
 Thu, 17 Feb 2022 15:50:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id er17sm3001208edb.34.2022.02.17.15.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 15:50:26 -0800 (PST)
Message-ID: <eb099ea1-f88e-8b4f-22ab-863952c04f32@redhat.com>
Date: Fri, 18 Feb 2022 00:50:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] configure: Support empty prefixes
Content-Language: en-US
To: Joshua Seaton <josh.a.seaton@gmail.com>, qemu-devel@nongnu.org
References: <CAPbYy+_14jeLBzihGjY-v0L1inZ1CGc+8TFu7NuPiaZie8skyg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAPbYy+_14jeLBzihGjY-v0L1inZ1CGc+8TFu7NuPiaZie8skyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org, geist@foobox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/22 19:42, Joshua Seaton wrote:
> At least as of v5 (before the meson build), empty `--prefix` values were
> supported; this seems to have fallen out along the way. This change
> reintroduces support.

What is the usecase exactly?  QEMU supports relocatable installation so 
if you want you can use --prefix=/nonexistent and then move the 
resulting tree wherever you want.

Paolo

> Tested locally with empty and non-empty values of `--prefix`.
> 
> Signed-off-by: Joshua Seaton <josh.a.seaton@gmail.com>
> ---
>   configure | 33 ++++++++++++++++++++++++---------
>   1 file changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/configure b/configure
> index 3a29eff5cc..87a32e52e4 100755
> --- a/configure
> +++ b/configure
> @@ -1229,20 +1229,30 @@ case $git_submodules_action in
>       ;;
>   esac
> 
> -libdir="${libdir:-$prefix/lib}"
> -libexecdir="${libexecdir:-$prefix/libexec}"
> -includedir="${includedir:-$prefix/include}"
> +# Emits a relative path in the case of an empty prefix.
> +prefix_subdir() {
> +    dir="$1"
> +    if test -z "$prefix" ; then
> +        echo "$dir"
> +    else
> +        echo "$prefix/$dir"
> +    fi
> +}
> +
> +libdir="${libdir:-$(prefix_subdir lib)}"
> +libexecdir="${libexecdir:-$(prefix_subdir libexec)}"
> +includedir="${includedir:-$(prefix_subdir include)}"
> 
>   if test "$mingw32" = "yes" ; then
>       bindir="${bindir:-$prefix}"
>   else
> -    bindir="${bindir:-$prefix/bin}"
> +    bindir="${bindir:-$(prefix_subdir bin)}"
>   fi
> -mandir="${mandir:-$prefix/share/man}"
> -datadir="${datadir:-$prefix/share}"
> -docdir="${docdir:-$prefix/share/doc}"
> -sysconfdir="${sysconfdir:-$prefix/etc}"
> -local_statedir="${local_statedir:-$prefix/var}"
> +mandir="${mandir:-$(prefix_subdir share/man)}"
> +datadir="${datadir:-$(prefix_subdir share)}"
> +docdir="${docdir:-$(prefix_subdir share/doc)}"
> +sysconfdir="${sysconfdir:-$(prefix_subdir etc)}"
> +local_statedir="${local_statedir:-$(prefix_subdir var)}"
>   firmwarepath="${firmwarepath:-$datadir/qemu-firmware}"
>   localedir="${localedir:-$datadir/locale}"
> 
> @@ -3763,6 +3773,11 @@ if test "$skip_meson" = no; then
>     mv $cross config-meson.cross
> 
>     rm -rf meson-private meson-info meson-logs
> +
> +  # Workaround for a meson bug preventing empty prefixes:
> +  # see https://github.com/mesonbuild/meson/issues/6946.
> +  prefix="${prefix:-/}"
> +
>     run_meson() {
>       NINJA=$ninja $meson setup \
>           --prefix "$prefix" \
> --
> 2.35.1.265.g69c8d7142f-goog
> 


