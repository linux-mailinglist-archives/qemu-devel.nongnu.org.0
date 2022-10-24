Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B46B609F47
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 12:46:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omu3s-0002BU-41; Mon, 24 Oct 2022 05:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1omu37-0001rQ-Te; Mon, 24 Oct 2022 05:47:16 -0400
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1omu2Y-0002ZN-9e; Mon, 24 Oct 2022 05:47:13 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Mwqw872bFz9sJ4;
 Mon, 24 Oct 2022 11:46:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1666604793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSci2HODWG9PjNVJx6Y+YEanIA2l0t9/txobPaXHSjg=;
 b=ecZ9gsHm2YONviEE2XjfZoO5U+c+Ek7uvM0RmmBeduDfYtfQp4ZZVh8ZC++sVy/morylPW
 2G1/N6PdDAw4h1WyaRk5H7nUKu6Dd9MXnftr4hCmpC/mI1ZU4vmABtLCUnt9vmSJkRLABV
 EdA1AyLkAjVZqe/ub9ZCw9nY3FAHnQpz1v59hgxAsTQtKebTzMXSV4/aikNkvq27yALJhL
 D7cNypv8hDBFTGPNj6zhy18jnmf02lC1a8ZcLqZnqJwqHu1bZfRqjav5qIvdYXZWN1OBd1
 0nwgGhi2yClDzSFWTPG+f/TtsAkUS69xcRQaYhC34Eiz17yc6V/i7yKbwGdfJQ==
From: Lev Kujawski <lkujaw@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1666604791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSci2HODWG9PjNVJx6Y+YEanIA2l0t9/txobPaXHSjg=;
 b=TUdLQ4uLt4d8jrrzHtj0QNKwVOrydxBLs9QCzh/Xnn95Dz0gGxYFgaER7A4fr/R5AzpSyb
 X57SSQmSe6XhYbhGVuQADQiU0jOqWbizj9pzHQCkH7SDPrvWR4sY01zUqxmaQ3EFQLc/wT
 EA7doWdPjDXBhnM4xuVESpnuqhvga7v8+iEdJKyiQz3yfjcCG/ASpyyixt9z2+pWBahu9X
 XXfozmi0xQEPXoRXdWKtjif1KBerAhrWrqKKNmeZriEWyRYHfqXN4tPMLqAo10Zw81DRB8
 K5VTHfUBt93roMFvihC59VN2tBDDo7iwVeeoZyHy26hPu+dc8ecBGTfyE4L1ng==
To: qemu-devel@nongnu.org,
	mst@redhat.com
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Lev Kujawski <lkujaw@mailbox.org>
Subject: [PATCH 1/2] qpci_device_enable: Allow for command bits hardwired to 0
Date: Mon, 24 Oct 2022 09:46:20 +0000
Message-Id: <20221024094621.512806-2-lkujaw@mailbox.org>
In-Reply-To: <20221024094621.512806-1-lkujaw@mailbox.org>
References: <20221007095229-mutt-send-email-mst@kernel.org>
 <20221024094621.512806-1-lkujaw@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 19dec13ea3fa218dc78
X-MBO-RS-META: 5g5m87k4jhceg1ezzqgz1bh6tw7ces6h
X-Rspamd-Queue-Id: 4Mwqw872bFz9sJ4
Received-SPF: pass client-ip=2001:67c:2050:0:465::103;
 envelope-from=lkujaw@mailbox.org; helo=mout-p-103.mailbox.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


