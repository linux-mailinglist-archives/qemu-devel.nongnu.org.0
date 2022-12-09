Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879C4648039
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:38:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Zoe-0004F3-84; Fri, 09 Dec 2022 04:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Zob-0004Es-V9
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:37:10 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3ZoZ-0003rP-TR
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:37:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so2996933wms.0
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 01:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jtD3cpuCTB6yMKA5ClAo1diuH6m3+hdvzhmmIRgg5HE=;
 b=lOlFCqByZ4cS00mQB2jKY/1Wr3FKi0+2dqNoHIV3dNHRrLblN8ThIj9W/mTa/RfV4Z
 1UJKwJ7uCnklG+AFgzA79BtKUP4+BXSaTchBdZKo/Wyrvmqb7Vuc5KLdqVTY8lCPz8KB
 Phb021wJ9n8vMeG2fnCRMwbSa1PGrKcebh8rx/IICyWHjMmKUysy9Vvu0j0Oct5UR+dz
 EPcN/B9r96yVatkv7Qkdu1VVTJ7Gyjcdk325mN4NV9mTjQ0eTflaAPEl9yTEZxPvdA/B
 l2ZWBSJaS/1sjqOSXir4VkKsiU3/2NYdquDQTqfS/P87Ucb620gOSz45i4DxaPCq1QkR
 w5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jtD3cpuCTB6yMKA5ClAo1diuH6m3+hdvzhmmIRgg5HE=;
 b=68C4luoWbFSiXLAGiHWg8lm+SC7MxHDcs5cmPxme0JJ9hMi1AuH/UI7KUjApyQq7BC
 zdNKO/2sGYtoPEYtmwoR8Vsx9ao0ZHTFM8eOHh96AUceyX0FeTHOg6zO99T67s0m3eAr
 lv6nqS7JQO3RbA0qhVzZW0wRZM7QaOFDGVVRcBs0pWpFyzRhyzWUSHsSy92BpmtnRXpD
 kFLU1XcSFUiAkkwGqczHOdC2q8kFGlJBmFLkRIA89fDMgaBm4MihJCFF4jkK3sfKvDMR
 qEHqBRu4lfSoUuxVd6JpNlCUSNk//yO40BedMopGeDF+APidLkREBN+0tYIOxmxfGXvc
 ZMgw==
X-Gm-Message-State: ANoB5pnW0xbqRlXCsO/ABYW1vqIl5O+/Yyk+fSzcv5shxt5oYzqEwMNU
 vUKMnduKM5cmd40PoWFx4GM9Wlqh4eLptKo+BqU=
X-Google-Smtp-Source: AA0mqf5tSHZf2r0bp82GgKE9CBV5CyTef3doabc22yfW/WeE9OwkqAbUdBCC2cjX8l9ROfkeSs4iyQ==
X-Received: by 2002:a05:600c:a54:b0:3cf:a41d:844b with SMTP id
 c20-20020a05600c0a5400b003cfa41d844bmr4416500wmq.5.1670578626232; 
 Fri, 09 Dec 2022 01:37:06 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a05600c351600b003cfd4e6400csm1291300wmq.19.2022.12.09.01.37.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 01:37:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 3/5] accel/tcg: Rename
 tb_invalidate_phys_page_[locked_]fast()
Date: Fri,  9 Dec 2022 10:36:47 +0100
Message-Id: <20221209093649.43738-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209093649.43738-1-philmd@linaro.org>
References: <20221209093649.43738-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Emphasize this function is called with pages locked.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cputlb.c   | 2 +-
 accel/tcg/internal.h | 6 +++---
 accel/tcg/tb-maint.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index ac459478f4..6402fe11c1 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1510,7 +1510,7 @@ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
     if (!cpu_physical_memory_get_dirty_flag(ram_addr, DIRTY_MEMORY_CODE)) {
         struct page_collection *pages
             = page_collection_lock(ram_addr, ram_addr + size);
-        tb_invalidate_phys_page_fast(pages, ram_addr, size, retaddr);
+        tb_invalidate_phys_page_locked_fast(pages, ram_addr, size, retaddr);
         page_collection_unlock(pages);
     }
 
diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 35419f3fe1..d8b58c1e70 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -37,9 +37,9 @@ void page_table_config_init(void);
 
 #ifdef CONFIG_SOFTMMU
 struct page_collection;
-void tb_invalidate_phys_page_fast(struct page_collection *pages,
-                                  tb_page_addr_t start, int len,
-                                  uintptr_t retaddr);
+void tb_invalidate_phys_page_locked_fast(struct page_collection *pages,
+                                         tb_page_addr_t start, int len,
+                                         uintptr_t retaddr);
 struct page_collection *page_collection_lock(tb_page_addr_t start,
                                              tb_page_addr_t end);
 void page_collection_unlock(struct page_collection *set);
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 0c56e81d8c..bf84728910 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1200,9 +1200,9 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
  *
  * Call with all @pages in the range [@start, @start + len[ locked.
  */
-void tb_invalidate_phys_page_fast(struct page_collection *pages,
-                                  tb_page_addr_t start, int len,
-                                  uintptr_t retaddr)
+void tb_invalidate_phys_page_locked_fast(struct page_collection *pages,
+                                         tb_page_addr_t start, int len,
+                                         uintptr_t retaddr)
 {
     PageDesc *p;
 
-- 
2.38.1


