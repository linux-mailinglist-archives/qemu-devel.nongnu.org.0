Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7D1336919
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:45:29 +0100 (CET)
Received: from localhost ([::1]:51698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9SC-0003sM-6d
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK961-000587-RR
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:33 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:36352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95y-0001RG-Ex
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:33 -0500
Received: by mail-ot1-x332.google.com with SMTP id t16so18307027ott.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N5ebAqjISG3PFrvVB60Fr8uPDBumPcXXPBy24caHmmA=;
 b=ixZ4ZPOxXJNH6Tomd5TMawuXBmZblxZXjOZ+Cyof5Mrlre+WHdKrL5xYwmaJrzTUj0
 vVXuyJWjA3zhTZeaueLnQT+AWhLnRtuu1ZByYLtPS+9rvfstZPqsGjF1W9PuKuYZXXa3
 gCB2JVVea3ClfTQCQgjRIuTqKJgZBidACT2ZgfhMcDwoU0bQy8QKbEM6jBsk45FCq1CX
 uA7Ei0D4NpRHVj3nYwx9yJIz+bqun7Ku2LmIXn9Czq546d+DIBPMEpNUSfAZzeC3F5Es
 aqxIf683Ov6+r4dllkcl7FoucJ/a04XNi4WsSdrL4LO59sHDph5VHzZUESmtjZFyhUGJ
 EX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N5ebAqjISG3PFrvVB60Fr8uPDBumPcXXPBy24caHmmA=;
 b=OfEN12v/XIuSEqkJS9+btnVGMr2BuV/GSrcHYsjNHdoOe+7KKVIr9rdkFJdyYa9c/i
 t2vhsbujCDrex6mwVc5wx/4/42xxLkZexOa5Hz4rq6+qVYFlxYqnqO8wjt3JbC0dMEsX
 e2Ned32hvuCAm3053TVKxaaKVsDm7lRzGnXfJO3CDq3d2MtRGhMhqqqWiQhoVAnxPo9G
 OKXtO/dQ6wP9BBfSO5jj4+qt0KAqzCDPPWiutX/o6DgxIwgSok/s2Cs6/fsgolv3Hgud
 F3WC6O75bl//ksK1PeY9MtvQiBSBBKWcnR1mvsL5ZEheze5SiBVBW6ngccRPBQU0pHQ1
 0hDw==
X-Gm-Message-State: AOAM530vfuKnsX7AgNnF9GfHENEvO2wrEcH5ZyHGn6AEPXFhWN3JtTFo
 82TYMz1p1WOotQbe2XYMLdPyNn/qAq5FOTGC
X-Google-Smtp-Source: ABdhPJwnMKJcSMLNwK3JjELpzrEHl3BBWEX7DTkNqLDUYij2GLJVyUIOpEtawBMwk/u13jILr+JVaw==
X-Received: by 2002:a05:6830:149:: with SMTP id
 j9mr4627024otp.66.1615422149295; 
 Wed, 10 Mar 2021 16:22:29 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/26] tcg: Merge buffer protection and guard page protection
Date: Wed, 10 Mar 2021 18:21:55 -0600
Message-Id: <20210311002156.253711-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not handle protections on a case-by-case basis in the
various alloc_code_gen_buffer instances; do it within a
single loop in tcg_region_init.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 93d03076d1..5b46172fb5 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -514,11 +514,6 @@ static int alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
     }
 #endif
 
-    if (qemu_mprotect_rwx(buf, size)) {
-        error_setg_errno(errp, errno, "mprotect of jit buffer");
-        return false;
-    }
-
     region.start_aligned = buf;
     region.total_size = size;
 
@@ -802,8 +797,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
 {
     size_t page_size;
     size_t region_size;
-    size_t i;
-    int have_prot;
+    int have_prot, need_prot;
 
     have_prot = alloc_code_gen_buffer(size_code_gen_buffer(tb_size),
                                       splitwx, &error_fatal);
@@ -844,14 +838,38 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     /* init the region struct */
     qemu_mutex_init(&region.lock);
 
-    /* Set guard pages.  No need to do this for the rx_buf, only the rw_buf. */
-    for (i = 0; i < region.n; i++) {
+    /*
+     * Set guard pages.  No need to do this for the rx_buf, only the rw_buf.
+     * Work with the page protections set up with the initial mapping.
+     */
+    need_prot = PAGE_READ | PAGE_WRITE;
+#ifndef CONFIG_TCG_INTERPRETER
+    if (tcg_splitwx_diff == 0) {
+        need_prot |= PAGE_EXEC;
+    }
+#endif
+    for (size_t i = 0, n = region.n; i < n; i++) {
         void *start, *end;
         int rc;
 
         tcg_region_bounds(i, &start, &end);
-        rc = qemu_mprotect_none(end, page_size);
-        g_assert(!rc);
+        if (have_prot != need_prot) {
+            if (need_prot == (PAGE_READ | PAGE_WRITE | PAGE_EXEC)) {
+                rc = qemu_mprotect_rwx(start, end - start);
+            } else if (need_prot == (PAGE_READ | PAGE_WRITE)) {
+                rc = qemu_mprotect_rw(start, end - start);
+            } else {
+                g_assert_not_reached();
+            }
+            if (rc) {
+                error_setg_errno(&error_fatal, errno,
+                                 "mprotect of jit buffer");
+            }
+        }
+        if (have_prot != 0) {
+            /* If guard-page permissions don't change, it isn't fatal. */
+            (void)qemu_mprotect_none(end, page_size);
+        }
     }
 
     tcg_region_trees_init();
-- 
2.25.1


