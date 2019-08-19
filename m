Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CB691A7F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 02:39:40 +0200 (CEST)
Received: from localhost ([::1]:43880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzVhy-0005ac-NW
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 20:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59811)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1hzVgk-00059U-RP
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 20:38:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hzVgj-00031Z-Al
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 20:38:22 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:25792)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1hzVgj-0002yn-5D
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 20:38:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CEC5F7456D6;
 Mon, 19 Aug 2019 02:38:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3E8917456D5; Mon, 19 Aug 2019 02:38:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2A5677456CB;
 Mon, 19 Aug 2019 02:38:09 +0200 (CEST)
Date: Mon, 19 Aug 2019 02:38:09 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Message-ID: <alpine.BSF.2.21.9999.1908190208150.57965@zero.eik.bme.hu>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-devel] Machine specific option ROMs
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I know about the possibility to set the option ROM of a PCIDevice with the 
romfile property (that we can set on command line or in a device's init 
method) but is there a way to set it depending on the machine that uses 
the device? If this is not currently possible what would be needed to 
allow this?

I'm asking because some cards may have different option ROMs on different 
platforms: e.g. gfx cards need different ROM on Mac than on PC due to 
using different firmware (and CPU arch). For Mac machines emulated by QEMU 
OpenBIOS now patches in a driver that it downloads via FW_CFG but it could 
use an FCode ROM (or the driver directly passed as the ROM image) instead 
which would be a simpler solution and more like how real hardware works. 
Also sam460ex firmware has a BIOS emulator for using PC option ROMs but 
that can't run QEMU vgabios binaries (as these are i386 real mode and it 
can only run x86 real mode) so we may need a way to specify a different 
ROM if the card is used in sam460ex.

So I'm looking for a way for board code to set romfile when the device is 
added to the board. Should the normal way of setting a property work for 
this or is that too late by then to change ROM of the device? (Also this 
may need to work together with the -vga option to ensure card has the 
right ROM on different machines even if added by -vga.)

Regards,
BALATON Zoltan

