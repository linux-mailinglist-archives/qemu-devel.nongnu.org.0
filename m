Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CF6461AED
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 16:32:03 +0100 (CET)
Received: from localhost ([::1]:35040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mridO-00006Q-QP
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 10:32:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mriaq-0007WB-II; Mon, 29 Nov 2021 10:29:24 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26786
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mriao-0002h4-63; Mon, 29 Nov 2021 10:29:24 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATFH0rc001563; 
 Mon, 29 Nov 2021 15:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=NEM/vi2NhuUUs0SEwsFVXJ2Nqna8iZIKmHSCRCcaaaw=;
 b=Hjk1cYc7Wb0F0XeiSkIQfMXDnvVV6alXBqYEdd0q4sjYnMbUtvee7eqX0zYER1YCm9jg
 LC1TVBP7kSDSNZLCpZOcl0DXR/jSg+CGXA2TeXgO9SXRtOksAsbpC3U2j4kydgzDWpZe
 LZ3N1TrNGGsvqfHF2buR9m6gnBQk1wtoAbvURHAR1yf5yHIOhrPReCczb2zjrGU9R75W
 SCRgH98oJF2wUm8e2f3oRFtFdeUTlOi2umtUyyfqDiB+Wzq2EkgaYE+jqvoN4ThlzO6t
 uQMtjXavEFNhN2ybpzBjOIa2ZyCecHiilXx3+fVpoKyUoZaAsC8pgkwy9m99/jwjHfTG Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn1ca089y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 15:29:02 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATFLfoT022253;
 Mon, 29 Nov 2021 15:29:01 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn1ca089h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 15:29:01 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATFI5xS020317;
 Mon, 29 Nov 2021 15:29:01 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3ckcaa4mxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 15:29:00 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATFT0kv46334374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 15:29:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E28FAC062;
 Mon, 29 Nov 2021 15:29:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0195FAC059;
 Mon, 29 Nov 2021 15:28:58 +0000 (GMT)
Received: from localhost (unknown [9.211.119.53])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 29 Nov 2021 15:28:58 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the
 G4 family
In-Reply-To: <095292e8-f715-309d-67dc-3dc290a59d95@kaod.org>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <4fe55b44-6549-04d7-b381-aee88499d6a3@ilande.co.uk>
 <115484b4-63ff-a40f-050a-931ba988688e@kaod.org>
 <c60ce410-d9d2-c245-ab19-1af638babd63@ilande.co.uk>
 <87ilwfqesw.fsf@linux.ibm.com>
 <095292e8-f715-309d-67dc-3dc290a59d95@kaod.org>
Date: Mon, 29 Nov 2021 12:28:55 -0300
Message-ID: <874k7vq8ug.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4_2t62WB5V_0wCEc3Ol4zC1h9IQH5EsN
X-Proofpoint-ORIG-GUID: aXxtv7ttgHwgAFQrVdH86hvx6xpw7nIZ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_09,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290076
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: danielhb413@gmail.com, openbios@openbios.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

>>> Right. If we're doing this to say "I can boot a kernel with a 7450 cpu =
in QEMU" but
>>> the implementation is different from real hardware, then I'm not sure w=
hat the real
>>> value is. That effectively leaves option b) if someone is willing to do=
 the work, or
>>> as you say to simply remove the code from QEMU.
>>=20
>> Yeah, that is a good point. Although the software TLB is well contained,
>> so we could certainly document that our 7450s don't have that feature
>> and call it a day. Does QEMU have any policy on how much of a machine is
>> required to be implemented?
>>=20
>> I am more inclined to apply c) for now as I said, just to have some code
>> running on the CPU and maybe document in a gitlab issue that we're
>> lacking the runtime switch and eventually implement that. It's not like
>> this is high traffic code anyway. It has been broken for 10+ years.
>>=20
>> That said, if C=C3=A9dric and Daniel see more value in moving the 7450s =
to
>> the POWERPC_MMU_32B I won't oppose.
>
> I am in favor of dropping unused code in QEMU and keeping the CPUs for
> which we have support in Linux using the POWERPC_MMU_32B in QEMU and the
> openbios patch. If we need SoftTLB support for the 74x CPUs in QEMU, we
> can always dig in the history.

Ack. I'll send a v2.

>
> We can give FreeBSB a try also since they had support for the G4 :
>
>    https://people.freebsd.org/~arved/stuff/minimac
>
>
> With the openbios patch, Linux boots fine under 7450, 7455, 7447 CPUs.
>
> Under 7448, it drops in xmon with a :
>=20=20=20
> kernel tried to execute exec-protected page (c07fdd98) - exploit attempt?=
 (uid: 0)
> BUG: Unable to handle kernel instruction fetch
> Faulting instruction address: 0xc07fdd98
> Vector: 400 (Instruction Access) at [f1019d30]
>      pc: c07fdd98: __do_softirq+0x0/0x2f0
>      lr: c00516a4: irq_exit+0xbc/0xf8
>      sp: f1019df0
>     msr: 10001032
>    current =3D 0xc0d00000
>      pid   =3D 1, comm =3D swapper

I see two possible issues:

1) The 7448 is configured as a 7400 in QEMU (cpu-models.c), so it will
behave differently from the 7450s. The user manual seems to indicate it
is closer to a 7445 than a 7400. We need to double check what is correct.

2) OpenBIOS already has support for the 7448 PVR without my patch, but
given that no other cpu of the 7450 family is supported, I'd say this is
accidental. The mask that OpenBIOS uses for e600/MPC86xx is:

        .iu_version =3D 0x80040000,
        .name =3D "PowerPC,MPC86xx",

And the verification:

    iu_version =3D mfpvr() & 0xffff0000;

    for (i =3D 0; i < sizeof(ppc_defs) / sizeof(struct cpudef); i++) {
        if (iu_version =3D=3D ppc_defs[i].iu_version)
            return &ppc_defs[i];
    }
    printk("Unknown cpu (pvr %x), freezing!\n", iu_version);

But QEMU says the PVRs are as follows:

    CPU_POWERPC_e600               =3D 0x80040010,
#define CPU_POWERPC_MPC8610          CPU_POWERPC_e600
#define CPU_POWERPC_MPC8641          CPU_POWERPC_e600
#define CPU_POWERPC_MPC8641D         CPU_POWERPC_e600

    CPU_POWERPC_7448_v10           =3D 0x80040100,
    CPU_POWERPC_7448_v11           =3D 0x80040101,
    CPU_POWERPC_7448_v20           =3D 0x80040200,
    CPU_POWERPC_7448_v21           =3D 0x80040201,

So by applying the mask, OpenBIOS is matching both 0x80040100 and
 0x80040010 when it looks like it only wants to match the latter.

