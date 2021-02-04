Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE30330EA74
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:52:36 +0100 (CET)
Received: from localhost ([::1]:42870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ul1-0007NA-Na
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Trb-0008Dl-6t
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:55:19 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TrY-0006Wt-40
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:55:18 -0500
Received: by mail-pj1-x1031.google.com with SMTP id d2so831457pjs.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kQwYPaxcLPGVIBaZFpt4Ukjta9EglPQhHZw+11ye7O8=;
 b=mPh2ZPADP8GBYQusOPUAXPIi/f8R2LSKnZdU9nm4OnRRX8uPEiS6ZgchqpSYw7Rm7t
 jP4WGPBu50nmnCsxayllIQnudsEURhX25YFljF+IL7lTng0Lp3WmLvHwOUwTG4yy2z/H
 pB8ypYZF98YkAo2YmakZs+6ZJfA/dj2vKtblXQ9liQz0i8Z8IIsol8QnOYV10omZBdnq
 8/fJyFZrum0RpH66jyYEG4AjEkANUZxBAo1YiWGlbOwXsn9tdeB+XG4VgGVk5SLt2i5C
 n5b45eWFQHKHDLLFgJ2ffWrOB2JgmuNI7MukuwW9sY5iwtaZW8UYkzgArYVhRW4Ln41F
 +PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kQwYPaxcLPGVIBaZFpt4Ukjta9EglPQhHZw+11ye7O8=;
 b=rZB3HMBLk3N3lZL8G3ewtbRaVWInZ/4r4bizDp7zyIf76IRy8rbY0bLAxvgZZUtT+j
 zIqhZG1O+YHV6m7ngLm8FwDF/IgRHbd//oLrhXAVbBrGHThQtwO5BCD4Iber9ytBFWfI
 PSLzZXl5yWv+PzpbR7l6wQyhpov3ZUen6JrnVUk3OJwDOQWOZ/OkOk7kiwDU411R9h3Z
 0X8fd11EIRC2JQrktpveGLciWN4LfPjdMESOVB5EHa2TAv6rv3FJDWp71wcBokFHzZzQ
 FXyTd2sA/VOBISHYLUTNfhGJ2x5lrkJOIVneI+II/TKIcXxS1mao/v1I7BV4FZyM0kSB
 KOBA==
X-Gm-Message-State: AOAM530XLoEKD4kQiFfTh605UtbIugNgsqR3e4pzcPW7vWcNKm/PFeov
 eHLhA2xYEUJkPBpsTB+gruFdl0T3MLFMbPQh
X-Google-Smtp-Source: ABdhPJwuvUiU7yrQKqHhAz+iIKAKrIUKsDjKHlld75LDUOdsNYrgG7NTmyoIvUsYBLy6NSOW+ZhjrA==
X-Received: by 2002:a17:902:e5cc:b029:de:cdab:2da5 with SMTP id
 u12-20020a170902e5ccb02900decdab2da5mr5753165plf.32.1612403714058; 
 Wed, 03 Feb 2021 17:55:14 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm4248768pgj.37.2021.02.03.17.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:55:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 81/93] tcg/tci: Split out tcg_out_op_np
Date: Wed,  3 Feb 2021 15:55:10 -1000
Message-Id: <20210204015510.885341-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
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


