Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1D1652C40
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 06:05:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7rGS-0002Kx-3J; Wed, 21 Dec 2022 00:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGP-0002JT-U8
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:33 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGN-0003Pq-QQ
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:33 -0500
Received: by mail-pj1-x1032.google.com with SMTP id gt4so14611102pjb.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 21:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+vlIhK8RBdnajCC8bpvbYLAUqtt9KGeNEpdZJB0XJn4=;
 b=zf+Teg/eq0T4CQrn51amcRmgxqMrvA2gXPX2I9UeZMfxHqeQKydAa8QLoGn97mPixy
 WIlkmJkF6gm8KMp+nJK1EcP78PbLmSG0lkWBnZ6eHv6yFwTCvtkfvfx6b18WESEh/vPU
 WoBIMQ3bOVC0Dw8evEwRHOY4nusQw+jNTTn5QQGqWiPz/Vz4fQZpwzdmnQSJMbabXjyJ
 HwEvHKVpsmzXMtUicNtLi55T1tPeQrvG5Ie13TiYXGaP2cJbIJtXQyr2yjisnl7nfZGN
 CYwroiKTNj6GbzFfjw6mQIGRxtwS+yt3nMHbV1NjSVg6dLL83Es3xdksO6d6F6UKlzhB
 DdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+vlIhK8RBdnajCC8bpvbYLAUqtt9KGeNEpdZJB0XJn4=;
 b=Fseopc/RZAZVaUI5bfxpquVBISGeCOXr4EOeZ+UAHmI5/58z9RGPDyviX0AeveQMdr
 e/dHWje4iwB01jmeBxk2y/xWbDBQi4Kq9KzxAKsupUBAQpLb1uwjBBDCGkxoBDbM+++q
 1hDl7Irket5nJ2c4HcmgsXhqfIODYbrSCPzfNtfa7SCglHK5U/PQ0/Gg9qIZrB/Ge7hP
 lBefxEf3khgtqmHywT/CF1jHpR1KDXD4NxlJAYYMSG8Us4fMMk2nnnslz+Kf8G7pI2Fe
 /lOWloV/K7DqKCJXmmU4bEKRRJOZN7wVhujFLIrNFeVUbm209hiuh/sH8jtF2uw+VctT
 JGSQ==
X-Gm-Message-State: AFqh2kqG1Uf1tGHNe3xbgu67Bwc7xWVI+cyrlFl5BAS9lt+yrag8On4i
 fhDZOd7M9/75ZNBHlhI7IedUFBnFq5SD6cBP
X-Google-Smtp-Source: AMrXdXv7Z/hTZ5gpvxl/hK8ZeB8caVQJR6eM3XRyN+NKly+F36fIjt/8/Z5rIreNbQ+BH2ZzMTdEhQ==
X-Received: by 2002:a17:90a:730a:b0:225:a132:f193 with SMTP id
 m10-20020a17090a730a00b00225a132f193mr686737pjk.6.1671599010289; 
 Tue, 20 Dec 2022 21:03:30 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a17090a688800b002135e8074b1sm390645pjd.55.2022.12.20.21.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 21:03:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 14/14] accel/tcg: Restrict page_collection structure to
 system TB maintainance
Date: Tue, 20 Dec 2022 21:03:13 -0800
Message-Id: <20221221050313.2950701-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221050313.2950701-1-richard.henderson@linaro.org>
References: <20221221050313.2950701-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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


