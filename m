Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E826F8ACC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:25:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vX-0000pf-HI; Fri, 05 May 2023 17:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vU-0000nS-F1
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:16 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vF-0004ST-5T
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-307664010fdso1855863f8f.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321900; x=1685913900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Op61LyFiNoJTk9LIzK5doaDEyxOgewGDHJjDkfUTrQ4=;
 b=XtIEOaEuhG17hyduWVNQq+sloifk1TKf/Sxnie+7YP0ip0KD80J/tIpvyGhNlS+Tro
 6e2mYd4W+V/4q00CcIoxQij/lLnbVksbU0lE4BvvJ+QWX+gPBg+u+Prlt/THZbM+WQ2d
 lhDCGeIG8XkArvFs3rfGb1RehMy91L8rqcpHNT6fJ1merp5Ev/yc83NwYaSYKy3EvkRp
 m8hLt+yXvOgBo0SABNkEDpXphMIlCJAoMeThzi6YNp+g9bgHlsr+6GkssWOdhR5FyoRL
 NCpJkTK/iL8cPiwzdu5NnuideFZYVjIixl+grtkuOt/SBO3pmAkHXDn2nZdcQFvmXkCp
 FXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321900; x=1685913900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Op61LyFiNoJTk9LIzK5doaDEyxOgewGDHJjDkfUTrQ4=;
 b=UGW1mjlwL4rhItEnHDHyj+tdO8zYpsbASXlu22mRnjOkopPqiHdZOxrw2my9QIDUqq
 x2XTB9hXjBDuo9cFX1w3ZDAEl8mSbeEpXe8cnq21ovdlEqoSilJbKwsHotbCTK//xN9F
 3QleaSExjgjf88UEI1L0xnz7EdcssBmEGVuG4X7QmR4ku5pUkl+uaUx0JzGUmesYlP1e
 8GFDYhDjglz7EGIElhTw8gAxY+ay57jP8VobyGTQuQi2wrE1KPABhCm1fE2m0X0R3xjw
 N1UP67HhIZBvQG+vUTYfBUmA5gYuYVDToERdhwFqS99TNPk/kO3XONjk3AFdHFqB+kX1
 HsHA==
X-Gm-Message-State: AC+VfDx0FX1HnT1Qrpz9mRiBGQmo3fNHX7MACocunNGGnh1O1u7KREpg
 TND7Qq1lHUEfsk1sFkckBb7oOjEhBc3+S+2x9keK/Q==
X-Google-Smtp-Source: ACHHUZ7GsyjKIF4rxOuy+Vvk4Qhl7Cabj26NLXoNwGG/pCRzvjDfm+rxc8J3iO8tyxFOjRfxIaHoyQ==
X-Received: by 2002:adf:fb06:0:b0:307:7bca:2964 with SMTP id
 c6-20020adffb06000000b003077bca2964mr2180418wrr.14.1683321899915; 
 Fri, 05 May 2023 14:24:59 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/42] tcg/i386: Generalize multi-part load overlap test
Date: Fri,  5 May 2023 22:24:25 +0100
Message-Id: <20230505212447.374546-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Test for both base and index; use datahi as a temporary, overwritten
by the final load.  Always perform the loads in ascending order, so
that any (user-only) fault sees the correct address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index cfa2349b03..173f3c3172 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2221,23 +2221,22 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
                                      base, index, 0, ofs);
+            break;
+        }
+        if (use_movbe) {
+            TCGReg t = datalo;
+            datalo = datahi;
+            datahi = t;
+        }
+        if (base == datalo || index == datalo) {
+            tcg_out_modrm_sib_offset(s, OPC_LEA, datahi, base, index, 0, ofs);
+            tcg_out_modrm_offset(s, movop + seg, datalo, datahi, 0);
+            tcg_out_modrm_offset(s, movop + seg, datahi, datahi, 4);
         } else {
-            if (use_movbe) {
-                TCGReg t = datalo;
-                datalo = datahi;
-                datahi = t;
-            }
-            if (base != datalo) {
-                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
-                                         base, index, 0, ofs);
-                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                         base, index, 0, ofs + 4);
-            } else {
-                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                         base, index, 0, ofs + 4);
-                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
-                                         base, index, 0, ofs);
-            }
+            tcg_out_modrm_sib_offset(s, movop + seg, datalo,
+                                     base, index, 0, ofs);
+            tcg_out_modrm_sib_offset(s, movop + seg, datahi,
+                                     base, index, 0, ofs + 4);
         }
         break;
     default:
-- 
2.34.1


