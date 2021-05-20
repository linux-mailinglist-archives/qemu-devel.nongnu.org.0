Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E946D38A042
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:53:22 +0200 (CEST)
Received: from localhost ([::1]:59262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeQe-0003fL-Vy
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lje3x-00044E-5d
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:29:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39112
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lje3o-0005zn-Ln
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:29:48 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lje3l-000C7K-Cr; Thu, 20 May 2021 09:29:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210518215545.1793947-1-philmd@redhat.com>
 <20210518215545.1793947-3-philmd@redhat.com>
 <f571a63d-d6a2-2085-740-bcc59b3424e5@eik.bme.hu>
 <a1f3080f-bf74-8779-ccfd-9ef131368bb3@ilande.co.uk>
Message-ID: <911366b6-b900-747f-2be2-236b7f0267d9@ilande.co.uk>
Date: Thu, 20 May 2021 09:29:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <a1f3080f-bf74-8779-ccfd-9ef131368bb3@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 02/11] hw/ide: Add PCIIDEState::isa_bus link
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/05/2021 08:41, Mark Cave-Ayland wrote:

> 3) Add a new pci_isa_bridge_get_isabus(PCIDevice *d) function that the devices such 
> as via-ide can use to obtain a reference to the ISABus from their own PCIDevice. It 
> should hopefully be quite simple like this:
> 
> ISABus *pci_isa_bridge_get_isabus(PCIDevice *d)
> {
>     PCIISABridge *s = PCI_ISA_BRIDGE(d);
> 
>     return s->isa_bus;
> }

Oops - have just realised that PCIDevice in this case is the PCI/ISA device and not 
the bridge itself. This means there is a bit more work to do, perhaps something like:

    ISABus *pci_device_get_isabus(PCIDevice *d)
    {
         PCIBus *bus = pci_get_bus(d);
         PCIDeviceClass *k;
         int devfn;

         for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
             PCIDevice *pd = bus->devices[devfn];
             PCIDeviceClass *k = PCI_DEVICE_GET_CLASS(d);
             PCIISABridge *s;
             if (object_dynamic_cast(OBJECT(pd), TYPE_PCI_ISA_BRIDGE)) {
                 s = PCI_ISA_BRIDGE(pd);
                 return s->isa_bus;
             }
         }

         return NULL;
    }

Given that a PCI-ISA bridge effectively manages the bottom part of the single IO 
address space then I believe there can only be one PCI-ISA bridge per PCI host 
bridge, and therefore bus.


ATB,

Mark.

