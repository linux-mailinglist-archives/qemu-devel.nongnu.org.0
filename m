Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421372E6D98
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 04:28:25 +0100 (CET)
Received: from localhost ([::1]:43280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku5gN-00028n-Rn
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 22:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ku5fB-0001hg-Mq
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 22:27:10 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:35811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ku5f6-0005TQ-Vu
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 22:27:08 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B680B74646C;
 Tue, 29 Dec 2020 04:26:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7B46574645F; Tue, 29 Dec 2020 04:26:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7484F74645B;
 Tue, 29 Dec 2020 04:26:59 +0100 (CET)
Date: Tue, 29 Dec 2020 04:26:59 +0100 (CET)
To: qemu-devel@nongnu.org
Subject: Bug in Bonito? (mips/fuloong2e)
Message-ID: <771a6cd4-90a7-662e-5a5b-e8a9395a875@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Hello,

While continuing with part two of my vt82c686b clean ups I've tried to 
implement SMBus IO base configuration in the vt82c686b-pm part that I've 
already done for vt8231 for pegasos2 and it should be the same for 686B. 
(In short, writing address to pm config 0x90 sets base address of smbus 
regs and bit 0 of 0xd2 enables/disables it.) This is what the firmware 
does first and it would allow removing hard coded 0xeee1 value and the 
property to set it and then I could reuse the same PM part in VT8231.

I have code to implement this and it works with pegasos2 but fails with 
fuloong2e and pmon. I've debugged it that write to 0xd2 comes out as 0xd0 
after some mapping in bonito:

bonito_spciconf_write: bonito_spciconf_write 0000000000000490 size 4 val eee1

bonito_sbridge_pciaddr: cfgaddr 10490 pciaddr 2c90 busno 0 devno 5 funno 4 regno 144

pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1

via_pm_write addr 0x90 val 0xeee1 len 0x4


bonito_spciconf_write: bonito_spciconf_write 00000000000004d2 size 2 val 1

bonito_sbridge_pciaddr: cfgaddr 104d2 pciaddr 2cd0 busno 0 devno 5 funno 4 regno 208

pci_cfg_write vt82c686b-pm 05:4 @0xd0 <- 0x1

via_pm_write addr 0xd0 val 0x1 len 0x2

Note the first write to 0x90 is correct but the second ends up at 0xd0 
instead of 0xd2 after bonito_sbridge_pciaddr(). This is somewhere here:

https://git.qemu.org/?p=qemu.git;a=blob;f=hw/pci-host/bonito.c;h=a99eced06574f999f3f1b999576ae09d5f4b06ca;hb=HEAD#l446

Any idea what this is trying to do and how to fix it?

Regards,
BALATON Zoltan

