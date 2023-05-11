Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64CE6FEE18
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:58:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px27h-00046q-Tk; Thu, 11 May 2023 04:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27e-00045K-JP
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:02 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27b-0003g0-NR
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6AqhguVi2Cnkbon4veTY6rm5PkOEtzV/G6G5SS0+IR0=; b=UmrNN4KDXhxWPci29Q86mD78qO
 ypCgzgZIkYNfptSfgLB1E6Blr991ZDe5MNsI5OOAsp8uZH00m88H2rsaXTW4buLtP1MAUUyXwY5qA
 /1trUKtkgKIjyOTBI2Ww4ZoGkHzN5WV0Nji+XtD/WKJiXjooXfAz+Swi/RHVeZH54QjhMLl5lQxsy
 OpYHv8/bPMsUsCcZc1bc2zzTgqU2mGmWt6EwRYPxxCTJ4Wggc7sauWiytx7riypusOTZqBWF/A3Le
 OcFj0n2NrL88XXSvyEpiTS5fK1Se8Fm2eVzDqTrfDMivbwvhbw4JMlKM6ipJNaNtG7mFDjcaSCGgY
 RveoSmaz4BGDtKtAP50IO1QR4yG3R0WC9FmPaBP7XXC5F2Fwx9XrZywFIPRYPK9Q+53OFXqINgzQi
 M/C/OVfqPaWY8jlCEAl7TSoeTEsQ8BU2sf/WHgV8fv5SfAN+6Q+W6aCEipFEHS4ZYOHqVP22bJSGp
 TaXlchSKA18uSnBtCxEY4v8hUQ5byvDBX5Hlq58zQ2xMo+w3E3mZMgfVSGEf8cdIGUtwhs2p1p3SU
 xCV/6zvTeUMeyE44/ibTWqpKdRU7QF+nYnGZGhlbg27YBa5DNW8aroD/2iBHgss2fZJynAYIa6CIz
 ikqAuADBR1G/FTdzo55pcIM4lGUuoHPcD47bCk+xg=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px26Z-0008g9-7K; Thu, 11 May 2023 09:56:59 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:13 +0100
Message-Id: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 00/18] PCI: convert IRQs to use qdev gpios
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series is something I've been playing with for a while, and it came up in
again in a conversation with Phil and Alex when discussing modelling of buses
and IRQs for heterogenerous binaries. The basic premise of the series is that
it converts PCI devices IRQs to use a qdev out gpio so that PCI devices can
potentially be wired up using standard qdev APIs.

In its current form the series adds a qdev out gpio to PCIDevice, adds a set of
input IRQs to PCIBus (once for each devfn) and wires them up at the very end of
pci_qdev_realize() once the device has been realised. This allows pci_set_irq()
to be changed into a simple wrapper over qemu_set_irq(), and the resulting
series passes GitLab CI to help prove the basic concept.

Note that this series is only concerned with providing a standard qdev gpio for
the PCI device IRQ, and not with how the PCI bus itself is modelled - that is
a discussion to be left for another day.

Another advantage of using qdev gpios is that it becomes possible to remove the
pci_allocate_irq() function which has long been a source of memory leaks. For
now I've added a new qdev named input gpio "pci-input-irq" which is used as its
replacement.

If everyone is happy that this series is going in the right direction then I'd
be inclined to add the qemu_irq and qdev gpio out to each individual PCI device
rather than using PCIDevice, and replace calls to pci_set_irq() with the
corresponding qemu_set_irq(). This would allow the "pci-input-irq" input gpio
to be dropped completely, and so PCIDevice IRQs can be treated like those of
any other qdev device (but at the cost of making this a larger series).

Thoughts/suggestions/comments?

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (18):
  hw/pci: add device IRQ to PCIDevice
  hw/pci: introduce PCI bus input IRQs
  hw/pci: use PCIDevice gpio for device IRQ
  hw/pci: introduce PCI device input gpio
  hw/char/serial-pci.c: switch SerialState to use PCI device input gpio
  hw/ide/ich.c: switch AHCIState to use PCI device input gpio
  hw/net/can/can_mioe3680_pci.c: switch Mioe3680PCIState to use PCI
    device input gpio
  hw/net/can/can_pcm3680_pci.c: switch SerialState to use PCI device
    input gpio
  hw/net/can/ctucan_pci.c: switch CtuCanPCIState to use PCI device input
    gpio
  hw/net/ne2000-pci.c: switch NE2000State to use PCI device input gpio
  hw/net/pcnet-pci.c: switch PCIPCNetState to use PCI device input gpio
  hw/net/tulip.c: switch TULIPState to use PCI device input gpio
  hw/scsi/esp-pci.c: switch ESPState to use PCI device input gpio
  hw/sd/sdhci-pci.c: switch SDHCIState to use PCI device input gpio
  hw/usb/hcd-ehci-pci.c: switch EHCIState to use PCI device input gpio
  hw/usb/hcd-ohci-pci.c: switch OHCIState to use PCI device input gpio
  hw/usb/hcd-uhci.c: switch UHCIState to use PCI device input gpio
  hw/pci/pci.c: remove pci_allocate_irq()

 hw/char/serial-pci.c          |  3 +-
 hw/ide/ich.c                  |  3 +-
 hw/net/can/can_mioe3680_pci.c |  4 +--
 hw/net/can/can_pcm3680_pci.c  |  4 +--
 hw/net/can/ctucan_pci.c       |  4 +--
 hw/net/ne2000-pci.c           |  3 +-
 hw/net/pcnet-pci.c            |  3 +-
 hw/net/tulip.c                |  3 +-
 hw/pci/pci.c                  | 65 +++++++++++++++++++++++++++++++----
 hw/scsi/esp-pci.c             | 11 +-----
 hw/sd/sdhci-pci.c             |  2 +-
 hw/usb/hcd-ehci-pci.c         |  3 +-
 hw/usb/hcd-ohci-pci.c         |  2 +-
 hw/usb/hcd-uhci.c             |  2 +-
 include/hw/pci/pci.h          |  1 -
 include/hw/pci/pci_bus.h      |  3 ++
 include/hw/pci/pci_device.h   |  3 ++
 17 files changed, 78 insertions(+), 41 deletions(-)

-- 
2.30.2


