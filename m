Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983A645EDF3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:34:28 +0100 (CET)
Received: from localhost ([::1]:38532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqaQt-0005Em-GM
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:34:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mqaO3-0004Bu-77; Fri, 26 Nov 2021 07:31:31 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mqaO0-0005rA-Ib; Fri, 26 Nov 2021 07:31:30 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AQBqX8Z023280; 
 Fri, 26 Nov 2021 12:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=2VnavQzjdAZVS3yXSUOtOqde0STMXwUqUEgCsZvYzcE=;
 b=SgvWqip2H1sbbyhlxWwMBNDBCnro3apA+BHEoCDI+jm6e0YiGm9DnmOCt4Tvz+3wVl2b
 v1WDg2/T93K9LtyB8WsNZ3w+QSg2Carr4cv0ZmcEEhYasslOprLF9+MGPoro6LdzpwIu
 WHlGQZig0UWEsMpI+rGyX5SLrycC1EELKjsMmwJhp4fxr2ZYJVZjxHi19ZMmDFKpJb7y
 UDV09APzocdmG3rQ4kwh32bjAn+65O0khpa2ybNx0hfAbU0ueseAz8gc54s3y3WhKZqx
 F1iOulPhxG/WCiSQTG1nhN4s6ZY6SFsqgBa0v46+ku+YG0VypViIVKi5f+3xdp1UIRxB NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cjy3cgsre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 12:31:17 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AQCUpSK001689;
 Fri, 26 Nov 2021 12:31:16 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cjy3cgsr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 12:31:16 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AQCIHmv023019;
 Fri, 26 Nov 2021 12:31:15 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 3cernc1c1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 12:31:15 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AQCVFWx22217546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Nov 2021 12:31:15 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 263AAAE064;
 Fri, 26 Nov 2021 12:31:15 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57569AE05C;
 Fri, 26 Nov 2021 12:31:14 +0000 (GMT)
Received: from localhost (unknown [9.211.89.149])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 26 Nov 2021 12:31:13 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?utf-8?Q?C=C3=A9dri?=
 =?utf-8?Q?c?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the
 G4 family
In-Reply-To: <c60ce410-d9d2-c245-ab19-1af638babd63@ilande.co.uk>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <4fe55b44-6549-04d7-b381-aee88499d6a3@ilande.co.uk>
 <115484b4-63ff-a40f-050a-931ba988688e@kaod.org>
 <c60ce410-d9d2-c245-ab19-1af638babd63@ilande.co.uk>
Date: Fri, 26 Nov 2021 09:31:11 -0300
Message-ID: <87ilwfqesw.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Q6uAgtXFUFcdqYFO8Z0hz1tVwO-JLw39
X-Proofpoint-GUID: cw7qWIQAn_Uky7mev770AZbZLTSuIUyG
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_03,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111260074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: openbios@openbios.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 26/11/2021 08:40, C=C3=A9dric Le Goater wrote:
>
>> On 11/26/21 09:01, Mark Cave-Ayland wrote:
>>> On 24/11/2021 22:00, Fabiano Rosas wrote:
>>>
>>>> Fabiano Rosas <farosas@linux.ibm.com> writes:
>>>>
>>>>> Hi all,
>>>>>
>>>>> We have this bug in QEMU which indicates that we haven't been able to
>>>>> run openbios on a 7450 cpu for quite a long time:
>>>>>
>>>>> https://gitlab.com/qemu-project/qemu/-/issues/86
>>>>>
>>>>> OK:
>>>>> =C2=A0=C2=A0 $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 74=
10
>>>>>
>>>>> =C2=A0=C2=A0 >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>> =C2=A0=C2=A0 >> OpenBIOS 1.1 [Nov 1 2021 20:36]
>>>>> =C2=A0=C2=A0 ...
>>>>>
>>>>> NOK:
>>>>> =C2=A0=C2=A0 $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 74=
50 -d int
>>>>> =C2=A0=C2=A0 Raise exception at fff08cc4 =3D> 0000004e (00)
>>>>> =C2=A0=C2=A0 QEMU: Terminated
>>>>>
>>>>> The actual issue is straightforward. There is a non-architected
>>>>> feature that QEMU has enabled by default that openbios doesn't know
>>>>> about. From the user manual:
>>>>>
>>>>> "The MPC7540 has a set of implementation-specific registers,
>>>>> exceptions, and instructions that facilitate very efficient software
>>>>> searching of the page tables in memory for when software table
>>>>> searching is enabled (HID0[STEN] =3D 1). This section describes those
>>>>> resources and provides three example code sequences that can be used
>>>>> in a MPC7540 system for an efficient search of the translation tables
>>>>> in software. These three code sequences can be used as handlers for
>>>>> the three exceptions requiring access to the PTEs in the page tables
>>>>> in memory in this case-instruction TLB miss, data TLB miss on load,
>>>>> and data TLB miss on store exceptions."
>>>>>
>>>>> The current state:
>>>>>
>>>>> 1) QEMU does not check HID0[STEN] and makes the feature always enabled
>>>>> by setting these cpus with the POWERPC_MMU_SOFT_74xx MMU model,
>>>>> instead of the generic POWERPC_MMU_32B.
>>>>>
>>>>> 2) openbios does not recognize the PVRs for those cpus and also does
>>>>> not have any handlers for the software TLB exceptions (vectors 0x1000,
>>>>> 0x1100, 0x1200).
>>>>>
>>>>> Some assumptions (correct me if I'm wrong please):
>>>>>
>>>>> - openbios is the only firmware we use for the following cpus: 7441,
>>>>> 7445, 7450, 7451, 7455, 7457, 7447, 7447a, 7448.
>>>>> - without openbios, we cannot have a guest running on these cpus.
>>>>>
>>>>> So to bring 7450 back to life we would need to either:
>>>>>
>>>>> a) find another firmware/guest OS code that supports the feature;
>>>>>
>>>>> b) implement the switching of the feature in QEMU and have the guest
>>>>> code enable it only when supported. That would take some fiddling with
>>>>> the MMU code to: merge POWERPC_MMU_SOFT_74xx into POWERPC_MMU_32B,
>>>>> check the HID0[STEN] bit, figure out how to switch from HW TLB miss to
>>>>> SW TLB miss on demand, block access to the TLBMISS register (and
>>>>> others) when the feature is off, and so on;
>>>>>
>>>>> c) leave the feature enabled in QEMU and implement the software TLB
>>>>> miss handlers in openbios. The UM provides sample code, so this is
>>>>> easy;
>>>>>
>>>>> d) remove support for software TLB search for the 7450 family and
>>>>> switch the cpus to the POWERPC_MMU_32B model. This is by far the
>>>>> easiest solution, but could cause problems for any (which?) guest OS
>>>>> code that actually uses the feature. All of the existing code for the
>>>>> POWERPC_MMU_SOFT_74xx MMU model would probably be removed since it
>>>>> would be dead code then;
>>>>>
>>>>> Option (c) seemed to me like a good compromise so this is a patch
>>>>> series for openbios doing that and also adding the necessary PVRs so
>>>>> we can get a working guest with these cpus without too much effort.
>>>>>
>>>>> I have also a patch for QEMU adding basic sanity check tests for the
>>>>> 7400 and 7450 families. I'll send that separately to the QEMU ml.
>>>>>
>>>>> Fabiano Rosas (2):
>>>>> =C2=A0=C2=A0 ppc: Add support for MPC7450 software TLB miss interrupts
>>>>> =C2=A0=C2=A0 ppc: Add PVRs for the MPC7450 family
>>>>>
>>>>> =C2=A0 arch/ppc/qemu/init.c=C2=A0 |=C2=A0 52 ++++++++++
>>>>> =C2=A0 arch/ppc/qemu/start.S | 236 ++++++++++++++++++++++++++++++++++=
+++++++-
>>>>> =C2=A0 2 files changed, 285 insertions(+), 3 deletions(-)
>>>>
>>>> (Adding Mark because his email got somehow dropped from the original
>>>> message)
>>>
>>>> So with these patches in OpenBIOS we could get a bit further and call
>>>> into the Linux kernel using the same image as the one used for the
>>>> 7400. However there seems to be no support for the 7450 software TLB in
>>>> the kernel. There are only handlers for the 4xx, 8xx and 603 which are
>>>> different code altogether. There's no mention of the TLBMISS and
>>>> PTEHI/LO registers in the code as well.
>>>>
>>>> Do we know of any guest OS that implements the 7450 software TLB at
>>>> vectors 0x1000, 0x1100 and 0x1200? Otherwise replacing the
>>>> POWERPC_MMU_SOFT_74xx model with POWERPC_MMU_32B might be the only way
>>>> of getting an OS to run in the 7450 family.
>>>
>>> My experience of anything other than the default CPUs used on the PPC M=
ac machines=20
>>> is basically zero, so you're certainly in new territory :)
>>>
>>> I could live with your proposed solution c) although it would be nice t=
o guard the=20
>>> extra vectors so that they remain uninitialised for the non-7450 CPUs. =
My main=20
>>> question is if the kernel itself doesn't support software TLBs then doe=
s adding the=20
>>> new code help at all?=20

