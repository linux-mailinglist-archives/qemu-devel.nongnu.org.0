Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 265C3382BBF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:04:53 +0200 (CEST)
Received: from localhost ([::1]:39472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libzO-00017H-JC
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1librS-0004tY-5N
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:38 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1librQ-0003GX-K2
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:37 -0400
Received: by mail-wr1-x433.google.com with SMTP id z17so6076969wrq.7
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=elm9qcdGQk72gqB4ibNX9churq/FsJ3KEAhg0i9d3/Q=;
 b=SyqO3x6epByKgiVLWqzXpweNnmkfuMBF6TP/J3mAS/ebit1aIkZ6bmRWh/W9+jWy65
 m4rd+8JfD0NrO1Nslz6LEZmIYZyBvJH8M2a0O4ghYC78GDea9vos1kulWFkastZchLSy
 9AYht9dxddRfJrXgEjwRpm0bFHdi3HxpQ+h2fLRDgIPh7Ggvzxw+yNa+Gtl+p5izjF+l
 SkRD9/HiFZ5D0d2O+jNWOYF+L8nYi3Ct6rTFeV/GiizBmUbmCC+dvjRnKN6N7MFcdQ17
 0LJ3haMb4VCbb+l/UJwmev18IDyNuAacuEeOiEwe35pZlAIrWt9nfR5TqV3KOflNjN+Y
 euNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=elm9qcdGQk72gqB4ibNX9churq/FsJ3KEAhg0i9d3/Q=;
 b=shcpizPdRJN6tl9+A/pJaFLC1VIKFU/OMPFnojXiKQ3avMUZe3r55JfdTZizIdyHi6
 XS9RKBZSWs+AiQsx2ASPeJ4iEYYSaFSKspIMTrMGRAaqVHFDqLUq8eYJpYFZEA2jHRTi
 48Stnw1MZD2FqN1H9++yJ/r5G6C4weAMAdAl4ScdebUJBh8SEymMc0JxvEsgiklkuKSy
 6jb+Dd7atm9QFclfXaC98HyCWW0+gR1HmPJc/uoSLd/vtqyWznToedHavlxoizUku/nF
 PhDZ0Ha6Xg4x/JtkPdQPmU6SSUgF6z8j0FEj4/v4yUNrJVwVXzXV1TdtC3070gKpM6fF
 xVaA==
X-Gm-Message-State: AOAM533+CQmLCUzRAH0hhKAYTxKLWSIJ8AKVEgSFVKuhiWI1MhwwmXzF
 HGC5moijKZC9segt5oZBHQ2dHLnraIofyw==
X-Google-Smtp-Source: ABdhPJw+jY8vbOb4NTf11Ar5/z/Y2VqSoIiQXVEgb3GcP+4fLXfc3/EzC+b8exRGrXuEtH2VPbMgMA==
X-Received: by 2002:adf:cf09:: with SMTP id o9mr23207211wrj.334.1621252595011; 
 Mon, 17 May 2021 04:56:35 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id e38sm19636720wmp.21.2021.05.17.04.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:56:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 13/15] sysemu/memory_mapping: Become target-agnostic
Date: Mon, 17 May 2021 13:55:23 +0200
Message-Id: <20210517115525.1088693-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

target_ulong is target-specific, while hwaddr isn't.

memory_mapping_list_add_merge_sorted() uses hwaddr arguments
anyway, so use the hwaddr type for MemoryMapping::virt_addr.

Remove the unnecessary "exec/cpu-defs.h" target-speficic header
from "memory_mapping.h" and use the target-agnostic "hw/core/cpu.h"
locally in memory_mapping.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/memory_mapping.h | 3 +--
 softmmu/memory_mapping.c        | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/memory_mapping.h b/include/sysemu/memory_mapping.h
index 4b20f1a639e..771dba21773 100644
--- a/include/sysemu/memory_mapping.h
+++ b/include/sysemu/memory_mapping.h
@@ -15,7 +15,6 @@
 #define MEMORY_MAPPING_H
 
 #include "qemu/queue.h"
-#include "exec/cpu-defs.h"
 #include "exec/memory.h"
 
 typedef struct GuestPhysBlock {
@@ -43,7 +42,7 @@ typedef struct GuestPhysBlockList {
 /* The physical and virtual address in the memory mapping are contiguous. */
 typedef struct MemoryMapping {
     hwaddr phys_addr;
-    target_ulong virt_addr;
+    hwaddr virt_addr;
     ram_addr_t length;
     QTAILQ_ENTRY(MemoryMapping) next;
 } MemoryMapping;
diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index e7af2765466..7bb74df5a7a 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -17,6 +17,7 @@
 #include "sysemu/memory_mapping.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
+#include "hw/core/cpu.h"
 
 //#define DEBUG_GUEST_PHYS_REGION_ADD
 
-- 
2.26.3


