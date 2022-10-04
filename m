Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8FC5F4A30
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:13:23 +0200 (CEST)
Received: from localhost ([::1]:33536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofoI6-0007Gc-7X
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyM-0001rB-Hx
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:58 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:35421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyJ-0000HH-Ow
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:58 -0400
Received: by mail-pf1-x42e.google.com with SMTP id i6so14043517pfb.2
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cLUCkFTb6+JnLlWzn7HnttSYfDBpIhciH0RgPU16KNQ=;
 b=o4mhEith8a9Amqr4WBxp4Mw/ryCl/lgfEXyPE6p2dGPqODJKVz6Zy4Sk0V8HJW24gn
 pz+0MCEMtIKsFqrYU6wViwm20J31xt58dIkbaw0eHtnPSh1PNZbvyCCz+Ezn460mtCKs
 Hf02F2p6v5non2QZXlwlkBRguStoQ1if/frt38kFp+H7CVCfkzJGqIkvJAZPPNZVtWD8
 WpP/uez3k3VzhAk4DO8y4Oyh772HtAIcbdRNEZpZgyQKeCHLmZxo1g8hsaxA9VD1ZEw9
 C1cRZz6cYWxxPZKtbDFdwHkMH36FFc1o+Bzqv8n8LKlRij4Xx3eLiKkg9XDGBfcg5xS/
 Re8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cLUCkFTb6+JnLlWzn7HnttSYfDBpIhciH0RgPU16KNQ=;
 b=clw8YwupA1Vy3AQFcZXGxZ00oDpCeADicnxzT2eHUiTTOBlRyDH7oml5rjrYiC4Y3p
 noBOD2fjHOgpTsXYXPsbzdYQejwAXxH9020TzPWrRUUJDNcwMv5V8HeMP4h1LpxIBc/h
 /QHMvEsf68Ne9n2hhxvioDbQzLQAhnyjIatdALfbdhWUmwt9zEl0mnU1hfrW8cuIeaMm
 KtekaAjYbcA9tXQnK3KIclTg4dUpxr/f/UP/ifbEkyjTg3N95Ad+rmMnpTIYeSOKBrUd
 OpQF7UH3QO1+Y9HNHKEb7yuQHZWjy6hLg54EvSCSPWynY7J+86ZnmYmYA43BprZBc7ce
 X1fw==
X-Gm-Message-State: ACrzQf3g7GjmtDz54Bs6Pp8Fp7mT+PKLAR4V8LYxxisS3byMR+AaM6AU
 azHHLYVfabHkeVV/Japnr66HQZUxLU68Ng==
X-Google-Smtp-Source: AMsMyM7FaXe8W1tJzNa6VshVMlzaKwQdPVSs2kajASgSgOh2JIC/D9qb1cgClNj0i35C2+b+0qKXgw==
X-Received: by 2002:a62:ee17:0:b0:55b:b0d:bc9f with SMTP id
 e23-20020a62ee17000000b0055b0b0dbc9fmr26946604pfi.39.1664913174178; 
 Tue, 04 Oct 2022 12:52:54 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:52:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 11/20] accel/tcg: Use bool for page_find_alloc
Date: Tue,  4 Oct 2022 12:52:32 -0700
Message-Id: <20221004195241.46491-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Bool is more appropriate type for the alloc parameter.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 59432dc558..ca685f6ede 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -465,7 +465,7 @@ void page_init(void)
 #endif
 }
 
-static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
+static PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
 {
     PageDesc *pd;
     void **lp;
@@ -533,11 +533,11 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
 
 static inline PageDesc *page_find(tb_page_addr_t index)
 {
-    return page_find_alloc(index, 0);
+    return page_find_alloc(index, false);
 }
 
 static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                           PageDesc **ret_p2, tb_page_addr_t phys2, int alloc);
+                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc);
 
 /* In user-mode page locks aren't used; mmap_lock is enough */
 #ifdef CONFIG_USER_ONLY
@@ -651,7 +651,7 @@ static inline void page_unlock(PageDesc *pd)
 /* lock the page(s) of a TB in the correct acquisition order */
 static inline void page_lock_tb(const TranslationBlock *tb)
 {
-    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], 0);
+    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], false);
 }
 
 static inline void page_unlock_tb(const TranslationBlock *tb)
@@ -840,7 +840,7 @@ void page_collection_unlock(struct page_collection *set)
 #endif /* !CONFIG_USER_ONLY */
 
 static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                           PageDesc **ret_p2, tb_page_addr_t phys2, int alloc)
+                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc)
 {
     PageDesc *p1, *p2;
     tb_page_addr_t page1;
@@ -1290,7 +1290,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
      * Note that inserting into the hash table first isn't an option, since
      * we can only insert TBs that are fully initialized.
      */
-    page_lock_pair(&p, phys_pc, &p2, phys_page2, 1);
+    page_lock_pair(&p, phys_pc, &p2, phys_page2, true);
     tb_page_add(p, tb, 0, phys_pc & TARGET_PAGE_MASK);
     if (p2) {
         tb_page_add(p2, tb, 1, phys_page2);
@@ -2219,7 +2219,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     for (addr = start, len = end - start;
          len != 0;
          len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
-        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, true);
 
         /* If the write protection bit is set, then we invalidate
            the code inside.  */
-- 
2.34.1


