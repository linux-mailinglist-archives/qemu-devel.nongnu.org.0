Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098506A9A15
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:00:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY6sn-0005mS-Du; Fri, 03 Mar 2023 09:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pY6sj-0005lz-RY; Fri, 03 Mar 2023 09:59:37 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pY6sg-0000E8-OI; Fri, 03 Mar 2023 09:59:37 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7AD2174634B;
 Fri,  3 Mar 2023 15:59:26 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 370157462DB; Fri,  3 Mar 2023 15:59:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 34DF1745720;
 Fri,  3 Mar 2023 15:59:26 +0100 (CET)
Date: Fri, 3 Mar 2023 15:59:26 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Woodhouse <dwmw2@infradead.org>
cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>, 
 John Snow <jsnow@redhat.com>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v3 00/18] hw/ide: Untangle ISA/PCI abuses of
 ide_init_ioport()
In-Reply-To: <366B37B3-B601-4405-9D7B-4FF1A6D1B9AF@infradead.org>
Message-ID: <aa4c7434-1146-e2a8-a719-5d1446e62060@eik.bme.hu>
References: <20230302224058.43315-1-philmd@linaro.org>
 <366B37B3-B601-4405-9D7B-4FF1A6D1B9AF@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1537205994-1677855566=:64220"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1537205994-1677855566=:64220
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Mar 2023, David Woodhouse wrote:
> Would like to see a report with tracing from pic_update_irq, the CPU 
> interrupt "handler" and the intermediate IRQ handler. With the 
> intermediate present and without it. To compare the two.

Here it is witout revert when it hangs after printing:

0.536| Memory used before SYS_Init: 9MB
0.606|
0.606|
0.606| ABox 1.30 (2.7.2018) © 1999-2022 by Ralph Schmidt, Emmanuel Lesueur, Teemu Suikki, Harry Sintonen
1.257| PCI ATA/ATAPI Driver@2: PIO Mode 4
1.257| PCI ATA/ATAPI Driver@2: UDMA Mode 5

U pic_update_irq master 1 imr 248 irr 7 padd 0
   pic_update_irq master 1 imr 248 irr 7 padd 0
D pic_update_irq master 1 imr 248 irr 7 padd 0
   pic_update_irq master 1 imr 248 irr 7 padd 0
M pic_update_irq master 1 imr 248 irr 7 padd 0
   pic_update_irq master 1 imr 248 irr 7 padd 0
A pic_update_irq master 1 imr 248 irr 7 padd 0
   pic_update_irq master 1 imr 248 irr 7 padd 0
   pic_update_irq master 1 imr 248 irr 7 padd 0
   pic_update_irq master 1 imr 248 irr 7 padd 0
M pic_update_irq master 1 imr 248 irr 7 padd 0
   pic_update_irq master 1 imr 248 irr 7 padd 0
o pic_update_irq master 1 imr 248 irr 7 padd 0
   pic_update_irq master 1 imr 248 irr 7 padd 0
d pic_update_irq master 1 imr 248 irr 7 padd 0
   pic_update_irq master 1 imr 248 irr 7 padd 0
e pic_update_irq master 1 imr 248 irr 7 padd 0
   pic_update_irq master 1 imr 248 irr 7 padd 0
   pic_update_irq master 1 imr 248 irr 7 padd 0
   pic_update_irq master 1 imr 248 irr 7 padd 0
5 pic_update_irq master 1 imr 248 irr 7 padd 0
   pic_update_irq master 1 imr 248 irr 7 padd 0

pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0

pic_update_irq master 0 imr 45 irr 16 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 16 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 16 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 16 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 16 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 16 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 16 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 16 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 16 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 16 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 16 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 16 padd 0
[more of the above repeating some more then]
pic_update_irq master 0 imr 45 irr 16 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 16 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 144 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 144 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 0 imr 45 irr 144 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0
pic_update_irq master 1 imr 248 irr 7 padd 0

and there seems to be no more interrupts
with the revert when it boots this should print:

1.513| PCI ATA/ATAPI Driver@2: PIO Mode 4
1.514| PCI ATA/ATAPI Driver@2: UDMA Mode 5
1.517| ide.device@2: QEMU     QEMU DVD-ROM     <CDROM>
1.523| ide.device@2:  CDRom <CD001>,<MORPHOS > found, bootable
1.525| ide.device@2:  Mount <CD0>
1.526| ide.device@2:  Partition <CD0> DosType 0x43444653 BootPri 127

and the trace including the irq forwarder func in vt82c686 isa:

M via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
o via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
d via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
e via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
5 via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0

  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0

  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
pic_update_irq master 0 imr 45 irr 128 padd 0
pic_update_irq master 1 imr 248 irr 4 padd 1

  via_isa_request_i8259_irq: irq=0 level=1
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
pic_update_irq master 0 imr 45 irr 128 padd 0
pic_update_irq master 1 imr 248 irr 4 padd 1
  via_isa_request_i8259_irq: irq=0 level=1
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
pic_update_irq master 0 imr 45 irr 128 padd 0
pic_update_irq master 1 imr 248 irr 4 padd 1
  via_isa_request_i8259_irq: irq=0 level=1
pic_update_irq master 0 imr 45 irr 128 padd 0
pic_update_irq master 1 imr 248 irr 4 padd 1
  via_isa_request_i8259_irq: irq=0 level=1
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
1 via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
. via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
2 via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
8 via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
2 via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
| via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
i via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
d via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
e via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
. via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
d via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
e via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
v via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
i via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
c via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
e via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
@ via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
2 via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
: via_isa_request_i8259_irq: irq=0 level=0
[...]
< via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
C via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
D via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
R via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
O via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
M via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0
> via_isa_request_i8259_irq: irq=0 level=0
   via_isa_request_i8259_irq: irq=0 level=0

  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0

  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
pic_update_irq master 0 imr 45 irr 128 padd 0
pic_update_irq master 1 imr 248 irr 4 padd 1
  via_isa_request_i8259_irq: irq=0 level=1
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
pic_update_irq master 0 imr 45 irr 128 padd 0
pic_update_irq master 1 imr 248 irr 4 padd 1
  via_isa_request_i8259_irq: irq=0 level=1
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
pic_update_irq master 0 imr 45 irr 128 padd 0
pic_update_irq master 1 imr 248 irr 4 padd 1
  via_isa_request_i8259_irq: irq=0 level=1
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0
pic_update_irq master 0 imr 45 irr 128 padd 0
pic_update_irq master 1 imr 248 irr 4 padd 1
  via_isa_request_i8259_irq: irq=0 level=1
pic_update_irq master 0 imr 45 irr 128 padd 0
pic_update_irq master 1 imr 248 irr 4 padd 1
  via_isa_request_i8259_irq: irq=0 level=1
  via_isa_request_i8259_irq: irq=0 level=0
  via_isa_request_i8259_irq: irq=0 level=0

and so on. Neither of the above had your ltim patch applied yet.

Regards,
BALATON Zoltan
--3866299591-1537205994-1677855566=:64220--

