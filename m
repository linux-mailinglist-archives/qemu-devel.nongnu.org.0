Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF8C308E1F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:12:55 +0100 (CET)
Received: from localhost ([::1]:40592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5a8U-0007m9-8K
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6N-00060V-P8
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:43 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6J-0007zf-J8
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:43 -0500
Received: by mail-pg1-x532.google.com with SMTP id n10so7392276pgl.10
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iOoIlpAzDYGxlsWXgbu6MecCT7nTlKWQqjPlQrCBgNU=;
 b=Vl5xMfqIIPPqj5495hG2ah2r9OX5PYkkHHBlmNE1a1aQleWt2W6lfz0Qd1jB8A7ExE
 fviF2MeH7Ce7mH1+MfMcZv/sQphLPBKgyXUfVM1jaZCCRG3Aei5LS1eK35Xp+CquR92q
 hTXI1uBA1VSkAEW1rEFllrRPwXgYeqbPedXu0N9UB1Fzk5N/V16kGw/1NOOcd4IPLCkF
 ED3y0OP0nH0DyPIeh59cbShCMtWhv+nfytaY5CbRKEfwsQdL0BDrnvqIB/dySTL5UbkB
 ZEL5Dzviwbx1ESGFNxStIuG97GL4oHT4+qdNuT0RrT6ZFoUIqv7Vl+HGQES1KBWoM6rb
 WslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iOoIlpAzDYGxlsWXgbu6MecCT7nTlKWQqjPlQrCBgNU=;
 b=tVcKe1xhZE6gY4aRv0zMJUl3LZ/9Z4G2RSlAc5UspfpcUADU9Cqdoe6ZY+C7KR4KjW
 02mhQvKx4B3SoWEl9H5tlM1W3IRM6fygOWvRNcs8t/HX7ZgXUUhVp+kxBtizpbifHokU
 JfcPJdGQlBqv6/dBhEhawfVAupkdyxtZq24YndDixG0+jtZhewS/4Z79KgqC/p+WYe8s
 M1QILboHrNBF3UUrglMJYftPB+qpa7XIS4vpdHGBKDlIqmD3v+2c3cstArYGkwduPnWm
 GAbDgOnqfanm5U6EHrfXcJcq2ifNMyaCrV6qeFK+73lIHxQG4z0xD79DrvqMd2OtHghS
 SprQ==
X-Gm-Message-State: AOAM531QmklWGf7GUNbX2CiXUIPaHSB5gE14TIHnE1+GbhlF+UUJmfOn
 MD0cmb4E2evPlW+K7cbs8WW4fnc8FYptR60v
X-Google-Smtp-Source: ABdhPJyDVSoxs7fOmj6swA1gw05dBZh1tv58FplB9ETb+kH5XlgwNp0FTEMUZpmVa6d5/kn2GKoWeg==
X-Received: by 2002:a63:1e12:: with SMTP id e18mr6048158pge.173.1611951037069; 
 Fri, 29 Jan 2021 12:10:37 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/24] tcg/i386: Move constraint type check to
 tcg_target_const_match
Date: Fri, 29 Jan 2021 10:10:07 -1000
Message-Id: <20210129201028.787853-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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


