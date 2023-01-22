Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36A96770EE
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 18:08:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJdor-00024X-EO; Sun, 22 Jan 2023 12:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdop-00023z-P2
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:47 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdoo-0005TS-28
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:47 -0500
Received: by mail-ej1-x634.google.com with SMTP id qx13so25024970ejb.13
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 09:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H2vClOyHfJHGHWScoT9CS6UO1o8J5b4Lv9/t/Xz8pGc=;
 b=QvEl3alJ0pvEJG9+cVl2fAToHCUBafyXW0v/+p7mGXC8kusrQYFVKNyI8zOkQWyVkE
 FFjI13QiZmmdIHuOIINMw6nnHZ11KM2q83zAjgBwdVBBMfX66ikLHe+8BZ/BVOtnDz3x
 NT3m/gFH6WQsHgRD6Awzmijxf23+3DJmbd4177Ky07vI6hRsBoV+qGLl2rMMbw6CDHQR
 CxVW1zv/VILO+FLOSyefZAPRMeEXPDQFSeir6FUbOFeQhQ5lu5+Z3rFcVwO39iqBlL9t
 Cu+NFdyAujItqhPFCymMt/u/FAhE9pY39StQ0AEjkLdfBZbdqAi/GURCH7zjsCVLDIWJ
 MI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H2vClOyHfJHGHWScoT9CS6UO1o8J5b4Lv9/t/Xz8pGc=;
 b=Ja7VBH8uv+G91QpOKGpMkjN/SMRuvO5+5eLeVD5Ql/8EbSk/wcbaJ+24ESPS7cZAZv
 kk3JX773eMBoDYEPqjxF7EAAHwWon5sMTFAQj9buQkYKWuu/rCP+HZt44N1ycLmZhCHf
 yNgeFA4hEa0ghtRjzMBMLFOpDVYgc2KSUGEzZQtqgom1xe4CbqmaiZjiaOzrs0NmAjB2
 vqfS4mArhE0hKeb77cyoMSA7lL3rMBK57sHYqHSarD1tV40feqI053HDtiVhWSCoZUTH
 DepmnkwNE+1OkBgoi8gpfEq4AROpngIHRBZRlAzRr9NpYYuat0Oj4IusTnUyXO0OJ0wM
 QkpQ==
X-Gm-Message-State: AFqh2krSta6KqFz9keUJu4AzgJv/d0ZIVZOds/HLK1aqooc0VddSfRnm
 S7hN5VKRVq6v+Wwx7/T///cGZd4DOg24og==
X-Google-Smtp-Source: AMrXdXtCxPG1TJZibWxXp3eVhatJAfPK7cU8Uyg1xwvkA2T0BDPHnyY+oUOqdTk6btTOoUzgP06v1g==
X-Received: by 2002:a17:906:b14b:b0:864:1902:7050 with SMTP id
 bt11-20020a170906b14b00b0086419027050mr21343843ejb.69.1674407265215; 
 Sun, 22 Jan 2023 09:07:45 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0084d397e0938sm19670453ejc.195.2023.01.22.09.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 09:07:44 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/7] hw/acpi/{ich9,
 piix4}: Resolve redundant io_base address attributes
