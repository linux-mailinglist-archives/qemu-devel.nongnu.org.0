Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5683C753D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:48:46 +0200 (CEST)
Received: from localhost ([::1]:43072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LaP-0002hw-3z
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUB-0006qy-HE
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:19 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LU7-0005da-Nc
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:19 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 h1-20020a17090a3d01b0290172d33bb8bcso1827483pjc.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cYyCuRRmAK2Rie5jBdr3R+LAqWVke2VP4TG50eB3qqU=;
 b=ZBiGSyRcGFJCvpFrQwW2Xizu7CILQqueQQylkF+YeKs4PT0ZPSbsRQYNKWmZjdgNwL
 NlhI0pE555NlsQ/dV/eKeTQfHz6g4Vay+Tf1qz92r1t4VN1mltKi+SygKuiHIp21rNNv
 prY1DwEYBC8JkK6Na/3T9fVR6HoQ0geP9uUHAcHdG9B0HommMkDkU6+g46Gh/Sd2QW3y
 Wy3YzScJACqS4jq/KYZ2oOLllcqozYGaE45sHVQGxy3qfklZg0Jr5ssIB9kM0O8Opv0m
 pEZ6p/k0VnLCR+pzADq6uM/K8DBqHbmjhrYKjcDwKDJwwll9kLLjns/Rn5UdN52hnBrd
 Vhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cYyCuRRmAK2Rie5jBdr3R+LAqWVke2VP4TG50eB3qqU=;
 b=B+5FXDUv4dv2CBqByroZhGG6lnQW3cmBEF5U+FgMr1tlQF8Gd5B6erO7/GjPhTRscG
 R2oSZeQB0y7qOCPHQqr4zs0wGEVM8o3FwnyqFJjW84/dBghCSNWeE/WuQs+3yCAcVkKZ
 zTZ+eir1R5t9fRi4Rg/ZhKFxMDU/3Mu8JhiPR4BU5/nD/ai2CDPlhLHx2ZWAndqxEnbz
 pu3JXDSNQBbxLv+u2mpkdXxEqhA45BsaEyoVTY7UMQ83qPvHQ4GAL+i4Vz4awx2pcn/5
 KmV/3toqbOfGvJhrGRlEUaoSdnM9YhHuXS8xbgoKDzMAD0B5YJ2xD9dqvRnpIcWriU0C
 yGEA==
X-Gm-Message-State: AOAM531bQGKt1K+nimLZxuUrkTtaTH0PIafJ6tqsCTS6D0WNwDzHPKWL
 aumqQ1mu/z7KaVnljAvbBloLVPS7wYh/0g==
X-Google-Smtp-Source: ABdhPJwjvauNIlPRrDsS5PaX4glsv8Hl9typyPnKaZ+nL1T7/CcJoKLTpisOb/kaRwbU0hZ6aGWOsA==
X-Received: by 2002:a17:90b:3a89:: with SMTP id
 om9mr2828110pjb.91.1626194534269; 
 Tue, 13 Jul 2021 09:42:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/14] target/i386: Split out do_fninit
Date: Tue, 13 Jul 2021 09:42:00 -0700
Message-Id: <20210713164211.1520109-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not call helper_fninit directly from helper_xrstor.
Do call the new helper from do_fsave.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


