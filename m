Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B12D44C95D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 20:46:04 +0100 (CET)
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mktXm-0000Ua-T8
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 14:46:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mktVG-0006kY-Sc
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 14:43:26 -0500
Received: from [2607:f8b0:4864:20::336] (port=44599
 helo=mail-ot1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mktVD-0007x9-TL
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 14:43:26 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso5490259otj.11
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 11:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Cp4GNDS1ZCrD4EUfhIbmA5exrHhubJZreOKkOkGAeO8=;
 b=mxDzbpEJtaD+5JqDUn4Pb9XJbmU+vg+max11Xi1jkZWyxASiD6/0t8P7ulVGOYtN1o
 QCRyvkkRSLUWD0NBp17asUd0ucZNb5FUW81EllukaehIKg3T272NXL/xwk+JCiO8vCCR
 aTdvULXnj+9dEQEyy8qj6VHTLlCbtu/GscDLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Cp4GNDS1ZCrD4EUfhIbmA5exrHhubJZreOKkOkGAeO8=;
 b=DbFo0Lv5S3TlMgaGfECGJ7qpNRNLwXOFFDd4HS3KUahMWAZoErw4HXAsZs3MNRJ9/P
 YXXt1rNinYwsZaoiOd9UfxpJaDVCsHnOBq3UVC2Vxb7F5eZF+mkuWKBd2koXQJN5xnpY
 kws1DuEgmzVoWlJjOb1wzVc8YT21ynpkmyDp1pL1vf2Xcw/aji/mCZEt9b4MiO0oZ9yp
 X/efXyttf1/QuaLuIlRTEnvDS3+QpAvfuvoFU4M66OEUSTWgAh7q92pUpN/bfyv7Xo01
 PQG3K6KJFzSJnzOHmJhGmrfZMe0M4kYEAxmhsUsDfFcL9OLhdzzOZBs3LtC8QqsHa29d
 7fEw==
X-Gm-Message-State: AOAM532CNQc7LzEnpo4CBCtCvnjTqwuzrptDFCajYWf78AxJPF23rzzi
 OIgT2mdgXUGvpMFXQApnAHvphJdgeELq1FHkgajXNzCAuZ8=
X-Google-Smtp-Source: ABdhPJxg4pumVEs+zmxm/13iMD5QM7A0dUuo+mKHySSzl6xWoonoiaJewkxfBKxRmOBbR+xJIz1vUSODV9H3sosbucQ=
X-Received: by 2002:ab0:14a7:: with SMTP id d36mr2150991uae.96.1636573056004; 
 Wed, 10 Nov 2021 11:37:36 -0800 (PST)
MIME-Version: 1.0
References: <20211101011734.1614781-1-sjg@chromium.org>
 <CAHFG_=X1DeBFkzwFBkirMkmHB0_OSa9OkQj+CvpG6dT5HZEWBA@mail.gmail.com>
 <CAPnjgZ1we6-nJ1RXz3TK67c7Pj9Znh++rBy-SYtECZURt8bLWw@mail.gmail.com>
 <CAHFG_=V6QEsD63LgBDpJUZkd9rrJ0hoo7aYd7MQ_z2YS6k9UhQ@mail.gmail.com>
 <CAPnjgZ0pbLLjvmD37aSYqjQ28kLgrU0Pox+hQLTH15+wcX+5ow@mail.gmail.com>
 <CAHFG_=XWoKYj5MM+quN=QLjMfXrkhzHWng1yY3xjqLsRAbEXoQ@mail.gmail.com>
 <CAPnjgZ2LXjsSnu5+no5cYFtKE8+V_+NqeUmWupsafZoNX8oRnA@mail.gmail.com>
 <CAHFG_=VbajOOdpvbvMy_uFUE7ZGucWf9b0Cxyx9vZhvSsg4OvA@mail.gmail.com>
 <CAPnjgZ2ximaTHshVEqUnjF6_qR+M5XifVAc8-+xHvKeVbFmf5g@mail.gmail.com>
 <CAHFG_=XYsCrPoKG2fU7an-Dx9G76ttWFM1huYFD1cHp0O_E16Q@mail.gmail.com>
In-Reply-To: <CAHFG_=XYsCrPoKG2fU7an-Dx9G76ttWFM1huYFD1cHp0O_E16Q@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 10 Nov 2021 12:37:24 -0700
Message-ID: <CAPnjgZ2dnUNOre3bZgFej9E7Sbx=xAAaXumYvMMpVJeUZr3qbw@mail.gmail.com>
Subject: Re: [PATCH 00/31] passage: Define a standard for firmware data flow
To: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::336
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=sjg@google.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -91
X-Spam_score: -9.2
X-Spam_bar: ---------
X-Spam_report: (-9.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jerry Van Baren <vanbaren@cideas.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Fran=C3=A7ois,

On Mon, 8 Nov 2021 at 09:20, Fran=C3=A7ois Ozog <francois.ozog@linaro.org> =
wrote:
>
>
>
> On Fri, 5 Nov 2021 at 18:17, Simon Glass <sjg@chromium.org> wrote:
>>
>> ) to signal Hi Fran=C3=A7ois,
>>
>> On Fri, 5 Nov 2021 at 10:31, Fran=C3=A7ois Ozog <francois.ozog@linaro.or=
g> wrote:
>> >
>> > Hi Simon,
>> >
>> > Le ven. 5 nov. 2021 =C3=A0 17:12, Simon Glass <sjg@chromium.org> a =C3=
=A9crit :
>> >>
>> >> Hi Fran=C3=A7ois,
>> >>
>> >> On Fri, 5 Nov 2021 at 02:27, Fran=C3=A7ois Ozog <francois.ozog@linaro=
.org> wrote:
>> >> >
>> >> >
>> >> >
>> >> > On Fri, 5 Nov 2021 at 03:02, Simon Glass <sjg@chromium.org> wrote:
>> >> >>
>> >> >> Hi Fran=C3=A7ois,
>> >> >>
>> >> >> On Tue, 2 Nov 2021 at 10:03, Fran=C3=A7ois Ozog <francois.ozog@lin=
aro.org> wrote:
>> >> >> >
>> >> >> > Hi Simon,
>> >> >> >
>> >> >> > On Tue, 2 Nov 2021 at 15:59, Simon Glass <sjg@chromium.org> wrot=
e:
>> >> >> >>
>> >> >> >> Hi Fran=C3=A7ois,
>> >> >> >>
>> >> >> >> On Mon, 1 Nov 2021 at 02:53, Fran=C3=A7ois Ozog <francois.ozog@=
linaro.org> wrote:
>> >> >> >> >
>> >> >> >> > Hi Simon,
>> >> >> >> >
>> >> >> >> > this seems a great endeavor. I'd like to better understand th=
e scope of it.
>> >> >> >> >
>> >> >> >> > Is it to be used as part of what could become a U-Boot entry =
ABI scheme? By that I mean giving some fixed aspects
>> >> >> >> > to U-Boot entry while letting boards to have flexibility (say=
 for instance that the first 5 architecture ABI
>> >> >> >> > parameter registers are reserved for U-Boot), and the Passage=
 is about specifying either those reserved registers
>> >> >> >> > or one of them?
>> >> >> >>
>> >> >> >> The goal is to provide a standard entry scheme for all firmware
>> >> >> >> binaries. Whether it achieves that (or can with some mods) is u=
p for
>> >> >> >> discussion.
>> >> >> >>
>> >> >> > If you say
>> >> >> > a) define a U-Boot entry ABI and providing a firmware-to-firmwar=
e information passing facility which would be part of all firmware ABIs (as=
 the projects decide to define their own ABI) it looks good.
