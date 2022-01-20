Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F3494425
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 01:19:06 +0100 (CET)
Received: from localhost ([::1]:39616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nALAP-0001tn-Bq
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 19:19:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAL4P-0005mj-8J
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 19:12:55 -0500
Received: from [2a00:1450:4864:20::32f] (port=56277
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAL4N-0004dt-J2
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 19:12:52 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c66so8418813wma.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 16:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NsyFyyrMhaIGsZfTZhTpF24jgdat+4WKXL7TSaiz5ms=;
 b=G19Nd2O+0ty8aQSyQF59TUheRT8KHljTKOIkfuZcR57NqQ1ImKkNFJILI0T65K9J+U
 HInZp1zF3lAFphrA6/JFBFOPmSmKJjdBwRUPBQJV3EUBB6Rs+U578OZIGT4u2j0Hn3io
 VtugRbIFRZdmyNt2sn67vLIQDx5HOzKKfWgpJ3T4ESjlHEDPgFxuWDTpuegBm3gFEQez
 e4Nei+kvnWIt/rG8lwgwk/N9rR7c4KFRX/3xpsfZ/0ALMpRIGGswOeSww5JbgxBYYREK
 9sUqBJNu+E1Pg0X7I6Ne0DylWefbbkllBk+gG5zbf1S+6ZT6j9VjIg6+c2iD+Xa9nMGb
 TFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NsyFyyrMhaIGsZfTZhTpF24jgdat+4WKXL7TSaiz5ms=;
 b=8LigV7a5poXz+WgRg5iXaC2U09xIUKoZe8bINwtRl6F/Zt/s3AcMIJtUEqKKIhaccK
 3hn1SDkOIis4g8iDyJzbmATbpOVxI32fklqoSJ8vPJ27FY1RluNzTG0WWujH0bLNc6ZA
 fKV4yfFUZGy93zmr0IPy0LYSS3+xah6fPBfJnSCNGYYctKQKnN9Bb2fGfYoB/K+QGUaF
 mxjQ9JSW+GFloLJ6m3eQNpIdCDrU/GW/1su6UAcQhtu6CJveo748uFy2adjd9SDz82GR
 XQ/+1xDMul050UCV87j28vg9OnbTpoYOVhwbhnRdIR5DUAScNpoM7r9JdwKLjTRfkAub
 BXBA==
X-Gm-Message-State: AOAM531O1ohVCVmplymyMBUoJ3eoNEmoP8aqB9hEu5jBPBg43hAOZf/R
 l2Is2Sk23dC63ibwXOwqy4XWyTnrWBc=
X-Google-Smtp-Source: ABdhPJzSnwZ8yF3YrG4iDse8l0BIV2clkvtB0qGue5poHX/szF2ovuGgWQABKLeWYjX6OErYFh1Rlw==
X-Received: by 2002:a5d:5848:: with SMTP id i8mr20250275wrf.146.1642637569582; 
 Wed, 19 Jan 2022 16:12:49 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 j18sm1009424wmq.26.2022.01.19.16.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 16:12:49 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Date: Thu, 20 Jan 2022 01:12:41 +0100
Message-Id: <20220120001242.230082-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120001242.230082-1-f4bug@amsat.org>
References: <20220120001242.230082-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Representing the CRB cmd/response buffer as a standard
RAM region causes some trouble when the device is used
with VFIO. Indeed VFIO attempts to DMA_MAP this region
as usual RAM but this latter does not have a valid page
size alignment causing such an error report:
"vfio_listener_region_add received unaligned region".
To allow VFIO to detect that failing dma mapping
this region is not an issue, let's use a ram_device
memory region type instead.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Stefan Berger <stefanb@linux.ibm.com>
Acked-by: Stefan Berger <stefanb@linux.ibm.com>
[PMD: Keep tpm_crb.c in meson's softmmu_ss]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/tpm/tpm_crb.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index 58ebd1469c3..be0884ea603 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -25,6 +25,7 @@
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
 #include "sysemu/reset.h"
+#include "exec/cpu-common.h"
 #include "tpm_prop.h"
 #include "tpm_ppi.h"
 #include "trace.h"
@@ -43,6 +44,7 @@ struct CRBState {
 
     bool ppi_enabled;
     TPMPPI ppi;
+    uint8_t *crb_cmd_buf;
 };
 typedef struct CRBState CRBState;
 
@@ -291,10 +293,14 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    s->crb_cmd_buf = qemu_memalign(qemu_real_host_page_size,
+                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
+
     memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
         "tpm-crb-mmio", sizeof(s->regs));
-    memory_region_init_ram(&s->cmdmem, OBJECT(s),
-        "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
+    memory_region_init_ram_device_ptr(&s->cmdmem, OBJECT(s), "tpm-crb-cmd",
+                                      CRB_CTRL_CMD_SIZE, s->crb_cmd_buf);
+    vmstate_register_ram(&s->cmdmem, DEVICE(s));
 
     memory_region_add_subregion(get_system_memory(),
         TPM_CRB_ADDR_BASE, &s->mmio);
@@ -309,12 +315,24 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
     qemu_register_reset(tpm_crb_reset, dev);
 }
 
+static void tpm_crb_unrealize(DeviceState *dev)
+{
+    CRBState *s = CRB(dev);
+
+    qemu_vfree(s->crb_cmd_buf);
+
+    if (s->ppi_enabled) {
+        qemu_vfree(s->ppi.buf);
+    }
+}
+
 static void tpm_crb_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     TPMIfClass *tc = TPM_IF_CLASS(klass);
 
     dc->realize = tpm_crb_realize;
+    dc->unrealize = tpm_crb_unrealize;
     device_class_set_props(dc, tpm_crb_properties);
     dc->vmsd  = &vmstate_tpm_crb;
     dc->user_creatable = true;
-- 
2.34.1


