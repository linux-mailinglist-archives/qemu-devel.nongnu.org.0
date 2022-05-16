Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6484F5282C4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:01:40 +0200 (CEST)
Received: from localhost ([::1]:47654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYTr-0007lT-AP
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5v-0006aB-EJ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5t-0005KT-JO
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7SkfgM5LP5kRZHpaFT+JBmZUEdF/ThWL8FHFjzYg3vs=;
 b=axo6pUu7niuusjD2s0a2XBD9Q1HcY+2W0Zse6EnMNuKyN/HkG4akW5cYT7ahR4/2GAiWLf
 9FyeoS7kolly3hUMw298HneW5JzU/FIsbuyK6Of7e8I3Us5PblwrXOcwBP6ZsG/lOhaqHU
 KaK525uG6YC+4Q7fz3UjIxF5CiDb89U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-TD0UImekO_mpPSw53rf5yQ-1; Mon, 16 May 2022 06:36:52 -0400
X-MC-Unique: TD0UImekO_mpPSw53rf5yQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h6-20020a7bc926000000b0039470bcb9easo5451828wml.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7SkfgM5LP5kRZHpaFT+JBmZUEdF/ThWL8FHFjzYg3vs=;
 b=ASgGhlQHcSRLb7T56prW/bVa4lDuptYJjs7zw26WgbdlQZ2FGe+JuTTe0C4FCo+Osp
 fg9xIRmgeD3KG9tyWwU+uT25Nn47YMeYKTdtltypU5NS7CeXmBUOEFhUEuEyxwd66Nbc
 zW/XWZFbhASQ0HVhIH/2VpdY3Gmy77kXFabJO+OzpFgRq/cDpaoPBl2hzeKNVCKvYNj1
 OEB9VZa5ZOd0LOrufLJumnXEpBkjcSmNpDsLrWS9+UcbEE4pgbW+YwUvlPL04VgN6djj
 z3wQYTfG9Wlm0xe0YHt6Wf/He3RtEycF4Tb8nNH9Gas3KTd9zJ9kMNsbZMcLdc9cvU2G
 ayNg==
X-Gm-Message-State: AOAM533Xq5z7F5mUd8CLHgD46INZukZrCxSbg568IpM2TADuRYxOJn3Y
 jJJxRelfodoLLVA8INYGkVCivr0ujNpagK475dLHFlqVtvIrMZOkI2FxXrOwuRLBmwdOnviypHf
 5R2p6gkWnI9gesyGDtGrfokoPZWTYxJEIgGRyyU7u25EDCC/rECof7EqSMwU8
X-Received: by 2002:a05:600c:1c97:b0:394:7a2e:a83c with SMTP id
 k23-20020a05600c1c9700b003947a2ea83cmr26747910wms.175.1652697410445; 
 Mon, 16 May 2022 03:36:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxspPAbSbPyNFfKdZ24l3qldtfKL4YUouMuF9hOM8n0HzjQ+E2AfoJ9VYpEHkuvPAgXq8a0AA==
X-Received: by 2002:a05:600c:1c97:b0:394:7a2e:a83c with SMTP id
 k23-20020a05600c1c9700b003947a2ea83cmr26747882wms.175.1652697410148; 
 Mon, 16 May 2022 03:36:50 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 p12-20020a5d59ac000000b0020c5253d925sm9983488wrr.113.2022.05.16.03.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:36:49 -0700 (PDT)
Date: Mon, 16 May 2022 06:36:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Subject: [PULL 21/91] hw/cxl/device: Add some trivial commands
Message-ID: <20220516095448.507876-22-mst@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

GET_FW_INFO and GET_PARTITION_INFO, for this emulation, is equivalent to
info already returned in the IDENTIFY command. To have a more robust
implementation, add those.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220429144110.25167-20-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-mailbox-utils.c | 69 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 4ae0561dfc..c8188d7087 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "hw/cxl/cxl.h"
 #include "hw/pci/pci.h"
+#include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qemu/uuid.h"
 
@@ -44,6 +45,8 @@ enum {
         #define CLEAR_RECORDS   0x1
         #define GET_INTERRUPT_POLICY   0x2
         #define SET_INTERRUPT_POLICY   0x3
+    FIRMWARE_UPDATE = 0x02,
+        #define GET_INFO      0x0
     TIMESTAMP   = 0x03,
         #define GET           0x0
         #define SET           0x1
@@ -52,6 +55,8 @@ enum {
         #define GET_LOG       0x1
     IDENTIFY    = 0x40,
         #define MEMORY_DEVICE 0x0
+    CCLS        = 0x41,
+        #define GET_PARTITION_INFO     0x0
 };
 
 /* 8.2.8.4.5.1 Command Return Codes */
@@ -114,6 +119,39 @@ DEFINE_MAILBOX_HANDLER_NOP(events_clear_records);
 DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
 DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
 
+/* 8.2.9.2.1 */
+static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
+                                             CXLDeviceState *cxl_dstate,
+                                             uint16_t *len)
+{
+    struct {
+        uint8_t slots_supported;
+        uint8_t slot_info;
+        uint8_t caps;
+        uint8_t rsvd[0xd];
+        char fw_rev1[0x10];
+        char fw_rev2[0x10];
+        char fw_rev3[0x10];
+        char fw_rev4[0x10];
+    } QEMU_PACKED *fw_info;
+    QEMU_BUILD_BUG_ON(sizeof(*fw_info) != 0x50);
+
+    if (cxl_dstate->pmem_size < (256 << 20)) {
+        return CXL_MBOX_INTERNAL_ERROR;
+    }
+
+    fw_info = (void *)cmd->payload;
+    memset(fw_info, 0, sizeof(*fw_info));
+
+    fw_info->slots_supported = 2;
+    fw_info->slot_info = BIT(0) | BIT(3);
+    fw_info->caps = 0;
+    pstrcpy(fw_info->fw_rev1, sizeof(fw_info->fw_rev1), "BWFW VERSION 0");
+
+    *len = sizeof(*fw_info);
+    return CXL_MBOX_SUCCESS;
+}
+
 /* 8.2.9.3.1 */
 static ret_code cmd_timestamp_get(struct cxl_cmd *cmd,
                                   CXLDeviceState *cxl_dstate,
@@ -258,6 +296,33 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
+static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
+                                           CXLDeviceState *cxl_dstate,
+                                           uint16_t *len)
+{
+    struct {
+        uint64_t active_vmem;
+        uint64_t active_pmem;
+        uint64_t next_vmem;
+        uint64_t next_pmem;
+    } QEMU_PACKED *part_info = (void *)cmd->payload;
+    QEMU_BUILD_BUG_ON(sizeof(*part_info) != 0x20);
+    uint64_t size = cxl_dstate->pmem_size;
+
+    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
+        return CXL_MBOX_INTERNAL_ERROR;
+    }
+
+    /* PMEM only */
+    part_info->active_vmem = 0;
+    part_info->next_vmem = 0;
+    part_info->active_pmem = size / (256 << 20);
+    part_info->next_pmem = 0;
+
+    *len = sizeof(*part_info);
+    return CXL_MBOX_SUCCESS;
+}
+
 #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
 #define IMMEDIATE_POLICY_CHANGE (1 << 3)
 #define IMMEDIATE_LOG_CHANGE (1 << 4)
