Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E665599375
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:33:10 +0200 (CEST)
Received: from localhost ([::1]:54424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOskv-0004Ej-Cu
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseM-0001Ri-Ke
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:22 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:34749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseL-0002ix-02
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:22 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 s4-20020a17090a5d0400b001fabc6bb0baso3838509pji.1
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=aJaNQ6aSdE9rWibAJT4lh7LTRwz3SqqWw+/j8K8vQwg=;
 b=o4lQHPJBXtb22E5FkdgLLo7CkVTU7JfliZoOqAg2fHD/9au1J89mUwSYBI58u4VWA9
 977fWBTvQr6irVCEdHIwzaCz6YYTyyu3tN6OuUmQl2Qdw27DVjkBSniUpeHSnBirf2vK
 kt6wcI0fa1o8XXHj1hgJjxEHa7VbFVemXMPTh+fY+AvCsvA2FEIh55zvHTum63Irz0+d
 pJefjk+K27lTKCJP2Dfa04M5jQwHTLbVc9x7aLdVJYvWfPOW4vHcz6cllXD+JJ4Lw6c1
 JXX0cKDTxdWioUl9mt+/NdNLS2SXyCyh90asdp0WHTaG3aDFhTubOVB8CfScwiYR2p19
 vhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=aJaNQ6aSdE9rWibAJT4lh7LTRwz3SqqWw+/j8K8vQwg=;
 b=RypkPBHabRSOczXJjjOR3fENb9c/buZXRVEUSLnEXSu3bgb+zCiWbUNZ9V6fd7HjlY
 Bu4GGNMUxLJk8W6WKWJZACa2agG1GAN4G6DxAjutQHEqQSg8j6AsDzDXY4nTkvkZ7FxG
 plyGLjJm4D+dHGsST2S5t08xEVJ/xB9AF92K6DorV1N5OWxZeGA5HU0nC8i9LxPC2Pay
 7sZwZToOOrwzG3EZDXAAHvvzqIgGGTNGUMNRW1K4VQ0vyFci1uyICsuR1SiSQ2yUXZQz
 Z7/VcPAoH+fSsLtTfZMcYHdPW3wdjpTB4RhnuwXWVUOF3taSnkRe/eVCrblCSO504UX1
 zqlw==
X-Gm-Message-State: ACgBeo3ZSMILZwD5Hxd1QCHRQD6CCn9yQWgnkl5HP7XrbNJVpfJtP2PE
 1gyakR1QNiKX2vGZmAHx8Aq7lU6hYn7Sog==
X-Google-Smtp-Source: AA6agR4WtDRKFvxvymwx3w32LtluTTTFekewx8ZjMg/4PuLOIpgoAbs4XUA74nQSaRwvD+4SBNsRCQ==
X-Received: by 2002:a17:903:2442:b0:16f:1319:d28c with SMTP id
 l2-20020a170903244200b0016f1319d28cmr5689522pls.95.1660879579602; 
 Thu, 18 Aug 2022 20:26:19 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 02/21] linux-user/hppa: Allocate page zero as a commpage
Date: Thu, 18 Aug 2022 20:25:56 -0700
Message-Id: <20220819032615.884847-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

We're about to start validating PAGE_EXEC, which means that we've
got to mark page zero executable.  We had been special casing this
entirely within translate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 3e3dc02499..29d910c4cc 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1646,6 +1646,34 @@ static inline void init_thread(struct target_pt_regs *regs,
     regs->gr[31] = infop->entry;
 }
 
+#define LO_COMMPAGE  0
+
+static bool init_guest_commpage(void)
+{
+    void *want = g2h_untagged(LO_COMMPAGE);
+    void *addr = mmap(want, qemu_host_page_size, PROT_NONE,
+                      MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
+
+    if (addr == MAP_FAILED) {
+        perror("Allocating guest commpage");
+        exit(EXIT_FAILURE);
+    }
+    if (addr != want) {
+        return false;
+    }
+
+    /*
+     * On Linux, page zero is normally marked execute only + gateway.
+     * Normal read or write is supposed to fail (thus PROT_NONE above),
+     * but specific offsets have kernel code mapped to raise permissions
+     * and implement syscalls.  Here, simply mark the page executable.
+     * Special case the entry points during translation (see do_page_zero).
+     */
+    page_set_flags(LO_COMMPAGE, LO_COMMPAGE + TARGET_PAGE_SIZE,
+                   PAGE_EXEC | PAGE_VALID);
+    return true;
+}
+
 #endif /* TARGET_HPPA */
 
 #ifdef TARGET_XTENSA
@@ -2326,12 +2354,12 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
 }
 
 #if defined(HI_COMMPAGE)
-#define LO_COMMPAGE 0
+#define LO_COMMPAGE -1
 #elif defined(LO_COMMPAGE)
 #define HI_COMMPAGE 0
 #else
 #define HI_COMMPAGE 0
-#define LO_COMMPAGE 0
+#define LO_COMMPAGE -1
 #define init_guest_commpage() true
 #endif
 
@@ -2555,7 +2583,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
         } else {
             offset = -(HI_COMMPAGE & -align);
         }
-    } else if (LO_COMMPAGE != 0) {
+    } else if (LO_COMMPAGE != -1) {
         loaddr = MIN(loaddr, LO_COMMPAGE & -align);
     }
 
-- 
2.34.1


