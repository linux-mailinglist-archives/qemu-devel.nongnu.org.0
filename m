Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7AA539CD5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 07:55:57 +0200 (CEST)
Received: from localhost ([::1]:38416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwHKm-0000ti-5o
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 01:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwHG1-0006h2-OU
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 01:51:01 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:57733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwHFz-00010g-51
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 01:51:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.68])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 9BF1F2357D;
 Wed,  1 Jun 2022 05:50:54 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 1 Jun 2022
 07:50:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0038f63d621-29b2-45c0-95bc-dda82ae48c32,
 A963F33A9D1A618F9A1E828761F10BD73193B711) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <12080800-c406-d3c5-b5ca-2a186cca247c@kaod.org>
Date: Wed, 1 Jun 2022 07:50:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 00/25] hw/sd: Rework models for eMMC support
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 <qemu-devel@nongnu.org>
CC: Bin Meng <bin.meng@windriver.com>, <qemu-block@nongnu.org>, Joel Stanley
 <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
 <28f1b244-d1f9-c490-4b33-ca40824b5a19@kaod.org>
 <9a265410-49f1-ba56-6c9b-d58e641e71b4@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <9a265410-49f1-ba56-6c9b-d58e641e71b4@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f5eff169-6681-4612-815f-ba5d979d2757
X-Ovh-Tracer-Id: 18320080334892272489
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeelgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleeuueduhedutedvudfgtdegtdelgedvudeftdeuieefleevtdevieffhfeffeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmpdhgihhthhhusgdrtghomhdpkhgrohgurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehsrghirdhprghvrghnrdgsohguughuseigihhlihhngidrtghomh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/31/22 21:07, Philippe Mathieu-Daudé wrote:
> On 31/5/22 11:19, Cédric Le Goater wrote:
>> On 5/30/22 21:37, Philippe Mathieu-Daudé wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Rebase/respin of Cédric RFC:
>>> https://lore.kernel.org/qemu-devel/20220318132824.1134400-1-clg@kaod.org/
>>> (sorry it took me so long guys...)
>>>
>>> Pushed at https://gitlab.com/philmd/qemu/-/commits/emmc-v2
>>>
>>> I plan to queue patches 1-12 via sdmmc-next later this week.
>>>
>>> Cédric, if you are happy with this series, it should be easy to rebase
>>> your other patches on top and address the comments I left on the RFC :)
>>
>> I pushed an update on :
>>
>>    https://github.com/legoater/qemu/commits/aspeed-7.1
>>
>> Here is an image :
>>
>>    https://www.kaod.org/qemu/aspeed/mmc-p10bmc.qcow2
>>
>> run with :
>>
>>   qemu-system-arm -M rainier-bmc -net nic -net user -drive file=./mmc-p10bmc.qcow2,format=qcow2,if=sd,id=sd0,index=2 -nographic -nodefaults -snapshot -serial mon:stdio
> 
> Useful, thanks.
> 
> I see in hw/arm/aspeed_ast2600.c:
> 
>      /* Init sd card slot class here so that they're under the correct parent */
>      for (i = 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
>          object_initialize_child(obj, "sd-controller.sdhci[*]",
>                                  &s->sdhci.slots[i], TYPE_SYSBUS_SDHCI);
>      }
> 
>      object_initialize_child(obj, "emmc-controller.sdhci", &s->emmc.slots[0],
>                              TYPE_SYSBUS_SDHCI);
> 
>      /* eMMC Boot Controller stub */
>      create_unimplemented_device("aspeed.emmc-boot-controller",
>                                  sc->memmap[ASPEED_DEV_EMMC_BC],
>                                  0x1000);
> 
>      /* eMMC */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->emmc), errp)) {
>          return;
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0, sc->memmap[ASPEED_DEV_EMMC]);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
>                         aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
> 
> Where is 'emmc-controller.sdhci' realized?

the slots are realized in aspeed_sdhci_realize(). It's not very
symmetric and the names are confusing.

I think that one of the problems is that the instance_init routine
of TYPE_ASPEED_SDHCI object doesn't know on how much slots
object_initialize_child() should be called since it depends on
its flavor : SD/eMMC.

> In aspeed_sdhci_realize() you set sd-spec-version" = 2, is that OK
> with eMMC?

ah yes. it boots anyhow.

> What expects the real hw?
               ast2400     ast2500     ast2600
  
SDHC card    v2.0/v3.0   v2.0/v3.0   v2.0/v3.0	
SDIO Host      v2.0        v2.0        v2.0	
SD slots        2           2           2	
eMMC            x         v4.51       v5.1
eMMC slots      x           1           1

on the ast2500, the SDIO and eMMC logics are combined in one controller
but since it is not used, QEMU does not model the eMMC part.

Thanks,

C.

  

