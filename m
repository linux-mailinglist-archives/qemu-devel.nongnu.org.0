Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0225F3428
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 19:08:02 +0200 (CEST)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofOvA-0000QA-Gb
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 13:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ofOnK-00067w-Ia; Mon, 03 Oct 2022 12:59:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33918
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ofOnI-0005jy-BR; Mon, 03 Oct 2022 12:59:54 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 293Gcwml000745;
 Mon, 3 Oct 2022 16:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=o2nm/bnUbaaY7Cq68arj+2UqAMadZ1TgWqGrgrUXZjw=;
 b=ByD7Yk7ppOJXFYg2zz0JU4b5AUnmmusi4lnuK3A7p206/r9fHg365VXy9m17l82YXoPY
 RnN+JcbsTHk98kUYKo0he1K+ssOpYWtzXEvMtJq1xkqZMKt0WkUbrg25ASVDZFgp4aEW
 6S+VIBWvPmMSXl/ZX+A6CPti3qK9WEA3HFrARmP2786CAmpK+PHq7NRtI3kQbhS0X4gF
 GHx9gyvpmbfscbmjikZVLPt9gaRHHjxOpNIw8RFhVydSjYB9NHlflUh8B+jsUryCB7bN
 vNHFidr05P67iUkF0sqNpIDcdqLXJCLx8NX5sdFVWGHcsYiqA1eOejDQAhVCdtrmyhMz 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jywexc9rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 16:59:39 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 293GmSTw008932;
 Mon, 3 Oct 2022 16:59:39 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jywexc9r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 16:59:39 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 293Gok7u014602;
 Mon, 3 Oct 2022 16:59:38 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 3jxd69efsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 16:59:38 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 293Gxb0p2294460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Oct 2022 16:59:37 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8792358043;
 Mon,  3 Oct 2022 16:59:37 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5A0F58059;
 Mon,  3 Oct 2022 16:59:36 +0000 (GMT)
Received: from localhost (unknown [9.160.178.216])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Mon,  3 Oct 2022 16:59:36 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org
Subject: Re: [RFC PATCH v2 09/29] target/ppc: remove generic architecture
 checks from p9_deliver_interrupt
In-Reply-To: <b891d13a-fcdf-c182-4941-7ccfa4e2335d@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <20220927201544.4088567-10-matheus.ferst@eldorado.org.br>
 <87r0zs688j.fsf@linux.ibm.com>
 <b891d13a-fcdf-c182-4941-7ccfa4e2335d@eldorado.org.br>
Date: Mon, 03 Oct 2022 13:59:34 -0300
Message-ID: <87czb86dxl.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fIXBQ_JcJos_-8aroBSGkXwc0NmMfLjy
X-Proofpoint-GUID: DSN0Kqyl9T8A6-e6nXfnCYuaAUs8a6gE
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 malwarescore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=783 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210030099
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Matheus K. Ferst" <matheus.ferst@eldorado.org.br> writes:

> On 30/09/2022 15:13, Fabiano Rosas wrote:
>> Matheus Ferst <matheus.ferst@eldorado.org.br> writes:
>> 
>>> No functional change intended.
>>>
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> ---
>>>   target/ppc/excp_helper.c | 9 +--------
>>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>>
>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>> index 603c956588..67e73f30ab 100644
>>> --- a/target/ppc/excp_helper.c
>>> +++ b/target/ppc/excp_helper.c
>>> @@ -1919,18 +1919,11 @@ static void p9_deliver_interrupt(CPUPPCState *env, int interrupt)
>>>           break;
>>>
>>>       case PPC_INTERRUPT_DECR: /* Decrementer exception */
>>> -        if (ppc_decr_clear_on_delivery(env)) {
>>> -            env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
>>> -        }
>> 
>> Maybe I'm missing something, but this should continue to clear the bit,
>> no? Same comment for P8.
>> 
>
> ppc_decr_clear_on_delivery returns true if (env->tb_env->flags & 
> (PPC_DECR_UNDERFLOW_TRIGGERED | PPC_DECR_UNDERFLOW_LEVEL)) ==
> PPC_DECR_UNDERFLOW_TRIGGERED, i.e., PPC_DECR_UNDERFLOW_TRIGGERED is set 
> and PPC_DECR_UNDERFLOW_LEVEL is clear. All Book3S CPU have a level 
> triggered interrupt, so the method return false.

You're right, I misread the code.

>
> Thanks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>







