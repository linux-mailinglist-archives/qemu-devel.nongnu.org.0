Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0650A68728F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:53:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNq8-0006Jv-Id; Wed, 01 Feb 2023 19:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNq6-0006Hu-Rh
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:34 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNq5-0000RF-14
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:34 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 on9-20020a17090b1d0900b002300a96b358so322284pjb.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gcAn+/dc308N0zwxzCUYCpv71yRhEWzbzgA9/jFvtIs=;
 b=MxSDyZLRWVcCa+F5RrmWPgD4dEzSpMnCRLBUcSqdvjE357NSl6yi5ar+w7g44ReWiK
 y+WNGc/Ttkjfqf10/8kAfrAmzgbcERJfJgQ+0TayC+G9uMPz1YDQ7gBEYuVcpipO9qKD
 xI+xjDiJuxCl6PTeObAzyo4ECz6M1OipohfumGu97ErQuS3a3tBlZef4weGCnlMhBcfW
 COAEKgT/uLq3oLKxrwGl+A19IXhDbdHzHgDz4u1j2NDCl4OtqDs3fnPmviuTuffZeasV
 1+1nJVduAfob/AAIJJUEPrrKW/mXuEhqAXzeTAxXKkZk5pf+sW3KlVmc/+itLVOywXp0
 zSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gcAn+/dc308N0zwxzCUYCpv71yRhEWzbzgA9/jFvtIs=;
 b=zQKVxSbyk2M7JrlSikOqHOzntveoJ7R9rwfLCvtJFRJKmpOSLBercg0Q+cHJffgUh3
 Eo07HjY00BeOPPDVZRYvjFh/IjKpSoeLAJqg0tFEPBGa1Co8Lqi8/X/QHWtAaBJ3axUB
 RZfa1OBfvJQJzoyCNszS3C2o+LmmdK6Yglvok1dGcYgytFPiwoHumBAxdM6Hsrvb/xyY
 36N1nBonm5hJVdf2a77ohrF3qButapW374T9314TUOX+zM6WjaXMgVnUCW4bCUgNCsbT
 TlYp4pVX3L/UszAII1UUXZMR/bWnwNZeAV2mKHri+xToYXyCavCWsX0FF4R1HIo1g9tW
 k0Gg==
X-Gm-Message-State: AO0yUKWY3U4W7WmKs720HkNY95L5X+CoH0c+mqYOxQZ9qSmkUfyXfBTh
 Pwz2B6EBeOGCD99J96kYgcMbeGNvjiU8jGzU
X-Google-Smtp-Source: AK7set/xrW93zY4+oOtSRwQHJnacgxcLkKssCCL9H2Y1ENRVKGfRyjQdDwN69Ef7aLxrmkbgAxRGPw==
X-Received: by 2002:a17:903:120b:b0:196:89bc:7100 with SMTP id
 l11-20020a170903120b00b0019689bc7100mr5822839plh.16.1675299152345; 
 Wed, 01 Feb 2023 16:52:32 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 14/14] linux-user/sparc: Handle tag overflow traps
Date: Wed,  1 Feb 2023 14:52:04 -1000
Message-Id: <20230202005204.2055899-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This trap is raised by taddcctv and tsubcctv insns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/target_signal.h | 2 +-
 linux-user/syscall_defs.h        | 5 +++++
 linux-user/sparc/cpu_loop.c      | 3 +++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index 87757f0c4e..f223eb4af6 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -8,7 +8,7 @@
 #define TARGET_SIGTRAP           5
 #define TARGET_SIGABRT           6
 #define TARGET_SIGIOT            6
-#define TARGET_SIGSTKFLT         7 /* actually EMT */
+#define TARGET_SIGEMT            7
 #define TARGET_SIGFPE            8
 #define TARGET_SIGKILL           9
 #define TARGET_SIGBUS           10
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 77864de57f..614a1cbc8e 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -717,6 +717,11 @@ typedef struct target_siginfo {
 #define TARGET_TRAP_HWBKPT      (4)     /* hardware breakpoint/watchpoint */
 #define TARGET_TRAP_UNK         (5)     /* undiagnosed trap */
 
+/*
+ * SIGEMT si_codes
+ */
+#define TARGET_EMT_TAGOVF      1       /* tag overflow */
+
 #include "target_resource.h"
 
 struct target_pollfd {
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 18109f545d..0b19f47876 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -332,6 +332,9 @@ void cpu_loop (CPUSPARCState *env)
         case TT_PRIV_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
             break;
+        case TT_TOVF:
+            force_sig_fault(TARGET_SIGEMT, TARGET_EMT_TAGOVF, env->pc);
+            break;
 #ifdef TARGET_SPARC64
         case TT_PRIV_ACT:
             /* Note do_privact defers to do_privop. */
-- 
2.34.1


