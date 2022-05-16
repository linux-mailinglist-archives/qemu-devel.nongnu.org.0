Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04AB5282D5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:07:39 +0200 (CEST)
Received: from localhost ([::1]:55988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYZf-0005g8-0B
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY63-0006iz-N3
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY61-0005M5-Qs
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UNe5uopN67ZdMx3i5rYffyddLe1HzU67fzpwD84BnYc=;
 b=FkY8QK6gmkO6sT4ihlwXBVR6FaEGHFaBUzW0ZTXarJcgv/cezWy6qmSpg4nKGase9yan9/
 aUrjlrwzOoc1Go28tsrs1iC+hZXlvBnf/kRgwOmaTz4UCa4svd1xfZd3YIOPrLNQLkCja5
 WlBFPpnVNknfH9rdn3q85LhaUKv/olc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-HTjtZY5sNo612-JcSc4kiQ-1; Mon, 16 May 2022 06:37:00 -0400
X-MC-Unique: HTjtZY5sNo612-JcSc4kiQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 t184-20020a1c46c1000000b00394209f54f1so6560381wma.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UNe5uopN67ZdMx3i5rYffyddLe1HzU67fzpwD84BnYc=;
 b=GzdCa6Jqn6iKpz9ZxyEI9hp+UmTsRRksNaVsQXZYXPGqVqQ1E5079KHPdXPfdkMVnz
 ua6xR4dGVOGyd9WMawWuV189RRliVjnxMl17Vv+Hd9O1RiUxNkE4fPElJwOfQNko5+i3
 rLtsd7dUosjoXA1v4t79LpEunfLlwLV4dSHDhGaN8p+bOPf7W8aXELhgU8g6xyqNCna9
 D0fM8uj46MbFcOsV2xoMd3A5r05mNncb3qxL+tqg676TWcn78aHPYgkC3BQ15HR33QEQ
 vRbNOCej92Q3xzjFh+uA6+maQZrdbYIZn9VR+001JEOxgorT4c4pb1XyRPxfsTm6HJ5Q
 9wVA==
X-Gm-Message-State: AOAM530dFKpr303JdESOomAhVrKgT+G+3GsSOAoHW1lJmHVLDaNY1h5I
 WJl0pNnb5vgl+LKQb3v4+W3mKSYtCBa/njZpvWEacypF+gY/gr2BBT7UZFeWm2gr5MQN0nCycXE
 zT6GHJAahwGQQRwnJh+qh/Yabpt9V/voBEl823SOvZj90xdH8C9zYtHfDUegF
X-Received: by 2002:a05:600c:1e0f:b0:394:7759:64f3 with SMTP id
 ay15-20020a05600c1e0f00b00394775964f3mr26462843wmb.19.1652697418675; 
 Mon, 16 May 2022 03:36:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUBK8u2IDGFUkmf1kDCyru05f63h//PeLjBqh0oi0suT3u+t2UB6NcK/u2sFtTMSBW853mAw==
X-Received: by 2002:a05:600c:1e0f:b0:394:7759:64f3 with SMTP id
 ay15-20020a05600c1e0f00b00394775964f3mr26462818wmb.19.1652697418354; 
 Mon, 16 May 2022 03:36:58 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 j15-20020adfb30f000000b0020d042efd11sm4502163wrd.61.2022.05.16.03.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:36:57 -0700 (PDT)
Date: Mon, 16 May 2022 06:36:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 23/91] hw/cxl/device: Implement get/set Label Storage Area (LSA)
Message-ID: <20220516095448.507876-24-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
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

From: Ben Widawsky <ben.widawsky@intel.com>

Implement get and set handlers for the Label Storage Area
used to hold data describing persistent memory configuration
so that it can be ensured it is seen in the same configuration
after reboot.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220429144110.25167-22-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_device.h |  5 ++++
 hw/cxl/cxl-mailbox-utils.c  | 60 +++++++++++++++++++++++++++++++++++++
 hw/mem/cxl_type3.c          | 56 +++++++++++++++++++++++++++++++++-
 3 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index ea2571a69b..4285fbda08 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -252,6 +252,11 @@ struct CXLType3Class {
 
     /* public */
     uint64_t (*get_lsa_size)(CXLType3Dev *ct3d);
+
+    uint64_t (*get_lsa)(CXLType3Dev *ct3d, void *buf, uint64_t size,
+                        uint64_t offset);
+    void (*set_lsa)(CXLType3Dev *ct3d, const void *buf, uint64_t size,
+                    uint64_t offset);
 };
 
 #endif
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 492739aef3..bb66c765a5 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -57,6 +57,8 @@ enum {
         #define MEMORY_DEVICE 0x0
     CCLS        = 0x41,
         #define GET_PARTITION_INFO     0x0
+        #define GET_LSA       0x2
+        #define SET_LSA       0x3
 };
 
 /* 8.2.8.4.5.1 Command Return Codes */
