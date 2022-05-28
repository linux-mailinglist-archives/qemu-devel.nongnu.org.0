Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D11C536C03
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:38:44 +0200 (CEST)
Received: from localhost ([::1]:43780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nusuB-0003Sn-9T
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscF-000607-Ou
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscC-0003zF-IY
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IAx8mu/T+3H+F6vHg/y4WwRKfDCbdm15nF9X+1tRDCk=; b=rtdJgyGuJafnx3jINvnfvK6uCS
 6I50110XWfLgx5rbT+JIaB4FcIug3P22mIQY5DJklDy99p1gBaOsyY8k+HLYRmSP7XJmTqRmDaAcJ
 puChpH31a97P0j+7ZHSAU+ml1Yr3HmrwJaEBmEhqFl3E7zPLaNXkOD/Yz822HqBFRAB4Z9ICtbIHx
 BQ/S3LqgKAH0YT11tYPVCnAf8Q2w7aUSE+wb+is45ErEplS07RvlXvOVhvRrkzI3KnweCAl9c8cfu
 vUVCWHHECrq/xvA4qtYjPbXliEEZlmci7rD45a9BQ+vujq9DS67xZz+or2Bg+YrZOXafl2WwYQO5d
 3d5quhinVgJydkpu22f5kKT1MdraE9DRiF3bQq4n5ibZNQRsocN7t0hMdZr0ldjGvcRHkspRtnrYG
 mPE4cnVhes7xBF8KNeLvhi7bhO/3S53gPoI7NFRVo7V0/0hlj3kHkvFzIptiei+felfEb1XnkEKQc
 zs5uiwG/KK1cSfBCJd7U8Ih3Z22Q2p3gBF3BI/ENobKB1sRmj/jXAIl/9zwjaz7D0KcLXrCm5pIdD
 qQCFpMfZsFnq6mANV7y6+NNnSoon7aPHPU2K6UuviUnlmIAZQi+arSgYLZqh6aiyMPBqVCuPtQFJn
 IMKK4vwpXPCHWFKnH1W5kgz3fKbnXXj5huhva4n04=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusav-0003JL-8R; Sat, 28 May 2022 10:18:53 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Date: Sat, 28 May 2022 10:19:25 +0100
Message-Id: <20220528091934.15520-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 03/12] hw/acpi/piix4: convert smm_enabled bool to qdev property
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

This allows the smm_enabled value to be set using a standard qdev property instead
of being referenced directly in piix4_pm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/piix4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index fcfaafc175..2735ff375e 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -547,6 +547,7 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     pci_dev = pci_new(devfn, TYPE_PIIX4_PM);
     dev = DEVICE(pci_dev);
     qdev_prop_set_uint32(dev, "smb_io_base", smb_io_base);
+    qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
     if (piix4_pm) {
         *piix4_pm = dev;
     }
@@ -554,7 +555,6 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     s = PIIX4_PM(dev);
     s->irq = sci_irq;
     s->smi_irq = smi_irq;
-    s->smm_enabled = smm_enabled;
 
     pci_realize_and_unref(pci_dev, bus, &error_fatal);
 
@@ -664,6 +664,7 @@ static Property piix4_pm_properties[] = {
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
     DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, false),
+    DEFINE_PROP_BOOL("smm-enabled", PIIX4PMState, smm_enabled, false),
     DEFINE_PROP_BOOL("x-not-migrate-acpi-index", PIIX4PMState,
                       not_migrate_acpi_index, false),
     DEFINE_PROP_END_OF_LIST(),
-- 
2.20.1


