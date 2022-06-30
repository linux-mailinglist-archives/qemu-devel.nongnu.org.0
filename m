Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA82560E5D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 02:53:53 +0200 (CEST)
Received: from localhost ([::1]:60886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6iRN-0004AI-01
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 20:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o6iOj-0001dp-55
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:51:10 -0400
Received: from mout-u-204.mailbox.org ([80.241.59.204]:44524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o6iOh-0004ky-2B
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:51:08 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4LYKWq13bYz9sWX;
 Thu, 30 Jun 2022 02:51:03 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH v4 0/3] Full PAM emulation (RE^WE) for i440FX and Q35
Date: Thu, 30 Jun 2022 00:50:55 +0000
Message-Id: <20220630005058.500449-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=80.241.59.204; envelope-from=lkujaw@member.fsf.org;
 helo=mout-u-204.mailbox.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Hello,

This patch series (v4) implements full PAM emulation for the i440FX
and Q35 x86 platforms (see commit log for details.)  Prior versions
did not support executing code from ROMs within the ISA MMIO range
when mode 2 was active (PAM_WE), but this series adds the requisite
support for new romd_mode memory sections to the QEMU MMU.  It appears
to be working well on TCG and KVM, but I would appreciate any feedback
or testing on other accelerators.  For testing purposes, I have
attached a patch to SeaBIOS that removes its special handling for
QEMU, but unaltered versions run fine as well.

Kind regards,
Lev Kujawski

--- a/src/fw/shadow.c
+++ b/src/fw/shadow.c
@@ -28,7 +28,7 @@ union pamdata_u {

 // Enable shadowing and copy bios.
 static void
-__make_bios_writable_intel(u16 bdf, u32 pam0)
+make_bios_writable_intel(u16 bdf, u32 pam0)
 {
     // Read in current PAM settings from pci config space
     union pamdata_u pamdata;
@@ -39,11 +39,11 @@ __make_bios_writable_intel(u16 bdf, u32 pam0)
     // Make ram from 0xc0000-0xf0000 writable
     int i;
     for (i=0; i<6; i++)
-        pam[i + 1] = 0x33;
+        pam[i + 1] = 0x22;

     // Make ram from 0xf0000-0x100000 writable
     int ram_present = pam[0] & 0x10;
-    pam[0] = 0x30;
+    pam[0] = 0x20;

     // Write PAM settings back to pci config space
     pci_ioconfig_writel(bdf, ALIGN_DOWN(pam0, 4), pamdata.data32[0]);
@@ -54,24 +54,17 @@ __make_bios_writable_intel(u16 bdf, u32 pam0)
         memcpy(VSYMBOL(code32flat_start)
                , VSYMBOL(code32flat_start) + BIOS_SRC_OFFSET
                , SYMBOL(code32flat_end) - SYMBOL(code32flat_start));
-}

-static void
-make_bios_writable_intel(u16 bdf, u32 pam0)
-{
-    int reg = pci_ioconfig_readb(bdf, pam0);
-    if (!(reg & 0x10)) {
-        // QEMU doesn't fully implement the piix shadow capabilities -
-        // if ram isn't backing the bios segment when shadowing is
-        // disabled, the code itself won't be in memory.  So, run the
-        // code from the high-memory flash location.
-        u32 pos = (u32)__make_bios_writable_intel + BIOS_SRC_OFFSET;
-        void (*func)(u16 bdf, u32 pam0) = (void*)pos;
-        func(bdf, pam0);
-        return;
-    }
-    // Ram already present - just enable writes
-    __make_bios_writable_intel(bdf, pam0);
+    // Make ram from 0xc0000-0xf0000 writable
+    for (i=0; i<6; i++)
+        pam[i + 1] = 0x33;
+
+    // Make ram from 0xf0000-0x100000 writable
+    pam[0] = 0x30;
+
+    // Write PAM settings back to pci config space
+    pci_ioconfig_writel(bdf, ALIGN_DOWN(pam0, 4), pamdata.data32[0]);
+    pci_ioconfig_writel(bdf, ALIGN_DOWN(pam0, 4) + 4, pamdata.data32[1]);
 }

Lev Kujawski (3):
  hw/pci-host/pam.c: Fully support RE^WE semantics of i440FX PAM
  tests/data/acpi/q35/SSDT.dimmpxm: Account for new E820 entry
  tests/qtest/i440fx-test.c: Enable full test of i440FX PAM operation

 accel/kvm/kvm-all.c              |   2 +-
 accel/tcg/cputlb.c               |  14 ++-
 hw/i386/pc.c                     |  19 ++-
 hw/pci-host/i440fx.c             |  34 +++---
 hw/pci-host/pam.c                | 193 ++++++++++++++++++++++++++-----
 hw/pci-host/q35.c                |  50 ++++----
 include/exec/memory.h            |  19 +++
 include/hw/pci-host/i440fx.h     |   2 +
 include/hw/pci-host/pam.h        |  19 ++-
 include/hw/pci-host/q35.h        |   2 +
 softmmu/memory.c                 |  58 +++++++++-
 softmmu/physmem.c                |   5 +
 tests/data/acpi/q35/SSDT.dimmpxm | Bin 734 -> 734 bytes
 tests/qtest/i440fx-test.c        |  31 ++---
 14 files changed, 353 insertions(+), 95 deletions(-)

-- 
2.34.1


