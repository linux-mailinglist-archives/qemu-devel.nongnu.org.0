Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FCA6AB48E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 03:14:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ0Lk-0003FK-TZ; Sun, 05 Mar 2023 21:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lj-0003Ev-Gj
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:15 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lh-00060k-QH
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:15 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so7532210pjz.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 18:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678068793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Klh00VTjYiHdsz8hSod/ulyCtvR28jPMZcquCoiGcz8=;
 b=yoDol88z3w+ojWU/TgShyN70KXJFbeFuw+heV/K8nLPT02DLWPPnaHZIGkwmSlllTl
 o02nzbjWnudxtJ6Q4BUTIQoRLvZJkIuwCQOsUINKYOBxxQpMKAZJ89m+K3NtyVeOC/eL
 /fSFNd3KSJw+/OrFBZ5Wro/uG5GBMGLeNOfmKP1D4Z6y0hjLmUWgrsa8M+pmUIyLaR9o
 WmYA+IpkOZBJzlOF+9hf8xE0vHo2OM0iHThZ6ZLvAWIC0ZsdQJ+ELJPMllqqr2ZsMGs/
 fkaz7sCgrYRkJs4/22/t85Bnih78XoEKNM4DutuCQxS3V9dZhazj1sinsMmC1qhWd3BS
 zq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678068793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Klh00VTjYiHdsz8hSod/ulyCtvR28jPMZcquCoiGcz8=;
 b=0ditqXp9mYwRuZY4TmBkM0yv7jdHCRaewnA+1kYJSS98t/IwMutHVbBX4qWbQ9nSPx
 ICR+g488FoXKxHqWfygLzt4l/teAvpW11HA0BPgHM3Bcw4FN0o34INErEZ2BhP0zqQ/O
 v4+/fsBwxhcrKh5mbTDzfTut/zCABa/YDuypyVPDTGRannk3yOKSTHw92yscjX53pI3D
 jckOg92iqgEThrgVZEhRjpEx+mbUEI94FUMAQw6+JyZzZ7UwG/98/9+DxktdrzDsee25
 Di1VnHOY7gsp5UzP4/q3SNebhaK5sOXWFLDr59lanO9NId73mWSCLP0b/Wc/UW4ruYNQ
 MqcQ==
X-Gm-Message-State: AO0yUKWnX6wlSKTB8C5H2EG/h910oKlFAfo2XkASFrmjHuMfmR2JbWLg
 jPfK29I0ln88O1OsP9YSMCFzljf1f3pi+MX/OWD3+Q==
X-Google-Smtp-Source: AK7set9KJr9fujDKmRvHE5QLpTWXsgdvDmQI8bMgRTQ0OaGymHCXYKu2mq8yNfvfR27wdbmNj9vV7A==
X-Received: by 2002:a17:903:492:b0:19e:773b:2215 with SMTP id
 jj18-20020a170903049200b0019e773b2215mr9317480plb.36.1678068792995; 
 Sun, 05 Mar 2023 18:13:12 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a630e12000000b005030136314dsm5048434pgl.71.2023.03.05.18.13.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 18:13:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] accel/tcg: Pass last not end to page_reset_target_data
Date: Sun,  5 Mar 2023 18:13:03 -0800
Message-Id: <20230306021307.1879483-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306021307.1879483-1-richard.henderson@linaro.org>
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h |  2 +-
 accel/tcg/user-exec.c  | 11 +++++------
 linux-user/mmap.c      |  2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 748764459c..a8cb4c905d 100644
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
index 9cf85f4090..c153277afb 100644
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


