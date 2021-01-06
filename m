Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A4D2EC5B8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 22:31:06 +0100 (CET)
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxGOX-0004P2-LS
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 16:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxGMS-0002oZ-Az
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 16:28:57 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:22455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxGMO-0001j0-Il
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 16:28:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3DEBF7470FD;
 Wed,  6 Jan 2021 22:28:51 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 11EFE7470DF; Wed,  6 Jan 2021 22:28:51 +0100 (CET)
Message-Id: <cover.1609967638.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 00/12] vt82c686b clean ups and vt8231 emulation
Date: Wed, 06 Jan 2021 22:13:58 +0100
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are the remaining patches for VT8231 emulation after the first
half of it was merged. After patch 3 fuloong2e will need the Bonito
REG_MASK fix to be able to map SMBus registers because it's no longer
mapped at fixed address (firmware will do this if it can access the
right register).

BALATON Zoltan (12):
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

 hw/isa/trace-events       |   2 +
 hw/isa/vt82c686.c         | 889 ++++++++++++++++++++++++++++----------
 hw/mips/fuloong2e.c       |  33 +-
 include/hw/isa/vt82c686.h |   3 +-
 4 files changed, 679 insertions(+), 248 deletions(-)

-- 
2.21.3