>> >> >> > but If you say
>> >> >>
>> >> >> It is an ABI to be adopted by U-Boot but also other firmware. For
>> >> >> example, if TF-A calls U-Boot it should use standard passage. If
>> >> >> U-Boot calls TF-A or Optee it should use standard passage.
>> >> >>
>> >> >> > b) define a standard entry scheme (register map, processor state=
, MMU state, SMMU state, GIC state...) that does not look realistic.
>> >> >>
>> >> >> No I don't mean that. This data structure could be used in any sta=
te,
>> >> >> so long as the two registers are set correctly.
>> >> >>
>> >> >> > I think you mean a) but just want to be sure.
>> >> >>
>> >> >> Yes I think so.
>> >> >>
>> >> >> >>
>> >> >> >> Re the registers, do you think we need 5?
>> >> >> >>
>> >> >>
>> >> >> I don't :-)
>> >> >>
>> >> >> >> >
>> >> >> >> > Thinking entry ABI, here is what I observed on Arm:
>> >> >> >> >
>> >> >> >> > Linux has two entry ABIs:
>> >> >> >> > - plain: x0 =3D dtb;
>> >> >> >> >           command line =3D dtb:/chosen/bootargs; initrd =3D d=
tb:/chosen/linux,initrd-*
>> >> >> >> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;
>> >> >> >> >            dtb =3D EFI_UUID config table; initrd =3D efi:<loa=
dfile2(INITRD vendor media UUID); command line =3D efi: image_protocol::loa=
d_options
>> >> >> >> >
>> >> >> >> > U-Boot (proper) has plenty of schemes:
>> >> >> >> > - dtb is passed as either x0, x1, fixed memory area (Qemu whi=
ch is bad in itself), or other registers
>> >> >> >> > - additional information passing: board specific register sch=
eme, SMC calls
>> >> >> >> > - U-Boot for RPI boards implement a Linux shaped entry ABI to=
 be launched by Videocore firmware
