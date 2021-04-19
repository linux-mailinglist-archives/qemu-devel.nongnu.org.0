Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C329364CD3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 23:08:14 +0200 (CEST)
Received: from localhost ([::1]:51358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYb7t-0003We-BN
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 17:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaR0-00083l-E4
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:54 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:36667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQy-0002om-ME
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:54 -0400
Received: by mail-qt1-x835.google.com with SMTP id h7so27138479qtx.3
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oROkq8j4qfMtXcJP6tdXRKN1rqEpL50c3TD7tut7lv8=;
 b=iz+/xBzL0gxiLMfctUdsKP/t7Di+m1KxYxoNLsNsqKsQZj5QopV9G2gVNzyiw5s/fO
 M6zGLTK9vchy872BXVyCcNWdhtMBcPbJYCx6HcQfQUvocNGonC1GwvijNbeFEdtJalX/
 uoS5/ui/H0tB+B9NVRO+D6p7UiQ7k7ty9ZikymRHRlofQaveD25Rf54ju8ZTw+yCoAWX
 YdH7llB+Hnh3CnGB37+KoYOVChbs7k8Ru43C3s9F20/WzBeqjT1A34nNYRogSmuujIAm
 JDYIbeYV8ohilyCkfodi/NJaSRs9J+LRjVKFyDT3F3wTPs4AOFhSv3ikyoCD/3iemQae
 ywBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oROkq8j4qfMtXcJP6tdXRKN1rqEpL50c3TD7tut7lv8=;
 b=oXHmswD6FTqqjDTe++zH3FHRsO/3MkV0IWsGlxxpHIaQL+lMt40iMJHeYzmrSxZaBq
 n1/umZNZ/fesq9pj3JvUOZa8PaRjA7ux1jE5FD5sadrojQ60pU2v/o2F0gIlNVMZPDep
 1J+eQrtVduRAgWKREhyBuChKgjHb5RFNbHzw8M0M9L3T6S0/lCGqtYSUXwdG+BfehYf9
 Ym6ReN7BU+ZfkDw938xxMrFc5BD6lixJAX0YZs2D6mXGGj3s1xxBWocb65tbqEi/4+Vq
 r0dGg7pAfqexHaOnZknKR1zWf28UkATrU5A49v8PLkhCl5J7qj/xeAFMjWm83R5sRNS+
 sfxA==
X-Gm-Message-State: AOAM532d/fhjMxOfPD8eHKTF06iG5IxEo/cG56oXkX8iomJ2by/h4zZ+
 YxR2GWTTKu4N3ThUI690sFdPxIoaguw0dNzj
X-Google-Smtp-Source: ABdhPJy1nDZyLURjLZgCgnoopauBoN4kleHL5UBHkE6YmqP0h5XhXoTFDPd2extQplsZ8NmcCdezlA==
X-Received: by 2002:a05:622a:52:: with SMTP id
 y18mr13387646qtw.216.1618863831812; 
 Mon, 19 Apr 2021 13:23:51 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 29/31] target/arm: Enforce alignment for aa64 vector
 LDn/STn (multiple)
Date: Mon, 19 Apr 2021 13:22:55 -0700
Message-Id: <20210419202257.161730-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d3bda16ecd..2a82dbbd6d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3635,7 +3635,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     bool is_postidx = extract32(insn, 23, 1);
     bool is_q = extract32(insn, 30, 1);
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
-    MemOp endian = s->be_data;
+    MemOp endian, align, mop;
 
     int total;    /* total bytes */
     int elements; /* elements per vector */
@@ -3703,6 +3703,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     }
 
     /* For our purposes, bytes are always little-endian.  */
+    endian = s->be_data;
     if (size == 0) {
         endian = MO_LE;
     }
@@ -3721,11 +3722,17 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
      * Consecutive little-endian elements from a single register
      * can be promoted to a larger little-endian operation.
      */
+    align = MO_ALIGN;
     if (selem == 1 && endian == MO_LE) {
+        align = pow2_align(size);
         size = 3;
     }
-    elements = (is_q ? 16 : 8) >> size;
+    if (!s->align_mem) {
+        align = 0;
+    }
+    mop = endian | size | align;
 
+    elements = (is_q ? 16 : 8) >> size;
     tcg_ebytes = tcg_const_i64(1 << size);
     for (r = 0; r < rpt; r++) {
         int e;
@@ -3734,9 +3741,9 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
             for (xs = 0; xs < selem; xs++) {
                 int tt = (rt + r + xs) % 32;
                 if (is_store) {
-                    do_vec_st(s, tt, e, clean_addr, size | endian);
+                    do_vec_st(s, tt, e, clean_addr, mop);
                 } else {
-                    do_vec_ld(s, tt, e, clean_addr, size | endian);
+                    do_vec_ld(s, tt, e, clean_addr, mop);
                 }
                 tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
             }
-- 
2.25.1


