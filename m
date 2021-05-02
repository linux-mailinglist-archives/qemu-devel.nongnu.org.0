Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B14370FC2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:25:36 +0200 (CEST)
Received: from localhost ([::1]:51462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLSx-0008N7-Et
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMc-0008Kn-DF
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:02 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMa-0002x4-9u
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:02 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so4706076pjj.3
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lnCJFh2Rv+h4NLtp2hQeAPYuSx8EMRNHvOCihIxCdAk=;
 b=DAtFGrlbfaE3Np+K1BiL6Sg48aLsyJ1Xe5BHVI8VMhD+CFuBSFk6yXUAVHyFIzvfMD
 kynXKVNzi79x59sRMwkg4WtUO68vHDnaB11BekZGgLxNczhuNuArbPZKNAdL70RfzaYl
 6LAkePXuiELoCrAdOMxf07lmFN0S4cf0yv/AyiO9vdJvjajPVL8CUSgqHhgVEZCRQt6+
 dg3BFZqvan/aEBaJNxe5tHqfwgtlQryKDVTkgmW6pQDoE0QWbSvGzECe2yS+qnaq7XRM
 n89JGqDkJn+nOi98Enn0ZT+J7JUmwa5kWrbQCMEJyM6TWImbMoUYBMPK9tyb6vJBWXMh
 Y7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lnCJFh2Rv+h4NLtp2hQeAPYuSx8EMRNHvOCihIxCdAk=;
 b=QsA5MGaFYiK0cjQa81oDHyligKsWFUEvWHwSCCKCXhc8GIkmFsJ1jtenqUgxK0Fi24
 PsGUtPe72jyWrKd2jsJ3fpWtfIBtWVoVJR1iKfyBD34RbuT2puAZiC/N+0WF23hWD04x
 e6Gg7DqCP9n3Kv6/RtHpArflLvjdXGc8msdU9kQG7XjBddWwyE3h6JomQRJRKLZxCm80
 dif7C0hZrt5EuWDnkT/VR/FRIk8vITdaWRtH4wBmCINrR/OuRbgbO1FcvN7j9Xz7OP+A
 /tIYZqQEyFBt8/RekuEcy4G7vQS+8QQ0bjL7ZZiD481UWNnaHtSiz0BahN0x5MqjzZJ4
 u14Q==
X-Gm-Message-State: AOAM5331imG/oFKYWjhazzwToIB798uSZsPSvqoP0/6nuU4WhJS8xhXr
 FjZLnJW93jHEroA3pZ2Yx1b2mUKSqwZEKQ==
X-Google-Smtp-Source: ABdhPJzD21efjdf4kux6P1HxOYYRI+FyuigTqliPjdj3g0HwuG4dLfTsf1kkp8Qy/He7WtN9YdGTsw==
X-Received: by 2002:a17:90a:5885:: with SMTP id
 j5mr28024033pji.102.1619997538788; 
 Sun, 02 May 2021 16:18:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/28] tcg: Rename region.start to region.after_prologue
Date: Sun,  2 May 2021 16:18:33 -0700
Message-Id: <20210502231844.1977630-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Give the field a name reflecting its actual meaning.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index a17f342f38..bd81b35359 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -46,8 +46,8 @@ struct tcg_region_state {
     QemuMutex lock;
 
     /* fields set at init time */
-    void *start;
     void *start_aligned;
+    void *after_prologue;
     size_t total_size; /* size of entire buffer */
     size_t n;
     size_t size; /* size of one region */
@@ -276,7 +276,7 @@ static void tcg_region_bounds(size_t curr_region, void **pstart, void **pend)
     end = start + region.size;
 
     if (curr_region == 0) {
-        start = region.start;
+        start = region.after_prologue;
     }
     if (curr_region == region.n - 1) {
         end = region.start_aligned + region.total_size;
@@ -850,7 +850,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     region.n = n_regions;
     region.size = region_size - page_size;
     region.stride = region_size;
-    region.start = buf;
+    region.after_prologue = buf;
     region.start_aligned = aligned;
     /* page-align the end, since its last page will be a guard page */
     end = QEMU_ALIGN_PTR_DOWN(buf + total_size, page_size);
@@ -890,15 +890,16 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
 void tcg_region_prologue_set(TCGContext *s)
 {
     /* Deduct the prologue from the first region.  */
-    g_assert(region.start == s->code_gen_buffer);
-    region.start = s->code_ptr;
+    g_assert(region.start_aligned == s->code_gen_buffer);
+    region.after_prologue = s->code_ptr;
 
     /* Recompute boundaries of the first region. */
     tcg_region_assign(s, 0);
 
     /* Register the balance of the buffer with gdb. */
-    tcg_register_jit(tcg_splitwx_to_rx(region.start),
-                     region.start_aligned + region.total_size - region.start);
+    tcg_register_jit(tcg_splitwx_to_rx(region.after_prologue),
+                     region.start_aligned + region.total_size -
+                     region.after_prologue);
 }
 
 /*
-- 
2.25.1


