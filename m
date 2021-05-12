Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FCE37CF0F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:30:38 +0200 (CEST)
Received: from localhost ([::1]:55564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsgv-00039a-RZ
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUf-0007JE-EC
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:57 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:34775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUU-0008Ma-GE
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:57 -0400
Received: by mail-io1-xd32.google.com with SMTP id l21so22427207iob.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DcXgMF9UlcBLkEbYZL77DciaFqqy1JLy93/coOTrH2M=;
 b=NNp/sT1XAfmZnELlDG1cJgBb97QOdah7FA87yuOHvCncPJryTbZzSxz7CUcR/9w/mv
 x9WYxi8U9qWng9vfYgIvPa/w6ghb1dNYgIHLSvHOHoTRaSC1RiGnp5ytSosfUOq5Brdf
 owlwuYOfWA+MS2f+igSfoq8eDepWIp6tU9NN9GQJwiMEdERHhiY/UbqIZs5mqGeBwZIO
 Xsb4gO/YZdDyM400/RFhuxKp4h/IqUBPpKU9XsEXk9mh12zpMt9ed7zTntlcnk+pxIc2
 Wpj9TZT7Xu9TlOD2YPKGtlx/vJ4yGJ7g3jJ6DT8piuAjflsrY02aG0CDOjaaGpL1vSrX
 45Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DcXgMF9UlcBLkEbYZL77DciaFqqy1JLy93/coOTrH2M=;
 b=oWB9a1CrUUhyodsKLTBjVhI9+Zn2yWaJJ24qGgRI64eQ2huDFs4wQuR1eoxd3DhOIM
 0eiYp+Q7731PBXRgrgLt/tqlF3pNNKn6D1oMUr8jInQ4/E53dUEItUHJAuDV55He0O0a
 hLKPcgl3KFDzpergpwchF2TPIZLZ3FtHGXnrtjvxFt1qQfs+qxyZO+xwAXaTXsQVCqEv
 n2hifwM52KCPkIN8yxJSCGmPJJQDotgzLg6h85T0TQrrBm1cIRQ6SfNNwZAx4513z+pa
 wi4WDOUtoA19kPBiir2ZfhGh0PvCa5RwL2tGab5TUY3fN4ksYLn9FfW0keD9TgAFsU+P
 n84A==
X-Gm-Message-State: AOAM533RgM8Ml1jItVD8CUwWZrNQx0r9pOeZ9NC7ea84p1Gu1YJuZQpg
 WtXZxgDprTgvMe2/J3Mq1jiAilADz/enYA==
X-Google-Smtp-Source: ABdhPJylKFpGQ4sf2feRgKJB3CFmkLUvzfvJrFkSvos7ADSjIg2Vm2C0mtzjBJKw8qsCGVJWf0KP0w==
X-Received: by 2002:a05:6602:55:: with SMTP id
 z21mr16248994ioz.54.1620839864900; 
 Wed, 12 May 2021 10:17:44 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:44 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/20] bsd-user: remove target_signal.h, it's unused
Date: Wed, 12 May 2021 11:17:18 -0600
Message-Id: <20210512171720.46744-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the target_signal.h file. None of its contents are currently used and the
bsd-user fork doesn't use them (so this reduces the diffs there).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/i386/target_signal.h    | 20 --------------------
 bsd-user/qemu.h                  |  1 -
 bsd-user/signal.c                |  1 -
 bsd-user/sparc/target_signal.h   | 27 ---------------------------
 bsd-user/sparc64/target_signal.h | 27 ---------------------------
 bsd-user/x86_64/target_signal.h  | 19 -------------------
 6 files changed, 95 deletions(-)
 delete mode 100644 bsd-user/i386/target_signal.h
 delete mode 100644 bsd-user/sparc/target_signal.h
 delete mode 100644 bsd-user/sparc64/target_signal.h
 delete mode 100644 bsd-user/x86_64/target_signal.h

