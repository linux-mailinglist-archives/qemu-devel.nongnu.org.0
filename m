Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E032712D4
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Sep 2020 10:22:31 +0200 (CEST)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJucA-00050n-1Z
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 04:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kJuaO-0003O6-Jf; Sun, 20 Sep 2020 04:20:42 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56512
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kJuaL-0003pO-0N; Sun, 20 Sep 2020 04:20:40 -0400
Received: from host81-154-161-117.range81-154.btcentralplus.com
 ([81.154.161.117] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kJuak-0006Dn-QA; Sun, 20 Sep 2020 09:21:07 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: armbru@redhat.com, david@gibson.dropbear.id.au, atar4qemu@gmail.com,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Date: Sun, 20 Sep 2020 09:20:12 +0100
Message-Id: <20200920082018.16135-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.161.117
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/6] QOM minor fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series started off as a fix for the nd_table misuse in the sparc32-ledma
device as pointed out by Markus, and then I remembered there was similar
issue around the use of serial_hd() in macio. The last patch is one I've had
sitting in a local branch for a while and is a mistake I made during the
original sabre.c split which seems appropriate to include here.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (6):
  sparc32-dma: use object_initialize_child() for espdma and ledma child
    objects
  sparc32-ledma: use object_initialize_child() for lance child object
  sparc32-espdma: use object_initialize_child() for esp child object
  sparc32-ledma: don't reference nd_table directly within the device
  macio: don't reference serial_hd() directly within the device
  sabre: don't call sysbus_mmio_map() in sabre_realize()

 hw/dma/sparc32_dma.c           | 49 +++++++++++++++++-----------------
 hw/misc/macio/macio.c          |  5 +---
 hw/pci-host/sabre.c            |  8 ------
 hw/ppc/mac_newworld.c          |  6 +++++
 hw/ppc/mac_oldworld.c          |  6 +++++
 hw/sparc/sun4m.c               | 21 +++++++++------
 hw/sparc64/sun4u.c             |  7 +++++
 include/hw/sparc/sparc32_dma.h |  8 +++---
 8 files changed, 61 insertions(+), 49 deletions(-)

-- 
2.20.1


