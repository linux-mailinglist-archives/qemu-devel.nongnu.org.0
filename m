Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB31308178
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:53:06 +0100 (CET)
Received: from localhost ([::1]:39606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5G9x-0007Pq-N7
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzj-0005wx-Pi
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:31 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzY-0008Ec-DM
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:31 -0500
Received: by mail-pf1-x429.google.com with SMTP id w18so4960037pfu.9
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e1dRDYwqVg1e/BMj2WtrxEnKh4CuzKOtBUsWpusVo1U=;
 b=tmfppZMSi7Qvg1Q7kSJSlx3wyx9mWoyviMMsIif91ecLr63eAXl45+u1M6hDJVnQ4t
 aln135FYKoO2MpQf3fUTmZnSU6rjyFvQiFk/WilIMvH+xO45pgLG5j645PaUCi4kPmwS
 Kz4Fa8imvell8vzScr22wixo/AC0FYrLLynDtdew6M1wSyr5bpQqjmc2V+1olmeDmWq+
 nCb4vSlvTnKKBIuUapw+sbtswnX9zzmJcBDM4U1d+BlJO92IbXTd9baEvWiBT3RXKLvm
 c1FVw0uw22lxU87MsfhivOvdvxRthJTmBm3Gf5rzWJM+echqhUa1pCQpCqxLJTw8ouuG
 cJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e1dRDYwqVg1e/BMj2WtrxEnKh4CuzKOtBUsWpusVo1U=;
 b=TigqWyqKv2At0fYbSYBI+qNZEr1g5TOXemCNshyqC22xPjXOJO8Ljhy5H7ubY1bfGd
 18FriM6LzhacLlllaNa25mG2NTMF+a/j+QT80Zr0RdRei12gdtTSk7AaVNfxJbzI3dGR
 TjjOgH0LpPfzSvTeuNtyDpsotjzwXNhHthxetMX2UvENSnW3OhS0fVTFLhOhUg8Gfnk9
 aHgSoqDc48lCXoVX/e1SPlJ+g2Is6Jr5qBGh/KxpyvLaH7mPWBtevs27cNART9+cEuXI
 I0TKc1/6FAwlpJSg30HlJGLmsKsiXhxHeJRdkPuY2G9fo7DZ7znufYztEI6CZ+IVOiDk
 aD7g==
X-Gm-Message-State: AOAM533oZTVPcv/lF4bxbn0qxEDJP+zk2JFgF4sG2ekt9zXPiVB9Vs57
 Mll8KLXBU1og2GWr17qji1Sslc+oybEmvva8
X-Google-Smtp-Source: ABdhPJwL7SHiRJrTyjXRrtieF9X29olC9MHpJTrQzfCEINvQMPiDWvx3HozSorDqQ0ynf9Ws922D9w==
X-Received: by 2002:a62:5505:0:b029:1c9:2c59:b1ff with SMTP id
 j5-20020a6255050000b02901c92c59b1ffmr1338254pfb.69.1611873739252; 
 Thu, 28 Jan 2021 14:42:19 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/23] target/arm: Add allocation tag storage for user mode
Date: Thu, 28 Jan 2021 12:41:39 -1000
Message-Id: <20210128224141.638790-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the now-saved PAGE_ANON and PAGE_MTE bits,
and the per-page saved data.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index d55f8d1e1e..1c569336ea 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -78,8 +78,33 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
                                    int tag_size, uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
-    /* Tag storage not implemented.  */
-    return NULL;
+    uint64_t clean_ptr = useronly_clean_ptr(ptr);
+    int flags = page_get_flags(clean_ptr);
+    uint8_t *tags;
+    uintptr_t index;
+
+    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE : PAGE_READ))) {
+        /* SIGSEGV */
+        arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
+                         ptr_mmu_idx, false, ra);
+        g_assert_not_reached();
+    }
+
+    /* Require both MAP_ANON and PROT_MTE for the page. */
+    if (!(flags & PAGE_ANON) || !(flags & PAGE_MTE)) {
+        return NULL;
+    }
+
+    tags = page_get_target_data(clean_ptr);
+    if (tags == NULL) {
+        size_t alloc_size = TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1);
+        tags = page_alloc_target_data(clean_ptr, alloc_size);
+        assert(tags != NULL);
+    }
+
+    index = extract32(ptr, LOG2_TAG_GRANULE + 1,
+                      TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
+    return tags + index;
 #else
     uintptr_t index;
     CPUIOTLBEntry *iotlbentry;
-- 
2.25.1


