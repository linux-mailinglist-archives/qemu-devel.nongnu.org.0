Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64A86DB872
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:05:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkys4-00045h-EB; Fri, 07 Apr 2023 23:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys1-00044y-Al
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:05 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyrz-0004V3-6G
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:04 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-24059dcdd90so186174a91.2
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680923041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIvMa6yODJNeTBsR2OjDHB1GmvQgxFX82aBlXYH2wug=;
 b=VQF/omSn3a38pU5ljC0bM2Y438nmFjf/SeLl9tiLfA/wt6kzi+1h9a2Wc6tHgXGO+7
 Y0YLRVKW5MBqGN2uSqBRL6fa1FljuIKXtMd+jjzGuoIW70eN9UG47DsQniNX1EUkRk6l
 Op1T/xlnJ9c2TSUyhQGtUEq9Ex9Xp8SO7srfG9VggsTbWDCT/89hZVK+Jq6QHtQvd22k
 Sq7QXYXvTLh6Lspa5+HkFt97skV4Wnh54/MftWbCxEpjzA9ncv9jWLYp6SQqeMlgvoWK
 kSiBXZGv/8wjfOA2Eg6nKnKGgAuN6rXdtlnP42RMqKrFkw/YnFcTC5EYMWIviKjMmEgG
 jyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DIvMa6yODJNeTBsR2OjDHB1GmvQgxFX82aBlXYH2wug=;
 b=KTnx7DQ7MbMZZCSZaH+Tl+IlrRxAJzBXoRzKBJerCB+LC5T1P3n6YXT6E5OMfuiQLX
 5kEn36JCQRtK5GVFmCvAWUyHtQ41MBqu2laySYFCAF6CmsrCh6Pm4FvJ7mwvLyN9F6Ug
 MhEPPPc728du93IKrUwFjt3uy6qvotrGlbYIh/BzRahsrsbRR9w66lO1dNueNUjkVSxR
 3B5NyqGXQ3Cdgc/A5T1kaFnLNrKXOKdA3B5AjBTUNzGFEjKT6eNfF4yDffehDBMOuuaA
 ZjKFVOd6SsJjzhsv6meyrFYAna3YSsSCG0GWwN+Sn1iehXpfT7uQfhdM1tDGYVquxIkr
 Yblw==
X-Gm-Message-State: AAQBX9fCgsqByFNrgsrO3EImiZjF0OB246gL81nOdK3x6ECJcTneN9O5
 Y7NewOdC/g+H8iBaXjy4hFL7XW8EA21ciQmYe9M=
X-Google-Smtp-Source: AKy350bm9LgN3ObC87to4skKX+LkfgfJgHB8Py1tNg86ex7jHtJr/30sjcKuGd+P90+8JtqGEncxXA==
X-Received: by 2002:a62:6443:0:b0:625:ce21:3b1b with SMTP id
 y64-20020a626443000000b00625ce213b1bmr3852802pfb.3.1680923041640; 
 Fri, 07 Apr 2023 20:04:01 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3687025pfr.213.2023.04.07.20.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 20:04:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 01/12] tcg/mips: Move TCG_AREG0 to S8
Date: Fri,  7 Apr 2023 20:03:48 -0700
Message-Id: <20230408030359.3368868-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408030359.3368868-1-richard.henderson@linaro.org>
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

No functional change; just moving the saved reserved regs to the end.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h     | 2 +-
 tcg/mips/tcg-target.c.inc | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 68b11e4d48..8cdc803523 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -76,7 +76,7 @@ typedef enum {
     TCG_REG_RA,
 
     TCG_REG_CALL_STACK = TCG_REG_SP,
-    TCG_AREG0 = TCG_REG_S0,
+    TCG_AREG0 = TCG_REG_S8,
 } TCGReg;
 
 /* used for function call generation */
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 34908c799a..c24b780818 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2493,7 +2493,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 }
 
 static const int tcg_target_callee_save_regs[] = {
-    TCG_REG_S0,       /* used for the global env (TCG_AREG0) */
+    TCG_REG_S0,
     TCG_REG_S1,
     TCG_REG_S2,
     TCG_REG_S3,
@@ -2501,7 +2501,7 @@ static const int tcg_target_callee_save_regs[] = {
     TCG_REG_S5,
     TCG_REG_S6,
     TCG_REG_S7,
-    TCG_REG_S8,
+    TCG_REG_S8,       /* used for the global env (TCG_AREG0) */
     TCG_REG_RA,       /* should be last for ABI compliance */
 };
 
-- 
2.34.1


