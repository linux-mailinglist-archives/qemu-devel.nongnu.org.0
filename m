Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79207541DF1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:23:40 +0200 (CEST)
Received: from localhost ([::1]:37400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhbv-0006nx-Gx
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5c-0007Ct-4K
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:13 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5Y-0001K0-N0
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:10 -0400
Received: by mail-pl1-x62e.google.com with SMTP id o6so10746352plg.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=POGsKDtk5VyDw6taq7a+DFAfnB+E161joQzVuaaJQNU=;
 b=cdJA+OhuMNA9km320k51AmEz84uDQtA2I+HfjAtThXtywErjqPo6adztkYtsynTinm
 M37tzfBf233PdzjNY8M4U6VOLA/2A4gzbDUgJWPGytGhQtv/5sTcmWt4J5V/aDNVKzgP
 lt1TerMW/o5IFPlBVkuwJN82UKAFT8iZy96C4FzQFc9wOUFN5syUPfs9ueSwiqU/vX/f
 GBVsAdDwsiunvC6nc/s7puiw1BvrJxVgwCOHLcX05mG90eorlt3pGEuyF90/9YQ/c/7g
 lFxnpXrgW7NLcp38ULaQV1vLPPFrL+ohy+wkxqN7qF+JlpukS5TTa8eewDkWUSLgDwat
 A/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=POGsKDtk5VyDw6taq7a+DFAfnB+E161joQzVuaaJQNU=;
 b=s0Pd9WCfp1le2iGSPOeSL1LEjcz1T/RydD9P7vNEnhD+jNNL2frJPQmi1ylv18ymh4
 JmnR6eOF2w96RrEV7FcDE5OA8UgbvOCk7W77KHqOBm6VO9MeLdOW5soYeZvdH3vhs4d0
 y0Xgi5nlBPP5J/Rtw32nD/iGfCpUv3itCEiqWInEpFBoQLsLn4PF6CKwAy3dQbUPBeVT
 aDwizC3fITbd1zEd7YbSyn5hkzFlH/gIdABzdfVyVod2AisaenS0/ZL2BNk8iKJSLbMk
 Mw6Gh2s6rUvUTMcOpCdPZ+vVo+/h/Ni8evKQbfwG24Uv+1zXdOnqKFB4R4TyS8vIuDKQ
 ZXDQ==
X-Gm-Message-State: AOAM53307974niCvnOcibBtOUAX64aCNhcv05BWM42oZtKIzUZYYYIoK
 fpBsckt0brbMtjOXvUYKBx7yxxV0XyjcBQ==
X-Google-Smtp-Source: ABdhPJz44RxGbPIEpoqpQWa3OcIo6xqBJgt1JuTTETHNsRgNhFLx6uIICGklUN47sETF9uN0wFoTVA==
X-Received: by 2002:a17:902:d4d1:b0:167:8b6c:5254 with SMTP id
 o17-20020a170902d4d100b001678b6c5254mr7558835plg.142.1654634767466; 
 Tue, 07 Jun 2022 13:46:07 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 09/53] semihosting: Inline set_swi_errno into common_semi_cb
Date: Tue,  7 Jun 2022 13:45:13 -0700
Message-Id: <20220607204557.658541-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Do not store 'err' into errno only to read it back immediately.
Use 'ret' for the return value, not 'reg0'.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 2fa7f23d8b..9d1f13ea8b 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -290,28 +290,29 @@ static target_ulong common_semi_syscall_len;
 
 static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    target_ulong reg0 = common_semi_arg(cs, 0);
-
     if (ret == (target_ulong)-1) {
-        errno = err;
-        set_swi_errno(cs, -1);
-        reg0 = ret;
+#ifdef CONFIG_USER_ONLY
+        TaskState *ts = cs->opaque;
+        ts->swi_errno = err;
+#else
+        syscall_err = err;
+#endif
     } else {
         /* Fixup syscalls that use nonstardard return conventions.  */
+        target_ulong reg0 = common_semi_arg(cs, 0);
         switch (reg0) {
         case TARGET_SYS_WRITE:
         case TARGET_SYS_READ:
-            reg0 = common_semi_syscall_len - ret;
+            ret = common_semi_syscall_len - ret;
             break;
         case TARGET_SYS_SEEK:
-            reg0 = 0;
+            ret = 0;
             break;
         default:
-            reg0 = ret;
             break;
         }
     }
-    common_semi_set_ret(cs, reg0);
+    common_semi_set_ret(cs, ret);
 }
 
 static target_ulong common_semi_flen_buf(CPUState *cs)
-- 
2.34.1


