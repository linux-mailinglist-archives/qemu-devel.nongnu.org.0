Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCB45A4102
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 04:16:52 +0200 (CEST)
Received: from localhost ([::1]:45930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSUKZ-00051a-DF
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 22:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUED-0003W3-55
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:17 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUEB-0001bq-It
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:16 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 202so6434271pgc.8
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 19:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=LYi0lu55bGaCgaXFFBKaxC2lMAPBykVR4TgtPvHjjww=;
 b=tJDjmVuBW9gcxkyqRY6D3k+ZXFcqNAe7Z0EuxQkOrRMPQF8M+Zxy8u61G3K6jVY1ei
 S8uTr+1OT5Axi7gwTqMjncFELU+NIwl6IRjkEovXjInV/DTsFPSg/srDt4ChNxGMhxv1
 ySq6ySHGYFGR7KghPnqKpXY1b+DTYcmaRjEa4JBvXOTVJsYg+hEikcGIfsrjz+xjo0Y4
 6ujqTtq5xryHPE4IuROmM/W3sxS/G0mGYOfP4o7ZLaPKe8tVPfU/SjPwd9r0hVaJJw+2
 9TmCPou2nC4Adqln8VTpMWmwGgGlWKciM6HntOE9vKOW38rgztqRLS3y/MY3gew9Wct9
 oXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=LYi0lu55bGaCgaXFFBKaxC2lMAPBykVR4TgtPvHjjww=;
 b=nEJ8BlfSEeYrRDnPV3Ff3sL7JZ3zpaZ93yYuKi6mP1wdWqku5uOvqGLkCvm9Ghg9lS
 CFGiFkmjEM10gfMTy6qMG9TGmyHXGstpwObHiFMFFCh0QpHIw4xVUDdanD3NIFvUtEDA
 XqLEhdFkr514mBhmY5ALOR8ELoAipbBjBNno0ROO+wROcmFT5aBSE6dynpVvuzwcvlc9
 elhOIJ1APIYeV7b4///Gr0gXV7dbncvqOIO7z9ziM6hR6xjWFc6zzag9GNR/wAOOKHcN
 Qg2uySd7mOLsdDbprX+oY+/dYYY/jpw+r5DCCS5v3ceX9a3OLqOP+mLfdID1+IkCGAaN
 GlQA==
X-Gm-Message-State: ACgBeo0rc1ahYGas9i6GgHQRORz0D/w0zaW+5HHgIWkp+C1dpI79d5Ti
 6TeC1cVdoHz3cG0m8nEYDpAkbyu5W0vFiw==
X-Google-Smtp-Source: AA6agR5CcSDjS86R15eVTljKSa9MN2SamuqgC4nBovWcxuoA7WLai2gwwAZcgHSuRfNRwfSht8bZjA==
X-Received: by 2002:a05:6a00:1356:b0:538:1bf1:7cd with SMTP id
 k22-20020a056a00135600b005381bf107cdmr4996808pfu.32.1661739014313; 
 Sun, 28 Aug 2022 19:10:14 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b0016bdc98730bsm6035139plb.151.2022.08.28.19.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 19:10:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH 5/8] linux-user: Implement PI futexes
Date: Sun, 28 Aug 2022 19:10:03 -0700
Message-Id: <20220829021006.67305-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829021006.67305-1-richard.henderson@linaro.org>
References: <20220829021006.67305-1-richard.henderson@linaro.org>
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

Define the missing FUTEX_* constants in syscall_defs.h

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h |  3 +++
 linux-user/syscall.c      | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 85b0f33e91..9a6d7893d9 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2699,6 +2699,9 @@ struct target_drm_i915_getparam {
 #define FUTEX_TRYLOCK_PI        8
 #define FUTEX_WAIT_BITSET       9
 #define FUTEX_WAKE_BITSET       10
+#define FUTEX_WAIT_REQUEUE_PI   11
+#define FUTEX_CMP_REQUEUE_PI    12
+#define FUTEX_LOCK_PI2          13
 
 #define FUTEX_PRIVATE_FLAG      128
 #define FUTEX_CLOCK_REALTIME    256
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f50cc70f1a..d2d18d29a6 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7773,8 +7773,17 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
     case FUTEX_WAIT_BITSET:
         val = tswap32(val);
         break;
+    case FUTEX_WAIT_REQUEUE_PI:
+        val = tswap32(val);
+        haddr2 = g2h(cpu, uaddr2);
+        break;
+    case FUTEX_LOCK_PI:
+    case FUTEX_LOCK_PI2:
+        break;
     case FUTEX_WAKE:
     case FUTEX_WAKE_BITSET:
+    case FUTEX_TRYLOCK_PI:
+    case FUTEX_UNLOCK_PI:
         timeout = 0;
         break;
     case FUTEX_FD:
@@ -7782,6 +7791,7 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
         timeout = 0;
         break;
     case FUTEX_CMP_REQUEUE:
+    case FUTEX_CMP_REQUEUE_PI:
         val3 = tswap32(val3);
         /* fall through */
     case FUTEX_REQUEUE:
-- 
2.34.1


