Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446186DB82A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 04:44:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkyYM-0007LE-AN; Fri, 07 Apr 2023 22:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYI-0007HN-Ey
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:42 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY3-0005cx-9i
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:42 -0400
Received: by mail-pl1-x62c.google.com with SMTP id o2so360149plg.4
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzu39GMRV6RuI6NlIOVSyEEbNk34csPDYcvNvBnA8aU=;
 b=BV4QZLoD9jWd/KXOoAfWwR5QX2ZB5xwkbSayYZPtKFJA7xaXLzTS5HqJyGZPLYlOm2
 dNfmSkrBjBUqD/vKNXWMPv0ZBfxpU2GmNNAhhaZpdxqKYcZoFfYW/pqwtQYtmKU6FaOL
 9k+grM5btznLFtRGn10n4ASK4z4v6zk5JwwuUpfenyBGsPISlJ0koP0ZLSK9hOzK+LeW
 f5781+DGyR48TS2OAUabQUWlK52TxLbY2bzlt85j2Oj3IBFYwXsGnLxZ5CCbw9XMaDuc
 p60Pvtg7tS8bL/6+B9+3kxiUzfsngtCpnK7NS/KcZlzM/cCSHWtnoUH4cvFnBp9MP5ST
 R8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzu39GMRV6RuI6NlIOVSyEEbNk34csPDYcvNvBnA8aU=;
 b=qweH5xIlzp1DyOtxhSoybYQTiUN7bOO6jwwEIjck7jUhH3CAkssq7RLo2WjLpjIbYl
 puHFiiZ9dqQthwrr+FdU9rnpbsfgaDWueEO4G4E+Lhp9muMI4e0RFxFxGvmlG7+tuTcT
 w65AIIlUglfrP1ENvJD9rz56wqB0BtUyqNMF8H9Q8IVvTDSwm3uGSwb4WQsMp08CWX2m
 jFGvi2ZNugXrLTKpLDsAKj8qSUx8cs0XvtJgY+B137ANFp2r1wBn+hEyCCMVK9tyY+5y
 qZ2j5+WAch7XNKr/NBDYnkI1JIvSG0KNDKzmuCSNk09vjvXLvVL0n8PF0dBPVNHRylu+
 9mMw==
X-Gm-Message-State: AAQBX9ejOrcYgJHV2djx67NG5lcVLo+oDGBk1JLWQT82CBleihFG1uks
 IpHbdZYcWQbM7UGaMiQGv5yax6W2IhGD+ytRy4o=
X-Google-Smtp-Source: AKy350bjlN+g2dEDL+Z3hNVyW7nM9r6v61fMZl9pFSqzL5F7FEXY6cKd1tSdEX94EpmipjKaNZB7PA==
X-Received: by 2002:a17:903:68d:b0:1a5:f:a7c7 with SMTP id
 ki13-20020a170903068d00b001a5000fa7c7mr4317569plb.0.1680921805877; 
 Fri, 07 Apr 2023 19:43:25 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 10/42] tcg/loongarch64: Conditionalize tcg_out_exts_i32_i64
Date: Fri,  7 Apr 2023 19:42:42 -0700
Message-Id: <20230408024314.3357414-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Since TCG_TYPE_I32 values are kept sign-extended in registers,
via ".w" instructions, we need not extend if the register matches.
This is already relied upon by comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 989632e08a..b2146988be 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -458,7 +458,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
 {
-    tcg_out_ext32s(s, ret, arg);
+    if (ret != arg) {
+        tcg_out_ext32s(s, ret, arg);
+    }
 }
 
 static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
-- 
2.34.1


