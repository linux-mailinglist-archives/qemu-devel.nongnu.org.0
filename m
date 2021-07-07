Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CE03BF211
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 00:26:29 +0200 (CEST)
Received: from localhost ([::1]:54700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Fzw-0003GO-Nq
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 18:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1FyU-0001Jr-Fj
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 18:24:58 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1FyS-00059w-4J
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 18:24:58 -0400
Received: by mail-pg1-x52f.google.com with SMTP id g22so3817231pgl.7
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 15:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5yzO2zNLTlHVNaayRJdjDdRf0yG59QrcH6UNIxROTec=;
 b=AMXF0thi1kxzO1gB+eaCMfqwScxIp0yxq4AOxetoxLKJ2LQ3T3DDrtCRSUtltBnKMm
 LUwLFkti39AjsTaJKQcsSdU0OwiJpDpOO6P5aV7zDO9SXbWn6+QSKbJnZ8Tdv8Thz0+n
 bG7eEC6wDGTpp/bNc9C7DM5FM8CJXm7NUp6UsCD3OeOdnxYgF5G6wlLv6xRreWUI/qDn
 /zok2B/vLhD2S9sUI6/EeyF5Ac68Ao6s+25OMTabvuM/oRaAhLMP2w5Cc5yVgo9XT83m
 Qf/1V4ENqqzlatvL0/ZZnvSMhyQmSOGrR6jVMrhFVH9gmIlEp5AueVzmyikYj+EiGphJ
 iKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5yzO2zNLTlHVNaayRJdjDdRf0yG59QrcH6UNIxROTec=;
 b=qPoDQOxv8bn2rqK/6bIpxsCrQCiegPGEYo1yNZ03QRqHHfC0+LnI7BdKYdxxa1UHfn
 yR7+LrzTgWSzAp+olE222ldI8EMUZh+eXNbbo8sM8uj7rMXYMU5x7e154v+fVXYsAfQN
 DJiHj+4VqIPeaF/NB8BD3Ah1seo/431TbvirIYBS55H/GeVSOVPmoFz8E8P7nrXpanoG
 wMOYy9rLVz8v45RwH430mTeDQEkdeQtzkgD5iPb+ldiMRm8qS7PRf5aPGY3YHwQDdThD
 bWDj0G91WhdRd5mQEvsofS/Psj4v587teA5HRzvYdQSC4vBlS3j4jewuJMaOFU/PD+aE
 lVhA==
X-Gm-Message-State: AOAM5332T5kXiF/78FOZMILSkS+jQRAf5TASXjfkJYYdP7Dgpw2cu9PV
 9Omt5mRtTDgeQh5r6mTFmtfDzpkBpIbUWw==
X-Google-Smtp-Source: ABdhPJxdDgu/sYaulcb0rIuJfP5d41Agerg3npF2mGPJGXrBtbTPBDFXesWtOO1slu3KFdHQOdoG4A==
X-Received: by 2002:a65:67ce:: with SMTP id b14mr28172268pgs.322.1625696694938; 
 Wed, 07 Jul 2021 15:24:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x19sm214404pfp.115.2021.07.07.15.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 15:24:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 2/3] target/i386: Split out do_fninit
Date: Wed,  7 Jul 2021 15:24:51 -0700
Message-Id: <20210707222452.591810-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707222452.591810-1-richard.henderson@linaro.org>
References: <20210707222452.591810-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: pbonzini@redhat.com, ziqiaokong@gmail.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not call helper_fninit directly from helper_xrstor.
Do call the new helper from do_fsave.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 74bbe94b80..beb63be432 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -727,7 +727,7 @@ void helper_fwait(CPUX86State *env)
     }
 }
 
-void helper_fninit(CPUX86State *env)
+static void do_fninit(CPUX86State *env)
 {
     env->fpus = 0;
     env->fpstt = 0;
@@ -742,6 +742,11 @@ void helper_fninit(CPUX86State *env)
     env->fptags[7] = 1;
 }
 
+void helper_fninit(CPUX86State *env)
+{
+    do_fninit(env);
+}
+
 /* BCD ops */
 
 void helper_fbld_ST0(CPUX86State *env, target_ulong ptr)
@@ -2451,18 +2456,7 @@ static void do_fsave(CPUX86State *env, target_ulong ptr, int data32,
         ptr += 10;
     }
 
-    /* fninit */
-    env->fpus = 0;
-    env->fpstt = 0;
-    cpu_set_fpuc(env, 0x37f);
-    env->fptags[0] = 1;
-    env->fptags[1] = 1;
-    env->fptags[2] = 1;
-    env->fptags[3] = 1;
-    env->fptags[4] = 1;
-    env->fptags[5] = 1;
-    env->fptags[6] = 1;
-    env->fptags[7] = 1;
+    do_fninit(env);
 }
 
 void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
@@ -2834,7 +2828,7 @@ void helper_xrstor(CPUX86State *env, target_ulong ptr, uint64_t rfbm)
         if (xstate_bv & XSTATE_FP_MASK) {
             do_xrstor_fpu(env, ptr, ra);
         } else {
-            helper_fninit(env);
+            do_fninit(env);
             memset(env->fpregs, 0, sizeof(env->fpregs));
         }
     }
-- 
2.25.1


