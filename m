Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93F743D9BD
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:16:15 +0200 (CEST)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvtn-0003Dm-0u
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPj-0001Zy-R3
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:12 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPe-0006Dl-UQ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:10 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x66so4539491pfx.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cdbRxhQ1wpUhR1+s4AARw22mXFf4Uzb2BWNb0AuXuG8=;
 b=hsgbcnLzOBX8cViVyh1Jec4LpNmsCMKMIj04b9RjP3iSMSF5GMgqUJdaQAK6VwWodX
 7t8XJR0ceJfDq5yxAz4JlUd9jVkWDRvM8cgOZcvHFZRD6HoCx6SKEOuuY0U/HgHAb/Y7
 jPvTghvYGp3LtJgXWdlkRcSeU2brl50subgDdFixSOtdJHpNru+txQ5NcEc//TbRktLv
 d/QyVSRhs5CGVfdYyAxXhnx4jehRMLWiTnsvdItPDI9VM+hdJx4vwOuhQG/OqZa2/z0U
 xyOZMGPCq9f/sYbqHgd8dyw6AmZYYGTsVY388d7vf0PU/QsnHx1eJILXvY3aaYqFCmFb
 +Nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cdbRxhQ1wpUhR1+s4AARw22mXFf4Uzb2BWNb0AuXuG8=;
 b=a1HP0G0smkB7zL8TsnuCIf3tZ9+fLRmkVapHK0zjWCQYdf08LcMRCZMHJxp2xHfUA5
 Z3sXKoWK25E5VNkTCKkiNzkbtiRstLiS6TCD2cBbeMLRHw3Z9dSKtsteWUKsn8HfvgZn
 XicY2SDy3iNWMnCVGogXtYnf/ipFqz28YfRM+nvYRaH5Ksp0d6PDDEW3ISY7uz+Z4ltW
 EDBc3D/kvoHn7+hBC4eLL5yuh6aRDZcxVL6zrlNjLmQtcjleGO0sVTDRPFpa2LtbD2Uj
 y7HfF60L4nepojR7SiIWFJibsW7W4j6ziRunOILmGOAC68m9gQW5iyWl7k5M9Z4j+DRy
 nlYA==
X-Gm-Message-State: AOAM532XOb+mtn96dtARaaTY+TomZt7wx9N4drcMKxm/UNasrRA7EfnD
 GAd0Z1MQpV/kD6xoXxz55rvHHYbMxa9rOA==
X-Google-Smtp-Source: ABdhPJwKjI0tqKr0bj5sFe6udHJfOfFWLRGPGKUOhz2zjR7NFx3Qt/UXXObKvKK8KfxeXysRYL4oBA==
X-Received: by 2002:a05:6a00:23c8:b0:47c:37d5:430 with SMTP id
 g8-20020a056a0023c800b0047c37d50430mr1532748pfc.72.1635389105685; 
 Wed, 27 Oct 2021 19:45:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:45:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 50/56] tcg/optimize: Use fold_xi_to_x for div
Date: Wed, 27 Oct 2021 19:41:25 -0700
Message-Id: <20211028024131.1492790-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recognize the identity function for division.

Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 907049fb06..f8b0709157 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1218,7 +1218,11 @@ static bool fold_deposit(OptContext *ctx, TCGOp *op)
 
 static bool fold_divide(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, 1)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_dup(OptContext *ctx, TCGOp *op)
-- 
2.25.1


