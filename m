Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FEE529285
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:17:03 +0200 (CEST)
Received: from localhost ([::1]:58560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqi5O-0003rT-SL
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhl-0006Qq-PX
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhj-0006X6-Ut
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pmVq+W5XP/ZNjQ6Qj57CQFFTS9MrHI10KyMuHzrabf8=;
 b=czYuxW9rnUiuko6FlNVfhnCGokEkTrVBPohi6jnb92eGV3PFlswg5Ba+S5xdp44FFwNB+C
 A34q+99eLJkpSCn5rVu9FzDHMddZo3T4pZNAbsapk2KXl+c+EMp0XERoq09uuakRkonUIN
 mvlJJ3K2XUedzy0ub13ac9/uIZMdbsM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-pJnGtqf_MOqwUG28IXrFfA-1; Mon, 16 May 2022 16:52:34 -0400
X-MC-Unique: pJnGtqf_MOqwUG28IXrFfA-1
Received: by mail-ed1-f70.google.com with SMTP id
 s9-20020aa7d789000000b0042ab9d77febso1709698edq.16
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pmVq+W5XP/ZNjQ6Qj57CQFFTS9MrHI10KyMuHzrabf8=;
 b=BLmYfdD9gv8Tanjb/MrwUVdyvh8+IpPWRJqP1dm/ogk1IXmIfZCzz8uWRKU1NvkuJk
 bcFsjksMkrL+A8udGpcy+JV01YG/SzcwlwPLS+z8kNQciINcxGaS1wokMIKpOuuClwLn
 2U7rSRnoCtnFNpzQ1xNsIShEuy/dP4jp0dAkV1QvTFOOyj7RilIGXbjuqL4f0I4j5r4u
 Lrr5oNKCdbdAWucCTjz67gv0MntjatPHGar80tGO1597O6YioAiLOBqjGeinYVWeL9tB
 W80nVrgjhf26Y9SdyTChbejrjhmWFcYVHRyCCjkhacYnqhbmcrpSqUBieRcuZTsmwAWS
 9L3Q==
X-Gm-Message-State: AOAM532egaGd2la8qagIsI21PigGtc0JHMfXW1QHPFZo+g+IArdyqpXX
 0uHJKXlaR0LzATED1XqV29RvSQqfJ8BAbKCXIErw69m0gLL+ns9wgtvLE4YX4+VZgSphNGTI1jw
 6ZuE/uFeG/AifXcviyiN9DuYfPXD2+Fi1MsDbE0VBy8YkbTbGYTHy9M2Xclqf
X-Received: by 2002:a05:6402:2948:b0:42a:ae0c:2f26 with SMTP id
 ed8-20020a056402294800b0042aae0c2f26mr8516879edb.425.1652734352895; 
 Mon, 16 May 2022 13:52:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKxWvte+hJaS9wa0jeqMKog//T+oSDiqlqNS2iYMfist4RmBarWZtHJN2sKBcmhu2gYRJdtg==
X-Received: by 2002:a05:6402:2948:b0:42a:ae0c:2f26 with SMTP id
 ed8-20020a056402294800b0042aae0c2f26mr8516851edb.425.1652734352646; 
 Mon, 16 May 2022 13:52:32 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 r14-20020aa7cb8e000000b0042a9d52d811sm3870073edt.75.2022.05.16.13.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:52:32 -0700 (PDT)
Date: Mon, 16 May 2022 16:52:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL v2 34/86] mem/cxl_type3: Add read and write functions for
 associated hostmem.
Message-ID: <20220516204913.542894-35-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Once a read or write reaches a CXL type 3 device, the HDM decoders
on the device are used to establish the Device Physical Address
which should be accessed.  These functions peform the required maths
and then use a device specific address space to access the
hostmem->mr to fullfil the actual operation.  Note that failed writes
are silent, but failed reads return poison.  Note this is based
loosely on:

https://lore.kernel.org/qemu-devel/20200817161853.593247-6-f4bug@amsat.org/
[RFC PATCH 0/9] hw/misc: Add support for interleaved memory accesses

Only lightly tested so far.  More complex test cases yet to be written.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220429144110.25167-33-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_device.h |  6 +++
 hw/mem/cxl_type3.c          | 91 +++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 4285fbda08..1e141b6621 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -239,6 +239,7 @@ struct CXLType3Dev {
     HostMemoryBackend *lsa;
 
     /* State */
+    AddressSpace hostmem_as;
     CXLComponentState cxl_cstate;
     CXLDeviceState cxl_dstate;
 };
@@ -259,4 +260,9 @@ struct CXLType3Class {
                     uint64_t offset);
 };
 
