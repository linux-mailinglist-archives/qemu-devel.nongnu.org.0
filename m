Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED8C6EC4F9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:43:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqoxM-0005Vq-6d; Mon, 24 Apr 2023 01:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox6-0005Lo-5i
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:28 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowr-0004Fw-Kn
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:26 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so22110645e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314870; x=1684906870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eP2UcvTSjxkcvSWlSrM0QTbqla0I8aaMQCx8SFdrxDo=;
 b=IlCNtRwB1/xQU7iLzHM5XbtmCDFsCOjgZJmIipafeiIB9+1OrNeOkGdrqZYeQSwhKt
 Hy8GuUI4mthHOr1I8q4SjUqNqv59sQuw4X5cqQuPo2F4N3eA1YVEvygVUzz4/XT11iVk
 T0sMF0/j7IVmdIubK7vkDSuUDEmoYbmzqMPvOAXtboeEesfuFXp8N/NxnYoGVmkuIp5K
 h5fAbPcPwIoPR0swog010AFsfdl092RuKQlPGLNOtEaIZl/NOCMSKegu2oYJ0rtBbPnE
 qUWn7rMbyscmsuqGwjOjeatYjYqaampTEwkFqMyty4MypGZOa0AR0Ky7tgSiGexwDtLF
 PDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314870; x=1684906870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eP2UcvTSjxkcvSWlSrM0QTbqla0I8aaMQCx8SFdrxDo=;
 b=eqEVhVKHnrLNurXFNs7t8VF1ShH3MZw7qGlU6PmSP90lWa0Ul0VaEYqrKhzgbUICdX
 FqmG9QQuX/luw8mpUwqUMS4pTeRyBKFc7r5ovtgM5Ix0oGXSUIq4LvV25Ysv/XZQQ+Ng
 eAT/tqWVi+TWKiFc+rPxgnuEnayv2Q1sQCQA7T8eTTjtL1CcrbAIQrI4VfGa6H7Detb0
 FnVxIupQ/SvhmuPSFNTPrCfxDyoJnBxzQpyR8105VSe5yCBjlepFXy2w6EWzemRkl5yK
 trcjB2f2OycgFPf0wSp1jFoKk6e5GOTRjLkQ7XsTP1uzaQXKZtWDwYNJfHQNsGPZH9bp
 kuUA==
X-Gm-Message-State: AAQBX9eUAdHGxy5wM2EczkgGchc/svXrVIxHI4kM8rdgsW4WvCK+wUD9
 aKPfKUxMlbnmlHr3F2h4Y40XgkYp21El08fzvjfKmQ==
X-Google-Smtp-Source: AKy350bd85CsA+BazkdL6HS42naNU9zdwGzkPGKh6uq1ZYwkBqGm+Q7ZbX1SRdNm2Xdrtq7MlvWmLA==
X-Received: by 2002:a5d:6e06:0:b0:2ce:fd37:938c with SMTP id
 h6-20020a5d6e06000000b002cefd37938cmr8682496wrz.50.1682314869885; 
 Sun, 23 Apr 2023 22:41:09 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 06/57] tcg/i386: Generalize multi-part load overlap test
Date: Mon, 24 Apr 2023 06:40:14 +0100
Message-Id: <20230424054105.1579315-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index b986109d77..794d440a9e 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2223,23 +2223,22 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
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


