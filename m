Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25962AFAA5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 22:42:17 +0100 (CET)
Received: from localhost ([::1]:37630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcxse-0002A2-SY
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 16:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcxrE-0000to-3W
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:40:48 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:45157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcxr8-00069S-75
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:40:47 -0500
Received: from localhost.localdomain ([82.252.148.166]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MRnTQ-1kk4K72HPe-00T9sN; Wed, 11 Nov 2020 22:40:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] linux-user: Correct definition of stack_t
Date: Wed, 11 Nov 2020 22:40:32 +0100
Message-Id: <20201111214033.432676-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111214033.432676-1-laurent@vivier.eu>
References: <20201111214033.432676-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/+exUfBSNQNSBuNEpIBqgHuVU3RaJjApEB8vgM4JeG++K9MobJW
 T+IFp9Zj8gtyiW6Rd9rPZWO3NsSti/4OiwdnlXM5xAFFd5wVmekQDpPDh0ND3wWv5Ex2jTX
 hCgfFzqr1p4FY8HmE8WIK+nUqcfnWfcoS+6uD4nXyWqkJMp4aFPDoegbAFPb5WvPazPxONf
 E9oSdxY3rakzGD+0LG1fA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BtoQETaGNGE=:s6ds4faqezIhI8hkCDn81z
 c+ON0O1xwm7G+JhfRErBST9w07PFslz6AjrsIBhel/Mwq0m9fGZ8u9uOVyEykhhvvYsMNgjZc
 cqVrDEfvWhILvZ5Yak/YAINtONdoWa7kNdtV6utPR7EVJZGAMEI71txHCurFS5FXry7wZOKIv
 /oVgqktxyhzNwle6hxKgy7k0M4ALNyEP1PV5+LtaXkY/3PB/wgTLTgp44wqxh3xAAhLvwoiat
 fkaOo7w13M4C3bHVBiIkStMe3zCeqPEraPYHxXJe86KeUQ9IbUN15SgrBAAnfnr7A9Sto3529
 2AxH81J15P3nVqAlllfNlJhz6j+VuM8T3rN2WwBL/nxSGvv7H1ncHcFfKD5QAj6JiTv/HSvZG
 ZOgd1+kS2lgdaImsrse2ljrYOLp0Jc24FzcapvU6MZcFkDPcxDs4hcDS76NwM8C5+0PAIQVpb
 TL9IPBgNFQ==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 16:40:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: LemonBoy <thatlemon@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LemonBoy <thatlemon@gmail.com>

Some platforms used the wrong definition of stack_t where the flags and
size fields were swapped or where the flags field had type ulong instead
of int.

Due to the presence of padding space in the structure and the prevalence
of little-endian machines this problem went unnoticed for a long time.

The type definitions have been cross-checked with the ones defined in
the Linux kernel v5.9, plus some older versions for a few architecture
that have been removed and Xilinx's kernel fork for NiosII [1].

The bsd-user headers remain unchanged as I don't know if they are wrong
or not.

[1] https://github.com/Xilinx/linux-xlnx/blob/master/arch/nios2/include/uapi/asm/signal.h

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <e9d47692-ee92-009f-6007-0abc3f502b97@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/target_signal.h      | 3 +--
 linux-user/arm/target_signal.h        | 6 +++---
 linux-user/cris/target_signal.h       | 6 +++---
 linux-user/hppa/target_signal.h       | 2 +-
 linux-user/i386/target_signal.h       | 6 +++---
 linux-user/m68k/target_signal.h       | 6 +++---
 linux-user/microblaze/target_signal.h | 6 +++---
 linux-user/mips/target_signal.h       | 6 +++---
 linux-user/mips64/target_signal.h     | 7 +++----
 linux-user/nios2/target_signal.h      | 5 +++--
 linux-user/ppc/target_signal.h        | 6 +++---
 linux-user/s390x/target_signal.h      | 2 +-
 linux-user/sh4/target_signal.h        | 6 +++---
 linux-user/sparc/target_signal.h      | 6 +++---
 linux-user/x86_64/target_signal.h     | 6 +++---
 15 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
index cd63d59fdec1..b83797281c32 100644
--- a/linux-user/alpha/target_signal.h
+++ b/linux-user/alpha/target_signal.h
@@ -42,8 +42,7 @@
 
 typedef struct target_sigaltstack {
     abi_ulong ss_sp;
-    int32_t ss_flags;
-    int32_t dummy;
+    abi_int ss_flags;
     abi_ulong ss_size;
 } target_stack_t;
 
diff --git a/linux-user/arm/target_signal.h b/linux-user/arm/target_signal.h
index ea123c40f38d..0998dd6dfa75 100644
--- a/linux-user/arm/target_signal.h
+++ b/linux-user/arm/target_signal.h
@@ -4,9 +4,9 @@
 /* this struct defines a stack used during syscall handling */
 
 typedef struct target_sigaltstack {
-	abi_ulong ss_sp;
-	abi_long ss_flags;
-	abi_ulong ss_size;
+    abi_ulong ss_sp;
+    abi_int ss_flags;
+    abi_ulong ss_size;
 } target_stack_t;
 
 
diff --git a/linux-user/cris/target_signal.h b/linux-user/cris/target_signal.h
index 1cb5548f85ea..495a14289681 100644
--- a/linux-user/cris/target_signal.h
+++ b/linux-user/cris/target_signal.h
@@ -4,9 +4,9 @@
 /* this struct defines a stack used during syscall handling */
 
 typedef struct target_sigaltstack {
-	abi_ulong ss_sp;
-	abi_ulong ss_size;
-	abi_long ss_flags;
+    abi_ulong ss_sp;
+    abi_int ss_flags;
+    abi_ulong ss_size;
 } target_stack_t;
 
 
diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
index c2a0102ed73d..c52a3ea5794b 100644
--- a/linux-user/hppa/target_signal.h
+++ b/linux-user/hppa/target_signal.h
@@ -44,7 +44,7 @@
 
 typedef struct target_sigaltstack {
     abi_ulong ss_sp;
-    int32_t ss_flags;
+    abi_int ss_flags;
     abi_ulong ss_size;
 } target_stack_t;
 
diff --git a/linux-user/i386/target_signal.h b/linux-user/i386/target_signal.h
index f55e78fd33e7..50361af8746e 100644
--- a/linux-user/i386/target_signal.h
+++ b/linux-user/i386/target_signal.h
@@ -4,9 +4,9 @@
 /* this struct defines a stack used during syscall handling */
 
 typedef struct target_sigaltstack {
-	abi_ulong ss_sp;
-	abi_long ss_flags;
-	abi_ulong ss_size;
+    abi_ulong ss_sp;
+    abi_int ss_flags;
+    abi_ulong ss_size;
 } target_stack_t;
 
 
diff --git a/linux-user/m68k/target_signal.h b/linux-user/m68k/target_signal.h
index 314e808844a4..d096544ef842 100644
--- a/linux-user/m68k/target_signal.h
+++ b/linux-user/m68k/target_signal.h
@@ -4,9 +4,9 @@
 /* this struct defines a stack used during syscall handling */
 
 typedef struct target_sigaltstack {
-	abi_ulong ss_sp;
-	abi_long ss_flags;
-	abi_ulong ss_size;
+    abi_ulong ss_sp;
+    abi_int ss_flags;
+    abi_ulong ss_size;
 } target_stack_t;
 
 
diff --git a/linux-user/microblaze/target_signal.h b/linux-user/microblaze/target_signal.h
index 08bcf24b9d1c..1c326296de42 100644
--- a/linux-user/microblaze/target_signal.h
+++ b/linux-user/microblaze/target_signal.h
@@ -4,9 +4,9 @@
 /* this struct defines a stack used during syscall handling */
 
 typedef struct target_sigaltstack {
-	abi_ulong ss_sp;
-	abi_ulong ss_size;
-	abi_long ss_flags;
+    abi_ulong ss_sp;
+    abi_int ss_flags;
+    abi_ulong ss_size;
 } target_stack_t;
 
 
diff --git a/linux-user/mips/target_signal.h b/linux-user/mips/target_signal.h
index 66e1ad44a64e..fa4084a99dcd 100644
--- a/linux-user/mips/target_signal.h
+++ b/linux-user/mips/target_signal.h
@@ -45,9 +45,9 @@
 /* this struct defines a stack used during syscall handling */
 
 typedef struct target_sigaltstack {
-	abi_long ss_sp;
-	abi_ulong ss_size;
-	abi_long ss_flags;
+    abi_ulong ss_sp;
+    abi_ulong ss_size;
+    abi_int ss_flags;
 } target_stack_t;
 
 
diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
index 753e91fbd695..799f7a668cd0 100644
--- a/linux-user/mips64/target_signal.h
+++ b/linux-user/mips64/target_signal.h
@@ -45,12 +45,11 @@
 /* this struct defines a stack used during syscall handling */
 
 typedef struct target_sigaltstack {
-	abi_long ss_sp;
-	abi_ulong ss_size;
-	abi_int ss_flags;
+    abi_ulong ss_sp;
+    abi_ulong ss_size;
+    abi_int ss_flags;
 } target_stack_t;
 
-
 /*
  * sigaltstack controls
  */
diff --git a/linux-user/nios2/target_signal.h b/linux-user/nios2/target_signal.h
index fe48721b3db0..aebf749f1278 100644
--- a/linux-user/nios2/target_signal.h
+++ b/linux-user/nios2/target_signal.h
@@ -4,11 +4,12 @@
 /* this struct defines a stack used during syscall handling */
 
 typedef struct target_sigaltstack {
-    abi_long ss_sp;
+    abi_ulong ss_sp;
+    abi_int ss_flags;
     abi_ulong ss_size;
-    abi_long ss_flags;
 } target_stack_t;
 
+
 /* sigaltstack controls  */
 #define TARGET_SS_ONSTACK     1
 #define TARGET_SS_DISABLE     2
diff --git a/linux-user/ppc/target_signal.h b/linux-user/ppc/target_signal.h
index 4453e2e7efd7..72fcdd9bfa20 100644
--- a/linux-user/ppc/target_signal.h
+++ b/linux-user/ppc/target_signal.h
@@ -4,9 +4,9 @@
 /* this struct defines a stack used during syscall handling */
 
 typedef struct target_sigaltstack {
-	abi_ulong ss_sp;
-	int ss_flags;
-	abi_ulong ss_size;
+    abi_ulong ss_sp;
+    abi_int ss_flags;
+    abi_ulong ss_size;
 } target_stack_t;
 
 
diff --git a/linux-user/s390x/target_signal.h b/linux-user/s390x/target_signal.h
index b58bc7c20f63..bbfc464d4417 100644
--- a/linux-user/s390x/target_signal.h
+++ b/linux-user/s390x/target_signal.h
@@ -3,7 +3,7 @@
 
 typedef struct target_sigaltstack {
     abi_ulong ss_sp;
-    int ss_flags;
+    abi_int ss_flags;
     abi_ulong ss_size;
 } target_stack_t;
 
diff --git a/linux-user/sh4/target_signal.h b/linux-user/sh4/target_signal.h
index 434970a9900a..d7309b7136d7 100644
--- a/linux-user/sh4/target_signal.h
+++ b/linux-user/sh4/target_signal.h
@@ -4,9 +4,9 @@
 /* this struct defines a stack used during syscall handling */
 
 typedef struct target_sigaltstack {
-	abi_ulong ss_sp;
-	abi_long ss_flags;
-	abi_ulong ss_size;
+    abi_ulong ss_sp;
+    abi_int ss_flags;
+    abi_ulong ss_size;
 } target_stack_t;
 
 
diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index 5cc40327d2c2..1b10d1490fc9 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -42,9 +42,9 @@
 /* this struct defines a stack used during syscall handling */
 
 typedef struct target_sigaltstack {
-	abi_ulong ss_sp;
-	abi_long ss_flags;
-	abi_ulong ss_size;
+    abi_ulong ss_sp;
+    abi_int ss_flags;
+    abi_ulong ss_size;
 } target_stack_t;
 
 
diff --git a/linux-user/x86_64/target_signal.h b/linux-user/x86_64/target_signal.h
index 4c4380f7b949..4ea74f20dd42 100644
--- a/linux-user/x86_64/target_signal.h
+++ b/linux-user/x86_64/target_signal.h
@@ -4,9 +4,9 @@
 /* this struct defines a stack used during syscall handling */
 
 typedef struct target_sigaltstack {
-	abi_ulong ss_sp;
-	abi_long ss_flags;
-	abi_ulong ss_size;
+    abi_ulong ss_sp;
+    abi_int ss_flags;
+    abi_ulong ss_size;
 } target_stack_t;
 
 
-- 
2.28.0