>> >> >> >> >
>> >> >> >> > Based on all the above, I would tend to think that RPI scheme=
 is a good idea but also
>> >> >> >> > shall not prevent additional schemes for the boards.
>> >> >> >>
>> >> >> >> I was not actually considering Linux since I believe/assume its=
 entry
>> >> >> >> scheme is fixed and not up for discussion.
>> >> >> >>
>> >> >> >> I also did not think about the EFI case. As I understand it we =
cannot
>> >> >> >> touch it as it is used by UEFI today. Maybe it is even in the
>> >> >> >> standard?
>> >> >> >
>> >> >> > It is in the spec and we are making it evolve, or its understand=
ing evolve (jurisprudence) for instance on initrd standard handling.
>> >> >>
>> >> >> Well perhaps we could merge it with standard passage. But EFI is n=
ot
>> >> >> going to want to use a bloblist, it will want to use a HOB.
>> >> >>
>> >> >> >>
>> >> >> >>
>> >> >> >> Really I am hoping we can start afresh...?
>> >> >> >>
>> >> >> >> >
>> >> >> >> > What about a U-Boot Arm entry ABI like:
>> >> >> >> > - plain: x0=3Ddtb, x1=3D<Passage defined>, x2-x5 =3D <reserve=
d>, other registers are per platform, SMC calls allowed too
>> >> >> >>
>> >> >> >> Hmm we don't actually need the dtb as it is available in the bl=
oblist.
>> >> >> >
>> >> >> > If you don't have x0=3Ddtb, then you will not be able to use U-B=
oot on RPI4.
>> >> >> > Unless you want to redo everything the RPI firmware is doing.
>> >> >>
>> >> >> That's right, RPI cannot support standard passage. It is not
>> >> >> open-source firmware so it isn't really relevant to this discussio=
n.
>> >> >> It will just do what it does and have limited functionality, with
>> >> >> work-arounds to deal with the pain, as one might expect.
>> >> >>
>> >> > So you are seeing two "all-or-nothing" options:
>> >> > <specific>: U-Boot entry is board specific as it is today
>> >> > <purepassage>: A new form where the only parameter is a head of blo=
blist, one of those blobs contain a DT
>> >> >  You propose to mandate a DT for all boards make sense in that envi=
ronment.
>> >> > For RPI4, you just ignore everything the prior boot loader does bec=
ause it is not <passage> compliant.
>> >>
>> >> It's not that. It's just that it is closed-source, so not relevant to
>> >> the discussion here. They could open-source it and then we could
>> >> consider it, but it has been closed-source for years now, so why woul=
d
>> >> we think that would happen?
>> >>
>> >> >
>> >> > This reinforces my opposition to the mandatory DT proposal.
>> >> >
>> >> > a third option is I think way more attractive:
>> >> > <optpassage>: shaped after the architecture Linux entry (ie. first =
parameter is dtb) [+ passage head (i.e. second parameter is pointer to pass=
age head)]
>> >> >
>> >> > This way, you make U-Boot entry clean in RPI4, Apple M1, Qemu, Syst=
emReady contexts
>> >> > and get a well deserved standardized information passing between pr=
ior loaders and U-Boot.
>> >> >
>> >> > The three options are possible though, you could select a U-Boot en=
try CONFIG option for:
>> >> > <specific>
>> >> > <optpassage>
>> >> > <purepassage>
>> >> >
>> >> > But despite it would be technically feasible, I don't think it is g=
oes in the right direction.
>> >>
>> >> OK. Do you think we need a separate devicetree pointer, rather than
>> >> forcing it to be inside the created bloblist?
>> >>
>> >> I'd like to understand what problem you are solving with this. I am
>> >> trying to figure out a firmware-to-firmware mini-ABI (just a few
>> >> register values) that can be used in open-source projects. The ABI is
>> >> not intended to be used with Linux (I am unsure of the benefit it
>> >> would give and whether it is feasible to change the current one).
>> >>
>> >> You are talking about the Linux entry mechanism. What relevance does
>> >> that have for firmware?
>> >>
>> >> I understand that some projects already implement the Linux mechanism=
,
>> >> but that is because they expect to jump straight to Linux, not have
>> >> U-Boot in the path. So IMO standard passage offers no benefit to them=
.
>> >>
>> >> To address them in turn:
>> >> - rpi4 - closed source, who cares?
>> >> - Apple M1 - we could probably expand it to pass a bloblist, but it
>> >> would be confusing unless we share registers, as you suggest
>> >> - Qemu - I already tried to update that and got pushback...do you
>> >> really think those guys are going to want to add a bloblist? So again=
,
>> >> who cares?
>> >> - SystemReady - not sure what this means in practice, but it would be
>> >> good if SystemReady could use standard passage
>> >>
>> >> So let's say we have an optional standard-passage thing and we use
>> >> registers such that it is similar to Linux and EFI and just expands o=
n
>> >> them.
>> >>
>> >> The first problem is that Linux and EFI seem to be completely
>> >> incompatible. Can that be changed, perhaps on the EFI side? If not,
>> >> we need two separate protocols.
>> >>
>> >> I'll ignore EFI for now. So we might have:
>> >>
>> >> r0 =3D 0
>> >> r1 =3D machine number (0?)
>> >> r2 =3D dtb pointer
>> >> r3 =3D bloblist pointer, 0 if missing
>> >> r14 =3D return address
>> >>
>> >> or
>> >>
>> >> x0 =3D dtb
>> >> x1 =3D bloblist pointer, 0 if missing
>> >> x30 =3D return address
>> >
>> > That=E2=80=99s essentially what I proposed!
>> > you do not force the DTB to be found in the bloblist, and shape the U-=
Boot entry after the Linux entry ABI. Good !
>> > I was saving a few registers for future ABI evolution so that boards c=
an be guaranteed to have their board specific registers properly protected.=
 The 5 registers, leaving 3 undefined was just =C2=AB why not =C2=BB. We co=
