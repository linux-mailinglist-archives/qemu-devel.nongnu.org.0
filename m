Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916586CCDC4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 00:59:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phIGh-0006tE-GY; Tue, 28 Mar 2023 18:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGd-0006rX-LI
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:15 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGb-00073U-Tv
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:15 -0400
Received: by mail-pl1-x634.google.com with SMTP id c18so13146923ple.11
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 15:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680044292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g05J8wW1HhmR3dbxLdTrvqKbK3sSXASxM+uo2e7n0jQ=;
 b=x5YOIhpuO7maSU67Ij2gFXqAZsVcRGecZYiD6K5d7sYMTiNjzL1xCYB3/INaWPJ8yf
 UFDfEnSGRKoouc7v4XqfYM6CKQl71C4okqUbYShbhi9aRg6VmrDh9tC3J1mtvfP3DDOc
 knQieXxlfy57hA4eLfL/OXSaovM+aoBVelukX+oSVtokz9aBhxBGD//lBaeQ4fLYQx+F
 8u2m/f6I1e5NaULHUdmEEIKD3L92+dVhGCYVKoSzN20GUAElu+ZGrJeEKKBYQne7Jjgw
 e9GD15fymXEL9nnfWSIWeqAmL88qg+q73szc1aez8WO6tCYiO1NNf6fIklQ/SIhNFiyQ
 6AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680044292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g05J8wW1HhmR3dbxLdTrvqKbK3sSXASxM+uo2e7n0jQ=;
 b=4eivqGKfDX1tKHaXZTXNYqW+S/Ex0Imm6IPAYIJi1hkI4u3/DGpHrDQCPCzeynyVgi
 RQ88sf2U71/azBzCVnnFyak//+q0wGSuQmGlBUeOsJrgyKcon212iVtziqJGCEl/eUOy
 Xj4pYQ9lghYA0ralipXXzA5g2sgUlev6a5nT5F2ExrGmIEICiDOp9jHXCX1rW9TkBERb
 fG42dFxRmHgLOzCT3C9o3a26bW2OMiLHB1br4NXRPqwo8yFZa2FP3NRUX6p6NaUdMrsP
 /ZbfMWS7L259AZxs/3ZNKMUuWd373V6xwniTqu4bo8F8xmivzzDnvVctTxlXxNfuLRnD
 BCZg==
X-Gm-Message-State: AAQBX9ehS8rZmQpj50TCsUxdQ7lcLu6bUfl4QIXSz4f4SYl5NWYk8Xdu
 6fAR5A1e9f/Ji8V2q2vws7lw8M8hCslYKCzF9b8=
X-Google-Smtp-Source: AKy350bwuFqkNcD1nrQTNY3y4xJbEfCP+p45iKH3+CjZNgJFkFLd1jI9DPdqCDE/i32NJPhooiTZZw==
X-Received: by 2002:a17:903:11cd:b0:1a2:35f3:360f with SMTP id
 q13-20020a17090311cd00b001a235f3360fmr14037871plh.15.1680044292516; 
 Tue, 28 Mar 2023 15:58:12 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:c23d:b6:6be1:f147])
 by smtp.gmail.com with ESMTPSA id
 jw1-20020a170903278100b0019cd1ee1523sm21670633plb.30.2023.03.28.15.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:58:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/15] accel/tcg: Pass last not end to page_reset_target_data
Date: Tue, 28 Mar 2023 15:57:56 -0700
Message-Id: <20230328225806.2278728-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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


