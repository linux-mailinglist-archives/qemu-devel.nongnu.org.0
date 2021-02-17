Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D3631E149
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:24:13 +0100 (CET)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUIu-00079G-B6
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMm-0001kh-Co
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:08 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:56291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMk-0007ht-P9
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:08 -0500
Received: by mail-pj1-x102b.google.com with SMTP id fy5so2144268pjb.5
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kQwYPaxcLPGVIBaZFpt4Ukjta9EglPQhHZw+11ye7O8=;
 b=VqjdErixzb6CV2VBQk8tapBPYmngSWE1MtinsyfRLzo8ZyIS8cz8ajVghhUaui/qmP
 xZ5C8COoUWmWnuQtYxyS0hdgWyLfbDpwYn6aawVYa7IHnRNVv/sDi5SyDWGl8ObG6Syk
 l2cIL+7yuid12XkOml/ApP+Ukl6tZVujS3zBCG8cP5kBVkhR/AFVVYWFSZPHSWHzrqWi
 Lia1Fj2LjW682v+LElmMAfo9gAK2VrNTmSsgEhgfuAIsbF4tex95yotUJcRH0SKvjOwA
 c0/LnRuF7LjulF4QZKZ3LrFQU2oBbyz95mi6lGzT8VzVuDxc72ITK+qxH++c0EBkApPY
 vLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kQwYPaxcLPGVIBaZFpt4Ukjta9EglPQhHZw+11ye7O8=;
 b=Zo3EyIxqjqQMZk6N38gUGD5NjYYYNqRJKLA3PY9ZVvijeUS2r4LiKY33wFD8n11Szd
 JzX5JNILLqPAF/RKTGD1lHLRzUzrq2z3wjoJ9IhknsDlvxp+t2SyP/lJWodLALbrNWHC
 vEKXruU8kBaFhfyLtUND38ZVKt/I90duxN6bjGCfv3zo1Y+ky8Cl6CBlSOyZY3CEiLGx
 tONk3/GsRrjnFHmU6rsx4Lm19HCPRClgGUQkIx5vTpZ5CcBbFekZk7hVigDeZvXcG8kh
 RFLwQ/C+VFNjGBTwh5IJBM0yoif5zzbPuw73PSR4ub6c0gqp0VyQO9jLl3SAZu6qQIIh
 DTNg==
X-Gm-Message-State: AOAM532FmeJfUKshdx7/dta/9g2DHYLdlHAuOBO+Sc8dxHLk1toRVxRI
 WldVBPxCmX+mllYExZZu/RseFIE3cKogpA==
X-Google-Smtp-Source: ABdhPJwntLWxarRYQTArQDHzmMLEhNZaEbETbiJA+DSjpBagkNbd+xFbBfWGz6/s63BxogeJb5r8Og==
X-Received: by 2002:a17:90a:6342:: with SMTP id
 v2mr547425pjs.150.1613593445611; 
 Wed, 17 Feb 2021 12:24:05 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 56/71] tcg/tci: Split out tcg_out_op_np
Date: Wed, 17 Feb 2021 12:20:21 -0800
Message-Id: <20210217202036.1724901-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index eeafec6d44..e4a5872b2a 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -312,6 +312,18 @@ static void tcg_out_op_v(TCGContext *s, TCGOpcode op)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_np(TCGContext *s, TCGOpcode op,
+                          uint8_t n0, const void *p1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out8(s, n0);
+    tcg_out_i(s, (uintptr_t)p1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
 {
     uint8_t *old_code_ptr = s->code_ptr;
@@ -561,7 +573,6 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
 
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
     const TCGHelperInfo *info;
     uint8_t which;
 
@@ -574,11 +585,8 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
         tcg_debug_assert(info->cif->rtype->size == 8);
         which = 2;
     }
-    tcg_out_op_t(s, INDEX_op_call);
-    tcg_out8(s, which);
-    tcg_out_i(s, (uintptr_t)info);
 
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    tcg_out_op_np(s, INDEX_op_call, which, info);
 }
 
 #if TCG_TARGET_REG_BITS == 64
-- 
2.25.1