uld also have a cookie in x1: high 48 bits magic low 16 ABI version, x2=3Db=
loblist pointer.
>>
>> Isn't 32 bits enough for a magic value?
>>
>> Also x3 might be nicer, to match ARM 32-bit, so:
>>
>> x0 =3D dtb
>> x1 =3D ABI indicator bits 63:32 0xb00757a3, bits 31:1 =3D 0, bit 0 =3D 1
>> (version 1) ? We don't need to decide how many bits for the version
>> right now. Perhaps 8 is plenty
>> x2 =3D 0
>> x3 =3D bloblist pointer, 0 if missing
>> x4 =3D 0
>> x30 =3D return address
>>
> sounds usable. Need more comments on this.
>
>>
>> For ARM:
>>
>> r0 =3D 0
>> r1 =3D machine number (0xb00757xx to signal standard passage where xx is
>> the ABI version?)*
>> r2 =3D dtb pointer
>> r3 =3D bloblist pointer (if r1 is 0xb00757xx), else 0
>> r4 =3D 0
>> r14 =3D return address
>>
>> * might be safe, looking at
>> https://elixir.bootlin.com/linux/latest/source/arch/arm/kernel/setup.c#L=
1094
>>
> Indeed. Need more comments on this.
>
>
>>
>> >
>> >>
>> >> For EFI, we could add a blob to the bloblist containing the system
>> >> table and handle, perhaps? Otherwise:
>> >>
>> >> x2 - efi handle
>> >> x3 - system table
>> >>
>> >> Is that along the lines of what you are thinking?
>> >
>> > No, efi entry is only x0=3Defi handle, x1=3Dsystem table . I was tryin=
g to find a way to have passage when U-Boot is loaded as a UEFI app (your o=
ther patch set to make U-Boot a more integrated UEFi app). Let=E2=80=99s sa=
y that a U-Boot aware DXE driver/protocol actually populate such a table, i=
t could be a communication channel between that driver and U-Boot.
>>
>> OK, I figured, so how about, for EFI on 64-bit:
>>
>> x0 =3D handle
>> x1 =3D systable
>> x2 =3D ABI indicator bits 63:32 0xb00757a3, bits 31:1 =3D 0, bit 0 =3D 1=
 (version 1)
