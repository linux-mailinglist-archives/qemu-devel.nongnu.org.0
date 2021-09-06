Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8A0401C5A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:36:03 +0200 (CEST)
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEn4-00014X-Go
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPj-0001lj-HD
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPg-0007vw-Cb
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:55 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q11so9790403wrr.9
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HAt0eGXEKChJ/sufXGKv5vEWs3agVzrZ8z2soVYehEo=;
 b=hsTcY4kfkhTlXqwhphSjxr50oFx5gLdJQJXwZG07mQsd3vVTcqkI1QrxSV3DkfLnQk
 PaqaI6TLkyq8ExsHvLADhPmlcowBgIMwkBxy7vTkQG8Yxkc5DUzjCRVE5BO/ObtxJK8f
 DZUnOaX96geRQkplEXDNQm4FpVNXQpSmSonvC9wn2bdL0pkdsj2Rk3367GLASiWiJsSz
 pQyogLJmcB1WbncrZbWxfAwQUUj3RvTsfe7GbJODu1dj5Xec32ITNiaSRHE4KKWL0jId
 yBvnqFUIZUgYinlfO6esRzEP7she2Ffvz2MUmRuUMk1kdwoCw4o/k+FavO11tBu8L3OH
 2N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HAt0eGXEKChJ/sufXGKv5vEWs3agVzrZ8z2soVYehEo=;
 b=BJaP/l9IbwrleoQHM6/oRhBRlZ5A6QA/EaDum7FkuoRlOKdShaeq1nISGHIww5QoEb
 fARPM6A2feSMHclA/6c6tcoGPieVA4JPK41+pIOkU5I29w75K8ewDh0CwpiY5bpr62ts
 /fX0m9B8PO3SYZqLC9kWj+krWw95ngy/eCZmHC/mCaEwaHyJiFulYL5nmvP7ybkoUfoa
 kZ4hlEePaZ/MmOmzKyVImXzeHWywo1ighmIp1/HoyBkBxTM0CotiIvR4YXlvm9jqMbtm
 931JSg4VGAIrWnAZo8FKkBpuJiol3qwuM1uzz/CrXhrJ2dJMn9DbiKfcnHp4mVV1Wao8
 rLuw==
X-Gm-Message-State: AOAM5314EOUwDFu6eBx/P8qb2HXBIeUSmHVyUM0V2kiAXXMLH7ae2633
 axsb3e47l3Wjis/h7Affo+R/TQOEOgs=
X-Google-Smtp-Source: ABdhPJzcbNJst16K630FnxGlkUn+SyeblfFnPUg1I5QnEe0Wwb5XNZJqr5aCrn3NVt1FwznPngXJqw==
X-Received: by 2002:adf:c38c:: with SMTP id p12mr13082134wrf.113.1630933911043; 
 Mon, 06 Sep 2021 06:11:51 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/36] hostmem-epc: Add the reset interface for EPC backend
 reset
Date: Mon,  6 Sep 2021 15:10:53 +0200
Message-Id: <20210906131059.55234-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

Add the sgx_memory_backend_reset() interface to handle EPC backend
reset when VM is reset. This reset function will destroy previous
backend memory region and re-mmap the EPC section for guest.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-23-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/hostmem-epc.c | 16 ++++++++++++++++
 include/hw/i386/pc.h   |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
index b512a68cb0..3bd1535d82 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -16,6 +16,7 @@
 #include "qom/object_interfaces.h"
 #include "qapi/error.h"
 #include "sysemu/hostmem.h"
+#include "hw/i386/pc.h"
 
 #define TYPE_MEMORY_BACKEND_EPC "memory-backend-epc"
 
@@ -55,6 +56,21 @@ sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     g_free(name);
 }
 
+void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
+                              Error **errp)
+{
+    MemoryRegion *mr = &backend->mr;
+
+    mr->enabled = false;
+
+    /* destroy the old memory region if it exist */
+    if (fd > 0 && mr->destructor) {
+        mr->destructor(mr);
+    }
+
+    sgx_epc_backend_memory_alloc(backend, errp);
+}
+
 static void sgx_epc_backend_instance_init(Object *obj)
 {
     HostMemoryBackend *m = MEMORY_BACKEND(obj);
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index b274179307..a1034aa262 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -207,6 +207,8 @@ extern const size_t pc_compat_6_0_len;
 
 /* sgx-epc.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
+void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
+                              Error **errp);
 
 extern GlobalProperty pc_compat_5_2[];
 extern const size_t pc_compat_5_2_len;
-- 
2.31.1



