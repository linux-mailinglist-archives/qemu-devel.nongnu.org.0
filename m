Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3EE67FB44
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 22:59:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLtDD-0006Ms-Hv; Sat, 28 Jan 2023 16:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pLtD8-0006MD-AQ
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 16:58:10 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pLtD6-0006Mw-Pp
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 16:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IzulqyE993F6gysBRb9hglKtT0tW7f/svEI5M6rcWHE=; b=Ekak0gjbGLV7XmKr335OE8Vs7A
 4VperSkKDRI9UYTFf1Nou3dArLluuXPzfxoXZ9KdDI20Up1wkNQtnRZloX//t7MiWkp2cPLqqva+x
 DJTDcCjinyV1UihVFJyAlkQu77YfJy5iblPnKBetcJDt8IL8Cm4rtsfIEW+HF00wciVE08KqL5FEE
 PKMLmuwMCPKo62R4muZbDw0qijddLrPngxSil4FQUcyRXzzBHCfPzTR0vgho5j+tg3khPu2Y0xm2d
 XU1fcqi63IVqDGwd3K4SEgWys8kSsN9l3S3ZBPZcwKKhJDZR8XPxzrwWnI0T+s4Z457LgkpDG9zaS
 MyLJn8aJsoERRUYGJJJtVkOEfRkSCx3vFt7K2cbhv/F70TXZmip35ast7KfCVjhEsiP4T2txtsKp4
 6e6Uw1r8xG1h8Gj0IfNs1TeWbE5OZOBvXzqIzLmp8RlU0KnNTPioWC5xGHQ38zESShevHCwEjKVkn
 gZKA/d8VgadM2zI6o4ro3pOiJiwigGrTRmyoRNDxM9j+wxPqYhOBqJ7wdlSeGWMRMKfWUR+M8Gz1b
 s7OhCLP+oqcJVbQ9C8+f04aHmde1dYapMyqEm9Gxa0uMpddL+F5V4cYB7bkKaGrzDXsZXYGhrMuoL
 CKb46pQumAKAy9Ecxwq0T/qsTtpUNIUSPhY1KGqJc=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pLtCb-0000Y4-Fn; Sat, 28 Jan 2023 21:57:37 +0000
Message-ID: <2febd48f-c0e4-b5ee-4984-fac257417cef@ilande.co.uk>
Date: Sat, 28 Jan 2023 21:58:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>
References: <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz.ref@aol.com>
 <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz@aol.com>
 <20230127082240-mutt-send-email-mst@kernel.org>
 <ddac019e-28bc-9e0b-c6d7-5bd54d0239f3@aol.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <ddac019e-28bc-9e0b-c6d7-5bd54d0239f3@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] pci: add enforce_slot_reserved_mask_manual property
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/01/2023 03:39, Chuck Zmudzinski wrote:

> On 1/27/2023 8:28 AM, Michael S. Tsirkin wrote:
>> On Sun, Jan 15, 2023 at 07:49:51PM -0500, Chuck Zmudzinski wrote:
>>> The current reserved slot check in do_pci_register_device(), added with
>>> commit 8b8849844fd6
>>
>> add ("subject here") please
>>
>>> ,is done even if the pci device being added is
>>> configured manually for a particular slot. The new property, when set
>>> to false, disables the check when the device is configured to request a
>>> particular slot. This allows an administrator or management tool to
>>> override slot_reserved_mask for a pci device by requesting a particular
>>> slot for the device. The new property is initialized to true which
>>> preserves the existing behavior of slot_reserved_mask by default.
>>>
>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>>
>> Thanks!
>> I'm trying to think of the best default for this.
> 
> I think it would be better for the default value of
> enforce_slot_reserved_mask_manual to be false, so that a
> user-specified slot will by default override slot_reserved_mask.
> But doing that would change the current behavior of
> slot_reserved_mask.
> 
> Currently, this is the only place where slot_reserved_mask is used in all
> of the Qemu source (code from hw/sparc64/sun4u.c):
> 
> ------ snip -------
>      /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
>         reserved (leaving no slots free after on-board devices) however slots
>         0-3 are free on busB */
>      pci_bus->slot_reserved_mask = 0xfffffffc;
>      pci_busA->slot_reserved_mask = 0xfffffff1;
>      pci_busB->slot_reserved_mask = 0xfffffff0;
> ------ snip -------
> 
> I think we could safely change the default value of
> enforce_slot_reserved_mask_manual to false but set
> it to true for the sparc64 sun4u board here to preserve
> the current behavior of the only existing board in Qemu
> that uses slot_reserved_mask.
> 
> What do you think?
> 
>> Users is trying to configure a specific device on a reserved
>> slot. Should we
>> CC a bunch more people for visibility. Input, anyone?

For a bit of background, slot_reserved_mask was added by me to solve a problem with 
the sun4u machine: on a real Ultra-5, the pci "A" bus has 2 free slots and the pci 
"B" bus has 4 free slots. Whilst it is possible to plug a PCI device into any slot in 
QEMU, the PCI bridges only have IRQ mapping registers for those 6 slots, so you can 
easily end up with an auto-allocated slot where it is impossible for the OS to map 
the IRQ.

Hence slot_reserved_mask was originally intended to mark slots as being unavailable 
for both manual and automatic allocation to ensure that devices plugged into both PCI 
buses would always work.

If there is a need to change/refactor the logic then I can test the sun4u machine to 
ensure the original test case still works.


ATB,

Mark.

