Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D933E659391
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:07:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2uj-0006fC-5H; Thu, 29 Dec 2022 19:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2uZ-0006Ti-TN
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:12 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2uW-0004Fb-6D
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:10 -0500
Received: by mail-pf1-x436.google.com with SMTP id c7so13549601pfc.12
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Y16pm0SqOdUqq2QzEmuBdO11+/IfNrQQ74FHa4/kug=;
 b=QH9mLi0kyhNGdZSroMc5KDfi7LtjCsRqEGQZpeiDqRL1Fni43dvlDF+I9Xpqh52GPT
 T5pON48f34awwhqm5O4rgL8LrQ60cda4U/7p0df6N2TwZXU387DQNK9NOBkK8Qabw2n9
 SotYERuaF5gkPeqzgL8H2DjcdHcOc2TgmboXEhVgpTRyh+2hyLsuff4rKL5BibRsyb8T
 j0A+nhaBnqtMUDQhxqz74TbOrWTKD3dzoQKoRRI2l/RxnDbMK6xFT/Ldmkpmix7Ij/Iv
 y8s3x+yVZuFOWPbQbXijloPhvHeKkQaSUneafB+0MgNb9Ao4QAblhQ5eJqr9kHgmuQ3x
 jHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Y16pm0SqOdUqq2QzEmuBdO11+/IfNrQQ74FHa4/kug=;
 b=RMYDHqyErqHFNWObnGrUjFTc/NYp/xHeapUNjyIaKVgZkIvgmjYlVkzCihRYM/T0nv
 Qg2NBaP4jjIGTtmW+wXLzeGu23hd05B/zseFtH/BC2Fnb6EWUqD6gg2PfeW3+jHXp17F
 h5/LlgdjDNIHGnMSDGgslJqbmbknM9dkwh/trc+e7bcpEaZxfhjvh7+2pm3IIruQm+a+
 MJLrug/8KJjRPYxvisoqRCH9LxOzKZXQG0isGcScwnd7Y8GWhdzv/UN6EJrFDOoA5mlO
 xvmuSyC+Tq6H5i+HbijahIJ92lCjN4jthOAMIUVB4p/2Ho4ATFAeh8s2A4F8guTsaAzP
 rQ6A==
X-Gm-Message-State: AFqh2kpHgRTtnclhdFKp7PT1AAH+lAkLLa4078LSpAPh9I80wLw4VTqo
 esWhiiAf5I4vJfOJDOEilr1u2PmfsVJ53of8
X-Google-Smtp-Source: AMrXdXt1JaGAPvPseKbTUNx/65o/zlOYUlt/y2fj26d4vGUjZMqusxvuhbGKef9fC6iSbljpGZ2cRQ==
X-Received: by 2002:a62:1c84:0:b0:576:e4c7:97bf with SMTP id
 c126-20020a621c84000000b00576e4c797bfmr30332957pfc.15.1672358764975; 
 Thu, 29 Dec 2022 16:06:04 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6286c2000000b0056bfebfa6e4sm12586151pfd.190.2022.12.29.16.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:06:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 45/47] accel/tcg: Use g_free_rcu for user-exec interval trees
Date: Thu, 29 Dec 2022 16:02:19 -0800
Message-Id: <20221230000221.2764875-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


