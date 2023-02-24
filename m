Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3A76A2382
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 22:10:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVfJB-00050w-DM; Fri, 24 Feb 2023 16:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVfJ8-00050B-3X; Fri, 24 Feb 2023 16:08:46 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVfJ5-0003sT-Ly; Fri, 24 Feb 2023 16:08:45 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B6C8B74632B;
 Fri, 24 Feb 2023 22:08:38 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7C077745720; Fri, 24 Feb 2023 22:08:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7A028745712;
 Fri, 24 Feb 2023 22:08:38 +0100 (CET)
Date: Fri, 24 Feb 2023 22:08:38 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: Bernhard Beschow <shentey@gmail.com>, 
 =?ISO-8859-15?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>, 
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, philmd@linaro.org, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 5/5] hw/audio/via-ac97: Basic implementation of audio
 playback
In-Reply-To: <23a7106f-bc25-20c4-d446-b0fff84cc2fb@gmail.com>
Message-ID: <32aa39da-e6ec-4fcb-99fa-e1a09906decc@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <f84b42b8e811c6a0ddb23139fdfd654c8cc4f09c.1677004415.git.balaton@eik.bme.hu>
 <89f85024-6057-f0a8-3d4a-20eeaeec8878@t-online.de>
 <DF35DA6B-ED6A-43E3-A28E-7936560B6452@gmail.com>
 <62f3e9a1-f360-b525-7d1e-f57ccc8dca9e@eik.bme.hu>
 <23a7106f-bc25-20c4-d446-b0fff84cc2fb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 24 Feb 2023, Daniel Henrique Barboza wrote:
> On 2/24/23 10:05, BALATON Zoltan wrote:
>> Just for some motivation, this is what we want to make possible for more 
>> people with QEMU 8.0: https://youtu.be/YY9RExl4VDI
>
> That's neat!
>
>> 
>> This would need at least my SM502 patches and fixing the IRQ routing in the 
>> VT8231 (this test was with my series for that, I'll ask testing Bernhard's 
>> version the same way once I get it and rebase my patches on it). AmigaOS 
>> can use ES1370 so the via-ac97 patches are not that important now but the 
>> other patches would be needed. I hope users won't have to wait until 
>> September to try this.
>
> If you're referring to "hw/display/sm501: Implement more 2D raster 
> operations" then it's already
> queued in ppc-next.

That one and another I've sent yesterday that adds fallbacks for pixman 
routines.

> In fact I believe you can re-send it with this series, 
> with my r-b, and whoever
> gets to send the PR can send everything at once.

OK I'll collect all the patches in one series and submit it early next 
week. Hopefully we can test over the weekend and address any comments by 
the freeze.

> If either Gerd of Phil wants to pick these up I have already acked the 
> pegasos2 changes.
>
> If you want me to get this via qemu-ppc bear in mind that I need to send the 
> PR March 7th
> at the latest.

I'm aware of that, although if we get more CI outage which stops pulls 
maybe we should consider 1-2 week extension, but I'm planning accordingly 
and if there won't be unexpected delays (e.g. new late reviews asking for 
extensive changes) this should be ready a week before the freeze. I think 
we can do one or two more versions/

Regards,
BALATON Zoltan

