Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C431698C5C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:49:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX8O-0005FV-T8; Thu, 16 Feb 2023 00:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX84-0004V2-NB
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:28 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX83-0005SC-28
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:24 -0500
Received: by mail-pf1-x434.google.com with SMTP id j184so753220pfg.10
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6To1l/rwYRVp7otgwGVfmpklbsVH868KF7IZeYGHIKI=;
 b=H342DsQn2aeKcFxR+fxJWoTKbrQEl1cl2RawPxaEUK6uYaTW8LCbX6Z0TO2uh+uvF6
 uya/2KkLwRs6YUSltkqLWAhSuC8OuJw/HXiSMBZ2DlvERRQ5680BROUE5uCKLqC0lh8N
 13SxdPQDxtw3TZWa2rzsMML3H6cf5wp9+qmo5gD1LZg2MZ+cUrTCYAUXkEsdcbRrbG2n
 Rbjc1woUU2LVeDttMPS+Y7Di5QfFcOISiWa/83nj+t+I33fAJ4CUAi87zAKsVC6Yd3gK
 6fGqoxIktnsZpDY8zmWzj78xG3G80ra2eixzKkWK8XJ1kGSXww4UYfBFI3miMeO8Arx1
 oCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6To1l/rwYRVp7otgwGVfmpklbsVH868KF7IZeYGHIKI=;
 b=q/A3xCRzKob8N3P5lE864L7SNP4mC2wD73CfghEXtOSCwmpSosOR83xThz6OjZskBq
 ONasI17ioDVGLl2+Wl+CM6l3/kGj/p/cEFC59DjfZEfzoF5QW+x44fs79ZnjoMDZQ+yS
 3RGTmmRNlelTBXcdM5n33V4A4dOzX2oyCBwIrKW2wqgaAyTsyE+mWGj1dPT04IDUUpyQ
 1eeebkrHf1V4b4GDJTjFI77iQ6T3rpJDS/ZPfsyb6qr80kGKWVimIZkGmSScX6SSKljD
 64lz/g6pjs8xVlSMDkuj+eZsHJQJrYgU/cLLJyR1eUxIuB6p65RI12b1DKKYRLEjVKuv
 cW3g==
X-Gm-Message-State: AO0yUKVEOhQ2hv5nFigq6kz8nZ8Ayjs6VT2qEbNs7d+YCEhYSs89vCDP
 gklZFdbfaxj/fD9zga//bVFKrDcJGYE0GusLmEU=
X-Google-Smtp-Source: AK7set8ALSwHFdo2ZZP7kM7pzSWGypf3L++y2gFmjaHL3LjXK/3POwBXqjoYbAM43/IM90nEPsvmiQ==
X-Received: by 2002:a62:384d:0:b0:5a8:af22:32e7 with SMTP id
 f74-20020a62384d000000b005a8af2232e7mr4606483pfa.6.1676526501591; 
 Wed, 15 Feb 2023 21:48:21 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:48:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 15/15] linux-user/sparc: Handle tag overflow traps
Date: Wed, 15 Feb 2023 19:45:16 -1000
Message-Id: <20230216054516.1267305-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
index 5a8a71e976..b36bb2574b 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -328,6 +328,9 @@ void cpu_loop (CPUSPARCState *env)
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


