Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2342B5292F7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:37:51 +0200 (CEST)
Received: from localhost ([::1]:57372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiPV-0008VZ-Ri
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhx-0006nz-Fh
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhv-0006YM-I6
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S2qvH2iwGRbR0l3WdxvqsX8jcbdTaa6VQl5+Rxg2li4=;
 b=A4UB+hLbHaC098xVUtZH/Z8PSGcif5gxRabtohL32JmCd056P3Xms0fbS/J4ML8XlHi3gD
 qv+HVNu9hL+fv08rImrMWaKU6gjpGxPIgfoYfg0bgGzVIMqi0sf5tWYevNDhEdrE74er3Q
 0I/m+j9jtTSq+K18Rfo9xZHEhuZ4t4I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-PQD62AAcNM2r0vR3EcK_aQ-1; Mon, 16 May 2022 16:52:38 -0400
X-MC-Unique: PQD62AAcNM2r0vR3EcK_aQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 qa15-20020a170907868f00b006f4c89bf2e3so6301252ejc.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S2qvH2iwGRbR0l3WdxvqsX8jcbdTaa6VQl5+Rxg2li4=;
 b=zvoq9PJTk24WKOAxW7RLyCf5pAf6/3LD02GPP2Mtzn45UmCAMedM/bl7UXYUPAuH1o
 jLpM5Tp+VijSZTcW32qPlqIh7+gcNbOQ9d8kyC3RA3lvZXYJuZhFyELhvISQryLRJn3a
 3LdQHWQPZ9uNfn1JBFYbjL5SBxi4ehYj5im4tLkIX6pn8ZVOigEJNmVtgEeFKjQQAwfF
 rNYGTORGTspqGL248g4b5GaeTHQhjrT6C9bnnnTQjptWXhMkkBeXnhwYfiutp0Hn4N5v
 znm35ng9nar6NnTBCQKxMfajUk1MZUBLj4F2otDUKzyW2PSQJSex3BohPRBNioKNBwM7
 Zxhw==
X-Gm-Message-State: AOAM532I9uveCEqNH03avws7CDt+3GYRMXw84bERPRbq4tcaTOaZ34IC
 D0VBhQTwdVPd5oAe7NItTIOOTsQuYhqq4UavNEZgC4G2FLQLIIsmuNUjqsURPE2wpaeFcS1CyvZ
 f4qTFZoGrz0QhuouriFnjd2wudLWXaMXb2FlqUTo2Y1jh2C5+I18uY0PT00yM
X-Received: by 2002:a17:907:6d1b:b0:6f5:30c9:7c84 with SMTP id
 sa27-20020a1709076d1b00b006f530c97c84mr16675281ejc.107.1652734357032; 
 Mon, 16 May 2022 13:52:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6paBHYTXAq755vJX5DoK4phoz1DR0hnH8Rh2s2nHFPfjCSGH/Ak9IuNp+Ez84q57xQApCyw==
X-Received: by 2002:a17:907:6d1b:b0:6f5:30c9:7c84 with SMTP id
 sa27-20020a1709076d1b00b006f530c97c84mr16675254ejc.107.1652734356725; 
 Mon, 16 May 2022 13:52:36 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 g25-20020a056402115900b0042aaacd4edasm3019485edw.26.2022.05.16.13.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:52:36 -0700 (PDT)
Date: Mon, 16 May 2022 16:52:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL v2 35/86] cxl/cxl-host: Add memops for CFMWS region.
Message-ID: <20220516204913.542894-36-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

These memops perform interleave decoding, walking down the
CXL topology from CFMWS described host interleave
decoder via CXL host bridge HDM decoders, through the CXL
root ports and finally call CXL type 3 specific read and write
functions.

Note that, whilst functional the current implementation does
not support:
* switches
* multiple HDM decoders at a given level.
* unaligned accesses across the interleave boundaries

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Message-Id: <20220429144110.25167-34-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl.h    |   2 +
 hw/cxl/cxl-host-stubs.c |   2 +
 hw/cxl/cxl-host.c       | 128 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+)

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index dce38124db..21d28ca110 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -56,4 +56,6 @@ void cxl_fixed_memory_window_config(MachineState *ms,
                                     Error **errp);
 void cxl_fixed_memory_window_link_targets(Error **errp);
 
+extern const MemoryRegionOps cfmws_ops;
+
 #endif
diff --git a/hw/cxl/cxl-host-stubs.c b/hw/cxl/cxl-host-stubs.c
index f8fd278d5d..24465a52ab 100644
--- a/hw/cxl/cxl-host-stubs.c
+++ b/hw/cxl/cxl-host-stubs.c
@@ -12,3 +12,5 @@ void cxl_fixed_memory_window_config(MachineState *ms,
                                     Error **errp) {};
 
 void cxl_fixed_memory_window_link_targets(Error **errp) {};
