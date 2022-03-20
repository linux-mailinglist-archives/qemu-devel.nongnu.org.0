Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CCD4E1C81
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 17:11:56 +0100 (CET)
Received: from localhost ([::1]:35582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVy9p-0001tC-Rc
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 12:11:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxyh-0005Kr-Cq
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:25 -0400
Received: from [2607:f8b0:4864:20::629] (port=45956
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxye-00065m-C1
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:22 -0400
Received: by mail-pl1-x629.google.com with SMTP id k6so3632805plg.12
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 09:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NqjSqqJYJqBZpZ7IPTgBDuMNo4UxguCJGEl833fSoDE=;
 b=BFbdpMLhpY0T/YtRsqnKhLGHE2V8iQ5NW2C9jdyKtnUrARhZAwDx0K72c1XEAD/mjz
 g2tQKFm/u0t5GNfdgltRiT15zjwPYeQLa91xC1b0r30R/oyw10+PPFoW0dwqC1gi3RIJ
 mElrS/dL55dvVOhK7u03Sy5kAvcv0A5cL8lPEcdAjp+kIQSCMPcno+xdRYDZz7dI3014
 MegRXrQNC1yGM2PsdTDqvtvjZ8VKdP3J0F/kTdQv7t6jomaZe5QO09n0ygpXibY6F3oM
 J9OFOxg/8kov0zPNOwRk1n6xunODSU93caXoZVev9iVNNOKQ/DtKmK/+GQZnmZWvVwR9
 0+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NqjSqqJYJqBZpZ7IPTgBDuMNo4UxguCJGEl833fSoDE=;
 b=eVLAmp9pcXAqnVS1swlgiCiljnlvTUiH5gNqDCJrcyaL5OdEFF1pxxVhSnjQP61ct8
 KnQK9VpZP41KFfyRAFLTp8cCWG4YIs2EsF564tjEkh9JaWDfYuW6k1B35IZUpce9Y+s1
 y78uPTj06KznwX6Jbd6Oyxg9g+FmWTfezWYOa/U0wuCgvxtCHpqEs/opzbV8CQZlzrJ8
 VRFZ9EnnpNHBh3nLVqaerbp9C0mPWFmPwpabMDy8NWBK/IAHHJxq9qcZ3lfefjRdbFP2
 5u4bvY04SHGv8Y75AmxajQ1Vq2qu5Kg3qXfpp6vRPTi6BxnIlb6v2Oun7767eAuwbxd8
 ZxhQ==
X-Gm-Message-State: AOAM533gUBxkZT2bcMeBH5IgMoC2wmcAN+h5yonyrA7Tti/mK/SF0oeb
 RtQ6/S0JS2Vj1XV6/sP2eNZd+r5G8KlihQ==
X-Google-Smtp-Source: ABdhPJztefOcC4UbWryLsCrn/vJqKzG/3ij65HPUrvmR0c3G01I14zsvXthhZeXW4jzCzkzh3LqR+Q==
X-Received: by 2002:a17:902:7fc2:b0:153:3c90:17b9 with SMTP id
 t2-20020a1709027fc200b001533c9017b9mr8955203plb.61.1647792013774; 
 Sun, 20 Mar 2022 09:00:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 j23-20020a17090ae61700b001c6bb352763sm6590099pjy.52.2022.03.20.09.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 09:00:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] linux-user/nios2: Fix clone child return
Date: Sun, 20 Mar 2022 09:00:03 -0700
Message-Id: <20220320160009.2665152-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320160009.2665152-1-richard.henderson@linaro.org>
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The child side of clone needs to set the secondary
syscall return value, r7, to indicate syscall success.

Advance the pc before do_syscall, so that the new thread
does not re-execute the clone syscall.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/target_cpu.h | 1 +
 linux-user/nios2/cpu_loop.c   | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/linux-user/nios2/target_cpu.h b/linux-user/nios2/target_cpu.h
index 2d2008f002..830b4c0741 100644
--- a/linux-user/nios2/target_cpu.h
+++ b/linux-user/nios2/target_cpu.h
@@ -27,6 +27,7 @@ static inline void cpu_clone_regs_child(CPUNios2State *env, target_ulong newsp,
         env->regs[R_SP] = newsp;
     }
     env->regs[R_RET0] = 0;
+    env->regs[7] = 0;
 }
 
 static inline void cpu_clone_regs_parent(CPUNios2State *env, unsigned flags)
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 1e93ef34e6..a3acaa92ca 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -42,8 +42,7 @@ void cpu_loop(CPUNios2State *env)
         case EXCP_TRAP:
             switch (env->error_code) {
             case 0:
-                qemu_log_mask(CPU_LOG_INT, "\nSyscall\n");
-
+                env->regs[R_PC] += 4;
                 ret = do_syscall(env, env->regs[2],
                                  env->regs[4], env->regs[5], env->regs[6],
                                  env->regs[7], env->regs[8], env->regs[9],
@@ -56,7 +55,6 @@ void cpu_loop(CPUNios2State *env)
                 env->regs[2] = abs(ret);
                 /* Return value is 0..4096 */
                 env->regs[7] = ret > 0xfffff000u;
-                env->regs[R_PC] += 4;
                 break;
 
             case 1:
-- 
2.25.1


