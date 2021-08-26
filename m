Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B99C3F8FC6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 22:47:21 +0200 (CEST)
Received: from localhost ([::1]:53642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMHK-0005wy-Mr
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 16:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mJMFs-0005FK-FN
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 16:45:44 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49856
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mJMFq-0005Uf-PT
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 16:45:44 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mJMFS-0009aD-Vz; Thu, 26 Aug 2021 21:45:19 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210826200720.2196827-1-philmd@redhat.com>
 <20210826200720.2196827-2-philmd@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a85f1c5a-8b4e-161f-4df2-1bdffc3ad04d@ilande.co.uk>
Date: Thu, 26 Aug 2021 21:45:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210826200720.2196827-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 1/3] hw/pci: Introduce pci_dma_memory_region() helper
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/08/2021 21:07, Philippe Mathieu-Daudé wrote:

> pci_get_address_space() returns an AddressSpace. In some
> cases we want a MemoryRegion. Add the pci_dma_memory_region()
> equivalent helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   include/hw/pci/pci.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index d0f4266e372..5860f42e400 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -786,6 +786,11 @@ static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
>       return &dev->bus_master_as;
>   }
>   
> +static inline MemoryRegion *pci_dma_memory_region(PCIDevice *dev)
> +{
> +    return &dev->bus_master_container_region;
> +}
> +
>   /**
>    * pci_dma_rw: Read from or write to an address space from PCI device.
>    *

This patch doesn't quite feel right: there are already a number of devices that have 
been using pci_get_address_space() for some time without requiring access to the 
underlying MemoryRegion. So then the first question I ask myself when I see this 
patch is why do we suddenly need it now?


ATB,

Mark.

