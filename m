Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D748B2E1CB2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 14:41:12 +0100 (CET)
Received: from localhost ([::1]:40714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks4O7-0008Kr-5z
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 08:41:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ks4Mo-0007tQ-Cb; Wed, 23 Dec 2020 08:39:50 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:44000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ks4Mm-00041d-M0; Wed, 23 Dec 2020 08:39:50 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3B149746553;
 Wed, 23 Dec 2020 14:39:45 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0208874646C; Wed, 23 Dec 2020 14:39:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0074A746383;
 Wed, 23 Dec 2020 14:39:44 +0100 (CET)
Date: Wed, 23 Dec 2020 14:39:44 +0100 (CET)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: Problems with irq mapping in qemu v5.2
In-Reply-To: <2e2c1337-0d23-29fb-3b5e-cd45ee862052@ilande.co.uk>
Message-ID: <bad83a50-7ef9-9490-5c46-29dd63d24c1@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <93a88d8e-89d0-96d4-15bc-47edfc68b5d8@eik.bme.hu>
 <5fb9653-ac95-ecfb-229e-848bdebd839c@eik.bme.hu>
 <2e2c1337-0d23-29fb-3b5e-cd45ee862052@ilande.co.uk>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Guenter Roeck <linux@roeck-us.net>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Wed, 23 Dec 2020, Mark Cave-Ayland wrote:
> On 22/12/2020 22:23, BALATON Zoltan via wrote:
>> I've just remembered that for sam460ex we had this commit: 484ab3dffadc 
>> (sam460ex: Fix PCI interrupts with multiple devices) that changed that 
>> mapping for that machine so I guess you got the exception with the bamboo 
>> board then. I'm not sure though that similar fix is applicable fot that or 
>> even that this fix is correct for sam460ex but appears to work so far.
>
> FWIW you might want to review this commit: as Peter noticed it is possible to 
> lose interrupts here since if one PCI interrupt is already asserted and then 
> another comes along, the second PCI interrupt will unintentionally clear the 
> first which could cause problems.

Yes, thanks for reminding. I think this was also raised back then but for 
some reason we thought this should not be an issue in this case but I'll 
give it a try and see if using an or-gate would be better. The only 
possible IRQ related problem I know about is choppy sound with an emulated 
PCI sound card but that may be because some other audio related problem as 
well.

Regards,
BALATON Zoltan

> You probably want to keep the 4 separate PCI interrupts but feed them into an 
> OR IRQ, the output of which gets fed into the UIC. Have a look at 
> https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05503.html for the 
> sun4m variant of this based upon Peter's original example.
>
>
> ATB,
>
> Mark.
>
>

