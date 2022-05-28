Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E9A536BE2
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:25:11 +0200 (CEST)
Received: from localhost ([::1]:55884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nush4-0000RB-O2
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusc4-0005zr-K6
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusc2-0003nI-EO
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YlhT7yxIkudqF+PbwKXfyutP4g/LayqLZFH7J9UNGfk=; b=rD8CTqvInHW8CLiVoH8MvfqSol
 IKLlrDShlPKzeGSDxjPIrQL84vei2x/9KXbQONQKW0YBVWnN7k+m7Yx9JtsL3aYjF7NchEEQsJAsK
 L5zbBw5QnP1kolR8/LhWdz3CIFNy/gJHFN7urX9U8d3MdWqoGgBi70rUIRUqwO6m8Q9ED2ToqiMMd
 +GaCoA63EPcQIHx1fQllGI6aTc8/n3p7V1lIByeEiHr8jWlMr50vMkz/4ryAiJ2hK7aBfFnX9k8g9
 B2qMYCdH0dROecmZ1KLUw3+7WBrVhuwskHYZUyQ2UIWUQz8GjPKBnjwoD7p9vvxMyFX4UUNNtpJns
 l85cUauXCeH9A3DQ2WPeGajVWrONm7Ugd6XPMplfMpS86uWKoOSURR5DRjbkPEsopIDfgJEVbOntV
 5zV4PAhal+LaZb8Tgl54QEo9JEzZXqL3RmQeMc0NtP9oP6+0dp5Zzyr0RIyWjJFCiIUq9Uu8LTA+G
 5Agpew+uSsmG0RhdBgOIm+0Dq8iualcb/8b8aIxxdS6RPTvJXl5hpfX7PHDifHtYQgzk1vSsYqYea
 YGoMFqiODiCG9T+yvCmB3bGHTJgsI7qpQHqndtfmId/eClF1qBtmnc8lx7U00bGRskpmxBs0JnYDf
 wspOnqMh0FxiiW66tRQjQlx7DUSFtgCxQhQgC4gh0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusam-0003JL-Ii; Sat, 28 May 2022 10:18:44 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Date: Sat, 28 May 2022 10:19:23 +0100
Message-Id: <20220528091934.15520-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 01/12] hw/acpi/piix4: move xen_enabled() logic from
 piix4_pm_init() to piix4_pm_realize()
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This logic can be included as part of piix4_pm_realize() and does not need to
be handled externally.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/piix4.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index fe5625d07a..bf20fa139b 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -525,6 +525,10 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
     s->machine_ready.notify = piix4_pm_machine_ready;
     qemu_add_machine_init_done_notifier(&s->machine_ready);
 
+    if (xen_enabled()) {
+        s->use_acpi_hotplug_bridge = false;
+    }
+
     piix4_acpi_system_hot_add_init(pci_address_space_io(dev),
                                    pci_get_bus(dev), s);
     qbus_set_hotplug_handler(BUS(pci_get_bus(dev)), OBJECT(s));
@@ -551,9 +555,6 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     s->irq = sci_irq;
     s->smi_irq = smi_irq;
     s->smm_enabled = smm_enabled;
-    if (xen_enabled()) {
-        s->use_acpi_hotplug_bridge = false;
-    }
 
     pci_realize_and_unref(pci_dev, bus, &error_fatal);
 
-- 
2.20.1


