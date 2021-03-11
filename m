Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371DD337679
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:06:06 +0100 (CET)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMt3-0005lg-7F
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUm-0003oW-6i
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:01 -0500
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:41580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUZ-0006cs-UF
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:58 -0500
Received: by mail-qk1-x733.google.com with SMTP id x10so20777037qkm.8
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RzFAVc3cWW3yr0pGO36GqM64ymG+VJfs9mt8bjfFgIQ=;
 b=r5YXuX8i/DDg7ZM9ylBOupm3no4Mgk9trgLi3BFqAJJUSVsgBe/rwI1YyiyakFiN5b
 IsrGvjFp4XfJYr331xbcBmuN7iEbHowwGA9wmZDLRnmN1UWdLRFCLe5lFl3o4rzFHjjZ
 iDoWnR+4sMY6ZP0tMLbhsaRvsxRtILBBHdMoo7o1ltlT9+GbRvTWYaexVKxxaBdPjKqd
 ixs8gW//5hYdz4g/Sea26Ucm2rOap4ZhYAYKnNehVRFJ3/O8VsCCTWSNnXwv/SLWmaj7
 BGuJy+RxJb2pLJfrMECdI6XtlWxesvWVvuiKCOP02INvcQQcjSSNP1Y0FLxm9Wn725Bx
 E2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RzFAVc3cWW3yr0pGO36GqM64ymG+VJfs9mt8bjfFgIQ=;
 b=dLP9b5B9+SFiuOTxCP4MLC+GlsLSSr59GuQMWmqdNw/phEDbg9mDX6QH5id6kDywsC
 Tj0xPnu7A3Gr8br9voSboSxmjygKZz3vYnhDhetzwMAhOrElhLfwL0YAFLdIv4rTZGYR
 WiXavsh6UUzrV99LwKm89hlcB/KgoKBmyOHgQ0RhRHDSkdc1SGuGcQQPixCdFRAOFGMh
 QTZHwJEPTS2VhAEOuugYNf22xY/sx7ytY+fO640tuGf1roO8tn+VGv59U0N+iaQHCGhL
 zp7HQJit2L4CW4M8SxN6phyFeENRDeDFXtvjC43dT56GHekgmyh5s5kPzPd56RKGcSzB
 MVjg==
X-Gm-Message-State: AOAM532bIj4AkjxP/zwsGAPNd43Sx6ZXi77i4v0z0ZlgWprJ3EoKJ7Eg
 ovQFhVPpzsIypk2BLnHYGMdaqOeMiUfuafR4
X-Google-Smtp-Source: ABdhPJwEKrHbYt2b0oaHjKN6mcxEm68woHPVBhQgTRLILtlHEiGaF8Sk6u/8aX67MihjfTe1U9Az0w==
X-Received: by 2002:a37:30f:: with SMTP id 15mr8052434qkd.494.1615473643907;
 Thu, 11 Mar 2021 06:40:43 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 31/57] tcg/tci: Split out tcg_out_op_rrr
Date: Thu, 11 Mar 2021 08:39:32 -0600
Message-Id: <20210311143958.562625-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 272e3ca70b..546424c2bd 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -314,6 +314,19 @@ static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrr(TCGContext *s, TCGOpcode op,
+                           TCGReg r0, TCGReg r1, TCGReg r2)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -500,11 +513,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_32_64(divu)     /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(rem)      /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(remu)     /* Optional (TCG_TARGET_HAS_div_*). */
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrr(s, opc, args[0], args[1], args[2]);
         break;
 
     CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
-- 
2.25.1


