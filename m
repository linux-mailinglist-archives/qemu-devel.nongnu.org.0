Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD995F4618
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:01:49 +0200 (CEST)
Received: from localhost ([::1]:40562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjQa-0004TF-LO
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidl-0002ud-4U
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:21 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:37421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidj-0004Ro-Gf
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:20 -0400
Received: by mail-pl1-x632.google.com with SMTP id d24so12782612pls.4
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ri8TJtGhCA+1GWqIBzEtqSJbIRN8JsEEU2ry8GkY8NY=;
 b=Ypov5ront313Ec9ltHrrfo9F052/gONBkKwrYY5XjD0FJp/vGZps6J4PKNr9USvca5
 hs5ozT+HHydwchVjP7Pfa0oZ8QTz+Q6tRsmHV/RVsa6C3V1k52jiE/AX6qFAHkCl9F4K
 lAb7RoWph582HO8Lyh+oMtXOL+R3q+MZa3aDD4EP07HaY4FUJHr2CZD5u46gtCLlsNuE
 Y5lPslbR14Tb/KmZJ9cHgJQZ/nNgGnaBmNC9s0eY01qt6q8DhQxnce7ElAO4zqOO6VXc
 s9pZAqCBn7kux5up83W0j5aYM71/HKBk5RnCD2nBotcfSu8DHQQDzBnNEKVDaV90J7A9
 HXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ri8TJtGhCA+1GWqIBzEtqSJbIRN8JsEEU2ry8GkY8NY=;
 b=nzdt3b4+NMQto+Teu/5CWPdB5EajI8Y1B/GRp8idRKhNSSUPuO5pR7hwaybkGt5r6M
 keEyPNTfM1TV3QAQY8vWxRvirBkLyKMlLkPOXA9iuD/DIuJLFCm6ScgPwbbKrihucBBb
 XUrz+WwKzQNg2w4EYoh52tUjmmaFKsq2L7PIPmPb7q/0+iBIgQM09ooYbEQp9Ybn5MTB
 7YYdka8ZsOWyorq9ARnayO7jE98LcwN7/ataFbxzJ0j80d1vSEgb0GWd3cb6mJ2NEpEo
 CLnwIQ35nO6PR0ePQr03S81Jw+41zSch7rS+UmE25GAlG2/bB+B34eyuaGQxUaXWiJ7a
 NHOg==
X-Gm-Message-State: ACrzQf364y4FPj9NuYHutJv2JZwWq6/olpY6xcbWPzkf0CFXEq3hnO4Z
 trC8MUwXQXyZta0f2pfzsu0zt3RInwQ1kg==
X-Google-Smtp-Source: AMsMyM658LhTAQ6hHyFWtPN0AKAkQY1Z56pvmZc8jw7ljZzUa4ienq3WbA++BhaDCCXGQpX4RFEuXw==
X-Received: by 2002:a17:903:11cc:b0:178:aec1:18c3 with SMTP id
 q12-20020a17090311cc00b00178aec118c3mr27485155plh.91.1664892678058; 
 Tue, 04 Oct 2022 07:11:18 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa79ae5000000b00561382a5a25sm1240357pfp.26.2022.10.04.07.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:11:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v7 14/18] accel/tcg: Inline tb_flush_jmp_cache
Date: Tue,  4 Oct 2022 07:10:47 -0700
Message-Id: <20221004141051.110653-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004141051.110653-1-richard.henderson@linaro.org>
References: <20221004141051.110653-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

This function has two users, who use it incompatibly.
In tlb_flush_page_by_mmuidx_async_0, when flushing a
single page, we need to flush exactly two pages.
In tlb_flush_range_by_mmuidx_async_0, when flushing a
range of pages, we need to flush N+1 pages.

This avoids double-flushing of jmp cache pages in a range.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a0db2d32a8..c7909fb619 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -107,14 +107,6 @@ static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
     }
 }
 
-static void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr)
-{
-    /* Discard jump cache entries for any tb which might potentially
-       overlap the flushed page.  */
-    tb_jmp_cache_clear_page(cpu, addr - TARGET_PAGE_SIZE);
-    tb_jmp_cache_clear_page(cpu, addr);
-}
-
 /**
  * tlb_mmu_resize_locked() - perform TLB resize bookkeeping; resize if necessary
  * @desc: The CPUTLBDesc portion of the TLB
@@ -541,7 +533,12 @@ static void tlb_flush_page_by_mmuidx_async_0(CPUState *cpu,
     }
     qemu_spin_unlock(&env_tlb(env)->c.lock);
 
-    tb_flush_jmp_cache(cpu, addr);
+    /*
+     * Discard jump cache entries for any tb which might potentially
+     * overlap the flushed page, which includes the previous.
+     */
+    tb_jmp_cache_clear_page(cpu, addr - TARGET_PAGE_SIZE);
+    tb_jmp_cache_clear_page(cpu, addr);
 }
 
 /**
@@ -792,8 +789,14 @@ static void tlb_flush_range_by_mmuidx_async_0(CPUState *cpu,
         return;
     }
 
-    for (target_ulong i = 0; i < d.len; i += TARGET_PAGE_SIZE) {
-        tb_flush_jmp_cache(cpu, d.addr + i);
+    /*
+     * Discard jump cache entries for any tb which might potentially
+     * overlap the flushed pages, which includes the previous.
+     */
+    d.addr -= TARGET_PAGE_SIZE;
+    for (target_ulong i = 0, n = d.len / TARGET_PAGE_SIZE + 1; i < n; i++) {
+        tb_jmp_cache_clear_page(cpu, d.addr);
+        d.addr += TARGET_PAGE_SIZE;
     }
 }
 
-- 
2.34.1