>> x3 =3D bloblist pointer
>> x4 =3D 0
>> x30 =3D return address
>>
>> EFI 32-bit:
>>
>> r0 =3D handle
>> r1 =3D systable
>> r2 =3D 0xb00757a3
>> r3 =3D bloblist pointer
>> r4 =3D 0
>> r14 =3D return address
>>
> Let's be clear that this is for an existing UEFI implementation to boot U=
-Boot.
> If the implementation cannot be changed to add the information, a UEFI dr=
iver or protocol may be used.
> Could SPL may be tweaked to craft the bloblist based on whatever informat=
ion I that case?

Yes that is easy enough, but then how does SPL load U-Boot? UEFI
requires an efl file and we don't want to put the EFI app into SPL, I
think.

>
> (side comment: LinuxBoot has developed techniques to replace most of an E=
DK2 implementation by Linux.
> This entry ABI does not apply in this use case as it is defined by EDK2.)
>
> Now on the how.
>
> EFI API has already defined extension mechanism, so that may be difficult=
 to add.
>
> let's put the bloblist pointer in a <configtable>:
>
>  typedef struct {
> 1936  ///
> 1937  /// The 128-bit GUID value that uniquely identifies the system conf=
iguration table.
> 1938  ///
> 1939  EFI_GUID VendorGuid; /* set to BLOB_LIST_GUID */
> 1940  ///
> 1941  /// A pointer to the table associated with VendorGuid.
> 1942  ///
> 1943  VOID *VendorTable; /* bloblist pointer */
> 1944 } EFI_CONFIGURATION_TABLE;
>
> U-Boot or a driver or a protocol can set the VendorTable to bloblist poin=
ter and add this to the list of configuration tables via
> https://edk2-docs.gitbook.io/edk-ii-uefi-driver-writer-s-guide/5_uefi_ser=
vices/readme.2/5210_installconfigurationtable
>
> The blobs should be already accounted for in the memory map as they were =
pre-allocated before U-Boot entry. But that may be a topic to be checked.

