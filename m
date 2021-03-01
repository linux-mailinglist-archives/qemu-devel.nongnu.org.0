Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B033290AA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:13:46 +0100 (CET)
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGovJ-0007Ak-AG
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGotc-0006gZ-3W
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:12:00 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:58157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGotW-0002Ka-RH
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:11:59 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MTiDV-1lM0Sl1TbB-00U4HX; Mon, 01 Mar 2021 21:11:38 +0100
Subject: Re: [PATCH v2 03/42] esp: QOMify the internal ESP device state
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-4-mark.cave-ayland@ilande.co.uk>
 <743ad0ea-6b85-29cb-8f92-60b4d9f0e9de@amsat.org>
 <4cdbc056-fc58-15f7-b480-860b1821974e@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <163eaac8-bdcc-9ea8-b024-ba24d1f470af@vivier.eu>
Date: Mon, 1 Mar 2021 21:11:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4cdbc056-fc58-15f7-b480-860b1821974e@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rdWw6iggf+o9PWe7/vos4L7E/ChHKP06DI4Pqb4sxn+PyOq4fh1
 FHZPhYum6kiMpEmiERPZkKW0o5VWU+uW6/9Sfnimhug4cAIobMB7Ij+JoMN0/77n6zelxbu
 LbGX05qil6WmxcO7zKh1UoU7V8FjPRaK/+YR4NRkwurrGL0koSYPFy7bL4VMINkc4enQJaT
 dz/rD/CFztdhNK+fpsR8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JOe3psaJ+N8=:F69S6ChlLJGisRS/SKwoPc
 YIGK4CaCvvmJkx0mbPrKs3TqeCYY5Rk04ShRPZ1yYSUENgCRna/k340SByjr53PO93b/5yPII
 GyofaNgXvhvhWOgcoxFYkTngHWg87RYkyvEf/IswWsFUDZP4yfAQ+x7Xu7sQjUlI860fyjQFv
 xELJOaEl3i789j9uzYo5hyJjvy1xj/6f7h3dlaygweh6Q8wRkHSkZzqUe0aXd4Su7lyUWdQB4
 LODr0nucqLRENRqMuhmYIXubx9K3+6pELy0Sz0Dz3tJNDGw1iP8L4CuQbP9lVeS4EtBJmxw/r
 gD3EQ7KxuJtNRV9Q4u86a/SDjrrhVMz7OPwBCpkBLZNfcirGIvr5bXKJNK6Qbg/l1rJ0u2s6M
 rdUAB1awr2/DGNEpnJNJWOSc1uTA6z+YxO4IOfSXjuBTKymzjmtfP/R1bEATbiw7rIAq3uBlj
 gvG6G+D6xA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 15/02/2021 à 23:29, Mark Cave-Ayland a écrit :
> On 12/02/2021 18:51, Philippe Mathieu-Daudé wrote:
> 
>> On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
>>> Make this new QOM device state a child device of both the sysbus-esp and esp-pci
>>> implementations.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hw/scsi/esp-pci.c     | 48 +++++++++++++++++++++++++++++++------------
>>>   hw/scsi/esp.c         | 45 +++++++++++++++++++++++++++++++++-------
>>>   include/hw/scsi/esp.h |  5 +++++
>>>   3 files changed, 78 insertions(+), 20 deletions(-)
>>
>> Please setup scripts/git.orderfile ;)
> 
> I will have to take a look at this at some point - it has been on my TODO list for a while :)
> 
>>> @@ -354,9 +365,11 @@ static void esp_pci_scsi_realize(PCIDevice *dev, Error **errp)
>>>   {
>>>       PCIESPState *pci = PCI_ESP(dev);
>>>       DeviceState *d = DEVICE(dev);
>>> -    ESPState *s = &pci->esp;
>>> +    ESPState *s = ESP(&pci->esp);
>>>       uint8_t *pci_conf;
>>>   +    qdev_realize(DEVICE(s), NULL, errp);
>>
>>         if (!qdev_realize(DEVICE(s), NULL, errp)) {
>>             return;
>>         }
>>
>>>       pci_conf = dev->config;
>>>         /* Interrupt pin A */
>>> @@ -375,11 +388,19 @@ static void esp_pci_scsi_realize(PCIDevice *dev, Error **errp)
>>>       scsi_bus_new(&s->bus, sizeof(s->bus), d, &esp_pci_scsi_info, NULL);
>>>   }
>> ...
>>
>>> @@ -956,7 +958,9 @@ static void sysbus_esp_realize(DeviceState *dev, Error **errp)
>>>   {
>>>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>>       SysBusESPState *sysbus = SYSBUS_ESP(dev);
>>> -    ESPState *s = &sysbus->esp;
>>> +    ESPState *s = ESP(&sysbus->esp);
>>> +
>>> +    qdev_realize(DEVICE(s), NULL, errp);
>>
>>         if (!qdev_realize(DEVICE(s), NULL, errp)) {
>>             return;
>>         }
>>
>> With both if():
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Great! I've added the if() statements and added your R-B to the patch.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

