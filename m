Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFA74466EB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:22:42 +0100 (CET)
Received: from localhost ([::1]:43696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1zF-0001hx-P6
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mj1pc-0006pc-7g
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:12:44 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:37885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mj1pY-0007vS-6j
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:12:42 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 v40-20020a056830092800b0055591caa9c6so13792786ott.4
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q61HNvVrvtUndEXjdDnY0VKSgsgZF/JfHPCda9qHZtY=;
 b=cmMSENSxw2AvsMSffIvj+0IONWW/H+iPGSeUCzablCcI1K7k4A7wh4DZa5W7DOKx3N
 hjFW5IewDJUNTLOZQ1z7nrHRK3yhQOmiNDF+y6yjquzzV5FWyeCCqCstOE+LQxHp/cB+
 gVi2IGbPCXoHlXGZDfILBhfuuuQ57vFHeKZhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q61HNvVrvtUndEXjdDnY0VKSgsgZF/JfHPCda9qHZtY=;
 b=x+p/VSxwh6MK94ADGgnMalF6h39RbaeYAhq3VizcJwVtGg+HVOUbcIHdRDFmltJEv4
 OQzaqRAApH0vkNgBoxLEeSwmHyLZd+C83To0UTxD7KPSW8rYREzuzJLbG6PudZ12Jcm1
 Bu6BkzqetcEj/GSb0H6/TzahbVRBq2JJ2xW21qswJBCJh9FRyTjhh4VK/S+Y1BC5UIOq
 Tb1j3dFexiU82+6owVHb315A4ZfbgMURpG/wOrowq/PBHlW4U5QMDSf4xJfbV+PGX4Jx
 dR1OPMmIqAd/RBYgTzADephgr+teIEiF8zgHJnp4khb51SgOYJKRnuSKrPoPq8xViE1c
 JXHA==
X-Gm-Message-State: AOAM5303e7w2U+5GYJeWupYySSZoAsT+9yzxA2Dbf9Nb0lXQwGtd3HeX
 JLKJmVPoeynX1BE7lKlrL4GYtU+6k76W1DtFnGbaIw==
X-Google-Smtp-Source: ABdhPJxmRnm1sgmOEaritJE250Z+8NtL9dSzy7ihBeMo5nDpdmzO2hj9FPsLqTZKZ0WpnEKbCjOr6GlMrWzpzh+4mOE=
X-Received: by 2002:a9d:17c5:: with SMTP id j63mr45584307otj.191.1636128758443; 
 Fri, 05 Nov 2021 09:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211101011734.1614781-1-sjg@chromium.org>
 <CAHFG_=X1DeBFkzwFBkirMkmHB0_OSa9OkQj+CvpG6dT5HZEWBA@mail.gmail.com>
 <CAPnjgZ1we6-nJ1RXz3TK67c7Pj9Znh++rBy-SYtECZURt8bLWw@mail.gmail.com>
 <CAHFG_=V6QEsD63LgBDpJUZkd9rrJ0hoo7aYd7MQ_z2YS6k9UhQ@mail.gmail.com>
 <CAPnjgZ0pbLLjvmD37aSYqjQ28kLgrU0Pox+hQLTH15+wcX+5ow@mail.gmail.com>
 <CAHFG_=XWoKYj5MM+quN=QLjMfXrkhzHWng1yY3xjqLsRAbEXoQ@mail.gmail.com>
In-Reply-To: <CAHFG_=XWoKYj5MM+quN=QLjMfXrkhzHWng1yY3xjqLsRAbEXoQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 5 Nov 2021 10:12:24 -0600
Message-ID: <CAPnjgZ2LXjsSnu5+no5cYFtKE8+V_+NqeUmWupsafZoNX8oRnA@mail.gmail.com>
Subject: Re: [PATCH 00/31] passage: Define a standard for firmware data flow
To: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=sjg@google.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Fri, 5 Nov 2021 at 02:27, Fran=C3=A7ois Ozog <francois.ozog@linaro.org> =
wrote:
>
>
>
> On Fri, 5 Nov 2021 at 03:02, Simon Glass <sjg@chromium.org> wrote:
>>
>> Hi Fran=C3=A7ois,
>>
>> On Tue, 2 Nov 2021 at 10:03, Fran=C3=A7ois Ozog <francois.ozog@linaro.or=
g> wrote:
>> >
>> > Hi Simon,
>> >
>> > On Tue, 2 Nov 2021 at 15:59, Simon Glass <sjg@chromium.org> wrote:
>> >>
>> >> Hi Fran=C3=A7ois,
>> >>
>> >> On Mon, 1 Nov 2021 at 02:53, Fran=C3=A7ois Ozog <francois.ozog@linaro=
.org> wrote:
>> >> >
>> >> > Hi Simon,
>> >> >
>> >> > this seems a great endeavor. I'd like to better understand the scop=
e of it.
>> >> >
>> >> > Is it to be used as part of what could become a U-Boot entry ABI sc=
heme? By that I mean giving some fixed aspects
>> >> > to U-Boot entry while letting boards to have flexibility (say for i=
nstance that the first 5 architecture ABI
>> >> > parameter registers are reserved for U-Boot), and the Passage is ab=
out specifying either those reserved registers
>> >> > or one of them?
>> >>
>> >> The goal is to provide a standard entry scheme for all firmware
>> >> binaries. Whether it achieves that (or can with some mods) is up for
>> >> discussion.
>> >>
>> > If you say
>> > a) define a U-Boot entry ABI and providing a firmware-to-firmware info=
rmation passing facility which would be part of all firmware ABIs (as the p=
rojects decide to define their own ABI) it looks good.
>> > but If you say
>>
>> It is an ABI to be adopted by U-Boot but also other firmware. For
>> example, if TF-A calls U-Boot it should use standard passage. If
>> U-Boot calls TF-A or Optee it should use standard passage.
>>
>> > b) define a standard entry scheme (register map, processor state, MMU =
state, SMMU state, GIC state...) that does not look realistic.
>>
>> No I don't mean that. This data structure could be used in any state,
>> so long as the two registers are set correctly.
>>
>> > I think you mean a) but just want to be sure.
>>
>> Yes I think so.
>>
>> >>
>> >> Re the registers, do you think we need 5?
>> >>
>>
>> I don't :-)
>>
>> >> >
>> >> > Thinking entry ABI, here is what I observed on Arm:
>> >> >
>> >> > Linux has two entry ABIs:
>> >> > - plain: x0 =3D dtb;
>> >> >           command line =3D dtb:/chosen/bootargs; initrd =3D dtb:/ch=
osen/linux,initrd-*
>> >> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;
>> >> >            dtb =3D EFI_UUID config table; initrd =3D efi:<loadfile2=
(INITRD vendor media UUID); command line =3D efi: image_protocol::load_opti=
ons
>> >> >
>> >> > U-Boot (proper) has plenty of schemes:
>> >> > - dtb is passed as either x0, x1, fixed memory area (Qemu which is =
bad in itself), or other registers
>> >> > - additional information passing: board specific register scheme, S=
MC calls
>> >> > - U-Boot for RPI boards implement a Linux shaped entry ABI to be la=
unched by Videocore firmware
>> >> >
>> >> > Based on all the above, I would tend to think that RPI scheme is a =
good idea but also
>> >> > shall not prevent additional schemes for the boards.
>> >>
>> >> I was not actually considering Linux since I believe/assume its entry
>> >> scheme is fixed and not up for discussion.
>> >>
>> >> I also did not think about the EFI case. As I understand it we cannot
>> >> touch it as it is used by UEFI today. Maybe it is even in the
>> >> standard?
>> >
>> > It is in the spec and we are making it evolve, or its understanding ev=
olve (jurisprudence) for instance on initrd standard handling.
>>
>> Well perhaps we could merge it with standard passage. But EFI is not
>> going to want to use a bloblist, it will want to use a HOB.
>>
>> >>
>> >>
>> >> Really I am hoping we can start afresh...?
>> >>
>> >> >
>> >> > What about a U-Boot Arm entry ABI like:
>> >> > - plain: x0=3Ddtb, x1=3D<Passage defined>, x2-x5 =3D <reserved>, ot=
her registers are per platform, SMC calls allowed too
>> >>
>> >> Hmm we don't actually need the dtb as it is available in the bloblist=
.
>> >
>> > If you don't have x0=3Ddtb, then you will not be able to use U-Boot on=
 RPI4.
