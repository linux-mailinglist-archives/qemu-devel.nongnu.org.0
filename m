Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E7553BED
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:51:16 +0200 (CEST)
Received: from localhost ([::1]:52804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3kqB-00020I-Uc
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3km1-0006c5-Ed
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:57 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3klv-00015s-OM
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:56 -0400
Received: by mail-pf1-x42f.google.com with SMTP id n12so7226648pfq.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 13:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=umEK6S/Se+TnFpwCSFqpCewoOtCuj0w1ZzK12Mla/z8=;
 b=WKaVfkrdsqSPcent4ni6RsPHnU7+UaCMu7aov3WU8yhsIFhdpx4RHxb9vvMhq7Sltv
 GbyGkzLk+dY0OiDrGypLGksL8PXyMq5ZQuk9DWs2UQyztdl1pcmVFJcvWii1U6yuIQRQ
 7FlQpC1b312vbq5B4tAOymxPeGPkMJGZVzoa7ZJ9iKYv2NyhMRZVKyHAzc2nvsxkxGsz
 KWO/6ZDEoNB7apJnt9pQLKuNHGbJ3ciaXaPZ11vHgqfXNBZnMLt5YPDxSIiLImJbLEX4
 rtX12rWZZPKcmmK4klS70PkNLE5tOg8ER4XWAEcZb+GP0RZOyNq+/oOm+0acyny+8tuv
 KVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=umEK6S/Se+TnFpwCSFqpCewoOtCuj0w1ZzK12Mla/z8=;
 b=RYJGrYs2NhgMlDiGTjKfvf8Ja0T0iwDlybN8hA++cXQ3ODF838SayaQrGct4hdHOyn
 w0gdyfFkNSoZtfWH3yUYCOzR2zlfn95VQNvpAomj8TV6DQXNQfPV/PR4/88+iWTitTZD
 DItjYy7cPXzV2GJIb6maqVkQfNGs0VE9u761ZDiH7ccK1UEpZb3qvSgn6cwysOcPoY3F
 TR5U4ekB5LHJPLbMRWHIb6EqTllFLyRM1XC/eQpJMV3S5jG2ICP1ZY9fEiAlBNyo3PpK
 Jp38kwKWY8uMimwwpwrWDchI8fyeJsEoXoBk4cJt+YRtGJMkzitVfzRQMU7DxKHvnrKH
 193Q==
X-Gm-Message-State: AJIora+UjKvsmKQtmF/9IT52rd6tI05tDf9Slh6RDVMu/F8wkiWRR2g7
 1VjSki/kmcyy5nYbI7VgdvwzCr3w4rkoTw==
X-Google-Smtp-Source: AGRyM1u/W9rpJwW8dfpQZ0mzWPs+UegQvtl1roF2bvwJRaSJHZeUjJ0gr8y/1ncsJOEpdKzIyWqFEw==
X-Received: by 2002:a63:6943:0:b0:40c:3020:d0b with SMTP id
 e64-20020a636943000000b0040c30200d0bmr24956919pgc.34.1655844410193; 
 Tue, 21 Jun 2022 13:46:50 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a625b45000000b005252defb016sm3649674pfb.122.2022.06.21.13.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:46:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/9] softmmu: Always initialize xlat in
 address_space_translate_for_iotlb
Date: Tue, 21 Jun 2022 13:46:40 -0700
Message-Id: <20220621204643.371397-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621204643.371397-1-richard.henderson@linaro.org>
References: <20220621204643.371397-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

The bug is an uninitialized memory read, along the translate_fail
path, which results in garbage being read from iotlb_to_section,
which can lead to a crash in io_readx/io_writex.

The bug may be fixed by writing any value with zero
in ~TARGET_PAGE_MASK, so that the call to iotlb_to_section using
the xlat'ed address returns io_mem_unassigned, as desired by the
translate_fail path.

It is most useful to record the original physical page address,
which will eventually be logged by memory_region_access_valid
when the access is rejected by unassigned_mem_accepts.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1065
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220621153829.366423-1-richard.henderson@linaro.org>
---
 softmmu/physmem.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index fb16be57a6..dc3c3e5f2e 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -669,7 +669,7 @@ void tcg_iommu_init_notifier_list(CPUState *cpu)
 
 /* Called from RCU critical section */
 MemoryRegionSection *
-address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
+address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr orig_addr,
                                   hwaddr *xlat, hwaddr *plen,
                                   MemTxAttrs attrs, int *prot)
 {
@@ -678,6 +678,7 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
     IOMMUMemoryRegionClass *imrc;
     IOMMUTLBEntry iotlb;
     int iommu_idx;
+    hwaddr addr = orig_addr;
     AddressSpaceDispatch *d =
         qatomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
 
@@ -722,6 +723,16 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
     return section;
 
 translate_fail:
+    /*
+     * We should be given a page-aligned address -- certainly
+     * tlb_set_page_with_attrs() does so.  The page offset of xlat
+     * is used to index sections[], and PHYS_SECTION_UNASSIGNED = 0.
+     * The page portion of xlat will be logged by memory_region_access_valid()
+     * when this memory access is rejected, so use the original untranslated
+     * physical address.
+     */
+    assert((orig_addr & ~TARGET_PAGE_MASK) == 0);
+    *xlat = orig_addr;
     return &d->map.sections[PHYS_SECTION_UNASSIGNED];
 }
 
-- 
2.34.1


