Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963796CB084
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 23:19:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pguEd-00043a-VW; Mon, 27 Mar 2023 17:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEc-000435-JC
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:34 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEa-0005vv-5s
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:34 -0400
Received: by mail-pl1-x62c.google.com with SMTP id ja10so9739769plb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 14:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679951910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g05J8wW1HhmR3dbxLdTrvqKbK3sSXASxM+uo2e7n0jQ=;
 b=O/Xy7rdKh/cv/ZuOsOeCJlMJ7/+/j9l5rrHouhXI/briprV4QHrlEa+cZx/tknRKz2
 iDycQbfE82VJVegPAW0cU2YRuDEM6Gjj305IkZE5sRkeKvxXT6aFDT7xwFy2Hpyj0Gqv
 SZHrjL/FvKR5byws+UepodHgf2W90c36AwgYE/BxaQ3aMso7K0YKcrZsOb19a59p9JmB
 E+cmp8jE1cl07ETpw1CHOY03Li9TPiZfsIrCP6UwAWZ8h3DMkg96jgbxT47W77xje4Wy
 tj4+BdvtRqATr78aa4SDE8H14GyDoBUrbh30Mu1UgdSErgIvzoPezjsm5vsUpWQeRUE6
 ZsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679951910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g05J8wW1HhmR3dbxLdTrvqKbK3sSXASxM+uo2e7n0jQ=;
 b=uZcVRDN83SD2be+Xq0MxeUJHiK4R6KjPsO5okv0aPGM7YNOlCC/cHJququZv14veHi
 P4XzDlNNQ8BtULE2VecuCoIqjSEaG2R8Ipxt7wp1k8GBKnRC8beiaSuKumnSSZyiX3vv
 qM5yY61ilQvPnM37xbTgd37cRXxKtJLm46Ut2Llys+4g/noLO9i7XrN7gP8gNl4SteI0
 +8gFG854p6jb6irhgwxsBGXAFoukI+2LjpBXoSR7G6IISMYLcEb7Lic9gPgoRklFoHI0
 1/55hbRg3GQFwZbwvylfq/9ZBb56nFue2DaVB/Rtk6wlfMc/1VW06GM4+TatmNTQj4Np
 m5Yg==
X-Gm-Message-State: AO0yUKWsYBMAKCrHH2C4lFSQjUoGRaKsh7HwnZ7z8MrDbzS4P4s/Wq7A
 2QTLt0bvRObUoMOHUhFa4fYWB5xDwmSV2pHnU30=
X-Google-Smtp-Source: AKy350YqabjZrkTajCMSPQvP0VD44e83sIQGZOWFii4rLK3NVa2+vXyM3jAkRK4EXSob2t5OIw+xyQ==
X-Received: by 2002:a17:90b:4d88:b0:232:fa13:4453 with SMTP id
 oj8-20020a17090b4d8800b00232fa134453mr14767572pjb.13.1679951910425; 
 Mon, 27 Mar 2023 14:18:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090a6f0200b0023440af7aafsm7902708pjk.9.2023.03.27.14.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 14:18:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH for-8.0 v2 05/12] accel/tcg: Pass last not end to
 page_reset_target_data
Date: Mon, 27 Mar 2023 14:18:17 -0700
Message-Id: <20230327211824.1785547-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327211824.1785547-1-richard.henderson@linaro.org>
References: <20230327211824.1785547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Pass the address of the last byte to be changed, rather than
the first address past the last byte.  This avoids overflow
when the last page of the address space is involved.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h |  2 +-
 accel/tcg/user-exec.c  | 11 +++++------
 linux-user/mmap.c      |  2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index a2662b1e83..64cb62dc54 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -277,7 +277,7 @@ int walk_memory_regions(void *, walk_memory_regions_fn);
 
 int page_get_flags(target_ulong address);
 void page_set_flags(target_ulong start, target_ulong last, int flags);
-void page_reset_target_data(target_ulong start, target_ulong end);
+void page_reset_target_data(target_ulong start, target_ulong last);
 int page_check_range(target_ulong start, target_ulong len, int flags);
 
 /**
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 035f8096b2..20b6fc2f6e 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -508,7 +508,7 @@ void page_set_flags(target_ulong start, target_ulong last, int flags)
     }
 
     if (!flags || reset) {
-        page_reset_target_data(start, last + 1);
+        page_reset_target_data(start, last);
         inval_tb |= pageflags_unset(start, last);
     }
     if (flags) {
@@ -814,15 +814,14 @@ typedef struct TargetPageDataNode {
 
 static IntervalTreeRoot targetdata_root;
 
-void page_reset_target_data(target_ulong start, target_ulong end)
+void page_reset_target_data(target_ulong start, target_ulong last)
 {
     IntervalTreeNode *n, *next;
-    target_ulong last;
 
     assert_memory_lock();
 
-    start = start & TARGET_PAGE_MASK;
-    last = TARGET_PAGE_ALIGN(end) - 1;
+    start &= TARGET_PAGE_MASK;
+    last |= ~TARGET_PAGE_MASK;
 
     for (n = interval_tree_iter_first(&targetdata_root, start, last),
          next = n ? interval_tree_iter_next(n, start, last) : NULL;
@@ -885,7 +884,7 @@ void *page_get_target_data(target_ulong address)
     return t->data[(page - region) >> TARGET_PAGE_BITS];
 }
 #else
-void page_reset_target_data(target_ulong start, target_ulong end) { }
+void page_reset_target_data(target_ulong start, target_ulong last) { }
 #endif /* TARGET_PAGE_DATA_SIZE */
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 1d07ff5d2c..995146f60d 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -946,7 +946,7 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
         if (can_passthrough_madvise(start, end)) {
             ret = get_errno(madvise(g2h_untagged(start), len, advice));
             if ((advice == MADV_DONTNEED) && (ret == 0)) {
-                page_reset_target_data(start, start + len);
+                page_reset_target_data(start, start + len - 1);
             }
         }
     }
-- 
2.34.1


