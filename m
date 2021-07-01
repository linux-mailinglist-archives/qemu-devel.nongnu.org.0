Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818D53B8DDA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 08:49:06 +0200 (CEST)
Received: from localhost ([::1]:46966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyqVV-0007O3-22
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 02:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyqUf-0006gS-2R
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 02:48:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyqUZ-0007Zt-TS
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 02:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625122084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9sRobJowTJBtmJILpZHyUOx1KuxZoiPyX3mpk5zH44k=;
 b=AzsE78oybH/z+uCXmqAjUc4HkXn005V56oRmXF84yQ8JJsq+w6ki0FRJoM7xK9WNeOkiaG
 wbWjbjXh5YBPRZ6MLKbhSIMPCH6AkadmngOpjWamubTmOjqLk6E769vSI7fHG14j238xoB
 6QYhCAWVD8+iyyH/5WcU4KQnYrwGp9g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-0uFOrdqHNpG_b5OEJww_XQ-1; Thu, 01 Jul 2021 02:47:58 -0400
X-MC-Unique: 0uFOrdqHNpG_b5OEJww_XQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 a129-20020a1ce3870000b02901f050bc61d2so1763864wmh.8
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 23:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9sRobJowTJBtmJILpZHyUOx1KuxZoiPyX3mpk5zH44k=;
 b=m4yPjhnFTaDzczg7F9N+8GzbARAAcAdcNjafUnM2b7oRtkoiaAsEfd2sH8haVYjPWB
 mn2Va9esv7iZalmzUgOpFJwCDuXxMD+XVhagOQTlX1x3tcZjX/9l2jSsz57fdb3VnHzK
 1B/uI/vvqoHtPJcJpaXfVAqKYpVtRgpdQlKLQ6vx2TWkTUScdME3iJgsW8X34VWdAFg0
 6DGRLZJHOvZheuzkQqs3/esawQ1kQaKmGxNOCuY5/0qlzNa7fNGWuQkhQXHk9Vmnfv0w
 Yq3yM1fz384Os7Pdpmy7MRp6xrRPdN49gxaxH1ZZ2NDjO8+wafA8s8gpWShH4gmcG9Xy
 g8TA==
X-Gm-Message-State: AOAM532PRfv9pQUXFcuSUoBduf6lBOhxOi/2uidXgffaZ7iHC6MhJf0h
 o6W2PiPv/u7oKUINrhQi/N2fqUAmlGvPN5H8cNkROwxex53a6wMRA5cvjaayjhMM+MBSff/PoBw
 WcPbshPOqeUh/k3k=
X-Received: by 2002:a05:600c:22cc:: with SMTP id
 12mr19075057wmg.182.1625122077583; 
 Wed, 30 Jun 2021 23:47:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU30iWYT5Xb549wW59MI5HkiBv/9EQ87oNXUfQOBeuYiY8urGI8dn/GtibcnxF1pAeLpyI9g==
X-Received: by 2002:a05:600c:22cc:: with SMTP id
 12mr19075036wmg.182.1625122077395; 
 Wed, 30 Jun 2021 23:47:57 -0700 (PDT)
Received: from thuth.remote.csb (pd9575bc6.dip0.t-ipconnect.de.
 [217.87.91.198])
 by smtp.gmail.com with ESMTPSA id u15sm8255624wmq.48.2021.06.30.23.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 23:47:56 -0700 (PDT)
To: maobibo <maobibo@loongson.cn>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-21-git-send-email-gaosong@loongson.cn>
 <CAFEAcA_swZQG=XCGN4U4XfqrvK2poJw33oEC-5NDFtU3dT1ZuQ@mail.gmail.com>
 <5188a660-4bec-45bd-81bc-25dd3ba38f9c@loongson.cn>
 <87y2arpu7u.fsf@linaro.org>
 <32f41893-ac70-1138-94b8-ca09748d2b69@loongson.cn>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 20/20] target/loongarch: Add linux-user emulation support
Message-ID: <f93f1192-38b9-6a19-1116-0002fdf1104c@redhat.com>
Date: Thu, 1 Jul 2021 08:47:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <32f41893-ac70-1138-94b8-ca09748d2b69@loongson.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
 Huacai Chen <chenhuacai@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/07/2021 03.07, maobibo wrote:
