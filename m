Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EBD6BED68
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 16:56:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdCQB-0002mz-2Y; Fri, 17 Mar 2023 11:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQ8-0002mR-Vh
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:09 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQ6-0007yP-6r
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:08 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so5663114pjp.1
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 08:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679068504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VkbFN5DIOfLGyePi4iUQTqaZQlnmOIVGGAwI9RXEItE=;
 b=WwLjmKIOhpaLzbX7LLaeGfdDtv+w4ip4iD0RV7NTl3UtaMmbhIgrFXTEAx5HSoIVOM
 zgLBDtxITSdz3XfGxadJEiZdwJtlv/EzZKQes3WspGXDduId2ro+duAIgj6Ts3kChkku
 w8+QIoFIccPnpAWwwrNmjGxoNnQnOQRLYyQcboTxW9M6NqJZp9//aONM9kc2bcBVlQJM
 /WGXIvka5OTuV+U2NvWlMJCP/VT0Yo5ZHaXBJT7W44JFoC9WNn2DouE618bJMinIdv6W
 aygqSJdRJw72AuIvGx/mmhK1ftihQHPu08Olx2AYCSIOhsQl9gkQM7AS0MalfZ18woJr
 PtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679068504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VkbFN5DIOfLGyePi4iUQTqaZQlnmOIVGGAwI9RXEItE=;
 b=XHrUXMT4MUQUCm9aFGSA3ghmaxcrxop0Az74aqm7qa/I6jmp51B8lNfUMU+H9BJs0X
 odVimiK5IdBgpvNlkdh0HjY2jr1PFlgm0YZDnqCw0W1zJtNGpxroEdt5HduGtcGhHyj9
 jw3R/ayNEs0cZiKufR7NPgemqqVIJpG6d7y27u0hd/viMEfcNnc5XYT96QQyGcGdv0P9
 vM8dtsj+lFf4tiV2xOduaIGOAfaKfHGQsxYS7OhUxRshHuK8L5Tesfs2dENOmGMB2VTU
 Cf2Za684ksARMsR+SC35kiX0G2siWpCM0mnU2y0oUX7P7wHMb48dxAs5KC+7OIW8+f8A
 OIbw==
X-Gm-Message-State: AO0yUKU506/q9LhosE349WI6Jb21eY0I8NEcuP9kKxVrUoZp8pnI46JM
 NMAaHpRE+8CTrM2cr/bUatIXtDRNlBgPmHt1aAY=
X-Google-Smtp-Source: AK7set/YRobrwvOc64yt8kVJ6+OCO6zWjBnfsI5cB1dTBePOhv9d1ecOreQJ03EqV/gW5kO6+NOO0A==
X-Received: by 2002:a05:6a20:8984:b0:d3:626b:976b with SMTP id
 h4-20020a056a20898400b000d3626b976bmr7487435pzg.26.1679068504437; 
 Fri, 17 Mar 2023 08:55:04 -0700 (PDT)
Received: from stoup.. (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 s5-20020a656445000000b004fb3e5681cesm1668986pgv.20.2023.03.17.08.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:55:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/9] accel/tcg: Pass last not end to page_reset_target_data
Date: Fri, 17 Mar 2023 08:54:51 -0700
Message-Id: <20230317155455.341843-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317155455.341843-1-richard.henderson@linaro.org>
References: <20230317155455.341843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
index db38418d93..981c295de9 100644
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


