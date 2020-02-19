Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEDB164F99
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 21:11:00 +0100 (CET)
Received: from localhost ([::1]:59494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4VgQ-0002kA-Th
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 15:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j4Vfa-0002Df-PB
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 15:10:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j4VfZ-0005jn-6c
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 15:10:06 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:45594)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1j4VfZ-0005iV-0Y
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 15:10:05 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 466DD747E01;
 Wed, 19 Feb 2020 21:10:02 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2BD34747DFA; Wed, 19 Feb 2020 21:10:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2A51E747DFF;
 Wed, 19 Feb 2020 21:10:02 +0100 (CET)
Date: Wed, 19 Feb 2020 21:10:02 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: jasper.lowell@bt.com
Subject: RE: Emulating Solaris 10 on SPARC64 sun4u
In-Reply-To: <alpine.BSF.2.22.395.2002191904370.88848@zero.eik.bme.hu>
Message-ID: <alpine.BSF.2.22.395.2002192059340.88848@zero.eik.bme.hu>
References: <CWXP123MB2262B6F3159B7AA7AB010F4183020@CWXP123MB2262.GBRP123.PROD.OUTLOOK.COM>
 <f0f00ecd-1989-9bc1-02e0-8a9b4819f051@ilande.co.uk>
 <LO2P123MB2271B1493AD1B4DC8DDCB97783100@LO2P123MB2271.GBRP123.PROD.OUTLOOK.COM>
 <alpine.BSF.2.22.395.2002191904370.88848@zero.eik.bme.hu>
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
Cc: jsnow@redhat.com, mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 atar4qemu@gmail.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Feb 2020, BALATON Zoltan wrote:
> faster or doing something differently? Does someone know what interrupts are 
> generated on real hardware in DMA mode so we can compare that to what we see 
> with QEMU?

The document Programming Interface for Bus Master IDE Controller, Revision 
1.0 (5/16/94) has some info on this. AFAIU it says that after DMA 
operation is completed an IRQ should be raised. On page 5, section 3.1. 
Data Synchronization it says:

"Another way to view this requirement is that the first read to the 
controller Status register in response to the IDE device interrupt must 
return with the Interrupt bit set and with the guarantee that all buffered 
data has been written to memory."

Not sure if this is relevant but how is it handled in QEMU? Is the right 
interrupt bit set after DMA transfer is done? If so is it the one that's 
checked by the OS driver?

Regards,
BALATON Zoltan

