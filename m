Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA7C31164D
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:02:13 +0100 (CET)
Received: from localhost ([::1]:52038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8A7A-0006bj-8N
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2A-0001Hn-Ma
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:02 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A29-0003B0-2y
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:02 -0500
Received: by mail-pj1-x1032.google.com with SMTP id s24so4425143pjp.5
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rQnZeltFcMCYQ9xe609eFENXoL/masnHJpQsAf4wZNg=;
 b=GHNqfpXSHIROClfIVl+N/5pYROaVcWeR8tjhC2QVA9ges6CHZjlY9wQprFjkoB7Z4m
 xpzxJfe3/ATqE6gIQzt4bNMEfC+jUqdkdUHXUmzKK2Zp5dU5DaDCbwsjmIkrSQeuoBhO
 TJyg0Ut1LyjVqMfQoSkq3ZumfLzjpLSX92yI0NhUTI73V2LZAk7Qxj+FuErMYtzuwg7L
 JAexHw8Y2VzlZJ1UtFiFhxTwcfiv83Le+5yVk5sK/1xzIQEB+mCQqWyYL/fvzXLIr9cM
 pUPvktZx5wehsXRLRLsNS8hB69zIWarlCdIK+nrgLFQXNghhMUNysz1MQyCRlYO0c3bO
 CxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rQnZeltFcMCYQ9xe609eFENXoL/masnHJpQsAf4wZNg=;
 b=Mj5cw3aN4a2TYqIpJhtCb0frYR9C2tyVsR8eey4wE8XPOkKM+MlnMjk0UwugSJHubu
 eoh47FjtGFI7/YY8iogtf6Nt0wN0lemhZPk4Ud1SvYrI3tN1okRUbGrlyRdOfK2dnjFw
 oQtYpRxE0znZ0EIFbJ7iYNDc6e2qTGdOD39vIrITS1atma1N1AY/X21TTr2oJjYceH3A
 p0aE4rdfawb8qlsmaxVjq8GjPvGnB49BH/BwukKlRrR+K4mr/a26vP8BW/0nmYanPU8V
 Ssv86QpR46jOywYUiQ2yovUZI4StaBGmi+QIXNBZtJaZ3xD7ejYPHa+qFbwAuRIDLqb9
 3EcQ==
X-Gm-Message-State: AOAM533dbOql+Y02OzOnsNSutecRZHZs2frhweftHeV1HI9N+QZjLhcR
 O9716/PHd5J2RhZc9e0kiPn+namPwxqZo6dd
X-Google-Smtp-Source: ABdhPJy590ux+JAdV25p8DpJmYNF3J5nLQ1s9udOTnkYwDQM0vUHdRfgscnCdhj5eX10jSA6nQZnRw==
X-Received: by 2002:a17:90a:7608:: with SMTP id
 s8mr6275860pjk.105.1612565819751; 
 Fri, 05 Feb 2021 14:56:59 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:56:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/46] tcg/aarch64: Do not convert TCGArg to temps that are not
 temps
Date: Fri,  5 Feb 2021 12:56:07 -1000
Message-Id: <20210205225650.1330794-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes INDEX_op_rotli_vec for aarch64 host, where the 3rd
argument is an integer, not a temporary, which now tickles
an assert added in e89b28a6350.

Previously, the value computed into v2 would be garbage for
rotli_vec, but as the value was unused it caused no harm.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 3c1ee39fd4..1376cdc404 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2488,7 +2488,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
     v0 = temp_tcgv_vec(arg_temp(a0));
     v1 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
     a2 = va_arg(va, TCGArg);
-    v2 = temp_tcgv_vec(arg_temp(a2));
+    va_end(va);
 
     switch (opc) {
     case INDEX_op_rotli_vec:
@@ -2502,6 +2502,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
         /* Right shifts are negative left shifts for AArch64.  */
+        v2 = temp_tcgv_vec(arg_temp(a2));
         t1 = tcg_temp_new_vec(type);
         tcg_gen_neg_vec(vece, t1, v2);
         opc = (opc == INDEX_op_shrv_vec
@@ -2512,6 +2513,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         break;
 
     case INDEX_op_rotlv_vec:
+        v2 = temp_tcgv_vec(arg_temp(a2));
         t1 = tcg_temp_new_vec(type);
         c1 = tcg_constant_vec(type, vece, 8 << vece);
         tcg_gen_sub_vec(vece, t1, v2, c1);
@@ -2525,6 +2527,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         break;
 
     case INDEX_op_rotrv_vec:
+        v2 = temp_tcgv_vec(arg_temp(a2));
         t1 = tcg_temp_new_vec(type);
         t2 = tcg_temp_new_vec(type);
         c1 = tcg_constant_vec(type, vece, 8 << vece);
@@ -2543,8 +2546,6 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
     default:
         g_assert_not_reached();
     }
-
-    va_end(va);
 }
 
 static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
-- 
2.25.1


