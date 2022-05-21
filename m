Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A11C52F69D
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:13:52 +0200 (CEST)
Received: from localhost ([::1]:46916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCkh-00065l-AC
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbP-00080t-TE
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:23 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbO-0003z7-4F
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:15 -0400
Received: by mail-pg1-x52b.google.com with SMTP id q76so8965608pgq.10
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LqMX+PYoPOvCfsrBf9LDk+x8oxX5ugoY/7ce6aNzp7o=;
 b=i9+1U34T9xd/bX6kw9dlFyDDOBIC7gL/Fj6msV5r+9FTA8bgcMozuTRa16UKlJSaNV
 w3jzZ4eHS+flNw97DZrO2+Bj02KW5YHuRhMv1CAQNKcHDVj8ort1SCLpsZHGYjbLFNOy
 1YUfkzESNzuK4cTJnRHPjT0VecV5YtGNhMmjyQmghKOQ/xD2CsCRksviX+4L+ode7qxh
 V+bVFICiMEK0z57SEI3tOcotHWtPr+0u8E39s/ZeVqthVgZ4F4fFza4jYvq3WSOrMz4K
 61MMwbyZ+YiyrS6zJPSsfto1UhUbHi7wWnpXFlC/Bmh/YgQOrWd2eMi5yN0eIm2+Avsg
 6tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LqMX+PYoPOvCfsrBf9LDk+x8oxX5ugoY/7ce6aNzp7o=;
 b=FP9LqbVpheBbFzWBm4AfsMjzaUrOeKABzB/LXNCJEh+Vdjz5SPBelZRRs1Wg7tAnkH
 rp3kFOOSZlnTeWxQafCfDGK/EMsqp+AOaN1D9WeLgYtmwclTuuEeDTtNmaEipILqggO2
 rJi8xMViaC/xGoB39YLuc6Oqs/B0crpfmcKWprDlcZsAkxEqmbVC8Jod0uzdAQHONgnN
 rocH+4STA+xqFqDlkMqHTiBuuHOjGuaPftqH+jZu23DFuOjnSdOjRD1YPDN+OioqLaLa
 7dPIprcVPgCdnF9zdaE3fEGZ+16eAotlU6lOhi/o9WJkjXh4Zk4GvijjN+G8OupnwyU4
 UnVQ==
X-Gm-Message-State: AOAM5327rbMqiMJox/6dJ4dsPBGjvxfyR2GDGJcW1pgQkJfhmrz4uB/2
 8NKIa7Z+bhw+K/NQU+31AXV1v1hgFycc+g==
X-Google-Smtp-Source: ABdhPJws0x73K9yax4RseENN5YNTJfNOVhgvEDR7ntD/ZMPDKPENQGnsGn+UGg3uVCIdk3y0+e6bYg==
X-Received: by 2002:a63:85c8:0:b0:3f9:e8c4:1eb1 with SMTP id
 u191-20020a6385c8000000b003f9e8c41eb1mr1019262pgd.203.1653091452774; 
 Fri, 20 May 2022 17:04:12 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 08/49] semihosting: Inline set_swi_errno into common_semi_cb
Date: Fri, 20 May 2022 17:03:19 -0700
Message-Id: <20220521000400.454525-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index c6bfd4d1ba..b00ed2c6d1 100644
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


