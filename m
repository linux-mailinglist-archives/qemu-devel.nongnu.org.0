Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B180830DAF8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:21:41 +0100 (CET)
Received: from localhost ([::1]:43084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7I6G-00069m-Pf
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l7I3I-0004Bd-6b
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:18:36 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l7I3G-00048r-C8
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:18:35 -0500
Received: by mail-ej1-x633.google.com with SMTP id b9so16108121ejy.12
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 05:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EYx1BW9srW0NGf7FfuaTHIpjAvh07KmuyWTooKiQlSE=;
 b=UljujUbnc+WkhrqvrrVYGR8aqdLSWk3ZqNvYnVXBwA/81T28sxAoXva27x8YVL3yL4
 VcFq56Cwj61i67IwXD41oU7K4pXd0mUvZfw9se0Q5JW+odMwAOEgn9R4tUBpmL9O1VDT
 UT9qBzrLT3+iXktCVlyVFsJYm+RdW+DTg2sNAnlCSiwl6ECmQAU9TBYeNABnbnZsOYH7
 stWpTpFfGIckv5/GdvPOFtpIBaNCx2GxBwXtJ2wgOBSJDtUxHGu6iWQf7pOc8GVhwMEE
 KwX+iZ8garHI9yf7AasPTdjvsb0CtnXyEU4nlpO1YHQBdvypDymB2oZ/XVo7bTFoj7Vb
 OKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EYx1BW9srW0NGf7FfuaTHIpjAvh07KmuyWTooKiQlSE=;
 b=tWDP5zEPM3AGv57eE1/4pbov3xjxp35+oIXt2Sgm2SFaFe4jhtxxV8KYAKgcLct1BR
 U3ngDfxxzaNtDpIW/sKUj0U3Rd2IXQuI6R39p+PS5WKpl4MLmKFNXox/n2TqnjJODcrU
 iwf/ZCcUP8o6oeZti2bo5ifsKdiV8kVc+1Ca23lF2tWSkTSEgtA0/+feNf0OaGAdzilT
 BlRKwP/JQyxdG1Ioljb2DkD5qCIB14g2zxM1PP2vozmmcTEgT0kEr84WZVOjiwY1mYxy
 AE+CheQm7uuhBJoG9lDvhjyWlacVXKtcNNolhKy/n7yF8AKj4Q1NBf/Ld6qybVRU9ZrX
 Q7xQ==
X-Gm-Message-State: AOAM530iQbJUwsEQDPTx5vQGvllIOiz8m4iOYSCMSpor3GYdYbB+J2u9
 mGUbH1fPapgFlvoaNnWXEMd/qvHiQuX0aA==
X-Google-Smtp-Source: ABdhPJyhsjbqjm54LlMaE+waNkObomiAo3itODHOwPXLe6SGw0lQj1NlgoQy/i14PARwZSpI1kASTQ==
X-Received: by 2002:a17:906:57d4:: with SMTP id
 u20mr3138710ejr.247.1612358312886; 
 Wed, 03 Feb 2021 05:18:32 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g14sm866892edm.31.2021.02.03.05.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 05:18:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] pci: add romsize property
Date: Wed,  3 Feb 2021 14:18:28 +0100
Message-Id: <20210203131828.156467-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203131828.156467-1-pbonzini@redhat.com>
References: <20210203131828.156467-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: mst@redhat.com, lersek@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 dme@dme.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This property can be useful for distros to set up known-good ROM sizes for
migration purposes.  The VM will fail to start if the ROM is too large,
and migration compatibility will not be broken if the ROM is too small.

Note that even though romsize is a uint32_t, it has to be between 1
(because empty ROM files are not accepted, and romsize must be greater
than the file) and 2^31 (because values above are not powers of two and
are rejected).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20201218182736.1634344-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/pci/pci.c             | 19 +++++++++++++++++--
 hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
 include/hw/pci/pci.h     |  1 +
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 58560c044d..a9ebef8a35 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -69,6 +69,7 @@ static void pcibus_reset(BusState *qbus);
 static Property pci_props[] = {
     DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
     DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
+    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
     DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
     DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
                     QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
@@ -2084,6 +2085,11 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     bool is_default_rom;
     uint16_t class_id;
 
+    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
+        error_setg(errp, "ROM size %u is not a power of two", pci_dev->romsize);
+        return;
+    }
+
     /* initialize cap_present for pci_is_express() and pci_config_size(),
      * Note that hybrid PCIs are not set automatically and need to manage
      * QEMU_PCI_CAP_EXPRESS manually */
@@ -2349,7 +2355,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
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
 
@@ -2359,7 +2374,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
     }
     pdev->has_rom = true;
-    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, size, &error_fatal);
+    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
     ptr = memory_region_get_ram_ptr(&pdev->rom);
     if (load_image_size(path, ptr, size) < 0) {
         error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
index a50a80837e..03422a8a71 100644
--- a/hw/xen/xen_pt_load_rom.c
+++ b/hw/xen/xen_pt_load_rom.c
@@ -53,10 +53,20 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
     }
     fseek(fp, 0, SEEK_SET);
 
+    if (dev->romsize != -1) {
+        if (st.st_size > dev->romsize) {
+            error_report("ROM BAR \"%s\" (%ld bytes) is too large for ROM size %u",
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
index 66db08462f..1bc231480f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -344,6 +344,7 @@ struct PCIDevice {
 
     /* Location of option rom */
     char *romfile;
+    uint32_t romsize;
     bool has_rom;
     MemoryRegion rom;
     uint32_t rom_bar;
-- 
2.29.2


