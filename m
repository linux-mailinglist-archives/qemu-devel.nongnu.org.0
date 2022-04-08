Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD364F9B28
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 18:57:52 +0200 (CEST)
Received: from localhost ([::1]:43400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncrvj-0001zv-Dp
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 12:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrsp-0008Dx-0w
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:54:51 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrsn-0003uE-BU
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:54:50 -0400
Received: by mail-ed1-x533.google.com with SMTP id r10so10746110eda.1
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/12QGg4Jo7kjR+PCLlJKZD8+ovapbNWGqrPOplat00=;
 b=LvR6ZJNoGESME2JakDF94tMpKKkCIzJ1zVKl0QvVcnHPHEZgW/WohecNmiTQh/pKZY
 0sodehDTqRtL4nZreFuJfG6Lu8JnqQpPiGQ+RSR0gvupBk29XzRItKiPJHL28lYwqcxL
 VxpwQtLiYQWeR//+GpUMhfSXMqk0JeiZ0NejeGdsMtW4lE3ouu3K+0VHD6PuY5KB9jYm
 cIXdLyTNGvbVCnWxGea7AHmsJgP0iZt58Wdb07Ns9lDDPrtmZj4+5t8tyEcd3kbOnW26
 Jciau6OuzbCMYxTJSiSP2kWPh84iAuV0ANHFDz6Bi0OHEoE5rU5+pfGssswhOxK1xXJJ
 IMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/12QGg4Jo7kjR+PCLlJKZD8+ovapbNWGqrPOplat00=;
 b=Iyjc0DCXPQpTYNma1q6c9f4ienNmdjf3j9f7ZUZDJKdkLyk+JLCOZPMRLeb8jMtP9M
 u+ko6kghJQDj7r+YEL42vMP5MB+V4mtTG29c4s6+avw+zdwqhzB3ZrOdWxM6IeC9arit
 adH1OxF1P1ZssR3iH2jratJgxwp1RtcWTUrUsweNpYKo1lPBkiEGUpDXLt5+kZxG2zEb
 uPo8raxBI3gC2is/ENsFyJGhp0qvFSm6SR8CF+0uqjUSkTug9019PF6U3Of5v0qxnhLG
 fjTSFTYQReHViLznBRsaVJeM757gacb3cI73zJKEmN05oUgl/Olf3CotFEV0Y8TNt/yz
 iWCQ==
X-Gm-Message-State: AOAM531BSoRyVBxrH0axt5GYgG1eE7BhrfB0M0wgCHZURIaCiAnO34I2
 tS8CzhrUBCxuf34NThJ3XiBTFQ==
X-Google-Smtp-Source: ABdhPJyjcbxUjuOZfZHuIw3FlzPr/CgOM8L0fwvC4wvmMa5x0msoq22XUv2XtWVl2qxj2H+Ww1fJfA==
X-Received: by 2002:a05:6402:42c6:b0:41c:ded2:6d5 with SMTP id
 i6-20020a05640242c600b0041cded206d5mr20671726edc.41.1649436888031; 
 Fri, 08 Apr 2022 09:54:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm8096427ejb.98.2022.04.08.09.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:54:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 06F221FFC2;
 Fri,  8 Apr 2022 17:47:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/15] accel/tcg: add tb_invalidate_phys_page_range
 tracepoint
Date: Fri,  8 Apr 2022 17:47:38 +0100
Message-Id: <20220408164742.2844631-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This gives a little more insight into what is going on as we
invalidate a range of TBs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 9 +++++++++
 accel/tcg/trace-events    | 1 +
 2 files changed, 10 insertions(+)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b0009177b9..625c46dd9b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1671,6 +1671,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
     TranslationBlock *tb;
     tb_page_addr_t tb_start, tb_end;
     int n;
+    int checked = 0, removed = 0;
 #ifdef TARGET_HAS_PRECISE_SMC
     CPUState *cpu = current_cpu;
     CPUArchState *env = NULL;
@@ -1695,6 +1696,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
        the code */
     PAGE_FOR_EACH_TB(p, tb, n) {
         assert_page_locked(p);
+        checked++;
         /* NOTE: this is subtle as a TB may span two physical pages */
         if (n == 0) {
             /* NOTE: tb_end may be after the end of the page, but
@@ -1728,13 +1730,20 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
             }
 #endif /* TARGET_HAS_PRECISE_SMC */
             tb_phys_invalidate__locked(tb);
+            removed++;
         }
     }
+
+
 #if !defined(CONFIG_USER_ONLY)
     /* if no code remaining, no need to continue to use slow writes */
     if (!p->first_tb) {
         invalidate_page_bitmap(p);
         tlb_unprotect_code(start);
+        trace_tb_invalidate_phys_page_range(checked, removed, 0);
+    } else {
+        TranslationBlock *tb = (TranslationBlock *) p->first_tb;
+        trace_tb_invalidate_phys_page_range(checked, removed, tb->pc);
     }
 #endif
 #ifdef TARGET_HAS_PRECISE_SMC
diff --git a/accel/tcg/trace-events b/accel/tcg/trace-events
index c034649dc2..fdc64e1423 100644
--- a/accel/tcg/trace-events
+++ b/accel/tcg/trace-events
@@ -15,5 +15,6 @@ memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
 
 # translate-all.c
 tb_phys_invalidate(void *tb, uintptr_t pc) "tb:%p, pc:0x%"PRIxPTR""
+tb_invalidate_phys_page_range(int checked, int removed, uintptr_t ftb_pc) "checked:%d removed:%d first_tb_pc:0x%"PRIxPTR""
 tb_invalidate_phys_page_fast(uint64_t page_start, int len, uint64_t ret, int wc, void *bmap) "addr:0x%" PRIx64 "/%d pc:0x%" PRIx64" wc:%d/%p"
 translate_block(void *tb, uintptr_t pc, const void *tb_code) "tb:%p, pc:0x%"PRIxPTR", tb_code:%p"
-- 
2.30.2