>> > Unless you want to redo everything the RPI firmware is doing.
>>
>> That's right, RPI cannot support standard passage. It is not
>> open-source firmware so it isn't really relevant to this discussion.
>> It will just do what it does and have limited functionality, with
>> work-arounds to deal with the pain, as one might expect.
>>
> So you are seeing two "all-or-nothing" options:
> <specific>: U-Boot entry is board specific as it is today
> <purepassage>: A new form where the only parameter is a head of bloblist,=
 one of those blobs contain a DT
>  You propose to mandate a DT for all boards make sense in that environmen=
t.
> For RPI4, you just ignore everything the prior boot loader does because i=
t is not <passage> compliant.

It's not that. It's just that it is closed-source, so not relevant to
the discussion here. They could open-source it and then we could
consider it, but it has been closed-source for years now, so why would
we think that would happen?

>
> This reinforces my opposition to the mandatory DT proposal.
>
> a third option is I think way more attractive:
> <optpassage>: shaped after the architecture Linux entry (ie. first parame=
ter is dtb) [+ passage head (i.e. second parameter is pointer to passage he=
ad)]
>
> This way, you make U-Boot entry clean in RPI4, Apple M1, Qemu, SystemRead=
y contexts
> and get a well deserved standardized information passing between prior lo=
aders and U-Boot.
>
> The three options are possible though, you could select a U-Boot entry CO=
NFIG option for:
> <specific>
> <optpassage>
> <purepassage>
>
> But despite it would be technically feasible, I don't think it is goes in=
 the right direction.

