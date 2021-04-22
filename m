Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502B2368931
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 01:04:44 +0200 (CEST)
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZiNH-0006qr-Bs
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 19:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLE-0005CN-W4
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:37 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLD-0007pT-2g
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:36 -0400
Received: by mail-pl1-x633.google.com with SMTP id 20so20356068pll.7
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9IBgpRlXRDcwQhpg7EYQ7Dn5EzD7vaEg5bq7L4WY5HM=;
 b=avWb8ynRA7J49Tc/sUJZVMIW1LAdjHBf/5vjzQRzWX7xOKc08cIafzUFQtskoiV3B0
 IScMgUuQhJaROSWth3xdwKMPX7O3L4d7sMESOi1j5tx0EtnT7Vk10UOIMmIuanaLMYNl
 d42DVyqFyj0wd6z8QmteiBpXOTE4olQm6hFYJdT99XkBFlLONCN/dybefuUM4DBhdUrw
 NwSB9TpgIQLN8aiIEjecvoGDqGW6KBw3VkhXUI6UcWF+i8/xpawayEKW5mC+OUVeG4sk
 BDBwluwNAiBcESviTIa0AbcXFGSnuWXpZRcnEbxV/4VhGa3dklaW3HIJAWZ9SSSdCRqY
 VzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9IBgpRlXRDcwQhpg7EYQ7Dn5EzD7vaEg5bq7L4WY5HM=;
 b=FLjGcUIc4AIhSIZMmjTlROJblYshNC8JownBZpZFiFo8YO057LwHUNhpWnic+84WRV
 livBDsoXBfL8/bWn/rZ1J18kRBQCyUtsKGkxo8CBcT7N9tHk5IovCg8DrVCZ7P78XSr5
 Gb2KXRF2tfDQg9I8yrUDzGoAYeRli29XT0D1crHa4jl6f8Z3ziw9B+COYSR1DTUBmXnE
 14UOKLBPFGFI86VHuGpyPewKf4RNQ//1gqUfQB3WzGyG4hHy/C1we+VxY+5fDhaRmuZY
 /fM2LsF5z2wVDEAHeYLosZP1k92rDvo8rvA0PtO9S6R8llNHLKQYF5/1K1FINPQQCkoA
 fs4Q==
X-Gm-Message-State: AOAM533dyc1QBCArvxW8vV5IbHjX1owz5wy3RYvptC4WSQnJ8IaEdalf
 7Yux8qgOrhHg2PI/Kwl/RoeGvf/X8ABPPQ==
X-Google-Smtp-Source: ABdhPJyKfKQX/W5aXPaw1CrVqCIv4VgYY+mPZMCr/0VfpIVYh+e73MxlJlG4mu7WP6j3X0IOFImGpQ==
X-Received: by 2002:a17:902:a38e:b029:eb:3963:5aee with SMTP id
 x14-20020a170902a38eb02900eb39635aeemr1142615pla.78.1619132553313; 
 Thu, 22 Apr 2021 16:02:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z12sm2930605pfn.195.2021.04.22.16.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 16:02:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] linux-user/alpha: Share code for TARGET_NR_sigaction
Date: Thu, 22 Apr 2021 16:02:26 -0700
Message-Id: <20210422230227.314751-7-richard.henderson@linaro.org>
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

There's no longer a difference between the alpha code and
the generic code.

There is a type difference in target_old_sigaction.sa_flags,
which can be resolved with a very much smaller ifdef, which
allows us to finish sharing the target_sigaction definition.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h | 21 ++++++---------------
 linux-user/syscall.c      | 23 +----------------------
 2 files changed, 7 insertions(+), 37 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 7a1d3b239c..18b031a2f6 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -501,21 +501,12 @@ int do_sigaction(int sig, const struct target_sigaction *act,
 #endif
 
 #if defined(TARGET_ALPHA)
-struct target_old_sigaction {
-    abi_ulong _sa_handler;
-    abi_ulong sa_mask;
-    int32_t sa_flags;
-};
+typedef int32_t target_old_sa_flags;
+#else
+typedef abi_ulong target_old_sa_flags;
+#endif
 
-/* This is the struct used inside the kernel.  The ka_restorer
-   field comes from the 5th argument to sys_rt_sigaction.  */
-struct target_sigaction {
-    abi_ulong _sa_handler;
-    abi_ulong sa_flags;
-    target_sigset_t sa_mask;
-    abi_ulong ka_restorer;
-};
-#elif defined(TARGET_MIPS)
+#if defined(TARGET_MIPS)
 struct target_sigaction {
 	uint32_t	sa_flags;
 #if defined(TARGET_ABI_MIPSN32)
@@ -533,7 +524,7 @@ struct target_sigaction {
 struct target_old_sigaction {
         abi_ulong _sa_handler;
         abi_ulong sa_mask;
-        abi_ulong sa_flags;
+        target_old_sa_flags sa_flags;
 #ifdef TARGET_ARCH_HAS_SA_RESTORER
         abi_ulong sa_restorer;
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 216ee4ca47..9bcd485423 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8980,28 +8980,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_sigaction
     case TARGET_NR_sigaction:
         {
-#if defined(TARGET_ALPHA)
-            struct target_sigaction act, oact, *pact = 0;
-            struct target_old_sigaction *old_act;
-            if (arg2) {
-                if (!lock_user_struct(VERIFY_READ, old_act, arg2, 1))
-                    return -TARGET_EFAULT;
-                act._sa_handler = old_act->_sa_handler;
-                target_siginitset(&act.sa_mask, old_act->sa_mask);
-                act.sa_flags = old_act->sa_flags;
-                unlock_user_struct(old_act, arg2, 0);
-                pact = &act;
-            }
-            ret = get_errno(do_sigaction(arg1, pact, &oact, 0));
-            if (!is_error(ret) && arg3) {
-                if (!lock_user_struct(VERIFY_WRITE, old_act, arg3, 0))
-                    return -TARGET_EFAULT;
-                old_act->_sa_handler = oact._sa_handler;
-                old_act->sa_mask = oact.sa_mask.sig[0];
-                old_act->sa_flags = oact.sa_flags;
-                unlock_user_struct(old_act, arg3, 1);
-            }
-#elif defined(TARGET_MIPS)
+#if defined(TARGET_MIPS)
 	    struct target_sigaction act, oact, *pact, *old_act;
 
 	    if (arg2) {
-- 
2.25.1


