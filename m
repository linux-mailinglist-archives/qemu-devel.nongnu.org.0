Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF833697E7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:04:20 +0200 (CEST)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzE3-0007yg-OM
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4d-0008Qb-OT
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:54:36 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4X-0008BK-FE
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:54:35 -0400
Received: by mail-pl1-x632.google.com with SMTP id v13so11913503ple.9
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bpMdaQI7d9VQlEQ+FXm6j0OmwDELWjGPjFeSPFqh+YA=;
 b=uE94mD8e7Wle6YtHIrYanc+d/zb9YfjsmmagnWvDGkOyJJJ0z4nViu1i07n0XHnRFy
 qNsVSEQzxpmhvfpxq72tBJ4wHgVymnJXdDkdyJV9cf6StzVq656jlORqXBoeI1jodUU/
 4s19/nC08W0RHtk7zAhiJpb5MTvS4ybUq6HASa6vI5VJ+hUsjGOfMg8c1CfDiEtVwpxN
 oT70Q0HltWVeLzAlBz/4CsakMg4CGoTh36BADSey55k6mVRgZ2Tg71NSgC2flkEdfifY
 ZoWuOmzypA0k5rGwLGwgOeUXWMylzsE+EbnRwCvVmZM2FV9oAWGRUZa+Z9IzJ4ks/TcW
 +gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bpMdaQI7d9VQlEQ+FXm6j0OmwDELWjGPjFeSPFqh+YA=;
 b=SfdwQRCcoVps7mpuMaUfpcYEd6rZ9vxeVMoUxsLoWJemxBkcw1fdbeXefSCSq69WWq
 1Q9w3XF8t63tioPuQiUPUolRM8UUYxrGoFygYTO96J9262ADQLNvF43j/+8Tf2i/Vif2
 tY8mU25tPa7gMPQsxkpIb73mQFjVuAbLQ3H1tucyAzfcVMZ6YRyOhvau1j2/M8SU8cGi
 Vs6xXHolv7RpECgl9aX6QJ+cRhomK1Krugu0xDdwxVpPXPlv1nqKnZDwGtuM1ZDhEHXw
 cCWWP5uEQbg2r/PHIBezKIy/1Ebk8glS4OAnatMegi1YiA9xEYYUGjSGgyVFR7OSVutS
 V+1A==
X-Gm-Message-State: AOAM530NxKeUCWSInpoxLYJhrid/1+G+AwjAa8dqQ4M+8KFUfZNqNfub
 5LkhbwzwyJ/R6O+gVOht2DzbO7fXSVWCwA==
X-Google-Smtp-Source: ABdhPJyvdlc7nrUWCs/nN6ReKNisu4o9gDkCS96LGdcksbqYNgnbUvc+h1lCCJZr1USQoFbyDPkKAQ==
X-Received: by 2002:a17:902:b210:b029:eb:535f:852 with SMTP id
 t16-20020a170902b210b02900eb535f0852mr4546539plr.80.1619196856836; 
 Fri, 23 Apr 2021 09:54:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q5sm4918151pfu.5.2021.04.23.09.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:54:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] linux-user/arm: Do not fill in si_code for fpa11
 exceptions
Date: Fri, 23 Apr 2021 09:54:12 -0700
Message-Id: <20210423165413.338259-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423165413.338259-1-richard.henderson@linaro.org>
References: <20210423165413.338259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no such decoding in linux/arch/arm/nwfpe/fpmodule.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index e2a1496b9f..5f61d25717 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -262,29 +262,15 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
     /* Exception enabled? */
     FPSR fpsr = ts->fpa.fpsr;
     if (fpsr & (arm_fpe << 16)) {
-        target_siginfo_t info;
+        target_siginfo_t info = { };
 
+        /*
+         * The kernel's nwfpe emulator does not pass a real si_code.
+         * It merely uses send_sig(SIGFPE, current, 1).
+         */
         info.si_signo = TARGET_SIGFPE;
-        info.si_errno = 0;
+        info.si_code = TARGET_SI_KERNEL;
 
-        /* ordered by priority, least first */
-        if (arm_fpe & BIT_IXC) {
-            info.si_code = TARGET_FPE_FLTRES;
-        }
-        if (arm_fpe & BIT_UFC) {
-            info.si_code = TARGET_FPE_FLTUND;
-        }
-        if (arm_fpe & BIT_OFC) {
-            info.si_code = TARGET_FPE_FLTOVF;
-        }
-        if (arm_fpe & BIT_DZC) {
-            info.si_code = TARGET_FPE_FLTDIV;
-        }
-        if (arm_fpe & BIT_IOC) {
-            info.si_code = TARGET_FPE_FLTINV;
-        }
-
-        info._sifields._sigfault._addr = env->regs[15];
         queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
     } else {
         env->regs[15] += 4;
-- 
2.25.1


