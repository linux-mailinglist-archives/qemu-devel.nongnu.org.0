Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9C033F921
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:27:39 +0100 (CET)
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbpS-0004GB-MC
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lMbRy-0005hl-UY
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:03:24 -0400
Received: from 5.mo51.mail-out.ovh.net ([188.165.49.213]:44396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lMbRs-0004g5-Mw
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:03:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id A57B2274A32;
 Wed, 17 Mar 2021 20:03:13 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Mar
 2021 20:03:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0052b3110f7-87aa-47c3-a1b4-d3208367bcb4,
 10040688A1AB5364447EAD88D88247B833C1D39B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Do not sysbus-map mmio flash region
 directly, use alias
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-3-f4bug@amsat.org>
 <871fce3d-8b3c-bcce-6170-9010b1ed7d5c@kaod.org>
 <38ba72b0-ca80-11e9-3933-1da563748a83@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fca7093f-ac77-e72a-edce-fa93f774a571@kaod.org>
Date: Wed, 17 Mar 2021 20:03:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <38ba72b0-ca80-11e9-3933-1da563748a83@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 349db3b3-fdc6-4687-bf9f-2e102ae769a9
X-Ovh-Tracer-Id: 5940529386346089403
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 8:00 PM, Philippe Mathieu-Daudé wrote:
> On 3/17/21 7:30 PM, Cédric Le Goater wrote:
>> On 3/12/21 7:28 PM, Philippe Mathieu-Daudé wrote:
>>> The flash mmio region is exposed as an AddressSpace.
>>> AddressSpaces must not be sysbus-mapped, therefore map
>>> the region using an alias.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> That does the trick but you need an extra change in the model. 
>>
>> The fixes are in my aspeed-6.0 branch on GH and they survive the last
>> patch of your series :
>>
>>   [PATCH 5/5] memory: Make sure root MR won't be added as subregion
> 
> I wondered about changing DMA_FLASH_ADDR() wasn't sure the tests
> would use the flash.

The acceptance tests (not merged yet) download firmware images
in which u-boot does DMA accesses to calibrate the reads on the
flash device. 

C.
  
> 
>> I will upstream for 6.1.
> 
> Thanks!
> 
> Phil.
> 


