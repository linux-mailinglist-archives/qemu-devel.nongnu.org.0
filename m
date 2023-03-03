Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC66A980E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:58:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4zH-00074g-FA; Fri, 03 Mar 2023 07:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pY4z8-0006xx-Tf; Fri, 03 Mar 2023 07:58:06 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pY4z6-00037j-Uh; Fri, 03 Mar 2023 07:58:06 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0D2F2746324;
 Fri,  3 Mar 2023 13:57:58 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C7F50746346; Fri,  3 Mar 2023 13:57:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C68CF7462DB;
 Fri,  3 Mar 2023 13:57:57 +0100 (CET)
Date: Fri, 3 Mar 2023 13:57:57 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org, 
 Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v3 00/18] hw/ide: Untangle ISA/PCI abuses of
 ide_init_ioport()
In-Reply-To: <2e33d6b7-543a-b929-ca23-6102c36d2488@linaro.org>
Message-ID: <1eb7fccc-4aa2-abd2-9383-ac1a30aef3d7@eik.bme.hu>
References: <20230302224058.43315-1-philmd@linaro.org>
 <366B37B3-B601-4405-9D7B-4FF1A6D1B9AF@infradead.org>
 <152836d8-d417-df05-4819-cd3d7756732a@ilande.co.uk>
 <2e33d6b7-543a-b929-ca23-6102c36d2488@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1725957249-1677848277=:28478"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1725957249-1677848277=:28478
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Mar 2023, Philippe Mathieu-Daudé wrote:
> On 3/3/23 08:46, Mark Cave-Ayland wrote:
>> On 03/03/2023 06:58, David Woodhouse wrote:
>> 
>>> On 2 March 2023 22:40:40 GMT, "Philippe Mathieu-Daudé" <philmd@linaro.org> 
>>> wrote:
>>>> Since v2: rebased
>>>> 
>>>> I'm posting this series as it to not block Bernhard's PIIX
>>>> cleanup work. I don't have code change planned, but eventually
>>>> reword / improve commit descriptions.
>>>> 
>>>> Tested commit after commit to be sure it is bisectable. Sadly
>>>> this was before Zoltan & Thomas report a problem with commit
>>>> bb98e0f59c ("hw/isa/vt82c686: Remove intermediate IRQ forwarder").
>>> 
>>> However much I stare at the partial revert which fixes it, I just cannot 
>>> believe that the change could make any difference at all. There's got to 
>>> be something weird going on there.
>>> 
>>> I was going to ask if the level mode for the PIT made any difference, but 
>>> this is the output IRQ from the PIT to the CPU itself so I don't see how 
>>> it would.
>>> 
>>> Would like to see a report with tracing from pic_update_irq, the CPU 
>>> interrupt "handler" and the intermediate IRQ handler. With the 
>>> intermediate present and without it. To compare the two.
>> 
>> I suspect it's related to the removal of the allocation of the qemu_irq: 
>> qdev gpios work by adding a child IRQ object to the device, so it could be 
>> possible that something in the gpio internals isn't being updated correctly 
>> when the value is overwritten directly.
>> 
>> Is the problem picked up when running a binary built with 
>> --enable-sanitizers? That's normally quite good at detecting this kind of 
>> issue.
>
> No ASan warning. However I see (before/after bb98e0f59c):
>
> qemu-system-ppc: pc87312: unsupported device reconfiguration (0f 11 00)
> qemu-system-ppc: pc87312: unsupported device reconfiguration (0f 11 84)
> qemu-system-ppc: pc87312: unsupported device reconfiguration (09 01 84)

This does not seem related at all especially if you also see it before 
because we have the same problem in vt82c686 and this error above rather 
looks liek it should be a qemu_log_mask(LOG_UNIMP) as that's all that 
function seems to do where this is printed so looks like it's just 
unimplemented functionality.

Regards,
BALATON Zoltan
--3866299591-1725957249-1677848277=:28478--

