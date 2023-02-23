Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B206A1165
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:45:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIRc-0002oz-RZ; Thu, 23 Feb 2023 15:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRa-0002nj-Mo
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:43:58 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRZ-0007RI-3M
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:43:58 -0500
Received: by mail-pj1-x102b.google.com with SMTP id u10so14349975pjc.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uCfgSwaCWGjVH4XmiAS5xzTjPaTu2Mc57Kv2qaU5lRM=;
 b=n89/wfw9eZdbECZlYDz5DfRTWcaLs9CRGk61ZLnt0wYLe7RkvzUXWZxy/qVdfS/xMx
 jhsvJk5jAkHNTzM81PI0a2bQQTbAZvfnVX8sAfjjaNeQsDs4wj0zY/cwXWeHTiefiCab
 LKLWuP/9XG+VMZ4JnJ5xrnl5S+WFM3XgAXMW3c/f8WuxGqF5jLknWA8HkHqCRJpRw/wJ
 fF0P+VrmAlNGpOZI5BCoMTEDk5mXgU4pN+OP5Sdrd9UUPfchmR81q3hbglvMBN5bOSUy
 cV1N3zw+lSJPnew/CiLPXvFrEaqiZDMYaQLK2t4Hy0JAmDl6ATXosa0QSXk15skr8h/R
 R/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uCfgSwaCWGjVH4XmiAS5xzTjPaTu2Mc57Kv2qaU5lRM=;
 b=Z2bqDraQtrwppEr55IV59HgG/NmTglEt1SFOTulxgkN7jailwYWR9q1Oh6HMmaYWpR
 2p0lc6bHSkAEKVBJ5P/E+++bB4fdJ1E7kYCqcmC+1K4rN5SVu8j05CUcwN93tElrmsoU
 H0aOZ8MaHDJCRbl/LVy7tB5yr1709UwXNzSLuutKGgEQsib8byMCN3lFyniZGCIYsjuS
 LMnJLa+G2FjAke/xCpZTEpaVZ+Aq3UpxPXWoAC6kOP+1AqDymqmCxrUDG087VcfqJc11
 7evhcFGodEZBJyr9C8+16Z03+qLSY2PyyLWdBFGMZX94L4w17e4k2PypgTGPZYAhSrsI
 HHpw==
X-Gm-Message-State: AO0yUKVnITNzBuYDD/XSYHCOuJ3oBuuR+Jswnd0/w7pTStbER0atViVF
 jGqfcaCN7MKiRMvGQNYPvb0QT6/orS2RMXGKOfk=
X-Google-Smtp-Source: AK7set/P6uf9waCngUWogIlu0jEd4Mzre3GjzCXAt81YqxLvrCKfPWs0GlDhGNQWaWMVNaq6q3f8XA==
X-Received: by 2002:a17:90b:38c7:b0:234:a88e:d67e with SMTP id
 nn7-20020a17090b38c700b00234a88ed67emr14757191pjb.34.1677185035744; 
 Thu, 23 Feb 2023 12:43:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:43:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/13] softmmu/physmem: Check watchpoints for read+write at
 once
Date: Thu, 23 Feb 2023 10:43:34 -1000
Message-Id: <20230223204342.1093632-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Atomic operations are read-modify-write, and we'd like to
be able to test both read and write with one call.  This is
easy enough, with BP_MEM_READ | BP_MEM_WRITE.

Add BP_HIT_SHIFT to make it easy to set BP_WATCHPOINT_HIT_*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  7 ++++---
 softmmu/physmem.c     | 19 ++++++++++---------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2417597236..2f85ba14b3 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -921,9 +921,10 @@ void cpu_single_step(CPUState *cpu, int enabled);
 #define BP_GDB                0x10
 #define BP_CPU                0x20
 #define BP_ANY                (BP_GDB | BP_CPU)
-#define BP_WATCHPOINT_HIT_READ 0x40
-#define BP_WATCHPOINT_HIT_WRITE 0x80
-#define BP_WATCHPOINT_HIT (BP_WATCHPOINT_HIT_READ | BP_WATCHPOINT_HIT_WRITE)
+#define BP_HIT_SHIFT          6
+#define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
+#define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
+#define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
 
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
                           CPUBreakpoint **breakpoint);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cb998cdf23..c4f62dee60 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -915,9 +915,12 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
         /* this is currently used only by ARM BE32 */
         addr = cc->tcg_ops->adjust_watchpoint_address(cpu, addr, len);
     }
+
+    assert((flags & ~BP_MEM_ACCESS) == 0);
     QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        if (watchpoint_address_matches(wp, addr, len)
-            && (wp->flags & flags)) {
+        int hit_flags = wp->flags & flags;
+
+        if (hit_flags && watchpoint_address_matches(wp, addr, len)) {
             if (replay_running_debug()) {
                 /*
                  * replay_breakpoint reads icount.
@@ -936,16 +939,14 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 replay_breakpoint();
                 return;
             }
-            if (flags == BP_MEM_READ) {
-                wp->flags |= BP_WATCHPOINT_HIT_READ;
-            } else {
-                wp->flags |= BP_WATCHPOINT_HIT_WRITE;
-            }
+
+            wp->flags |= hit_flags << BP_HIT_SHIFT;
             wp->hitaddr = MAX(addr, wp->vaddr);
             wp->hitattrs = attrs;
 
-            if (wp->flags & BP_CPU && cc->tcg_ops->debug_check_watchpoint &&
-                !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
+            if (wp->flags & BP_CPU
+                && cc->tcg_ops->debug_check_watchpoint
+                && !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
                 wp->flags &= ~BP_WATCHPOINT_HIT;
                 continue;
             }
-- 
2.34.1


