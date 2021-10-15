Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B208A42ECE3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:55:36 +0200 (CEST)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJ02-00028j-NP
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbIP6-0006vw-MX
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbIP4-0007dH-Gr
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634285841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1PYUq0eWreESecI0ueY6fTSzgMcIDtAgZCccnKiAbgI=;
 b=api0Gank+yrePE2NVGqT/is8/jF7jvWO93uuF6LGtICoKO6TUIqUHd08JfEG5QTosHFLGA
 OUklaAnvwB1pHdNXcLdC8wp2NIA8qIR5ufdrEK0j9ataG2SgReDi7jVn/mznaUQjyPK9hv
 VZd+30fRaZUpSQ5ezkSra/Rp2wQPln4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-GwVbmWNuNMeb67hRorUU-A-1; Fri, 15 Oct 2021 04:17:14 -0400
X-MC-Unique: GwVbmWNuNMeb67hRorUU-A-1
Received: by mail-wm1-f71.google.com with SMTP id
 p63-20020a1c2942000000b0030ccf0767baso591551wmp.6
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 01:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1PYUq0eWreESecI0ueY6fTSzgMcIDtAgZCccnKiAbgI=;
 b=I2Ep+wHboMWWEUYLpbD9MtrMvhPYa3UpPKuXI7vfsCtvJc/7WuQ2uphC5i86Gl7/oK
 Ayxc7g6UneZiOVR+qw/3+PEMPJIPRlrnXW79gUfuwRKuGQQENWiHHGff5JkroWhEAd9N
 Eav53fYB+sEPpI5iNbpNj3GXdWtW2XbsmgOlQOBOLqBjMEP4mAIlxSzjPXhIEOaUv5mg
 q9UptmJmtdXRzO9+ITJnImv46Fx02xJr9JDzGuSKwADRZ1QC3teX/RTxBPaKZjpYywx3
 5gA+s3jdIjnCDDVxcSEDTcrFCUF4UsTB3QB+2T5+LlsB3YSFiRwCJquP0DbERANakofa
 QA9g==
X-Gm-Message-State: AOAM530mORSvk+cd0oxqKOs5HtD+U6xJg2NKsN8FRGWrFT7+La1ucM/9
 ZQLz7YMnSGKU8hkC+DIFWHU8y9EyNRjCJrp3Thsn2ANFx1CguKKdG/7Ota7NxLqaYSju454VDW6
 Wh6xG0nL19RgfU/o=
X-Received: by 2002:adf:a402:: with SMTP id d2mr12707847wra.266.1634285833410; 
 Fri, 15 Oct 2021 01:17:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywl9hQY0jqH1B4ZuIhrukKKtrPcYQ2teB/SJaxURKf9N4IqABk1Q1g6uqJqJbyLpJcHKX3kg==