+
+const MemoryRegionOps cfmws_ops;
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index ec5a75cbf5..469b3c4ced 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -15,6 +15,10 @@
 
 #include "qapi/qapi-visit-machine.h"
 #include "hw/cxl/cxl.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/pci/pci_host.h"
+#include "hw/pci/pcie_port.h"
 
 void cxl_fixed_memory_window_config(MachineState *ms,
                                     CXLFixedMemoryWindowOptions *object,
@@ -92,3 +96,127 @@ void cxl_fixed_memory_window_link_targets(Error **errp)
         }
     }
 }
+
+/* TODO: support, multiple hdm decoders */
+static bool cxl_hdm_find_target(uint32_t *cache_mem, hwaddr addr,
+                                uint8_t *target)
+{
+    uint32_t ctrl;
+    uint32_t ig_enc;
+    uint32_t iw_enc;
+    uint32_t target_reg;
+    uint32_t target_idx;
+
+    ctrl = cache_mem[R_CXL_HDM_DECODER0_CTRL];
+    if (!FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED)) {
+        return false;
+    }
+
+    ig_enc = FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IG);
+    iw_enc = FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IW);
+    target_idx = (addr / cxl_decode_ig(ig_enc)) % (1 << iw_enc);
+
+    if (target_idx > 4) {
+        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];
+        target_reg >>= target_idx * 8;
+    } else {
+        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];
+        target_reg >>= (target_idx - 4) * 8;
+    }
+    *target = target_reg & 0xff;
+
+    return true;
+}
+
+static PCIDevice *cxl_cfmws_find_device(CXLFixedWindow *fw, hwaddr addr)
+{
+    CXLComponentState *hb_cstate;
+    PCIHostState *hb;
+    int rb_index;
+    uint32_t *cache_mem;
+    uint8_t target;
+    bool target_found;
+    PCIDevice *rp, *d;
+
+    /* Address is relative to memory region. Convert to HPA */
+    addr += fw->base;
+
+    rb_index = (addr / cxl_decode_ig(fw->enc_int_gran)) % fw->num_targets;
+    hb = PCI_HOST_BRIDGE(fw->target_hbs[rb_index]->cxl.cxl_host_bridge);
+    if (!hb || !hb->bus || !pci_bus_is_cxl(hb->bus)) {
+        return NULL;
+    }
+
+    hb_cstate = cxl_get_hb_cstate(hb);
+    if (!hb_cstate) {
+        return NULL;
+    }
+
+    cache_mem = hb_cstate->crb.cache_mem_registers;
+
+    target_found = cxl_hdm_find_target(cache_mem, addr, &target);
+    if (!target_found) {
+        return NULL;
+    }
+
+    rp = pcie_find_port_by_pn(hb->bus, target);
+    if (!rp) {
+        return NULL;
+    }
+
+    d = pci_bridge_get_sec_bus(PCI_BRIDGE(rp))->devices[0];
+
+    if (!d || !object_dynamic_cast(OBJECT(d), TYPE_CXL_TYPE3)) {
+        return NULL;
+    }
+
+    return d;
+}
+
+static MemTxResult cxl_read_cfmws(void *opaque, hwaddr addr, uint64_t *data,
+                                  unsigned size, MemTxAttrs attrs)
+{
+    CXLFixedWindow *fw = opaque;
+    PCIDevice *d;
+
+    d = cxl_cfmws_find_device(fw, addr);
+    if (d == NULL) {
+        *data = 0;
+        /* Reads to invalid address return poison */
+        return MEMTX_ERROR;
+    }
+
+    return cxl_type3_read(d, addr + fw->base, data, size, attrs);
+}
+
+static MemTxResult cxl_write_cfmws(void *opaque, hwaddr addr,
+                                   uint64_t data, unsigned size,
+                                   MemTxAttrs attrs)
+{
+    CXLFixedWindow *fw = opaque;
+    PCIDevice *d;
+
+    d = cxl_cfmws_find_device(fw, addr);
+    if (d == NULL) {
+        /* Writes to invalid address are silent */
+        return MEMTX_OK;
+    }
+
+    return cxl_type3_write(d, addr + fw->base, data, size, attrs);
+}
+
+const MemoryRegionOps cfmws_ops = {
+    .read_with_attrs = cxl_read_cfmws,
+    .write_with_attrs = cxl_write_cfmws,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = true,
+    },
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = true,
+    },
+};
-- 
MST


