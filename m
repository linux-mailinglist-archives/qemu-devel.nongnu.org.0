Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3C0482126
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:05:55 +0100 (CET)
Received: from localhost ([::1]:42830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36Mk-0007gl-M7
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:05:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36EC-0002We-Vq
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36EB-0003bx-6n
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UcHZiN5CaxHZgNjiZBrsrm3Tzs52Oa+NswcKSWWvrHc=;
 b=LXGSf41b7ijKEBYM/qYzbynabw/2xLJXBWDbQ9Zfq6oZhNfb/56PiTcKaz1T+YPKj3lLSJ
 pr8Krt+dEdbVLwy3zP0N4Uh9KZtQ823r7cyVhPC9hPs3ck3eazmX4KsjM9/e0+/smCN9qI
 DM0VFjZ8HzJdPbc+73PbDDJH6k2xoC4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-2HUu5ti1OweWARqT9djUrQ-1; Thu, 30 Dec 2021 19:57:00 -0500
X-MC-Unique: 2HUu5ti1OweWARqT9djUrQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 t1-20020a056402524100b003f8500f6e35so18072676edd.8
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UcHZiN5CaxHZgNjiZBrsrm3Tzs52Oa+NswcKSWWvrHc=;
 b=mp9StZ8A43X3RJNR8+H6Hq4ett9TqSnjYPiC5Q4xLSbozPqjgpXc7rlRuWn1eTDp+V
 XJgcph2E70+72r9dznp/tJQDYqMk0E57p6WkaDaoYWG/38+V1Kf3CfL7AA74H5cykWay
 IsU20ka3BMY955V9c0x8XV7ZMyuz9j7YwE7MfamDZr3hW7ehArEWYVUrp5bw53pXx407
 bzxlEXbVZEpPTn55IioRM+bD9inmYAB521T8Kkeji7LdHTPOI05vgMGy8n2xATwVETP3
 vzPiz3KJJbz1kMhiX4NMtopYhxl7YZCd+HzwtnSZEzhuQCsvM97d5Iffl0LRXEdEnIzl
 mqIA==
X-Gm-Message-State: AOAM533BHs7SamkuRR2uHUNfiJ/93ykU6X303F9hZSsYSM2y5A6Jywi/
 peYPLCoyf5SsNdvwjg+4mZnhipgWZSiv3O5dpH9f+rQICFTroAHyRNcMXS98TxZQPTTfzorUWLU
 59piLllJH0/nL2AglQoyHbpehv2Dox7v4Vvhv5pyCiizHlJWbh+1wkvjt/jcAh050
X-Received: by 2002:aa7:c658:: with SMTP id z24mr32464662edr.187.1640912219112; 
 Thu, 30 Dec 2021 16:56:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6iDktP8J83LSY8lWHItrwO+Rkz+MZdYf//4JrfZCsaYE9QpY7M7BGUlj9MY6mcfVo7ZdNJg==
X-Received: by 2002:aa7:c658:: with SMTP id z24mr32464649edr.187.1640912218940; 
 Thu, 30 Dec 2021 16:56:58 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id k19sm7977501ejv.38.2021.12.30.16.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:56:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/22] dma: Let st*_dma() take MemTxAttrs argument
Date: Fri, 31 Dec 2021 01:55:39 +0100
Message-Id: <20211231005546.723396-16-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231005546.723396-1-philmd@redhat.com>
References: <20211231005546.723396-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling st*_dma().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-16-philmd@redhat.com>
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
index fd8f16003dd..009dd3ca960 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -249,10 +249,11 @@ static inline void dma_memory_unmap(AddressSpace *as,
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
@@ -263,9 +264,10 @@ static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
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


