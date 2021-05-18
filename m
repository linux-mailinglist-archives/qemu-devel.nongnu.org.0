Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC70388151
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:24:26 +0200 (CEST)
Received: from localhost ([::1]:36412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6GP-0001Ae-2B
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64f-0000ov-4S
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:17 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:40550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64S-0006HD-7U
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:16 -0400
Received: by mail-oi1-x22e.google.com with SMTP id s19so10957105oic.7
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iRYIXTh9YtTWQKT/ZBagL9R5DPvobu3+3oVqu1iYRUI=;
 b=VLzbPSNvuooJ31snhYW5fOHMqvXooMOLxuQrHUb5o+Pxs1xr8ha7l1v/gV9ksqnHW6
 1GzMxDRlNwA7aYMXOcFzczOewhte1y7TcTfVsbR9EY0CygofTcCa17Iie7mpWnMf2uy0
 MvgQ1Qbs7yIXCGQSpVxU74rBBScguwY0PZVGjCi7pUOBQbVLYnFHP/AvlTDWMfPVDtOB
 +ygkXQakddLUFutxRKh+TYvTgn4R01//tjP/+CuViHMgJeOxSSE5RkeYRUsvcc5ikwtt
 S58hVoiRUCWMV5z4JZWNlLJAsXcnVpmCjBH8RBzT7YGV8hL4dDPta0yDDfUhyuNDs+wo
 SQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iRYIXTh9YtTWQKT/ZBagL9R5DPvobu3+3oVqu1iYRUI=;
 b=CbOaO+PXsPqwPTMS0oYNJ50S3/gCYfrF4OgOY0M81yuHC+VESCcSa+yWDdccMcW/wH
 J0k13ZNbzjpHgyAyUwDSvQeVw/8Y8JXbv+hJm+Q5OKBlAB5wbC8hiaXBVKngLv6UumWW
 gnu8AnlPLOUZ6lF86vqzZhsCBLKXTjey6ziqBoQwIxmwQO/5UJJLJhemgufHisttXmac
 sGJLWRiM3YdgTKTXuJLFO/XpGjU9NuatxquFRzpxEj/LIrmRbRwkUHqER6knTQk5MOJ1
 m/dO5gj4jqOlW7D6tnzCJq5uJFso+6VlSxS1XeXKRk0CRVu4R/fYks9/5NAioNJUUBRQ
 DxgQ==
X-Gm-Message-State: AOAM53029+rvy1eIMoulfEFd2M2ul+5ggEjRihxZ0V9i//bWkzGPcQtw
 h9KGDiCKNhws+aSED/QTkt6qGABh2dWfsix8
X-Google-Smtp-Source: ABdhPJx5d3P/nvS4BxRkW3z0yVylzSo3bt7hoAVyOmSPSTdkxBOCeCrrbrAkK6S1mS9yogdwT2RvNA==
X-Received: by 2002:a05:6808:14cc:: with SMTP id
 f12mr5280196oiw.115.1621368722292; 
 Tue, 18 May 2021 13:12:02 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:12:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/24] target/ppc: Remove type argument from
 mmubooke206_check_tlb
Date: Tue, 18 May 2021 15:11:36 -0500
Message-Id: <20210518201146.794854-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can now use MMU_INST_FETCH from access_type for this.
Unify the I/D code paths, making use of prot_for_access_type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu_helper.c | 50 ++++++++++++++---------------------------
 1 file changed, 17 insertions(+), 33 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index bf0fcca9be..90038e3e76 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -944,10 +944,8 @@ static bool mmubooke206_get_as(CPUPPCState *env,
 static int mmubooke206_check_tlb(CPUPPCState *env, ppcmas_tlb_t *tlb,
                                  hwaddr *raddr, int *prot,
                                  target_ulong address,
-                                 MMUAccessType access_type,
-                                 int type, int mmu_idx)
+                                 MMUAccessType access_type, int mmu_idx)
 {
-    int ret;
     int prot2 = 0;
     uint32_t epid;
     bool as, pr;
@@ -1004,39 +1002,25 @@ found_tlb:
     }
 
     /* Check the address space and permissions */
-    if (type == ACCESS_CODE) {
+    if (access_type == MMU_INST_FETCH) {
         /* There is no way to fetch code using epid load */
         assert(!use_epid);
-        if (msr_ir != ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
-            LOG_SWTLB("%s: AS doesn't match\n", __func__);
-            return -1;
-        }
-
-        *prot = prot2;
-        if (prot2 & PAGE_EXEC) {
-            LOG_SWTLB("%s: good TLB!\n", __func__);
-            return 0;
-        }
-
-        LOG_SWTLB("%s: no PAGE_EXEC: %x\n", __func__, prot2);
-        ret = -3;
-    } else {
-        if (as != ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
-            LOG_SWTLB("%s: AS doesn't match\n", __func__);
-            return -1;
-        }
-
-        *prot = prot2;
-        if (prot2 & (access_type == MMU_DATA_LOAD ? PAGE_READ : PAGE_WRITE)) {
-            LOG_SWTLB("%s: found TLB!\n", __func__);
-            return 0;
-        }
-
-        LOG_SWTLB("%s: PAGE_READ/WRITE doesn't match: %x\n", __func__, prot2);
-        ret = -2;
+        as = msr_ir;
     }
 
-    return ret;
+    if (as != ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
+        LOG_SWTLB("%s: AS doesn't match\n", __func__);
+        return -1;
+    }
+
+    *prot = prot2;
+    if (prot2 & prot_for_access_type(access_type)) {
+        LOG_SWTLB("%s: good TLB!\n", __func__);
+        return 0;
+    }
+
+    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
+    return access_type == MMU_INST_FETCH ? -3 : -2;
 }
 
 static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
@@ -1060,7 +1044,7 @@ static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                 continue;
             }
             ret = mmubooke206_check_tlb(env, tlb, &raddr, &ctx->prot, address,
-                                        access_type, type, mmu_idx);
+                                        access_type, mmu_idx);
             if (ret != -1) {
                 goto found_tlb;
             }
-- 
2.25.1


