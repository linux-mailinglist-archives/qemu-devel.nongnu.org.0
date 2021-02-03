Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279AF30D151
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:19:09 +0100 (CET)
Received: from localhost ([::1]:56080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77l6-0000wX-6Y
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77i5-0007ZV-En
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:01 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77i3-0000yE-TM
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:01 -0500
Received: by mail-pj1-x1034.google.com with SMTP id d2so3638482pjs.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QGZAwO5rTh2JAQ9XLxRx7IOhFM9ofCWQVhsgDPWW8kg=;
 b=feXAvVWo189mN2kbWAVCG3QWyJE1VkciZEMFzVlNuXlIit8mYnlS4EyNz8SN4if3YR
 Ag0dfp0FYZfwTNVFjzmcHPjz9WH0vqZNQdn+JzQNMZ4SI8bbPHxSL5ampUBE5Vv/bY9l
 tB0i4xBwWW/FhAqH9NmKJVDmuAgJoVxEkIPegtNHjjJeP27ug6HftrF2W0fnuyu2G65q
 JfN9PYNRvKbnhu7lZA7s6P1LuqncwJCJf7QLLNlC+T6NVdNugyCIhVjZQ5NNi4ksYh5n
 VXnSAda5X2lObF1qSfG5dvOap5C1/Nf9FHGhtgy2v8GrLzPiWPfhyd11Uxuj9xktNdBW
 3aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QGZAwO5rTh2JAQ9XLxRx7IOhFM9ofCWQVhsgDPWW8kg=;
 b=T02HVsBWBMvEo8rgSn1Pm0nCifr0Xe3ZxEGEguRlD6CEr1pjaoDlv48sJW6m4Se8FC
 nndSC8Bm87GtjnHG4IafBeaDK55k9Z9UXpzBwJhqLtKfDy4mzSlmyCbJMaKlgdqF1cUc
 FvzGV7qFRoCbHdBcsiF/12x5+05HYdZiiY5VwgqZ6BP/CdN+8bMwtohiznfpyo7E3fAO
 f2lHdfgjypVJ3unAwvOXGyt+FRFriSHsrb7ZGlfKoMB1FlNj6YrD55wNJFY1BCfjT5Y7
 yO4Uum2aiE9xEYjdw8gNcR1BOdogNP+3cnQ55fLTR/6rQ/DDMwRGJaepH+82sgZepL47
 y2Vg==
X-Gm-Message-State: AOAM530K2zaOv76rUwTriQNAn93mNTGty3nOtpr6AJfYYwuItlgSj6J3
 Eq5eYwRL+s7P5iDS+CKCtJVQlHzxFVuy3wBY
X-Google-Smtp-Source: ABdhPJy/0+izfBzAZPIJJ/17e/ESiKFTxp/AzhVLXXMsHrK6DApKIAm6WGz3XtEeMOksM+NIFMyztw==
X-Received: by 2002:a17:90a:648f:: with SMTP id
 h15mr840735pjj.142.1612318558664; 
 Tue, 02 Feb 2021 18:15:58 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:15:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/24] tcg/i386: Move constraint type check to
 tcg_target_const_match
Date: Tue,  2 Feb 2021 16:15:29 -1000
Message-Id: <20210203021550.375058-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Rather than check the type when filling in the constraint,
check it when matching the constant.  This removes the only
use of the type argument to target_parse_constraint.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 050f3cb0b1..540debdf34 100644
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
+    if (type == TCG_TYPE_I32) {
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


