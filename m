Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF614420A5C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 13:47:54 +0200 (CEST)
Received: from localhost ([::1]:40038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXMRl-0001g3-IM
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 07:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXMNs-0007ie-E1
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 07:43:52 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:47883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXMNo-0007Kn-I1
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 07:43:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.21])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E7C3423439;
 Mon,  4 Oct 2021 11:43:44 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 4 Oct
 2021 13:43:44 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00263bc85e0-c94e-415e-b958-45a0d2325f02,
 6052322A053A64D32F912485F446DEADD4740C2E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <74fefbb4-af1c-a95e-a747-74866a8ad44c@kaod.org>
Date: Mon, 4 Oct 2021 13:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/1] hw: aspeed_gpio: Fix GPIO array indexing
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: <pdel@fb.com>
References: <20210928034356.3280959-1-pdel@fb.com>
 <20210928034356.3280959-2-pdel@fb.com>
 <c1d2a714-1073-310b-e75c-2f6b5b5a025f@kaod.org>
In-Reply-To: <c1d2a714-1073-310b-e75c-2f6b5b5a025f@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 41c74580-7ea3-4155-83aa-f40b85daba26
X-Ovh-Tracer-Id: 16784915812297378598
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddggeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuhffvfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeihfefffffgedtkeegtdekffevudeggfegffethfffhefhhfevhfdtudejhfdvieenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: patrick@stwcx.xyz, rashmica.g@gmail.com, f4bug@amsat.org, joel@jms.id.au,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 11:07, Cédric Le Goater wrote:
> On 9/28/21 05:43, pdel@fb.com wrote:
>> From: Peter Delevoryas <pdel@fb.com>
>>
>> The gpio array is declared as a dense array:
>>
>>    qemu_irq gpios[ASPEED_GPIO_NR_PINS];
>>
>> (AST2500 has 228, AST2400 has 216, AST2600 has 208)
>>
>> However, this array is used like a matrix of GPIO sets
>> (e.g. gpio[NR_SETS][NR_PINS_PER_SET] = gpio[8][32])
>>
>>    size_t offset = set * GPIOS_PER_SET + gpio;
>>    qemu_set_irq(s->gpios[offset], !!(new & mask));
>>
>> This can result in an out-of-bounds access to "s->gpios" because the
>> gpio sets do _not_ have the same length. Some of the groups (e.g.
>> GPIOAB) only have 4 pins. 228 != 8 * 32 == 256.
>>
>> To fix this, I converted the gpio array from dense to sparse, to match
>> both the hardware layout and this existing indexing code.
>>
>> Fixes: 4b7f956862dc2db4c5c ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> 
> 
> This patch is raising an error in qtest-arm/qom-test when compiled
> with clang :
> 
> Running test qtest-arm/qom-test
> Unexpected error in object_property_try_add() at ../qom/object.c:1224:
> qemu-system-arm: attempt to add duplicate property 'gpio0' to object (type 'aspeed.gpio-ast2600-1_8v')
> Broken pipe
> ERROR qtest-arm/qom-test - too few tests run (expected 78, got 0)
> make: *** [Makefile.mtest:24: run-test-1] Error 1

The GPIOSetProperties arrary is smaller for the ast2600_1_8v model :

   static GPIOSetProperties ast2600_1_8v_set_props[] = {
       [0] = {0xffffffff,  0xffffffff,  {"18A", "18B", "18C", "18D"} },
       [1] = {0x0000000f,  0x0000000f,  {"18E"} },
   };

and in aspeed_gpio_init() :

     for (int i = 0; i < ASPEED_GPIO_MAX_NR_SETS; i++) {

we loop beyond.

To configure compilation with clang, use the configure option :

   --cc=clang

and simply run 'make check-qtest-arm'

Thanks

C.

