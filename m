Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943123EE9AD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:25:39 +0200 (CEST)
Received: from localhost ([::1]:54868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvLm-0002Tm-MZ
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mFvKv-0001SE-0B; Tue, 17 Aug 2021 05:24:45 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:16083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mFvKr-0003No-8R; Tue, 17 Aug 2021 05:24:44 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EDB99746398;
 Tue, 17 Aug 2021 11:24:37 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A902D746353; Tue, 17 Aug 2021 11:24:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A70F1745708;
 Tue, 17 Aug 2021 11:24:37 +0200 (CEST)
Date: Tue, 17 Aug 2021 11:24:37 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
In-Reply-To: <YRsnxY+0PplppxeU@yekko>
Message-ID: <28b9ae3d-80b8-f48b-dfe6-9b895d5c5db3@eik.bme.hu>
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko> <68327a9-a317-9be8-92a6-ed23a91f4d7e@eik.bme.hu>
 <YRsnxY+0PplppxeU@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 17 Aug 2021, David Gibson wrote:
> On Mon, Aug 16, 2021 at 12:21:33PM +0200, BALATON Zoltan wrote:
>> On Mon, 16 Aug 2021, David Gibson wrote:
>>> On Sun, Aug 15, 2021 at 07:59:15PM -0700, Guenter Roeck wrote:
>>>> IBM EMAC Ethernet controllers are not emulated by qemu. If they are
>>>> enabled in devicetree files, they are instantiated in Linux but
>>>> obviously won't work. Disable associated devicetree nodes to prevent
>>>> unpredictable behavior.
>>>>
>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>> I'll wait for Zoltan's opinion on this, but this sort of thing is why
>>> I was always pretty dubious about qemu *loading* a dtb file, rather
>>> than generating a dt internally.
>>
>> We are aiming to emulate the real SoC so we use the same dtb that belongs to
>> that SoC instead of generating something similar but not quite the same.
>
> Well.. sure, but you don't *actually* emulate the real SoC, so you're
> advertising a dtb that doesn't match the real hardware, which is a
> bigger bug.
>
>> (QEMU also has a -dtb option but I'm not sure how many machines implement
>> it.) So loading a dtb is not bad in my opinion.
>
> Well.... I'm not all that convinced that -dtb is a good idea either.
> But to the extent that it is, I've assumed it's very much a "you must
> know what you're doing" option (like -bios) where it's the user's
> responsibility to make sure the dtb they're supplying matches the
> emulated hardware.
>
>> Given that we don't fully
>> emulate every device in the SoC having devices described in the dtb that we
>> don't have might cause warnings or errors from OSes that try to accesss
>> these but that's all I've seen. I'm not sure what unpredictable behaviour
>> could result apart from some log messages about missing ethernet so this
>> should only be cosmetic to hide those errors. But other than that it likely
>> should not break anything so I'm OK with this patch. (I did not implement
>> ethernet ports becuase they are quite complex and we already have several
>> PCI ethernet devices that work already with guests so it's easier to use
>> those than spend time to implement another ethernet device.)
>
> So, the thing I really dislike about this patch is that it's not
> committing to either approach.  It's neither having a supplied dtb and
> making it qemu's job to match that behaviour exactly, nor is qemu
> supplying hardware and producing a dtb to describe that virtual
> hardware.  It's doing a bit of both, which just seems like a recipe
> for confusion to me.

We could also modify the pc-bios/canyonlands.dts to comment out the 
ethernet ports from it or add the disabled properties there, maybe also 
adding a comment that explains these are not emulated in QEMU but to me 
keeping the dts unmodified, matching real hardware and let the board code 
patch it according to what's emulated looks more obvious to clearly show 
what changes we have from the originial hardware which would be less clear 
if we loaded a modified dtb. Modifying the dtb simplifies the board code 
but hides the differences from real hardware. So since we already have to 
modify the loaded dtb anyway I'm OK with changing it at the same place as 
this patch proposes.

Regards,
BALATON Zoltan