> 
> 
> 在 2021年06月30日 17:36, Alex Bennée 写道:
>>
>> maobibo <maobibo@loongson.cn> writes:
>>
>>> 在 2021年06月29日 21:42, Peter Maydell 写道:
>>>> On Mon, 28 Jun 2021 at 13:05, Song Gao <gaosong@loongson.cn> wrote:
>>>>>
>>>>> Add files to linux-user/loongarch64
>>>>> Add file to default-configs
>>>>> Add loongarch to target/meson.build
>>>>>
>>>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>>>> ---
>>>>>   MAINTAINERS                                        |   1 +
>>>>>   default-configs/targets/loongarch64-linux-user.mak |   4 +
>>>>>   include/elf.h                                      |   2 +
>>>>>   linux-user/elfload.c                               |  58 ++++
>>>>>   linux-user/loongarch64/cpu_loop.c                  | 177 ++++++++++++
>>>>>   linux-user/loongarch64/signal.c                    | 193 +++++++++++++
>>>>>   linux-user/loongarch64/sockbits.h                  |   1 +
>>>>>   linux-user/loongarch64/syscall_nr.h                | 307 +++++++++++++++++++++
>>>>>   linux-user/loongarch64/target_cpu.h                |  36 +++
>>>>>   linux-user/loongarch64/target_elf.h                |  14 +
>>>>>   linux-user/loongarch64/target_fcntl.h              |  12 +
>>>>>   linux-user/loongarch64/target_signal.h             |  28 ++
>>>>>   linux-user/loongarch64/target_structs.h            |  49 ++++
>>>>>   linux-user/loongarch64/target_syscall.h            |  46 +++
>>>>>   linux-user/loongarch64/termbits.h                  | 229 +++++++++++++++
>>>>>   linux-user/syscall_defs.h                          |   8 +-
>>>>>   meson.build                                        |   2 +-
>>>>>   qapi/machine-target.json                           |   4 +-
>>>>>   target/loongarch/meson.build                       |  19 ++
>>>>>   target/meson.build                                 |   1 +
>>>>>   20 files changed, 1185 insertions(+), 6 deletions(-)
>>>>
>>>> This is a massive patch that would benefit from being split up
>>>> into multiple smaller patches.
>>>>
>>>> I'm told by a kernel developer that loongarch hasn't yet been
>>>> accepted into the Linux kernel mainline. Until it has been, the
>>>> syscall ABI for it is not yet stable, so we won't be able to take
>>>> the linux-user patches for it yet. (We have been burned in the
>>>> past by taking linux-user architecture support patches without
>>>> realizing they weren't for a stable ABI, and then being out of
>>>> sync with the eventual upstream kernel ABI that was accepted.)
>>>>
>>>> We can certainly do code review in the meantime, though.
>>> Thanks for reviewing the big series patches. It is understandable that
>>> there should be linux kernel merged for one new architecture support
>>> firstly, and then there will be linux-user simulator later.
>>>
>>> We are planning to submit patch to linux kernel for LoongArch support,
>>> there is the link:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/log/?h=loongarch-next
>>>
>>> And we will continueto  submit softmmu support for LoongArch. And is there
>>> any extra requirements for softmmu simulation for new architecture,
>>> such as gcc/binutils/bios?
>>
>> Ideally if there are some pre-built toolchains either as part of a
>> distro (we've used Debian Sid before for some) or easily to install in a
>> docker container as binary tarballs (like we do for tricore) then we can
>> enable basic check-tcg functionality.
>>
>> Going forward having stable URLs for test images of distros means we can
>> also enable check-acceptance tests.
> Thanks for guidance, it requires that linux kernel/gcc/glibc are submitted
> already. My meaning is that linux-user emulation depends on kernel
> syscall ABI, softmmu emulation does not have such dependency, on the contrast
> system emulation can be used to verify linux kernel. Is there any requirement
> for system emulation of new architecture?

I think we'd need some way of automatic regression testing for new targets. 
If your board has a serial UART that is easy to use, then please add a test 
in tests/qtest/boot-serial-test.c. And if there are any public Linux kernel 
binaries for (reliable) download anywhere, please add a test in 
tests/acceptance/, see for example the various machine_*.py files or 
boot_linux_console.py there.

  HTH,
   Thomas


