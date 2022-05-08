Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B77151EC75
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 11:26:22 +0200 (CEST)
Received: from localhost ([::1]:52378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nndBF-0006aq-3B
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 05:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnd79-0004gI-BG
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:22:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:54814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnd77-0007Lu-1i
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:22:06 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnd60-0009rU-Fc; Sun, 08 May 2022 10:21:00 +0100
Message-ID: <d00386f5-238b-323d-0442-a1ea35ba5da1@ilande.co.uk>
Date: Sun, 8 May 2022 10:21:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 00/50] hppa: general improvements and tidy-ups
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 04/05/2022 10:25, Mark Cave-Ayland wrote:

> This patchset started off when I noticed that dino.c was accessing parent_obj
> directly rather than using a QOM cast. After fixing that I noticed quite a few
> other improvements that could be done to bring hppa up to our recommended
> coding standards.
> 
> The main aim of this patchset is to de-couple the dino and lasi devices from
> the board using QOM to handle the initialisation instead of having global
> device init functions. Included in this is switching the onboard devices
> over to use qdev GPIOs for wiring instead of directly allocating QEMU IRQs.
> 
> Along the way I've renamed the board config from CONFIG_DINO to
> CONFIG_HPPA_B160L since that better represents the machine type, and then
> used CONFIG_DINO and CONFIG_LASI for the appropriate devices which have been
> moved to hw/pci-host/dino.c and hw/misc/lasi.c respectively.
> 
> After the reorganisation it was trivial to remove hppa_sys.h and the majority
> of pci.c which wasn't being used. Finally I tidied up the use of the QOM
> machine type macros in machine.c.
> 
> The result has been lightly tested with a tiny Linux image I had lying around
> for testing my recent ESP changes, so more testing is welcome. There is a bit
> more work to be done sorting out the lasips2 device init and machine init, but
> since the patchset is already quite big I can follow up with that once this
> series has been merged.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> v2:
> - Rebase onto master
> - Add R-B tag to patch 1 from Richard
> - Add A-B tag from Helge to entire series
> - Update patch 12 to use CONFIG_HPPA_B160L instead of CONFIG_HPPA_GENERIC and
>    also update the machine description
> 
> 
> Mark Cave-Ayland (50):
>    dino: checkpatch fixes
>    dino: move registers from dino_init() to DINO_PCI_BRIDGE init function
>    dino: move PCI bus initialisation to dino_pcihost_init()
>    dino: move PCI windows initialisation to dino_pcihost_init()
>    dino: add memory-as property containing a link to the memory address
>      space
>    dino: move pci_setup_iommu() to dino_pcihost_init()
>    dino: move PCI bus master address space setup to
>      dino_pcihost_realize()
>    dino: move initial register configuration to new dino_pcihost_reset()
>      function
>    dino: use QOM cast instead of directly referencing parent_obj
>    dino: return PCIBus from dino_init() using qdev_get_child_bus()
>    dino: split declarations from dino.c into dino.h
>    hppa: use new CONFIG_HPPA_B160L option instead of CONFIG_DINO to build
>      hppa machine
>    dino: change dino_init() to return the DINO device instead of PCIBus
>    machine.c: map DINO device during board configuration
>    dino.h: add defines for DINO IRQ numbers
>    dino: define IRQ inputs as qdev GPIOs
>    dino: wire up serial IRQ using a qdev GPIO in machine.c
>    dino: remove unused dino_set_timer_irq() IRQ handler
>    hppa: move dino_init() from dino.c to machine.c
>    dino: use numerical constant for iar0 and iar1 reset values
>    dino: move DINO HPA constants from hppa_hardware.h to dino.h
>    dino: move from hw/hppa to hw/pci-host
>    lasi: checkpatch fixes
>    lasi: move memory region initialisation to new lasi_init() function
>    lasi: move register memory mapping from lasi.c to machine.c
>    lasi: move initialisation of iar and rtc to new lasi_reset() function
>    lasi: move LASIState and associated QOM structures to lasi.h
>    lasi: replace lasi_get_irq() with defined constants
>    lasi: define IRQ inputs as qdev GPIOs
>    lasi: use qdev GPIOs to wire up IRQs in lasi_initfn()
>    lasi: fix serial port initialisation
>    lasi: update lasi_initfn() to return LASIState
>    lasi: move LAN initialisation to machine.c
>    lasi: move parallel port initialisation to machine.c
>    lasi: move second serial port initialisation to machine.c
>    lasi: move PS2 initialisation to machine.c
>    lasi: remove address space parameter from lasi_initfn()
>    lasi: move lasi_initfn() to machine.c
>    lasi: use constants for device register offsets
>    lasi: use numerical constant for iar reset value
>    hppa: move device headers from hppa_sys.h into individual .c files
>    lasi: move from hw/hppa to hw/misc
>    hppa: move hppa_pci_ignore_ops from pci.c to machine.c
>    hppa: remove hw/hppa/pci.c
>    hppa: remove unused trace-events from from hw/hppa
>    hppa: move enable_lan() define from hppa_sys.h to machine.c
>    hppa: remove the empty hppa_sys.h file
>    hppa: use MACHINE QOM macros for defining the hppa machine
>    hppa: fold machine_hppa_machine_init() into
>      machine_hppa_machine_init_class_init()
>    hppa: simplify machine function names in machine.c
> 
>   MAINTAINERS                              |   4 +
>   configs/devices/hppa-softmmu/default.mak |   2 +-
>   hw/hppa/Kconfig                          |   5 +-
>   hw/hppa/hppa_hardware.h                  |   5 -
>   hw/hppa/hppa_sys.h                       |  24 ---
>   hw/hppa/machine.c                        | 124 +++++++++---
>   hw/hppa/meson.build                      |   2 +-
>   hw/hppa/pci.c                            |  88 ---------
>   hw/hppa/trace-events                     |  14 --
>   hw/misc/Kconfig                          |   3 +
>   hw/{hppa => misc}/lasi.c                 | 161 ++++------------
>   hw/misc/meson.build                      |   3 +
>   hw/misc/trace-events                     |   5 +
>   hw/pci-host/Kconfig                      |   4 +
>   hw/{hppa => pci-host}/dino.c             | 231 +++++++----------------
>   hw/pci-host/meson.build                  |   3 +
>   hw/pci-host/trace-events                 |   5 +
>   include/hw/misc/lasi.h                   |  78 ++++++++
>   include/hw/pci-host/dino.h               | 146 ++++++++++++++
>   meson.build                              |   1 -
>   20 files changed, 463 insertions(+), 445 deletions(-)
>   delete mode 100644 hw/hppa/hppa_sys.h
>   delete mode 100644 hw/hppa/pci.c
>   delete mode 100644 hw/hppa/trace-events
>   rename hw/{hppa => misc}/lasi.c (60%)
>   rename hw/{hppa => pci-host}/dino.c (71%)
>   create mode 100644 include/hw/misc/lasi.h
>   create mode 100644 include/hw/pci-host/dino.h

Richard, thanks for taking the time to look over this (rather large) patchset. I've 
replied to your comments, and from what I can see the v2 patchset should be fine to 
merge. Are you happy for me to go ahead and send a PR with that and the artist fixes?

FWIW I also have another couple of tidy-up patchsets locally, one for lasips2 and 
another for the hppa machine that are based on this series. So if we do happen to 
find anything else, I can easily squash the fixes into one of the follow-up series 
rather than make this one larger.


ATB,

Mark.