@@ -271,12 +336,16 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
         cmd_events_get_interrupt_policy, 0, 0 },
     [EVENTS][SET_INTERRUPT_POLICY] = { "EVENTS_SET_INTERRUPT_POLICY",
         cmd_events_set_interrupt_policy, 4, IMMEDIATE_CONFIG_CHANGE },
+    [FIRMWARE_UPDATE][GET_INFO] = { "FIRMWARE_UPDATE_GET_INFO",
+        cmd_firmware_update_get_info, 0, 0 },
     [TIMESTAMP][GET] = { "TIMESTAMP_GET", cmd_timestamp_get, 0, 0 },
     [TIMESTAMP][SET] = { "TIMESTAMP_SET", cmd_timestamp_set, 8, IMMEDIATE_POLICY_CHANGE },
     [LOGS][GET_SUPPORTED] = { "LOGS_GET_SUPPORTED", cmd_logs_get_supported, 0, 0 },
     [LOGS][GET_LOG] = { "LOGS_GET_LOG", cmd_logs_get_log, 0x18, 0 },
     [IDENTIFY][MEMORY_DEVICE] = { "IDENTIFY_MEMORY_DEVICE",
         cmd_identify_memory_device, 0, 0 },
+    [CCLS][GET_PARTITION_INFO] = { "CCLS_GET_PARTITION_INFO",
+        cmd_ccls_get_partition_info, 0, 0 },
 };
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
-- 
MST


