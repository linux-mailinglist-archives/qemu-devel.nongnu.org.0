Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B014390522
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:20:56 +0200 (CEST)
Received: from localhost ([::1]:49798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYrX-0006PI-CT
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYaz-0002Di-8g
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:49 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYat-0004Al-Mr
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:48 -0400
Received: by mail-wr1-x432.google.com with SMTP id q5so32587396wrs.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BKNNRroOLH6etU4+XRZlB+DGD40CljSq3//Lcw05B7c=;
 b=xs13r2B6LeKgDEO0cZWBmbxkwICYH1IHmDbmEKgBqL3wr2fI9p+O5/snI10cHvkuFI
 tyGSkeE/PoZJo9ZaoCgccPu2LS4cYKtjJrvjuSlIq0t+XYn2HMMSh0JgptJaMmUM9mmC
 Y8PLqih5leDTA5d684fn25hWpHjksQYgfLMO6ttlyJmLxY/VSTs9rwuziKOO8hjpcoXc
 Qiu8w6odZkIzVNY5ldnd+m2tJ+Lo83L0tGVQ6hNf4R2cnn1ux9Brpm4wd87/tk9fsnxH
 NYVmU/ywNIUtMg8vNeqFfEWzMEtyvKDfRgdAcieyMBZavZK0DyjJaARhDDn9NBGhkItZ
 KKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BKNNRroOLH6etU4+XRZlB+DGD40CljSq3//Lcw05B7c=;
 b=CbH2PPKGbr2EzxDNDK/jNeJdjVc6MBy3geOh2rq6hWIx7HKw65WJ7UNLw2L8QpsUn0
 VVEFAuYLjAMbjknELaxO/1IUhn7Kk0v/mq2XUbLDPOnXGmJQ+1zChqJBPKfaO3wJJ6pY
 cBn1BgI+tT8cDE9vtsgdMRUPjP+XmiBurRwqCLPMZX/cT1p+wMigwkddVJrKhTDbArDn
 aah/HBNM5oxOaBIQnSnsQOGsVs2ud4jxiOBeJ+W5/eAM+3fE7KmeZiwFiOOTTagHS07s
 cPiXcjNpQEO+9y2pSyKvoHeEdnu8uwdvEln6hXGt9bMIQMIAVa9Eu6fawjO2MHmJ163t
 SbnQ==
X-Gm-Message-State: AOAM532SpjNGfGjB/8GEzNR/4ztB6i+mvEIAJmPs0jepW70bNr84UazI
 7/iV8/K25GMaSGh4jMC4NwlELRNJZWHZbjQF
X-Google-Smtp-Source: ABdhPJz7HjoOoyq//SGvf0xaXXV7S/+UzSgUn9YlqDsYP+9RqQG/pLH+1xNde47bzGtDn6ac48cliA==
X-Received: by 2002:a5d:64a6:: with SMTP id m6mr28134746wrp.425.1621955022304; 
 Tue, 25 May 2021 08:03:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 015/114] accel/tcg: Add tlb_flush_range_by_mmuidx_all_cpus()
Date: Tue, 25 May 2021 16:01:45 +0100
Message-Id: <20210525150324.32370-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Forward tlb_flush_page_bits_by_mmuidx_all_cpus to
tlb_flush_range_by_mmuidx_all_cpus passing TARGET_PAGE_SIZE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210509151618.2331764-6-f4bug@amsat.org
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/exec-all.h | 13 +++++++++++++
 accel/tcg/cputlb.c      | 24 +++++++++++++++++-------
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 5a5f6d4c1a8..9a3dbb7ec08 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -276,6 +276,12 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced
 void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
                                target_ulong len, uint16_t idxmap,
                                unsigned bits);
+
+/* Similarly, with broadcast and syncing. */
+void tlb_flush_range_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
+                                        target_ulong len, uint16_t idxmap,
+                                        unsigned bits);
+
 /**
  * tlb_set_page_with_attrs:
  * @cpu: CPU to add this TLB entry for
@@ -384,6 +390,13 @@ static inline void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
                                              unsigned bits)
 {
 }
+static inline void tlb_flush_range_by_mmuidx_all_cpus(CPUState *cpu,
+                                                      target_ulong addr,
+                                                      target_ulong len,
+                                                      uint16_t idxmap,
+                                                      unsigned bits)
+{
+}
 #endif
 /**
  * probe_access:
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 464e7445916..a63cf187a4f 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -839,16 +839,18 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
     tlb_flush_range_by_mmuidx(cpu, addr, TARGET_PAGE_SIZE, idxmap, bits);
 }
 
-void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
-                                            target_ulong addr,
-                                            uint16_t idxmap,
-                                            unsigned bits)
+void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
+                                        target_ulong addr, target_ulong len,
+                                        uint16_t idxmap, unsigned bits)
 {
     TLBFlushRangeData d;
     CPUState *dst_cpu;
 
-    /* If all bits are significant, this devolves to tlb_flush_page. */
-    if (bits >= TARGET_LONG_BITS) {
+    /*
+     * If all bits are significant, and len is small,
+     * this devolves to tlb_flush_page.
+     */
+    if (bits >= TARGET_LONG_BITS && len <= TARGET_PAGE_SIZE) {
         tlb_flush_page_by_mmuidx_all_cpus(src_cpu, addr, idxmap);
         return;
     }
@@ -860,7 +862,7 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
 
     /* This should already be page aligned */
     d.addr = addr & TARGET_PAGE_MASK;
-    d.len = TARGET_PAGE_SIZE;
+    d.len = len;
     d.idxmap = idxmap;
     d.bits = bits;
 
@@ -877,6 +879,14 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
     tlb_flush_page_bits_by_mmuidx_async_0(src_cpu, d);
 }
 
+void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
+                                            target_ulong addr,
+                                            uint16_t idxmap, unsigned bits)
+{
+    tlb_flush_range_by_mmuidx_all_cpus(src_cpu, addr, TARGET_PAGE_SIZE,
+                                       idxmap, bits);
+}
+
 void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
                                                    target_ulong addr,
                                                    uint16_t idxmap,
-- 
2.20.1


