Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA03A5F4A44
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:25:02 +0200 (CEST)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofoTN-0004H7-7M
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyO-0001xU-Br
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:53:00 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:44723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyM-0000Hc-Iz
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:53:00 -0400
Received: by mail-pf1-x42d.google.com with SMTP id v186so14021673pfv.11
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ri8TJtGhCA+1GWqIBzEtqSJbIRN8JsEEU2ry8GkY8NY=;
 b=DgYtTlCz3UIi5CoIdiD5K7+ZuBANtvf8w94/qo9sEaOsOwayc22kniAljAbm4RJxOP
 RR2di88C+GBgJOVEwmi5jRT2LQ9fxVM24NhaOIRpTCIJkCzXe5g6tFU0RZ/FnPD+9Bft
 l8EiDR4xRxkDleajYVSlHcXPSyqlNhWXSPYa43rLYfrqdS0YGy3L/j5YNKhBGNnq3cwn
 h+GUmvXx8ONEyOjNf8GT0Y5aJ7vtsjdzkGVKa29t9Qa+ZxHL7qyjDx6FRi7y+gCOjFJj
 xYkSlIo6scxMRMFap9OMBIRdTle8LZhF3eO0rkjZVS6N/V52Rt5R+NURABvo0YSclzrA
 Mbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ri8TJtGhCA+1GWqIBzEtqSJbIRN8JsEEU2ry8GkY8NY=;
 b=TEwwFg7U9W6U7IukNAewdW7ef1tNg3A/TIrSDPEe4hODJ5xbB1aSDBkjdL+ddGRJUT
 nXDtNcjP4e9UNJSmvAjBIyX9bNPaz/mfM5zENiZjs/2MWtN/VjGx7RvCxPsxRSha3psb
 qja9r4bLt4LesIFm+c8UMs4aSpbBUtr1GJAZ2Swr2Nb3DnlKi5WFFvjwSBuAgT/jfWXL
 L73CCPj9wVk93IJJsBZnQoPt1jbOSzLhcDMKzy/bByh7iMHCa5zI5XRmRS60iUc3qKaf
 tSUVEdOv6InJ8/tVRHYGYwhYXzeO61nuTwIcbWEGaO6+jiXA1SIQIqNJG+GFF9T3RIsi
 xn6g==
X-Gm-Message-State: ACrzQf2oF1qLRDyhmLE+NsAH8k5qcW6wuHIutA7v7kLBOoKQJvtIQiA6
 pZ0oKtMof3XHKN6pGdJzD8JqfRCVaRYMEA==
X-Google-Smtp-Source: AMsMyM5m0tAIHhj66gk6RW1hqv2H4gMnASiClE0UJu1rhSQIvWd61ymliEaH9EZEtYFdCXEvIDf5/w==
X-Received: by 2002:a63:4a1e:0:b0:438:fa59:c0f3 with SMTP id
 x30-20020a634a1e000000b00438fa59c0f3mr23911615pga.107.1664913177293; 
 Tue, 04 Oct 2022 12:52:57 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:52:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 14/20] accel/tcg: Inline tb_flush_jmp_cache
Date: Tue,  4 Oct 2022 12:52:35 -0700
Message-Id: <20221004195241.46491-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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


