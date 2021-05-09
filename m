Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46F7377748
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:23:11 +0200 (CEST)
Received: from localhost ([::1]:41058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflGw-0001K2-Rb
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAm-0005U1-QI
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:49 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAj-0005SH-Rn
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:47 -0400
Received: by mail-wr1-x436.google.com with SMTP id s8so14004061wrw.10
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 08:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WpEIET5avNp5KZjyRvTu4qLmWgl4dBFVdIzDBPUWftg=;
 b=vRKKEa0fUWEqVwLRbt5VkXQfjSz6OwRvehXLGRN56roA4NKwb3cY8Nt3YbqG5QgRUI
 wk+t8lS6FCnyhq+c+jyf7CYbCiXvn0Um7lCBcWZfqELJZEnJOYDs17ehGOHT8v8h0Lb5
 q8odlwWfCaHMA/hmN9pJEynjhuaUxtsyMzAiTxTlGG97W17g3Y94a7Gb+b9QhsVui9Em
 KlP2bMWM0W8aC4GCQcnJPbdaHU6ZfHpxWVX/cWnp4SKjhow82UTs/cB5CkvXZ9IvrNIu
 DKdjZQnsIGCp7gk0haGNSuqDruUrDe6HXFEDzCVA6hjX5nNpbx9iAbCEcjiEwBonBIy1
 mrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WpEIET5avNp5KZjyRvTu4qLmWgl4dBFVdIzDBPUWftg=;
 b=XzIajAS065c1DoIjaadCjSrzG3fVk4Q26taLuvOviMrxKyM1C93Z8fmLYO95pF3UHq
 YHiSHcKt4KanF/ncRAKuikhIuxryn/w32k9NjlO2S0kDUBvejp79LfkNnV3/JazuxQM/
 Uo9lywtcE2vppMDekartzlV2xwPoImSCV2/g4+1t2cDIMWIQwk74CZdu3/Nsm3KDBWqW
 wq5QMhnqAWXoAmOTXmeFvJQ0ZFQwDVU8etjR/uf1BVHNo4U1RSRE+849bP87GH8f+4Pv
 f4Y9pf+l28IcgwISLEzxDsqvpEhbgGFwUvJqVo5hzC3zOHd4XLxqy//3RKNAATQ9SXX6
 37wg==
X-Gm-Message-State: AOAM530c2NmP66Q9UD9um8Xnf6KbenN0QCG8FCvOkPt2TFlzQKQlVYd/
 bTlzPlW6iUSfjM8T/XHxaAbDAeQangJan8/W
X-Google-Smtp-Source: ABdhPJzzZAL2W88pXaVOlXsJR2OgyuytPNkP1q2qnafzmj8LOc9xd6ck6t4eIKx8H8UcHRWkQ+zoyg==
X-Received: by 2002:a5d:408f:: with SMTP id o15mr24810553wrp.89.1620573404396; 
 Sun, 09 May 2021 08:16:44 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p17sm18570283wru.1.2021.05.09.08.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 08:16:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] accel/tcg: Add tlb_flush_page_bits_by_mmuidx_all_cpus()
Date: Sun,  9 May 2021 17:16:14 +0200
Message-Id: <20210509151618.2331764-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210509151618.2331764-1-f4bug@amsat.org>
References: <20210509151618.2331764-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 16924ceb777..5314349ef9d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -870,16 +870,18 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
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
     run_on_cpu_data runon;
 
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
@@ -891,7 +893,7 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
 
     /* This should already be page aligned */
     d.addr = addr & TARGET_PAGE_MASK;
-    d.len = TARGET_PAGE_SIZE;
+    d.len = len;
     d.idxmap = idxmap;
     d.bits = bits;
 
@@ -914,6 +916,14 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
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
2.26.3


