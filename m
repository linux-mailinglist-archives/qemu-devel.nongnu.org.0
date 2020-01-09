Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CE31351AD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 03:58:17 +0100 (CET)
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipO1Y-0006SI-QG
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 21:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ipNt9-00037M-0G
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 21:49:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ipNt6-0006UC-W8
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 21:49:34 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38160)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ipNt6-0006SQ-Nr
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 21:49:32 -0500
Received: by mail-pl1-x642.google.com with SMTP id f20so1924843plj.5
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 18:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bI837W0qu61ZCvf0+RXhi7DDjyBjyOrHLVOGWGh4Vsw=;
 b=iIG46fRp5ogMZwkYU6WuosNs1OINhSRHQhTCR9vDcxL+xBJXTkPoX+uyWMziexP0l4
 9EkpqqqU69DPscWfYLa2EeeuVQMjftx6IVjmfiIIaW9aVfEooLfYU5li63N6zF1AsWIL
 76liK7RFPBG2oRM1/Iu5i92JYpPTC8SrBziSQVt6mbAdpn8XQioo0goqdB2EDwfI26F/
 GXeTsT9LmMT9Yi9b+gef/ohV19Yvl9qTKrhftH4d+UknHYFz63j+fTfQ44W8GE9a4Lfn
 9znMOZZvpMb6vL42PonCvvdwu2W1X72yZvn6qMHZW0GZIs3GikgofENjztnlZTEdsjEy
 t6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bI837W0qu61ZCvf0+RXhi7DDjyBjyOrHLVOGWGh4Vsw=;
 b=MVlUNEB1kuprsPBb+uFhEf5uOLCe7Vs3dgXtDIkpB7OG2XCCjaDGEM7Ll0QSfER1y0
 Nq/7AdQ/xrdrrXEAxLX0xiBoLcXItGe0jEFWK5YDubrds1CA98txJZQ3lw8j+IA+57o9
 ivPZRk7b2PeIZs8ChamzoSKWj8chGsSiJ38or3nPfZ3LDB0i+V/ljDaUhYAE4dVzT7Sm
 AeUXUf3MieX5W0WZqDjyI4lLuCWK2IG48kFSOqMTEP4DUx5Vd2+ugDMK13cV5Xrlgb08
 jy1c85/2RTQD+H4oKjg5WUSNmw9ZYZl1mzlNArQzRYr7v0sRp7h75sxAUbS1yLyJlK8J
 MLyg==
X-Gm-Message-State: APjAAAXRAW7gcs3RIMaXrfXFlGYc35cA7AtWnOzklanF4qE4LTBm/toV
 B/6PMMTD466xku9erTUDe7ORESpgqSTqtA==
X-Google-Smtp-Source: APXvYqyHP1IQLEA6CCkod6mdY9rvNUD7i9hhClVVfqN1PGuWVkL933E/ykEYvE1l4aqQ50uF0exGdw==
X-Received: by 2002:a17:902:7792:: with SMTP id
 o18mr8409379pll.31.1578538171454; 
 Wed, 08 Jan 2020 18:49:31 -0800 (PST)
Received: from localhost.localdomain (alanje.lnk.telstra.net.
 [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id b4sm5337844pfd.18.2020.01.08.18.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 18:49:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] cputlb: Initialize tlbs as flushed
Date: Thu,  9 Jan 2020 13:49:06 +1100
Message-Id: <20200109024907.2730-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109024907.2730-1-richard.henderson@linaro.org>
References: <20200109024907.2730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: alistair.francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's little point in leaving these data structures half initialized,
and relying on a flush to be done during reset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index c7c34b185b..761e9d44d7 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -240,6 +240,7 @@ static void tlb_mmu_init(CPUTLBDesc *desc, CPUTLBDescFast *fast, int64_t now)
     fast->mask = (n_entries - 1) << CPU_TLB_ENTRY_BITS;
     fast->table = g_new(CPUTLBEntry, n_entries);
     desc->iotlb = g_new(CPUIOTLBEntry, n_entries);
+    tlb_mmu_flush_locked(desc, fast);
 }
 
 static inline void tlb_n_used_entries_inc(CPUArchState *env, uintptr_t mmu_idx)
@@ -260,8 +261,8 @@ void tlb_init(CPUState *cpu)
 
     qemu_spin_init(&env_tlb(env)->c.lock);
 
-    /* Ensure that cpu_reset performs a full flush.  */
-    env_tlb(env)->c.dirty = ALL_MMUIDX_BITS;
+    /* All tlbs are initialized flushed. */
+    env_tlb(env)->c.dirty = 0;
 
     for (i = 0; i < NB_MMU_MODES; i++) {
         tlb_mmu_init(&env_tlb(env)->d[i], &env_tlb(env)->f[i], now);
-- 
2.20.1


