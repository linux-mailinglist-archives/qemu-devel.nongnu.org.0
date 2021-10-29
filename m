Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F4743F6C9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:48:23 +0200 (CEST)
Received: from localhost ([::1]:33004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKkY-0002Oc-HT
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdn-0002Zi-QR
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:19 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdj-0000Ne-Kj
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:18 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so2845370pjc.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SdotFvU2e4IHfnDwno1rmmgso4RvH1V9XL12SznLyiA=;
 b=CJmk7W3QcEmbWy/R4CXkxGI+fhs0okyNoAH5j7N3lSSGX68bXXG17FV0jXNRGjMX06
 81Us0JwKvTAl9SyM9luR9YnHJF+PR97Y7hKPjdWV6o/Ekk4RPDgSi5pCjPpgNXBkpyXE
 wT1VpW4cCseBaTNjQh4rJPVRHIa82XYmKARMVIAUjOFVeuizW8+hVpN+x9lP+KUlQlbk
 WbBar9jLQWWBV4gQgdhTg3GDbuNshzJHpsMGS20mUvkBihVxR3KsOjMWKHK6KQeQfXdR
 2MhwMUOg+e1Uiod9yvdJd9y9FLR964UgG0A2lISlqm6ZWaOByqwX4dfvpFYP2szujsTi
 UUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SdotFvU2e4IHfnDwno1rmmgso4RvH1V9XL12SznLyiA=;
 b=1Uqvg/MgBD2xJbYrvq4sGTr34E/4FTZmuBqg/z+HMBfVXdBhC96CvF8Y6oMQvvGCQ+
 qvLUuGiXG+B31ENoya0g3FJWb7jr6eL+ydNSPjpGF8Tx34QbZQZLNvAmDlTanP6UzRMt
 nEoiGhruRqPKA7GMpeYQOnMeTQN8N8hcFo30Z3Wsg1669iZOa25KYoKn+YiiqR+zS8dn
 QQ6B7pUvqnZvyUD6fvN0alAW9bx4uStxVoWmx7um7gXvQyvACyY98zBkVwM/msFIG+kR
 73ObCL3vuw4Ed9jz5AK1eEDyf4dxaeYjB4EffpcChJEyYr//s0w9n5vOPOgWuof9nwiI
 +xcQ==
X-Gm-Message-State: AOAM5312x0WOoiLNoPnnXvmTbrNsYdrEiCgRmQutSU3kgnIugqTKP/Hg
 Qtlt53fC2NRpo2fMBQEtS3XYHNTVmEZaXw==
X-Google-Smtp-Source: ABdhPJzRJ7H0OW8oO5FCOM3YrYCDntzSxUsA0dfsZ0FAvdZtHf1/629wBCBj8HiRj56NaWbhit4nKA==
X-Received: by 2002:a17:90b:3793:: with SMTP id
 mz19mr17537268pjb.6.1635482233044; 
 Thu, 28 Oct 2021 21:37:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 52/60] tcg/optimize: Use fold_xx_to_i for rem
Date: Thu, 28 Oct 2021 21:33:21 -0700
Message-Id: <20211029043329.1518029-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Recognize the constant function for remainder.

Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index f8b0709157..7ac63c9231 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1624,7 +1624,11 @@ static bool fold_qemu_st(OptContext *ctx, TCGOp *op)
 
 static bool fold_remainder(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_setcond(OptContext *ctx, TCGOp *op)
-- 
2.25.1


