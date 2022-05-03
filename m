Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A2051891F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:53:09 +0200 (CEST)
Received: from localhost ([::1]:57876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlupo-00013G-Bw
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nluns-0008Kn-Ve; Tue, 03 May 2022 11:51:08 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nlunq-0000eD-Mk; Tue, 03 May 2022 11:51:08 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243EjM4F025297;
 Tue, 3 May 2022 15:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=nERKUgDEzs2zpAXCcg/CLC+X3pRHlyLrFez0KyP/WL8=;
 b=NloIwScHsCtMF+ta/Xu3aWy0TwaPQoUX8Eja116ebdPj/yfK0JUyEsMwFhHgvWCyk6R9
 /ICsf0oomb8r7vwWolqVt3vvB/TTjxNiDrXzBJ8I7pdTRzvvCw+7SqptGeNfd8Vva4i4
 XRGQP0Y9tVLsuiQ02keOYlQIBGvFxUq9bO/GDMqFAiHKQeGuJ2A/sooU2rIEfNiIo3wv
 +kOwR8azQuUCq7T38VXUYU8jD0+GFyc7kHIT66GmdArY4VOQREo3bP/PQ1r7ZrjyIzNe
 c12E4zUCsiQpaYIKmGnGiTmcEil2WCttOrckK7tVRpiomqowTx6p0/JdGiSxvlg3yN1H sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fu6eg194g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 15:50:48 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 243FGcqj019042;
 Tue, 3 May 2022 15:50:47 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fu6eg1946-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 15:50:47 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 243Fbttg011628;
 Tue, 3 May 2022 15:50:46 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 3frvr9cv4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 15:50:46 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 243FojVw24052140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 May 2022 15:50:46 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3900AC062;
 Tue,  3 May 2022 15:50:45 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E40AAC05B;
 Tue,  3 May 2022 15:50:43 +0000 (GMT)
Received: from localhost (unknown [9.160.48.141])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  3 May 2022 15:50:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
In-Reply-To: <1651115246.n474cs6g92.astroid@bobo.none>
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
 <1d3aaac9-5aa1-9ff9-6b3c-5109ad7f4361@kaod.org>
 <33285ea7-8dba-3e24-d241-0ff541a83b12@eldorado.org.br>
 <1650503031.93xsvzlip3.astroid@bobo.none>
 <1651115246.n474cs6g92.astroid@bobo.none>
Date: Tue, 03 May 2022 12:50:31 -0300
Message-ID: <87pmkuaa48.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: a6TQbAIrR5ApklwP7wQx4FH4oD1ZqJTS
X-Proofpoint-GUID: OUOJZeZh_daTFJ2LurTLmOWeNlLi_T8e
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_06,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 bulkscore=0
 malwarescore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030107
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Nicholas Piggin <npiggin@gmail.com> writes:

> Excerpts from Nicholas Piggin's message of April 21, 2022 12:04 pm:
>> Excerpts from Leandro Lupori's message of April 21, 2022 4:09 am:
>>> On 4/18/22 17:22, C=C3=A9dric Le Goater wrote:
>>>> On 4/18/22 21:10, Leandro Lupori wrote:
>>>>> Add semihosting support for PPC64. This implementation is
>>>>> based on the standard for ARM semihosting version 2.0, as
>>>>> implemented by QEMU and documented in
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 https://github.com/ARM-software/abi-aa/relea=
ses
>>>>>
>>>>> The PPC64 specific differences are the following:
>>>>>
>>>>> Semihosting Trap Instruction: sc 7
>>>>> Operation Number Register: r3
>>>>> Parameter Register: r4
>>>>> Return Register: r3
>>>>> Data block field size: 64 bits
>>>>=20
>>>> 'sc' is a good way to implement semi hosting but we should make sure
>>>> that it is not colliding with future extensions, at least with the
>>>> next POWERPC processor. Is that the case ? if not, then the lev could
>>>> be reserved.
>>>>=20
>>>=20
>>> Power ISA 3.1B says that LEV values greater that 2 are reserved.
>>> Level 2 is the ultravisor, so I assumed that level 7 was far enough fro=
m=20
>>> current max level. I don't know if POWER11 will introduce new privilege=
=20
>>> levels. Is this info publicly available somewhere? Or do you have a=20
>>> better level in mind to use instead?
>>=20
>> It's not available but there are no plans to use LEV=3D7.
>>=20
>> It would be fine in practice I think, but it's kind of ugly and not=20
>> great precedent -- how would we find out all the projects which use=20
>> reserved instructions or values for something? Nominally the onus is on=
=20
>> the software to accept breakage, but in reality important software that
>> breaks causes a headache for the ISA.
>>=20
>> IBM's systemsim emulator actually has an instruction to call out to the=
=20
>> emulator to do various things like IO. It uses the opcode
>>=20
>>   .long 0x000eaeb0
>>=20
>> That is the primary op 0 reserved space, and there is actually another=20
>> op 'attn' or 'sp_attn' there which IBM CPUs implement, it is similar in=
=20
>> spirit (it calls out to the service processor and/or chip error handling=
=20
>> system to deal with a condition out-of-band). You don't want to use attn=
=20
>> here because the core under emulation might implement it, I'm just=20
>> noting the precedent with similar functionality under this primary=20
>> opcode.
>>=20
>> So I think the systemsim emulator instruction should be a good choice.=20
>> But it should really be documented. I will bring this up at the Open=20
>> Power ISA working group meeting next week and see what the options are=20
>> with getting it formally allocated for semihosting emulators (or what=20
>> the alternatives are).
>
> Update on the ISA TWG meeting
>
> Semihosting was well received, the idea is not so new so I think it was
> easily understood by attendees.
>
> There were no objections to allocating a new opcode for this purpose.
> The preference was a new opcode rather than using a reserved sc LEV
> value.
>
> The primary opcode 0 space is possibly unsuitable because it is said
> to be "allocated to specific purposes that are outside the scope of the
> Power ISA." whereas I think we want a first class instruction for this,
> it may have implementation-dependent behaviour but on processors that
> do not implement it, we would like it to have well-defined behaviour.
>
> So we can probably just pick an opcode and submit a patch RFC to the
> ISA (I can try help with that). First, there are a few questions to
> resolve:
>
> - What behaviour do we want for CPUs which do not implement it or
>   disable it? E.g., no-op or illegal instruction interrupt. Ideally
>   we would choose an opcode such that the architecture is compatible
>   with existing CPUs.

I think that since semihosting is not a one-shot thing it would be
better to have it trap so that the "host" could remediate in some
way. Or even carry on with servicing the semihosting anyway.

> - Would it be useful for KVM to implement semihosting support for
>   guests on hard processors?

Are there any undesirable implications to using an instruction that
traps to the HV? I'd say let's get it if we can but otherwise it's not a
big deal.

I had two use-cases in mind:

1) Improving our interactions with gdbstub and having the guest use
   sys_exit to report some debugging events like watchpoints or
   singlestep;

2) Bootstrapping with KVM. We had instances in the past of needing to
   write guest code from scratch and having to rely solely in GDB for a
   while before setting up the console.

But I realise that these use-cases conflate semihosting with general
debugging and regular PAPR features, respectively. So it might be a
stretch.

> - Is there value in an endian-agnostic instruction? (Assuming we can
>   find one). This question only comes to me because our BMC gdbserver
>   for debugging the host CPUs implements breakpoints by inserting an
>   'attn' instruction in the host code, and that does not work if the
>   host switches endian. Any possibility the semihosting instruction
>   would ever be injected out-of-band? Seems not so likely.

Semihosting requires some sort of register setup, I don't think having
it done out-of-band would be practical. So we possibly don't need an
endian-agnostic instruction.

> There were also some thoughts about bringing the semihosting spec
> under the Open Power group but that's outside the scope of the ISA
> group. This may be a possibility we could consider but I think for
> now it should be enough to document it like riscv and put it
> somewhere (even in the QEMU tree should be okay for now IMO).
>
> Thanks,
> Nick

