Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC8A479B7A
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 15:56:05 +0100 (CET)
Received: from localhost ([::1]:57768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myb80-0002TV-RN
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 09:56:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myb3Z-0005Xk-Oa
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 09:51:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myb3X-0001AQ-41
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 09:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639839086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cj78Ig3zcSuXURlmDuOC50tEy22RP0C60QMqu5xK6c8=;
 b=h5rugh69rw8xKEJ4rwFq80l0l7ID9pWhEtJLT3VGJqJVsOODz9I5Eqk51TE9Yh9GvQ6Xbk
 YkBf2jq2rPy9mr3FKCrRzrqYxta8V+/fRluOraaDXgF70ZPkEIEa32ssYpQOuqEem716cC
 079IMCI+VVM3ZIaruXdrpB6CGpCEhKs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-6cKUzfetN1KUT_0GBFYr5A-1; Sat, 18 Dec 2021 09:51:20 -0500
X-MC-Unique: 6cKUzfetN1KUT_0GBFYr5A-1
Received: by mail-wr1-f69.google.com with SMTP id
 v6-20020adfa1c6000000b001a26d0c3e32so116492wrv.14
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 06:51:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cj78Ig3zcSuXURlmDuOC50tEy22RP0C60QMqu5xK6c8=;
 b=B/adhIZMfvP03W8bzEjK9mNWiejBAP3kYx2qcaA6HiOvwix55yKJEP4HTSvjek8RBO
 S1on5JjtG7k3aQkaEn2gEW2G5A2fSX+iF9DMZFPjA1mhXThiHT5BVyNqL1VAA+sefbf/
 MgZ/xt05gn90JE1NumOGCyo5i1ThhXQWqXW8uEuvgvEhkzxiTyRuZGeeQRfxEE94RgRU
 w6bWM3KfQBuPfdCy26HWkXtagaXW/A7slO760zSnWIYSZLj/RSRaB9WkvvCzcNPNFWST
 eT7nWdPg/rDqY0lqFByhyjeMiqunqatclfDsz9mSqE5Lii5dMvILG5xjOJErpgRa0Z5P
 Ucjg==
X-Gm-Message-State: AOAM532jHYPr3936jHahtXndxIQHaufPALiGiPGnIcQHXx2Hfh6IjYO/
 v/hQPRF7bLT50IbpYu0aQZForLNv3aIUtByrxzKpwm6ctJGJSEAsGkR8ch6C0rp0vSLa+2335Fc
 9VSqe64mTEYly8nUUadlkbTiQuX8Bkmkd4pHEdx1w3pBNJu/mkpLeN/WjPPJMhPed
X-Received: by 2002:a5d:6211:: with SMTP id y17mr6440735wru.97.1639839079067; 
 Sat, 18 Dec 2021 06:51:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuzqQ3MZZhZfqDwy2doqVexd/8MwBZq24K2nHz43rjeHmozHa2G953/fGs7lvvN8oA2T/LLA==
X-Received: by 2002:a5d:6211:: with SMTP id y17mr6440706wru.97.1639839078714; 
 Sat, 18 Dec 2021 06:51:18 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id s189sm11843684wme.0.2021.12.18.06.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 06:51:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] dma: Let st*_dma() take MemTxAttrs argument
Date: Sat, 18 Dec 2021 15:51:08 +0100
Message-Id: <20211218145111.1540114-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218145111.1540114-1-philmd@redhat.com>
References: <20211218145111.1540114-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling st*_dma().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h       |  3 ++-
 include/hw/ppc/spapr_vio.h | 12 ++++++++----
 include/sysemu/dma.h       | 10 ++++++----
 hw/nvram/fw_cfg.c          |  4 ++--
 4 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index a751ab5a75d..d07e9707b48 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -859,7 +859,8 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
     static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
                                         dma_addr_t addr, uint##_bits##_t val) \
     {                                                                   \
-        st##_s##_dma(pci_get_address_space(dev), addr, val);            \
+        st##_s##_dma(pci_get_address_space(dev), addr, val, \
+                     MEMTXATTRS_UNSPECIFIED); \
     }
 
 PCI_DMA_DEFINE_LDST(ub, b, 8);
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index 5d2ea8e6656..e87f8e6f596 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -118,10 +118,14 @@ static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
         H_DEST_PARM : H_SUCCESS;
 }
 
-#define vio_stb(_dev, _addr, _val) (stb_dma(&(_dev)->as, (_addr), (_val)))
-#define vio_sth(_dev, _addr, _val) (stw_be_dma(&(_dev)->as, (_addr), (_val)))
-#define vio_stl(_dev, _addr, _val) (stl_be_dma(&(_dev)->as, (_addr), (_val)))
-#define vio_stq(_dev, _addr, _val) (stq_be_dma(&(_dev)->as, (_addr), (_val)))
+#define vio_stb(_dev, _addr, _val) \
+        (stb_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
+#define vio_sth(_dev, _addr, _val) \
+        (stw_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
+#define vio_stl(_dev, _addr, _val) \
+        (stl_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
+#define vio_stq(_dev, _addr, _val) \
+        (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
 #define vio_ldq(_dev, _addr) (ldq_be_dma(&(_dev)->as, (_addr)))
 
 int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 9f998edbea4..2a60d2c5d61 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -250,10 +250,11 @@ static inline void dma_memory_unmap(AddressSpace *as,
     }                                                                   \
     static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
                                                  dma_addr_t addr,       \
-                                                 uint##_bits##_t val)   \
+                                                 uint##_bits##_t val,   \
+                                                 MemTxAttrs attrs)      \
     {                                                                   \
         val = cpu_to_##_end##_bits(val);                                \
-        dma_memory_write(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSPECIFIED); \
+        dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
     }
 
 static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
@@ -264,9 +265,10 @@ static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
     return val;
 }
 
-static inline void stb_dma(AddressSpace *as, dma_addr_t addr, uint8_t val)
+static inline void stb_dma(AddressSpace *as, dma_addr_t addr,
+                           uint8_t val, MemTxAttrs attrs)
 {
-    dma_memory_write(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
+    dma_memory_write(as, addr, &val, 1, attrs);
 }
 
 DEFINE_LDST_DMA(uw, w, 16, le);
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 9b91b15cb08..e5f3c981841 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -360,7 +360,7 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
     if (dma_memory_read(s->dma_as, dma_addr,
                         &dma, sizeof(dma), MEMTXATTRS_UNSPECIFIED)) {
         stl_be_dma(s->dma_as, dma_addr + offsetof(FWCfgDmaAccess, control),
-                   FW_CFG_DMA_CTL_ERROR);
+                   FW_CFG_DMA_CTL_ERROR, MEMTXATTRS_UNSPECIFIED);
         return;
     }
 
@@ -446,7 +446,7 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
     }
 
     stl_be_dma(s->dma_as, dma_addr + offsetof(FWCfgDmaAccess, control),
-                dma.control);
+                dma.control, MEMTXATTRS_UNSPECIFIED);
 
     trace_fw_cfg_read(s, 0);
 }
-- 
2.33.1


