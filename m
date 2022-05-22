Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016CA53051F
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:22:34 +0200 (CEST)
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqDo-0001gp-Rp
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAT-0006gX-Sq; Sun, 22 May 2022 14:19:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAN-0003Vo-I0; Sun, 22 May 2022 14:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I/7X60NHpNMLYj93Sc/a3t3DaVFXSUTIAHNkh05T/tM=; b=KjQ4kCWagEQ83+d/nvGhtf0zKI
 IU78idm4tlBlmJbKsbB4fxewidJf+HJ+aut0/vbk838YURNkCWUh49MpzMmmHKKaPGX35ZFRwfeOr
 sIENMI6OPvcBCVRHPQ4YbVpMjwaArVT258vZi3Du2MMdaIWHHb9EGfci6/u8GTB+LrsDEfvVqKXCw
 KJy/xQhqYC013rkoYpHS92aBm4paR9PXkmZ3ZVUMsOBqSvZFFZxiEoRGJDr6q+U1kgkqj+fy58XJg
 SZIR3kwsJYJf8C3KT/tEffvD5WH/fvKuImj1g7nUCAdSXdKdteXyV+iUTGk+bgmkvXX43MV2/t8te
 Yo3HfG1WW61IpKDczQQNDm+EBbnaw7UaIEm4uwEvNhOwHtTvvYtnmFjFygmU+bqS8tVsr85WnBhDK
 4PmwtsE+CJ+2z+n1/cjxN+pE0yVenJEvOYV5EfBKdOiJUwB5UvJyn7prRtX/tMbX2FjU3ObbkR8hL
 6js2K+kC6qSV2LlpaWgeYbBXiWXpCnHPnhv+j+zxMJBBy4JfRgu4cWjxFFbl8DDfoZurGB3yHOXtJ
 xUHSYT7epQ24xTTPKk2GS8gnr1xzZad+zxMJEqcK2hkXtVsGv85+ZXJla0WsjC9Dpvi3fVyX0wCxZ
 13aLkT0MxSwZI0rq2KWdWjXLPiRlMBRwbZvGkGmn8=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq99-0007pH-WE; Sun, 22 May 2022 19:17:48 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:17:46 +0100
Message-Id: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 00/50] PS2 device QOMification - part 1
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series came about when looking at improving the LASI PS2 device for
the HPPA machine: there were improvements that I was keen to make, but
was restricted because the PS2 device(s) weren't QOMified.

Trying to do everything in a single patchset would be a very large series
indeed, so here is part 1 of the series which does the basic QOMification
process and consists of:

- QOMifying the basic PS2, PS2 keyboard and PS2 mouse types

- Moving any functionality that exists in a global device init function
  directly into the relevant device, so that all device behaviour is
  configured using qdev properties and QOM

- Introducing a new I8042_MMIO type for use by the MIPS magnum machine

- Switch all PS2 devices to use qdev gpios for IRQs instead of using the
  update_irq() callback function along with the update_arg opaque

Once this work has been done, a follow-up part 2 series will finish the
remainder of the work which involves i) improving the QOM object model
now QOMification is complete and ii) removing the legacy global device
init functions for PS2 and related devices.

Testing for this series has comprised of booting a machine with each type
of PS2 device and confirming that i) the machine responds to keypresses
when using a graphical console and ii) completing a successful migration
from a machine with this series applies back to a machine running latest
git master. The test machines I used were:

- qemu-system-x86_64 -M pc for the I8042 device
- qemu-system-hppa for the LASIPS2 device
- qemu-system-arm -M versatilepb for the PL050 device
- qemu-system-mips64el -M magnum for the I8042_MMIO device

