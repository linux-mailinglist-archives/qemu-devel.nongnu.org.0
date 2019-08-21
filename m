Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C40977ED
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 13:29:26 +0200 (CEST)
Received: from localhost ([::1]:47126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0Ons-0006Pd-0r
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 07:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53131)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1i0Of3-0004Ns-TU
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 07:20:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1i0Odn-0005iR-VU
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 07:19:00 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:49243)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1i0Odn-0005ZH-PQ
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 07:18:59 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4133874581E;
 Wed, 21 Aug 2019 13:18:47 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 24DFA7456D5; Wed, 21 Aug 2019 13:18:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1C5C47456B4;
 Wed, 21 Aug 2019 13:18:47 +0200 (CEST)
Date: Wed, 21 Aug 2019 13:18:47 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
In-Reply-To: <20190821090826.edlqptxyjg4cyacj@sirius.home.kraxel.org>
Message-ID: <alpine.BSF.2.21.9999.1908211313020.60573@zero.eik.bme.hu>
References: <cover.1565907489.git.balaton@eik.bme.hu>
 <1e658a7a7198a9ab10084bb85348e7d0a37a9055.1565907489.git.balaton@eik.bme.hu>
 <20190821090826.edlqptxyjg4cyacj@sirius.home.kraxel.org>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-devel] [PATCH 2/3] ati-vga: Support unaligned access to
 hardware cursor registers
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Wed, 21 Aug 2019, Gerd Hoffmann wrote:
>> @@ -672,48 +678,71 @@ static void ati_mm_write(void *opaque, hwaddr addr,
>>      case 0xf00 ... 0xfff:
>>          /* read-only copy of PCI config space so ignore writes */
>>          break;
>> -    case CUR_OFFSET:
>> -        if (s->regs.cur_offset != (data & 0x87fffff0)) {
>> -            s->regs.cur_offset = data & 0x87fffff0;
>> +    case CUR_OFFSET ... CUR_OFFSET + 3:
>> +    {
>> +        uint32_t t = s->regs.cur_offset;
>> +
>> +        ati_reg_write_offs(&t, addr - CUR_OFFSET, data, size);
>> +        t &= 0x87fffff0;
>> +        if (s->regs.cur_offset != t) {
>> +            s->regs.cur_offset = t;
>
> Repeated pattern.  I'd suggest to add a "wmask" parameter to
> ati_reg_write_offs.  Maybe also make it return true/false depending
> on whenever the value did change or not.

This is a pattern in these HW cursor related regs but other callers of 
write_offs don't do that (currently there are one more of the CUR_* regs 
vs. others 5 to 4 but there may be other uses later as several regs 
support less than 32 bit access). It would also break symmetry between 
read_offs and write_offs so I think I'd leave this off write_offs for now 
unless new callers in the future will also need wmask. (It you insist I 
could make it a macro for CUR_* regs but not sure that would improve it 
much.)

Regards,
BALATON Zoltan

