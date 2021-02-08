Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEAF312941
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:17:45 +0100 (CET)
Received: from localhost ([::1]:40664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x3Y-0002Bh-Vf
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSc-0002nw-HF
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:34 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSa-0006BS-Tm
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:34 -0500
Received: by mail-pg1-x531.google.com with SMTP id t25so9273339pga.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kQwYPaxcLPGVIBaZFpt4Ukjta9EglPQhHZw+11ye7O8=;
 b=ORa21O8g8bjUFTm8fFDWUIfGceTvFFgmvj82hGVAXNKcKeH0CZyw7W8o0Kd4iY5g69
 XsS16XJduZnbNwzcwLgzfQroNXGlhbxo11TjPohafvdediAX9XQLcUwsKPLp/GZg7EOh
 E82R3STyCbrNhaeOyBVbVFYlOf03NnRfb2cIGg0cpZ+/KlXXh0KJZrNHT7BM7a0iVh07
 x0x20M5YFp/9hSf6IMrLjYaq4dAtcscAKYlLHdVrm88HIeYZq7sz35e7/NzDOSjnixlj
 sCFIZ3xe+dN2inswL1YZn7O3obwdMmsj+MyG2FDv7JXEFRJimFDQzwCvk4Dbqx6R+g/5
 WCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kQwYPaxcLPGVIBaZFpt4Ukjta9EglPQhHZw+11ye7O8=;
 b=XyLAArlC3NibwM2TOgiSoD9t1aRRSMu05DafcwtkckZo6Ku9dAUYEYZo9TSVrIL+Lc
 TLOD/Xd/L6KsqGUhGK0RAt4b9WCx1Zxqi1L21RrgGy/6f9z4x2zyG7jiUzO9VHAe7fIS
 sUdJSqsDyUDtn7S/lAKJeCsDIKNSwpPtrfbu7GsIJl1nbZjcVcdT5DtvVfFaMYSoamjn
 +68FzipIFMkyA7uA/U3aAeIIzdInzE48VQ0F2CgCwFzkNI5eHh4p/bY2vXlyIWr342jN
 YyYTAWOuyDa6bPvhcTgfSmXVhmIN1spWt1K5l7GA0cv4s0HJKP/4255LruV9kdhAF4tY
 5+7g==
X-Gm-Message-State: AOAM531hJOk5ZORfFeBq7lFGI2dOzAwd/pCCHj7tKA/6W8Zw9//hG5eV
 itSfCM7FLt/1W0zepvrWGriMiFVBN7ejRw==
X-Google-Smtp-Source: ABdhPJy84OE8xdtmYC2qyCSA9aM6qKlzoWanCRwJrx2haAvVIBHt38bjb1JgneDHMpHZmTpYAwKdUg==
X-Received: by 2002:a62:87c1:0:b029:1d6:2bf4:8699 with SMTP id
 i184-20020a6287c10000b02901d62bf48699mr15420293pfe.79.1612751971667; 
 Sun, 07 Feb 2021 18:39:31 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 56/70] tcg/tci: Split out tcg_out_op_np
Date: Sun,  7 Feb 2021 18:37:38 -0800
Message-Id: <20210208023752.270606-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: sw@weilnetz.de
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


