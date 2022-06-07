Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C2541B97
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:52:21 +0200 (CEST)
Received: from localhost ([::1]:36524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyh7c-0005Ki-QK
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5c-0007Cp-20
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:13 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5a-0001KN-FX
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:11 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so21944920pju.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S8Pjs5cOqk+oGTnK7FdV4C/Z/WLlWltx0dBsRwUkzCw=;
 b=HPrXU/kTRijuDnYeEVjoKIVG0t8qu7hjCgUGJV/pB4igexTPbrbINj6pNPtNDNy3sT
 LvsQ7ZHk2GLEKLQy8SF80Lb5OBygbR3S8l6m60hXkEqqhNSzeORiAatLmFs/4MD7dwS2
 4etrQD/wFjv1pFOV8nHqFNJIzEQ58UAlxzfIXkxVFWJ4WR1k9IK1sUI9KQzn5WV5rDju
 pwByaWGUrkNYViWIRrXYRckGR2QD4cX4l5OLUKapy+hZit1ZO1JgsZE0Lcjlwx9SLEg0
 SkcGgquR1QRDWJZs3CU8QhoNZpYyzE8lh+mjQ0qUgsvsgIzrrXhIFXAZHEmlFFZr7wT2
 E6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S8Pjs5cOqk+oGTnK7FdV4C/Z/WLlWltx0dBsRwUkzCw=;
 b=NwAxUNy2SfCFD5WocCNlagANzw5vq3kvtre6V5LvX4pAMOAvpCrJFf0DDoQF6wA4O8
 JWm26VI/14QuxfUeIlaeeH152DRuLNyIThwj0wrgZ8VMtC9pLNjsPxmy1kuV3/Mh5imZ
 sxXRFY5QWY96888bmmFUSTuYMmji5PsJGa/LQr/H9hnS+FIDopezEeMKOde1kdvpk3NA
 qU+Xh6mkWfWogymP9t2wQZk91X7zCGK0RE6uR18E8umnnRDmaMktGsrSwA/50+mofK1z
 SyYadLCSpLT9Pcg8/iOtma8bB6icFJc4FLO5z4+MPCrsOVnqzf/mM6IYMN8Q6OPs9xtC
 9L8w==
X-Gm-Message-State: AOAM533t+JyZuUi/3wXGnkmXis6tamyRn60fygd9z2MGUhtpo9eOiMbh
 pfDvhUtiM+Dsdo84oa/B8p56NXuxQ9Ih/g==
X-Google-Smtp-Source: ABdhPJwarJuaUNvcg4xcud4APcFiAAzZTRJiG1mZguhwe0d2pCabDHzVGQ/j5pDzZzT+BLrZE/Mpmg==
X-Received: by 2002:a17:902:7b93:b0:162:bc8:935a with SMTP id
 w19-20020a1709027b9300b001620bc8935amr30433332pll.44.1654634769049; 
 Tue, 07 Jun 2022 13:46:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 11/53] semihosting: Clean up common_semi_flen_cb
Date: Tue,  7 Jun 2022 13:45:15 -0700
Message-Id: <20220607204557.658541-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not read from the gdb struct stat buffer if the callback is
reporting an error. Use common_semi_cb to finish returning results.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 88d6bdeaf2..cc13fcb0ef 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -346,15 +346,17 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
 static void
 common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    /* The size is always stored in big-endian order, extract
-       the value. We assume the size always fit in 32 bits.  */
-    uint32_t size;
-    cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
-                        (uint8_t *)&size, 4, 0);
-    size = be32_to_cpu(size);
-    common_semi_set_ret(cs, size);
-    errno = err;
-    set_swi_errno(cs, -1);
+    if (!err) {
+        /*
+         * The size is always stored in big-endian order, extract
+         * the value. We assume the size always fit in 32 bits.
+         */
+        uint32_t size;
+        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
+                            (uint8_t *)&size, 4, 0);
+        ret = be32_to_cpu(size);
+    }
+    common_semi_cb(cs, ret, err);
 }
 
 static int common_semi_open_guestfd;
-- 
2.34.1


