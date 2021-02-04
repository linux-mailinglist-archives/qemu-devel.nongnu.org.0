Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B6130EA65
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:47:03 +0100 (CET)
Received: from localhost ([::1]:54218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ufe-0008Mt-PG
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tk3-0006KL-Io
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:31 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjq-0004Cx-0T
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:31 -0500
Received: by mail-pf1-x429.google.com with SMTP id f63so1048742pfa.13
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QUs6bZlAERttu34ccVgcqABRUHJrBFMHH0LXLYX1oZo=;
 b=Bqmlt0r3Db+fjsBSQj9sptkfcBIOqh/cN0mdklasHUs4TQY5qbrLLPxL4w8kfka711
 DSYs7h2xiNMkMyGU8nVUA4O9RD+hTkQcxmjttEJ/3xs8v9ZFWMh0+zOk6kM7P6c2FyY4
 2A+tRBg6FYicFVDlAPHhy5gRbvYdDpD2JmAYyvYNjT+xx8jwMZH2QXKVvQ4WkALS9E78
 9lXL6VFFl6Ack1PxlTFsQr92V09MWYWRvBGzYSvPT+kbGGF4aoe8xb0TG9e1qM5c80es
 Lg9qIwhQqZg1QX1cmvFbNAAeTP71DXmrLz0Q4odpFGR9AFFNGHwcFOCA5R9Ug0YaeybU
 kukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QUs6bZlAERttu34ccVgcqABRUHJrBFMHH0LXLYX1oZo=;
 b=BETrK6vlpdhQcEvZvv4KRSdwgFkcJFbs7oeYXA4YRzDEEkyGm4KsVY4tRj8XwJMUoX
 S90CfdAfEW5J63hxAZ2CyD9ob1+dQr2/+qR7fitWbXnL+OHKUdl3ijaQtp6OEgc3riw4
 xFs700S6DV18QOGkK27PWhxalwpxkwHCWj94kjNA0tvkub8c8sl8kNY12GzSzooN1Onl
 r+HHIHUC1HJfWymREl9w4uXoQlh+TT6KZDIoATHDpFRtn0Fon7M3b++C061LdTh5TdRw
 emsgZh4Srpkyx0S+pRp7rz7yYDHMs0Ej7HTAGoETRG1J+3Aqeh7mLT7LKOdXfqgfNR0b
 iptw==
X-Gm-Message-State: AOAM532trvEomPt1+VZLUjy14z22tbbZyVrk7PL3HrgKLbit1Dw3J1IN
 hb19Q2wu/weQayYIPm1W8ca8ul8Rw3u5CWFy
X-Google-Smtp-Source: ABdhPJwnab7sd8Y4i2UP/ajHUl8xSszgWheEZwI6Uttci9FO6RvXfWqaz/3UaSoFqd7+5O465UxiLQ==
X-Received: by 2002:a63:5142:: with SMTP id r2mr6696576pgl.248.1612403236154; 
 Wed, 03 Feb 2021 17:47:16 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 72/93] tcg/tci: Split out tcg_out_op_rrrc
Date: Wed,  3 Feb 2021 15:44:48 -1000
Message-Id: <20210204014509.882821-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 546424c2bd..5848779208 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -341,6 +341,20 @@ static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGReg r2, TCGCond c3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out8(s, c3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
                        intptr_t offset)
 {
@@ -454,12 +468,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(setcond)
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out8(s, args[3]);   /* condition */
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrc(s, opc, args[0], args[1], args[2], args[3]);
         break;
 
 #if TCG_TARGET_REG_BITS == 32
-- 
2.25.1


