Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3741F33EA83
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:27:36 +0100 (CET)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQad-0002sO-8R
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVd-0003Uv-Jt
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:25 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVb-0007sY-NR
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:25 -0400
Received: by mail-ej1-x62f.google.com with SMTP id mm21so887769ejb.12
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=frvWeWkE0HLi8OnAGFQ6yFN2uwXNepdq5oonZmdE2hY=;
 b=T/VeUJEtbH5PdGg0JgO38rtGO2jSFFCinL6WZDb8gfGbA4bzGqaHnF+suGcgDMI83H
 zFpuu0s0PdgHeKGnHclucn+m3FWwzWqgEXrL3+XEAzXuICU1c1O3ojszmd6kSOQTQbl9
 bquriywD8XTmT9aL+KGldITXdwZXmr89GmssLviHwWnLp2ZxOw4ZdjEGkyjVYVx+Boc9
 mElEXO5Ema59lKJx7q/ESSI7vzq01V2OU5GZg1mQptJVE8xTQ4OC3cXvvJfMJ/hg1Ux/
 8f9qHzPQNaBGk+ESmIvUuJxkxzVMJcEVWEJdrgeR1MvEKNppAbxRFhONIgSctDKu0OpM
 0hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=frvWeWkE0HLi8OnAGFQ6yFN2uwXNepdq5oonZmdE2hY=;
 b=k2Gaf6MlsFUEaeImRLeuSBvUquDN8S6Apd2CQh8OMYKX2u57olx1PHBhC12/CieFy3
 z4u3UJ1hre9c7NUs3bSghwSekYr0kcFaFIIqzCqnZM5LQkgQ+QAXEOYVHQwJ7qKfLMKc
 YUcKfnTASwIFHHnbKw4O3qnYwHADdnl3tVS3uLGT76lIEiohELJ99XiupulTVaFzlwOF
 gilE/P8cDVdcCyIiP3VzF+4964DWhHVOJUKM5Yby6/9lNKZvP407LGP96gP7+E5Xok5w
 yhDtw1yq6MWG6PKs2WbQaEGFZ5Gh0qlMXzLMXpofhW75rnzBlDanGzHFxn7/Ko7gjeh+
 jZqw==
X-Gm-Message-State: AOAM531K9OATj+o7/1Y9PMs6YUEc5D59iRWDX+MFBv4MSeJglBXD0BJ9
 U0QguB9AMKAVcR1amqx8VpACVg==
X-Google-Smtp-Source: ABdhPJyOGoA431knzsbTUrKsHol+Ua2xj2tLA2GkMgUcTOqrJ0NUYQGpEyrkYviT2ctQTqSDQ4Y8zQ==
X-Received: by 2002:a17:906:b0d8:: with SMTP id
 bk24mr34718162ejb.252.1615965742426; 
 Wed, 17 Mar 2021 00:22:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c10sm11718549edt.64.2021.03.17.00.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F03EF1FF8F;
 Wed, 17 Mar 2021 07:22:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 03/15] plugins: Expose physical addresses instead of device
 offsets
Date: Wed, 17 Mar 2021 07:22:04 +0000
Message-Id: <20210317072216.16316-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aaron Lindsay <aaron@os.amperecomputing.com>

This allows plugins to query for full virtual-to-physical address
translation for a given `qemu_plugin_hwaddr` and stops exposing the
offset within the device itself. As this change breaks the API,
QEMU_PLUGIN_VERSION is incremented.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210309202802.211756-1-aaron@os.amperecomputing.com>
Message-Id: <20210312172821.31647-3-alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index c66507fe8f..3303dce862 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -47,7 +47,7 @@ typedef uint64_t qemu_plugin_id_t;
 
 extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
 
-#define QEMU_PLUGIN_VERSION 0
+#define QEMU_PLUGIN_VERSION 1
 
 typedef struct {
     /* string describing architecture */
@@ -307,8 +307,8 @@ bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info);
 bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info);
 bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
 
