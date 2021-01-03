Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6720F2E89EA
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 02:48:59 +0100 (CET)
Received: from localhost ([::1]:58534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvsVu-0002Vt-GN
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 20:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvsTz-0001Lh-VJ; Sat, 02 Jan 2021 20:47:01 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:30875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvsTs-0007rv-69; Sat, 02 Jan 2021 20:46:59 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EC1EE7470FA;
 Sun,  3 Jan 2021 02:46:48 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C04A87470DD; Sun,  3 Jan 2021 02:46:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BDF8374645F;
 Sun,  3 Jan 2021 02:46:48 +0100 (CET)
Date: Sun, 3 Jan 2021 02:46:48 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 3/3] sam460ex: Clean up irq mapping
In-Reply-To: <CAFEAcA_hROTuxFmXZq7dyp931XWr3reXHUtqzDLdQu0ynixUHQ@mail.gmail.com>
Message-ID: <38958ea1-d259-dc5f-63f1-c25a033e8b5@eik.bme.hu>
References: <cover.1609413115.git.balaton@eik.bme.hu>
 <6892fc8ac57283bf7ba27fe89ea9dbdd6a37f988.1609413115.git.balaton@eik.bme.hu>
 <CAFEAcA96wr_+DmXfR5ba_MEPB+sBow-QR1wpvSvKawus7qzKVg@mail.gmail.com>
 <CAFEAcA_bAjvx1oWO1DGimmThE7BhGHE0EqCoCR4nhuO3DMY_2g@mail.gmail.com>
 <79681dc2-d689-4518-a83-dead38dd6e8@eik.bme.hu>
 <CAFEAcA_hROTuxFmXZq7dyp931XWr3reXHUtqzDLdQu0ynixUHQ@mail.gmail.com>
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Fri, 1 Jan 2021, Peter Maydell wrote:
> On Thu, 31 Dec 2020 at 20:55, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> The SoC is called 460EX (despite having a PPC 440 core not 460 one) but I
>> think you've looked at the right data sheet and it's just a typo. I also
>> don't know how the board is wired so I think in this case I prefer
>> dropping this patch and keeping the current code just for simplicity but
>> to avoid going through this again maybe we should add a comment saying why
>> it's working. Can you please suggest a text for such comment pointing to
>> the relevant part of pci_change_irq_level() you refer to above? I don't
>> think I understand it enough to document it.
>
> How about:
>
> /*
> * All four IRQ[ABCD] pins from all slots are tied to a single board
> * IRQ, so our mapping function here maps everything to IRQ 0.
> * The code in pci_change_irq_level() tracks the number of times
> * the mapped IRQ is asserted and deasserted, so if multiple devices
> * assert an IRQ at the same time the behaviour is correct.
> */

Very good, thank you. Leaving it as it is now also avoids needing to 
rebase your UIC series so that should still apply. I've sent a series with 
the above comment now, please add your Suggested-by, Reviewed-by as you 
see fit.

Regards,
BALATON Zoltan

