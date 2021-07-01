Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F703B9093
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 12:41:08 +0200 (CEST)
Received: from localhost ([::1]:59644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyu83-00061r-AL
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 06:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lyu78-0005Ft-QO
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:40:10 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lyu71-0005U5-0S
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:40:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so2600614wms.5
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 03:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=iQcO+vU4jZMYkx4cNd67d3QJHI7kkNjkUNGC1Vs5Vb0=;
 b=VG2Ab3xGmHGU3y/WccnWOji4DgN1JJ66GrQr0QlEloe2euZzk9ZeDZDecAyLnEiOlf
 iuNhLueOe5zZsRXANGc2GvCibgszU35fK/ZlxoxvpifWPDc7a8SJsZkV4QnXRXQxCwq4
 KTs9wdYKY/7eSVe1H+0nwwXDITLGTiX7RfcSw+bJtSqGglq28x77twQ3YPHptXo06fwD
 dd/HEt1Ja5HAcXi9YwAFlbLgNGw5W8BAQvGPQHh06L83zHtnm2CfIPw9rhwwWWG6Wxwh
 Iajp4Z9TTbmWYXBVIZNJc87Yv2x28nhA3Gy2Oy61spo9OZ1icj05kwrLSiTMl+jLJoQW
 X0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=iQcO+vU4jZMYkx4cNd67d3QJHI7kkNjkUNGC1Vs5Vb0=;
 b=Z7bsYfDTOUkjVJX8mZlursUGqH2zysYc+BIcNzRL44nHU/q6chjeOh0zc65zUpqhz1
 qpSB5oy9qTBupC3ozU09SVZWB9+dwPuilpHE7MPvt3oWlAKPA3qlAUGyxsyhli7tYyin
 JVqtc+A/A7a8CDRdIV2YkV5U2eDt1X1JfdQ8/aFl/iHfgDIqZSt+VilscS9dtCXfhEzN
 Gb96e4zIFxLQvnv2vnOu+d6ZAubMygDCF8KrBYiBUoXv65KN6faUAp6aX6VE0YJ+GtYf
 PmNhjwMrLRI3UM9zW02yq6LwVAUe0ohKW8cwdtPFy8mnuhnIJgk8POuOCIrBc93Y1rKC
 bIfw==
X-Gm-Message-State: AOAM5316MZtyj4w87f3qaXbLIfK/3iNmbC16Q5IAa1gK9eDeavERy3fg
 g+hSYLDS0FzMYIZuuBJHhzc6zQ==
X-Google-Smtp-Source: ABdhPJx8sQaT0kOh4CHH0fC65c+cQz5skYion/9RSKH9jW+LXDEGRT5g5HUNrL/9pg3xoIiH5L6Vrw==
X-Received: by 2002:a7b:c8d1:: with SMTP id f17mr9797491wml.141.1625136000714; 
 Thu, 01 Jul 2021 03:40:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x7sm24969348wre.8.2021.07.01.03.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 03:39:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F36171FF7E;
 Thu,  1 Jul 2021 11:39:58 +0100 (BST)
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-21-git-send-email-gaosong@loongson.cn>
 <CAFEAcA_swZQG=XCGN4U4XfqrvK2poJw33oEC-5NDFtU3dT1ZuQ@mail.gmail.com>
 <5188a660-4bec-45bd-81bc-25dd3ba38f9c@loongson.cn>
 <87y2arpu7u.fsf@linaro.org>
 <32f41893-ac70-1138-94b8-ca09748d2b69@loongson.cn>
 <f93f1192-38b9-6a19-1116-0002fdf1104c@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 20/20] target/loongarch: Add linux-user emulation support
