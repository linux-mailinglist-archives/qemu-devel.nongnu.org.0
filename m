Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40E442E608
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 03:18:38 +0200 (CEST)
Received: from localhost ([::1]:56268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbBrp-0002hy-Fn
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 21:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbBqO-0000my-GQ
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:17:13 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:15076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbBqH-0006a8-Co
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:17:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 21ACA756062;
 Fri, 15 Oct 2021 03:16:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B67A2746333; Fri, 15 Oct 2021 03:16:57 +0200 (CEST)
Message-Id: <cover.1634259980.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 0/4] Avoid using isa_get_irq in vt82c686 model
Date: Fri, 15 Oct 2021 03:06:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Based-on: <cover.1634232746.git.balaton@eik.bme.hu>

This is on top of (v4-hw/usb/vt82c686-uhci-pci: Use ISA instead of
PCI) series and removes usage of isa_get_irq() from the usb and ide
functions. I managed to simplify it so it's not so bad but not sure if
it's much better either but maybe groups things a bit better this way.

Regards,
BALATON Zoltan

BALATON Zoltan (4):
  vt82c686: Move common code to via_isa_realize
  vt82c686: Add a method to VIA_ISA to raise ISA interrupts
  hw/usb/vt82c686-uhci-pci: Avoid using isa_get_irq()
  via-ide: Avoid using isa_get_irq()

 hw/ide/via.c               |  4 +-
 hw/isa/vt82c686.c          | 75 +++++++++++++++++++-------------------
 hw/usb/vt82c686-uhci-pci.c |  3 +-
 include/hw/isa/vt82c686.h  |  4 ++
 4 files changed, 45 insertions(+), 41 deletions(-)

-- 
2.21.4


