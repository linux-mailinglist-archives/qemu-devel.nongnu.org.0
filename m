Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E170593A91
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 22:11:38 +0200 (CEST)
Received: from localhost ([::1]:33998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNgQz-0007H9-Gs
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 16:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oNgP3-0005cu-AG; Mon, 15 Aug 2022 16:09:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oNgOz-00084A-0E; Mon, 15 Aug 2022 16:09:35 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FK615t014898;
 Mon, 15 Aug 2022 20:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=lqLcZfLMSe+DABbKi1YJWSu4XxEy7BLyMGaGOHTpU/E=;
 b=TAgsRYPMn6XccgRo8y2ENFkEgEKdvDszhFQe55uyV8gRQqr2noSA4jvPTTxjB12Mlekj
 i/khZHtjrf+eSytrDcdkx1K/COOjgB0mUjC1fyT3ZINjJkc4e2vBMxAEDYbTsV3RWBQb
 1L2ifWxGWr3DZuIAGIS5eD4hBDnFxVVDk/LeWlJhRsUHnL+NQr8cZkhJveyihgqfLnPq
 +obQ7MuK+muJHQ+LP5voEala+cREbgX/3NAXIh6fvwPin0ArFvTfIQQ41bYSMr9sG9Id
 6etlj8xJhLNeoSMO13sf21X1H4nwXmGJEMXHjyDo7+cl5292eRodoBWpmYwOoQvce9O0 cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hyvb5gyph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 20:09:19 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27FK7dua019980;
 Mon, 15 Aug 2022 20:09:19 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hyvb5gyp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 20:09:19 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27FK5cbr028444;
 Mon, 15 Aug 2022 20:09:18 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3hx3k9sb8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 20:09:18 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27FK9HPw59507140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Aug 2022 20:09:17 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A7AFAC05B;
 Mon, 15 Aug 2022 20:09:17 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F38EEAC059;
 Mon, 15 Aug 2022 20:09:16 +0000 (GMT)
Received: from localhost (unknown [9.160.104.128])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 15 Aug 2022 20:09:16 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH 03/13] target/ppc: move interrupt masking out of
 ppc_hw_interrupt
In-Reply-To: <20220815162020.2420093-4-matheus.ferst@eldorado.org.br>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
 <20220815162020.2420093-4-matheus.ferst@eldorado.org.br>
Date: Mon, 15 Aug 2022 17:09:15 -0300
Message-ID: <87a6856zh0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O9D4b4Z9u7wsxN9qgBG-h-Jcbq_pmT3i
X-Proofpoint-ORIG-GUID: Sw5cpQo8GsDV1jDQE1pHsMKg3MTUPjJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1011 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208150077
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> Move the interrupt masking logic to a new method, ppc_pending_interrupt,
> and only handle the interrupt processing in ppc_hw_interrupt.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  target/ppc/excp_helper.c | 228 ++++++++++++++++++++++++---------------
>  1 file changed, 141 insertions(+), 87 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c

<snip>

> @@ -1884,15 +1915,38 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      PowerPCCPU *cpu = POWERPC_CPU(cs);
>      CPUPPCState *env = &cpu->env;
> +    int pending_interrupt;

I would give this a simpler name to avoid confusion with the other two
pending_interrupt terms.

>  
> -    if (interrupt_request & CPU_INTERRUPT_HARD) {
> -        ppc_hw_interrupt(env);
> -        if (env->pending_interrupts == 0) {
> -            cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
> -        }
> -        return true;
> +    if ((interrupt_request & CPU_INTERRUPT_HARD) == 0) {
> +        return false;
>      }
> -    return false;
> +

It seems we're assuming that after this point we certainly have some
pending interrupt...

> +    pending_interrupt = ppc_pending_interrupt(env);
> +    if (pending_interrupt == 0) {

...but how then is this able to return 0? Could the function's name be
made a bit clearer? Maybe interrupt = ppc_next_pending_interrupt or
something to that effect.

> +        if (env->resume_as_sreset) {
> +            /*
> +             * This is a bug ! It means that has_work took us out of halt
> +             * without anything to deliver while in a PM state that requires
> +             * getting out via a 0x100
> +             *
> +             * This means we will incorrectly execute past the power management
> +             * instruction instead of triggering a reset.
> +             *
> +             * It generally means a discrepancy between the wakeup conditions in
> +             * the processor has_work implementation and the logic in this
> +             * function.
> +             */
> +            cpu_abort(env_cpu(env),
> +                      "Wakeup from PM state but interrupt Undelivered");

This condition is BookS only. Perhaps it would be better to move it
inside each of the processor-specific functions. And since you're
merging has_work with pending_interrupts, can't you solve that issue
earlier? Specifically the "has_work tooks us out of halt..." part.

> +        }
> +        return false;
> +    }
> +
> +    ppc_hw_interrupt(env, pending_interrupt);

Some verbs would be nice. ppc_deliver_interrupt?

> +    if (env->pending_interrupts == 0) {
> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> +    }
> +    return true;
>  }
>  
>  #endif /* !CONFIG_USER_ONLY */

