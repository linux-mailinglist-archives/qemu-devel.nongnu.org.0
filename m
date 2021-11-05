Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D471F445DC6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 03:03:57 +0100 (CET)
Received: from localhost ([::1]:32878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mioaC-00039p-5K
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 22:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mioZF-0002V8-SF
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 22:02:58 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:45758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mioZD-0004OX-E1
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 22:02:57 -0400
Received: by mail-oi1-x22b.google.com with SMTP id u2so12287445oiu.12
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 19:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=35Rjm6rCtIaRi2ACeH9zfvAVfNS7G0d6E9ym7Mlx8bY=;
 b=Df1kMZHTmOEusSMGpEA97MQQsLsQcjFqmfSelyP0udXuOUUdsur1f4kOnADgtJmwQ3
 3grzi6ZRVPjl7XJNiglRYD3GG3EmZwMgqA44INvxTqlRU3pRneAwHNHKMArUelQ0ASCd
 jgX/wu4RxJQpZL2Jle+1tK7P0Lvqdr9KgLhq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=35Rjm6rCtIaRi2ACeH9zfvAVfNS7G0d6E9ym7Mlx8bY=;
 b=l24NNsVKcPsfehRphC5+gOm4TmYIkQj2g17qyX/iJWzM3rzggwY5FR0ge0XqhOPHwJ
 YVGcRGx4EhiDjrwX1INsw+LCtUX7qywAgc2/rKe4rKDiM0nEmTEdZwH/77gNX1RbtgBt
 zigfvUYLj8TG7BxOZJYomyFIPtFB33v34qpsLpz25YZVk7jNTocZeo2yMSxnG01lquat
 PcCm1f5nVpmrX4G8sDC+A2Yi4P3GWE6SIedehtiL/5ojqC8AIKIQDGbGPfuO9WYUvOcm
 tkx1+Te9VxdeZOoE3RHaFCtDZq/D3Ve1cRKL5VggIkT6GLX0+dLO+JgmA1Z4ZkTefzYY
 Xbhg==
X-Gm-Message-State: AOAM532/c8bQgMeED+DEpwH5Iqtkg9qikzo0urLPGGs5KdOlmTmcGJZ7
 +SqFZ/CVePjjgm99E6qWixRlSjXEYrxQh8jtjQwAbw==
X-Google-Smtp-Source: ABdhPJxeIRXXtOzzYbXJO1PkGaQ2X2asij17dUfzerdujbVCORPhdBqe0hvMJcfX6oSTNv0MvXmML7wMeOPN8dcWa2w=
X-Received: by 2002:a05:6808:f0c:: with SMTP id
 m12mr19406623oiw.150.1636077772439; 
 Thu, 04 Nov 2021 19:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211101011734.1614781-1-sjg@chromium.org>
 <CAHFG_=X1DeBFkzwFBkirMkmHB0_OSa9OkQj+CvpG6dT5HZEWBA@mail.gmail.com>
 <CAPnjgZ1we6-nJ1RXz3TK67c7Pj9Znh++rBy-SYtECZURt8bLWw@mail.gmail.com>
 <CAHFG_=V6QEsD63LgBDpJUZkd9rrJ0hoo7aYd7MQ_z2YS6k9UhQ@mail.gmail.com>
In-Reply-To: <CAHFG_=V6QEsD63LgBDpJUZkd9rrJ0hoo7aYd7MQ_z2YS6k9UhQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 4 Nov 2021 20:02:02 -0600
Message-ID: <CAPnjgZ0pbLLjvmD37aSYqjQ28kLgrU0Pox+hQLTH15+wcX+5ow@mail.gmail.com>
Subject: Re: [PATCH 00/31] passage: Define a standard for firmware data flow
To: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=sjg@google.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
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

On Tue, 2 Nov 2021 at 10:03, Fran=C3=A7ois Ozog <francois.ozog@linaro.org> =
wrote:
>
> Hi Simon,
>
> On Tue, 2 Nov 2021 at 15:59, Simon Glass <sjg@chromium.org> wrote:
>>
>> Hi Fran=C3=A7ois,
>>
>> On Mon, 1 Nov 2021 at 02:53, Fran=C3=A7ois Ozog <francois.ozog@linaro.or=
g> wrote:
>> >
>> > Hi Simon,
>> >
>> > this seems a great endeavor. I'd like to better understand the scope o=
f it.
>> >
>> > Is it to be used as part of what could become a U-Boot entry ABI schem=
e? By that I mean giving some fixed aspects
>> > to U-Boot entry while letting boards to have flexibility (say for inst=
ance that the first 5 architecture ABI
>> > parameter registers are reserved for U-Boot), and the Passage is about=
 specifying either those reserved registers
>> > or one of them?
>>
>> The goal is to provide a standard entry scheme for all firmware
>> binaries. Whether it achieves that (or can with some mods) is up for
>> discussion.
>>
> If you say
> a) define a U-Boot entry ABI and providing a firmware-to-firmware informa=
tion passing facility which would be part of all firmware ABIs (as the proj=
ects decide to define their own ABI) it looks good.
> but If you say

