Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAF268E03D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:40:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPSsF-0003mo-B8; Tue, 07 Feb 2023 13:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1pPSsD-0003la-Dw
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:39:21 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1pPSsB-0007nv-8L
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:39:21 -0500
Received: by mail-ed1-x532.google.com with SMTP id r3so7562341edq.13
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 10:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fax4aN08i6kSsZVPwRJazT1HzLAtFm2+q0cy8FAyIzc=;
 b=C1lJL3nhNVtk0w5Kl5F/pL+alLk344tErc25Y5fsNRuUt9T93Lhg0l4vVlhFRGJxb5
 rHauev0zg+dxMVOmZaNGeDI+iJyx56BK9KwtlsvMzeji5sHTIjY5d1Gx86VUMwrdaKrR
 vDPSHnMpTducuFwnII7+e1IA7PCS6CwtEKCrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fax4aN08i6kSsZVPwRJazT1HzLAtFm2+q0cy8FAyIzc=;
 b=r9t/yjoL62oSRKGMmSvlyDoeGAvtoxJ5Rm4CZhT2HhLzGSELAFFbksLuoYmW/BPQD9
 pZLFlMUde62qUJwyu2m7yfMtTRhuPky9eronIavLatXX4QzV265SOP+bSlrrdDbJ6tsd
 wM17JB1VIYXobjO8jvd4UAHApcFsTW3Uwzu0UmL8ICDenc3Wa8Y0vvZW7Q08NEn/QFzg
 cyxJjqrN/aI5OnrXk6jc/lAtDvPMqqKD+fksdPj7A4L5WK3Q6kg251fwEDqsEjCfUzFA
 T8m140aVpiaIEdHVNaPopqmD2cCK4v+MSdSaikCFUGQwkCyTECPZoEXYSFV7El6f5yB9
 NyRA==
X-Gm-Message-State: AO0yUKUug4teVrIKInTkuO7Rs56wrmeoO9OUNyMhXj1InQkFSZQhUIdf
 ks6IU5L58Xq3aAnynXjlec51prXLXiMZvaQOOAoTkA==
X-Google-Smtp-Source: AK7set9Mg2j6Jdbfglm1MMBAWowdbQi/Ke+Gnn0ffkDfxZeFNh5WXcjA83QqjOv3ggHn8GHg4pbz7SwcC3V5L2EaSvA=
X-Received: by 2002:a50:950b:0:b0:4a1:c6e2:b6c2 with SMTP id
 u11-20020a50950b000000b004a1c6e2b6c2mr1145530eda.33.1675795155920; Tue, 07
 Feb 2023 10:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
 <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
 <87ilx9jw7t.fsf@linaro.org>
 <CAHFG_=VYK3=bCfiFW9aYZRMbHApPzg3+Zj4NDbArmjs0uzFvvQ@mail.gmail.com>
 <CAHFG_=W8HbZ9DSSBQiVORUsMF2NxNdzNMXtKX=FyYsd+5RnRxA@mail.gmail.com>
In-Reply-To: <CAHFG_=W8HbZ9DSSBQiVORUsMF2NxNdzNMXtKX=FyYsd+5RnRxA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 7 Feb 2023 11:39:04 -0700
Message-ID: <CAPnjgZ38V1bu0k_6hAUUS6y6Xev07ssXwnDnf2ULBjKgfV=3iQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=sjg@google.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On Fri, 5 Nov 2021 at 09:51, Fran=C3=A7ois Ozog <francois.ozog@linaro.org> =
wrote:
>
> Hi,
>
> On Wed, 3 Nov 2021 at 14:17, Fran=C3=A7ois Ozog <francois.ozog@linaro.org=
> wrote:
>>
>> Hi,
>>
>> Thanks Alex to patch me in.
>>
>> I'd like to present another perspective on the motivation as I can't rea=
lly comment on the actual "how".
>>
>> On real Arm boards, firmware is often assembled into a FIP.
>> That FIP can contain quite a good deal of things, including an NT_FW_CON=
FIG, NonTrusted_FirmWare_CONFIGuration (NT_FW =3D BL33 which is U-Boot in o=
ur case).
>> So the expected typical content for that section is a DT fragment/overla=
y.
>> That section is to be used in different ways but one is https://trustedf=
irmware-a.readthedocs.io/en/latest/components/fconf/index.html.
>> For SystemReady systems we will almost inevitably put a device tree frag=
ment in this section and have BL2 merge it with the board DT before handing=
 it over to BL33 (U-Boot is one of them).