OK, well in that case I suppose we don't need to define it here? Or
are you saying that we should define this as an alternative way to get
the bloblist?

Everything we define, we need tests for, so I want to make sure only
useful cases are included.

Regards,
Simon


>
>
>> Regards,
>> Simon
>>
>> >>
>> >>
>> >> But still, please respond above so I can understand what problem you
>> >> are worried about.
>> >>
>> >> Regards,
>> >> Simon
>> >>
>> >>
>> >> >
>> >> >> >>
>> >> >> >> But I added an offset to it as a convenience.
>> >> >> >>
>> >> >> >> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;  =
(when U-Boot is launched as an EFI app)
>> >> >> >> >        dtb =3D EFI_UUID config table, + Passage =3D Passage U=
UID config table
>> >> >> >>
>> >> >> >> I don't understand the last line. Where is the passage info /
>> >> >> >> bloblist? Do you mean it goes in the HOB list with a UUID? I su=
ppose
>> >> >> >> that is the most EFI-compatible way.
>> >> >> >
>> >> >> > The Passage config table  could just contain the "head" of the b=
loblist/Passage information.
>> >> >>
>> >> >> If UEFI wants to deal with standard passage, that is...
>> >> >>
>> >> >> >>
>> >> >> >>
>> >> >> >> What do you think about the idea of using an offset into the bl=
oblist
>> >> >> >> for the dtb?
>> >> >> >
>> >> >> > It is possible but as I said, failing to mimic Linux entry ABI w=
ould miss the opportunity to just boot without changes on RPI4.
>> >> >>
>> >> >> See above. Broadcom could look at open-sourcing their bootloader i=
f they wish.
>> >> >>
>> >> >> >>
>> >> >> >> Also, can we make the standard passage ABI a build-time
>> >> >> >> option, so it is deterministic?
>> >> >> >>
>> >> >> > Looks good. I would look into stating that for SystemReady we wo=
uld advise to use that option and make it standard for Trusted Substrate (L=
inaro recipes that we upstreaming to make SystemReady compliance easy and c=
onsistent across platforms).
>> >> >>
>> >> >> OK. I mean that if the option is enabled, then standard passage mu=
st
>> >> >> be provided / emitted or things won't work. If the option is disab=
led,
>> >> >> then standard passage is not used. In other words, we are looking =
for
>> >> >> magic values in registers, etc, just enabling/disabling it at
>> >> >> build-time.
>> >> >>
>> >> >> >>
>> >> >> >> >
>> >> >> >> > We could further leverage Passage to pass Operating Systems p=
arameters that could be removed from device tree (migration of /chosen to P=
assage). Memory inventory would still be in DT but allocations for CMA or G=
PUs would be in Passage. This idea is to reach a point where  device tree i=
s a "pristine" hardware description.
>> >> >> >>
>> >> >> >> I'm worried about this becoming a substitute for devicetree. Re=
ally my
>> >> >> >> intent is to provide a way to pass simple info, whereas what yo=
u talk
>> >> >> >> about there seems like something that should be DT, just that i=
t might
>> >> >> >> need suitable bindings.
>> >> >> >>
>> >> >> > I see your point and I agree It should not be a substitute.
>> >> >> > here is an expanded version of what I had in mind when I wrote t=
hose lines.
>> >> >> > cma, initrd and other Linux kernel parameters can be conveyed ei=
ther through command line or DT.
>> >> >> > When using the non UEFI Linux entry ABI, you need to use the DT =
to pass those parameters.
>> >> >> > When using the UEFI Linux entry ABI, you *can* (not must) use th=
e command line to pass all information, leaving the DT passed to the OS wit=
hout any /chosen.
>> >> >> > When introducing Passage, I was wondering if we could pass comma=
nd line to Linux and, same as UEFI, leave the DT free from /chosen.
>> >> >> > I am not sure it is a good goal though. I may be too pushing for=
 a DT free from parameters.
