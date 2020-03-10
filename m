Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE28518061E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 19:21:59 +0100 (CET)
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBjVu-0002OB-Jo
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 14:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jBjV4-0001t2-MW
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 14:21:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jBjV3-0000d2-Lz
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 14:21:06 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:37317)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jBjV0-0000QL-R7; Tue, 10 Mar 2020 14:21:02 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2151F746381;
 Tue, 10 Mar 2020 19:20:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F117174637D; Tue, 10 Mar 2020 19:20:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EE8A1745953;
 Tue, 10 Mar 2020 19:20:58 +0100 (CET)
Date: Tue, 10 Mar 2020 19:20:58 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v3 2/3] pci: Honour wmask when resetting PCI_INTERRUPT_LINE
In-Reply-To: <aa0c718b-ca5c-520f-5cbc-fb711b1e3008@ilande.co.uk>
Message-ID: <alpine.BSF.2.22.395.2003101920390.30321@zero.eik.bme.hu>
References: <cover.1583781493.git.balaton@eik.bme.hu>
 <857e327a240f2175fe5105f0ebdfe1357fef32c7.1583781494.git.balaton@eik.bme.hu>
 <20200309163632-mutt-send-email-mst@kernel.org>
 <alpine.BSF.2.22.395.2003092151340.94024@zero.eik.bme.hu>
 <aa0c718b-ca5c-520f-5cbc-fb711b1e3008@ilande.co.uk>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-769047215-1583864458=:30321"
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 philmd@redhat.com, qemu-devel@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, John Snow <jsnow@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-769047215-1583864458=:30321
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Mar 2020, Mark Cave-Ayland wrote:
> On 09/03/2020 20:54, BALATON Zoltan wrote:
>> On Mon, 9 Mar 2020, Michael S. Tsirkin wrote:
>>> On Mon, Mar 09, 2020 at 08:18:13PM +0100, BALATON Zoltan wrote:
>>>> The pci_do_device_reset() function (called from pci_device_reset)
>>>> clears the PCI_INTERRUPT_LINE config reg of devices on the bus but d=
id
>>>> this without taking wmask into account. We'll have a device model no=
w
>>>> that needs to set a constant value for this reg and this patch allow=
s
>>>> to do that without additional workaround in device emulation to
>>>> reverse the effect of this PCI bus reset function.
>>>>
>>>> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> ---
>>>> =C2=A0hw/pci/pci.c | 4 +++-
>>>> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>>> index e1ed6677e1..d07e4ed9de 100644
>>>> --- a/hw/pci/pci.c
>>>> +++ b/hw/pci/pci.c
>>>> @@ -302,8 +302,10 @@ static void pci_do_device_reset(PCIDevice *dev)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 pci_word_test_and_clear_mask(dev->config + =
PCI_STATUS,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_get_word(dev->=
wmask + PCI_STATUS) |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_get_word(dev->=
w1cmask + PCI_STATUS));
>>>> +=C2=A0=C2=A0=C2=A0 pci_word_test_and_clear_mask(dev->config + PCI_I=
NTERRUPT_LINE,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_get_word(dev->wmask + PCI_INTERRUPT_LI=
NE) |
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_get_word(dev->w1cmask + PCI_INTERRUPT_=
LINE));
>>>
>>> PCI spec says:
>>>
>>> Interrupt Line
>>> The Interrupt Line register is an eight-bit register used to communic=
ate interrupt
>>> line routing
>>> information.
>>>
>>> I don't see how it makes sense to access it as a word.
>>
>> Patch actually comes from Mark, I don't know. Should we change it to
>> pci_byte_test_and_clear_mask or what's the appropriate way here?
>
> Ooops yes it should pci_byte_test_and_clear_mask(). Clearly I got a bit=
 too excited
> from copying the existing examples in pci_do_device_reset().

OK will test it and send updated version.

Regards,
BALATON Zoltan
--3866299591-769047215-1583864458=:30321--

