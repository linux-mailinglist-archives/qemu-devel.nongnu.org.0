Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DED842D9D3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 15:10:29 +0200 (CEST)
Received: from localhost ([::1]:36462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb0VA-0002qg-00
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 09:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb0TH-0001YX-Ij
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:08:31 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:61545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb0TE-0007ON-VS
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:08:31 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A83D87463B7;
 Thu, 14 Oct 2021 15:08:25 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8633F746333; Thu, 14 Oct 2021 15:08:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 84F7F7462D3;
 Thu, 14 Oct 2021 15:08:25 +0200 (CEST)
Date: Thu, 14 Oct 2021 15:08:25 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
In-Reply-To: <20211014130159.cwkub7g7akco76ls@sirius.home.kraxel.org>
Message-ID: <338972bc-7256-e648-83d6-b31de2aaf34c@eik.bme.hu>
References: <20211013121929.9E835746333@zero.eik.bme.hu>
 <20211014091035.xlhh74aioxhkxelf@sirius.home.kraxel.org>
 <1e91fd14-f112-b5b7-abfb-117cbb109c39@eik.bme.hu>
 <20211014130159.cwkub7g7akco76ls@sirius.home.kraxel.org>
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Oct 2021, Gerd Hoffmann wrote:
> On Thu, Oct 14, 2021 at 12:22:58PM +0200, BALATON Zoltan wrote:
>> On Thu, 14 Oct 2021, Gerd Hoffmann wrote:
>>> On Wed, Oct 13, 2021 at 02:13:09PM +0200, BALATON Zoltan wrote:
>>>> This device is part of a superio/ISA bridge chip and IRQs from it are
>>>> routed to an ISA interrupt set by the Interrupt Line PCI config
>>>> register. Change uhci_update_irq() to allow this and implement it in
>>>> vt82c686-uhci-pci.
>>>
>>> Looks good.  There are some unrelated changes in though (whitespace,
>>> comments, ...), and the vt82c686-uhci-pci.c changes should be a
>>> separate patch.
>>
>> So you mean split it into a series of three small patches? Should I do a w4
>> with that?
>
> I was thinking about two patches: drop the unrelated stuff, one patch
> for the irq signaling change, and one for the vt82c686 changes.
>
> But of course you can add more patches for the other changes, i.e.
> dropping the else branch for level = 0 and other small tweaks.

The tewak for the comment is needed for checkpach, dropping the else is 
just to make the function shorter and IMO more readable. I can do this in 
a previous patch so checkpatch won't complain on the pci irq change or 
need at least the comment change in that patch. I'm thinking about an 
alternative way for the vt82c686 part to avoid using isa_get_irq which has 
a comment saying it should be dropped but not sure about that yet, I'll 
try it and submit a v4 with at least breaking it up to smaller patches.

Thanks,
BALATON Zoltan

