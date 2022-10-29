Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C11E6122D9
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 14:20:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ookn3-0004l5-Mi; Sat, 29 Oct 2022 08:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ookn0-0004k6-Ng; Sat, 29 Oct 2022 08:18:15 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ookmy-0007bl-0O; Sat, 29 Oct 2022 08:18:14 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5D58A74638A;
 Sat, 29 Oct 2022 14:18:08 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C404D74633D; Sat, 29 Oct 2022 14:18:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C1964746307;
 Sat, 29 Oct 2022 14:18:07 +0200 (CEST)
Date: Sat, 29 Oct 2022 14:18:07 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v5 20/20] mac_{old, new}world: Pass MacOS VGA NDRV in
 card ROM instead of fw_cfg
In-Reply-To: <0be174ad-2086-2a55-4025-860785b1d441@ilande.co.uk>
Message-ID: <d1344178-94dc-1fea-baba-51673c1c2f@eik.bme.hu>
References: <cover.1666715145.git.balaton@eik.bme.hu>
 <915b28547446c1fad749fbab2943b13e3a0d856b.1666733213.git.balaton@eik.bme.hu>
 <d3bdb406-70d3-d60d-b481-7d88736a2e4b@ilande.co.uk>
 <24e4cba4-2f68-73a2-55d2-2dc5c0cba14e@eik.bme.hu>
 <0be174ad-2086-2a55-4025-860785b1d441@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 29 Oct 2022, Mark Cave-Ayland wrote:
> On 28/10/2022 13:32, BALATON Zoltan wrote:
>> On Fri, 28 Oct 2022, Mark Cave-Ayland wrote:
>>> On 25/10/2022 22:31, BALATON Zoltan wrote:
>>>> OpenBIOS cannot run FCode ROMs yet but it can detect NDRV in VGA card
>>>> ROM and add it to the device tree for MacOS. Pass the NDRV this way
>>>> instead of via fw_cfg. This solves the problem with OpenBIOS also
>>>> adding the NDRV to ati-vga which it does not work with. This does not
>>>> need any changes to OpenBIOS as this NDRV ROM handling is already
>>>> there but this patch also allows simplifying OpenBIOS later to remove
>>>> the fw_cfg ndrv handling from the vga FCode and also drop the
>>>> vga-ndrv? option which is not needed any more as users can disable the
>>>> ndrv with -device VGA,romfile="" (or override it with their own NDRV
>>>> or ROM). Once FCode support is implemented in OpenBIOS, the proper
>>>> FCode ROM can be set the same way so this paves the way to remove some
>>>> hacks.
>>> 
>>> This is not correct though: in a real option ROM the NDRV is included as 
>>> part of the ROM payload and is not a standalone file. The IEEE-1275 PCI 
>>> specification gives the correct format for an option ROM which at minimum 
>>> contains a header, and likely some additional FCode.
>> 
>> As the commit message says that does not work with OpenBIOS at the moment 
>> but passing the NDRV does. That it's not how real hardware works is not an 
>> argument after all real hardware does not have fw_cfg either and this way 
>> is much simpler than fw_cfg, it fixes the problem with ati-vga and it can 
>> be changed later to pass the real FCode ROM the same way so I think it's a 
>> better way to handle this now as what we have currently.
>
> Right, passing the NDRV directly only happens to work because Ben's original 
> hack is still in OpenBIOS.

And this allows to remove your hack which is just doing the same in a more 
complex way and also breaks ati-vga. While this original hack is simpler 
and cleaner and works just as well until we can finally pass a real FCode 
ROM. (That probably won't be soon as OpenBIOS also progresses slowly due 
to your lack of time. So at least please let QEMU progress a bit now.)

> The longer term aim is to move towards the 
> IEEE-1275 PCI specification: I can't see how switching from one custom 
> mechanism to a different custom mechanism benefits anything here.

Can't you see really or don't want to see to keep your code instead? With 
this patch we pass the NDRV in ROM which can then simply be replaced with 
the FCode ROM once OpenBIOS can handle that and no change is needed for 
QEMU at that time, just replace qemu_vga.ndrv with the QEMU,VGA.fcode and 
done. If we keep your fw_cfg hack then it will need to be reverted at that 
point but we can do that now and simplify both QEMU and OpenBIOS by doing 
so.

> The problem you're actually trying to solve is that the ati-vga device should 
> not be picking up the NDRV, so that's where the focus should be.

And tis patch also solves that by moving the NDRV from the machine to the 
VGA device so it will only be added with that device and not with ati-vga 
so it won't be disturbing other vga cards. All this with less and simpler 
code than what we have now. What do you have against it other than it's 
making part of your code redundant? If your code is not better then you 
should not be holding on to that if there's a simpler way. (I hope it's 
not because https://en.wikipedia.org/wiki/Not_invented_here you could 
prove me wrong giving a valid reason why the current solution is better 
than this patch but I really can't see that. To me it's not about who wins 
or whose code will be in QEMU or OpenBIOS but which is the simpler and 
better working solution and in this case I think this patch is.)

>>> Isn't the immediate problem here that the NDRV handling in OpenBIOS needs 
>>> to be improved so that it can be disabled for particular VGA devices such 
>>> as ATI?
>> 
>> No change is needed to OpenBIOS (I've discussed it more in the reply to 
>> Howard on the list yesterday). With this patch only VGA device will have 
>> qemu_vga.ndrv so OpenBIOS won't add it for ati-vga. Also the fw_cfg and 
>> vga_ndrv? stuff can be removed from OpenBIOS after this patch as it's not 
>> nedeed any more thus simplifying the vga.fs FCode in OpenBIOS a lot.
>
> The vga-ndrv? option was added for a reason though: the NDRV doesn't (yet?) 
> work with KVM-PR on real Mac hardware, so to run MacOS on KVM you need a 
> separate mechanism to disable the NDRV.

You can still do that after this patch, just replace 
-prom-env='vga-ndrv?=false' with -device VGA.romfile="" and it won't add 
the NDRV. If you want to keep the non-standard vga-ndrv? option you've 
invented and is not part of IEEE-1275 so shouldn't be in OpenBIOS at all 
then you can change OpenBIOS to check this option in vga_config_cb before 
checking the ROM for NDRV and then even command lines using that option 
are backward compatibile so it's not an issue.

> This becomes more important when 
> OpenBIOS gets to the stage where the FCode can create the DT nodes itself.

It's not an issue either as fw_cfg already has a FW_CFG_PPC_IS_KVM 
variable so the FCode can handle it itself based on that variable. No 
cahange is needed to QEMU and no hack is needed in OpenBIOS for that only 
in the QEMU,VGA FCode to check for KVM and you can just add the FCode 
instead of the NDRV after this patch.

> Also if we do decide to change this, it would be a compatibility break for a 
> lot of existing documentation and examples: this is something we could manage 
> going forward, but it needs some planning and isn't something we should be 
> doing a few days before freeze.

I did submit the cleanup series in time well before the freeze and 
intended to follow up with these after that simple series. The reason it's 
got that late is your slow response time so don't blame me for that. 
Missing the freeze though means we lose almost half a year again before 
this can get to the users so I think it's better to merge this tentatively 
mow and then drop it during the freeze if some problem is found than just 
ignoring it right away so you don't need to think about it.

Regards,
BALATON Zoltan

