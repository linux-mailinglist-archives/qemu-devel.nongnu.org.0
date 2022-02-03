Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F174A8D2C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:25:57 +0100 (CET)
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFig0-0001N4-RW
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:25:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhdH-0002ZX-JA
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:19:03 -0500
Received: from [2607:f8b0:4864:20::62c] (port=40462
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhdG-0002Ht-3j
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:19:03 -0500
Received: by mail-pl1-x62c.google.com with SMTP id y17so3015403plg.7
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mBdNO2Bwz83I7abD0UcZVgndIJgAStlAegpjuFngrIQ=;
 b=fYdqDFs+bvz0pH6otd4MKrtJjhSHTJNSdc+khFSjq6G2BuY8Y0oHXG7BU7pHkqHraQ
 /hs0RnnG2iduT1Ug/9FeMDHlBD3w/bw1OZPjkqM0tL1lUEegpPjGJab3rptTCz4pl/rg
 rTZNMtaGATuBI4/bWY728ifcDLRhGXzPJz/6V1wd3QORaayp7zs7FFeTdTtQZXeZ0bAc
 QRIIywVDbESUicnMM8MDIaeZ6h66dR3vWtt26QHLkp9+wv3F6Jv+5Tboxq35si67COeB
 3Dj5yq+MWRqqyBxx+oVev22+rYNVoTFXQcV94ecVMmj66syHE4uQBJLTiTOerhBPh5WQ
 Y43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mBdNO2Bwz83I7abD0UcZVgndIJgAStlAegpjuFngrIQ=;
 b=1op9iX+lwTAptQxhua+OQZHenT7JP0NZT8rj19Bwvf8+k5C3ynHrAHH6q1p6dkTmfb
 SdmKDgF6LPwArhf/bG4PY3PRJvN0K3dn0VMAhmSdJCsrkIijCN2F/fUM07NgedKclYAU
 09kJBgDRWBgqbker2k35DG6qW5c0CUqPFDq0oykd7V6BhsKgvTZT4JnSLyNy9UAib6vf
 wOh9hYMV7C/tMSufIAJVSwylfFZeZVLsbiueumSPIRqRANZbeNSTNUFA8G3XvETSn1NQ
 3CcN1DabEdWTXVmKTNhIpC2ElAxLUwOIrf8E9atR5Fa+ZSLxnYmdnt87J7dZjpKVqUF2
 DWmg==
X-Gm-Message-State: AOAM533X0xEFz7sLJjHe1ZwQNK0bHYAGfjY4geMiAYTuhNJ74rsb39f4
 55gUp/Gn0A+dS37JM/1zf+F7Nu3QT/c=
X-Google-Smtp-Source: ABdhPJzlrsrckaRzZ5wRTufAeBJqfKOA/C0u4lpudI/SJRnkTKCobfwlCC/FsVYuhdmQfra6epzazw==
X-Received: by 2002:a17:902:8a97:: with SMTP id
 p23mr37361090plo.26.1643915940633; 
 Thu, 03 Feb 2022 11:19:00 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o1sm32201008pfu.88.2022.02.03.11.18.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:19:00 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 05/21] sysemu/memory_mapping: Become target-agnostic
Date: Thu,  3 Feb 2022 20:17:58 +0100
Message-Id: <20220203191814.45023-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

target_ulong is target-specific, while vaddr isn't.

Remove the unnecessary "exec/cpu-defs.h" target-speficic header
from "memory_mapping.h" and use the target-agnostic "hw/core/cpu.h"
locally in memory_mapping.c.

Remove "exec/memory.h" since MemoryRegion is forward-declared in
"qemu/typedefs.h".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/memory_mapping.h | 5 ++---
 softmmu/memory_mapping.c        | 1 +
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/memory_mapping.h b/include/sysemu/memory_mapping.h
index 4b20f1a639..3bbeb1bcb4 100644
--- a/include/sysemu/memory_mapping.h
+++ b/include/sysemu/memory_mapping.h
@@ -15,8 +15,7 @@
 #define MEMORY_MAPPING_H
 
 #include "qemu/queue.h"
-#include "exec/cpu-defs.h"
-#include "exec/memory.h"
+#include "exec/cpu-common.h"
 
 typedef struct GuestPhysBlock {
     /* visible to guest, reflects PCI hole, etc */
@@ -43,7 +42,7 @@ typedef struct GuestPhysBlockList {
 /* The physical and virtual address in the memory mapping are contiguous. */
 typedef struct MemoryMapping {
     hwaddr phys_addr;
-    target_ulong virt_addr;
+    vaddr virt_addr;
     ram_addr_t length;
     QTAILQ_ENTRY(MemoryMapping) next;
 } MemoryMapping;
diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index a62eaa49cc..8320165ea2 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -17,6 +17,7 @@
 #include "sysemu/memory_mapping.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
+#include "hw/core/cpu.h"
 
 //#define DEBUG_GUEST_PHYS_REGION_ADD
 
-- 
2.34.1


