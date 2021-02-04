Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2D030EA56
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:42:03 +0100 (CET)
Received: from localhost ([::1]:37338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Uao-00019p-3l
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjs-0006EE-45
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:21 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjj-0004BF-T5
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:19 -0500
Received: by mail-pg1-x52d.google.com with SMTP id o7so1054311pgl.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EsUj7sq9+NLQtwJZ+3yHUWsYmpE8j3VuEo3uruSYCgE=;
 b=KstoxnUmgvmkDQoWpUNgeskekrIFS0LKIQZ7itcoVV6L3bV18HgvncFiLNU3hleiN6
 edqYE0f4r2CqMeKtgTucUJkTFwuzwciXRt+ADweuNlAycqmDd6LLJRR5j2ePQGN+mzrX
 6RUZKSKNbDFghBCND/3xnOtEmSXTeoi2hYMFXH5pes6rTV0oqNGgQ5EiflcdsBFBFG5J
 FYwqn5z7SxG9Yyj6u8sRqLeYPIa9+CkhNURojPMmR6Nd/wXgzCHvIG3dqBmIgZINTon5
 4wiIaHoyeBEw7F+dGehWWkInaiA2sNxYsX6mZZQ3IXIvRLXG6H6zDZM9riWgzII05t9I
 PK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EsUj7sq9+NLQtwJZ+3yHUWsYmpE8j3VuEo3uruSYCgE=;
 b=iFoNNiA6ULnI6K4C/1pDR5/ZxkeWoI6tuoCYbKW8NBK+pvTYo1C7vlyeeUrIDvSKZU
 C3/ooRmSvMC4fUMgx9i1fOBQEzn8DB7lDKwkuVNG7xxl/L8E6gbX6TBLaqCVbCLac0aS
 I6ttJu8MYg1cOf4SiOgY49COcyyCeSxj5LUcqiFdh3Ep7savKFMbVbE1sbLsn6MSoChR
 SEMvIFLCWMcgVkSIOZjInewHfz+toldSAx7pVpDZKQCQBMOBqMKZ36ngeCVRfZ98BIp3
 ra2Ny6T0VUIry03WAgFbrOz0I7hWR10HzyZTRQ7nd1D8HUUqZVngH4GPW0IdOzQVQLlT
 +rqQ==
X-Gm-Message-State: AOAM53374quEtPqjv4Rz41bUfIunxjWUQJNO+01fxC5ex3erW7ejnGnM
 0Ek/oPshWNpGaNnNHLyMp+Gx+oAGikAgMQLy
X-Google-Smtp-Source: ABdhPJxa3cCf2YCryv0nKRzgc850sUy+zzMYeEMm1aVCki1R8u6HIi86w9PzztyXNDcqCSTA5vlB6Q==
X-Received: by 2002:a63:43c6:: with SMTP id q189mr6568583pga.245.1612403230202; 
 Wed, 03 Feb 2021 17:47:10 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 68/93] tcg/tci: Split out tcg_out_op_l
Date: Wed,  3 Feb 2021 15:44:44 -1000
Message-Id: <20210204014509.882821-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
 tcg/tci/tcg-target.c.inc | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 707f801099..1e3f2c4049 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -283,6 +283,16 @@ static void stack_bounds_check(TCGReg base, target_long offset)
     }
 }
 
+static void tcg_out_op_l(TCGContext *s, TCGOpcode op, TCGLabel *l0)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tci_out_label(s, l0);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -408,9 +418,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_br:
-        tcg_out_op_t(s, opc);
-        tci_out_label(s, arg_label(args[0]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_l(s, opc, arg_label(args[0]));
         break;
 
     CASE_32_64(setcond)
-- 
2.25.1


