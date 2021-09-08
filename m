Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA584037EF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:35:31 +0200 (CEST)
Received: from localhost ([::1]:41114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuvS-0001C8-6O
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRz-0006tD-Md
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:04 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRv-00039Z-Sa
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:02 -0400
Received: by mail-wr1-x42a.google.com with SMTP id g16so2420764wrb.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yJehKJquhIoU/zA8uyJsKbhN7DD8eaV1JU50Vzj2bEo=;
 b=fDAOhMWWEHwiFNZ9fETfFR29dAuiQBBLUIWk684KXqJgHmOF8IF8w184HQnJ+wHgpS
 MEMcW7zSudEzEW7/zB2GJ7/8+lD96h/XTWo7cchlXT1f2IYoW0Cp+7++ghXePAMerTmM
 aTwEZZOIZt8fXh0DkxdfXlZ5V6K61ANipHLyB57aeXX2F3cNMOzl6FJeRfMqUG7dA3dq
 5072nmDV5/fXGK8vnE+YrnOUTpwjRiLiwOAvy7CWkCMRH58Q87tW1XQqqAjUUILZhOH9
 IJEXyG+xfCuWZyqhehFtMYx1DjdD13r1LeKro7m8WFIWAq2iwYPwPK1yqBGinqfEiZCe
 7vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yJehKJquhIoU/zA8uyJsKbhN7DD8eaV1JU50Vzj2bEo=;
 b=XhQsHGCgjujO+08JPgA1qcfQ5Vc4gNDaXrZVBf6JwwJCWzZrDoQXByBDemAPNEr8AD
 cVQUFbmWrlRnlr9yI7pAgJrHd+vs//dyYQuLLLvUGkCBCWzwhYaLK+CbbNkL6cijjxsG
 gLLrsPr9sBZgJgTBq8E2PG8O3EzKC3H/lPUgzmLn3DcZlfRGK7QUzvWE2XvYWNaJqmzH
 foeSOWBFvrMS3z95JBnrH6X50OyXJIHjZUJEXsyBA5k24OsWvKh0r+L8QO+D9LLw70bD
 xCrgESUdauuHk9p4UcLzcbMWDXx6qpGOyJf3RtpVFBIhfTa6J05exomlZMLQWJSn34bx
 xs2A==
X-Gm-Message-State: AOAM5325QsZ4VIwEYVUM1DEXYyBUbkLHNM4eIrGbES31esch0Wv0I9dz
 Fw7HA6L0mgzNyc3RlPr6bBxXgYQYeJs=
X-Google-Smtp-Source: ABdhPJz7L1V4k2A9AoJVjtTOs8SZckDGhWXMPxp50nzz3EyJtFJooittH3QWJRrgtPJvWGhH0DXuwQ==
X-Received: by 2002:adf:d184:: with SMTP id v4mr3051704wrc.229.1631095498467; 
 Wed, 08 Sep 2021 03:04:58 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 31/43] hostmem-epc: Add the reset interface for EPC backend
 reset
Date: Wed,  8 Sep 2021 12:04:14 +0200
Message-Id: <20210908100426.264356-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
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
index f2869437ab..a5ae380b4b 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -203,6 +203,8 @@ extern const size_t pc_compat_6_0_len;
 
 /* sgx-epc.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
+void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
+                              Error **errp);
 
 extern GlobalProperty pc_compat_5_2[];
 extern const size_t pc_compat_5_2_len;
-- 
2.31.1