>> >> >>
>> >> >> We could. Are there benefits to that?
>> >> >>
>> >> >> I doubt we would pass the standard passage to Linux as a bloblist.=
 I
>> >> >> imagine something like this. The bloblist sits in memory with some
>> >> >> things in it, including a devicetree, perhaps an SMBIOS table and =
a
>> >> >> TPM log. But when U-Boot calls Linux it puts the address/size of t=
hose
>> >> >> individual things in the devicetree. They don't move and are still
>> >> >> contiguous in memory, but the bloblist around them is forgotten. L=
inux
>> >> >> doesn't know that the three separate things it is picking up are
>> >> >> actually part of a bloblist structure, since it doesn't care about
>> >> >> that. Even a console log could work the same way. That way we don'=
t
>> >> >> end up trying to teach Linux about bloblist when it already has a
>> >> >> perfectly good means to accept these items.
>> >> >>
>> >> >> For ACPI I see things a similar way. The ACPI tables can point to
>> >> >> things that *happen* to be in a bloblist, but without any knowledg=
e of
>> >> >> that needed in Linux, grub, etc.
>> >> >>
>> >> >> >>
>> >> >> >> As you know I have more expansive views about what should be in=
 DT.
>> >> >> >
>> >> >> > I think both of us are huge supporters of DT format and self des=
cribing capabilities.
>> >> >> > I am inclined to put rules into what fits into what lands in the=
 DT that is passed to the OS.
>> >> >> > I am a fan of having DT used more in ad-hoc files.
>> >> >>
>> >> >> Me too.
>> >> >>
>> >> >> >>
>> >> >> >> >
>> >> >> >> > Cheers
>> >> >> >> >
>> >> >> >> > PS: as Ilias mentions, this patch set contains bug fixes, non=
 immediately related additional functions (DM stats). It would be great to =
carve those out to fast path them and keep this one with the very core of y=
our idea.
>> >> >> >>
>> >> >> >> The DM stats is used in 'passage: Report the devicetree source'=
. I
>> >> >> >> know it is sideways but I think it is better to make the output=
 line
>> >> >> >> more useful than just reporting the devicetree source.
>> >> >> >>
>> >> >> > I believe the DM stats has merits in its own. You could upstream=
 this independently and then Passage would be yet another "customer" of the=
 feature.
>> >> >>
>> >> >> I could, but it would just be a debug feature so people might not
>> >> >> think it worth the code space. With the devicetree source it is mo=
re
>> >> >> compelling.
>> >> >>
>> >> >> >>
>> >> >> >> The first patch is indeed unrelated. I will pick it up so we ca=
n drop
>> >> >> >> it for the next rev.
>> >> >> >>
>> >> >> [..]
>> >> >>
>> >> >> Regards,
>> >> >> Simon
>> >> >
>> >> >
>> >> >
>> >> > --
>> >> > Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Developme=
nt
>> >> > T: +33.67221.6485
>> >> > francois.ozog@linaro.org | Skype: ffozog
>> >> >
>> >
>> > --
>> > Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development
>> > T: +33.67221.6485
>> > francois.ozog@linaro.org | Skype: ffozog
>> >
>
>
>
> --
> Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development
> T: +33.67221.6485
> francois.ozog@linaro.org | Skype: ffozog
>

