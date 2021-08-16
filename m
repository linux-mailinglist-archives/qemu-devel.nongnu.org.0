Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69163ED1DD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 12:22:31 +0200 (CEST)
Received: from localhost ([::1]:41086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFZlE-0002Wz-P2
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 06:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mFZkU-0001j6-Qu; Mon, 16 Aug 2021 06:21:43 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:64711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mFZkR-0008Qm-Nb; Mon, 16 Aug 2021 06:21:42 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BAA8F746353;
 Mon, 16 Aug 2021 12:21:33 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 97D8C7457EE; Mon, 16 Aug 2021 12:21:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 96B63745708;
 Mon, 16 Aug 2021 12:21:33 +0200 (CEST)
Date: Mon, 16 Aug 2021 12:21:33 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
In-Reply-To: <YRn6d/Vb10JTmZ18@yekko>
Message-ID: <68327a9-a317-9be8-92a6-ed23a91f4d7e@eik.bme.hu>
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Guenter Roeck <linux@roeck-us.net>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Aug 2021, David Gibson wrote:
> On Sun, Aug 15, 2021 at 07:59:15PM -0700, Guenter Roeck wrote:
>> IBM EMAC Ethernet controllers are not emulated by qemu. If they are
>> enabled in devicetree files, they are instantiated in Linux but
>> obviously won't work. Disable associated devicetree nodes to prevent
>> unpredictable behavior.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>
> I'll wait for Zoltan's opinion on this, but this sort of thing is why
> I was always pretty dubious about qemu *loading* a dtb file, rather
> than generating a dt internally.

We are aiming to emulate the real SoC so we use the same dtb that belongs 
to that SoC instead of generating something similar but not quite the 
same. (QEMU also has a -dtb option but I'm not sure how many machines 
implement it.) So loading a dtb is not bad in my opinion. Given that we 
don't fully emulate every device in the SoC having devices described in 
the dtb that we don't have might cause warnings or errors from OSes that 
try to accesss these but that's all I've seen. I'm not sure what 
unpredictable behaviour could result apart from some log messages about 
missing ethernet so this should only be cosmetic to hide those errors. But 
other than that it likely should not break anything so I'm OK with this 
patch. (I did not implement ethernet ports becuase they are quite complex 
and we already have several PCI ethernet devices that work already with 
guests so it's easier to use those than spend time to implement another 
ethernet device.)

Regards,
BALATON Zoltan

>> ---
>>  hw/ppc/sam460ex.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>> index 0737234d66..feb356e625 100644
>> --- a/hw/ppc/sam460ex.c
>> +++ b/hw/ppc/sam460ex.c
>> @@ -194,6 +194,14 @@ static int sam460ex_load_device_tree(hwaddr addr,
>>          _FDT(fdt_nop_node(fdt, offset));
>>      }
>>
>> +    /* Ethernet interfaces are not emulated */
>> +    offset = fdt_node_offset_by_compatible(fdt, -1, "ibm,emac-460ex");
>> +    while (offset >= 0) {
>> +        _FDT(fdt_setprop_string(fdt, offset, "status", "disabled"));
>> +        offset = fdt_node_offset_by_compatible(fdt, offset, "ibm,emac-460ex");
>> +    }
>> +
>> +
>>      /* set serial port clocks */
>>      offset = fdt_node_offset_by_compatible(fdt, -1, "ns16550");
>>      while (offset >= 0) {
>
>

