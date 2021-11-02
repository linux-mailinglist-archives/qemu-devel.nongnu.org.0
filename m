Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F51443163
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:17:45 +0100 (CET)
Received: from localhost ([::1]:44484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvXk-0001XR-5Y
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mhvFn-0003MX-EI
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:59:11 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:38411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mhvFk-0003TQ-Iu
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:59:11 -0400
Received: by mail-ua1-x92a.google.com with SMTP id o26so38478924uab.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 07:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l+EbGFGzz3cVp1ozeRjMrUo/6U1jb0Ru2emMs911JRU=;
 b=iV5cN8B7YzQ50AE7W19TiZRE2Vs8DnTT4j5D2DU28SjTs5VKDV7xu3oi/RKjVS5Jdy
 xd+IIPmvUKX60g1MoD9CbO0vtg3UIPSUNeBSrkKsC0lgtdwAR8IfLWB3e2mr9SRGN4Ix
 2Q68tUEo7UNcEgDm7Bm+vWkX6m9dmYpCwRp9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l+EbGFGzz3cVp1ozeRjMrUo/6U1jb0Ru2emMs911JRU=;
 b=SFIXbzJerHlPdVe5/I/9mFvZh2Wk8o7kbAZnoql7xKtyCol4vdHbAA2LoIWbNdxyfR
 Zn5XjnAe+yQC4FGDq7+JX7oqdxEsWfoH9/cwYAGlzYMHsBaqiBQPzqAO4ezpslr00u2Z
 c6flciRkV5oEfFeRtXKeJMXP12gZKzX3DEqbxINouBkhwrZLcj5AWiGOxdmsiZxyRORI
 SMynKt6FMtdg/QJVqpCNyfW71D42V0Qb9SxcstFiB81OsJTpzGDy0c3RCey5jOuKO8OZ
 N8ffV/uBXacuRWU2w6b00URCZsz4JN8+cgFDPS+eCUh0qaDfyHrsRO/CekB2hI5YwmU/
 sAtg==
X-Gm-Message-State: AOAM533Isu0NZ/FCOBsTlGIdUR75XSln2lWT328+4Mto3oc1bfPY4CPh
 mXhaf98d6VMLTYbAbbj6zqt/fk17XO/9n6eWrC2m2Q==
X-Google-Smtp-Source: ABdhPJwXou2r2t6LkydIMRal1bHi41+ZqE9AtwYABgSTL+aAesBsPX7kRkcTQ0upire1JJmqgDrnqx7GY6KQWO9IrFc=
X-Received: by 2002:a05:6102:b01:: with SMTP id
 b1mr25145128vst.58.1635865146942; 
 Tue, 02 Nov 2021 07:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211101011734.1614781-1-sjg@chromium.org>
 <CAHFG_=X1DeBFkzwFBkirMkmHB0_OSa9OkQj+CvpG6dT5HZEWBA@mail.gmail.com>
In-Reply-To: <CAHFG_=X1DeBFkzwFBkirMkmHB0_OSa9OkQj+CvpG6dT5HZEWBA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 2 Nov 2021 08:58:55 -0600
Message-ID: <CAPnjgZ1we6-nJ1RXz3TK67c7Pj9Znh++rBy-SYtECZURt8bLWw@mail.gmail.com>
Subject: Re: [PATCH 00/31] passage: Define a standard for firmware data flow
To: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=sjg@google.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jerry Van Baren <vanbaren@cideas.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Fran=C3=A7ois,

On Mon, 1 Nov 2021 at 02:53, Fran=C3=A7ois Ozog <francois.ozog@linaro.org> =
wrote:
>
> Hi Simon,
>
> this seems a great endeavor. I'd like to better understand the scope of i=
t.
>
> Is it to be used as part of what could become a U-Boot entry ABI scheme? =
By that I mean giving some fixed aspects
> to U-Boot entry while letting boards to have flexibility (say for instanc=
e that the first 5 architecture ABI
> parameter registers are reserved for U-Boot), and the Passage is about sp=
ecifying either those reserved registers
> or one of them?

The goal is to provide a standard entry scheme for all firmware
binaries. Whether it achieves that (or can with some mods) is up for
discussion.

Re the registers, do you think we need 5?

>
> Thinking entry ABI, here is what I observed on Arm:
>
> Linux has two entry ABIs:
> - plain: x0 =3D dtb;
>           command line =3D dtb:/chosen/bootargs; initrd =3D dtb:/chosen/l=
inux,initrd-*
> - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;
>            dtb =3D EFI_UUID config table; initrd =3D efi:<loadfile2(INITR=
D vendor media UUID); command line =3D efi: image_protocol::load_options
>
> U-Boot (proper) has plenty of schemes:
> - dtb is passed as either x0, x1, fixed memory area (Qemu which is bad in=
 itself), or other registers
> - additional information passing: board specific register scheme, SMC cal=
ls
> - U-Boot for RPI boards implement a Linux shaped entry ABI to be launched=
 by Videocore firmware
>
> Based on all the above, I would tend to think that RPI scheme is a good i=
dea but also
> shall not prevent additional schemes for the boards.

I was not actually considering Linux since I believe/assume its entry
scheme is fixed and not up for discussion.

I also did not think about the EFI case. As I understand it we cannot
touch it as it is used by UEFI today. Maybe it is even in the
standard?

Really I am hoping we can start afresh...?

>
> What about a U-Boot Arm entry ABI like:
> - plain: x0=3Ddtb, x1=3D<Passage defined>, x2-x5 =3D <reserved>, other re=
gisters are per platform, SMC calls allowed too

Hmm we don't actually need the dtb as it is available in the bloblist.
But I added an offset to it as a convenience.

> - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;  (when U-Boot=
 is launched as an EFI app)
>        dtb =3D EFI_UUID config table, + Passage =3D Passage UUID config t=
able

I don't understand the last line. Where is the passage info /
bloblist? Do you mean it goes in the HOB list with a UUID? I suppose
that is the most EFI-compatible way.

What do you think about the idea of using an offset into the bloblist
for the dtb? Also, can we make the standard passage ABI a build-time
option, so it is deterministic?

>
> We could further leverage Passage to pass Operating Systems parameters th=
at could be removed from device tree (migration of /chosen to Passage). Mem=
ory inventory would still be in DT but allocations for CMA or GPUs would be=
 in Passage. This idea is to reach a point where  device tree is a "pristin=
e" hardware description.

I'm worried about this becoming a substitute for devicetree. Really my
intent is to provide a way to pass simple info, whereas what you talk
about there seems like something that should be DT, just that it might
need suitable bindings.

As you know I have more expansive views about what should be in DT.

>
> Cheers
>
> PS: as Ilias mentions, this patch set contains bug fixes, non immediately=
 related additional functions (DM stats). It would be great to carve those =
out to fast path them and keep this one with the very core of your idea.

The DM stats is used in 'passage: Report the devicetree source'. I
know it is sideways but I think it is better to make the output line
more useful than just reporting the devicetree source.

The first patch is indeed unrelated. I will pick it up so we can drop
it for the next rev.

Regards,
Simon


>
> On Mon, 1 Nov 2021 at 02:17, Simon Glass <sjg@chromium.org> wrote:
>>
>>
>> This series adds a standard way of passing information between different
>> firmware phases. This already exists in U-Boot at a very basic level, in
>> the form of a bloblist containing an spl_handoff structure, but the inte=
nt
>> here is to define something useful across projects.
>>
>> The need for this is growing as firmware fragments into multiple binarie=
s
>> each with its own purpose. Without any run-time connection, we must rely
>> on build-time settings which are brittle and painful to keep in sync.
>>
>> This feature is named 'standard passage' since the name is more unique
>> than many others that could be chosen, it is a passage in the sense that
>> information is flowing from one place to another and it is standard,
>> because that is what we want to create.
>>
>> The implementation is simply a pointer to a bloblist in a register, with
>> an extra register to point to a devicetree, for more complex data, if on=
e
>> is present in the bloblist. This should cover all cases (small memory
>> footprint as well as complex data flow) and be easy enough to implement =
on
>> all architectures.
>>
>> The core bloblist code is relicensed to BSD-3-Clause in case it is usefu=
l
>> in non-GPL projects but there is no requirement to use the same code.
>>
>> This series includes tweaks to the bloblist implementation in U-Boot to
>> make it more suitable for the task, including:
>>
>>    - Allocate tags explicitly in the enum
>>    - Put the magic number first
>>    - Define a process for adding tags
>>
>> The emphasis is on enabling open communcation between binaries, not
>> enabling passage of secret, undocumented data, although this is possible
>> in a private environment.
>>
>> This series is built on the OF_BOARD series It is available at
>> u-boot-dm/pass-working or:
>>
>> https://source.denx.de/u-boot/custodians/u-boot-dm/-/commit/073b5c156f22=
2c69a98b8ebcaa563d1ff10eb217
>>
>>
>> Simon Glass (31):
>>   Makefile: Correct TPL rule for OF_REAL
>>   kconfig: Add support for conditional values
>>   dm: core: Allow getting some basic stats
>>   stddef: Avoid warning with clang with offsetof()
>>   fdt: Drop SPL_BUILD macro
>>   bloblist: Put the magic number first
>>   bloblist: Rename the SPL tag
>>   bloblist: Drop unused tags
>>   bloblist: Use explicit numbering for the tags
>>   bloblist: Support allocating the bloblist
>>   bloblist: Use LOG_CATEGORY to simply logging
>>   bloblist: Use 'phase' consistently for bloblists
>>   bloblist: Refactor Kconfig to support alloc or fixed
>>   arm: qemu: Add an SPL build
>>   bloblist: Add functions to obtain base address and size
>>   passage: Support an incoming passage
>>   passage: Support a control devicetree
>>   passage: arm: Accept a passage from the previous phase
>>   passage: spl: Support adding the dtb to the passage bloblist
>>   passage: spl: Support passing the passage to U-Boot
>>   passage: Record where the devicetree came from
>>   passage: Report the devicetree source
>>   passage: Add a qemu test for ARM
>>   bloblist: doc: Bring in the API documentation
>>   bloblist: Relicense to allow BSD-3-Clause
>>   sandbox: Add a way of checking structs for standard passage
>>   passage: Add documentation
>>   passage: Add docs for spl_handoff
>>   x86: Move Intel GNVS file into the common include directory
>>   passage: Add checks for pre-existing blobs
>>   WIP: RFC: Add a gitlab test
>>
>>  .gitlab-ci.yml                                |   6 +
>>  MAINTAINERS                                   |  10 +
>>  Makefile                                      |   2 +-
>>  arch/arm/cpu/armv7/start.S                    |   7 +-
>>  arch/arm/dts/qemu-arm-u-boot.dtsi             |  22 ++
>>  arch/arm/lib/crt0.S                           |   4 +
>>  arch/arm/mach-qemu/Kconfig                    |   9 +
>>  arch/sandbox/cpu/spl.c                        |   2 +-
>>  arch/x86/cpu/apollolake/acpi.c                |   2 +-
>>  arch/x86/cpu/broadwell/cpu_from_spl.c         |   4 +-
>>  arch/x86/cpu/intel_common/acpi.c              |   2 +-
>>  .../include/asm/arch-apollolake/global_nvs.h  |   2 +-
>>  arch/x86/lib/spl.c                            |   2 +-
>>  arch/x86/lib/tpl.c                            |   2 +-
>>  board/emulation/qemu-arm/Kconfig              |  23 +-
>>  board/emulation/qemu-arm/MAINTAINERS          |   1 +
>>  board/emulation/qemu-arm/Makefile             |   1 +
>>  board/emulation/qemu-arm/spl.c                |  27 ++
>>  board/google/chromebook_coral/coral.c         |   2 +-
>>  board/sandbox/Makefile                        |   3 +-
>>  board/sandbox/stdpass_check.c                 | 107 ++++++
>>  cmd/bdinfo.c                                  |   2 +
>>  common/Kconfig                                | 161 ++++++++-
>>  common/bloblist.c                             | 124 +++++--
>>  common/board_f.c                              |  48 ++-
>>  common/board_r.c                              |  18 +
>>  common/spl/spl.c                              |  74 +++-
>>  configs/qemu_arm_spl_defconfig                |  78 +++++
>>  doc/board/emulation/qemu-arm.rst              |  38 +++
>>  doc/develop/bloblist.rst                      |  28 +-
>>  doc/develop/index.rst                         |   1 +
>>  doc/develop/std_passage.rst                   | 319 ++++++++++++++++++
>>  drivers/core/device.c                         |  11 +
>>  drivers/core/root.c                           |   7 +
>>  drivers/core/uclass.c                         |  13 +
>>  drivers/serial/serial-uclass.c                |   3 +-
>>  dts/Kconfig                                   |  12 +
>>  include/asm-generic/global_data.h             |  35 ++
>>  include/bloblist.h                            | 175 +++++++---
>>  include/dm/device.h                           |  11 +-
>>  include/dm/root.h                             |   8 +
>>  include/dm/uclass-internal.h                  |   7 +
>>  include/fdtdec.h                              |  40 ++-
>>  include/handoff.h                             |   8 +-
>>  .../x86/include/asm =3D> include}/intel_gnvs.h  |   0
>>  include/linux/kconfig.h                       |  18 +
>>  include/linux/stddef.h                        |   8 +-
>>  include/spl.h                                 |  15 +
>>  include/stdpass/README                        |   4 +
>>  include/stdpass/tpm2_eventlog.h               |  42 +++
>>  include/stdpass/vboot_ctx.h                   | 267 +++++++++++++++
>>  lib/asm-offsets.c                             |   5 +
>>  lib/fdtdec.c                                  |  65 +++-
>>  scripts/config_whitelist.txt                  |   1 +
>>  test/bloblist.c                               |  21 +-
>>  test/dm/core.c                                |  41 +++
>>  test/py/tests/test_passage.py                 |  11 +
>>  57 files changed, 1798 insertions(+), 161 deletions(-)
>>  create mode 100644 arch/arm/dts/qemu-arm-u-boot.dtsi
>>  create mode 100644 board/emulation/qemu-arm/spl.c
>>  create mode 100644 board/sandbox/stdpass_check.c
>>  create mode 100644 configs/qemu_arm_spl_defconfig
>>  create mode 100644 doc/develop/std_passage.rst
>>  rename {arch/x86/include/asm =3D> include}/intel_gnvs.h (100%)
>>  create mode 100644 include/stdpass/README
>>  create mode 100644 include/stdpass/tpm2_eventlog.h
>>  create mode 100644 include/stdpass/vboot_ctx.h
>>  create mode 100644 test/py/tests/test_passage.py
>>
>> --
>> 2.33.1.1089.g2158813163f-goog
>>
>
>
> --
> Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development
> T: +33.67221.6485
> francois.ozog@linaro.org | Skype: ffozog
>

