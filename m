Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3E22E8703
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 12:24:30 +0100 (CET)
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvf1J-0004Xi-AZ
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 06:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kverC-00013b-Gz
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:14:02 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:56519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kver3-0007A9-66
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:14:02 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DEB12747636;
 Sat,  2 Jan 2021 12:13:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CD9EC7470DD; Sat,  2 Jan 2021 12:13:29 +0100 (CET)
Message-Id: <cover.1609584215.git.balaton@eik.bme.hu>
Subject: [PATCH 00/24] vt82c686b clean ups and vt8231 emulation - all in one
Date: Sat, 02 Jan 2021 11:43:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Hello,

This is an all in one series containing all the patches from my
previous part I and part II vt82c686b clean up series plus the end of
it to finally add vt8231 emulation that will be used by subsequent
ppc/pegasos2 emulation. I consider this finished for now and good
enough to get in also cleaning up and improving fuloong2e emulation a
bit but previous disclaimer is still valid: It does not aim to fix all
existing bugs or make the model perfectly emulate the real chip just
reach the level where we can have working emulation to boot guests
which can then be improved later. (E.g. I think state saving was
broken before and it remains broken after because I don't know all the
details how to add vmstate for all kinds of data structures and this
could be addressed separately when fixing the already broken state
saving if someone wants to test and fix it.) With this it boots at
least MorphOS on pegasos2 and works with the pmon_2e.bin for fuloong2e
which needs more fixes for Linux that are currently under review. More
testing is welcome.

It still needs the Bonito BONITO_PCICONF_REG_MASK fix for fuloong2e
because it no longer maps SMBus but due to the Bonito bug guest cannot
write register 0xd2 to map it. With that fix pmon_2e.bin from here:
http://www.anheng.com.cn/loongson/pmon/ works for me with this
command: qemu-system-mips64el -M fuloong2e -net none -bios pmon_2e.bin

After rolling this for two years now I hope it can finally be merged
and eventually also get pegasos2 emulation that will need this.

Regards,
BALATON Zoltan

BALATON Zoltan (24):
  vt82c686: Rename AC97/MC97 parts from VT82C686B to VIA
  vt82c686: Remove unnecessary _DEVICE suffix from type macros
  vt82c686b: Rename VT82C686B to VT82C686B_ISA
  vt82c686: Remove vt82c686b_[am]c97_init() functions
  vt82c686: Split off via-[am]c97 into separate file in hw/audio
  audio/via-ac97: Simplify code and set user_creatable to false
  vt82c686: Remove legacy vt82c686b_isa_init() function
  vt82c686: Remove legacy vt82c686b_pm_init() function
  vt82c686: Convert debug printf to trace points
  vt82c686: Remove unneeded includes and defines
  vt82c686: Use shorter name for local variable holding object state
  vt82c686: Rename superio config related parts
  vt82c686: Move superio memory region to SuperIOConfig struct
  vt82c686: Reorganise code
  vt82c686: Fix SMBus IO base and configuration registers
  vt82c686: Fix up power management io base and config
  vt82c686: Make vt82c686b-pm an abstract base class and add vt8231-pm
    based on it
  vt82c686: Simplify vt82c686b_realize()
  vt82c686: Move creation of ISA devices to the ISA bridge
  vt82c686: Fix superio_cfg_{read,write}() functions
  vt82c686: Implement control of serial port io ranges via config regs
  vt82c686: QOM-ify superio related functionality
  vt82c686: Add VT8231_SUPERIO based on VIA_SUPERIO
  vt82c686: Add emulation of VT8231 south bridge

 hw/audio/meson.build      |    1 +
 hw/audio/via-ac97.c       |   93 ++++
 hw/isa/trace-events       |    8 +
 hw/isa/vt82c686.c         | 1000 ++++++++++++++++++++++++-------------
 hw/mips/fuloong2e.c       |   38 +-
 include/hw/isa/vt82c686.h |   15 +-
 6 files changed, 761 insertions(+), 394 deletions(-)
 create mode 100644 hw/audio/via-ac97.c

-- 
2.21.3


