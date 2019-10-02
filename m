Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAE5C4796
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 08:16:14 +0200 (CEST)
Received: from localhost ([::1]:52020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFXvp-0003JU-2J
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 02:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iFXtr-0002ld-3C
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 02:14:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iFXtq-0006Zn-6C
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 02:14:11 -0400
Received: from 4.mo69.mail-out.ovh.net ([46.105.42.102]:51649)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iFXtq-0006Yw-05
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 02:14:10 -0400
Received: from player692.ha.ovh.net (unknown [10.109.146.19])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id C265D6973B
 for <qemu-devel@nongnu.org>; Wed,  2 Oct 2019 08:14:07 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player692.ha.ovh.net (Postfix) with ESMTPSA id 776CEA569C54;
 Wed,  2 Oct 2019 06:13:56 +0000 (UTC)
Subject: Re: [PATCH v3 22/34] spapr, xics, xive: Move cpu_intc_create from
 SpaprIrq to SpaprInterruptController
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20191002025208.3487-1-david@gibson.dropbear.id.au>
 <20191002025208.3487-23-david@gibson.dropbear.id.au>
 <360fd118-81c2-7ba1-2faf-d735d887d955@kaod.org>
Message-ID: <3118503c-10a2-507a-46e5-da0847d7135e@kaod.org>
Date: Wed, 2 Oct 2019 08:13:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <360fd118-81c2-7ba1-2faf-d735d887d955@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4624915345725295513
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgeehgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.42.102
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, groug@kaod.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> @@ -527,6 +471,30 @@ static int spapr_irq_check(SpaprMachineState *spapr, Error **errp)
>>  /*
>>   * sPAPR IRQ frontend routines for devices
>>   */
>> +#define ALL_INTCS(spapr_) \
>> +    { SPAPR_INTC((spapr_)->ics), SPAPR_INTC((spapr_)->xive), }
> 
> I would have expected this array to be under the machine.
> 
>> +int spapr_irq_cpu_intc_create(SpaprMachineState *spapr,
>> +                              PowerPCCPU *cpu, Error **errp)
>> +{
>> +    SpaprInterruptController *intcs[] = ALL_INTCS(spapr);
>> +    int i;
>> +    int rc;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(intcs); i++) {
> 
> but it would have been difficult to use ARRAY_SIZE. OK then.
> 
>> +        SpaprInterruptController *intc = intcs[i];
>> +        if (intc) {
> 
> Is that test needed ? 

I understand now : spapr->ics and spapr->xive can be NULL. 

I think using a list would be better. 

C.





