Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D085677061
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 17:05:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJcoW-0005Af-Jm; Sun, 22 Jan 2023 11:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pJcoT-00059i-BQ; Sun, 22 Jan 2023 11:03:21 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pJcoQ-0004iM-Pf; Sun, 22 Jan 2023 11:03:21 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DD55A745720;
 Sun, 22 Jan 2023 17:00:51 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8C88E745712; Sun, 22 Jan 2023 17:00:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8A80A7456E3;
 Sun, 22 Jan 2023 17:00:51 +0100 (CET)
Date: Sun, 22 Jan 2023 17:00:51 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v7 0/8] Mac Old World ROM experiment
In-Reply-To: <2d11ac69-fff6-7280-f2e9-2b348639e58e@eik.bme.hu>
Message-ID: <9ae92d14-6c38-f3cf-37ca-693c65026d6e@eik.bme.hu>
References: <cover.1593456926.git.balaton@eik.bme.hu>
 <2d11ac69-fff6-7280-f2e9-2b348639e58e@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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

On Sun, 22 Jan 2023, BALATON Zoltan wrote:
> On Mon, 29 Jun 2020, BALATON Zoltan wrote:
>> This is now a minimal set of patches needed to make it possible to
>> experiment with a firmware ROM from real hardware. After finding out
>> that the board firmware does not probe PCI devices but expects them at
>> known fixed addresses we only need to change the address of the macio
>> device to get the firmware correctly map it. This allows dropping
>> workarounds in previous versions for this and now only the minimal set
>> of patches are included to get the firmware loaded and do something.
>> (Also excluded the grackle revision and machine ID pathes for now that
>> may be needed as the firmware accesses these but seems to go further
>> without them so until we hit a problem we can live without it,
>> although I wonder if this causes us unnecessary debugging later so
>> unless they cause regressions they could be merged).
>> 
>> I still don't get video output but at least it talks to the GPU chip
>> now so it can be debugged and improved (this will either need
>> emulating the correct chip the firmware has a driver for or an OF
>> compliant ROM for the emulated card).
>> 
>> As before the I2C part (patches 6-8) is RFC and unfinished but the
>> first 5 patches should be good enough now. I hope someone can take
>> care of I2C, I can look at the ati-vga side later.
>> 
>> Regards,
>> BALATON Zoltan
>> 
>> BALATON Zoltan (8):
>>  mac_oldworld: Allow loading binary ROM image
>>  mac_newworld: Allow loading binary ROM image
>>  mac_oldworld: Drop a variable, use get_system_memory() directly
>>  mac_oldworld: Drop some variables
>>  mac_oldworld: Change PCI address of macio to match real hardware
>>  i2c: Match parameters of i2c_start_transfer and i2c_send_recv
>
> Continuing experimenting with getting g3beige work with the original firmware 
> ROM here's the current status. The above patches were already merged.
>
>>  WIP macio/cuda: Attempt to add i2c support
>>  mac_oldworld: Add SPD data to cover RAM
>
> Adding these last two patches on top of Mark's screamer branch and increasing 
> SCREAMER_BUFFER_SIZE define to 0x8000 in include/hw/audio/screamer.h to avoid 
> a crash and using -memory 256 (as RAM size detection seems to be broken maybe 
> due to imcomplete I2C emulation) I get the ROM to start but it cannot yet 
> boot. We're past the initial OpenFirmware setup, can get a Forth prompt and 
> explore the device tree and run Forth and also can start the Toolbox ROM from 
> /AAPL,ROM but then it stops somewhere in there without giving any log or diag 
> output. I think it may be waiting for some interrupt or missing some of the 
> Heathrow emulation but I'm not really sure. I can get these traces:
>
> heathrow_write 0x28 1: 0x80000000
> heathrow_read 0x24 1: 0x80000000
> heathrow_read 0x2c 1: 0x0
> heathrow_write 0x18 0: 0x80000000
> heathrow_read 0x14 0: 0x0
> heathrow_read 0x1c 0: 0x0
> heathrow_write 0x28 1: 0x80000000
> heathrow_read 0x24 1: 0x80000000
> heathrow_read 0x2c 1: 0x0
> heathrow_write 0x18 0: 0x80000000
> heathrow_read 0x14 0: 0x0
> heathrow_read 0x1c 0: 0x0
> portA_write unimplemented
> portA_write unimplemented
> heathrow_read 0x24 1: 0x80000000
> heathrow_write 0x24 1: 0x80000000
> heathrow_read 0x14 0: 0x0
> heathrow_write 0x14 0: 0x0
> heathrow_read 0x24 1: 0x80000000
> heathrow_write 0x24 1: 0x80040000
> heathrow_set_irq set_irq: num=0x12 level=1
> heathrow_write 0x28 1: 0x80000000
> heathrow_read 0x24 1: 0x80040000
> heathrow_read 0x2c 1: 0x40000
> heathrow_write 0x18 0: 0x80000000
> heathrow_read 0x14 0: 0x0
> heathrow_read 0x1c 0: 0x0
> heathrow_write 0x28 1: 0x80000000
> heathrow_read 0x24 1: 0x80040000
> heathrow_read 0x2c 1: 0x40000
> heathrow_write 0x18 0: 0x80000000
> heathrow_read 0x14 0: 0x0
> heathrow_read 0x1c 0: 0x0
> heathrow_write 0x28 1: 0x80000000
> heathrow_read 0x24 1: 0x80040000
> heathrow_read 0x2c 1: 0x40000
> heathrow_write 0x18 0: 0x80000000
> heathrow_read 0x14 0: 0x0
> heathrow_read 0x1c 0: 0x0

