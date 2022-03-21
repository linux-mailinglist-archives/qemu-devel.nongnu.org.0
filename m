Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8D24E3057
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 19:59:10 +0100 (CET)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWNFF-0004bc-Ky
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 14:59:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWNDz-0003W3-4f; Mon, 21 Mar 2022 14:57:51 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:49749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWNDx-0000De-59; Mon, 21 Mar 2022 14:57:50 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E15A1ED4D4FA;
 Mon, 21 Mar 2022 19:57:45 +0100 (CET)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 21 Mar
 2022 19:57:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00181e04ae9-2ca8-4a8d-964e-754bff1be888,
 1B2610401919D9AAB2F83A5D9344AD9F0D4CD782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <469a9e48-a75b-f6ec-367e-ac37b8e04ac9@kaod.org>
Date: Mon, 21 Mar 2022 19:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: Memory leak in via_isa_realize()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Peter Maydell
 <peter.maydell@linaro.org>
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
 <CAFEAcA-jEqnpUdtfgqMFUn_ghwoYM+8UyceLUz+Uo07FuH+S-Q@mail.gmail.com>
 <ab9c9599-2021-42df-7bfe-4f2f3842cb84@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ab9c9599-2021-42df-7bfe-4f2f3842cb84@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 59f1ff2e-6dc7-429a-9d16-c7bd605f9f54
X-Ovh-Tracer-Id: 14603203268593224495
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudegfedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/22 13:11, BALATON Zoltan wrote:
> On Mon, 21 Mar 2022, Peter Maydell wrote:
>> On Mon, 21 Mar 2022 at 10:31, Thomas Huth <thuth@redhat.com> wrote:
>>> FYI, I'm seeing a memory leak in via_isa_realize() when building
>>> QEMU with sanitizers enabled or when running QEMU through valgrind:
>>> Same problem happens with qemu-system-ppc64 and the pegasos2 machine.
>>>
>>> No clue how to properly fix this... is it safe to free the pointer
>>> at the end of the function?
>>
>> This is because the code is still using the old function
>> qemu_allocate_irqs(), which is almost always going to involve
>> it leaking memory. The fix is usually to rewrite the code to not use
>> that function at all, i.e. to manage its irq/gpio lines differently.
>> Probably the i8259 code should have a named GPIO output line
>> rather than wanting to be passed a qemu_irq in an init function,
>> and the via code should have an input GPIO line which it connects
>> up to the i8259. It looks from a quick glance like the i8259 and
>> its callers have perhaps not been completely QOMified.
> 
> Everything involving ISA emulation in QEMU is not completely QOMified and this has caused some problems before but I did not want to try to fix it both becuase it's too much unrelated work and because it's used by too many things that could break that I can't even test. So I'd rather somebody more comfortable with this would look at ISA QOMification.

Regarding the ppc44x and ppc40x machines, we have a lot of tests in place
and the QOM translation shouldn't be too complex. This is about changing
the board and device instantiation and not the CPU internal models,
like exceptions and SoftTLBs, which can be much more complex to test.

>> In this specific case, though, it seems like the only thing that
>> the via_isa_request_i8259_irq() function does is pass the interrupt
>> signal through to its own s->cpu_intr, so I think a relatively
>> self-contained way to deal with the leak is to pass s->cpu_intr
>> into i8259_init() and drop the isa_irq allocated irq and its
>> associated helper function entirely. (There might be some subtlety
>> I'm missing that means that wouldn't work, of course.)
> 
> I think I've tried to do that first and it did not work for some reason then I got this way from some other device model which works but I forgot the details. You can test it by booting MorphOS or Debian Linux 8.11 PPC on pegasos2 which support this machine or maybe I can have a look later this week if it's not urgent and try something but I don't mind if somebody comes up with a fix before that.

I will support this work and I can even send some patches I have started
for the 405 to cleanup the bit-rotting models.

Thanks,

C.

