Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313211CFDC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 15:33:25 +0100 (CET)
Received: from localhost ([::1]:60710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifPWt-0007UP-Q9
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 09:33:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58936)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifPU9-0005jJ-Nt
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 09:30:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifPU8-0008I1-Fl
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 09:30:33 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50519)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ifPU8-0008Dz-5G
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 09:30:32 -0500
Received: by mail-wm1-x342.google.com with SMTP id a5so2608090wmb.0
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/f5ttWD0YBBmnXUACo+GHeAmmW3sES58X6wSRbitHaA=;
 b=o4FrjwArxqMH86O/mMAgQptQ4jOwZjvNs5hZq3wCovE2cWsEEwDNQ2TSePAHsQ580V
 0RSfPYod3tiloqqzaopd/10Iq3Ag7oHfqZIOYkVlI/lfCZdWA1HIvAIcUNOeP6KRtJKw
 1/gscto4bXx9jJO79kObRRwxfq0FPugp6Vdz1g6j1HcGUtWkiZtDvuHhIzwI54b1AgMq
 Zc11CZj9Azkmr+nOlZIk7jY3zEXFNNlLzruDNV98yTGuM+aIEcwWXAi2w5fkRgGW1jCj
 NalzErUO6u8EHEYPHW3bdn7FsI/vXNszl4IBAk0NpipMh9Aj4PSxNqT6Qc9Murwnfug/
 uUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=/f5ttWD0YBBmnXUACo+GHeAmmW3sES58X6wSRbitHaA=;
 b=H821YDDoJtkBBIE77O+oeMMa9lDig85La1AmSkJ6V6nvtEVPrsaHULNQI1l62iDJTT
 9ZuhfSs2mR1hM0B/Od7XzqlDwEZl3Bd22DcPJab18GkPhE4jJuKpsmv500kDlOwgKUbZ
 hxaKQ4mkd9aQxKCzqBw9JQUdOpw58Ioble3cP6bMh+ehn0XHPHQCkl3dxaS+q9QGZDMJ
 an6vbn6AjdA7QySCOfSSXOf95qrCnoXrkA8PZBlNga7Qt8FakKLdChswSmb8fMYqz4eR
 4njhTtTY5eGnCGjmPhNc4Spkt+G0qI1CloiO4EzL4PumJP+0phJcLBy/ulJFIbztD0B1
 zj7A==
X-Gm-Message-State: APjAAAVtKZrTaFLQklQLtJroWeKAFClPuqg75y8y9MDOW91gpvXWVvmG
 84T4tCwSqaFSDMSXqdA8RZbJXHD1
X-Google-Smtp-Source: APXvYqwU4QhYnPnRwVh+hj4A/IkstETz+enGCXpONxSS7h0kPeCm8tJxXMkiBLf7nGXY4aHaBJwxdw==
X-Received: by 2002:a1c:1d16:: with SMTP id d22mr7234564wmd.158.1576161027307; 
 Thu, 12 Dec 2019 06:30:27 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id c9sm6140505wmc.47.2019.12.12.06.30.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Dec 2019 06:30:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] pci-stub: add more MSI functions
Date: Thu, 12 Dec 2019 15:30:20 +0100
Message-Id: <1576161021-5359-5-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576161021-5359-1-git-send-email-pbonzini@redhat.com>
References: <1576161021-5359-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: philmd@redhat.com, slp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On x86, KVM needs some function from the PCI subsystem in order to set
up interrupt routes.  Provide some stubs to support x86 machines that
lack PCI.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/pci/pci-stub.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index c04a5df..cc2a2e1 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -26,6 +26,7 @@
 #include "qapi/qmp/qerror.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
 
 bool msi_nonbroken;
 bool pci_available;
@@ -64,3 +65,29 @@ void msi_notify(PCIDevice *dev, unsigned int vector)
 {
     g_assert_not_reached();
 }
+
+/* Required by target/i386/kvm.c */
+bool msi_is_masked(const PCIDevice *dev, unsigned vector)
+{
+    g_assert_not_reached();
+}
+
+MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+{
+    g_assert_not_reached();
+}
+
+int msix_enabled(PCIDevice *dev)
+{
+    return false;
+}
+
+bool msix_is_masked(PCIDevice *dev, unsigned vector)
+{
+    g_assert_not_reached();
+}
+
+MSIMessage msix_get_message(PCIDevice *dev, unsigned int vector)
+{
+    g_assert_not_reached();
+}
-- 
1.8.3.1



