Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4672F874A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:13:58 +0100 (CET)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WPt-0004K4-SK
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHR-0003l1-BZ
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:13 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHI-0004B9-LX
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:13 -0500
Received: by mail-pg1-x52e.google.com with SMTP id c132so6814188pga.3
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YD13EL2Enn83lxjCylg6w+yAPGz27L6EoHQ+wax3O1A=;
 b=XzfAwDRvQpYE0kiBaG5FkXCNKmz+R6KxfZolib/0i3ZrTdD97xX5XF3Rd9mQR8tegI
 3+af7feHJDLOjCvclqm8sekNvw+emqAYb6s1rNnNorpXEUBkTCRSUOmWOA+mRMlHSgIz
 uxFGLgdO0B/WHhQE6qRLwTA59Ooq58o1BG8fJ9ZuUDI0QghLIASWfXB4eGXU4pRzg0p8
 7RTfZpoXZiHxf+kDmrftzGKDcyz2e7mDvrY+H6udJ9/tvYrPDAensn09bzHuokK584BJ
 1kkjM/8KD8utGF7GItssmP2xfg7ESl/l+aQ97AHzz3TP03bmFBdBtTv5wjU4kGhTVKhk
 yQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YD13EL2Enn83lxjCylg6w+yAPGz27L6EoHQ+wax3O1A=;
 b=iLvjEhxPgudEsYFbVjkWbAsHCZnKL0/94sR1O5XJ7rsxzgxp+ciPwpemDc0lqfMksi
 RUS3cyYR2BJPZWWQKcodZKh1A8f2I4FqQfKQ6QGHO7tmtQMXVzKogjM94XLC+xuOje4T
 p/9wuNOzUj5MfGEGuZSPJYhwYoxaoziphuG1+FBvbPX7nd9cId0t5MD+KnbnRPT64kw2
 nEQdlw7NWyOOH9UUOwENVPbF0Zp/sPJqQBMcDMiAWqkB/QVeZG5urg6f1Ju6Vm4uFw1U
 VSCwU4Ym9kDxuYafTV0mBpQsLblxBMqve9t0KAVCfM746Za8IOPdkd/kmyLvMpEw3TTU
 h6lQ==
X-Gm-Message-State: AOAM53268uyaI4YTpjj2HbD7xGtzmQ+ZXB9CTguU48LFipXUM4eUsQ5v
 kDtSHeeJQ6zqdx+K89p0PC3Izy6oB+ihRvWN
X-Google-Smtp-Source: ABdhPJwbwZr6r84WeJhMeU1DLx/i4UBs/BJVx9V44VaLzBXSjJF5QKx56jEf9Gz4V6eMMHR8ij2oOg==
X-Received: by 2002:a65:6405:: with SMTP id a5mr14467589pgv.389.1610744702315; 
 Fri, 15 Jan 2021 13:05:02 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.05.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:05:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/22] tcg/i386: Move constraint type check to
 tcg_target_const_match
Date: Fri, 15 Jan 2021 11:04:36 -1000
Message-Id: <20210115210456.1053477-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115210456.1053477-1-richard.henderson@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Rather than check the type when filling in the constraint,
check it when matching the constant.  This removes the only
use of the type argument to target_parse_constraint.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 050f3cb0b1..74637f654a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -263,13 +263,13 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
         break;
 
     case 'e':
-        ct->ct |= (type == TCG_TYPE_I32 ? TCG_CT_CONST : TCG_CT_CONST_S32);
+        ct->ct |= TCG_CT_CONST_S32;
         break;
     case 'Z':
-        ct->ct |= (type == TCG_TYPE_I32 ? TCG_CT_CONST : TCG_CT_CONST_U32);
+        ct->ct |= TCG_CT_CONST_U32;
         break;
     case 'I':
-        ct->ct |= (type == TCG_TYPE_I32 ? TCG_CT_CONST : TCG_CT_CONST_I32);
+        ct->ct |= TCG_CT_CONST_I32;
         break;
 
     default:
@@ -286,14 +286,20 @@ static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
     if (ct & TCG_CT_CONST) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
-        return 1;
-    }
-    if ((ct & TCG_CT_CONST_U32) && val == (uint32_t)val) {
-        return 1;
-    }
-    if ((ct & TCG_CT_CONST_I32) && ~val == (int32_t)~val) {
-        return 1;
+    if (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I32) {
+        if (ct & (TCG_CT_CONST_S32 | TCG_CT_CONST_U32 | TCG_CT_CONST_I32)) {
+            return 1;
+        }
+    } else {
+        if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
+            return 1;
+        }
+        if ((ct & TCG_CT_CONST_U32) && val == (uint32_t)val) {
+            return 1;
+        }
+        if ((ct & TCG_CT_CONST_I32) && ~val == (int32_t)~val) {
+            return 1;
+        }
     }
     if ((ct & TCG_CT_CONST_WSZ) && val == (type == TCG_TYPE_I32 ? 32 : 64)) {
         return 1;
-- 
2.25.1