OK. Do you think we need a separate devicetree pointer, rather than
forcing it to be inside the created bloblist?

I'd like to understand what problem you are solving with this. I am
trying to figure out a firmware-to-firmware mini-ABI (just a few
register values) that can be used in open-source projects. The ABI is
not intended to be used with Linux (I am unsure of the benefit it
would give and whether it is feasible to change the current one).

You are talking about the Linux entry mechanism. What relevance does
that have for firmware?

I understand that some projects already implement the Linux mechanism,
but that is because they expect to jump straight to Linux, not have
U-Boot in the path. So IMO standard passage offers no benefit to them.

To address them in turn:
- rpi4 - closed source, who cares?
- Apple M1 - we could probably expand it to pass a bloblist, but it
would be confusing unless we share registers, as you suggest
- Qemu - I already tried to update that and got pushback...do you
really think those guys are going to want to add a bloblist? So again,
who cares?
- SystemReady - not sure what this means in practice, but it would be
good if SystemReady could use standard passage

So let's say we have an optional standard-passage thing and we use
registers such that it is similar to Linux and EFI and just expands on
them.

The first problem is that Linux and EFI seem to be completely
incompatible. Can that be changed, perhaps on the EFI side? If not,
we need two separate protocols.

I'll ignore EFI for now. So we might have:

r0 =3D 0
r1 =3D machine number (0?)
r2 =3D dtb pointer
r3 =3D bloblist pointer, 0 if missing
r14 =3D return address

or

x0 =3D dtb
x1 =3D bloblist pointer, 0 if missing
x30 =3D return address

For EFI, we could add a blob to the bloblist containing the system
table and handle, perhaps? Otherwise:

x2 - efi handle
x3 - system table

Is that along the lines of what you are thinking?

But still, please respond above so I can understand what problem you
are worried about.

Regards,
Simon


>
>> >>
>> >> But I added an offset to it as a convenience.
>> >>
>> >> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;  (when =
U-Boot is launched as an EFI app)
>> >> >        dtb =3D EFI_UUID config table, + Passage =3D Passage UUID co=
nfig table
>> >>
>> >> I don't understand the last line. Where is the passage info /
>> >> bloblist? Do you mean it goes in the HOB list with a UUID? I suppose
>> >> that is the most EFI-compatible way.
>> >
>> > The Passage config table  could just contain the "head" of the bloblis=
t/Passage information.
>>
>> If UEFI wants to deal with standard passage, that is...
>>
>> >>
>> >>
>> >> What do you think about the idea of using an offset into the bloblist
>> >> for the dtb?
>> >
>> > It is possible but as I said, failing to mimic Linux entry ABI would m=
iss the opportunity to just boot without changes on RPI4.
>>
>> See above. Broadcom could look at open-sourcing their bootloader if they=
 wish.
