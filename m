Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5921B55BE8F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:58:19 +0200 (CEST)
Received: from localhost ([::1]:44408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64Er-0001GF-3T
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FA-0002bG-S6
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:32 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63F9-0008JT-1P
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:32 -0400
Received: by mail-pg1-x531.google.com with SMTP id s206so2071883pgs.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=POGsKDtk5VyDw6taq7a+DFAfnB+E161joQzVuaaJQNU=;
 b=qr3nZNPV+gT+RDcFuHjFYXlusBpL67vTfmVw0cWvM7lDevygg5+IWRXIYtvVlTeZVP
 4oaox/3pj8dfYUGXFq+3Mkc5GaTUIbgmYzCu9tSmoYwSVmOOupjGEwDK5WwcLFB5PxHt
 ADZeMsdrcKy9H+CNOwhdwmQ9zykrxo8Zrx2+WbLigEvXXgzQh0JYjgiOm5ZmT2QmZAe9
 8NAUd26fh/HDQcvyaLnGR5WR2ipDSjphmxFYTk9dkmcujUi210j/W73GhIEqbkIM/5dU
 yChE/O9WjYRjLTQVLPgc1iPs76Spa7Z+rD2TMtpwYpzUWtsKjPQUnvW6g8kR8VRZhcdf
 eVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=POGsKDtk5VyDw6taq7a+DFAfnB+E161joQzVuaaJQNU=;
 b=STF+f82h+XUvf03c8exTgvzgNjea0dK+GjfEEgImYTe9G4c9j5kB4mMZzRgmiAZSeE
 r+KlzdCEZN4foD5gMb+ysJqZNxPd2gRk4JTMssXbtIeJBdJrczCMkt2Y84g9LImnMiG0
 Xkx+omoD5rA/HIRzhLTJhy+NjJeX+Yyuj1FmKxfzdyJ5SCkzsTBD+NbtMJl5tel6KBty
 iF2paFyEplRXxcsaKYiHlM0OqZ+pRa47hBQQve+XlcMZQ5/+L7lw9Wt21QB5W2OfPQrY
 LFogj9Ir2phI2jPzxcZ69lftVG7jiNYUasylTSZeyWWZgCWFncXw4niKQ/UzHMtvDVi+
 UJbw==
X-Gm-Message-State: AJIora9KBusHuUmWdmfLSc9+FHBDQuhDa3rxjVoVzy5NYOgLJTgYkOr1
 cSQGjwU79SgWnF/jJGFBBSRCKhbjxJdgMA==
X-Google-Smtp-Source: AGRyM1toLl6n7kCaqwust5DmgbEWOrrHiP8MaD7O3a1/1hJZdqZ3BUpgRmUEB3FeoUhEGc2rpc9BWQ==
X-Received: by 2002:a65:4907:0:b0:3fd:bc3e:fb0a with SMTP id
 p7-20020a654907000000b003fdbc3efb0amr15347689pgs.123.1656392069707; 
 Mon, 27 Jun 2022 21:54:29 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/60] semihosting: Inline set_swi_errno into common_semi_cb
Date: Tue, 28 Jun 2022 10:23:12 +0530
Message-Id: <20220628045403.508716-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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


