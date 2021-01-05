Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77F42EB18B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:40:39 +0100 (CET)
Received: from localhost ([::1]:59326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqJy-0002tF-Mt
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0j-0002X1-Gd
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:46 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0h-0006di-1O
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:45 -0500
Received: by mail-pl1-x634.google.com with SMTP id x12so48109plr.10
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qay0jNTmpyZq4ULzg3vkr0em7pJVaOqPAuzaBx5paoU=;
 b=sRhq5WoKVWYc/JL9efgcD75LuvpzDgsMXSuNWlnu0L5piohTkIjikNyujwLqq8Cn2e
 RRG/JbK2b2+yor3WING977SXK0T1aWEg2YOp/uKjbOuwd4umicty3YAb5oYUxLPb5dRM
 0qEiAWSzCQE010DZVMwDq/fSyV+/cuyTHNSeNk+84q2PQIQuIR7ec1/gpvtAAwhaUOZD
 VD0DzcQ6KGDswAq+S8LTy1CPi24pm9wBEc/1JA+549LwRhAQUjSYOxxGsOhFje5QqsLX
 OOa3JnD4NMaBzKFzwhlCHgN0DwW4Hk0wEZBCHTMnL/zmQuIUtUyNHaR2iCjZfmTemRle
 RlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qay0jNTmpyZq4ULzg3vkr0em7pJVaOqPAuzaBx5paoU=;
 b=jS1pPYqmvgnWGW52Tu9Cp5ZwxghPSi/riHAUj6G7suYAlLD9GuvpvkB4utO9IdpA/S
 7Yj/GIiDeSuIOnPTPfd9HS79uU1a/ny24gS3Ei4BZ6yAXGTP6y8pYCuD0bfqGljcNFBD
 Fv/F1Z57OAqwR3ua/4zF1fzGD9CU3uGk1qexMC/AbIkDmxuWygcn+SpGZ5RDqMWj+NTx
 YdKpLkb8RvueKnFD6j+0IeB9tG8xw52/9Cumt+/pzQG+sLj4WpQFFK5PL0Ti6YWnXWzZ
 90Ld+Et7njyMV0B3eD/13YptLI/8HlGYuZy3/Y705FekQb5HdA4AVbU6Qc4BMRnkK5vv
 K96Q==
X-Gm-Message-State: AOAM530PVF+l2eKgabKP5Y0SeH5svKiQxtumkGjqmWpJbKKR5emBJPAG
 6u7G8ZOFd4VtqIJtacwdhbJk2/muwfKIMQ==
X-Google-Smtp-Source: ABdhPJwxYQVxwbLknScua7lun9dpRhFcF1vsyu5MPxju63WU0tdubAchjeKWKj8TfiGMEP80TDHX8w==
X-Received: by 2002:a17:90a:1d07:: with SMTP id
 c7mr280050pjd.154.1609867241625; 
 Tue, 05 Jan 2021 09:20:41 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 27/43] tcg/ppc: Use tcg_tbrel_diff
Date: Tue,  5 Jan 2021 07:19:34 -1000
Message-Id: <20210105171950.415486-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

Use tcg_tbrel_diff when we need a displacement to a label,
and with a NULL argument when we need the normalizing addend.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 0eb9c4ebe2..ed7a201578 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -837,7 +837,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
 
     /* Load addresses within the TB with one insn.  */
-    tb_diff = arg - (intptr_t)s->code_gen_ptr;
+    tb_diff = tcg_tbrel_diff(s, (void *)arg);
     if (!in_prologue && USE_REG_TB && tb_diff == (int16_t)tb_diff) {
         tcg_out32(s, ADDI | TAI(ret, TCG_REG_TB, tb_diff));
         return;
@@ -890,7 +890,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     /* Use the constant pool, if possible.  */
     if (!in_prologue && USE_REG_TB) {
         new_pool_label(s, arg, R_PPC_ADDR16, s->code_ptr,
-                       -(intptr_t)s->code_gen_ptr);
+                       tcg_tbrel_diff(s, NULL));
         tcg_out32(s, LD | TAI(ret, TCG_REG_TB, 0));
         return;
     }
@@ -940,7 +940,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, TCGReg ret,
      */
     if (USE_REG_TB) {
         rel = R_PPC_ADDR16;
-        add = -(intptr_t)s->code_gen_ptr;
+        add = tcg_tbrel_diff(s, NULL);
     } else {
         rel = R_PPC_ADDR32;
         add = 0;
-- 
2.25.1


