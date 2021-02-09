Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9F03155EF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:29:53 +0100 (CET)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Xlo-0004nN-I5
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xk3-0002zF-Cy
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:03 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:56270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xk1-0007pj-QR
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:03 -0500
Received: by mail-wm1-x32c.google.com with SMTP id f16so4146092wmq.5
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SJ+CxGQUMbX25NLlEOpaUwde946vo4PY/BH+Jix+NZA=;
 b=igdrfzzyPKB/xTgeqROmTYO/dqzrtm+VcHLHBpoiogjflHT8kfTC6fhnjjsZ1WChsN
 rfY//jscd/f7ox7U6TyResYLdYyqYe429CEXbFnwG8vDegxfoYIixdu3TVH2lui6rD4l
 4CQC9u3IGqqepiXEZQY9bMF0Rpm3cLAW1sU2cgkIOVWviwsnohnrDFw5TMAG4KvqMkZQ
 dD8FvvqIUdifgjP2+njzEjCzVmBZIS0M+rcB8sG3lYL8J5gIeQAe/n5zxn0EB7EWDcGU
 v41+WW/Cbf3W7Ljb7/l3fIA01gj7YQOfE6UciwuzWepAemGrPavYpALcG3BCq0k8Xc0V
 rvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SJ+CxGQUMbX25NLlEOpaUwde946vo4PY/BH+Jix+NZA=;
 b=cGJPVMcFlIdMr8oQD0vDKfX6DHAPe/gYpvGg+8AaiLLzxQ/rRBqjB7hYBvPcGupTBM
 nk7TQTPq0Kh8SusCqb9TbPvbiGHop+HhTGQRVfJ+zKorPq3o3bU16Tzf6k9fF/0YgQrd
 EsC6SrZltfSoDE2ASccgUowr1BWe0s5C0nFb5DUEkafKK4T8fqPEyLynGczYvIJ50HUd
 5epuMcJEjwpU6sedfvi5dlady4RD4LgY6GF3G5wiopGaFup2T53oucwZ1anreybgo6Ga
 ntEmxgVg4DiHJBm7Y2KR+erjFaKbcYo2a1SWUsqHF3T6pUk/tphd72SZHqTd6bE9mf7F
 zaMg==
X-Gm-Message-State: AOAM530i5SDFZUOo9vU41WmdzR+Br3XtLWZEEB1ktlsxQixvQaMmpVdS
 D8VrZa3XxGUgPTJCGk6DNcbXY/EJf8PxVq9n
X-Google-Smtp-Source: ABdhPJznXJuodcfQb6g9XHTJAbht1T1G/+ockUgzHF5jwOxjhDE8RwKwkO1edSUfc1cKnvldoCvaQw==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr4606297wmj.127.1612895280527; 
 Tue, 09 Feb 2021 10:28:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z15sm5296124wmi.38.2021.02.09.10.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:27:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 585B21FF96;
 Tue,  9 Feb 2021 18:27:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 09/12] accel/tcg: re-factor non-RAM execution code
Date: Tue,  9 Feb 2021 18:27:45 +0000
Message-Id: <20210209182749.31323-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209182749.31323-1-alex.bennee@linaro.org>
References: <20210209182749.31323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no real need to use CF_NOCACHE here. As long as the TB isn't
linked to other TBs or included in the QHT or jump cache then it will
only get executed once.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b8ad95aa1b..b2c5003829 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1778,7 +1778,7 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
 #endif
 }
 
-/* add a new TB and link it to the physical page tables. phys_page2 is
+/* Add a new TB and link it to the physical page tables. phys_page2 is
  * (-1) to indicate that only one page contains the TB.
  *
  * Called with mmap_lock held for user-mode emulation.
@@ -1797,17 +1797,6 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
 
     assert_memory_lock();
 
-    if (phys_pc == -1) {
-        /*
-         * If the TB is not associated with a physical RAM page then
-         * it must be a temporary one-insn TB, and we have nothing to do
-         * except fill in the page_addr[] fields.
-         */
-        assert(tb->cflags & CF_NOCACHE);
-        tb->page_addr[0] = tb->page_addr[1] = -1;
-        return tb;
-    }
-
     /*
      * Add the TB to the page list, acquiring first the pages's locks.
      * We keep the locks held until after inserting the TB in the hash table,
@@ -1880,9 +1869,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     phys_pc = get_page_addr_code(env, pc);
 
     if (phys_pc == -1) {
-        /* Generate a temporary TB with 1 insn in it */
-        cflags &= ~CF_COUNT_MASK;
-        cflags |= CF_NOCACHE | 1;
+        /* Generate a one-shot TB with 1 insn in it */
+        cflags = (cflags & ~CF_COUNT_MASK) | 1;
     }
 
     cflags &= ~CF_CLUSTER_MASK;
@@ -2096,6 +2084,17 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         tb_reset_jump(tb, 1);
     }
 
+    /*
+     * If the TB is not associated with a physical RAM page then
+     * it must be a temporary one-insn TB, and we have nothing to do
+     * except fill in the page_addr[] fields. Return early before
+     * attempting to link to other TBs or add to the lookup table.
+     */
+    if (phys_pc == -1) {
+        tb->page_addr[0] = tb->page_addr[1] = -1;
+        return tb;
+    }
+
     /* check next page if needed */
     virt_page2 = (pc + tb->size - 1) & TARGET_PAGE_MASK;
     phys_page2 = -1;
-- 
2.20.1


