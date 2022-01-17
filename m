Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD434905E3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 11:25:39 +0100 (CET)
Received: from localhost ([::1]:33448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9PCk-0003GP-3Z
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 05:25:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n9PBL-0002KA-IZ
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:24:11 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:29748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n9PB7-0005BV-QI
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:24:09 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C414C7457ED;
 Mon, 17 Jan 2022 11:23:46 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A4D407457E7; Mon, 17 Jan 2022 11:23:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A391974579D;
 Mon, 17 Jan 2022 11:23:46 +0100 (CET)
Date: Mon, 17 Jan 2022 11:23:46 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/5] usb/ohci: Move USBPortOps related functions together
In-Reply-To: <0a5528c5-9b4c-eb9c-58ef-489efd3dc291@amsat.org>
Message-ID: <324cc571-732c-7fba-e73c-ab98df4d74d0@eik.bme.hu>
References: <cover.1642339238.git.balaton@eik.bme.hu>
 <8e2deb83f2bf2846f9115962e1e2fedf5a56317f.1642339238.git.balaton@eik.bme.hu>
 <0a5528c5-9b4c-eb9c-58ef-489efd3dc291@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1768463800-1642415026=:68881"
X-Spam-Probability: 9%
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1768463800-1642415026=:68881
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 16 Jan 2022, Philippe Mathieu-Daudé wrote:
> On 16/1/22 14:20, BALATON Zoltan wrote:
>> This also allows removing two forward declarations
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/usb/hcd-ohci.c | 204 +++++++++++++++++++++++-----------------------
>>   1 file changed, 100 insertions(+), 104 deletions(-)
>
>> +static const MemoryRegionOps ohci_mem_ops = {
>> +    .read = ohci_mem_read,
>> +    .write = ohci_mem_write,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>> +};
>> +
>> +/* USBPortOps */
>> +static void ohci_attach(USBPort *port1)
>> +{
>> +    OHCIState *s = port1->opaque;
>> +    OHCIPort *port = &s->rhport[port1->index];
>> +    uint32_t old_state = port->ctrl;
>> +
>> +    /* set connect status */
>> +    port->ctrl |= OHCI_PORT_CCS | OHCI_PORT_CSC;
>> +
>> +    /* update speed */
>> +    if (port->port.dev->speed == USB_SPEED_LOW) {
>> +        port->ctrl |= OHCI_PORT_LSDA;
>> +    } else {
>> +        port->ctrl &= ~OHCI_PORT_LSDA;
>> +    }
>> +
>> +    /* notify of remote-wakeup */
>> +    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
>> +        ohci_set_interrupt(s, OHCI_INTR_RD);
>> +    }
>> +
>> +    trace_usb_ohci_port_attach(port1->index);
>> +
>> +    if (old_state != port->ctrl) {
>> +        ohci_set_interrupt(s, OHCI_INTR_RHSC);
>> +    }
>> +}
>> +
>>   static void ohci_async_cancel_device(OHCIState *ohci, USBDevice *dev)
>>   {
>>       if (ohci->async_td &&
>> @@ -1799,11 +1735,71 @@ static void ohci_async_cancel_device(OHCIState 
>> *ohci, USBDevice *dev)
>>       }
>>   }
>
> We could have ohci_attach() just before ohci*_detach(),

The ohci_child_detach() function (which the next patch merges with 
ohci_async_cancel_device) is used by ohci_detach() but not ohci_attach() 
that's why I've put it between attach and detach. Attach and detach are 
less related than ohci_child_detach and ohci_detach in my opinion. Attach 
and detach are still close enough after the next patch but without moving 
child_detach and detach apart.

> anyhow:
>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks for the review.

Regards,
BALATON Zoltan
--3866299591-1768463800-1642415026=:68881--

