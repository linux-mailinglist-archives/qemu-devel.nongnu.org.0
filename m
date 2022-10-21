Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADBC607188
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:58:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmvT-0006pI-Nx
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:58:43 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHw-0003Os-RA
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHi-0003JZ-Pd
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:39 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHg-0005ql-HA
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:37 -0400
Received: by mail-pj1-x1035.google.com with SMTP id pq16so1688573pjb.2
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OjjeRZqVgFS5dG8LiFwvWFyG3e2GWcohg60z62TsQR8=;
 b=vc3SisG52ZoENCc5L2xvztXdwByJKUyB6W7xey56r5xJ7HDHv86p9lwcUwrQctSn+G
 TiRvzQg66llEi0Km5X2ZgHEhxRa3sntQgWaaFQ2XU2+L0FjAeYk87DEjHeJBfl4GAmmu
 5+c4azojyEkor8FPF8JoJ9rROFGdBwoNZ//OsbJnLxrzIaGpdE8EbTiF5iHKh1rnhrtJ
 7Sz2knr824Qoheb6doET24TxhjCwhYlCilGCShS//e9A0p5K1yDt+g15ET1IdcDnQMhm
 sYcwFeporECwnhFAQE8YtxwMPAmAjYwv7mL44Pr1BKkJjL8CZoBscFHNma/xj+ij622D
 zZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OjjeRZqVgFS5dG8LiFwvWFyG3e2GWcohg60z62TsQR8=;
 b=hwzppSy2OCahhUfYB0jMAuWF8VUFcSOyW3Bp+VGQ/ufd2LSA8V+VIn51i4imvq1wek
 Bg/AJrA6LXkM0qGRLkBNnVPmGb8wEc7+9CQcgZGpzXFqiZqQdTbWBse6iqdqkb5ZthJn
 78hea9hdL731kGLbldfmxVTi1Oc/cN0PLBHkPs11LrjeD69MgVCBpid+JZu7prOw2dHF
 i79NGGx4xX4WJ1w3xVOSoNE2nwZQAr41t4iBlgH8DSVB8RVAOVanwH+RVV4l0CeNNrGu
 a4m7fOJF6P7ylPgewtoPWqjBzM0ldL74s+9obG9DxhCG7AWg4xeRVp/dtYiJrLDAf7AK
 U96w==
X-Gm-Message-State: ACrzQf0Q12ZUIe/e10oNa8iv5kuZ92sEOc+DBZ/mOjowboKRGnjojFxC
 gj4dOltiPkZaLC2l4I8rYivXSfajHpzbNZDw
X-Google-Smtp-Source: AMsMyM712DFSjGduUHLj5nggeKYzVw4mQah6b7yO6+TSerGlxu/OTYUg+Jct20OfXmUJrWfikb0Jxw==
X-Received: by 2002:a17:902:c40b:b0:17f:9636:9014 with SMTP id
 k11-20020a170902c40b00b0017f96369014mr17682451plk.150.1666336653883; 
 Fri, 21 Oct 2022 00:17:33 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/36] tcg: Allocate objects contiguously in
 temp_allocate_frame
Date: Fri, 21 Oct 2022 17:15:38 +1000
Message-Id: <20221021071549.2398137-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When allocating a temp to the stack frame, consider the
base type and allocate all parts at once.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index fdafb30579..a3538edffa 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3318,11 +3318,12 @@ static void check_regs(TCGContext *s)
 
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
-    int size = tcg_type_size(ts->type);
-    int align;
     intptr_t off;
+    int size, align;
 
-    switch (ts->type) {
+    /* When allocating an object, look at the full type. */
+    size = tcg_type_size(ts->base_type);
+    switch (ts->base_type) {
     case TCG_TYPE_I32:
         align = 4;
         break;
@@ -3353,13 +3354,26 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
         tcg_raise_tb_overflow(s);
     }
     s->current_frame_offset = off + size;
-
-    ts->mem_offset = off;
 #if defined(__sparc__)
-    ts->mem_offset += TCG_TARGET_STACK_BIAS;
+    off += TCG_TARGET_STACK_BIAS;
 #endif
-    ts->mem_base = s->frame_temp;
-    ts->mem_allocated = 1;
+
+    /* If the object was subdivided, assign memory to all the parts. */
+    if (ts->base_type != ts->type) {
+        int part_size = tcg_type_size(ts->type);
+        int part_count = size / part_size;
+
+        ts -= ts->temp_subindex;
+        for (int i = 0; i < part_count; ++i) {
+            ts[i].mem_offset = off + i * part_size;
+            ts[i].mem_base = s->frame_temp;
+            ts[i].mem_allocated = 1;
+        }
+    } else {
+        ts->mem_offset = off;
+        ts->mem_base = s->frame_temp;
+        ts->mem_allocated = 1;
+    }
 }
 
 static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
-- 
2.34.1


