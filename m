Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245B56004D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 14:45:05 +0200 (CEST)
Received: from localhost ([::1]:34824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6X43-0002V5-Iv
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 08:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzz-0007YU-Jw; Wed, 29 Jun 2022 08:40:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzw-0004bf-Cq; Wed, 29 Jun 2022 08:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MNvCoJf7NAHgdI2bXN63mZ0homReD/BxhhErUIMBffg=; b=eF3NKjLx7iNsQe3p2BvmI+VUlS
 uAgalDweFHuO7lq2M7SBmyaEfHLnYKT49ZnNmoTapwCTmorp3/BelTSIP6kcVX82LLJIDxuG6CV8g
 CcKWnjGa83kjrDo3oAJjxnu1cF15l6jLaH/q8TfQ1ulNhLgSq4vuyCfgBVlh/RgoJLNMfnRcCzr1N
 ksI92QOA17zoLPJ+bCN9PU0kLuYm7xerY26yKAvTDoDqfE8SbfTHPJ8siooJSalQF3I5JenwdbGPS
 UrRiQDKbbi/umBYS2H/jOgRmSDO5s7KI0qWyFDLINF7SVnHd9OYCBvqB2vyhTvbGPoDxUTVLY6MNB
 7Y61wgABEgAEMFjWxihbErTNQAB+klOXUkg3ujNaDy4qZoZ2jXnxsx0XdFfhuAAFkF5rr75jGU482
 rn7CAKv1i6vO4WgzhuQytyD9wCUFjD4xT6SC9b3vs/5gOkaSD/glUL5pxMP1kTCKALm6sYXXZoUwb
 ZYEhk8h8sTxEgCHFEMk693Q5jCyXrnNKrARZmJmcQojkAU8VeVguING9F8Ky123nSPD+84ZjK8NEU
 JKyAASfvACXviG6PX8fJV9oLak5QAynIs+ndZnKVGgx6HOoAxwYumrX5EGTATA8wmFpDSe+Wpf4LW
 i+uUX1NtYB1ipJUZryD3ANs1CyBDrd52GUPAYLdmM=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6WyV-0002tZ-LQ; Wed, 29 Jun 2022 13:39:23 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:46 +0100
Message-Id: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 00/40] PS2 device QOMification - part 2
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

Here is the follow-on series from part 1 which completes the work to remove
the legacy global device init functions for PS2 devices. Now that part 1 has
been applied, the hard part to remove the PS2 function callback and argument
has been completed and all that remains is to improve the PS2 device
QOMification to allow the legacy PS2 functions to be removed.

Patches 1-11 update the pl050 device to remove the use of ps2_kbd_init() and
ps2_mouse_init(), whilst patches 12-34 make some more involved changes to
the lasips2 device (in particular completing the LASIPS2Port abstraction)
before doing the same.

Finally patches 35-40 complete the process for the pckbd (I8042 and I8042_MMIO
devices) before removing the now unused ps2_kbd_init(), ps2_mouse_init() and
i8042_mm_init() functions.

Note that this series is a migration break for the HPPA B160L and MIPS magnum
machines: I've had agreement from both Helge and Hervé that this is worth
doing to allow the use of the DeviceClass vmsd property to set the
VMStateDescription rather than manually calling vmstate_register().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (40):
  pl050: move PL050State from pl050.c to new pl050.h header file
  pl050: rename pl050_keyboard_init() to pl050_kbd_init()
  pl050: change PL050State dev pointer from void to PS2State
  pl050: introduce new PL050_KBD_DEVICE QOM type
  pl050: introduce new PL050_MOUSE_DEVICE QOM type
  pl050: move logic from pl050_realize() to pl050_init()
  pl050: introduce PL050DeviceClass for the PL050 device
  pl050: introduce pl050_kbd_class_init() and pl050_kbd_realize()
  pl050: introduce pl050_mouse_class_init() and pl050_mouse_realize()
  pl050: don't use legacy ps2_kbd_init() function
  pl050: don't use legacy ps2_mouse_init() function
  lasips2: don't use vmstate_register() in lasips2_realize()
  lasips2: remove the qdev base property and the lasips2_properties
    array
  lasips2: remove legacy lasips2_initfn() function
  lasips2: change LASIPS2State dev pointer from void to PS2State
  lasips2: QOMify LASIPS2Port
  lasips2: introduce new LASIPS2_KBD_PORT QOM type
  lasips2: introduce new LASIPS2_MOUSE_PORT QOM type
  lasips2: move keyboard port initialisation to new
    lasips2_kbd_port_init() function
  lasips2: move mouse port initialisation to new
    lasips2_mouse_port_init() function
  lasips2: introduce lasips2_kbd_port_class_init() and
    lasips2_kbd_port_realize()
  lasips2: introduce lasips2_mouse_port_class_init() and
    lasips2_mouse_port_realize()
  lasips2: rename LASIPS2Port irq field to birq
  lasips2: introduce port IRQ and new lasips2_port_init() function
  lasips2: introduce LASIPS2PortDeviceClass for the LASIPS2_PORT device
  lasips2: add named input gpio to port for downstream PS2 device IRQ
  lasips2: add named input gpio to handle incoming port IRQs
  lasips2: switch to using port-based IRQs
  lasips2: rename LASIPS2Port parent pointer to lasips2
  lasips2: standardise on lp name for LASIPS2Port variables
  lasips2: switch register memory region to DEVICE_BIG_ENDIAN
  lasips2: don't use legacy ps2_kbd_init() function
  lasips2: don't use legacy ps2_mouse_init() function
  lasips2: update VMStateDescription for LASIPS2 device
  pckbd: introduce new vmstate_kbd_mmio VMStateDescription for the
    I8042_MMIO device
  pckbd: don't use legacy ps2_kbd_init() function
  ps2: remove unused legacy ps2_kbd_init() function
  pckbd: don't use legacy ps2_mouse_init() function
  ps2: remove unused legacy ps2_mouse_init() function
  pckbd: remove legacy i8042_mm_init() function

 hw/hppa/machine.c          |   7 +-
 hw/input/lasips2.c         | 320 ++++++++++++++++++++++++++-----------
 hw/input/pckbd.c           |  82 ++++++----
 hw/input/pl050.c           | 112 ++++++++-----
 hw/input/ps2.c             |  26 ---
 hw/input/trace-events      |   2 -
 hw/mips/jazz.c             |  13 +-
 include/hw/input/i8042.h   |   7 +-
 include/hw/input/lasips2.h |  57 +++++--
 include/hw/input/pl050.h   |  59 +++++++
 include/hw/input/ps2.h     |   2 -
 11 files changed, 466 insertions(+), 221 deletions(-)
 create mode 100644 include/hw/input/pl050.h

-- 
2.30.2


