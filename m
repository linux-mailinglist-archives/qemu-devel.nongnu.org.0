Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EFC2E210A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 20:50:15 +0100 (CET)
Received: from localhost ([::1]:47594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksA9F-0002nK-NC
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 14:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksA8N-00025H-B5
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 14:49:19 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:24335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksA8I-00034s-LO
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 14:49:17 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 44540746552;
 Wed, 23 Dec 2020 20:49:09 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B013B746557; Wed, 23 Dec 2020 20:49:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id AE5BE746553;
 Wed, 23 Dec 2020 20:49:08 +0100 (CET)
Date: Wed, 23 Dec 2020 20:49:08 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: Problems with irq mapping in qemu v5.2
In-Reply-To: <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
Message-ID: <76436cc0-9c3-2b80-52b8-74f69cca27ca@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-155495112-1608752948=:95188"
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-155495112-1608752948=:95188
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 23 Dec 2020, Philippe Mathieu-Daudé wrote:
> On 12/22/20 5:16 PM, Guenter Roeck wrote:
>> Hi,
>>
>> commit 459ca8bfa41 ("pci: Assert irqnum is between 0 and bus->nirqs in
>> pci_bus_change_irq_level") added sanity checks to the interrupt number passed
>> to pci_bus_change_irq_level(). That makes sense, given that bus->irq_count
>> is indexed and sized by the number of interrupts.
>>
>> However, as it turns out, the interrupt number passed to this function
>> is the _mapped_ interrupt number. The result in assertion failures for various
>> emulations.
>>
>> Examples (I don't know if there are others):
>>
>> - ppc4xx_pci_map_irq() maps the interrupt number to "slot - 1". Obviously
>>   that isn't a good thing to do for slot 0, and indeed results in an
>>   assertion as soon as slot 0 is initialized (presumably that is the root
>>   bridge). Changing the mapping to "slot" doesn't help because valid slots
>>   are 0..4, and only four interrupts are allocated.
>> - pci_bonito_map_irq() changes the mapping all over the place. Whatever
>>   it does, it returns numbers starting with 32 for slots 5..12. With
>>   a total number of 32 interrupts, this again results in an assertion
>>   failure.
>>
>> ppc4xx_pci_map_irq() is definitely buggy. I just don't know what the
>> correct mapping should be. slot  & 3, maybe ?
>>
>> I don't really have a good solution for pci_bonito_map_irq(). It may not
>> matter much - I have not been able to boot fuloong_2e since qemu v4.0,
>> and afaics that is the only platform using it. Maybe it is just completely
>> broken ?
>
> FWIW bisecting Fuloong2E starts failing here:
>
> 4ea98d317eb442c738f898f16cfdd47a18b7ca49 is the first bad commit
> commit 4ea98d317eb442c738f898f16cfdd47a18b7ca49
> Author: BALATON Zoltan <balaton@eik.bme.hu>
> Date:   Fri Jan 25 14:52:12 2019 -0500
>
>    ide/via: Implement and use native PCI IDE mode
>
>    This device only implemented ISA compatibility mode and native PCI IDE
>    mode was missing but no clients actually need ISA mode but to the
>    contrary, they usually want to switch to and use device in native
>    PCI IDE mode. Therefore implement native PCI mode and switch default
>    to that.
>
>    Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>    Message-id:
> c323f08c59b9931310c5d92503d370f77ce3a557.1548160772.git.balaton@eik.bme.hu
>    Signed-off-by: John Snow <jsnow@redhat.com>
>
> hw/ide/via.c | 52 ++++++++++++++++++++++++++++++++++++++--------------
> 1 file changed, 38 insertions(+), 14 deletions(-)

How did you test? What guest OS and version have you used?

Regards,
BALATON Zoltan
--3866299591-155495112-1608752948=:95188--

