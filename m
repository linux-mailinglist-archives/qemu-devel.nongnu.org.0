Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FDA5E934C
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 15:13:42 +0200 (CEST)
Received: from localhost ([::1]:53798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocRS1-0003sP-W2
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 09:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1ocO5c-0002Iz-Vh; Sun, 25 Sep 2022 05:38:21 -0400
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102]:48338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1ocO5b-0007A9-6Z; Sun, 25 Sep 2022 05:38:20 -0400
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Mb15z42Vmz9snl;
 Sun, 25 Sep 2022 11:38:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1664098695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSci2HODWG9PjNVJx6Y+YEanIA2l0t9/txobPaXHSjg=;
 b=hVCzy/5sas5cVo9zukvvfbwBiYMIUUnmLPksKF5cCZqE/21dCXPkDIAbW7NAFt3oGHoRLJ
 Rx0EiyHC20lfyFZ5i6ijHi7Sgc55spOVzaQ9HuF4XjKzzqD2yq/t5stRls3gP1BGWPj4bT
 f5s1aHJOQSbyQ1G/QD5hXuBXXyQWAbqhdaT1csIxX6oJGFWkos64AsDUst2PkeTSC6+/3x
 sMl6iBVgkTXfpGy7yTayq2i2S/mR9Qwm5PDD3b7mhQlt3xftzl+KzsaA16qwiwxlAYGhtC
 5tWSOVgy/kXz+69sCY2200VaK1dgMo52Ye2UfHvVrJqGXNbiS6DAUsBzK7sdow==
From: Lev Kujawski <lkujaw@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1664098693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSci2HODWG9PjNVJx6Y+YEanIA2l0t9/txobPaXHSjg=;
 b=CH7JoNTkzSybhw3/xzKfGv+1sjCsrat/UzOZklt3jrA2F022ShXxl9waUlwXcCg/nszyIl
 XD3I/6ZH+4+bnX4N5MAgQqfG2zNw2c7ig6axpqF6X9oINNxT3mapNb4NMtiICEt7NWedSZ
 7mAJM9dJxKUP/FAvpfcwE3BuPFzPWXUkBt6mMv+gVsB/kW8mXh9d5CGx0JRBqpsL8hTN1L
 Nqwp114k26Vfa7ZFU8iqzHQzpDt3MdhIOt5aXqtotoXbWAP2U3kof17BHggiV9vIt5QxpX
 KAr01vczKZKOMjyem86ci3wbSEKYQaHNQ/iML/q3jS/B37tNCI7XoMECO8qw/Q==
To: mst@redhat.com,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Lev Kujawski <lkujaw@mailbox.org>
Subject: [PATCH v3 1/2] qpci_device_enable: Allow for command bits hardwired
 to 0
Date: Sun, 25 Sep 2022 09:37:58 +0000
Message-Id: <20220925093759.1598617-2-lkujaw@mailbox.org>
In-Reply-To: <20220925093759.1598617-1-lkujaw@mailbox.org>
References: <20220922060325-mutt-send-email-mst@kernel.org>
 <20220925093759.1598617-1-lkujaw@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 89ekusg7ru5qfnseca976hx4rirbcp8m
X-MBO-RS-ID: b16d47634bf1bf2ca5a
X-Rspamd-Queue-Id: 4Mb15z42Vmz9snl
Received-SPF: pass client-ip=2001:67c:2050:0:465::102;
 envelope-from=lkujaw@mailbox.org; helo=mout-p-102.mailbox.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 25 Sep 2022 09:07:55 -0400
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

Devices like the PIIX3/4 IDE controller do not support certain modes
of operation, such as memory space accesses, and indicate this lack of
support by hardwiring the applicable bits to zero.  Extend the QEMU
PCI device testing framework to accommodate such devices.

* tests/qtest/libqos/pci.h: Add the command_disabled word to indicate
  bits hardwired to 0.
* tests/qtest/libqos/pci.c: Verify that hardwired bits are actually
  hardwired.

Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>
---
 tests/qtest/libqos/pci.c | 13 +++++++------
 tests/qtest/libqos/pci.h |  1 +
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/libqos/pci.c b/tests/qtest/libqos/pci.c
index b23d72346b..4f3d28d8d9 100644
--- a/tests/qtest/libqos/pci.c
+++ b/tests/qtest/libqos/pci.c
@@ -220,18 +220,19 @@ int qpci_secondary_buses_init(QPCIBus *bus)
 
 void qpci_device_enable(QPCIDevice *dev)
 {
-    uint16_t cmd;
+    const uint16_t enable_bits =
+        PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
+    uint16_t cmd, new_cmd;
 
     /* FIXME -- does this need to be a bus callout? */
     cmd = qpci_config_readw(dev, PCI_COMMAND);
-    cmd |= PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
+    cmd |= enable_bits;
     qpci_config_writew(dev, PCI_COMMAND, cmd);
 
     /* Verify the bits are now set. */
-    cmd = qpci_config_readw(dev, PCI_COMMAND);
-    g_assert_cmphex(cmd & PCI_COMMAND_IO, ==, PCI_COMMAND_IO);
-    g_assert_cmphex(cmd & PCI_COMMAND_MEMORY, ==, PCI_COMMAND_MEMORY);
-    g_assert_cmphex(cmd & PCI_COMMAND_MASTER, ==, PCI_COMMAND_MASTER);
+    new_cmd = qpci_config_readw(dev, PCI_COMMAND);
+    new_cmd &= enable_bits;
+    g_assert_cmphex(new_cmd, ==, enable_bits & ~dev->command_disabled);
 }
 
 /**
diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
index 8389614523..eaedb98588 100644
--- a/tests/qtest/libqos/pci.h
+++ b/tests/qtest/libqos/pci.h
@@ -68,6 +68,7 @@ struct QPCIDevice
     bool msix_enabled;
     QPCIBar msix_table_bar, msix_pba_bar;
     uint64_t msix_table_off, msix_pba_off;
+    uint16_t command_disabled;
 };
 
 struct QPCIAddress {
-- 
2.34.1