>>
>> >>
>> >> Also, can we make the standard passage ABI a build-time
>> >> option, so it is deterministic?
>> >>
>> > Looks good. I would look into stating that for SystemReady we would ad=
vise to use that option and make it standard for Trusted Substrate (Linaro =
recipes that we upstreaming to make SystemReady compliance easy and consist=
ent across platforms).
>>
>> OK. I mean that if the option is enabled, then standard passage must
>> be provided / emitted or things won't work. If the option is disabled,
>> then standard passage is not used. In other words, we are looking for
>> magic values in registers, etc, just enabling/disabling it at
>> build-time.
>>
>> >>
>> >> >
>> >> > We could further leverage Passage to pass Operating Systems paramet=
ers that could be removed from device tree (migration of /chosen to Passage=
). Memory inventory would still be in DT but allocations for CMA or GPUs wo=
uld be in Passage. This idea is to reach a point where  device tree is a "p=
ristine" hardware description.
>> >>
>> >> I'm worried about this becoming a substitute for devicetree. Really m=
y
>> >> intent is to provide a way to pass simple info, whereas what you talk
>> >> about there seems like something that should be DT, just that it migh=
t
>> >> need suitable bindings.
>> >>
>> > I see your point and I agree It should not be a substitute.
>> > here is an expanded version of what I had in mind when I wrote those l=
ines.
>> > cma, initrd and other Linux kernel parameters can be conveyed either t=
hrough command line or DT.
>> > When using the non UEFI Linux entry ABI, you need to use the DT to pas=
s those parameters.
>> > When using the UEFI Linux entry ABI, you *can* (not must) use the comm=
and line to pass all information, leaving the DT passed to the OS without a=
ny /chosen.
>> > When introducing Passage, I was wondering if we could pass command lin=
e to Linux and, same as UEFI, leave the DT free from /chosen.
>> > I am not sure it is a good goal though. I may be too pushing for a DT =
free from parameters.
>>
>> We could. Are there benefits to that?
>>
>> I doubt we would pass the standard passage to Linux as a bloblist. I
>> imagine something like this. The bloblist sits in memory with some
>> things in it, including a devicetree, perhaps an SMBIOS table and a
>> TPM log. But when U-Boot calls Linux it puts the address/size of those
>> individual things in the devicetree. They don't move and are still
>> contiguous in memory, but the bloblist around them is forgotten. Linux
>> doesn't know that the three separate things it is picking up are
>> actually part of a bloblist structure, since it doesn't care about
>> that. Even a console log could work the same way. That way we don't
>> end up trying to teach Linux about bloblist when it already has a
>> perfectly good means to accept these items.
>>
>> For ACPI I see things a similar way. The ACPI tables can point to
>> things that *happen* to be in a bloblist, but without any knowledge of
>> that needed in Linux, grub, etc.
>>
>> >>
>> >> As you know I have more expansive views about what should be in DT.
>> >
>> > I think both of us are huge supporters of DT format and self describin=
g capabilities.
>> > I am inclined to put rules into what fits into what lands in the DT th=
at is passed to the OS.
>> > I am a fan of having DT used more in ad-hoc files.
>>
>> Me too.
>>
>> >>
>> >> >
>> >> > Cheers
>> >> >
>> >> > PS: as Ilias mentions, this patch set contains bug fixes, non immed=
iately related additional functions (DM stats). It would be great to carve =
those out to fast path them and keep this one with the very core of your id=
ea.
>> >>
>> >> The DM stats is used in 'passage: Report the devicetree source'. I
>> >> know it is sideways but I think it is better to make the output line
>> >> more useful than just reporting the devicetree source.
>> >>
>> > I believe the DM stats has merits in its own. You could upstream this =
independently and then Passage would be yet another "customer" of the featu=
re.
>>
>> I could, but it would just be a debug feature so people might not
>> think it worth the code space. With the devicetree source it is more
>> compelling.
>>
>> >>
>> >> The first patch is indeed unrelated. I will pick it up so we can drop
>> >> it for the next rev.
>> >>
>> [..]
>>
>> Regards,
>> Simon
>
>
>
> --
> Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development
> T: +33.67221.6485
> francois.ozog@linaro.org | Skype: ffozog
>

