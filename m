Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041E7308D5E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:31:59 +0100 (CET)
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ZUs-0000fa-2O
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5ZRm-0007jK-GQ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:28:46 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5ZRk-00075e-0T
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:28:45 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c12so9957087wrc.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 11:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VsxrnpQIEyMpLuKjsP9+lNnAfNbvL69yjYGVToDbKAU=;
 b=RCQsBarBcQqvTYL3bio8rJpIO+jJJbLHCDbIfP4HfpTs8/FJNNmQvQmxtfAo/esc93
 yGzs7N0QPtoPObbj3MtWwdsqjuI4KwZlWzbk92riq8gdmaMa29HyM6rOSj3f6ohe3Z4l
 jM/gdZipQYOaonkPyDLcivjQvBkJEdK8TNYfHPHkybrEN+WcymLyxw3TwCI+xsHbW85h
 cDwi6LvzHNFxTrBlNqCw/cNeu4MaglFswS6tadKQE+e0Aj2LKkxgy7KoF45t6Nw7xIYF
 Oi6QSjleQwlmiy16i5GoouoRbTulyeUdBDJMOoj/53RERQk1kNuWPTBsZ2LPvsLC72k+
 GqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VsxrnpQIEyMpLuKjsP9+lNnAfNbvL69yjYGVToDbKAU=;
 b=HKtfwLAXcq+0kejP6W18YjKLG1C+GeCKe4i6jFqxB+rODTH4WAYNcSAA/1kXO8btgE
 /6kG6r7KHKMMnnwH0IHn5WSSlK0CL4cVUG7CTrlboCuyhis7jLtdY9mbunuDvDqNGtdy
 AoJk6hbIci+MmjMhQYDQ2XaPOJReCTUN21DvISQAjIyf6foEhCB48G7yMC8HJcWZEmHX
 z/mFp+qqpypOQwBWtAa7MmntfsCguQTyF4xrdFpg/TPCEdhC5PWFeLLTbhEW2zKmQPO1
 Jv8Yr+oKsFud7WI7se4dR5yeeTs6nGsqb2fkQdEgAOBTVRtk+KtRMrQtwnTXH+aesYoi
 LWDw==
X-Gm-Message-State: AOAM5325fA8sukRSeTwLj3wlfIOwpvNJkQrLZHBYCOnn9Rjk09t6HqYv
 T0Z0EOQv86fzqQmrs4itMqP2AXrTYXFDGg==
X-Google-Smtp-Source: ABdhPJyuxs9mRPrlu5oabsH3uT7XjPBiDTl+lfQmxgsGOXD6NiGAn7cW0OAX48Gk5gd8hExRXxSBQQ==
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr6178190wrx.47.1611948522778; 
 Fri, 29 Jan 2021 11:28:42 -0800 (PST)
Received: from avogadro.lan ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id l18sm10964528wme.37.2021.01.29.11.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:28:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] pci: add romsize property
Date: Fri, 29 Jan 2021 20:28:38 +0100
Message-Id: <20210129192838.582771-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129192838.582771-1-pbonzini@redhat.com>
References: <20210129192838.582771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lersek@redhat.com, dgilbert@redhat.com, peterx@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This property can be useful for distros to set up known-good ROM sizes for
migration purposes.  The VM will fail to start if the ROM is too large,
and migration compatibility will not be broken if the ROM is too small.

Note that even though romsize is a uint32_t, it has to be between 1
(because empty ROM files are not accepted, and romsize must be greater
than the file) and 2^31 (because values above are not powers of two and
are rejected).

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/pci/pci.c             | 19 +++++++++++++++++--
 hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
 include/hw/pci/pci.h     |  1 +
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index bbce10050b..5b3fe3c294 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -68,6 +68,7 @@ static void pcibus_reset(BusState *qbus);
 static Property pci_props[] = {
     DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
     DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
+    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
     DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
     DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
                     QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
@@ -2107,6 +2108,11 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     bool is_default_rom;
     uint16_t class_id;
 
+    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
+        error_setg(errp, "ROM size %d is not a power of two", pci_dev->romsize);
+        return;
+    }
+
     /* initialize cap_present for pci_is_express() and pci_config_size(),
      * Note that hybrid PCIs are not set automatically and need to manage
      * QEMU_PCI_CAP_EXPRESS manually */
@@ -2372,7 +2378,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         g_free(path);
         return;
     }
-    size = pow2ceil(size);
+    if (pdev->romsize != -1) {
+        if (size > pdev->romsize) {
+            error_setg(errp, "romfile \"%s\" (%u bytes) is too large for ROM size %u",
+                       pdev->romfile, (uint32_t)size, pdev->romsize);
+            g_free(path);
+            return;
+        }
+    } else {
+        pdev->romsize = pow2ceil(size);
+    }
 
     vmsd = qdev_get_vmsd(DEVICE(pdev));
 
@@ -2382,7 +2397,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
     }
     pdev->has_rom = true;
-    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, size, &error_fatal);
+    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
     ptr = memory_region_get_ram_ptr(&pdev->rom);
     if (load_image_size(path, ptr, size) < 0) {
         error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
index a50a80837e..153812f8cd 100644
--- a/hw/xen/xen_pt_load_rom.c
+++ b/hw/xen/xen_pt_load_rom.c
@@ -53,10 +53,20 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
     }
     fseek(fp, 0, SEEK_SET);
 
+    if (dev->romsize != -1) {
+        if (st.st_size > dev->romsize) {
+            error_report("ROM BAR \"%s\" (%ld bytes) is too large for ROM size %d",
+                         rom_file, (long) st.st_size, dev->romsize);
+            goto close_rom;
+        }
+    } else {
+        dev->romsize = st.st_size;
+    }
+
     snprintf(name, sizeof(name), "%s.rom", object_get_typename(owner));
-    memory_region_init_ram(&dev->rom, owner, name, st.st_size, &error_abort);
+    memory_region_init_ram(&dev->rom, owner, name, dev->romsize, &error_abort);
     ptr = memory_region_get_ram_ptr(&dev->rom);
-    memset(ptr, 0xff, st.st_size);
+    memset(ptr, 0xff, dev->romsize);
 
     if (!fread(ptr, 1, st.st_size, fp)) {
         error_report("pci-assign: Cannot read from host %s", rom_file);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 259f9c992d..b028245b62 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -343,6 +343,7 @@ struct PCIDevice {
 
     /* Location of option rom */
     char *romfile;
+    uint32_t romsize;
     bool has_rom;
     MemoryRegion rom;
     uint32_t rom_bar;
-- 
2.29.2


