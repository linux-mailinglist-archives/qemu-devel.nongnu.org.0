Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B143B36893D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 01:09:00 +0200 (CEST)
Received: from localhost ([::1]:42780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZiRP-0003aW-PI
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 19:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLF-0005Ck-5l
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:37 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLD-0007pY-HA
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:36 -0400
Received: by mail-pl1-x633.google.com with SMTP id u7so22494823plr.6
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LKfV1I/Csk0qYQwhR0M4lp6iP2nYp4OTkUQuJPZGosY=;
 b=C4QyKbBANIxwH1YFMbdaY3BSVgMwjkdCbJ8cZPHBoIwx1zIxj9mDEdfin8uRo/p/Pt
 i1qwlJPHlbRLOOnthiFVWEpdZbkTF5JQnF/8ekARH+LQ6CW/C/MvyZN17xUMrnj9wTdi
 j/h4AM6dKUSF+j5jiRFxmFOo79z/y9rAjPttt11qKT6WAh0s5nEF715C0LjCCfhz88a6
 E25AREdKNsasDGu8rY40qKNo/mvPeiGjCUyPioguruGBzznjancd0T5J7fcW0nbz3f6b
 bZmCce+Cw8+9bvx7UtVL2HMJbV9XtT8wUlCoEV+ZQuixfli/ELuO+EOxYriZvViR4c8q
 dtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LKfV1I/Csk0qYQwhR0M4lp6iP2nYp4OTkUQuJPZGosY=;
 b=bmN/8EH9Effo7A1tC4kTCwnQkNYaaRlRxMQgl0s6ZdHpzftNROukyP0dynAEHFnJkr
 K1twtAZ8+wBpDLzpe9/qr9aKaICMSJpIPc6LtzOtb7ZKQMpcGRenequeBMROIZkUPSwM
 sWDaOBRH5SXceleqCO3G9S98vXc7PpDqyDEINAu+dL7IOBtl1ujyBYsrO+TzEDsGfNhK
 8SWD06Ff8JS1uwJfifvzAswx+B9B6pcW8JxG9hZxZCiClTrdlmHfxiApdIIK0apWW1/X
 vGZtadv6RpHKfoK26E+wQ9myuYk1bmhMJpM+GAvoI0UTkwlLDCBloZIpK9Jf48WD6NXb
 kYAQ==
X-Gm-Message-State: AOAM5322CtnbpBsBrOkKu4FZfchM+/jesWH4/++nCj3D26XdsjbGgw5b
 4bR+DnDxnVCWUcVc5bI6FwXhsffd15jrNg==
X-Google-Smtp-Source: ABdhPJx5Td1YDbJzHiZ16Y8821MEwhqcD82ABQhnXZKBElIJvKnYvAAvszeJtWmup0JPCsUXHhf/gg==
X-Received: by 2002:a17:903:18e:b029:ec:b394:981f with SMTP id
 z14-20020a170903018eb02900ecb394981fmr1161614plg.6.1619132553950; 
 Thu, 22 Apr 2021 16:02:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z12sm2930605pfn.195.2021.04.22.16.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 16:02:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] linux-user: Tidy TARGET_NR_rt_sigaction
Date: Thu, 22 Apr 2021 16:02:27 -0700
Message-Id: <20210422230227.314751-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422230227.314751-1-richard.henderson@linaro.org>
References: <20210422230227.314751-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Initialize variables instead of elses.
Use an else instead of a goto.
Add braces.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9bcd485423..c7c3257f40 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9060,32 +9060,26 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             target_ulong sigsetsize = arg4;
             target_ulong restorer = 0;
 #endif
-            struct target_sigaction *act;
-            struct target_sigaction *oact;
+            struct target_sigaction *act = NULL;
+            struct target_sigaction *oact = NULL;
 
             if (sigsetsize != sizeof(target_sigset_t)) {
                 return -TARGET_EINVAL;
             }
-            if (arg2) {
-                if (!lock_user_struct(VERIFY_READ, act, arg2, 1)) {
-                    return -TARGET_EFAULT;
-                }
-            } else {
-                act = NULL;
+            if (arg2 && !lock_user_struct(VERIFY_READ, act, arg2, 1)) {
+                return -TARGET_EFAULT;
             }
-            if (arg3) {
-                if (!lock_user_struct(VERIFY_WRITE, oact, arg3, 0)) {
-                    ret = -TARGET_EFAULT;
-                    goto rt_sigaction_fail;
+            if (arg3 && !lock_user_struct(VERIFY_WRITE, oact, arg3, 0)) {
+                ret = -TARGET_EFAULT;
+            } else {
+                ret = get_errno(do_sigaction(arg1, act, oact, restorer));
+                if (oact) {
+                    unlock_user_struct(oact, arg3, 1);
                 }
-            } else
-                oact = NULL;
-            ret = get_errno(do_sigaction(arg1, act, oact, restorer));
-	rt_sigaction_fail:
-            if (act)
+            }
+            if (act) {
                 unlock_user_struct(act, arg2, 0);
-            if (oact)
-                unlock_user_struct(oact, arg3, 1);
+            }
         }
         return ret;
 #ifdef TARGET_NR_sgetmask /* not on alpha */
-- 
2.25.1


