Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58AE553650
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:40:19 +0200 (CEST)
Received: from localhost ([::1]:35644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fzG-0001ft-Cu
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3fxb-0000xf-7o
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:38:35 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3fxZ-0008Pe-EM
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:38:34 -0400
Received: by mail-pf1-x434.google.com with SMTP id t21so7178795pfq.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M+89tABNyT2OspjFodj1LfU6YISgFJjKUc6Cd2CxEco=;
 b=ubXmR85SEBK6q4rSfORCER/Tv/tEEJeszhfX9/RkOUKersDA+jJNT9aDlzG7ws/Nzc
 YwdCYYt9Eg1tcEIKo0aYeK5tQ1o1D1bZHDPO1qxuwOymnRgfs9NDYKH2erKdkUb4Sphl
 qKtxkU4wLD7qBbpH2rbc645b+YOw1r7n1ZHV12OnQYUOV4EqSlHL9udak7Tf6cp2/iiN
 QPfWaaVoyz8Nl0U2wYY3gcOucrrA342w/aTULwjJFBIoPj1SEL5seT7rQauM9D3LO//O
 Rd6KmgKAhSQOCeZMf15Nqfu5nCq1KWYuemVQS+BdclKqzL0YxQNUwu3CnZUcQMvR8AGH
 KmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M+89tABNyT2OspjFodj1LfU6YISgFJjKUc6Cd2CxEco=;
 b=j6Ml5GyoI/A0xeRYYKGKlXjkZRLh+AJ1k+kujAMC/JtjFdgZYyuQFQ2C4QrVAv97RV
 Q1p28SLcZLlFHB5TojMUbwrzFA/p0YMGwPdBKTyaG/8dRj4TFELejKddZE6UFb15J/pD
 LoNylYKUuGM214qppGxaNxfbEaoMROwKGqbfodfiJdWz0P5FxdJ5QSLenecIN4QHwQBJ
 nPLa5rSTe2Fv7CZzCKZOTSrf8ztSfKqO/auThCRRumdf3B+Q/RbbFa5U9bhPMLAB67kS
 1yD1TObn79PDXMlgEhpjpYP9e8isf4ZEoDS0XyN+UDXM2h5XYYUpjGGPynFIR07urCxh
 TcLw==
X-Gm-Message-State: AJIora+0lqFA0pQsqklCa9U7uEN7qCBInTLItsCwkhjyNWtEDA++kNHp
 raCEadC7FOExa1s/To2jgZFKVHJ9+WJlBw==
X-Google-Smtp-Source: AGRyM1urIsbZdgxiNx3YIvlEwdpuEitDBlHeRohvxh6yz4ZDZXHTR2pKquaFGcnMTcPB3w463z2vkQ==
X-Received: by 2002:a05:6a00:218c:b0:51c:c64:3f6a with SMTP id
 h12-20020a056a00218c00b0051c0c643f6amr30307951pfi.50.1655825910862; 
 Tue, 21 Jun 2022 08:38:30 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a63921a000000b00408a3724b38sm11299764pgd.76.2022.06.21.08.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 08:38:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH v2] softmmu: Always initialize xlat in
 address_space_translate_for_iotlb
Date: Tue, 21 Jun 2022 08:38:29 -0700
Message-Id: <20220621153829.366423-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
---
v2: Move the assignment to xlat down to translate_fail,
    add an assertion that the page offset is 0.
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