X-Received: by 2002:adf:a402:: with SMTP id d2mr12707813wra.266.1634285833073; 
 Fri, 15 Oct 2021 01:17:13 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id c77sm4174678wme.48.2021.10.15.01.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 01:17:12 -0700 (PDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>
References: <fc2e00d1-2373-3223-03c8-195585face66@redhat.com>
 <80f727b8-9eb0-6a49-e4a7-b2616583c43f@csgroup.eu>
 <2642fe45-16af-0281-92e1-e1fc68b1069b@csgroup.eu>
 <874bab13-a7f9-9449-2285-19731da2947c@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Is the ppc440 "bamboo" board in QEMU still of any use?
Message-ID: <cb3fad3f-92b2-472e-ad53-5494dee79ca9@redhat.com>
Date: Fri, 15 Oct 2021 10:17:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <874bab13-a7f9-9449-2285-19731da2947c@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alexander Graf <agraf@csgraf.de>, hpoussin@reactos.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/10/2021 13.44, Mark Cave-Ayland wrote:
> On 14/10/2021 11:47, Christophe Leroy wrote:
> 
>> Le 14/10/2021 à 12:34, Christophe Leroy a écrit :
>>>
>>>
>>> Le 14/10/2021 à 11:31, Thomas Huth a écrit :
>>>>
>>>>   Hi,
>>>>
>>>> I tried to build a current Linux kernel for the "bamboo" board and use 
>>>> it in QEMU, but QEMU then quickly aborts with:
>>>>
>>>>   pci.c:262: pci_bus_change_irq_level: Assertion `irq_num >= 0' failed.
>>>>
>>>> (or with a "DCR write error" if I try to use the cuImage instead).
>>>>
>>>> I googled a little bit and found this discussion:
>>>>
>>>> https://qemu-devel.nongnu.narkive.com/vYHona3u/emulating-powerpc-440ep-with-qemu-system-ppcemb#post2 
>>>>
>>>>
>>>> Seems like this board was used for KVM on the PPC440 only, and has never 
>>>> been enabled with the TCG emulation?
>>>>
>>>> Well, KVM support on the 440 has been removed years ago already:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b2677b8dd8de0dc1496ede4da09b9dfd59f15cea 
>>>>
>>>>
>>>> So is this "bamboo" board dead code in QEMU now? Or does anybody still 
>>>> have a kernel binary which could be used for testing it? Note: This 
>>>> board does not support "-bios", so u-boot or other firmwares are 
>>>> certainly also not an option here...
>>>> Should we mark "bamboo" as deprecated nowadays?
>>>>
>>>
>>> I have the following change in QEMU to be able to run the bamboo, found 
>>> it some time ago via google (can't remember where):
>>>
>>> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
>>> index 8147ba6f94..600e89e791 100644
>>> --- a/hw/ppc/ppc4xx_pci.c
>>> +++ b/hw/ppc/ppc4xx_pci.c
>>> @@ -246,7 +246,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int 
>>> irq_num)
>>>
>>>       trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
>>>
>>> -    return slot - 1;
>>> +    return slot ? slot - 1 : slot;
>>>   }
>>>
>>>   static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
>>> ---
>>>
>>> It's probably no the final change, but at least it allows booting bamboo 
>>> on qemu again.
>>>
>>
>> Found the source : 
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg769121.html
> 
> Ah yes, that thread rings a bell. I think the important part was in my 
> initial reply at 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg769115.html: in other 
> words ppc4xx_pci_map_irq() function expects the IRQ number to range from 1 
> to 4.
> 
> When I looked at this the issue was caused by the guest writing to PCI 
> configuration space to disable PCI interrupts: this ends up calling 
> pci_update_irq_disabled() as below:
> 
> /* Called after interrupt disabled field update in config space,
>   * assert/deassert interrupts if necessary.
>   * Gets original interrupt disable bit value (before update). */
> static void pci_update_irq_disabled(PCIDevice *d, int was_irq_disabled)
> {
>      int i, disabled = pci_irq_disabled(d);
>      if (disabled == was_irq_disabled)
>          return;
>      for (i = 0; i < PCI_NUM_PINS; ++i) {
>          int state = pci_irq_state(d, i);
>          pci_change_irq_level(d, i, disabled ? -state : state);
>      }
> }
> 
> Since the IRQ is disabled pci_change_irq_level() ends up being called with 
> -1 which triggers the assert().

I think you likely mixed up the paramters here. The -1 is the "change" 
parameter, but the critical value that is tested in the assert() statement 
later is the irq_num variable which comes from the map_irq() function.

Now looking at ppc4xx_pci_map_irq(), I think the code is basically correct 
for the PCI slots 1 to 4. You can verify that with the image from

 
http://landley.net/aboriginal/downloads/binaries/system-image-powerpc-440fp.tar.gz

and by starting QEMU e.g. with:

qemu-system-ppc64  -kernel linux -initrd rootfs.cpio.gz \
   -M bamboo -device e1000  -device e1000 -device e1000 \
   -netdev user,id=u1 -device rtl8139,netdev=u1

You can see the 8139 card with "lspci" in the last slot, and a "ping 
10.0.2.2" only works if the map_irq function returns "slot - 1" in this case 
(otherwise it even crashes after a while).

Now back to the original problem: This seems to occur indeed since recent 
self-compiled Linux kernels also try to mess with the pci host bridge device 
in slot 0. So the question is only, which interrupt number should the 
map_irq() function return in case it has been called with the PCI host 
bridge device in slot 0?

Both hacks with "return slot ? slot - 1 : 0;" and "return (slot - 1) & 3" 
seem to work, as far as I can tell, and I think the IRQ for the host bridge 
is then ignored anyway, so maybe we should simply add one of the two and 
call it a day?

  Thomas


