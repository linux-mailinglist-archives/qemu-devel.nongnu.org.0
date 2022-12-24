Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C13655A75
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 16:19:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p96IA-00056t-4u; Sat, 24 Dec 2022 10:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p96I7-00056H-QE
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:18:27 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p96I6-00016e-4f
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:18:27 -0500
Received: by mail-pf1-x42c.google.com with SMTP id a14so4996047pfa.1
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 07:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ZdTKdjXZPsSu57R08aDOC5nHrf6U05QdlzIh/dh4Ps=;
 b=aDUfRt60uiyPxMbkGC3D0P9U7IT90che4HNEepZo/fMsGQAEyFZgM4EFkOOuDlV3BQ
 H1PJgpXz7+oUM+S17BszscIkYuFh0GqxSOD4ynhVZIvcra+4cmMzb1CY4p9qNJsMXCGx
 8pk0e3hhE5YqjDOk69AewG5vTdI8WtgaKhKykEjWj2knjh89AteKA6pa6Sx52qUOxfzc
 SEVTKxiAocrBdsR1pgptHxPm12FRP5E9qAXe7F9BgdxrAPZmfwImYxfVsX8p8qsj3wnX
 zVX4b081Vmdwv8cQCl8Nwagn0yE6vQDwV+Q0z1XydaQs5NUjUnRB1Hj/I+HT2Fsf0VtO
 eQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ZdTKdjXZPsSu57R08aDOC5nHrf6U05QdlzIh/dh4Ps=;
 b=BxNcAI4oycqIUMV8BvRg6YxEz2bsN03db2ipx/L2ON2K6YQ/tpGkW8xUB7KrwdzI/l
 KV3uISFFcgrxcdFsazntrQDPyX7gBHtd4UwS8nTIMWzG5zVm+a7ec+i02IBJFk+Nqhdg
 orl65HzNfVKDsf9gwq2l0RAcWOUGlmFB4MHTvpP3Dfftw/X4fI36/NoCeLy2eCnQbWRy
 /Is4HnaFIhHfGQrQ1RApR5cyt9b6IE73Ec9lyuwt2qmKu8z9HHM+L+BDlKIrHVCAEHW7
 6GenS7IzgRrZim765dYHzHsil6qe+agP14eWvRYSjcnx/tDYDbpRi0EvxuhkYSBTCLjZ
 GFlg==
X-Gm-Message-State: AFqh2kpPHMsCC9yM/P0Rqbt9hEcnn8GHJPkle3Hg8q5Jqudpd8/wQBYf
 1y2zSL4rd4f7LSyrzyyMDXgC/h4xGOTdyGzg
X-Google-Smtp-Source: AMrXdXsOD/ByCSMxbnJmCup3o2AJFoHZjy+xlE/DW9pQzns3P70ql31A0nctj1QwdzY+4yzvgRaUyA==
X-Received: by 2002:aa7:83d1:0:b0:580:d71e:a2e5 with SMTP id
 j17-20020aa783d1000000b00580d71ea2e5mr3089327pfn.22.1671895104676; 
 Sat, 24 Dec 2022 07:18:24 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 t64-20020a625f43000000b005774f19b41csm4231124pfb.88.2022.12.24.07.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 07:18:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
Subject: [PATCH 2/4] accel/tcg: Use g_free_rcu for user-exec interval trees
Date: Sat, 24 Dec 2022 07:18:19 -0800
Message-Id: <20221224151821.464455-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224151821.464455-1-richard.henderson@linaro.org>
References: <20221224151821.464455-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Because we allow lockless lookups, we have to be careful
when it is freed.  Use rcu to delay the free until safe.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a3cecda405..2c5c10d2e6 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -22,6 +22,7 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "qemu/bitops.h"
+#include "qemu/rcu.h"
 #include "exec/cpu_ldst.h"
 #include "exec/translate-all.h"
 #include "exec/helper-proto.h"
@@ -136,6 +137,7 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
 }
 
 typedef struct PageFlagsNode {
+    struct rcu_head rcu;
     IntervalTreeNode itree;
     int flags;
 } PageFlagsNode;
@@ -266,7 +268,7 @@ static bool pageflags_unset(target_ulong start, target_ulong last)
             }
         } else if (p_last <= last) {
             /* Range completely covers node -- remove it. */
-            g_free(p);
+            g_free_rcu(p, rcu);
         } else {
             /* Truncate the node from the start. */
             p->itree.start = last + 1;
@@ -311,7 +313,7 @@ static void pageflags_create_merge(target_ulong start, target_ulong last,
     if (prev) {
         if (next) {
             prev->itree.last = next->itree.last;
-            g_free(next);
+            g_free_rcu(next, rcu);
         } else {
             prev->itree.last = last;
         }
@@ -376,7 +378,7 @@ static bool pageflags_set_clear(target_ulong start, target_ulong last,
             p->flags = merge_flags;
         } else {
             interval_tree_remove(&p->itree, &pageflags_root);
-            g_free(p);
+            g_free_rcu(p, rcu);
         }
         goto done;
     }
@@ -421,7 +423,7 @@ static bool pageflags_set_clear(target_ulong start, target_ulong last,
                     p->flags = merge_flags;
                 } else {
                     interval_tree_remove(&p->itree, &pageflags_root);
-                    g_free(p);
+                    g_free_rcu(p, rcu);
                 }
                 if (p_last < last) {
                     start = p_last + 1;
@@ -462,7 +464,7 @@ static bool pageflags_set_clear(target_ulong start, target_ulong last,
         p->itree.start = last + 1;
         interval_tree_insert(&p->itree, &pageflags_root);
     } else {
-        g_free(p);
+        g_free_rcu(p, rcu);
         goto restart;
     }
     if (set_flags) {
@@ -779,6 +781,7 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
 #define TBD_MASK   (TARGET_PAGE_MASK * TPD_PAGES)
 
 typedef struct TargetPageDataNode {
+    struct rcu_head rcu;
     IntervalTreeNode itree;
     char data[TPD_PAGES][TARGET_PAGE_DATA_SIZE] __attribute__((aligned));
 } TargetPageDataNode;
@@ -801,11 +804,11 @@ void page_reset_target_data(target_ulong start, target_ulong end)
          n = next,
          next = next ? interval_tree_iter_next(n, start, last) : NULL) {
         target_ulong n_start, n_last, p_ofs, p_len;
-        TargetPageDataNode *t;
+        TargetPageDataNode *t = container_of(n, TargetPageDataNode, itree);
 
         if (n->start >= start && n->last <= last) {
             interval_tree_remove(n, &targetdata_root);
-            g_free(n);
+            g_free_rcu(t, rcu);
             continue;
         }
 
@@ -819,7 +822,6 @@ void page_reset_target_data(target_ulong start, target_ulong end)
         n_last = MIN(last, n->last);
         p_len = (n_last + 1 - n_start) >> TARGET_PAGE_BITS;
 
-        t = container_of(n, TargetPageDataNode, itree);
         memset(t->data[p_ofs], 0, p_len * TARGET_PAGE_DATA_SIZE);
     }
 }
-- 
2.34.1


