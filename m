Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B102F0376
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 21:33:11 +0100 (CET)
Received: from localhost ([::1]:42948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyKv8-0001tJ-0s
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 15:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyKsD-0008OR-AR
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 15:30:11 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:33368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyKs5-00078T-On
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 15:30:09 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C764A747619;
 Sat,  9 Jan 2021 21:29:57 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4668074646C; Sat,  9 Jan 2021 21:29:57 +0100 (CET)
Message-Id: <cover.1610223396.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 00/13] vt82c686b clean ups and vt8231 emulation
Date: Sat, 09 Jan 2021 21:16:36 +0100
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 2 of remaining patches for VT8231 emulation addressing review
comments:

- Split off making vt82c686b-pm an abstract class to separate patch
- Use constants for PCI IDs

Regards,
BALATON Zoltan


BALATON Zoltan (13):
  vt82c686: Move superio memory region to SuperIOConfig struct
  vt82c686: Reorganise code
  vt82c686: Fix SMBus IO base and configuration registers
  vt82c686: Fix up power management io base and config
  vt82c686: Set user_creatable=false for VT82C686B_PM
  vt82c686: Make vt82c686b-pm an abstract base class and add vt8231-pm
    based on it
  vt82c686: Simplify vt82c686b_realize()
  vt82c686: Move creation of ISA devices to the ISA bridge
  vt82c686: Fix superio_cfg_{read,write}() functions
  vt82c686: Implement control of serial port io ranges via config regs
  vt82c686: QOM-ify superio related functionality
  vt82c686: Add VT8231_SUPERIO based on VIA_SUPERIO
  vt82c686: Add emulation of VT8231 south bridge

 hw/isa/trace-events       |   2 +
 hw/isa/vt82c686.c         | 891 ++++++++++++++++++++++++++++----------
 hw/mips/fuloong2e.c       |  33 +-
 include/hw/isa/vt82c686.h |   3 +-
 include/hw/pci/pci_ids.h  |   6 +-
 5 files changed, 684 insertions(+), 251 deletions(-)

-- 
2.21.3


