Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1145664803C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:39:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Zon-0004GW-RB; Fri, 09 Dec 2022 04:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Zok-0004GE-Dt
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:37:18 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Zoi-0003kV-T8
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:37:18 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 125-20020a1c0283000000b003d1e906ca23so2843529wmc.3
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 01:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kiNsL4beOvc4OC9RjcXa1t1PlB46iIm76tcKl90QK5Y=;
 b=mjIJ1qyzUZp7uxMWUCB2KWDbtLDeHftP2KODcb4VeGng2/Pb6O+AUMS9jt/E/SG+Zj
 62FPa+W7ykCncW1dhVqp3Z6AO6oL0Z21NdSXb6+2SZPMp3GP42WKnXt41ecHuoqZRsCr
 tK8Mu37L9SBBEd2SL/hNmfRewn5Yhb0Ydkr9PCbzfUCjyXPRH7pcg4lJNO2Xgdahfm/n
 251zM0JuGNTM/JuyiGwiOQdKDwp6xu8/Mf0WHPBB5YwDPZfw40eBSnd0zdsDD//EOE7T
 2Co31NSb2U7bS4AzdmJ8/HhyyLdOpOyxURhAGFvkoCIEbGOfLTZXNEtkte+JU+4oDFDs
 OMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kiNsL4beOvc4OC9RjcXa1t1PlB46iIm76tcKl90QK5Y=;
 b=tiNYk7223x62nxLv2IQvtHsZ5AvwArAqk4HsT0QYK5ACXmuP9SZwQxp3BhBUFxG4Lh
 W9hmYgabcfu/7HpUarjC73gUqkbSmkdAi5gMsvpLCg5QKh4aeBntiyahV28UKAfc0QLx
 ghV4vZgnBg4SsBB2DTsRCGVONd7DYZw+SOcO5+FFttB53TjvRYzhid0mcv/0Hzi2CJlS
 nIblcJeTj37fr5ATzWNtbnuXc8OhjmN6HdkP5ppybcqO12WNWXU3cL9rpFHxWrpvesZa
 BJ7+cq7QhLCmoojYHJTg9zYCWvHupQdMk3dY3V0FciUXnWRV0pDel7Gn77k3RQBk/VBJ
 MkRw==
X-Gm-Message-State: ANoB5plBQWQunN5ux05+xM3mVUZWV0NsMlZeiAJnBf4xxklGV4UN3L0O
 lcRi6PSVdpTy/c8jwfGupTvQFV05yUWSQm5zDq8=
X-Google-Smtp-Source: AA0mqf6R+xDFZqAh18Nw8VTjOTYCkX9YPclYBvKVwNp/H1xIiT+YqczOnXJUZ2tY59IRG/vhKAEiJg==
X-Received: by 2002:a05:600c:3485:b0:3cf:9d01:d33c with SMTP id
 a5-20020a05600c348500b003cf9d01d33cmr4492778wmq.5.1670578635928; 
 Fri, 09 Dec 2022 01:37:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c1c9800b003d1b4d957aasm1299607wms.36.2022.12.09.01.37.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 01:37:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 5/5] accel/tcg: Restrict page_collection structure to
 system TB maintainance
Date: Fri,  9 Dec 2022 10:36:49 +0100
Message-Id: <20221209093649.43738-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209093649.43738-1-philmd@linaro.org>
References: <20221209093649.43738-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Only the system emulation part of TB maintainance uses the
page_collection structure. Restrict its declaration (and the
functions requiring it) to tb-maint.c.

Convert the 'len' argument of tb_invalidate_phys_page_locked_fast()
from signed to unsigned.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/internal.h |  7 -------
 accel/tcg/tb-maint.c | 12 ++++++------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index db078390b1..6edff16fb0 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -36,16 +36,9 @@ void page_table_config_init(void);
 #endif
 
 #ifdef CONFIG_SOFTMMU
-struct page_collection;
-void tb_invalidate_phys_page_locked_fast(struct page_collection *pages,
-                                         tb_page_addr_t start, int len,
-                                         uintptr_t retaddr);
-struct page_collection *page_collection_lock(tb_page_addr_t start,
-                                             tb_page_addr_t end);
 void tb_invalidate_phys_range_fast(ram_addr_t ram_addr,
                                    unsigned size,
                                    uintptr_t retaddr);
-void page_collection_unlock(struct page_collection *set);
 G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 #endif /* CONFIG_SOFTMMU */
 
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 4dc2fa1060..10d7e4b7a8 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -523,8 +523,8 @@ static gint tb_page_addr_cmp(gconstpointer ap, gconstpointer bp, gpointer udata)
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
@@ -568,7 +568,7 @@ page_collection_lock(tb_page_addr_t start, tb_page_addr_t end)
     return set;
 }
 
-void page_collection_unlock(struct page_collection *set)
+static void page_collection_unlock(struct page_collection *set)
 {
     /* entries are unlocked and freed via page_entry_destroy */
     g_tree_destroy(set->tree);
@@ -1196,9 +1196,9 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
 /*
  * Call with all @pages in the range [@start, @start + len[ locked.
  */
-void tb_invalidate_phys_page_locked_fast(struct page_collection *pages,
-                                         tb_page_addr_t start, int len,
-                                         uintptr_t retaddr)
+static void tb_invalidate_phys_page_locked_fast(struct page_collection *pages,
+                                                tb_page_addr_t start,
+                                                unsigned len, uintptr_t retaddr)
 {
     PageDesc *p;
 
-- 
2.38.1


