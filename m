Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4C65A3099
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:42:39 +0200 (CEST)
Received: from localhost ([::1]:55660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRg9i-0007jB-Bc
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRg70-0004NI-Vc
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:39:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRg6x-0000o9-W1
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661546366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBlwLYgwBGjBCrgyRYEjm7jtp2oXgYoWA0ATtzrLF3E=;
 b=PMaXzvn2IuRcc2wD9kwlH/vn1n1nEZgIM29mBF2kaRKiQ789WtILkxR5JubMfqYKVRLgtt
 VqOeFK8t4s2VYgq/ApQk+lVnTc98XFL425RRpnC78pUsK0OnXQZRRnuKy8Z35B4O6lKyHQ
 d9syuvhi9xAvuXEaGd+RkXm+ChM4YIM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-468-uOlab7_IM5OJqdriq_M78w-1; Fri, 26 Aug 2022 16:39:25 -0400
X-MC-Unique: uOlab7_IM5OJqdriq_M78w-1
Received: by mail-wm1-f70.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so1393348wmn.2
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UBlwLYgwBGjBCrgyRYEjm7jtp2oXgYoWA0ATtzrLF3E=;
 b=rXfj7TjJZoyI2k4imP3Vflht8zuUx7nLCi7HU1E20xzttDITczS9LwVkzl8hfTIWTl
 fDj0MJbiQybGwunVx8zpq8fLol8x3IfN6OLXmccWCLMNgsSovr6dy9KEGvunB0NStMBP
 1ud9LwBopDqn5/lP/yxPScRqyS4V1s7befNHcGLn1dBHsRt2ZJBCC7xepotKYD1ofuHG
 KKcFOmbqO2cD4kiFG9fFg+8BvF0O0KqzL3sMu4CS3Q7F2QuB7LvfInqONhQ0Ud0eJ0Rn
 q11l5JsoewUMzwrwtkenua/JYXJEcgJ1GduqJZ673eQYM4ryjtJu3LYIOvi3oxwvH+47
 /LkA==
X-Gm-Message-State: ACgBeo3tdq3/28lk+lt3B7Z0w0YEVIeE5U79uRYS04rgxabyjUd+Ku9U
 ECK0TzxoFglLEgoi5Oa5I/HdybkfX4M4aIsT7h2WI+o0CKHI4htw2b/kqKIFmrGZkWWajPSaiD7
 r23VbmigO+aYL+s0=
X-Received: by 2002:a05:600c:3b93:b0:3a6:c3b:37eb with SMTP id
 n19-20020a05600c3b9300b003a60c3b37ebmr658957wms.185.1661546364049; 
 Fri, 26 Aug 2022 13:39:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6FscF2yV5YsWJIvviIh6DgsomVjerhsnM9T3MKMLte70ypliYdvjDn7+XE+AGd2cu0jlS1eQ==
X-Received: by 2002:a05:600c:3b93:b0:3a6:c3b:37eb with SMTP id
 n19-20020a05600c3b9300b003a60c3b37ebmr658939wms.185.1661546363650; 
 Fri, 26 Aug 2022 13:39:23 -0700 (PDT)
Received: from [192.168.8.101] (tmo-083-97.customers.d1-online.com.
 [80.187.83.97]) by smtp.gmail.com with ESMTPSA id
 r14-20020a0560001b8e00b0021d80f53324sm647792wru.7.2022.08.26.13.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 13:39:23 -0700 (PDT)
Message-ID: <a2211678-6d66-4cc0-35c2-ac2fd7d27c9a@redhat.com>
Date: Fri, 26 Aug 2022 22:39:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-16-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 15/25] Deprecate 32 bit big-endian MIPS
In-Reply-To: <20220826172128.353798-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26/08/2022 19.21, Alex Bennée wrote:
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

I'd replace "LE" with "little endian" - not everybody might know that 
abbreviation.

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

s/A Debian/As Debian/

> +MIPS moved out of support making it hard to maintain our
> +cross-compilation CI tests of the architecture. As we no longer have
> +CI coverage support may bitrot away before the deprecation process
> +completes. The little endian variants of MIPS (both 32 and 64 bit) are
> +still a supported host architecture.
> +
>   QEMU API (QAPI) events
>   ----------------------
...
> diff --git a/tests/docker/dockerfiles/debian-mips-cross.docker b/tests/docker/dockerfiles/debian-mips-cross.docker
> index 26c154014d..75943619df 100644
> --- a/tests/docker/dockerfiles/debian-mips-cross.docker
> +++ b/tests/docker/dockerfiles/debian-mips-cross.docker
> @@ -1,32 +1,14 @@
>   #
> -# Docker mips cross-compiler target
> +# Docker cross-compiler target

Why did you remove the "mips" here?

  Thomas


