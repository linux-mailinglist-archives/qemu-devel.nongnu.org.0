Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BAC31C40E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 23:31:02 +0100 (CET)
Received: from localhost ([::1]:38372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBmOU-0004zg-1f
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 17:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lBmNH-0004Tu-SN
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:29:47 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38012
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lBmNG-0008Aa-CI
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:29:47 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lBmNV-0001Xv-Ld; Mon, 15 Feb 2021 22:30:07 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-4-mark.cave-ayland@ilande.co.uk>
 <743ad0ea-6b85-29cb-8f92-60b4d9f0e9de@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <4cdbc056-fc58-15f7-b480-860b1821974e@ilande.co.uk>
Date: Mon, 15 Feb 2021 22:29:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <743ad0ea-6b85-29cb-8f92-60b4d9f0e9de@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 03/42] esp: QOMify the internal ESP device state
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/02/2021 18:51, Philippe Mathieu-Daudé wrote:

> On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
>> Make this new QOM device state a child device of both the sysbus-esp and esp-pci
>> implementations.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/esp-pci.c     | 48 +++++++++++++++++++++++++++++++------------
>>   hw/scsi/esp.c         | 45 +++++++++++++++++++++++++++++++++-------
>>   include/hw/scsi/esp.h |  5 +++++
>>   3 files changed, 78 insertions(+), 20 deletions(-)
> 
> Please setup scripts/git.orderfile ;)

I will have to take a look at this at some point - it has been on my TODO list for a 
while :)

>> @@ -354,9 +365,11 @@ static void esp_pci_scsi_realize(PCIDevice *dev, Error **errp)
>>   {
>>       PCIESPState *pci = PCI_ESP(dev);
>>       DeviceState *d = DEVICE(dev);
>> -    ESPState *s = &pci->esp;
>> +    ESPState *s = ESP(&pci->esp);
>>       uint8_t *pci_conf;
>>   
>> +    qdev_realize(DEVICE(s), NULL, errp);
> 
>         if (!qdev_realize(DEVICE(s), NULL, errp)) {
>             return;
>         }
> 
>>       pci_conf = dev->config;
>>   
>>       /* Interrupt pin A */
>> @@ -375,11 +388,19 @@ static void esp_pci_scsi_realize(PCIDevice *dev, Error **errp)
>>       scsi_bus_new(&s->bus, sizeof(s->bus), d, &esp_pci_scsi_info, NULL);
>>   }
> ...
> 
>> @@ -956,7 +958,9 @@ static void sysbus_esp_realize(DeviceState *dev, Error **errp)
>>   {
>>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>       SysBusESPState *sysbus = SYSBUS_ESP(dev);
>> -    ESPState *s = &sysbus->esp;
>> +    ESPState *s = ESP(&sysbus->esp);
>> +
>> +    qdev_realize(DEVICE(s), NULL, errp);
> 
>         if (!qdev_realize(DEVICE(s), NULL, errp)) {
>             return;
>         }
> 
> With both if():
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Great! I've added the if() statements and added your R-B to the patch.


ATB,

Mark.

