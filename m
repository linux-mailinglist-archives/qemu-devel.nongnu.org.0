Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA895282D3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:07:26 +0200 (CEST)
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYZR-0005D9-9r
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5s-0006XM-7D
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5q-0005K3-Dr
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1se6nj6A5g2mHHtyEvXra4lCuIm3npIDYA6T8K1TMmM=;
 b=QgjRrxQqopzJ0Rq+Ec1XAVpGTb3Lfh31soC4Od92jd0gePwzthtZ5orY3sUJZmk0KH9jK+
 4DdhUU9ue0D7R0/NDQMSHQFsB1SbqKuqoQ8KkWf3OiF9F2YbGCGjuN0pas2ZpqOBjsJqFW
 NkaJ4iLl4cHBOM9DK6JRwG6dWRK66K4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-6KzZufoZMRmVw1MY8eupAQ-1; Mon, 16 May 2022 06:36:49 -0400
X-MC-Unique: 6KzZufoZMRmVw1MY8eupAQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so10150161wmq.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1se6nj6A5g2mHHtyEvXra4lCuIm3npIDYA6T8K1TMmM=;
 b=dbaQIL75xuWfoeyxtQ/VM00rKA5nhNE2GveS9/tvFQbijibb6DNZM5bmAmXDYXsPTF
 nRwUnMGc9FFaudD9t9QxAIGLkC3ZefS+yhiYfwhvOcfXWsyGlzc4BPPC/uaacrKqxNDI
 rDc0Ip8u69sGFfHofelzq1X0ljWQIWfvFqW4TPx6ndADQmDFhbg2jBCvWcGrGiUdsmWU
 ap5AfmaqXfRIRCF/a0SlK+nbOHvCFzBSF2HxEx/TC8VfQI6q4PffTweONjhRfV4zpf+p
 0XTFqSYu229Ucc8pT4I1rv41w7YnwtfdsvsizW/hTrp2GIuDl701apVhfwJ6QApQ1u78
 L++g==
X-Gm-Message-State: AOAM532md3Fp7cHCQo6XCFvl4S0e7EHdt7salp0n0jw47ljCYf6WEn97
 7lwNkuaKcKXYTisz4P1QoCP+x+2MS5FwuNvtFxYrZrPW2Va03ouRTE04bO/ZDEzmDqXooyp+ihB
 lXgv4n5IP692DI8/QfuMUEX5J1lV8GT+bGFbmM/25w2MM75TQsdQy2z5XlLaG
X-Received: by 2002:a05:600c:4e13:b0:394:797e:3358 with SMTP id
 b19-20020a05600c4e1300b00394797e3358mr26407231wmq.30.1652697407512; 
 Mon, 16 May 2022 03:36:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc05CKyzemlBDdNcM9UKK34kliZIMTZol/6d1BZufbYoelxWbZgTs6eMXtQRROyvXhQ0DbDg==
X-Received: by 2002:a05:600c:4e13:b0:394:797e:3358 with SMTP id
 b19-20020a05600c4e1300b00394797e3358mr26407201wmq.30.1652697407146; 
 Mon, 16 May 2022 03:36:47 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 r15-20020a7bc08f000000b00394615cf468sm12857655wmh.28.2022.05.16.03.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:36:46 -0700 (PDT)
Date: Mon, 16 May 2022 06:36:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 20/91] hw/cxl/device: Implement MMIO HDM decoding (8.2.5.12)
Message-ID: <20220516095448.507876-21-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
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

From: Ben Widawsky <ben.widawsky@intel.com>

A device's volatile and persistent memory are known Host Defined Memory
(HDM) regions. The mechanism by which the device is programmed to claim
the addresses associated with those regions is through dedicated logic
known as the HDM decoder. In order to allow the OS to properly program
the HDMs, the HDM decoders must be modeled.

There are two ways the HDM decoders can be implemented, the legacy
mechanism is through the PCIe DVSEC programming from CXL 1.1 (8.1.3.8),
and MMIO is found in 8.2.5.12 of the spec. For now, 8.1.3.8 is not
implemented.

Much of CXL device logic is implemented in cxl-utils. The HDM decoder
however is implemented directly by the device implementation.
Whilst the implementation currently does no validity checks on the
encoder set up, future work will add sanity checking specific to
the type of cxl component.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-19-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/mem/cxl_type3.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 290c088dd6..318b6f9fbc 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -52,6 +52,48 @@ static void build_dvsecs(CXLType3Dev *ct3d)
                                GPF_DEVICE_DVSEC_REVID, dvsec);
 }
 
+static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
+{
+    ComponentRegisters *cregs = &ct3d->cxl_cstate.crb;
+    uint32_t *cache_mem = cregs->cache_mem_registers;
+
+    assert(which == 0);
+
+    /* TODO: Sanity checks that the decoder is possible */
+    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
+    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERR, 0);
+
+    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
+}
+
+static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
+                           unsigned size)
+{
+    CXLComponentState *cxl_cstate = opaque;
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+    CXLType3Dev *ct3d = container_of(cxl_cstate, CXLType3Dev, cxl_cstate);
+    uint32_t *cache_mem = cregs->cache_mem_registers;
+    bool should_commit = false;
+    int which_hdm = -1;
+
+    assert(size == 4);
+    g_assert(offset < CXL2_COMPONENT_CM_REGION_SIZE);
+
+    switch (offset) {
+    case A_CXL_HDM_DECODER0_CTRL:
+        should_commit = FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMIT);
+        which_hdm = 0;
+        break;
+    default:
+        break;
+    }
+
+    stl_le_p((uint8_t *)cache_mem + offset, value);
+    if (should_commit) {
+        hdm_decoder_commit(ct3d, which_hdm);
+    }
+}
+
 static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
 {
     MemoryRegion *mr;
@@ -95,6 +137,9 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     ct3d->cxl_cstate.pdev = pci_dev;
     build_dvsecs(ct3d);
 
+    regs->special_ops = g_new0(MemoryRegionOps, 1);
+    regs->special_ops->write = ct3d_reg_write;
+
     cxl_component_register_block_init(OBJECT(pci_dev), cxl_cstate,
                                       TYPE_CXL_TYPE3);
 
@@ -109,6 +154,15 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
                      &ct3d->cxl_dstate.device_registers);
 }
 
+static void ct3_exit(PCIDevice *pci_dev)
+{
+    CXLType3Dev *ct3d = CXL_TYPE3(pci_dev);
+    CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
+    ComponentRegisters *regs = &cxl_cstate->crb;
+
+    g_free(regs->special_ops);
+}
+
 static void ct3d_reset(DeviceState *dev)
 {
     CXLType3Dev *ct3d = CXL_TYPE3(dev);
@@ -131,6 +185,7 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
 
     pc->realize = ct3_realize;
+    pc->exit = ct3_exit;
     pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
     pc->vendor_id = PCI_VENDOR_ID_INTEL;
     pc->device_id = 0xd93; /* LVF for now */
-- 
MST