diff --git a/bsd-user/i386/target_signal.h b/bsd-user/i386/target_signal.h
deleted file mode 100644
index 2ef36d1f98..0000000000
--- a/bsd-user/i386/target_signal.h
+++ /dev/null
@@ -1,20 +0,0 @@
-#ifndef TARGET_SIGNAL_H
-#define TARGET_SIGNAL_H
-
-#include "cpu.h"
-
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-	abi_ulong ss_sp;
-	abi_long ss_flags;
-	abi_ulong ss_size;
-} target_stack_t;
-
-
-static inline abi_ulong get_sp_from_cpustate(CPUX86State *state)
-{
-    return state->regs[R_ESP];
-}
-
-#endif /* TARGET_SIGNAL_H */
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 8d3767964d..eb66d15df7 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -38,7 +38,6 @@ extern enum BSDType bsd_type;
 
 #include "syscall_defs.h"
 #include "target_syscall.h"
-#include "target_signal.h"
 #include "exec/gdbstub.h"
 
 #if defined(CONFIG_USE_NPTL)
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index f6f7aa2427..ad6d935569 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -19,7 +19,6 @@
 #include "qemu/osdep.h"
 
 #include "qemu.h"
-#include "target_signal.h"
 
 void signal_init(void)
 {
diff --git a/bsd-user/sparc/target_signal.h b/bsd-user/sparc/target_signal.h
deleted file mode 100644
index 5b2abba40f..0000000000
--- a/bsd-user/sparc/target_signal.h
+++ /dev/null
@@ -1,27 +0,0 @@
-#ifndef TARGET_SIGNAL_H
-#define TARGET_SIGNAL_H
-
-#include "cpu.h"
-
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-	abi_ulong ss_sp;
-	abi_long ss_flags;
-	abi_ulong ss_size;
-} target_stack_t;
-
-
-#ifndef UREG_I6
-#define UREG_I6        6
-#endif
-#ifndef UREG_FP
-#define UREG_FP        UREG_I6
-#endif
-
-static inline abi_ulong get_sp_from_cpustate(CPUSPARCState *state)
-{
-    return state->regwptr[UREG_FP];
-}
-
-#endif /* TARGET_SIGNAL_H */
diff --git a/bsd-user/sparc64/target_signal.h b/bsd-user/sparc64/target_signal.h
deleted file mode 100644
index 5b2abba40f..0000000000
--- a/bsd-user/sparc64/target_signal.h
+++ /dev/null
@@ -1,27 +0,0 @@
-#ifndef TARGET_SIGNAL_H
-#define TARGET_SIGNAL_H
-
-#include "cpu.h"
-
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-	abi_ulong ss_sp;
-	abi_long ss_flags;
-	abi_ulong ss_size;
-} target_stack_t;
-
-
-#ifndef UREG_I6
-#define UREG_I6        6
-#endif
-#ifndef UREG_FP
-#define UREG_FP        UREG_I6
-#endif
-
-static inline abi_ulong get_sp_from_cpustate(CPUSPARCState *state)
-{
-    return state->regwptr[UREG_FP];
-}
-
-#endif /* TARGET_SIGNAL_H */
diff --git a/bsd-user/x86_64/target_signal.h b/bsd-user/x86_64/target_signal.h
deleted file mode 100644
index 659cd401b8..0000000000
--- a/bsd-user/x86_64/target_signal.h
+++ /dev/null
@@ -1,19 +0,0 @@
-#ifndef TARGET_SIGNAL_H
-#define TARGET_SIGNAL_H
-
-#include "cpu.h"
-
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-	abi_ulong ss_sp;
-	abi_long ss_flags;
-	abi_ulong ss_size;
-} target_stack_t;
-
-static inline abi_ulong get_sp_from_cpustate(CPUX86State *state)
-{
-    return state->regs[R_ESP];
-}
-
-#endif /* TARGET_SIGNAL_H */
-- 
2.22.1


