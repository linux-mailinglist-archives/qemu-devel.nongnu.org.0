Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC82442E081
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 19:50:03 +0200 (CEST)
Received: from localhost ([::1]:41908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb4rj-0002TW-2P
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 13:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb4pw-0000qp-1M
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:48:12 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:47179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb4ps-0008SI-1E
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:48:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 004F8748F56;
 Thu, 14 Oct 2021 19:48:04 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CE759746333; Thu, 14 Oct 2021 19:48:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CC7FD7462D3;
 Thu, 14 Oct 2021 19:48:03 +0200 (CEST)
Date: Thu, 14 Oct 2021 19:48:03 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
In-Reply-To: <338972bc-7256-e648-83d6-b31de2aaf34c@eik.bme.hu>
Message-ID: <d53117db-137c-a81a-d2d7-78142fccca4e@eik.bme.hu>
References: <20211013121929.9E835746333@zero.eik.bme.hu>
 <20211014091035.xlhh74aioxhkxelf@sirius.home.kraxel.org>
 <1e91fd14-f112-b5b7-abfb-117cbb109c39@eik.bme.hu>
 <20211014130159.cwkub7g7akco76ls@sirius.home.kraxel.org>
 <338972bc-7256-e648-83d6-b31de2aaf34c@eik.bme.hu>
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Oct 2021, BALATON Zoltan wrote:
> On Thu, 14 Oct 2021, Gerd Hoffmann wrote:
>> On Thu, Oct 14, 2021 at 12:22:58PM +0200, BALATON Zoltan wrote:
>>> On Thu, 14 Oct 2021, Gerd Hoffmann wrote:
>>>> On Wed, Oct 13, 2021 at 02:13:09PM +0200, BALATON Zoltan wrote:
>>>>> This device is part of a superio/ISA bridge chip and IRQs from it are
>>>>> routed to an ISA interrupt set by the Interrupt Line PCI config
>>>>> register. Change uhci_update_irq() to allow this and implement it in
>>>>> vt82c686-uhci-pci.
>>>> 
>>>> Looks good.  There are some unrelated changes in though (whitespace,
>>>> comments, ...), and the vt82c686-uhci-pci.c changes should be a
>>>> separate patch.
>>> 
>>> So you mean split it into a series of three small patches? Should I do a 
>>> w4
>>> with that?
>> 
>> I was thinking about two patches: drop the unrelated stuff, one patch
>> for the irq signaling change, and one for the vt82c686 changes.
>> 
>> But of course you can add more patches for the other changes, i.e.
>> dropping the else branch for level = 0 and other small tweaks.
>
> The tewak for the comment is needed for checkpach, dropping the else is just 
> to make the function shorter and IMO more readable. I can do this in a 
> previous patch so checkpatch won't complain on the pci irq change or need at 
> least the comment change in that patch. I'm thinking about an alternative way 
> for the vt82c686 part to avoid using isa_get_irq which has a comment saying 
> it should be dropped but not sure about that yet, I'll try it and submit a v4 
> with at least breaking it up to smaller patches.

I've tried it and it's just not worth it. By moving isa reference to 
vt82c686.c we end up doing the same, just with a lot more code changes 
(which is harder to understand) and less efficiently (at every interrupt 
need to jump through hoops and do some QOM casts and additional calls to 
reach the same effect). These are basically modelling functions of the 
same device just split up in parts to categorise and reuse parts of 
similar models so accesing isa parts of the chip from usb part does not 
seem to be that bad and it's simple this way. So I ended up just splitting 
the patch for v4.

Thanks,
BALATON Zoltan