Finally the QOM tree changes caused by QOMification of the PS2 devices
trigger a failure due to a bug in the bios-tables-test qtest for subtest
/x86_64/acpi/q35/viot. This can be fixed by applying the series at
https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg04266.html
"hw/acpi/viot: generate stable VIOT ACPI tables" first.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (50):
  ps2: checkpatch fixes
  ps2: QOMify PS2State
  ps2: QOMify PS2KbdState
  ps2: QOMify PS2MouseState
  ps2: move QOM type definitions from ps2.c to ps2.h
  ps2: improve function prototypes in ps2.c and ps2.h
  ps2: introduce PS2DeviceClass
  ps2: implement ps2_reset() for the PS2_DEVICE QOM type based upon
    ps2_common_reset()
  ps2: remove duplicate setting of scancode_set in ps2_kbd_init()
  ps2: implement ps2_kbd_realize() and use it to register
    ps2_keyboard_handler
  ps2: implement ps2_mouse_realize() and use it to register
    ps2_mouse_handler
  ps2: don't use vmstate_register() in ps2_kbd_init()
  ps2: don't use vmstate_register() in ps2_mouse_init()
  pl050: checkpatch fixes
  pl050: split pl050_update_irq() into separate pl050_set_irq() and
    pl050_update_irq() functions
  lasips2: spacing fixes
  lasips2: rename ps2dev_update_irq() to lasips2_port_set_irq()
  pckbd: checkpatch fixes
  pckbd: move KBDState from pckbd.c to i8042.h
  pckbd: move ISAKBDState from pckbd.c to i8042.h
  pckbd: introduce new I8042_MMIO QOM type
  pckbd: implement i8042_mmio_reset() for I8042_MMIO device
  pckbd: add mask qdev property to I8042_MMIO device
  pckbd: add size qdev property to I8042_MMIO device
  pckbd: implement i8042_mmio_realize() function
  pckbd: implement i8042_mmio_init() function
  pckbd: alter i8042_mm_init() to return a I8042_MMIO device
  pckbd: move mapping of I8042_MMIO registers to MIPS magnum machine
  pckbd: more vmstate_register() from i8042_mm_init() to
    i8042_mmio_realize()
  pckbd: move ps2_kbd_init() and ps2_mouse_init() to
    i8042_mmio_realize()
  ps2: make ps2_raise_irq() function static
  ps2: use ps2_raise_irq() instead of calling update_irq() directly
  ps2: introduce ps2_lower_irq() instead of calling update_irq()
    directly
  ps2: add gpio for output IRQ and optionally use it in ps2_raise_irq()
    and ps2_lower_irq()
  pckbd: replace irq_kbd and irq_mouse with qemu_irq array in KBDState
  pl050: switch over from update_irq() function to PS2 device gpio
  lasips2: QOMify LASIPS2State
  lasips2: move lasips2 QOM types from lasips2.c to lasips2.h
  lasips2: rename lasips2_init() to lasips2_initfn() and update it to
    return the LASIPS2 device
  lasips2: implement lasips2_init() function
  lasips2: move mapping of LASIPS2 registers to HPPA machine
  lasips2: move initialisation of PS2 ports from lasi_initfn() to
    lasi_init()
  lasips2: add base property
  lasips2: implement lasips2_realize()
  lasips2: use qdev gpio for output IRQ
  lasips2: switch over from update_irq() function to PS2 device gpio
  pckbd: switch I8042_MMIO device from update_irq() function to PS2
    device gpio
  pckbd: add i8042_reset() function to I8042 device
  pckbd: switch I8042 device from update_irq() function to PS2 device
    gpio
  ps2: remove update_irq() function and update_arg parameter

 hw/hppa/machine.c          |  11 +-
 hw/input/lasips2.c         | 110 +++++---
 hw/input/pckbd.c           | 321 ++++++++++++++++--------
 hw/input/pl050.c           |  50 ++--
 hw/input/ps2.c             | 500 +++++++++++++++++++++----------------
 hw/mips/jazz.c             |  11 +-
 include/hw/input/i8042.h   |  54 +++-
 include/hw/input/lasips2.h |  27 +-
 include/hw/input/ps2.h     |  79 +++++-
 9 files changed, 775 insertions(+), 388 deletions(-)

-- 
2.20.1


