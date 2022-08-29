Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820465A57B2
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 01:41:40 +0200 (CEST)
Received: from localhost ([::1]:42128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSoNv-0004k7-4x
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 19:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oSoLS-00038X-Av
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 19:39:06 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oSoLO-0003C3-B9
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 19:39:04 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f4so9086774pgc.12
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 16:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=25I+Ghi6VaV+c+sGIhUZwTuyCPR7HIKKKt++UKMKW2o=;
 b=PoR1+BWYGJW9QTdeH7W5Z2A5rfA+Bnmv97Nzq5QjPAa91I7SPltIuqT6dyTkhacd31
 922sVGsVYMGDIHR7yFCyQ3a9Nvcy8ghlCD7d8fO/2H3s3Y79+lrRm16K9txP4sYZVh4v
 DjhOe7PRYY9m4nxJmuNrdxecVa6F6brbGJs6Pst1uF41LSd3AKkDmn7ITv0mgfvwE1wP
 RrI/+yGP+Xiast3tEZw1NP76bRmeoLJGYqaEWFgUcXurXslLYEdwISt2dzcgysXWYV7W
 F/Y421AwxjJ1lZiw4kI1dxE4OvR2h3UggJxnvWXPYfYqVcib34PqTvnoXltQIsBaYAAN
 yFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=25I+Ghi6VaV+c+sGIhUZwTuyCPR7HIKKKt++UKMKW2o=;
 b=4VtE3kzCCJCDDWVkQ1j41N/RTwzglm9/OCvgmA5MVrQaXMsykG3p7yKDIyK/RI+hTX
 wg0v5ZsRsqtREwMYby+M/hZHJ27yLcVk6+dncewEXEl5G9WU8zjxdSPNLBqnrGJXgR9I
 pQyomO3MIII27rakAZSeb2VK/ikPPOz0DN+AH915c0d3IvREIuIVU6AwdnxOYBKUd4va
 QVqLbWVjf4OqRwPlhXKuY3pgl/AXZ39Af4DXDCiclseVlHEhUsM7PtZmUUZIrHovKtMq
 RsUYXebp55fGdMc4rh2FYXEOGXjpuMbu5psROFSBrM9Lz/t+uRbg1a/eb27QnqIzf2th
 h2+g==
X-Gm-Message-State: ACgBeo0HqXtISk69rC8X5NCKezbW7TS23CFtUqM0O7Td+aj/UqB8jKS8
 76R3Faunlfhk/JXWSyn7Y3Y=
X-Google-Smtp-Source: AA6agR6yAixLz/+oaFSBsMJxbCUeKP4X0qqGSW/HPf09zYdqzUZqOPsRw/1F4rHwu4Pv1fdoAx+/HQ==
X-Received: by 2002:a65:6216:0:b0:41d:8248:3d05 with SMTP id
 d22-20020a656216000000b0041d82483d05mr16195673pgv.36.1661816340108; 
 Mon, 29 Aug 2022 16:39:00 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a625e06000000b0052d52de6726sm7808671pfb.124.2022.08.29.16.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 16:38:59 -0700 (PDT)
Message-ID: <9f5c9c75-e4d7-b262-73ec-d9727ac372e4@amsat.org>
Date: Tue, 30 Aug 2022 01:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 15/25] Deprecate 32 bit big-endian MIPS
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-16-alex.bennee@linaro.org>
In-Reply-To: <20220826172128.353798-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Alex,

(+Aleksandar/Huacai)

On 26/8/22 19:21, Alex Bennée wrote:
> It's becoming harder to maintain a cross-compiler to test this host
> architecture as the old stable Debian 10 ("Buster") moved into LTS
> which supports fewer architectures. For now:
> 
>    - mark it's deprecation in the docs
>    - downgrade the containers to build TCG tests only
>    - drop the cross builds from our CI
> 
> Users with an appropriate toolchain and user-space can still take
> their chances building it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/about/build-platforms.rst                |  2 +-
>   docs/about/deprecated.rst                     | 13 ++++++
>   .gitlab-ci.d/container-cross.yml              |  1 -
>   .gitlab-ci.d/crossbuilds.yml                  | 14 -------
>   tests/docker/Makefile.include                 |  5 +--
>   .../dockerfiles/debian-mips-cross.docker      | 40 +++++--------------
>   6 files changed, 27 insertions(+), 48 deletions(-)
> 
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index 26028756d0..1ca9144a7d 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -41,7 +41,7 @@ Those hosts are officially supported, with various accelerators:
>        - Accelerators
>      * - Arm
>        - kvm (64 bit only), tcg, xen
> -   * - MIPS
> +   * - MIPS (LE only)
>        - kvm, tcg
>      * - PPC
>        - kvm, tcg
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 91b03115ee..22c2f4f4de 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -213,6 +213,19 @@ MIPS ``Trap-and-Emul`` KVM support (since 6.0)
>   The MIPS ``Trap-and-Emul`` KVM host and guest support has been removed
>   from Linux upstream kernel, declare it deprecated.
>   
> +Host Architectures
> +------------------
> +
> +BE MIPS (since 7.2)
> +'''''''''''''''''''
> +
> +A Debian 10 ("Buster") moved into LTS the big endian 32 bit version of
> +MIPS moved out of support making it hard to maintain our
> +cross-compilation CI tests of the architecture. As we no longer have
> +CI coverage support may bitrot away before the deprecation process
> +completes. The little endian variants of MIPS (both 32 and 64 bit) are
> +still a supported host architecture.

For completeness we should update meson.build to consider 
host_machine.endian() and adapt this section:


   if not supported_cpus.contains(cpu)
     message()
     warning('SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELEASES!')
     message()
     message('CPU host architecture ' + cpu + ' support is not currently 
maintained.')
   ...

This can be done later, and I might be able to do so in few weeks,
so meanwhile (with Thomas comment addressed):
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

