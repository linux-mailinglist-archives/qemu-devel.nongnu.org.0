Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A5C55B0EC
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 11:51:39 +0200 (CEST)
Received: from localhost ([::1]:59280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Ova-0004Bw-Gd
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 05:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5Orr-0008EU-90; Sun, 26 Jun 2022 05:47:47 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5Orp-0000DG-L7; Sun, 26 Jun 2022 05:47:47 -0400
Received: by mail-ej1-x633.google.com with SMTP id d2so1452351ejy.1;
 Sun, 26 Jun 2022 02:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GE5xBWjtG9WBcqQI8QpdzBg3P6kzmtE86vK5W8A22FE=;
 b=a4377qvEOvu3e1RTfuQHxJNPGsEaFzLBzKYodFBIEb2E1GNijJZcTVwGr5bD9befZ0
 JpJaEMJNHnDTjVdJnoPxuQPvBYdl9U6yXsj9p2qGi79fPrVYpM3QAmOAT2ppnrTn0D3P
 U7JQCpBP09rFtCwCEL0pih2PVJ2uPi3Hbay6sEHcBhdodIs8k+DLz/JFcavfnOjaCg17
 nESFOkVfPHUvWU2OMNEkN4gb5Lus7Eu0GK6ro3W5Ebh/44PCoV4lrM6ld8wJpZmpvSfJ
 jbiSB0EdpEEM1cZpiH8vVpw1KfH+YF5T11FlSFr2nPntX8U9XqUDtbFLv7Q2NZyfB0VR
 /YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GE5xBWjtG9WBcqQI8QpdzBg3P6kzmtE86vK5W8A22FE=;
 b=n4nXpZMgCzlcBpR7q/DO87lLolnvEnDuCDS/ZkQ07eVSOOXAihDpb0/ncOg9/WKeCQ
 DvwPJl+0KKU9LE3oTeitNKBNxRLlGlvm3tAIwyiJB/9qpMImrc1bZiNkTHS9XD/iifbh
 4VoV31rUsQbhH5rNtsg+y1SQItKGesQfkRsDoni3tnWttLY67poaJuQurSLcbgm3LASV
 geZvSz/dCBEDKzCqmIYw8AFR9x/WGAsxPmaAZzG8u/fe1JdH8Te/v0oEKRLiVC3WT2Qf
 B2yY60xK1bJUgHFIR0SO/43jE0ecERQzof3l/5FGfi2Vl9M1VS8HB47arKuiQeAk15R6
 kpJQ==
X-Gm-Message-State: AJIora8r6thEZgCJqnMIt/mUtQrGC99zjNqzSrdBz2bWXyxo3XZmkSeJ
 7dcoaGLlMMpAOADkdv0EfDvJYJ3pgEw=
X-Google-Smtp-Source: AGRyM1u8/kthGc0kpB9GQ15WfHOOb7ssiu2IAI5tCBcbMUyhhCKcEeCpk68TInH1f8s1P+3vxGqdmg==
X-Received: by 2002:a17:906:b05a:b0:718:cc6b:61e0 with SMTP id
 bj26-20020a170906b05a00b00718cc6b61e0mr7378413ejb.501.1656236862769; 
 Sun, 26 Jun 2022 02:47:42 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-055-174-013.78.55.pool.telefonica.de. [78.55.174.13])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090605c400b00706242d297fsm3504752ejt.212.2022.06.26.02.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 02:47:42 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/2] hw/i386/xen/xen-hvm: Inline
 xen_piix_pci_write_config_client() and remove it
Date: Sun, 26 Jun 2022 11:46:56 +0200
Message-Id: <20220626094656.15673-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220626094656.15673-1-shentey@gmail.com>
References: <20220626094656.15673-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

xen_piix_pci_write_config_client() is implemented in the xen sub tree and
uses PIIX constants internally, thus creating a direct dependency on
PIIX. Now that xen_set_pci_link_route() is stubbable, the logic of
xen_piix_pci_write_config_client() can be moved to PIIX which resolves
the dependency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/xen/xen-hvm.c | 18 ------------------
 hw/isa/piix3.c        | 15 ++++++++++++++-
 include/hw/xen/xen.h  |  1 -
 stubs/xen-hw-stub.c   |  4 ----
 4 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 204fda7949..e4293d6d66 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -15,7 +15,6 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "hw/i386/pc.h"
-#include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/hw.h"
 #include "hw/i386/apic-msidef.h"
@@ -149,23 +148,6 @@ void xen_piix3_set_irq(void *opaque, int irq_num, int level)
                            irq_num & 3, level);
 }
 
-void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
-{
-    int i;
-
-    /* Scan for updates to PCI link routes (0x60-0x63). */
-    for (i = 0; i < len; i++) {
-        uint8_t v = (val >> (8 * i)) & 0xff;
-        if (v & 0x80) {
-            v = 0;
-        }
-        v &= 0xf;
-        if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
-            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
-        }
-    }
-}
-
 int xen_set_pci_link_route(uint8_t link, uint8_t irq)
 {
     return xendevicemodel_set_pci_link_route(xen_dmod, xen_domid, link, irq);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 6388558f92..48f9ab1096 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -138,7 +138,20 @@ static void piix3_write_config(PCIDevice *dev,
 static void piix3_write_config_xen(PCIDevice *dev,
                                    uint32_t address, uint32_t val, int len)
 {
-    xen_piix_pci_write_config_client(address, val, len);
+    int i;
+
+    /* Scan for updates to PCI link routes (0x60-0x63). */
+    for (i = 0; i < len; i++) {
+        uint8_t v = (val >> (8 * i)) & 0xff;
+        if (v & 0x80) {
+            v = 0;
+        }
+        v &= 0xf;
+        if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
+            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
+        }
+    }
+
     piix3_write_config(dev, address, val, len);
 }
 
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 13bffaef53..afdf9c436a 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -23,7 +23,6 @@ extern bool xen_domid_restrict;
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
 void xen_piix3_set_irq(void *opaque, int irq_num, int level);
-void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
 int xen_is_pirq_msi(uint32_t msi_data);
 
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 743967623f..34a22f2ad7 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -19,10 +19,6 @@ void xen_piix3_set_irq(void *opaque, int irq_num, int level)
 {
 }
 
-void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
-{
-}
-
 int xen_set_pci_link_route(uint8_t link, uint8_t irq)
 {
     return -1;
-- 
2.36.1


