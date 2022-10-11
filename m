Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3D95FAB1B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:24:21 +0200 (CEST)
Received: from localhost ([::1]:43756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi5sS-0001my-GY
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nr-0002Mq-Lh
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:35 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nc-0002zP-Vu
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:34 -0400
Received: by mail-pj1-x1035.google.com with SMTP id b15so11375604pje.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sfKD/zCeIYRQKq3df3kFwiCr1YlgQpiKDEPmo1WYAa8=;
 b=Q4Kh+OfqNBXwng1azAIntY1pAvDIHMjnS2eC0EHHYt65A/Kf+28QHRAuE9SHWYKsUZ
 971fd0G1QiQjr1u/+O4OziUJDZRwGyVddapTadoeh2tbrJ2VmjEs2XH8YRtujbBw/Kwb
 jLgCmYoPtUgFkKCbSgZNK6gbYvzbXgb3N9pVME5yl9fPb2C3ljzj9EfR58EgcQW1LF2F
 f+Ad3x2+12ss248p6BT7qXRGlBCsH4EcMeY91Hh0YnC3Y3gkHEmNpHb7HrkV6BxWxQFu
 O9JQjfc5KYrgjZ/m36UPWIdHC6OfvMupzqDqAE4MqYacFQYgquYMOsvVSy18r5eMi95l
 E2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sfKD/zCeIYRQKq3df3kFwiCr1YlgQpiKDEPmo1WYAa8=;
 b=eRqYVYZ6uEPyrMVdIfh4pGWDmPZJvL2Sm7GX8XMNVw1aj0CqVRrh5ZojsN2uHfOskB
 xXM12BGfZym7p9WYJ+zP4o3UWlE4JrlI/Xkms2oDmFIZdkA0MoD+W0QQUyTkDldwCs6g
 +Ccvbtpouy7g/nHKrDnhe2LwjgQxsgrFixxu4Zq3HMMpIbh5MdN4KEgaarlWYvD15gTc
 xNjUeK2B1MpmWSN9oP5BwoBpz/cjChzKdxmHj0xBRtAmBTZRVlJcxWu76BrVbeU983u6
 mpE9n1UvhHR6vA7wEqJdqIYd06Km2zhQ+Ew1bWIk0kEuBiBish8jqzKQwp/HDP7qlgzQ
 +w+w==
X-Gm-Message-State: ACrzQf37Qb+NwAiRIcaaS0aQdUAvy2qlcGp/14/LyO3UqtXd09rT6Cmj
 9uvedO+NSmAsRUp5KjgHD0kOG2t+dsrDTg==
X-Google-Smtp-Source: AMsMyM6EaaO1NYOMM2fq+X3YFtGAur7UexzvFOJbhpJ3u102rETAg2mL4Q6fI0goeaGibjFHTNcFlw==
X-Received: by 2002:a17:902:f7cf:b0:17f:9081:a3f7 with SMTP id
 h15-20020a170902f7cf00b0017f9081a3f7mr21742207plw.3.1665458355565; 
 Mon, 10 Oct 2022 20:19:15 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 01/24] target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
Date: Mon, 10 Oct 2022 20:18:48 -0700
Message-Id: <20221011031911.2408754-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Copy attrs and shareability, into the TLB.  This will eventually
be used by S1_ptw_translate to report stage1 translation failures,
and by do_ats_write to fill in PAR_EL1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h  | 12 ++++++++++++
 target/arm/tlb_helper.c |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 08681828ac..38347b0d20 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -30,6 +30,18 @@
  */
 # define TARGET_PAGE_BITS_VARY
 # define TARGET_PAGE_BITS_MIN  10
+
+/*
+ * Cache the attrs and shareability fields from the page table entry.
+ *
+ * For ARMMMUIdx_Stage2*, pte_attrs is the S2 descriptor bits [5:2].
+ * Otherwise, pte_attrs is the same as the MAIR_EL1 8-bit format.
+ * For shareability, as in the SH field of the VMSAv8-64 PTEs.
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


