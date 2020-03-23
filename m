Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E01B18F724
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 15:44:05 +0100 (CET)
Received: from localhost ([::1]:34727 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGOJ9-0004bq-Vp
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 10:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42610)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jGOII-0003xe-Aq
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 10:43:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jGOIH-0000QE-9v
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 10:43:10 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:11137)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jGOIE-0000PK-MB; Mon, 23 Mar 2020 10:43:06 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 019D574637E;
 Mon, 23 Mar 2020 15:43:03 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DA6887461AE; Mon, 23 Mar 2020 15:43:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D8DEC745953;
 Mon, 23 Mar 2020 15:43:02 +0100 (CET)
Date: Mon, 23 Mar 2020 15:43:02 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Coverity CID 1421984
In-Reply-To: <CAFEAcA9Ubue9Lk2jXJyZ+OUmk0j58ZKKnER1RxMi0b05FaN4QQ@mail.gmail.com>
Message-ID: <alpine.BSF.2.22.395.2003231539160.47226@zero.eik.bme.hu>
References: <d9b7d8d8-1640-7d69-cd16-66e6d9cef3d1@redhat.com>
 <88618db3-cb48-12bd-6152-b642b25a0287@redhat.com>
 <alpine.BSF.2.22.395.2003231359420.14974@zero.eik.bme.hu>
 <CAFEAcA9+WPxGYqk5_-v=oXPK=UcvngXGaOLY3njM5iNN2CFh2g@mail.gmail.com>
 <alpine.BSF.2.22.395.2003231459410.34482@zero.eik.bme.hu>
 <CAFEAcA9Ubue9Lk2jXJyZ+OUmk0j58ZKKnER1RxMi0b05FaN4QQ@mail.gmail.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: Qemu-block <qemu-block@nongnu.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Mar 2020, Peter Maydell wrote:
> On Mon, 23 Mar 2020 at 14:06, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> On Mon, 23 Mar 2020, Peter Maydell wrote:
>>> Coverity has flagged up a lot of leaks involving qemu_allocate_irqs();
>>> most of them I've for the moment just set as "insignificant, fix
>>> required" because they're in called-once functions like board init.
>>> If this device can't be hot-unplugged and so we will only ever call
>>> realize once, it would fall in that category too. Otherwise I'd
>>> suggest conversion to qdev_init_gpio_in(). (This allocates arrays
>>> of IRQs under the hood too, but the device_finalize() function will
>>> automatically free them for you, so it's easier to use non-leakily.)
>>
>> I think I can't do that in sii3112 becuase I need to pass irq to this func:
>>
>> void ide_init2(IDEBus *bus, qemu_irq irq);
>
> ide_init2(bus, qdev_get_gpio_in(DEVICE(dev), i);
>
> should do what you want, I think.

I don't understand what you mean. Sent a patch that I think might fix this 
warning for now. I'd leave qdevifying ide code to someone else.

Regards,
BALATON Zoltan

