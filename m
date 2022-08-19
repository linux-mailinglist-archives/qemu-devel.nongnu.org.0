Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3206B599EE3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 18:11:14 +0200 (CEST)
Received: from localhost ([::1]:60652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4aW-0002Yt-4c
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 12:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oP4Ur-0004qu-5k; Fri, 19 Aug 2022 12:05:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oP4Uo-0001vB-6z; Fri, 19 Aug 2022 12:05:20 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JFgFkI032435;
 Fri, 19 Aug 2022 16:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=NEvYP2DD0eFFWX2+Idvb4wjEourScNjtKP6ZPLOkqAk=;
 b=EOgA2MgDTvoC/MpwG+WdO+ctlsMLIVBtNiACb8BxvLjAnPVj1cTZy63K6xpuzncaKzDZ
 8ls7QeTZ0qeESuVQcn5gTCPkRm0L1PEA3PPBfZ5D5cwQGxBl9kUwgQ8n2ne+QLXi9Jdw
 drapmscefplJs5epAjEcSKlP4u7P4XqPR5Ushx2E4l3k69X0yIfcl+A5sVDaa/X8a8SH
 WUGV9awEVteKYvi9V2dfQqn5R6SBFY3aZB/JL6B69sOXYvvjst2LmDRPzfSH7Wrgxkcz
 TZaLFqb/AXa6BLUbuW34OcJKkny3mRLpwjXc0wVlbOUkMsh17USyymI6CROVZ4mCF/hC 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j2dcvrrce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 16:05:05 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27JFgT3D000445;
 Fri, 19 Aug 2022 16:05:05 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j2dcvrrap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 16:05:05 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27JFasDA028548;
 Fri, 19 Aug 2022 16:05:03 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3hx3ka5sn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 16:05:03 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27JG52o831523198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Aug 2022 16:05:02 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C15CAAC05B;
 Fri, 19 Aug 2022 16:05:02 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1F77AC059;
 Fri, 19 Aug 2022 16:05:01 +0000 (GMT)
Received: from localhost (unknown [9.65.248.183])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 19 Aug 2022 16:05:01 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 06/13] target/ppc: remove embedded interrupts from
 ppc_pending_interrupt_p9
In-Reply-To: <3a56bdae-6fd1-852f-e3c3-f992c4eda22f@eldorado.org.br>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
 <20220815162020.2420093-7-matheus.ferst@eldorado.org.br>
 <8735dx6w0y.fsf@linux.ibm.com>
 <3a56bdae-6fd1-852f-e3c3-f992c4eda22f@eldorado.org.br>
Date: Fri, 19 Aug 2022 13:04:59 -0300
Message-ID: <87tu68jk2c.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: etgTyxsc8qhXb8fPX0HVjw1_Bxu3ObEz
X-Proofpoint-ORIG-GUID: Z-tUcEuPHbFw4F98vPlC13T-FapT1vZy
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_08,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208190057
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

"Matheus K. Ferst" <matheus.ferst@eldorado.org.br> writes:

> On 15/08/2022 18:23, Fabiano Rosas wrote:
>> Matheus Ferst <matheus.ferst@eldorado.org.br> writes:
>>=20
>>> Critical Input, Watchdog Timer, and Fixed Interval Timer are only
>>> defined for embedded CPUs. The Programmable Interval Timer is 40x-only.
>>>
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> ---
>>>   target/ppc/excp_helper.c | 18 ------------------
>>>   1 file changed, 18 deletions(-)
>>>
>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>> index 2ca6a917b2..42b57019ba 100644
>>> --- a/target/ppc/excp_helper.c
>>> +++ b/target/ppc/excp_helper.c
>>> @@ -1780,28 +1780,10 @@ static int ppc_pending_interrupt_p9(CPUPPCState=
 *env)
>>>               return PPC_INTERRUPT_EXT;
>>>           }
>>>       }
>>> -    if (FIELD_EX64(env->msr, MSR, CE)) {
>>> -        /* External critical interrupt */
>>> -        if (env->pending_interrupts & PPC_INTERRUPT_CEXT) {
>>> -            return PPC_INTERRUPT_CEXT;
>>> -        }
>>> -    }
>>>       if (async_deliver !=3D 0) {
>>> -        /* Watchdog timer on embedded PowerPC */
>>> -        if (env->pending_interrupts & PPC_INTERRUPT_WDT) {
>>> -            return PPC_INTERRUPT_WDT;
>>> -        }
>>>           if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
>>>               return PPC_INTERRUPT_CDOORBELL;
>>>           }
>>=20
>> This one too.
>>=20
>> And the Thermal.
>
> There are some other interrupts that I was not sure if we should remove:

I would keep them simply because that is an unrelated cleanup. Here you
are removing the ones that are not present in those CPUs at all. I think
the discussion about how/what QEMU emulates is a different one. If we
determine that they are indeed not used and that is not a mistake, we
could replace them with a placeholder comment or even some explanation
of why we don't need them.

> - PPC_INTERRUPT_PERFM doesn't seem to be used anywhere else. I guess it=20
> will be used when we implement more PMU stuff, so I left it in all=20
> ppc_pending_interrupt_* methods.
> - PPC_INTERRUPT_RESET was treated in cpu_has_work_POWER*, but AFAICS,=20
> it's only used in ppc6xx_set_irq and ppc970_set_irq, which means it can=20
> only be raised on 6xx, 7xx, 970, and POWER5+. Should we remove it too?

I'm not sure if we have an external interrupt source that affects the
CPU like that. I see that we simply call powerpc_excp to reset the CPUs
when we need it.

C=C3=A9dric, any thoughts?

>>=20
>>> -        /* Fixed interval timer on embedded PowerPC */
>>> -        if (env->pending_interrupts & PPC_INTERRUPT_FIT) {
>>> -            return PPC_INTERRUPT_FIT;
>>> -        }
>>> -        /* Programmable interval timer on embedded PowerPC */
>>> -        if (env->pending_interrupts & PPC_INTERRUPT_PIT) {
>>> -            return PPC_INTERRUPT_PIT;
>>> -        }
>>>           /* Decrementer exception */
>>>           if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
>>>               return PPC_INTERRUPT_DECR;
>
> T=E1=B8=A7anks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