@@ -326,7 +328,62 @@ static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
+static ret_code cmd_ccls_get_lsa(struct cxl_cmd *cmd,
+                                 CXLDeviceState *cxl_dstate,
+                                 uint16_t *len)
+{
+    struct {
+        uint32_t offset;
+        uint32_t length;
+    } QEMU_PACKED *get_lsa;
+    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
+    CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
+    uint32_t offset, length;
+
+    get_lsa = (void *)cmd->payload;
+    offset = get_lsa->offset;
+    length = get_lsa->length;
+
+    if (offset + length > cvc->get_lsa_size(ct3d)) {
+        *len = 0;
+        return CXL_MBOX_INVALID_INPUT;
+    }
+
+    *len = cvc->get_lsa(ct3d, get_lsa, length, offset);
+    return CXL_MBOX_SUCCESS;
+}
+
+static ret_code cmd_ccls_set_lsa(struct cxl_cmd *cmd,
+                                 CXLDeviceState *cxl_dstate,
+                                 uint16_t *len)
+{
+    struct set_lsa_pl {
+        uint32_t offset;
+        uint32_t rsvd;
+        uint8_t data[];
+    } QEMU_PACKED;
+    struct set_lsa_pl *set_lsa_payload = (void *)cmd->payload;
+    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
+    CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
+    const size_t hdr_len = offsetof(struct set_lsa_pl, data);
+    uint16_t plen = *len;
+
+    *len = 0;
+    if (!plen) {
+        return CXL_MBOX_SUCCESS;
+    }
+
+    if (set_lsa_payload->offset + plen > cvc->get_lsa_size(ct3d) + hdr_len) {
+        return CXL_MBOX_INVALID_INPUT;
+    }
+    plen -= hdr_len;
+
+    cvc->set_lsa(ct3d, set_lsa_payload->data, plen, set_lsa_payload->offset);
+    return CXL_MBOX_SUCCESS;
+}
+
 #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
+#define IMMEDIATE_DATA_CHANGE (1 << 2)
 #define IMMEDIATE_POLICY_CHANGE (1 << 3)
 #define IMMEDIATE_LOG_CHANGE (1 << 4)
 
@@ -349,6 +406,9 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
         cmd_identify_memory_device, 0, 0 },
     [CCLS][GET_PARTITION_INFO] = { "CCLS_GET_PARTITION_INFO",
         cmd_ccls_get_partition_info, 0, 0 },
+    [CCLS][GET_LSA] = { "CCLS_GET_LSA", cmd_ccls_get_lsa, 0, 0 },
+    [CCLS][SET_LSA] = { "CCLS_SET_LSA", cmd_ccls_set_lsa,
+        ~0, IMMEDIATE_CONFIG_CHANGE | IMMEDIATE_DATA_CHANGE },
 };
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index b5aa1067df..6c6ed9a776 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -8,6 +8,7 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qemu/pmem.h"
 #include "qemu/range.h"
 #include "qemu/rcu.h"
 #include "sysemu/hostmem.h"
@@ -113,6 +114,11 @@ static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
     host_memory_backend_set_mapped(ct3d->hostmem, true);
     ct3d->cxl_dstate.pmem_size = ct3d->hostmem->size;
 
+    if (!ct3d->lsa) {
+        error_setg(errp, "lsa property must be set");
+        return false;
+    }
+
     return true;
 }
 
@@ -176,12 +182,58 @@ static void ct3d_reset(DeviceState *dev)
 static Property ct3_props[] = {
     DEFINE_PROP_LINK("memdev", CXLType3Dev, hostmem, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
+    DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
+                     HostMemoryBackend *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
 static uint64_t get_lsa_size(CXLType3Dev *ct3d)
 {
-    return 0;
+    MemoryRegion *mr;
+
+    mr = host_memory_backend_get_memory(ct3d->lsa);
+    return memory_region_size(mr);
+}
+
+static void validate_lsa_access(MemoryRegion *mr, uint64_t size,
+                                uint64_t offset)
+{
+    assert(offset + size <= memory_region_size(mr));
+    assert(offset + size > offset);
+}
+
+static uint64_t get_lsa(CXLType3Dev *ct3d, void *buf, uint64_t size,
+                    uint64_t offset)
+{
+    MemoryRegion *mr;
+    void *lsa;
+
+    mr = host_memory_backend_get_memory(ct3d->lsa);
+    validate_lsa_access(mr, size, offset);
+
+    lsa = memory_region_get_ram_ptr(mr) + offset;
+    memcpy(buf, lsa, size);
+
+    return size;
+}
+
+static void set_lsa(CXLType3Dev *ct3d, const void *buf, uint64_t size,
+                    uint64_t offset)
+{
+    MemoryRegion *mr;
+    void *lsa;
+
+    mr = host_memory_backend_get_memory(ct3d->lsa);
+    validate_lsa_access(mr, size, offset);
+
+    lsa = memory_region_get_ram_ptr(mr) + offset;
+    memcpy(lsa, buf, size);
+    memory_region_set_dirty(mr, offset, size);
+
+    /*
+     * Just like the PMEM, if the guest is not allowed to exit gracefully, label
+     * updates will get lost.
+     */
 }
 
 static void ct3_class_init(ObjectClass *oc, void *data)
@@ -203,6 +255,8 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, ct3_props);
 
     cvc->get_lsa_size = get_lsa_size;
+    cvc->get_lsa = get_lsa;
+    cvc->set_lsa = set_lsa;
 }
 
 static const TypeInfo ct3d_info = {
-- 
MST


