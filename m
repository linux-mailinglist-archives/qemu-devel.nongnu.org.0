Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B3E5F1DF5
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:57:55 +0200 (CEST)
Received: from localhost ([::1]:50748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefoI-0006yF-8B
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHl-0006y7-GI
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:17 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHj-0006F8-1h
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:16 -0400
Received: by mail-qk1-x729.google.com with SMTP id g2so4549116qkk.1
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Ue9Nl0D44aZHstGkTsjwRG+rtSs9n3MbvqWOGp6wdbM=;
 b=V4GNfkahZI+n5FLCJ4JJehf9MHqoVFM1H9B45TSFxJpg3iKrJbqbHDfB82xbHbMGum
 EMF1JAFBNg0cg887Scb5FhQNohpUyXzBSzFRJG33GoYOqOlTCZLVjp0Y9lmFqiaur03C
 fqOCJiKMB0U9N8hBS74hz87DBz789ujSSr3NFSoPQXmh/00DBt2PY8+RuAqm8FMy8D+a
 ft6JTaFlAdwaeScjjeR01Rxq7uQDOaSJuXltWP9Bh5IjqpXaTcD6PdJ4kUKMokgMg38U
 Faiq0u+O6maan2RGqn5rAfvgeeztPTouWsg1QX6aPE2Si+q7KuMXM9zJvtvQWDetUKA0
 c6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ue9Nl0D44aZHstGkTsjwRG+rtSs9n3MbvqWOGp6wdbM=;
 b=zD9SluN28mm6OASuFQ4bcZYsoUB4WVFPughf3lvJWJkfDAVbdy+RuwM0yPAUIkz7A/
 hROsifP1y8LN1D+rZ4P3zl9q52NcruuptSRIEIKNbdlkHCBZNQvM9XozY+ubT+OBhsC8
 PHjkbLdcH/oHG7NNDnA4qV91BcIADsd4h55jrOFNAQvygWuEMXfKA0pTMXlbFnLzQYb5
 d22c83TVfTZmQkBloNy5bi968y/kglj1VvvoAIrsLZXgdcTb/fo6YlmqmgoI0cgfh1tq
 xWFi5EHchGBZxxv6TrtBg1ACVTHBbhfr7SqdnRHEsyexRjiEWAuU9nv0PIAsst2P3LiI
 4Xgg==
X-Gm-Message-State: ACrzQf0Xkocp50WCvtQ9o3ofOicadAGfvkcAt+HdvbS+vXF/uQXUnMeC
 CO7KyooHJbrf8/oe5I6h/l582piZCXrcjg==
X-Google-Smtp-Source: AMsMyM7DLin52W4mHlBDXtEXGoUHprLie5YzmQHXsukNB+899No0wb63LaT9HzOn4v1/p+1NyfxD3w==
X-Received: by 2002:a37:c443:0:b0:6ce:191a:bb60 with SMTP id
 h3-20020a37c443000000b006ce191abb60mr9578844qkm.53.1664641454395; 
 Sat, 01 Oct 2022 09:24:14 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 21/42] target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
Date: Sat,  1 Oct 2022 09:22:57 -0700
Message-Id: <20221001162318.153420-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy attrs and sharability, into the TLB.  This will eventually
be used by S1_ptw_translate to report stage1 translation failures,
and by do_ats_write to fill in PAR_EL1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h  | 8 ++++++++
 target/arm/tlb_helper.c | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 08681828ac..118ca0e5c0 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -30,6 +30,14 @@
  */
 # define TARGET_PAGE_BITS_VARY
 # define TARGET_PAGE_BITS_MIN  10
+
+/*
+ * Cache the attrs and sharability fields from the page table entry.
+ */
+# define TARGET_PAGE_ENTRY_EXTRA  \
+     uint8_t pte_attrs;           \
+     uint8_t shareability;
+
 #endif
 
 #define NB_MMU_MODES 8
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 49601394ec..353edbeb1d 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -236,6 +236,9 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             arm_tlb_mte_tagged(&res.f.attrs) = true;
         }
 
+        res.f.pte_attrs = res.cacheattrs.attrs;
+        res.f.shareability = res.cacheattrs.shareability;
+
         tlb_set_page_full(cs, mmu_idx, address, &res.f);
         return true;
     } else if (probe) {
-- 
2.34.1