The point of c) is to allow _something_ to run on the CPU with software
TLB enabled. I think that would be enough to make sure the code doesn't
rot too much. So more of a maintenance concern.

About improving the OpenBIOS patch, no worries, I can certainly do that
once we define a course of action.

>>=20
>> yes, it helps to boot Linux and MacOS (9 and 10) on those CPUs but you s=
till
>> need to replace the mmu model to POWERPC_MMU_32B in QEMU.
>>=20
>>> Or are you eventually planning for solution b) to improve QEMU's 7450 C=
PU emulation=20
>>> for developers without real hardware?
>>=20
>> b) would be nice to have but since we don't have any images using it, may
>> be it's time to drop support from QEMU.
>
> Right. If we're doing this to say "I can boot a kernel with a 7450 cpu in=
 QEMU" but=20
> the implementation is different from real hardware, then I'm not sure wha=
t the real=20
> value is. That effectively leaves option b) if someone is willing to do t=
he work, or=20
> as you say to simply remove the code from QEMU.

Yeah, that is a good point. Although the software TLB is well contained,
so we could certainly document that our 7450s don't have that feature
and call it a day. Does QEMU have any policy on how much of a machine is
required to be implemented?

I am more inclined to apply c) for now as I said, just to have some code
running on the CPU and maybe document in a gitlab issue that we're
lacking the runtime switch and eventually implement that. It's not like
this is high traffic code anyway. It has been broken for 10+ years.

That said, if C=C3=A9dric and Daniel see more value in moving the 7450s to
the POWERPC_MMU_32B I won't oppose.

>
>
> ATB,
>
> Mark.

