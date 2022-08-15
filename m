Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD29E592F37
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 14:51:10 +0200 (CEST)
Received: from localhost ([::1]:50178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNZYj-00022c-Ac
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 08:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oNZTb-0007Y3-O3
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 08:45:59 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:24650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oNZTY-0003q2-OQ
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 08:45:51 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A6CF4747DFD;
 Mon, 15 Aug 2022 14:45:42 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5752374633F; Mon, 15 Aug 2022 14:45:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 551977462D3;
 Mon, 15 Aug 2022 14:45:42 +0200 (CEST)
Date: Mon, 15 Aug 2022 14:45:42 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
cc: Elliot Nunn <elliot@nunn.io>, qemu-devel@nongnu.org, hsp.cat7@gmail.com
Subject: Re: VGA hardware cursor query
In-Reply-To: <20220815115657.5szgmhoqvqz7xep4@sirius.home.kraxel.org>
Message-ID: <149cd3bb-57b2-f51f-cfcc-26f886a0d7b4@eik.bme.hu>
References: <9A92120A-46B5-48A4-9424-8E606143291F@nunn.io>
 <20220815115657.5szgmhoqvqz7xep4@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Aug 2022, Gerd Hoffmann wrote:
> On Mon, Aug 01, 2022 at 11:58:51AM +0800, Elliot Nunn wrote:
>> Dear all,
>>
>> I want to give Mac OS 9 clients access to hardware cursor support, to improve
>> responsiveness in absolute-cursor mode.
>>
>> Would it be acceptable to add a hardware cursor interface to the VGA device?
>> And if so, can anyone advise on an appropriate register layout?
>
> Certainly acceptable.  Toyed with the idea, but never actually did it
> because in most cases it is easier to just use virtio-gpu instead ;)

I think that's the way Elliot ended up going for as well also because it 
could provide more features in the future. Getting just the framebuffer 
and hardware cursor working with virtio-vga may be relatively easy to do.

>> +#define VBE_DISPI_INDEX_CURSOR_IMG      0xb
>> +#define VBE_DISPI_INDEX_CURSOR_HOTSPOT  0xc
>> +#define VBE_DISPI_INDEX_CURSOR_ABS      0xd
>
> There already is a qemu-specific register extension set (see
> pci_vga_qext_ops in hw/display/vga-pci.c).  Right now it has two
> registers:  One r/o register returning the size of the register
> area, and one register to get/set the frame buffer byte order.
>
> So, when adding hardware cursor support I'd strongly suggest to
> add the registers there.  First because that is already
> qemu-specific, and second because handling backward compatibility
> is much easier then.  Guests can easily figure whenever hardware
> cursors are supported by checking the size register and see
> whenever the hwcursor registers are there or not.
>
> I'd also suggest to use more verbose register names and use a separate
> register for each value, i.e.
>
> PCI_VGA_QEXT_REG_HWCURSOR_ENABLE
> PCI_VGA_QEXT_REG_HWCURSOR_VRAM_OFFSET
> PCI_VGA_QEXT_REG_HWCURSOR_HOTSPOT_X
> PCI_VGA_QEXT_REG_HWCURSOR_HOTSPOT_Y
> PCI_VGA_QEXT_REG_HWCURSOR_POSITION_X
> PCI_VGA_QEXT_REG_HWCURSOR_POSITION_Y

Having at least position in a single register may be better as then 
updating it is a single register write instead of two. Not likely to have 
so big VGA screens that don't fit in one register.

Regards,
BALATON Zoltan

> Also define clear semantics for each register and for the cursor format.
>
> Do we want just a fixed 64x64 rgba format?
> If not we need more registers ...
>
> Is position the upper left corner of the image or the hotspot?
>
> take care,
>  Gerd
>
>