-/*
- * qemu_plugin_get_hwaddr():
+/**
+ * qemu_plugin_get_hwaddr() - return handle for memory operation
  * @vaddr: the virtual address of the memory operation
  *
  * For system emulation returns a qemu_plugin_hwaddr handle to query
@@ -323,12 +323,30 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
                                                   uint64_t vaddr);
 
 /*
- * The following additional queries can be run on the hwaddr structure
- * to return information about it. For non-IO accesses the device
- * offset will be into the appropriate block of RAM.
+ * The following additional queries can be run on the hwaddr structure to
+ * return information about it - namely whether it is for an IO access and the
+ * physical address associated with the access.
+ */
+
+/**
+ * qemu_plugin_hwaddr_is_io() - query whether memory operation is IO
+ * @haddr: address handle from qemu_plugin_get_hwaddr()
+ *
+ * Returns true if the handle's memory operation is to memory-mapped IO, or
+ * false if it is to RAM
  */
 bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
-uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr);
+
+/**
+ * qemu_plugin_hwaddr_phys_addr() - query physical address for memory operation
+ * @haddr: address handle from qemu_plugin_get_hwaddr()
+ *
+ * Returns the physical address associated with the memory operation
+ *
+ * Note that the returned physical address may not be unique if you are dealing
+ * with multiple address spaces.
+ */
+uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr);
 
 /*
  * Returns a string representing the device. The string is valid for
diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index eacc678eac..bf53267532 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -122,7 +122,7 @@ static void vcpu_haddr(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
         }
     } else {
         if (hwaddr && !qemu_plugin_hwaddr_is_io(hwaddr)) {
-            page = (uint64_t) qemu_plugin_hwaddr_device_offset(hwaddr);
+            page = (uint64_t) qemu_plugin_hwaddr_phys_addr(hwaddr);
         } else {
             page = vaddr;
         }
diff --git a/contrib/plugins/hwprofile.c b/contrib/plugins/hwprofile.c
index 6dac1d5f85..faf216ac00 100644
--- a/contrib/plugins/hwprofile.c
+++ b/contrib/plugins/hwprofile.c
@@ -201,7 +201,7 @@ static void vcpu_haddr(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
         return;
     } else {
         const char *name = qemu_plugin_hwaddr_device_name(hwaddr);
-        uint64_t off = qemu_plugin_hwaddr_device_offset(hwaddr);
+        uint64_t off = qemu_plugin_hwaddr_phys_addr(hwaddr);
         bool is_write = qemu_plugin_mem_is_store(meminfo);
         DeviceCounts *counts;
 
diff --git a/plugins/api.c b/plugins/api.c
index 0b04380d57..3c7dc406e3 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -40,6 +40,7 @@
 #include "sysemu/sysemu.h"
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/ram_addr.h"
 #include "disas/disas.h"
 #include "plugin.h"
 #ifndef CONFIG_USER_ONLY
@@ -298,19 +299,25 @@ bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr)
 #endif
 }
 
-uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr)
+uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
 {
 #ifdef CONFIG_SOFTMMU
     if (haddr) {
         if (!haddr->is_io) {
-            ram_addr_t ram_addr = qemu_ram_addr_from_host((void *) haddr->v.ram.hostaddr);
-            if (ram_addr == RAM_ADDR_INVALID) {
+            RAMBlock *block;
+            ram_addr_t offset;
+            void *hostaddr = (void *) haddr->v.ram.hostaddr;
+
+            block = qemu_ram_block_from_host(hostaddr, false, &offset);
+            if (!block) {
                 error_report("Bad ram pointer %"PRIx64"", haddr->v.ram.hostaddr);
                 abort();
             }
-            return ram_addr;
+
+            return block->offset + offset + block->mr->addr;
         } else {
-            return haddr->v.io.offset;
+            MemoryRegionSection *mrs = haddr->v.io.section;
+            return haddr->v.io.offset + mrs->mr->addr;
         }
     }
 #endif
-- 
2.20.1


