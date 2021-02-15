Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A4D31B9A7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:50:11 +0100 (CET)
Received: from localhost ([::1]:54504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdKM-00073o-Hj
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdG9-0004A2-Dc
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:49 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:39693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFx-0000iv-5y
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:47 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mdvua-1llVyI466Q-00b074; Mon, 15 Feb 2021 13:45:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] linux-user: target: signal: Support TARGET_SS_AUTODISARM
Date: Mon, 15 Feb 2021 13:45:17 +0100
Message-Id: <20210215124519.720265-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
References: <20210215124519.720265-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nbW9whSTUythC6Igf4bFpsnN8/XOjMOXVOfaKkDIQYA+BPKIXS+
 64WrigwZqaaSZLz/hQJLpAG25VpUxXFf7Y5H+lp3Div4QspDQcAikZE/AXARdf0QD+44Wb+
 XulU5mQ5z0fD1vEDOpW5XCYQjCnX+AOOvadpXSnVdBbDYlJnMTi0muFniIHaxJHGeIIrBD2
 BqhPh3ySnCHd6QdoXnSdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EwwJxFSnhrw=:/E94WKhgFhCsSxSH+iuGRp
 Fu5eFyPSeOOwSB22kHrYJCUzDqov7xrmg7Qt7jw6sQWa5y9G647Ms16hVvoIVEYwZSCV3Ycdg
 mUodDMXXX43ezKt9GO6xQWE5bUZaw3QXli6BO+ktSOwvogUnR0ETxijI/CYAWdQRDlnoqwpEO
 qF6BZLIHpxoFrET1AUf7sUPWq0TOtrK3ZouMWSnNkDUr4gA2iDOxxDcwPc1f9rJZmCXo9GVMt
 0IWlz1pfRldXinC4IRm0sR4DGotM9+vG+9q+F5H5W9gAD4KmHZ+FJdI3UC3ZjjeUd/ydG7Pvo
 1AUgC/SLTBeaaIrAWp/a+ykJNleWMOeECSA5zy4nlIxod25U4eEOPsi8TK1+klEeK7yRnxDGt
 PBzcOKmYWs+6TRU/g77ox2DNa5Ez6YTCr61lZj3+LtATseVn/0YXH4+16vOujxL1Y/AGM0DfD
 8Rcm8/dWOQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Chen Gang <chengang@emindsoft.com.cn>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Gang <chengang@emindsoft.com.cn>

Add definitions to pass building.

Signed-off-by: Chen Gang <chengang@emindsoft.com.cn>
Message-Id: <20201008043105.21058-1-chengang@emindsoft.com.cn>
[lv: added the definitions in linux-user/generic/signal.h too]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/target_signal.h  | 6 ++++++
 linux-user/generic/signal.h       | 6 ++++++
 linux-user/hppa/target_signal.h   | 5 +++++
 linux-user/mips/target_signal.h   | 6 ++++++
 linux-user/mips64/target_signal.h | 5 +++++
 linux-user/sparc/target_signal.h  | 6 ++++++
 6 files changed, 34 insertions(+)

diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
index b83797281c32..0b90d3a89701 100644
--- a/linux-user/alpha/target_signal.h
+++ b/linux-user/alpha/target_signal.h
@@ -92,4 +92,10 @@ typedef struct target_sigaltstack {
 #define TARGET_GEN_SUBRNG7     -25
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+
+/* bit-flags */
+#define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
+/* mask for all SS_xxx flags */
+#define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
+
 #endif /* ALPHA_TARGET_SIGNAL_H */
diff --git a/linux-user/generic/signal.h b/linux-user/generic/signal.h
index e1083f8fba07..943bc1a1e220 100644
--- a/linux-user/generic/signal.h
+++ b/linux-user/generic/signal.h
@@ -54,4 +54,10 @@
 #define TARGET_SIG_BLOCK          0    /* for blocking signals */
 #define TARGET_SIG_UNBLOCK        1    /* for unblocking signals */
 #define TARGET_SIG_SETMASK        2    /* for setting the signal mask */
+
+/* bit-flags */
+#define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
+/* mask for all SS_xxx flags */
+#define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
+
 #endif
diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
index c52a3ea5794b..7f525362e91a 100644
--- a/linux-user/hppa/target_signal.h
+++ b/linux-user/hppa/target_signal.h
@@ -66,4 +66,9 @@ typedef struct target_sigaltstack {
 #define TARGET_MINSIGSTKSZ	2048
 #define TARGET_SIGSTKSZ		8192
 
+/* bit-flags */
+#define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
+/* mask for all SS_xxx flags */
+#define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
+
 #endif /* HPPA_TARGET_SIGNAL_H */
diff --git a/linux-user/mips/target_signal.h b/linux-user/mips/target_signal.h
index fa4084a99dcd..d521765f6b2c 100644
--- a/linux-user/mips/target_signal.h
+++ b/linux-user/mips/target_signal.h
@@ -73,4 +73,10 @@ typedef struct target_sigaltstack {
 /* compare linux/arch/mips/kernel/signal.c:setup_frame() */
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif
+
+/* bit-flags */
+#define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
+/* mask for all SS_xxx flags */
+#define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
+
 #endif /* MIPS_TARGET_SIGNAL_H */
diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
index f1f0ed7f7067..d857c55e4c6c 100644
--- a/linux-user/mips64/target_signal.h
+++ b/linux-user/mips64/target_signal.h
@@ -67,6 +67,11 @@ typedef struct target_sigaltstack {
 #define TARGET_MINSIGSTKSZ    2048
 #define TARGET_SIGSTKSZ       8192
 
+/* bit-flags */
+#define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
+/* mask for all SS_xxx flags */
+#define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
+
 #if defined(TARGET_ABI_MIPSO32)
 /* compare linux/arch/mips/kernel/signal.c:setup_frame() */
 #define TARGET_ARCH_HAS_SETUP_FRAME
diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index 1b10d1490fc9..911a3f5af55e 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -68,4 +68,10 @@ typedef struct target_sigaltstack {
 #define TARGET_SIGSTKSZ		16384
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+
+/* bit-flags */
+#define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
+/* mask for all SS_xxx flags */
+#define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
+
 #endif /* SPARC_TARGET_SIGNAL_H */
-- 
2.29.2


