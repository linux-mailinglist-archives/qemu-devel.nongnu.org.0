Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4A147C4EF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:23:24 +0100 (CET)
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzirD-000707-UQ
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:23:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziKf-0003Dz-2x
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:49:45 -0500
Received: from [2607:f8b0:4864:20::102e] (port=45752
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziKX-0007wV-8Q
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:49:43 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so3729741pjq.4
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7W49UAU/j4/B+2BK90XBZO4s7AqjSWxaMjLmZgyJ0+g=;
 b=ErA3aDFjwbGrAb611E7AtdDEPOJHGaSxodVdEb386ivqn2NDJUgeJp6fw9bV8blMtT
 RZVSCZ5t6zq1gbAytGY++ls/nYCBZWSrfZt+x/Wx1HLuhmsUv1Za0nQFtBVI1GyubefL
 CI8/TlN2UQ9yDUXtaNAId0zOLk8b70SPA/PFFRUx4FzLbpeqk9novb0z1YJoi9G5UPuT
 6EKbEuSem51nzxjJlz+kxr36UYB2ceWaLGuFN6apN7/bGfMMq1L3zz6skKQhot5EDoQK
 EoaToEWzSklM4ueeBWiS5ulAoKl85INUs+v9CTOMxe44+VHBdjvKtvjz5VSf0qTWdY+7
 kr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7W49UAU/j4/B+2BK90XBZO4s7AqjSWxaMjLmZgyJ0+g=;
 b=03JmzDxXlnniL+QSJuKjDYlRX/kW71DcviA4tJ8bZEN/clJrOfa5acJWP+Y6OWKUKb
 VXat8pibEKNGAU/JpHxQ+21nzh8YEsLVQRtcFgmN31TrlLauUq9h70sXqYAczK7quki0
 DcWTpWrHIS8w7lJ7T1iFCHFYRY1sbFBgzgbMCub7KfUfgttizg8ZNS3px/H0lGP9+jz6
 FeqvP+qm+dZ2WzOmchXEB7Si/9yEEiCzuj6nQkiguObhEwLrvaxjFEm+LsrVqxX5HYOt
 whLJC4oLOjniyixWY4xVcjt5gHL47cLcLgRgCbYA6mxz72SFBMbweRQBDgnoIzQmUnEg
 vXLg==
X-Gm-Message-State: AOAM5309ke/EnPcOEtsPm4IvqxMy4G3K+/jkYZjIMONlkMhdn3lP5KrV
 /OY3peu6Zivw2X9QTrcNCN0emTtRHGle9w==
X-Google-Smtp-Source: ABdhPJyW+Tu6Cu3z5zRfMoXn/9MhxVLu0ucScTLQXFvE48oXHxht6twlWE6RvVgyAsLbNczCTrkDOw==
X-Received: by 2002:a17:902:d512:b0:149:3070:48ec with SMTP id
 b18-20020a170902d51200b00149307048ecmr3893373plg.66.1640105369257; 
 Tue, 21 Dec 2021 08:49:29 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q28sm3134030pgn.14.2021.12.21.08.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 08:49:28 -0800 (PST)
Subject: Re: [PATCH v11 00/31] LoongArch64 port of QEMU TCG
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20211221054105.178795-1-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2d18aae-981f-caec-b274-5dedcde8d0c5@linaro.org>
Date: Tue, 21 Dec 2021 08:49:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221054105.178795-1-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 9:40 PM, WANG Xuerui wrote:
> Hi all,
> 
> This is a port of QEMU TCG to the brand-new CPU architecture LoongArch,
> introduced by Loongson with their 3A5000 chips.
> 
> Everything is tested on real 3A5000 board (system emulation, linux-user,
> make check) and GitLab (CI jobs), and rebased to latest master branch.
> 
> ## About the series
> 
> Only the LP64D ABI is supported, as this is the only one fully
> implemented and supported by Loongson so far. 32-bit support is incomplete
> from outset, and removed from the very latest upstream submissions, so you
> can't even configure for that.
> 
> The architecture's documentation is already translated into English;
> it can be browsed at https://loongson.github.io/LoongArch-Documentation/.
> The LoongArch ELF psABI doc (version 1.00) could be found at [1];
> if anything is missing there, it's most likely the same as RISC-V, but
> you can always raise an issue over their issue tracker at [2].
> 
> [1]: https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-ABI-EN.html
> [2]: https://github.com/loongson/LoongArch-Documentation/issues
> 
> In this series I made use of generated instruction encodings and
> emitters from https://github.com/loongson-community/loongarch-opcodes
> (a community project started by myself, something I must admit), as the
> LoongArch encoding is highly irregular even for a fixed 32-bit ISA, and
> I want to minimize the maintenance burden for future collaboration.
> 
> This series touches some of the same files as Song Gao's previous
> submission of LoongArch *target* support, which is a bit unfortunate;
> one of us will have to rebase after either series gets in. Actual
> conflict should only happen on build system bits and include/elf.h,
> though, as we're working on entirely different areas.
> 
> ## How to build and test this
> 
> Upstream support for LoongArch is largely WIP for now, which means you
> must apply a lot of patches if you want to even cross-build for this arch.
> The main sources I used are as follows:
> 
> * binutils: (already upstream as of November 2021)
> * gcc: https://github.com/xen0n/gcc/tree/for-gentoo-gcc-12-v5
>    based on https://github.com/loongson/gcc/tree/loongarch_upstream_v3
> * glibc: https://github.com/xen0n/glibc/tree/for-gentoo-glibc-2.34-v3
>    based on https://github.com/loongson/glibc/tree/loongarch_2_34_dev
> * Linux: https://github.com/xen0n/linux/tree/loongarch-playground-v7
>    based on https://github.com/loongson/linux/tree/loongarch-next
> * Gentoo overlay: https://github.com/xen0n/loongson-overlay
> 
> I have made ready-to-use Gentoo stage3 tarballs, but they're served with
> CDN off my personal cloud account, and I don't want the link to be
> exposed so that my bills skyrocket; you can reach me off-list to get the
> links if you're interested.
> 
> As for the hardware availability, the boards can already be bought in
> China on Taobao, and I think some people at Loongson might be able to
> arrange for testing environments, if testing on real hardware other than
> mine is required before merging; they have their in-house Debian spin-off
> from the early days of this architecture. Their kernel is
> ABI-incompatible with the version being upstreamed and used by me, but
> QEMU should work there regardless.
> 
> Lastly, I'm new to QEMU development and this is my first patch series
> here; apologizes if I get anything wrong, and any help or suggestion is
> certainly appreciated!
> 
> ## Changelog
> 
> v11 -> v10:
> 
> - Rebased to latest development branch

Awesome, thanks.  I was just about to ask if you could update for Paolo's meson.build 
changes.  I've tagged the PR for the initial commit, and it'll go in next.


r~