It is an ABI to be adopted by U-Boot but also other firmware. For
example, if TF-A calls U-Boot it should use standard passage. If
U-Boot calls TF-A or Optee it should use standard passage.

> b) define a standard entry scheme (register map, processor state, MMU sta=
te, SMMU state, GIC state...) that does not look realistic.

No I don't mean that. This data structure could be used in any state,
so long as the two registers are set correctly.

> I think you mean a) but just want to be sure.

Yes I think so.

>>
>> Re the registers, do you think we need 5?
>>

I don't :-)

>> >
>> > Thinking entry ABI, here is what I observed on Arm:
>> >
>> > Linux has two entry ABIs:
>> > - plain: x0 =3D dtb;
>> >           command line =3D dtb:/chosen/bootargs; initrd =3D dtb:/chose=
n/linux,initrd-*
>> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;
>> >            dtb =3D EFI_UUID config table; initrd =3D efi:<loadfile2(IN=
ITRD vendor media UUID); command line =3D efi: image_protocol::load_options
>> >
>> > U-Boot (proper) has plenty of schemes:
>> > - dtb is passed as either x0, x1, fixed memory area (Qemu which is bad=
 in itself), or other registers
>> > - additional information passing: board specific register scheme, SMC =
calls
>> > - U-Boot for RPI boards implement a Linux shaped entry ABI to be launc=
hed by Videocore firmware
>> >
>> > Based on all the above, I would tend to think that RPI scheme is a goo=
d idea but also
>> > shall not prevent additional schemes for the boards.
>>
>> I was not actually considering Linux since I believe/assume its entry
>> scheme is fixed and not up for discussion.
>>
>> I also did not think about the EFI case. As I understand it we cannot
>> touch it as it is used by UEFI today. Maybe it is even in the
>> standard?
>
> It is in the spec and we are making it evolve, or its understanding evolv=
e (jurisprudence) for instance on initrd standard handling.

Well perhaps we could merge it with standard passage. But EFI is not
going to want to use a bloblist, it will want to use a HOB.

>>
>>
>> Really I am hoping we can start afresh...?
>>
>> >
>> > What about a U-Boot Arm entry ABI like:
>> > - plain: x0=3Ddtb, x1=3D<Passage defined>, x2-x5 =3D <reserved>, other=
 registers are per platform, SMC calls allowed too
>>
>> Hmm we don't actually need the dtb as it is available in the bloblist.
>
> If you don't have x0=3Ddtb, then you will not be able to use U-Boot on RP=
I4.
> Unless you want to redo everything the RPI firmware is doing.

That's right, RPI cannot support standard passage. It is not
open-source firmware so it isn't really relevant to this discussion.
It will just do what it does and have limited functionality, with
work-arounds to deal with the pain, as one might expect.

>>
>> But I added an offset to it as a convenience.
>>
>> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;  (when U-B=
oot is launched as an EFI app)
>> >        dtb =3D EFI_UUID config table, + Passage =3D Passage UUID confi=
g table
>>
>> I don't understand the last line. Where is the passage info /
>> bloblist? Do you mean it goes in the HOB list with a UUID? I suppose
>> that is the most EFI-compatible way.
>
> The Passage config table  could just contain the "head" of the bloblist/P=
assage information.