Date: Thu, 01 Jul 2021 11:35:46 +0100
In-reply-to: <f93f1192-38b9-6a19-1116-0002fdf1104c@redhat.com>
Message-ID: <87k0mapbb5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 maobibo <maobibo@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 01/07/2021 03.07, maobibo wrote:
>> =E5=9C=A8 2021=E5=B9=B406=E6=9C=8830=E6=97=A5 17:36, Alex Benn=C3=A9e =
=E5=86=99=E9=81=93:
>>>
>>> maobibo <maobibo@loongson.cn> writes:
>>>
>>>> =E5=9C=A8 2021=E5=B9=B406=E6=9C=8829=E6=97=A5 21:42, Peter Maydell =E5=
=86=99=E9=81=93:
>>>>> On Mon, 28 Jun 2021 at 13:05, Song Gao <gaosong@loongson.cn> wrote:
>>>>>>
>>>>>> Add files to linux-user/loongarch64
>>>>>> Add file to default-configs
>>>>>> Add loongarch to target/meson.build
>>>>>>
>>>>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>>>>> ---
>>>>>>   MAINTAINERS                                        |   1 +
>>>>>>   default-configs/targets/loongarch64-linux-user.mak |   4 +
>>>>>>   include/elf.h                                      |   2 +
>>>>>>   linux-user/elfload.c                               |  58 ++++
>>>>>>   linux-user/loongarch64/cpu_loop.c                  | 177 +++++++++=
+++
>>>>>>   linux-user/loongarch64/signal.c                    | 193 +++++++++=
++++
>>>>>>   linux-user/loongarch64/sockbits.h                  |   1 +
>>>>>>   linux-user/loongarch64/syscall_nr.h                | 307 +++++++++=
++++++++++++
>>>>>>   linux-user/loongarch64/target_cpu.h                |  36 +++
>>>>>>   linux-user/loongarch64/target_elf.h                |  14 +
>>>>>>   linux-user/loongarch64/target_fcntl.h              |  12 +
>>>>>>   linux-user/loongarch64/target_signal.h             |  28 ++
>>>>>>   linux-user/loongarch64/target_structs.h            |  49 ++++
>>>>>>   linux-user/loongarch64/target_syscall.h            |  46 +++
>>>>>>   linux-user/loongarch64/termbits.h                  | 229 +++++++++=
++++++
>>>>>>   linux-user/syscall_defs.h                          |   8 +-
>>>>>>   meson.build                                        |   2 +-
>>>>>>   qapi/machine-target.json                           |   4 +-
>>>>>>   target/loongarch/meson.build                       |  19 ++
>>>>>>   target/meson.build                                 |   1 +
>>>>>>   20 files changed, 1185 insertions(+), 6 deletions(-)
>>>>>
>>>>> This is a massive patch that would benefit from being split up
>>>>> into multiple smaller patches.
>>>>>
>>>>> I'm told by a kernel developer that loongarch hasn't yet been
>>>>> accepted into the Linux kernel mainline. Until it has been, the
>>>>> syscall ABI for it is not yet stable, so we won't be able to take
>>>>> the linux-user patches for it yet. (We have been burned in the
>>>>> past by taking linux-user architecture support patches without
>>>>> realizing they weren't for a stable ABI, and then being out of
>>>>> sync with the eventual upstream kernel ABI that was accepted.)
>>>>>
>>>>> We can certainly do code review in the meantime, though.
>>>> Thanks for reviewing the big series patches. It is understandable that
>>>> there should be linux kernel merged for one new architecture support
>>>> firstly, and then there will be linux-user simulator later.
>>>>
>>>> We are planning to submit patch to linux kernel for LoongArch support,
>>>> there is the link:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loong=
son.git/log/?h=3Dloongarch-next
>>>>
>>>> And we will continueto  submit softmmu support for LoongArch. And is t=
here
>>>> any extra requirements for softmmu simulation for new architecture,
>>>> such as gcc/binutils/bios?
>>>
>>> Ideally if there are some pre-built toolchains either as part of a
>>> distro (we've used Debian Sid before for some) or easily to install in a
>>> docker container as binary tarballs (like we do for tricore) then we can
>>> enable basic check-tcg functionality.
>>>
>>> Going forward having stable URLs for test images of distros means we can
>>> also enable check-acceptance tests.
>> Thanks for guidance, it requires that linux kernel/gcc/glibc are submitt=
ed
>> already. My meaning is that linux-user emulation depends on kernel
>> syscall ABI, softmmu emulation does not have such dependency, on the con=
trast
>> system emulation can be used to verify linux kernel. Is there any requir=
ement
>> for system emulation of new architecture?
>
> I think we'd need some way of automatic regression testing for new
> targets. If your board has a serial UART that is easy to use, then
> please add a test in tests/qtest/boot-serial-test.c.

You can also write a very minimal softmmu harness with either
semihosting or a debug port - currently we can run the tests for
x86/arm/alpha. See tests/tcg/multiarch/system and the various
boot.S/kernel.ld in tests/tcg/FOO/system and the Makefile.softmmu-target
in the relevant directories.

Basically you need enough initialisation to get to a non-stdlib main and
a __sys_outc and __exit implementation. This allows for simple smoke
tests that don't need a full Linux/kernel to run.

> And if there are
> any public Linux kernel binaries for (reliable) download anywhere,
> please add a test in tests/acceptance/, see for example the various
> machine_*.py files or boot_linux_console.py there.
>
>  HTH,
>   Thomas


--=20
Alex Benn=C3=A9e

