Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DE54AC6EB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:11:49 +0100 (CET)
Received: from localhost ([::1]:57654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7YJ-0006Xl-KG
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:11:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nH6ok-0002tB-P7; Mon, 07 Feb 2022 11:24:43 -0500
Received: from mail.csgraf.de ([85.25.223.15]:33962 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nH6oh-0002i3-Rw; Mon, 07 Feb 2022 11:24:42 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 6B273608119E;
 Mon,  7 Feb 2022 17:24:36 +0100 (CET)
Message-ID: <0da64aa5-97b3-540b-0fc9-cb9bf670d487@csgraf.de>
Date: Mon, 7 Feb 2022 17:24:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-7-peter.maydell@linaro.org>
 <2c67bde5-65b2-0af0-afde-7353a4fe2a1b@csgraf.de>
 <CAFEAcA9DcHXRkA7gCihU6LrOc40EOHnVnTeEcf4+xSfG22eJ-g@mail.gmail.com>
 <44ec9504-a7ef-6805-ae94-4435e5a37735@csgraf.de>
 <CAJy5ezqUtLphzH_WKmW8dR34=k-g5dmuevuZY42GfnD-R-uCqg@mail.gmail.com>
 <a6caa3b0-89ae-d482-62f5-2cada740a60e@csgraf.de>
 <cc73e2f0-97e1-f9c5-1a89-45ff2b0a2aeb@amsat.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <cc73e2f0-97e1-f9c5-1a89-45ff2b0a2aeb@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Stefano Stabellini <sstabellini@kernel.org>, Rob Herring <robh@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Andrew Jeffery <andrew@aj.id.au>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 07.02.22 17:06, Philippe Mathieu-Daudé wrote:
> On 7/2/22 16:59, Alexander Graf wrote:
>>
>> On 07.02.22 16:52, Edgar E. Iglesias wrote:
>
>>> Both Versal and ZynqMP require MicroBlaze firmware to run the 
>>> reference implementations of Trusted Firmware. We never supported 
>>> this in upstream QEMU but we do support it with our fork (by running 
>>> multiple QEMU instances co-simulating).
>>>
>>> Having said that, we do have tons of EL3 test-cases that we use to 
>>> validate QEMU that run with EL3 enabled in upstream.
>>>
>>> So there's two user flows:
>>> 1. Direct boots using QEMUs builtin PSCI (Most users use this to run 
>>> Linux, Xen, U-boot, etc)
>>> 2. Firmware boot at EL3 without QEMUs builtin PSCI (Mostly used by 
>>> test-code)
>>>
>>> Number #2 is the one affected here and that by accident used to have 
>>> the builtin PSCI support enabled but now requires more power control 
>>> modelling to keep working.
>>> Unless I'm missing something, the -kernel boots will continue to use 
>>> the builtin PSCI implementation.
>>
>>
>> So nobody is using upstream QEMU to validate and prototype 
>> ATF/EL1s/EL0s code? That's a shame :). I suppose there is little 
>> value without the bitstream emulation and R cluster. Do you have 
>> plans to bring multi process emulation upstream some day to enable 
>> these there?
>
> The R cluster is already in mainstream, isn't it?


In that case, wouldn't it make sense to build an emulation model of the 
PMU behavior so that normal ATF works out of the box?


Thanks,

Alex