If UEFI wants to deal with standard passage, that is...

>>
>>
>> What do you think about the idea of using an offset into the bloblist
>> for the dtb?
>
> It is possible but as I said, failing to mimic Linux entry ABI would miss=
 the opportunity to just boot without changes on RPI4.

See above. Broadcom could look at open-sourcing their bootloader if they wi=
sh.

>>
>> Also, can we make the standard passage ABI a build-time
>> option, so it is deterministic?
>>
> Looks good. I would look into stating that for SystemReady we would advis=
e to use that option and make it standard for Trusted Substrate (Linaro rec=
ipes that we upstreaming to make SystemReady compliance easy and consistent=
 across platforms).

OK. I mean that if the option is enabled, then standard passage must
be provided / emitted or things won't work. If the option is disabled,
then standard passage is not used. In other words, we are looking for
magic values in registers, etc, just enabling/disabling it at
build-time.

>>
>> >
>> > We could further leverage Passage to pass Operating Systems parameters=
 that could be removed from device tree (migration of /chosen to Passage). =
Memory inventory would still be in DT but allocations for CMA or GPUs would=
 be in Passage. This idea is to reach a point where  device tree is a "pris=
tine" hardware description.
>>
>> I'm worried about this becoming a substitute for devicetree. Really my
>> intent is to provide a way to pass simple info, whereas what you talk
>> about there seems like something that should be DT, just that it might
>> need suitable bindings.
>>
> I see your point and I agree It should not be a substitute.
> here is an expanded version of what I had in mind when I wrote those line=
s.
> cma, initrd and other Linux kernel parameters can be conveyed either thro=
ugh command line or DT.
> When using the non UEFI Linux entry ABI, you need to use the DT to pass t=
hose parameters.
> When using the UEFI Linux entry ABI, you *can* (not must) use the command=
 line to pass all information, leaving the DT passed to the OS without any =
/chosen.
> When introducing Passage, I was wondering if we could pass command line t=
o Linux and, same as UEFI, leave the DT free from /chosen.
> I am not sure it is a good goal though. I may be too pushing for a DT fre=
e from parameters.

We could. Are there benefits to that?

I doubt we would pass the standard passage to Linux as a bloblist. I
imagine something like this. The bloblist sits in memory with some
things in it, including a devicetree, perhaps an SMBIOS table and a
TPM log. But when U-Boot calls Linux it puts the address/size of those
individual things in the devicetree. They don't move and are still
contiguous in memory, but the bloblist around them is forgotten. Linux
doesn't know that the three separate things it is picking up are
actually part of a bloblist structure, since it doesn't care about
that. Even a console log could work the same way. That way we don't
end up trying to teach Linux about bloblist when it already has a
perfectly good means to accept these items.

For ACPI I see things a similar way. The ACPI tables can point to
things that *happen* to be in a bloblist, but without any knowledge of
that needed in Linux, grub, etc.

>>
>> As you know I have more expansive views about what should be in DT.
>
> I think both of us are huge supporters of DT format and self describing c=
apabilities.
> I am inclined to put rules into what fits into what lands in the DT that =
is passed to the OS.
> I am a fan of having DT used more in ad-hoc files.

Me too.

>>
>> >
>> > Cheers
>> >
>> > PS: as Ilias mentions, this patch set contains bug fixes, non immediat=
ely related additional functions (DM stats). It would be great to carve tho=
se out to fast path them and keep this one with the very core of your idea.
>>
>> The DM stats is used in 'passage: Report the devicetree source'. I
>> know it is sideways but I think it is better to make the output line
>> more useful than just reporting the devicetree source.
>>
> I believe the DM stats has merits in its own. You could upstream this ind=
ependently and then Passage would be yet another "customer" of the feature.

I could, but it would just be a debug feature so people might not
think it worth the code space. With the devicetree source it is more
compelling.

>>
>> The first patch is indeed unrelated. I will pick it up so we can drop
>> it for the next rev.
>>
[..]

Regards,
Simon

