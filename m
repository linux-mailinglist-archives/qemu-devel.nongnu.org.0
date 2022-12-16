Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7376964F19C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 20:16:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6FqK-0000kU-73; Fri, 16 Dec 2022 13:54:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fq8-0000hC-9j
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:52 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fq5-0003Id-Pl
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:47 -0500
Received: by mail-pj1-x102b.google.com with SMTP id u5so3357890pjy.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 10:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+vlIhK8RBdnajCC8bpvbYLAUqtt9KGeNEpdZJB0XJn4=;
 b=SKR0xnXFoJPP3MVlyXAHYu/uwyHqj62PcsVrkLddyiWb3NaAUUyiq23vDWF0aZgbgy
 8B4YUPGNP5L3VCYEO7sqCBWuos/cRMKDgg5SaNGMFJKA8XlvLhFf2mtBabHKzoj0a17X
 M7C5wPBWMABa73BvwjuPsLzaIzlI6NDNxAtIuS8aaq+CZFVknhBjVsaztqKaiztHo/XO
 VU5S2TWPgHir+6zMA+tvNPBxSXxfEg7ewrR7DiY24mvbypJxs+BxfgLEytVfvpnqFKkU
 ABN2bNpfXzH8/gi5uZOKMBiMvH1X4xg/0xrQiGrzkH2e8djasO2dXCWc0wix1ty4nqrw
 NQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+vlIhK8RBdnajCC8bpvbYLAUqtt9KGeNEpdZJB0XJn4=;
 b=GgkGPMJZztIwEodTXLJyDWzqry44u/bDcINZyf+rZhAWcB6K3wehBm3gnAqKEhJeAm
 saUHjQqfbx3wiRO2Ve2IF9hLnPsncOxoZYanNHccpcrOiCVMt8fFH0ZoSSawNO1bNlCc
 +Oi6xdUIT20Xu9c0VYD+MogLBrazh323xUK9srZn6+ja8o6sUBgYDgK1x3mQiUFqDuAp
 i6uUjnRn0ADf/V3/WwHQJ3Zl84ED1EnoNZ+Z+0qN+sdPWsrSBes/bIj3MjG/zOdzxSp1
 3H7SXQ+9R98O4YxjvZoE5rA1I8DztYjt+xh8jMNHfMj33SXFqQwh36ewCEsoAljMVSr+
 CHBg==
X-Gm-Message-State: ANoB5pn/FBkExV2/AqaMrbPK8e9/M2mGhp3lPF6e966It7UKm/g8d2ep
 BSiYJKsGX0ssfFnBOPrN5tfzn5WlQ9VDpOyQ
X-Google-Smtp-Source: AA0mqf4qtnYpJy48brJA+pil1vPx9feYC/+7/ejk03FRpiEWYBjkShiASnNyVRUDxBT8Pk1BML5twg==
X-Received: by 2002:a05:6a20:4f10:b0:ad:b91d:9873 with SMTP id
 gi16-20020a056a204f1000b000adb91d9873mr22392930pzb.33.1671216824376; 
 Fri, 16 Dec 2022 10:53:44 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 13-20020a630b0d000000b0046ff3634a78sm1761300pgl.71.2022.12.16.10.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 10:53:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 13/13] accel/tcg: Restrict page_collection structure to system
 TB maintainance
Date: Fri, 16 Dec 2022 10:53:05 -0800
Message-Id: <20221216185305.3429913-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216185305.3429913-1-richard.henderson@linaro.org>
References: <20221216185305.3429913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Only the system emulation part of TB maintainance uses the
page_collection structure. Restrict its declaration (and the
functions requiring it) to tb-maint.c.

Convert the 'len' argument of tb_invalidate_phys_page_fast__locked()
from signed to unsigned.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221209093649.43738-6-philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h |  7 -------
 accel/tcg/tb-maint.c | 15 +++++++--------
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 8f8c44d06b..6edff16fb0 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -36,16 +36,9 @@ void page_table_config_init(void);
 #endif
 
 #ifdef CONFIG_SOFTMMU
-struct page_collection;
-void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
-                                          tb_page_addr_t start, int len,
-                                          uintptr_t retaddr);
-struct page_collection *page_collection_lock(tb_page_addr_t start,
-                                             tb_page_addr_t end);
 void tb_invalidate_phys_range_fast(ram_addr_t ram_addr,
                                    unsigned size,
                                    uintptr_t retaddr);
-void page_collection_unlock(struct page_collection *set);
 G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 #endif /* CONFIG_SOFTMMU */
 
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index d557013f00..1b8e860647 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -513,8 +513,8 @@ static gint tb_page_addr_cmp(gconstpointer ap, gconstpointer bp, gpointer udata)
  * intersecting TBs.
  * Locking order: acquire locks in ascending order of page index.
  */
-struct page_collection *
-page_collection_lock(tb_page_addr_t start, tb_page_addr_t end)
+static struct page_collection *page_collection_lock(tb_page_addr_t start,
+                                                    tb_page_addr_t end)
 {
     struct page_collection *set = g_malloc(sizeof(*set));
     tb_page_addr_t index;
@@ -558,7 +558,7 @@ page_collection_lock(tb_page_addr_t start, tb_page_addr_t end)
     return set;
 }
 
-void page_collection_unlock(struct page_collection *set)
+static void page_collection_unlock(struct page_collection *set)
 {
     /* entries are unlocked and freed via page_entry_destroy */
     g_tree_destroy(set->tree);
@@ -1186,9 +1186,9 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
 /*
  * Call with all @pages in the range [@start, @start + len[ locked.
  */
-void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
-                                          tb_page_addr_t start, int len,
-                                          uintptr_t retaddr)
+static void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
+                                                 tb_page_addr_t start,
+                                                 unsigned len, uintptr_t ra)
 {
     PageDesc *p;
 
@@ -1198,8 +1198,7 @@ void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
     }
 
     assert_page_locked(p);
-    tb_invalidate_phys_page_range__locked(pages, p, start, start + len,
-                                          retaddr);
+    tb_invalidate_phys_page_range__locked(pages, p, start, start + len, ra);
 }
 
 /*
-- 
2.34.1