Date: Sun, 22 Jan 2023 18:07:20 +0100
Message-Id: <20230122170724.21868-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230122170724.21868-1-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A MemoryRegion has an addr attribute which gets set to the same values
as the redundant io_addr attributes.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/acpi/ich9.h  |  1 -
 include/hw/acpi/piix4.h |  2 --
 hw/acpi/ich9.c          | 17 ++++++++---------
 hw/acpi/piix4.c         | 11 ++++++-----
 4 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index d41866a229..22471a1b9d 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -49,7 +49,6 @@ typedef struct ICH9LPCPMRegs {
 
     qemu_irq irq;      /* SCI */
 
-    uint32_t pm_io_base;
     Notifier powerdown_notifier;
 
     bool cpu_hotplug_legacy;
diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
index be1f8ea80e..62e1925a1f 100644
--- a/include/hw/acpi/piix4.h
+++ b/include/hw/acpi/piix4.h
@@ -39,8 +39,6 @@ struct PIIX4PMState {
     /*< public >*/
 
     MemoryRegion io;
-    uint32_t io_base;
-
     MemoryRegion io_gpe;
     ACPIREGS ar;
 
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 0313e71e74..f8af238974 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -126,17 +126,16 @@ void ich9_pm_iospace_update(ICH9LPCPMRegs *pm, uint32_t pm_io_base)
 
     assert((pm_io_base & ICH9_PMIO_MASK) == 0);
 
-    pm->pm_io_base = pm_io_base;
     memory_region_transaction_begin();
-    memory_region_set_enabled(&pm->io, pm->pm_io_base != 0);
-    memory_region_set_address(&pm->io, pm->pm_io_base);
+    memory_region_set_enabled(&pm->io, pm_io_base != 0);
+    memory_region_set_address(&pm->io, pm_io_base);
     memory_region_transaction_commit();
 }
 
 static int ich9_pm_post_load(void *opaque, int version_id)
 {
     ICH9LPCPMRegs *pm = opaque;
-    ich9_pm_iospace_update(pm, pm->pm_io_base);
+    ich9_pm_iospace_update(pm, pm->io.addr);
     return 0;
 }
 
@@ -349,9 +348,9 @@ static void ich9_pm_get_gpe0_blk(Object *obj, Visitor *v, const char *name,
                                  void *opaque, Error **errp)
 {
     ICH9LPCPMRegs *pm = opaque;
-    uint32_t value = pm->pm_io_base + ICH9_PMIO_GPE0_STS;
+    uint64_t value = pm->io.addr + ICH9_PMIO_GPE0_STS;
 
-    visit_type_uint32(v, name, &value, errp);
+    visit_type_uint64(v, name, &value, errp);
 }
 
 static bool ich9_pm_get_memory_hotplug_support(Object *obj, Error **errp)
@@ -440,9 +439,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     pm->keep_pci_slot_hpc = true;
     pm->enable_tco = true;
 
-    object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
-                                   &pm->pm_io_base, OBJ_PROP_FLAG_READ);
-    object_property_add(obj, ACPI_PM_PROP_GPE0_BLK, "uint32",
+    object_property_add_uint64_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
+                                   &pm->io.addr, OBJ_PROP_FLAG_READ);
+    object_property_add(obj, ACPI_PM_PROP_GPE0_BLK, "uint64",
                         ich9_pm_get_gpe0_blk,
                         NULL, NULL, pm);
     object_property_add_uint8_ptr(obj, ACPI_PM_PROP_GPE0_BLK_LEN,
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 370b34eacf..2e9bc63fca 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -91,13 +91,14 @@ static void apm_ctrl_changed(uint32_t val, void *arg)
 static void pm_io_space_update(PIIX4PMState *s)
 {
     PCIDevice *d = PCI_DEVICE(s);
+    uint32_t io_base;
 
-    s->io_base = le32_to_cpu(*(uint32_t *)(d->config + 0x40));
-    s->io_base &= 0xffc0;
+    io_base = le32_to_cpu(*(uint32_t *)(d->config + 0x40));
+    io_base &= 0xffc0;
 
     memory_region_transaction_begin();
     memory_region_set_enabled(&s->io, d->config[0x80] & 1);
-    memory_region_set_address(&s->io, s->io_base);
+    memory_region_set_address(&s->io, io_base);
     memory_region_transaction_commit();
 }
 
@@ -433,8 +434,8 @@ static void piix4_pm_add_properties(PIIX4PMState *s)
                                   &s->ar.gpe.len, OBJ_PROP_FLAG_READ);
     object_property_add_uint16_ptr(OBJECT(s), ACPI_PM_PROP_SCI_INT,
                                   &sci_int, OBJ_PROP_FLAG_READ);
-    object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
-                                  &s->io_base, OBJ_PROP_FLAG_READ);
+    object_property_add_uint64_ptr(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
+                                   &s->io.addr, OBJ_PROP_FLAG_READ);
 }
 
 static void piix4_pm_realize(PCIDevice *dev, Error **errp)
-- 
2.39.1


