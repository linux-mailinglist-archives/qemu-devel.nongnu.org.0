Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA083799E6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 00:18:22 +0200 (CEST)
Received: from localhost ([::1]:45802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgEEH-0000tQ-Vc
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 18:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgEBW-0004KV-5r
 for qemu-devel@nongnu.org; Mon, 10 May 2021 18:15:30 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:44822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgEBU-000174-DN
 for qemu-devel@nongnu.org; Mon, 10 May 2021 18:15:29 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so15838320otp.11
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 15:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dg6NYMP0vhtc+/J2gH0FjUFOnAnUaOi95JsOKkGvxBc=;
 b=z1w+7XnrXnJChMPNUkPC7Nu6pPHLeR39Kq57qJYT8YVQ18es97KnMp4ODjVBHheVer
 tQfj6DX01nKR0FpD+D4B+o+/zgIwZ5mdNV/MAQte9JaYN/xuZnxdAhQ1IHEfJpMG9RhD
 pi0vAwK242RGC4tJ7WRd336SoR+vIwGFOxC5B0MU4dzdtARgE4npUoyb0/IRi1iNKeQy
 ocbnNBcmhwzFfkANRxIqfRq01upF5oN9Pm8To8ApMJJGPUqdqEzM8pqYlA4z5anIy9We
 M72/a1FbYIuCMTwsA3QWhqMNWV/9zYT4VdcXU24j2qbXETO1Vzj1Te6d99hphipyrnyl
 Edug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dg6NYMP0vhtc+/J2gH0FjUFOnAnUaOi95JsOKkGvxBc=;
 b=i7jc/50mCXh+mIjG45PUFfN30OpBpPOtE3lOY8QDn5Z7vGYNLTJlO2pkRGgXD43sRw
 C6R92AM1GuUlZ7klQ2fKBnj6baa3CA6bWh2mRbZGeX87+EY0Yb/TqhFey1Fwvk37Q98g
 l9aGWX2TavN8g1mQMDCJLMHYrkDLnoSRQBvwG1V5cGAGcqG5DKySo7IGGJDfCs7C8m08
 dTvx91RxpStrOTK8fFUDS2gpDq4RKhi2nrX6w+3HqiVEC4ayJLyb2RyalfkGD+Qxn2u6
 yLiz5k5z5repu9XqXsvTqQk+CJJSbNKv4LFuMHEtk6i+yiOcfHkmNqg92UK+Zsfd96TL
 NQ9w==
X-Gm-Message-State: AOAM531yubedIWrdmb6GXBubZJvQL6cV+STm/14xZcIyWeOJ5UQdlfpU
 q3bqkz4P8FoAcrcGRBccb4lsT4MtpBdTCA==
X-Google-Smtp-Source: ABdhPJzjWAje/dpfDzGY0Q4eXovreOwBeKcam8iehiM1MUButQ8ehjbu8m9+bqsOHfE9xR/Tm0fH9w==
X-Received: by 2002:a9d:684e:: with SMTP id c14mr22928708oto.295.1620684926755; 
 Mon, 10 May 2021 15:15:26 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id p64sm2874405oib.57.2021.05.10.15.15.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 May 2021 15:15:26 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] bsd-user: remove target_signal.h, it's unused
Date: Mon, 10 May 2021 16:15:09 -0600
Message-Id: <20210510221511.14205-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210510221511.14205-1-imp@bsdimp.com>
References: <20210510221511.14205-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::333;
 envelope-from=imp@bsdimp.com; helo=mail-ot1-x333.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the target_signal.h file. None of its contents are currently used and the
bsd-user fork doesn't use them (so this reduces the diffs there).

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
index 5a82722281..369c649fe5 100644
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


