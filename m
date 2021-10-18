Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F79E431DCF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:53:22 +0200 (CEST)
Received: from localhost ([::1]:60010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcT4r-0007QR-Ny
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcT3V-0004jA-Jl
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:51:57 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:40662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcT3S-00041F-PW
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:51:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7C90A748F54;
 Mon, 18 Oct 2021 15:51:51 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5BAC0748F52; Mon, 18 Oct 2021 15:51:51 +0200 (CEST)
Message-Id: <cover.1634563652.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 0/6] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Date: Mon, 18 Oct 2021 15:27:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I'm posting this again as a new series because I'm a bit lost on where
we are after Philippe sent a pull requst for a series that was
originally based on this. These are the remaining patches rebased on
Philippe's pull request that do the same to vt82c686-uhci-pci that was
done for via-ide to fix USB on pegasos2. First and last patches are
optional based on the outcome if we can access the parent directly in
this case or not but I think this should be OK in an internal
interrupt handler part of one device model and we're not poking around
in foreign objects.

Regards,

BALATON Zoltan (6):
  via-ide: Avoid expensive operations in irq handler
  usb/uhci: Misc clean up
  usb/uhci: Disallow user creating a vt82c686-uhci-pci device
  usb/uhci: Replace pci_set_irq with qemu_set_irq
  hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI interrupts
  hw/usb/vt82c686-uhci-pci: Optimise itq handler

 hw/ide/via.c               | 11 ++++++-----
 hw/usb/hcd-uhci.c          | 14 ++++++++------
 hw/usb/hcd-uhci.h          |  4 +++-
 hw/usb/vt82c686-uhci-pci.c | 16 ++++++++++++++++
 include/hw/ide/pci.h       |  1 +
 5 files changed, 34 insertions(+), 12 deletions(-)

-- 
2.21.4


