Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B054D989C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:21:56 +0100 (CET)
Received: from localhost ([::1]:38964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4JO-0003vo-Uv
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:21:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nU2lx-0008Sx-0x
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:43:19 -0400
Received: from [2607:f8b0:4864:20::432] (port=41543
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nU2lu-00054D-Q2
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:43:15 -0400
Received: by mail-pf1-x432.google.com with SMTP id p8so18515026pfh.8
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 01:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yQiK4Nk/B1NdX9ZTCZaM1xTMTE5yCiEd6wvHx/1Jvzs=;
 b=hwIu+VrVpvcUA7dlwzLcjRNIGXtyn7iW8vabWJbhCCslVc0fZFvpTdxujiZB1APy+R
 hRR6m9VK5QmKT2BQurCWqk8rhwxcM5fLCKgKEM/ewC/lBAiK4+SGa7/7a159XRH8e5v3
 X0Bo1FvWGwHYqzhOwwV2k4mo1k+oSVGeI9PqHea2IKe468AeYpzBlyt1RVOXSfUQr1HC
 6ptD9BEuoA1AHjx5p9S1KND7FRUWRn7w2doy64d/ld/YaFrRoy0wRbClkgT7lfsXx2vU
 hfqIzOlLprTTcxuz7AZrvZQJ0o0UTtRPCUr/tEiGRw56e9foMCDVSW3UVyTxNJ5kUQBL
 AvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yQiK4Nk/B1NdX9ZTCZaM1xTMTE5yCiEd6wvHx/1Jvzs=;
 b=uzDsJKKnVy7kba7DbZ1wKAIHsK/FDuVNpthCbWw3JxI2uR/NefUC9o9LO76Lfjqv6I
 lRXUGqW9KcVLHXb6ZZXsMpGoYHAaEYhnK8az7v1zfjkJuvD5uann6+XjdaddHOYPQy9e
 sA48UtSbzwhSU7uLDE16193/2/fz3e4nVav/cjCieOdCxl2NqX+5RLmK3cIlrkkFaJD6
 ygLxTbu/m6n6oP2wygQslMLVXmxX8jSr3r4jrXQvfMxbdGYDp1un4cXZTU41loxDP+HT
 J+xSrX/t1WQMRlkGmZt129bZKzNLuTZPywtC0yAVKaEiGqxy5nP1WEc6yHAJzrlrQuV/
 9O5w==
X-Gm-Message-State: AOAM5323hVOKbO6KO8PdBsGac8/N8eEZzU6tRWwZvmH5FcwwUQeAcxQE
 XXMJvWWViLCoT1a/mIUfWfAF4gf/ufSuBg==
X-Google-Smtp-Source: ABdhPJwUyuwhqsp5ZYjpEhh7Wd7jSr9S97z9wkDfPeA5EQiLnOjc3oSSzQ8Zb9gIpI1wPALBOjM1rw==
X-Received: by 2002:a63:864a:0:b0:375:7999:e83c with SMTP id
 x71-20020a63864a000000b003757999e83cmr23457367pgd.144.1647333793552; 
 Tue, 15 Mar 2022 01:43:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 ob13-20020a17090b390d00b001becfd7c6f3sm2233762pjb.27.2022.03.15.01.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 01:43:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] linux-user: Properly handle sigset arg to ppoll
Date: Tue, 15 Mar 2022 01:43:08 -0700
Message-Id: <20220315084308.433109-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315084308.433109-1-richard.henderson@linaro.org>
References: <20220315084308.433109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 85de4e1bc7..a69b7084f1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1519,8 +1519,7 @@ static abi_long do_ppoll(abi_long arg1, abi_long arg2, abi_long arg3,
     }
     if (ppoll) {
         struct timespec _timeout_ts, *timeout_ts = &_timeout_ts;
-        target_sigset_t *target_set;
-        sigset_t _set, *set = &_set;
+        sigset_t *set = NULL;
 
         if (arg3) {
             if (time64) {
@@ -1539,25 +1538,19 @@ static abi_long do_ppoll(abi_long arg1, abi_long arg2, abi_long arg3,
         }
 
         if (arg4) {
-            if (arg5 != sizeof(target_sigset_t)) {
+            ret = process_sigsuspend_mask(&set, arg4, arg5);
+            if (ret != 0) {
                 unlock_user(target_pfd, arg1, 0);
-                return -TARGET_EINVAL;
+                return ret;
             }
-
-            target_set = lock_user(VERIFY_READ, arg4,
-                                   sizeof(target_sigset_t), 1);
-            if (!target_set) {
-                unlock_user(target_pfd, arg1, 0);
-                return -TARGET_EFAULT;
-            }
-            target_to_host_sigset(set, target_set);
-        } else {
-            set = NULL;
         }
 
         ret = get_errno(safe_ppoll(pfd, nfds, timeout_ts,
                                    set, SIGSET_T_SIZE));
 
+        if (set) {
+            finish_sigsuspend_mask(ret);
+        }
         if (!is_error(ret) && arg3) {
             if (time64) {
                 if (host_to_target_timespec64(arg3, timeout_ts)) {
@@ -1569,9 +1562,6 @@ static abi_long do_ppoll(abi_long arg1, abi_long arg2, abi_long arg3,
                 }
             }
         }
-        if (arg4) {
-            unlock_user(target_set, arg4, 0);
-        }
     } else {
           struct timespec ts, *pts;
 
-- 
2.25.1


