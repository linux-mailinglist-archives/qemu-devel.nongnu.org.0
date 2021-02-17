Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAC531E11A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:15:09 +0100 (CET)
Received: from localhost ([::1]:34974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUA8-0003Nr-Mo
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMV-00018R-NB
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:51 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMU-0007cZ-4a
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:51 -0500
Received: by mail-pl1-x631.google.com with SMTP id d15so8039313plh.4
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kpfe6JZmwXM15Cw7O9Ulgnnkm0DVoqv1s4+DGCwKajc=;
 b=sw3uO+4Pc571fxp22wc+dRQWWY/hHiIjpfm15qKE/kIViK6iyATF6i85Pzovx8wSu9
 LuPRJLtJ9KwmXeBKKI/CDNiJTjpKKl1+FXJ9HQdH4fFz+xjfp9OjgNBI9otqw7F07EJh
 CEd+zdRffqp14ks4C7wT9LcGBrnpYKlaYz/3xfeaE/IEjnJibQqmGlMMvGIxxlLQYh3u
 Vr0KWo+ZwYVqvj1VexRl2xYisM6cRua/GP3wTOuHKjPHfXonPb6hXu4tTcKp4NFGFldP
 y8Ni61QzUBjkcwnljqiGsvgmxPnIli7ObNSQwPhkZ9DIMQ60E3jNy9bhvBU8y8umbW43
 x51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kpfe6JZmwXM15Cw7O9Ulgnnkm0DVoqv1s4+DGCwKajc=;
 b=WQrpyatDh8GxCGq3IHNuqLj2avV2rleRAxLnKL7KkwBF4+7ygKJneS4UazbdnczksS
 lMLTqaOclBc3MuVzuvSYFRL6zJxdoUXtrPrcuyiys5pzZcoEm2AdMm9nHEyPWnWuHLkh
 6nBa9YhRN53RT4/D4H8xEddPPSrs76eVYRJMyzJXlUR8ACcZ2w8mNzzpAAFnR1l2jg8T
 qXNkkwBFS/j9bFqwfRKryzR1x0SW0stqMhD/nJeyQGEPh7j2is9VeG9yLXlLwCbX5Swn
 zS8i0wTpeHBc+YWSoZJgA/InPrpmf8Qetq5D1TdvGhOBImBEsNoWFFihECllryCmh5AM
 Kt1g==
X-Gm-Message-State: AOAM530w7KrJzHeRn83zZR8YROiflkrHhijljV1sdzZOed9euvbYbkOL
 iGWGkX8yt+ifkEn0mRt/RyVMmeb1m1VcWA==
X-Google-Smtp-Source: ABdhPJwcTtayNtf9uEq34bk4iJL3bHwt3t7fCsVwRF81N6Lh+IvsK/Hdl6tzzKHzaZoTJvWXqJvexA==
X-Received: by 2002:a17:90a:ee96:: with SMTP id
 i22mr514322pjz.157.1613593428986; 
 Wed, 17 Feb 2021 12:23:48 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 45/71] tcg/tci: Split out tcg_out_op_rr
Date: Wed, 17 Feb 2021 12:20:10 -0800
Message-Id: <20210217202036.1724901-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

At the same time, validate the type argument in tcg_out_mov.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index cb0cbbb8da..272e3ca70b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -303,6 +303,17 @@ static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -337,16 +348,18 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-    tcg_debug_assert(ret != arg);
-#if TCG_TARGET_REG_BITS == 32
-    tcg_out_op_t(s, INDEX_op_mov_i32);
-#else
-    tcg_out_op_t(s, INDEX_op_mov_i64);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_op_rr(s, INDEX_op_mov_i32, ret, arg);
+        break;
+#if TCG_TARGET_REG_BITS == 64
+    case TCG_TYPE_I64:
+        tcg_out_op_rr(s, INDEX_op_mov_i64, ret, arg);
+        break;
 #endif
-    tcg_out_r(s, ret);
-    tcg_out_r(s, arg);
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    default:
+        g_assert_not_reached();
+    }
     return true;
 }
 
@@ -534,10 +547,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
     CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
     CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
 #if TCG_TARGET_REG_BITS == 32
-- 
2.25.1


