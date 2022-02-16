Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950494B7C13
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 01:55:57 +0100 (CET)
Received: from localhost ([::1]:59276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK8bs-0002NA-3X
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 19:55:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nK8Vw-0008SQ-3g; Tue, 15 Feb 2022 19:49:48 -0500
Received: from [2607:f8b0:4864:20::52a] (port=44705
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nK8Vs-0004ye-LA; Tue, 15 Feb 2022 19:49:47 -0500
Received: by mail-pg1-x52a.google.com with SMTP id l73so668800pge.11;
 Tue, 15 Feb 2022 16:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=fkK7NNH/YnCBMxNIkOmBr3H5gabGWC6MPWYAJ+Ujvjo=;
 b=LZDEFsLJ7XDG9yDoGXkYbCLeQaxthLS722TWrWDHizeAkrdvN0pBIFf1SJlpjz/C/T
 Hd3QYBy7+gZGsLdZkk2vxM0f0NbSoT7ba61aR2y0k3UcoZBCYrgQkRJwNjUuwCtb8/OF
 Hy1OaN57VQms+0t5VOnvk+Sib0pmCbReYvr4yEUu/cAZq0eKBwvrK45tl78f/NP55bwy
 3NPO5/mTPCEnHoPX7KGPVddravixI0dKYeR+ssa3vsxNhLiCRliDBwoB7maQL8Kdeijp
 Jyyj4us3sWfLeXz4spTS/B2qI+phGd8BPBVw5ndeTDQM6FIGMJJLOY+DEAImqjdfNCS7
 reig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=fkK7NNH/YnCBMxNIkOmBr3H5gabGWC6MPWYAJ+Ujvjo=;
 b=hZzmu2AY9l3zHHcRdmBvVJK6riyrXsS0tCkVqTzxNP6Sndz8QIEg/oly6TRv19jWvm
 cpryY2u/S2FTG1ha/lXkEhjg4SslEJoVrfZDkIAdsfPTDxVDN6cVA19xBau5XKRSud1K
 VgX7GoxBLDXvoIEOUM7uL83jPtSR0+kmsbCno2EZ2qyC3y4tkseIW11yp7fIIXUkPj2P
 VCoKpQc8voXO+mDDgoERw0nDoAEj9mIljNTls+3NTEFmsgcpTUNYTMA7lo4/jlr7EIpD
 mTLcZg3TnGPcsglJa4DAOEQjfwYNKhRrDBmLiPw8l1rFv4NTRo7ABpfoY/dTUGWkXmTn
 ecuA==
X-Gm-Message-State: AOAM533RGgiOLoLnbCeHtoksJQ43OmPrnTEvzTHtikPxxPlfC/FS2qp9
 B4AgmGq63fXUwqxa3U9t/LU=
X-Google-Smtp-Source: ABdhPJwZAs3G/PLwmCcbRMFOhisHHj3C68l85wGFLdhQTztDrbepSpg3a8Fky9mwl/wGjxDRPEY+sA==
X-Received: by 2002:a63:755:0:b0:372:8216:dc3a with SMTP id
 82-20020a630755000000b003728216dc3amr232497pgh.12.1644972566751; 
 Tue, 15 Feb 2022 16:49:26 -0800 (PST)
Received: from localhost (60-241-140-189.static.tpgi.com.au. [60.241.140.189])
 by smtp.gmail.com with ESMTPSA id
 m14sm43116938pfc.170.2022.02.15.16.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 16:49:26 -0800 (PST)
Date: Wed, 16 Feb 2022 10:49:17 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 8/9] target/ppc: Introduce a vhyp framework for nested HV
 support
To: BALATON Zoltan <balaton@eik.bme.hu>, =?iso-8859-1?q?C=E9dric?= Le Goater
 <clg@kaod.org>
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-9-npiggin@gmail.com>
 <5892f53e-10df-2a69-63c6-5f5901384bb8@kaod.org>
 <2f25a033-aaf8-ba88-1d9f-81745ffba392@eik.bme.hu>
In-Reply-To: <2f25a033-aaf8-ba88-1d9f-81745ffba392@eik.bme.hu>
MIME-Version: 1.0
Message-Id: <1644972436.l3db0ngdqs.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from BALATON Zoltan's message of February 16, 2022 5:19 am:
> On Tue, 15 Feb 2022, C=C3=A9dric Le Goater wrote:
>> On 2/15/22 04:16, Nicholas Piggin wrote:
>>> Introduce virtual hypervisor methods that can support a "Nested KVM HV"
>>> implementation using the bare metal 2-level radix MMU, and using HV
>>> exceptions to return from H_ENTER_NESTED (rather than cause interrupts)=
.
>>>=20
>>> HV exceptions can now be raised in the TCG spapr machine when running a
>>> nested KVM HV guest. The main ones are the lev=3D=3D1 syscall, the hdec=
r,
>>> hdsi and hisi, hv fu, and hv emu, and h_virt external interrupts.
>>>=20
>>> HV exceptions are intercepted in the exception handler code and instead
>>> of causing interrupts in the guest and switching the machine to HV mode=
,
>>> they go to the vhyp where it may exit the H_ENTER_NESTED hcall with the
>>> interrupt vector numer as return value as required by the hcall API.
>>>=20
>>> Address translation is provided by the 2-level page table walker that i=
s
>>> implemented for the bare metal radix MMU. The partition scope page tabl=
e
>>> is pointed to the L1's partition scope by the get_pate vhc method.
>>>=20
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>   hw/ppc/pegasos2.c        |  6 ++++
>>>   hw/ppc/spapr.c           |  6 ++++
>>>   target/ppc/cpu.h         |  2 ++
>>>   target/ppc/excp_helper.c | 76 ++++++++++++++++++++++++++++++++++-----=
-
>>>   target/ppc/mmu-radix64.c | 15 ++++++--
>>>   5 files changed, 92 insertions(+), 13 deletions(-)
>>>=20
>>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>>> index 298e6b93e2..d45008ac71 100644
>>> --- a/hw/ppc/pegasos2.c
>>> +++ b/hw/ppc/pegasos2.c
>>> @@ -449,6 +449,11 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu,=
=20
>>> Pegasos2MachineState *pm,
>>>       }
>>>   }
>>>   +static bool pegasos2_cpu_in_nested(PowerPCCPU *cpu)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>>   static void pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU=
=20
>>> *cpu)
>>>   {
>>>       Pegasos2MachineState *pm =3D PEGASOS2_MACHINE(vhyp);
>>> @@ -504,6 +509,7 @@ static void pegasos2_machine_class_init(ObjectClass=
=20
>>> *oc, void *data)
>>>       mc->default_ram_id =3D "pegasos2.ram";
>>>       mc->default_ram_size =3D 512 * MiB;
>>>   +    vhc->cpu_in_nested =3D pegasos2_cpu_in_nested;
>>>       vhc->hypercall =3D pegasos2_hypercall;
>>>       vhc->cpu_exec_enter =3D vhyp_nop;
>>>       vhc->cpu_exec_exit =3D vhyp_nop;
>>
>>
>> I don't think you need to worry about the pegasos2 machine as it only
>> implements a few of the PPCVirtualHypervisorClass handlers and it can
>> not run any of these virtualization features. I would drop this part.
>=20
> I don't know anything about HV and running it nested but I'm sure pegasos=
2=20
> does not run with it as the hardware does not have HV (or radix MMU which=
=20
> is mentioned in the commit message above) and I've only used vhyp here to=
=20
> avoid having to modify vof and be able to use the same vof.bin that we=20
> have. This was the simplest way but it probably does not work with KVM=20
> either so I agree that unless it's required to implement this method for=20
> all machines using vhyp then this should not be needed for pegasos2. We=20
> only really need hypercall to be able to use VOF which is needed for=20
> booting OSes as the board firmware is not redistributable.
>=20
> If this gets in the way we could replace it with some other hypercall=20
> method (there was some discussion during the review of the series adding=20
> VOF support to pegasos2, we could support MOL OSI or some own solution=20
> instead) if VOF supported these, but I did not want to touch VOF so went=20
> with the simplest working solution.

Thanks, if there is a problem we can solve it one way or another. Don't
worry about it for now but when reviews are happy I might just need help
to test it doesn't interfere with your machine.

Thanks,
Nick

