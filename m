Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B04A487828
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 14:22:15 +0100 (CET)
Received: from localhost ([::1]:53196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5pCA-000829-7F
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 08:22:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5p9a-00079B-GV; Fri, 07 Jan 2022 08:19:34 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5p9Y-0007KQ-FI; Fri, 07 Jan 2022 08:19:34 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207DFuY5015838; 
 Fri, 7 Jan 2022 13:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qDUz0VFXR+F9BCPRuJ8ZQTFI/dPmKKbqlf7cMv+3j80=;
 b=oNQpsynfCygfRzy3vyhg2olk3QU7EJ5jN2rsUaGQvoexEAMDbdL1KgPqsvp5cJXCMIVP
 nCyjpJCrZKVglIhdBZTKLM0Pnf46lZqpizEegc3fNVvw0UNRTi/V3/aUvRFvx3i0mOlu
 tuwzk9loU97Y2HRuvS4r/DvkSZ43qHQ5WJEXrYb9UgDYaOQqehwItCEhU0BxSyS9ZGdK
 daBrEAvSv3jNnODzm9bCVvYgVFlI1TMGaw7Killz8eFVfp6uiQTcjdC4RzxKj03XIAx6
 nwZ8idasUHYhNR2ZZirplvozFjMomCovbusXvwznQ4F6dFWyCgqcSQ4/WNAigKYpA0/Y Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wj9cuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 13:19:13 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207D9Ps5020306;
 Fri, 7 Jan 2022 13:19:12 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wj9cud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 13:19:12 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207DDCg0017191;
 Fri, 7 Jan 2022 13:19:11 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3de4xfm74n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 13:19:11 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207DJArA26280364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 13:19:10 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D9E578068;
 Fri,  7 Jan 2022 13:19:10 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6DB07805E;
 Fri,  7 Jan 2022 13:19:09 +0000 (GMT)
Received: from localhost (unknown [9.211.33.229])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  7 Jan 2022 13:19:09 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the
 G4 family
In-Reply-To: <0dbc9805-e08b-2190-8c1b-2a9e4081c02e@kaod.org>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <4fe55b44-6549-04d7-b381-aee88499d6a3@ilande.co.uk>
 <115484b4-63ff-a40f-050a-931ba988688e@kaod.org>
 <c60ce410-d9d2-c245-ab19-1af638babd63@ilande.co.uk>
 <87ilwfqesw.fsf@linux.ibm.com>
 <095292e8-f715-309d-67dc-3dc290a59d95@kaod.org>
 <874k7vq8ug.fsf@linux.ibm.com>
 <0dbc9805-e08b-2190-8c1b-2a9e4081c02e@kaod.org>
Date: Fri, 07 Jan 2022 10:19:07 -0300
Message-ID: <877dbb3cqc.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jm4D252U6PwbLYSAfEahgk8dG2PPpIqC
X-Proofpoint-ORIG-GUID: hcQa2783wP64gkTu6W-66PkwjqDgSru3
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_04,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070090
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 11/29/21 16:28, Fabiano Rosas wrote:
>> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>=20
>>>>> Right. If we're doing this to say "I can boot a kernel with a 7450 cp=
u in QEMU" but
>>>>> the implementation is different from real hardware, then I'm not sure=
 what the real
>>>>> value is. That effectively leaves option b) if someone is willing to =
do the work, or
>>>>> as you say to simply remove the code from QEMU.
>>>>
>>>> Yeah, that is a good point. Although the software TLB is well containe=
d,
>>>> so we could certainly document that our 7450s don't have that feature
>>>> and call it a day. Does QEMU have any policy on how much of a machine =
is
>>>> required to be implemented?
>>>>
>>>> I am more inclined to apply c) for now as I said, just to have some co=
de
>>>> running on the CPU and maybe document in a gitlab issue that we're
>>>> lacking the runtime switch and eventually implement that. It's not like
>>>> this is high traffic code anyway. It has been broken for 10+ years.
>>>>
>>>> That said, if C=C3=A9dric and Daniel see more value in moving the 7450=
s to
>>>> the POWERPC_MMU_32B I won't oppose.
>>>
>>> I am in favor of dropping unused code in QEMU and keeping the CPUs for
>>> which we have support in Linux using the POWERPC_MMU_32B in QEMU and the
>>> openbios patch. If we need SoftTLB support for the 74x CPUs in QEMU, we
>>> can always dig in the history.
>>=20
>> Ack. I'll send a v2.
>>=20
>>>
>>> We can give FreeBSB a try also since they had support for the G4 :
>>>
>>>     https://people.freebsd.org/~arved/stuff/minimac
>>>
>>>
>>> With the openbios patch, Linux boots fine under 7450, 7455, 7447 CPUs.
>>>
>>> Under 7448, it drops in xmon with a :
>>>=20=20=20=20
>>> kernel tried to execute exec-protected page (c07fdd98) - exploit attemp=
t? (uid: 0)
>>> BUG: Unable to handle kernel instruction fetch
>>> Faulting instruction address: 0xc07fdd98
>>> Vector: 400 (Instruction Access) at [f1019d30]
>>>       pc: c07fdd98: __do_softirq+0x0/0x2f0
>>>       lr: c00516a4: irq_exit+0xbc/0xf8
>>>       sp: f1019df0
>>>      msr: 10001032
>>>     current =3D 0xc0d00000
>>>       pid   =3D 1, comm =3D swapper
>>=20
>> I see two possible issues:
>>=20
>> 1) The 7448 is configured as a 7400 in QEMU (cpu-models.c), so it will
>> behave differently from the 7450s. The user manual seems to indicate it
>> is closer to a 7445 than a 7400. We need to double check what is correct.
>>=20
>> 2) OpenBIOS already has support for the 7448 PVR without my patch, but
>> given that no other cpu of the 7450 family is supported, I'd say this is
>> accidental. The mask that OpenBIOS uses for e600/MPC86xx is:
>>=20
>>          .iu_version =3D 0x80040000,
>>          .name =3D "PowerPC,MPC86xx",
>>=20
>> And the verification:
>>=20
>>      iu_version =3D mfpvr() & 0xffff0000;
>>=20
>>      for (i =3D 0; i < sizeof(ppc_defs) / sizeof(struct cpudef); i++) {
>>          if (iu_version =3D=3D ppc_defs[i].iu_version)
>>              return &ppc_defs[i];
>>      }
>>      printk("Unknown cpu (pvr %x), freezing!\n", iu_version);
>>=20
>> But QEMU says the PVRs are as follows:
>>=20
>>      CPU_POWERPC_e600               =3D 0x80040010,
>> #define CPU_POWERPC_MPC8610          CPU_POWERPC_e600
>> #define CPU_POWERPC_MPC8641          CPU_POWERPC_e600
>> #define CPU_POWERPC_MPC8641D         CPU_POWERPC_e600
>>=20
>>      CPU_POWERPC_7448_v10           =3D 0x80040100,
>>      CPU_POWERPC_7448_v11           =3D 0x80040101,
>>      CPU_POWERPC_7448_v20           =3D 0x80040200,
>>      CPU_POWERPC_7448_v21           =3D 0x80040201,
>>=20
>> So by applying the mask, OpenBIOS is matching both 0x80040100 and
>>   0x80040010 when it looks like it only wants to match the latter.
>
> Hello,
>
> a quick status on how QEMU has evolved regarding this topic.
>
> We have merged :
>
>    a09410ed1fb8 ("target/ppc: Remove the software TLB model of 7450 CPUs")
>
> and switched MMU model to POWERPC_MMU_32B in :
>
>    1da666cd8e79 ("target/ppc: Disable software TLB for the 7450 family")
>
> With the two patches of this series, we can boot the latest linux on all
> 7450 CPUs. With an extra small fix on the CPU table, 7448 boots.

A small correction, we only need OpenBIOS to include patch 2: "ppc: Add
PVRs for the MPC7450 family".


