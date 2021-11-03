Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9910E443AF8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 02:23:25 +0100 (CET)
Received: from localhost ([::1]:52040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi4zs-0006fQ-FG
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 21:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mi4xs-000549-Ni
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:21:20 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:39531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mi4xk-0005zi-6X
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:21:20 -0400
Received: by mail-ua1-x92b.google.com with SMTP id i6so1499859uae.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 18:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VmH+oZx71QcQf/pGIgx/w+WaXN3XiXDVaflwz8m1YTA=;
 b=c2cxaS6dcM+7rIAyFKVHxo7CUTDCFVysKhbUJ9N344AhFjgtZ1+S1ML3kV5GVvvhr9
 llxjAnwQ/RCAiocF1hsIeTSG8ZC5kbdmnVZtIObkbqgNxH+4y59L/O9lG5wAtV/xJQxz
 lCGhEjpr/bwAg7Av9FBk0vHVUcmUieyywdxa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VmH+oZx71QcQf/pGIgx/w+WaXN3XiXDVaflwz8m1YTA=;
 b=T8rRhjCS4c18+FkXRX/yVR3LxkrygVTJ/1KbjhDs+cIF3GrmoLQ4eBggtL94S6y18w
 84y7yd2jxKtkhBOl3O7xnofOqYIyCWpoRmpjh5FLLZXPKdrcRB6V7baVV+H/9/SkFxw0
 FY1Q78DXV3+3Uc6TtkcYnx2+PxtoZShqr2QBcf1M5pycG6VpPwZX9JnuGlrMK0wUdTu+
 hQisSNY0+K/JzeZ0EVO6yTAFnoO56JdNo/cBXYk7EkM4uoTP9NULKEYZKYVXjkt8SXIg
 /X3zG1nOByULMrp8P4m0ZHpYyW36mk1BxclTopD/ZPAVxmNCOBVLPve/fMpCVFVol3rJ
 VIdg==
X-Gm-Message-State: AOAM532Dcv4GYzCGwQRcMpuy2HtOtndQsGO1vekz1QXsM5YYriD6bWYD
 xOODS5oX8ieGYmz9WA6/TCAnu+8MgfyDsm+TkLdhzw==
X-Google-Smtp-Source: ABdhPJxq7eVZ07M019RQ6+QT3u4qoNcdhIX8d66IZXKG/khePqv2RglPXTRZEEZrPz4awwCx/z06Iyh4LKKEBS6Astk=
X-Received: by 2002:a05:6102:b01:: with SMTP id
 b1mr30354912vst.58.1635902459882; 
 Tue, 02 Nov 2021 18:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
 <CAHFG_=Vr6VkJy+d0MaPvVsoXYgvdB5xd2P5FuvF2w63bxSm4cw@mail.gmail.com>
 <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
 <CAHFG_=XTQd=jYN--+5wnqmAFRHavSbcRdK70zyrxw-dKty8kug@mail.gmail.com>
In-Reply-To: <CAHFG_=XTQd=jYN--+5wnqmAFRHavSbcRdK70zyrxw-dKty8kug@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 2 Nov 2021 19:20:48 -0600
Message-ID: <CAPnjgZ0S74v8Sr18gKkfsHAy7EF6rdDe_ASWm8zu=OqKN6N-kQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
To: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=sjg@google.com; helo=mail-ua1-x92b.google.com
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Tom Rini <trini@konsulko.com>,
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, Jerry Van Baren <vanbaren@cideas.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Andre Przywara <andre.przywara@arm.com>, Alexander Graf <agraf@csgraf.de>,
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Matthias Brugger <mbrugger@suse.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Fran=C3=A7ois,

On Wed, 27 Oct 2021 at 14:07, Fran=C3=A7ois Ozog <francois.ozog@linaro.org>=
 wrote:
>
> Hi Simon
>
> Le mer. 27 oct. 2021 =C3=A0 20:23, Simon Glass <sjg@chromium.org> a =C3=
=A9crit :
>>
>> Hi Fran=C3=A7ois,
>>
>> On Wed, 27 Oct 2021 at 09:14, Fran=C3=A7ois Ozog <francois.ozog@linaro.o=
rg> wrote:
>> >
>> >
>> >
>> > On Wed, 27 Oct 2021 at 16:08, Simon Glass <sjg@chromium.org> wrote:
>> >>
>> >> Hi Fran=C3=A7ois,
>> >>
>> >> On Tue, 26 Oct 2021 at 00:07, Fran=C3=A7ois Ozog <francois.ozog@linar=
o.org> wrote:
>> >> >
>> >> > Hi Simon
>> >> >
>> >> > Position unchanged on this series: adding fake dts for boards that =
generate their device tree in the dts directory is not good. If you have th=
em in documentation the it is acceptable.
>> >>
>> >> I think we are going to have to disagree on this one. I actually used
>> >> the qemu one in testing/development recently. We have to have a way t=
o
>> >> develop in-tree with U-Boot. It does not impinge on any of your use
>> >> cases, so far as I know.
>> >
>> > I am not the only one in disagreement... You just saw Alex B=C3=A9n=C3=
=A9e from Qemu saying the same thing.
>> > I understand the advanced debug/development scenario you mention.
>> > But locating the DT files in the dts directory is mis-leading the cont=
ributors to think that they need to compile the DT for the targeted platfor=
ms.
>> > For your advanced scenario, you can still have the dts in the document=
ation area, or whatever directory (except dts). compile it and supply to U-=
Boot.
>>
>> We have this situation with rpi 1, 2 and 3 and I don't believe anyone
>> has noticed. U-Boot handles the build automatically. If you turn off
>> OF_BOARD, it will use the U-Boot devicetree always so you know what is
>> going on.
>>
>> We can add a message to U-Boot indicating where the devicetree came
>> from, perhaps? That might be useful given everything that is going on.
>>
>> As in this case, quite often in these discussions I struggle to
>> understand what is behind the objection. Is it that your customers are
>> demanding that devicetrees become private, secret data, not included
>> in open-source projects? Or is it just the strange case of QEMU that
>> is informing your thinking? I know of at least one project where the
>> first-stage bootloader produces a devicetree and no one has the source
>> for it. I believe TF-A was created for licensing reasons...so can you
>> be a bit clearer about what the problem actually is?
>
> there are situations where U-Boot must have a dtb. Then those dTB sources=
 are logically found in the dts directory.
> There are situations where U-Boot should not have a dtb. In that case the=
re should be no element in the dts directory. Otherwise it creates confusio=
n.
> Now as you point out, we need =E2=80=9Cplaygrounds=E2=80=9D to deal with =
some situation. So having examples in an ad-hoc directory, different from d=
ts is fine. I proposed documentation but you may find a better place.
> In other words, dts shall host only dt source when U-Boot cannot do but m=
ake a dTB for a platform.
> As you have seen in different mail thread (firmware sustainability and OC=
P checklist) freedom is important to Linaro and there are no hidden Trojan =
horse for licensing.

I don't understand what you are getting at with the Trojan horse. But
you have no objection to requiring boards to supply a DT (whether in
documentation or arch/arm/dts) to be in U-Boot?

>
>
>> If a board is
>> in-tree in U-Boot I would like it to have a devicetree there, at least
>> until we have a better option. At the very least, it MUST be
>> discoverable and it must be possible to undertake U-Boot development
>> easily without a lot of messing around.
>
> You can if you keep two dts directories separate:
> dts for boards for which U-Boot must have one
> debug-dts for boards for which U-Boot get the DT at runtime but for which=
 you want a playground for debug/easier development.
>>
>>
>> >>
>> >>
>> >> But trying to do any driver / core work for a board where you don't
>> >> have the devicetree is currently not possible. The devicetree is a
>> >> core component and being unable to modify it is simply not practical.
>> >> We are talking here about an option that can be enabled or disabled.
>> >> In my case I am able to disable it locally and do my development work=
.
>> >>
>> >>
>> >> BTW I've got the bloblist handoff working with a devicetree inside it=
,
>> >> for qemu_arm. I need to try it on a real board to figure out what the
>> >> difference is.
>> >>
>> > That's great news and much needed for stabilizing the inbound ABI from=
 prior loader to U-Boot. Let's create another thread to discuss this import=
ant topic.
>> >>
>>
>> My scenario is not all that advanced and I am using qemu_arm to test
>> the bloblist handoff stuff and include it in CI, with a suitable
>> devicetree and a binman node.
>>
>> Regards,
>> Simon
>>
>> >> >
>> >> > Cheers
>> >> >
>> >> > FF
>> >> >
>> >> > Le mar. 26 oct. 2021 =C3=A0 02:24, Simon Glass <sjg@chromium.org> a=
 =C3=A9crit :
>> >> >>
>> >> >> With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE=
 so
>> >> >> there are only three ways to obtain a devicetree:
>> >> >>
>> >> >>    - OF_SEPARATE - the normal way, where the devicetree is built a=
nd
>> >> >>       appended to U-Boot
>> >> >>    - OF_EMBED - for development purposes, the devicetree is embedd=
ed in
>> >> >>       the ELF file (also used for EFI)
>> >> >>    - OF_BOARD - the board figures it out on its own
>> >> >>
>> >> >> The last one is currently set up so that no devicetree is needed a=
t all
>> >> >> in the U-Boot tree. Most boards do provide one, but some don't. So=
me
>> >> >> don't even provide instructions on how to boot on the board.
>> >> >>
>> >> >> The problems with this approach are documented in another patch in=
 this
>> >> >> series: "doc: Add documentation about devicetree usage"
>> >> >>
>> >> >> In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any=
 board
>> >> >> can obtain its devicetree at runtime, even it is has a devicetree =
built
>> >> >> in U-Boot. This is because U-Boot may be a second-stage bootloader=
 and its
>> >> >> caller may have a better idea about the hardware available in the =
machine.
>> >> >> This is the case with a few QEMU boards, for example.
>> >> >>
>> >> >> So it makes no sense to have OF_BOARD as a 'choice'. It should be =
an
>> >> >> option, available with either OF_SEPARATE or OF_EMBED.
>> >> >>
>> >> >> This series makes this change, adding various missing devicetree f=
iles
>> >> >> (and placeholders) to make the build work.
>> >> >>
>> >> >> Note: If board maintainers are able to add their own patch to add =
the
>> >> >> files, some patches in this series can be dropped.
>> >> >>
>> >> >> It also provides a few qemu clean-ups discovered along the way.
>> >> >>
>> >> >> Note: This breaks the qemu-riscv64_spl test, which still needs
>> >> >> investigation.
>> >> >>
>> >> >> [1] https://patchwork.ozlabs.org/project/uboot/patch/2021091921511=
1.3830278-3-sjg@chromium.org/
>> >> >>
>> >> >> Changes in v5:
>> >> >> - Bring into the OF_BOARD series
>> >> >> - Rebase to master and drop mention of OF_PRIOR_STAGE, since remov=
ed
>> >> >> - Refer to the 'control' DTB in the first paragraph
>> >> >> - Use QEMU instead of qemu
>> >> >> - Merge RISC-V and ARM patches since they are similar
>> >> >> - Add new patches to clean up fdtdec_setup() and surrounds
>> >> >>
>> >> >> Changes in v3:
>> >> >> - Clarify the 'bug' refered to at the top
>> >> >> - Reword 'This means that there' paragraph to explain U-Boot-speci=
fic things
>> >> >> - Move to doc/develop/devicetree now that OF_CONTROL is in the doc=
s
>> >> >>
>> >> >> Changes in v2:
>> >> >> - Fix typos per Sean (thank you!) and a few others
>> >> >> - Add a 'Use of U-Boot /config node' section
>> >> >> - Drop mention of dm-verity since that actually uses the kernel cm=
dline
>> >> >> - Explain that OF_BOARD will still work after these changes (in
>> >> >>   'Once this bug is fixed...' paragraph)
>> >> >> - Expand a bit on the reason why the 'Current situation' is bad
>> >> >> - Clarify in a second place that Linux and U-Boot use the same dev=
icetree
>> >> >>   in 'To be clear, while U-Boot...'
>> >> >> - Expand on why we should have rules for other projects in
>> >> >>   'Devicetree in another project'
>> >> >> - Add a comment as to why devicetree in U-Boot is not 'bad design'
>> >> >> - Reword 'in-tree U-Boot devicetree' to 'devicetree source in U-Bo=
ot'
>> >> >> - Rewrite 'Devicetree generated on-the-fly in another project' to =
cover
>> >> >>   points raised on v1
>> >> >> - Add 'Why does U-Boot have its nodes and properties?'
>> >> >> - Add 'Why not have two devicetrees?'
>> >> >>
>> >> >> Ilias Apalodimas (1):
>> >> >>   sandbox: Remove OF_HOSTFILE
>> >> >>
>> >> >> Simon Glass (25):
>> >> >>   doc: Add documentation about devicetree usage
>> >> >>   arm: qemu: Mention -nographic in the docs
>> >> >>   arm: riscv: qemu: Explain how to extract the generated dt
>> >> >>   arm: qemu: Add a devicetree file for qemu_arm
>> >> >>   arm: qemu: Add a devicetree file for qemu_arm64
>> >> >>   riscv: qemu: Add devicetree files for qemu_riscv32/64
>> >> >>   arm: rpi: Add a devicetree file for rpi_4
>> >> >>   arm: vexpress: Add a devicetree file for juno
>> >> >>   arm: xenguest_arm64: Add a fake devicetree file
>> >> >>   arm: octeontx: Add a fake devicetree file
>> >> >>   arm: xilinx_versal_virt: Add a devicetree file
>> >> >>   arm: bcm7xxx: Add a devicetree file
>> >> >>   arm: qemu-ppce500: Add a devicetree file
>> >> >>   arm: highbank: Add a fake devicetree file
>> >> >>   fdt: Make OF_BOARD a bool option
>> >> >>   Drop CONFIG_BINMAN_STANDALONE_FDT
>> >> >>   doc: Update info on devicetree update
>> >> >>   fdt: Move MULTI_DTB_FIT handling out of fdtdec_setup()
>> >> >>   fdt: Drop #ifdefs with MULTI_DTB_FIT
>> >> >>   fdt: Drop CONFIG_SPL_BUILD check in fdtdec_setup()
>> >> >>   fdt: Drop #ifdef around board_fdt_blob_setup()
>> >> >>   fdt: Use if() for fdtcontroladdr check
>> >> >>   fdt: Drop OF_CONTROL check in fdtdec_setup()
>> >> >>   fdt: Drop remaining preprocessor macros in fdtdec_setup()
>> >> >>   fdt: Don't call board_fdt_blob_setup() without OF_BOARD
>> >> >>
>> >> >>  Makefile                                  |    7 +-
>> >> >>  arch/arm/dts/Makefile                     |   20 +-
>> >> >>  arch/arm/dts/bcm2711-rpi-4-b.dts          | 1958 ++++++++++++++++=
+++++
>> >> >>  arch/arm/dts/bcm7xxx.dts                  |   15 +
>> >> >>  arch/arm/dts/highbank.dts                 |   14 +
>> >> >>  arch/arm/dts/juno-r2.dts                  | 1038 +++++++++++
>> >> >>  arch/arm/dts/octeontx.dts                 |   14 +
>> >> >>  arch/arm/dts/qemu-arm.dts                 |  402 +++++
>> >> >>  arch/arm/dts/qemu-arm64.dts               |  381 ++++
>> >> >>  arch/arm/dts/xenguest-arm64.dts           |   15 +
>> >> >>  arch/arm/dts/xilinx-versal-virt.dts       |  307 ++++
>> >> >>  arch/powerpc/dts/Makefile                 |    1 +
>> >> >>  arch/powerpc/dts/qemu-ppce500.dts         |  264 +++
>> >> >>  arch/riscv/dts/Makefile                   |    2 +-
>> >> >>  arch/riscv/dts/qemu-virt.dts              |    8 -
>> >> >>  arch/riscv/dts/qemu-virt32.dts            |  217 +++
>> >> >>  arch/riscv/dts/qemu-virt64.dts            |  217 +++
>> >> >>  arch/sandbox/cpu/cpu.c                    |   21 +-
>> >> >>  arch/sandbox/include/asm/u-boot-sandbox.h |    8 -
>> >> >>  configs/bcm7260_defconfig                 |    1 +
>> >> >>  configs/bcm7445_defconfig                 |    1 +
>> >> >>  configs/highbank_defconfig                |    2 +-
>> >> >>  configs/octeontx2_95xx_defconfig          |    1 +
>> >> >>  configs/octeontx2_96xx_defconfig          |    1 +
>> >> >>  configs/octeontx_81xx_defconfig           |    1 +
>> >> >>  configs/octeontx_83xx_defconfig           |    1 +
>> >> >>  configs/qemu-ppce500_defconfig            |    2 +
>> >> >>  configs/qemu-riscv32_defconfig            |    1 +
>> >> >>  configs/qemu-riscv32_smode_defconfig      |    1 +
>> >> >>  configs/qemu-riscv32_spl_defconfig        |    4 +-
>> >> >>  configs/qemu-riscv64_defconfig            |    1 +
>> >> >>  configs/qemu-riscv64_smode_defconfig      |    1 +
>> >> >>  configs/qemu-riscv64_spl_defconfig        |    3 +-
>> >> >>  configs/qemu_arm64_defconfig              |    1 +
>> >> >>  configs/qemu_arm_defconfig                |    1 +
>> >> >>  configs/rpi_4_32b_defconfig               |    1 +
>> >> >>  configs/rpi_4_defconfig                   |    1 +
>> >> >>  configs/rpi_arm64_defconfig               |    1 +
>> >> >>  configs/sandbox64_defconfig               |    2 +-
>> >> >>  configs/sandbox_defconfig                 |    2 +-
>> >> >>  configs/sandbox_flattree_defconfig        |    2 +-
>> >> >>  configs/sandbox_noinst_defconfig          |    2 +-
>> >> >>  configs/sandbox_spl_defconfig             |    2 +-
>> >> >>  configs/tools-only_defconfig              |    2 +-
>> >> >>  configs/vexpress_aemv8a_juno_defconfig    |    1 +
>> >> >>  configs/xenguest_arm64_defconfig          |    1 +
>> >> >>  configs/xilinx_versal_virt_defconfig      |    1 +
>> >> >>  doc/board/emulation/qemu-arm.rst          |   10 +-
>> >> >>  doc/board/emulation/qemu-riscv.rst        |    3 +
>> >> >>  doc/develop/devicetree/control.rst        |    7 +-
>> >> >>  doc/develop/devicetree/dt_qemu.rst        |   48 +
>> >> >>  doc/develop/devicetree/dt_update.rst      |  498 ++++++
>> >> >>  doc/develop/devicetree/index.rst          |    2 +
>> >> >>  dts/Kconfig                               |   37 +-
>> >> >>  include/asm-generic/global_data.h         |    8 +
>> >> >>  include/fdtdec.h                          |   21 +-
>> >> >>  lib/fdtdec.c                              |  116 +-
>> >> >>  scripts/Makefile.spl                      |    4 +-
>> >> >>  tools/binman/binman.rst                   |   20 -
>> >> >>  59 files changed, 5560 insertions(+), 164 deletions(-)
>> >> >>  create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts
>> >> >>  create mode 100644 arch/arm/dts/bcm7xxx.dts
>> >> >>  create mode 100644 arch/arm/dts/highbank.dts
>> >> >>  create mode 100644 arch/arm/dts/juno-r2.dts
>> >> >>  create mode 100644 arch/arm/dts/octeontx.dts
>> >> >>  create mode 100644 arch/arm/dts/qemu-arm.dts
>> >> >>  create mode 100644 arch/arm/dts/qemu-arm64.dts
>> >> >>  create mode 100644 arch/arm/dts/xenguest-arm64.dts
>> >> >>  create mode 100644 arch/arm/dts/xilinx-versal-virt.dts
>> >> >>  create mode 100644 arch/powerpc/dts/qemu-ppce500.dts
>> >> >>  delete mode 100644 arch/riscv/dts/qemu-virt.dts
>> >> >>  create mode 100644 arch/riscv/dts/qemu-virt32.dts
>> >> >>  create mode 100644 arch/riscv/dts/qemu-virt64.dts
>> >> >>  create mode 100644 doc/develop/devicetree/dt_qemu.rst
>> >> >>  create mode 100644 doc/develop/devicetree/dt_update.rst
>> >> >>
>> >> >> --
>> >> >> 2.33.0.1079.g6e70778dc9-goog
>> >> >>
>> >> > --
>> >> > Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Developme=
nt
>> >> > T: +33.67221.6485
>> >> > francois.ozog@linaro.org | Skype: ffozog
>> >> >
>> >
>> >
>> >
>> > --
>> > Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development
>> > T: +33.67221.6485
>> > francois.ozog@linaro.org | Skype: ffozog
>> >
>
> --
> Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development
> T: +33.67221.6485
> francois.ozog@linaro.org | Skype: ffozog
>

