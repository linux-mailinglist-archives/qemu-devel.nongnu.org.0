Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6144D96B1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 09:48:36 +0100 (CET)
Received: from localhost ([::1]:49752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU2r5-0003ED-Mz
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 04:48:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nU2lu-0008Rq-Rn
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:43:14 -0400
Received: from [2607:f8b0:4864:20::62f] (port=36851
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nU2lt-00052l-9V
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:43:14 -0400
Received: by mail-pl1-x62f.google.com with SMTP id e13so15671822plh.3
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 01:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h3suoOPDLcx3C2TGXcLsoIqq/PtT5yRHwOoMlS2gYo4=;
 b=gGOb7A/yBU1OlwmBSHbvFXOR2MtGC+eqBwbtIwffXWOMT7xi/dGHzi7fS+xDAm5z3v
 iCEg97OWGZO6v5IZ7hQIhxRP2SPUczo6uOv4RmNq0SZfgcBUmeFi24PYCPnGp9BE3mfT
 kCQD5w0Wtxss6uuYs42HIzuhflqJ7YTEAPwp+jCfrtnQ6/AFgfKyhEiEjt3ZSL7Hqgzf
 WZu/TqfcXr2FH3cy0YTHRq/lor8dMc97YQgawwpgA7L8HVcOiYEsfLOStBHkx0dZZKeB
 s0HtdTpyOTYKGq3MTI3NNbo+RMEwxyT/+KTM+hE0GbdoadiozXqppDeTXzGS4hQe6khI
 l04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h3suoOPDLcx3C2TGXcLsoIqq/PtT5yRHwOoMlS2gYo4=;
 b=mS4zgHZccF9SUmgS2GbAIogyu2BPVD2+Geq+1iJWv0IytAbXqzdQGOBlQ9Ew5oClDi
 qVxrYE1WJMTn7RhWuH8KbCmpNfMCnncV89NDEX8rg/Vy1Lehc82C4S2iFObBe10CctHJ
 HmnHngSjPoAZDsCYhCOCv2xc50ELeMuDQgb67v+aNxGUBj32kuIknGEeQKFZJT1tEgXs
 xcDnhnOcrdoc/8vNKjvCiRoFCRTTdTH98vR5AOg6iMtHG5rqOHSshKPrH1BQA9Oes5/+
 m2yOLVyTOvzUfMZT2BNmxP/+ok8po6EJRthTV56fpAovyRhopOBfbshtpu9hAfRdqWF+
 1O3A==
X-Gm-Message-State: AOAM532VV+G2pCxZkYdNskVMTU8zYef/p1Fvt1SGC6bZ2EyT+lPSk0rf
 BjwuKXMUObyvCOfzyFxmpP/KMmXKVW3H7A==
X-Google-Smtp-Source: ABdhPJxnkBvCyJX2hyv3GYSeTjnTg2tqFPE9yPKAFtDG6e3tIafu2qUNoNsXwq/XL7ERwNqSZWizpA==
X-Received: by 2002:a17:902:d4cc:b0:153:32a9:2479 with SMTP id
 o12-20020a170902d4cc00b0015332a92479mr20602063plg.25.1647333792006; 
 Tue, 15 Mar 2022 01:43:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 ob13-20020a17090b390d00b001becfd7c6f3sm2233762pjb.27.2022.03.15.01.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 01:43:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] linux-user: Properly handle sigset arg to pselect
Date: Tue, 15 Mar 2022 01:43:06 -0700
Message-Id: <20220315084308.433109-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315084308.433109-1-richard.henderson@linaro.org>
References: <20220315084308.433109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unblocked signals are never delivered, because we
didn't record the new mask for process_pending_signals.
Handle this with the same mechanism as sigsuspend.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/834
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 154cb1c7e8..8071a5191d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1391,14 +1391,12 @@ static abi_long do_pselect6(abi_long arg1, abi_long arg2, abi_long arg3,
      * The 6th arg is actually two args smashed together,
      * so we cannot use the C library.
      */
-    sigset_t set;
     struct {
         sigset_t *set;
         size_t size;
     } sig, *sig_ptr;
 
     abi_ulong arg_sigset, arg_sigsize, *arg7;
-    target_sigset_t *target_sigset;
 
     n = arg1;
     rfd_addr = arg2;
@@ -1439,10 +1437,8 @@ static abi_long do_pselect6(abi_long arg1, abi_long arg2, abi_long arg3,
     }
 
     /* Extract the two packed args for the sigset */
+    sig_ptr = NULL;
     if (arg6) {
-        sig_ptr = &sig;
-        sig.size = SIGSET_T_SIZE;
-
         arg7 = lock_user(VERIFY_READ, arg6, sizeof(*arg7) * 2, 1);
         if (!arg7) {
             return -TARGET_EFAULT;
@@ -1452,28 +1448,22 @@ static abi_long do_pselect6(abi_long arg1, abi_long arg2, abi_long arg3,
         unlock_user(arg7, arg6, 0);
 
         if (arg_sigset) {
-            sig.set = &set;
-            if (arg_sigsize != sizeof(*target_sigset)) {
-                /* Like the kernel, we enforce correct size sigsets */
-                return -TARGET_EINVAL;
+            ret = process_sigsuspend_mask(&sig.set, arg_sigset, arg_sigsize);
+            if (ret != 0) {
+                return ret;
             }
-            target_sigset = lock_user(VERIFY_READ, arg_sigset,
-                                      sizeof(*target_sigset), 1);
-            if (!target_sigset) {
-                return -TARGET_EFAULT;
-            }
-            target_to_host_sigset(&set, target_sigset);
-            unlock_user(target_sigset, arg_sigset, 0);
-        } else {
-            sig.set = NULL;
+            sig_ptr = &sig;
+            sig.size = SIGSET_T_SIZE;
         }
-    } else {
-        sig_ptr = NULL;
     }
 
     ret = get_errno(safe_pselect6(n, rfds_ptr, wfds_ptr, efds_ptr,
                                   ts_ptr, sig_ptr));
 
+    if (sig_ptr) {
+        finish_sigsuspend_mask(ret);
+    }
+
     if (!is_error(ret)) {
         if (rfd_addr && copy_to_user_fdset(rfd_addr, &rfds, n)) {
             return -TARGET_EFAULT;
-- 
2.25.1


