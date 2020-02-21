Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6BD16821A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 16:44:43 +0100 (CET)
Received: from localhost ([::1]:60008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5ATq-0003tv-Ny
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 10:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39477)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j5ASe-0003Ca-Dy
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:43:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j5ASb-0002RV-PS
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:43:27 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:50377)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1j5ASb-0002IE-JX
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:43:25 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7F542747DFB;
 Fri, 21 Feb 2020 16:43:15 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 62F99747DF8; Fri, 21 Feb 2020 16:43:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 613CE747DF7;
 Fri, 21 Feb 2020 16:43:15 +0100 (CET)
Date: Fri, 21 Feb 2020 16:43:15 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: jasper.lowell@bt.com
Subject: Re: [PATCH] hw/ide: Remove status register read side effect
In-Reply-To: <20200221065015.337915-1-jasper.lowell@bt.com>
Message-ID: <alpine.BSF.2.22.395.2002211635360.45267@zero.eik.bme.hu>
References: <20200221065015.337915-1-jasper.lowell@bt.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 Feb 2020, jasper.lowell@bt.com wrote:
> The Linux libATA API documentation mentions that on some hardware,
> reading the status register has the side effect of clearing the
> interrupt condition. When emulating the generic Sun4u machine running
> Solaris 10, the Solaris 10 CMD646 driver exits fatally because of this
> emulated side effect. This side effect is likely to not exist on real
> CMD646 hardware.

The chip docs don't mention any side effect, they only say that the DMA 
IRQ and Error bits in the bus master IDE status reg (bits 2 and 1) are 
write 1 to clear so this might be OK but this change seems to break 
something else according to a CI test report from patchew. Unfortunately 
this does not change my problems with other BMDMA devices on PPC.

Regards,
BALATON Zoltan

> Signed-off-by: Jasper Lowell <jasper.lowell@bt.com>
> ---
> hw/ide/core.c | 1 -
> 1 file changed, 1 deletion(-)
>
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index 80000eb766..82fd0632ac 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -2210,7 +2210,6 @@ uint32_t ide_ioport_read(void *opaque, uint32_t addr)
>         } else {
>             ret = s->status;
>         }
> -        qemu_irq_lower(bus->irq);
>         break;
>     }
>
>

