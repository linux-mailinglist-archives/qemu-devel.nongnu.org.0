Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E46C4F02
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:09:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf04f-0003IG-7e; Wed, 22 Mar 2023 11:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf04H-0002xt-Ls
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:08:02 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf04B-0007JH-J3
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:07:56 -0400
Received: by mail-pl1-x634.google.com with SMTP id c18so19536671ple.11
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fml4Pm46/jWkyRSlZ3NNbqY5RtzmzqQcXM/tCMICWQU=;
 b=vUUrDkVhbiDvd1uNkVlGrN+9kqArX90/d9k4NCt/q+/fGZAl5hRx69OVOflrDaHGrL
 oHxG2fJtoPwwzq//ghL03rFu7lW6INyNNp95AiLMnwZ4cUZw0xy01buGf5pjkJU1bde2
 9UCzxGm+zYvr7smXozlrn7tq7VC1qIGeWpe/NoeiIDsjgMohLCjUILH+sR6zVtKBZy7i
 n6iBQAD87XiR+dd69/lNJlBcMAxdT2huoKNyEySmjOQ0ghGw3hJnrLYoFHBnCNgswyNu
 KpvDlbq/BQVss/OznQ5Mc3ZzmYrXvkou+AAExv486xkOYN+d2m4CHD6XZ67C0MnS8rox
 gwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fml4Pm46/jWkyRSlZ3NNbqY5RtzmzqQcXM/tCMICWQU=;
 b=Fu32AguO4hJM0rUhiYZDm3vyqLGSoA5sLd9rc7gr1ABdO+oW1lOj1wG1i5xI4zQJRl
 RGnId7kGmp5ewwdm+X7Dx1lfx+ywvgxj5ymq5tWO2htTuCoBWfcX7kSz32wyNjFQShgm
 OeY+81cWqUa48t6nN6IGlF6KfKyqFTich/HQdiSJ0ZCbxyMltYC1h9EmktFXdcOgKCf5
 JMvFrM1efmZWVeB37ngj8PNgPO9bZbLdtX+knzXf3knGAhbwBKIvyVqlXlx0tKO7DG44
 ltUMIhwXpwpHADQUXIeoj6KWqH1W/BEhs+1MOUkPL986CWoutUfTkJ1K6J2/VdkeKu9w
 qKEQ==
X-Gm-Message-State: AAQBX9fVoHlZB4tXb1BFf/aH2GL9Bdcje48XiCX7EQ0vqnHQSY/ZcNpT
 pkWPygCi9Dq1cB42U6vkbP5b/M2E4GpZ6033Qy0=
X-Google-Smtp-Source: AKy350ZbL3Y8kmDhEwlXE+jqTnBKf5ZsuLs22djyOgw8xK+lB06kZYlmj3wkGsH4XmHyAojNzE2trw==
X-Received: by 2002:a17:903:2345:b0:19a:59d1:389e with SMTP id
 c5-20020a170903234500b0019a59d1389emr2718562plh.23.1679497674323; 
 Wed, 22 Mar 2023 08:07:54 -0700 (PDT)
Received: from stoup.. (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b0019339f3368asm10757555plo.3.2023.03.22.08.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 08:07:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 06/11] accel/tcg: Pass last not end to
 page_reset_target_data
Date: Wed, 22 Mar 2023 08:07:39 -0700
Message-Id: <20230322150744.175010-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322150744.175010-1-richard.henderson@linaro.org>
References: <20230322150744.175010-1-richard.henderson@linaro.org>
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
index be99cd3621..090922e4a8 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -286,7 +286,7 @@ int walk_memory_regions(void *, walk_memory_regions_fn);
 
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
index 9c70f51d97..0aa8ae7356 100644
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


