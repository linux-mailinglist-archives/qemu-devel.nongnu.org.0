Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFE0390516
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:18:41 +0200 (CEST)
Received: from localhost ([::1]:41804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYpM-0000tz-5Y
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYaw-000234-DU
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYat-0004AD-0W
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:46 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x7so13001136wrt.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uLIRf5J3Ym7Scxq5Iymo7fq/sx2o/GHaq6MdcPsXT24=;
 b=MGjx077f3Srf6+HCm5ZeU/MWKG1cMGfA4pNWsFr1x0YosR4ufDIqGdiEqqzrBjVc8I
 wt6Gb93scMfCcj09g9oFiOQuxX7ZP+641miDlJsxk4UVoiJl0M9f5N79y5ttzBslwBIv
 EQ3b8pQbXAlts2wwoNRFKjV9RaNyUv0Ybbv6/6ML91mRKWF+ZwxKZzTTG3/D7JSGRiNq
 MT9YuTWm+dwW6FTHLfZQdIgo+2Hk3n6BJKQd4Ml2oLu/6BznEeVyWpzkGUKYqD6T/we1
 d85FBFkUOkbELRxVJ8hydVp4SFbgK24vDo0Qm1N9bYDEsQyBfklRhoWfhDFqiGRbHMEX
 eYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uLIRf5J3Ym7Scxq5Iymo7fq/sx2o/GHaq6MdcPsXT24=;
 b=U3EaYDTae57x5ttJvUOOBDu6CkCj6wzhMR0MtBVvvKU9wy0c05kzQonQ6p8T51MuXn
 aq9d5qnWMA/Va+NYQrAgxE8LiV6gSaZcIRnhtYMYQaNMIvOtFPSWpe5ZcGED4QPz6/O1
 2tOCmulTKyXX0vtay4VoORahK32hWeXejbYyV00Cfw0gKYnbqoq4UbMApl43f2IIEsmW
 DFio4BJtLhSXAV8y10pG2zKjS5+mSY4IuKMtpqTJBoBbaXEDhTb4TjR5uZTe/nGi2LOO
 cxsU8Y29imiAvKUV1PBfA3TYDtXm9ZxHkN9SwnlgX0ysJPVlW0Py3fFv3lhUsThF9I0B
 Xc4w==
X-Gm-Message-State: AOAM531W5KBFEJ77mFpYPBwmKs9KuUixa/ucsiC/EBOZ2buJD+9VXJGo
 119AtcnPp4B5MJH+r9k9ZdUy6ONpGYnQEFlS
X-Google-Smtp-Source: ABdhPJxWXjpAMfSLhpHuUxH0rROoQ+Qkw9A7HLyLNsUtoXtuDftM8l9Jqd3mOcd98LxSavJYoZVUbQ==
X-Received: by 2002:adf:e109:: with SMTP id t9mr2946642wrz.372.1621955021551; 
 Tue, 25 May 2021 08:03:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 014/114] accel/tcg: Add tlb_flush_range_by_mmuidx()
Date: Tue, 25 May 2021 16:01:44 +0100
Message-Id: <20210525150324.32370-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Forward tlb_flush_page_bits_by_mmuidx to tlb_flush_range_by_mmuidx
passing TARGET_PAGE_SIZE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210509151618.2331764-5-f4bug@amsat.org
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/exec-all.h | 19 +++++++++++++++++++
 accel/tcg/cputlb.c      | 20 +++++++++++++++-----
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6b036cae8f6..5a5f6d4c1a8 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -262,6 +262,20 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
 void tlb_flush_page_bits_by_mmuidx_all_cpus_synced
     (CPUState *cpu, target_ulong addr, uint16_t idxmap, unsigned bits);
 
+/**
+ * tlb_flush_range_by_mmuidx
+ * @cpu: CPU whose TLB should be flushed
+ * @addr: virtual address of the start of the range to be flushed
+ * @len: length of range to be flushed
+ * @idxmap: bitmap of mmu indexes to flush
+ * @bits: number of significant bits in address
+ *
+ * For each mmuidx in @idxmap, flush all pages within [@addr,@addr+@len),
+ * comparing only the low @bits worth of each virtual page.
+ */
+void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                               target_ulong len, uint16_t idxmap,
+                               unsigned bits);
 /**
  * tlb_set_page_with_attrs:
  * @cpu: CPU to add this TLB entry for
@@ -365,6 +379,11 @@ tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *cpu, target_ulong addr,
                                               uint16_t idxmap, unsigned bits)
 {
 }
+static inline void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                             target_ulong len, uint16_t idxmap,
+                                             unsigned bits)
+{
+}
 #endif
 /**
  * probe_access:
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a49a72b035e..464e7445916 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -797,13 +797,17 @@ static void tlb_flush_page_bits_by_mmuidx_async_2(CPUState *cpu,
     g_free(d);
 }
 
-void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
-                                   uint16_t idxmap, unsigned bits)
+void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                               target_ulong len, uint16_t idxmap,
+                               unsigned bits)
 {
     TLBFlushRangeData d;
 
-    /* If all bits are significant, this devolves to tlb_flush_page. */
-    if (bits >= TARGET_LONG_BITS) {
+    /*
+     * If all bits are significant, and len is small,
+     * this devolves to tlb_flush_page.
+     */
+    if (bits >= TARGET_LONG_BITS && len <= TARGET_PAGE_SIZE) {
         tlb_flush_page_by_mmuidx(cpu, addr, idxmap);
         return;
     }
@@ -815,7 +819,7 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
 
     /* This should already be page aligned */
     d.addr = addr & TARGET_PAGE_MASK;
-    d.len = TARGET_PAGE_SIZE;
+    d.len = len;
     d.idxmap = idxmap;
     d.bits = bits;
 
@@ -829,6 +833,12 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
     }
 }
 
+void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                   uint16_t idxmap, unsigned bits)
+{
+    tlb_flush_range_by_mmuidx(cpu, addr, TARGET_PAGE_SIZE, idxmap, bits);
+}
+
 void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
                                             target_ulong addr,
                                             uint16_t idxmap,
-- 
2.20.1