Adding some cuda* traces and info via output in case that helps to tell 
what's happening:

portA_write unimplemented
cuda_delay_set_sr_int
cuda_delay_set_sr_int
cuda_packet_send length 5
cuda_packet_send_data [0] 0x00
cuda_packet_send_data [1] 0x40
cuda_packet_send_data [2] 0x2c
cuda_packet_send_data [3] 0xa4
cuda_packet_send_data [4] 0xff
cuda_delay_set_sr_int
portA_write unimplemented
heathrow_set_irq set_irq: num=0x12 level=1
(qemu) info via
mos6522-cuda:
   Registers:
     ORB :    0x30
     ORA :    0x10
     DDRB:    0x30
     DDRA:    0x58
     T1CL:    0x11
     T1CH:    0x14
     T1LL:    0xff
     T1LH:    0xff
     T2CL:    0x1b
     T2CH:    0x88
     SR  :    0xff
     ACR :    0x1c
     PCR :    0x0
     IFR :    0x60
     IER :    0x20
   Timers:
     Using current time now(ns)=33052813591
     T1 freq(hz)=783333 mode=one-shot counter=0x1411 latch=0xffff
        load_time(ns)=0 next_irq_time(ns)=33131055374
     T2 freq(hz)=1276 mode=one-shot counter=0x881b latch=0x30c
        load_time(ns)=257468378 next_irq_time(ns)=33349161167

> then the last 6 lines are repeating endlessly. Does anybody have an idea what 
> these registers are doing and where they are implemented in QEMU? The model 
> in hw/intc/heathrow_pic.c seems to be very simple but I'm not sure how are 
> these connected to the rest of the mac_oldworld g3beige machine. I've checked 
> that the IRQ numbers defined in include/hw/misc/macio/macio.h seems to match 
> what's in the device tree generated by the ROM but there are some missing 
> devices we don't emulate (such as SWIM floppy, PMAC ethernet and MESH SCSI). 
> Yet the above looks like IRQ 0x12 is raised which should be CUDA and there 
> were some portA write errors before that so maybe something with VIA or CUDA 
> emulation? Any insight on this anyone?
>
> Regards,
> BALATON Zoltan
>
>> hw/display/sm501.c           |  2 +-
>> hw/i2c/core.c                | 34 +++++++-------
>> hw/i2c/ppc4xx_i2c.c          |  2 +-
>> hw/misc/macio/cuda.c         | 76 ++++++++++++++++++++++++++++++-
>> hw/ppc/mac.h                 |  2 -
>> hw/ppc/mac_newworld.c        | 22 +++++----
>> hw/ppc/mac_oldworld.c        | 86 +++++++++++++++++++++++-------------
>> include/hw/i2c/i2c.h         |  4 +-
>> include/hw/misc/macio/cuda.h |  1 +
>> 9 files changed, 167 insertions(+), 62 deletions(-)
>> 
>> 
>