+MemTxResult cxl_type3_read(PCIDevice *d, hwaddr host_addr, uint64_t *data,
+                           unsigned size, MemTxAttrs attrs);
+MemTxResult cxl_type3_write(PCIDevice *d, hwaddr host_addr, uint64_t data,
+                            unsigned size, MemTxAttrs attrs);
+
 #endif
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 6c6ed9a776..3bf2869573 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -97,7 +97,9 @@ static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
 
 static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
 {
+    DeviceState *ds = DEVICE(ct3d);
     MemoryRegion *mr;
+    char *name;
 
     if (!ct3d->hostmem) {
         error_setg(errp, "memdev property must be set");
@@ -112,6 +114,15 @@ static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
     memory_region_set_nonvolatile(mr, true);
     memory_region_set_enabled(mr, true);
     host_memory_backend_set_mapped(ct3d->hostmem, true);
+
+    if (ds->id) {
+        name = g_strdup_printf("cxl-type3-dpa-space:%s", ds->id);
+    } else {
+        name = g_strdup("cxl-type3-dpa-space");
+    }
+    address_space_init(&ct3d->hostmem_as, mr, name);
+    g_free(name);
+
     ct3d->cxl_dstate.pmem_size = ct3d->hostmem->size;
 
     if (!ct3d->lsa) {
@@ -167,6 +178,86 @@ static void ct3_exit(PCIDevice *pci_dev)
     ComponentRegisters *regs = &cxl_cstate->crb;
 
     g_free(regs->special_ops);
+    address_space_destroy(&ct3d->hostmem_as);
+}
+
+/* TODO: Support multiple HDM decoders and DPA skip */
+static bool cxl_type3_dpa(CXLType3Dev *ct3d, hwaddr host_addr, uint64_t *dpa)
+{
+    uint32_t *cache_mem = ct3d->cxl_cstate.crb.cache_mem_registers;
+    uint64_t decoder_base, decoder_size, hpa_offset;
+    uint32_t hdm0_ctrl;
+    int ig, iw;
+
+    decoder_base = (((uint64_t)cache_mem[R_CXL_HDM_DECODER0_BASE_HI] << 32) |
+                    cache_mem[R_CXL_HDM_DECODER0_BASE_LO]);
+    if ((uint64_t)host_addr < decoder_base) {
+        return false;
+    }
+
+    hpa_offset = (uint64_t)host_addr - decoder_base;
+
+    decoder_size = ((uint64_t)cache_mem[R_CXL_HDM_DECODER0_SIZE_HI] << 32) |
+        cache_mem[R_CXL_HDM_DECODER0_SIZE_LO];
+    if (hpa_offset >= decoder_size) {
+        return false;
+    }
+
+    hdm0_ctrl = cache_mem[R_CXL_HDM_DECODER0_CTRL];
+    iw = FIELD_EX32(hdm0_ctrl, CXL_HDM_DECODER0_CTRL, IW);
+    ig = FIELD_EX32(hdm0_ctrl, CXL_HDM_DECODER0_CTRL, IG);
+
+    *dpa = (MAKE_64BIT_MASK(0, 8 + ig) & hpa_offset) |
+        ((MAKE_64BIT_MASK(8 + ig + iw, 64 - 8 - ig - iw) & hpa_offset) >> iw);
+
+    return true;
+}
+
+MemTxResult cxl_type3_read(PCIDevice *d, hwaddr host_addr, uint64_t *data,
+                           unsigned size, MemTxAttrs attrs)
+{
+    CXLType3Dev *ct3d = CXL_TYPE3(d);
+    uint64_t dpa_offset;
+    MemoryRegion *mr;
+
+    /* TODO support volatile region */
+    mr = host_memory_backend_get_memory(ct3d->hostmem);
+    if (!mr) {
+        return MEMTX_ERROR;
+    }
+
+    if (!cxl_type3_dpa(ct3d, host_addr, &dpa_offset)) {
+        return MEMTX_ERROR;
+    }
+
+    if (dpa_offset > int128_get64(mr->size)) {
+        return MEMTX_ERROR;
+    }
+
+    return address_space_read(&ct3d->hostmem_as, dpa_offset, attrs, data, size);
+}
+
+MemTxResult cxl_type3_write(PCIDevice *d, hwaddr host_addr, uint64_t data,
+                            unsigned size, MemTxAttrs attrs)
+{
+    CXLType3Dev *ct3d = CXL_TYPE3(d);
+    uint64_t dpa_offset;
+    MemoryRegion *mr;
+
+    mr = host_memory_backend_get_memory(ct3d->hostmem);
+    if (!mr) {
+        return MEMTX_OK;
+    }
+
+    if (!cxl_type3_dpa(ct3d, host_addr, &dpa_offset)) {
+        return MEMTX_OK;
+    }
+
+    if (dpa_offset > int128_get64(mr->size)) {
+        return MEMTX_OK;
+    }
+    return address_space_write(&ct3d->hostmem_as, dpa_offset, attrs,
+                               &data, size);
 }
 
 static void ct3d_reset(DeviceState *dev)
-- 
MST