>> In some real world examples based on carrier board + som for instance, i=
t may contain SerDes configuration for U-Boot that will result in appropria=
te PCI lanes or MDIO lanes for the booted OS.
>>
>> So I could say there is precedence in Simon's effort.
>>
>> In any case, when we will have made the changes in TFA for the SystemRea=
dy boards we work on, booting the full SystemReady stack (TFA, OP-TEE, U-Bo=
ot) on Qemu will allow that late merge based through the FIP.
>>
>> Other boot flows such as VBE (without TFA but with TPL/SPL/U-Boot proper=
) need a similar facility.
>>
>>
>> Hence I am supporting Simon's proposal at least on the intent. On the ho=
w exactly, that is outside my skillset.
>
> Responding to my own comment:
> As the boot flow TFA+U-Boot works, it looks like a cleaner option is to l=
eave QEMU alone and have
> U-Boot SPL do the same work as with TFA: use a section for the FIT for th=
e DT to be merged.
>
>
>>
>>
>> future comments below
>>
>>
>> On Wed, 3 Nov 2021 at 12:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>>
>>>
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>> > On Mon, 27 Sept 2021 at 16:18, Simon Glass <sjg@chromium.org> wrote:
>>> >> On Mon, 27 Sept 2021 at 02:48, Peter Maydell <peter.maydell@linaro.o=
rg> wrote:
>>> >> > So what is missing in the QEMU-provided DTB that it needs?
>>> >>
>>> >> Quite a lot. Here are some examples:
>>> >>
>>> >> U-Boot has limited pre-relocation memory so tries to avoid
>>> >> binding/probing devices that are not used before relocation:
>>> >>
>>> >> https://u-boot.readthedocs.io/en/latest/develop/driver-model/design.=
html#pre-relocation-support
>>> >
>>> > It's up to u-boot to decide what it wants to touch and
>>> > what it does not. QEMU tells u-boot what all the available
>>> > devices are; I don't think we should have extra stuff saying
>>> > "and if you are u-boot, do something odd".
>>> >
>>> >> There is a configuration node (which is likely to change form in
>>> >> future releases, but will still be there)
>>> >>
>>> >> https://github.com/u-boot/u-boot/blob/master/doc/device-tree-binding=
s/config.txt
>>> >
>>> > I think u-boot should be storing this kind of thing somewhere
>>> > else (e.g. as part of the binary blob that is u-boot itself,
>>> > or stored in flash or RAM as a separate blob).
>>> >
>>> >> Then there are various features which put things in U-Boot's control
>>> >> dtb, such as verified boot, which adds public keys during signing:
>>> >>
>>> >> https://github.com/u-boot/u-boot/blob/master/doc/uImage.FIT/signatur=
e.txt#L135
>>> >>
>>> >> More generally, the U-Boot tree has hundreds of files which add
>>> >> properties for each board, since we try to keep the U-Boot-specific
>>> >> things out of the Linux tree:
>>> >>
>>> >> $ find . -name *u-boot.dtsi |wc -l
>>> >> 398
>>> >
>>> > If any of this is actual information about the hardware then you
>>> > should sort out getting the bindings documented officially
>>> > (which I think is still in the Linux tree), and then QEMU can
>>> > provide them.
>>> >
>>> >> Quite a bit of this is to do with SPL and so far it seems that QEMU
>>> >> mostly runs U-Boot proper only, although I see that SPL is starting =
to
>>> >> creep in too in the U-Boot CI.
>>> >>
>>> >> So at present QEMU is not able to support U-Boot fully.
>>> >
>>> > My take is that this is u-boot doing weird custom things with
>>> > the DTB that aren't "describe the hardware". You should be able
>>> > to boot u-boot by putting those custom DTB extra things in a
>>> > separate blob and having u-boot combine that with the
>>> > actual DTB when it starts.
>>>
>>> It's not entirely without precedent - for SPL (which I hope is secondar=
y
>>> program loading) we have things like the guest loader which expands the
>>> plain HW DTB with some information needed by the bootloader and the
>>> primary OS to load additional blobs which have been put into memory.
>>>
>>> In effect the DTB is being expanded as a signalling mechanism similar t=
o
>>> things like fw_cfg and other things we use to control boot up. Whether
>>> this affects the "purity" of DTB as a "just the HW" description is
>>> probably a philosophical question.
>>>
>> More than a philosophical question: a key aspect of supply chain that ne=
ed change from
>> quite inflexible and tightly coupled to loosely coupled.
>>  A key aspect of it is to maintain "pure" hardware description DTBs at r=
est.
>> Composition of DTBs at build time (for products) or runtime (for develop=
ment boards) should be a simple thing.
>> Another aspect to take into account is System Device Trees. U-Boot only =
deal with Cortex-As on a platform,
>> so there are multiple device trees for each compute domain. Communities =
are working on System Device Tree
>> to define the overall platform with its power and clock domains. A tool =
"lopper" is being developed to slide the SDT into diverse domain DTs.
>> One of them being included into the FIP as the basis for the computing e=
lement (Carrier, SoM...).
>> Those attempts to cleanup passed DTBs from configuration data (drivers, =
bootloaders...) is not incompatible
>> with merging fragments at runtime (for dev boards) or build time (for pr=
oducts).
>>>
>>> I agree with Peter that just allowing the merging of arbitrary data int=
o
>>> the QEMU generated DTB is going to lead to confusion and breakages.
>>> Indeed I wrote the guest-loader because instructions for booting Xen up
>>> until that point involved dumpdtb and hand hacking the data which was
>>> silly because this is stuff QEMU already knew about.
>>>
>>> >
>>> > -- PMM
>>>
>>>
>>> --
>>> Alex Benn=C3=A9e
>>
>>
>>
>> --
>> Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development
>> T: +33.67221.6485
>> francois.ozog@linaro.org | Skype: ffozog
>>
>
>
> --
> Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development
> T: +33.67221.6485
> francois.ozog@linaro.org | Skype: ffozog
>

I am pinging this thread again as it has come up on the U-Boot mailing list=
[1].

Please can you reconsider this patch. It would greatly help the
collaboration between QEMU and U-Boot.

Regards,
Simon

[1] https://lore.kernel.org/u-boot/CAFEAcA-TH96CG1gi4toAQXpnxs4kxsPCSSfZrXb=
o2QF8CoE=3DXA@mail.gmail.com/T/#m1b41b54e3ca5dda1fcb8fdd189ac472ec7e4a96d

