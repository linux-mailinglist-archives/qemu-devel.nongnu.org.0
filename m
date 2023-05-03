Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6326B6F5714
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 13:21:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puAWt-0007jF-21; Wed, 03 May 2023 07:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1puAWq-0007hP-Nj
 for qemu-devel@nongnu.org; Wed, 03 May 2023 07:20:12 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1puAWo-00068c-PI
 for qemu-devel@nongnu.org; Wed, 03 May 2023 07:20:12 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5A52C22692;
 Wed,  3 May 2023 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683112809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=23e4mSLXy44MCn20HBTLYOmb197X5UhA0/1y0TRzz48=;
 b=zHgrikQxq4OiqqHYwt14q2oBcGB3NmYa0t0rwcaiLQmBSfgzHD6vEHBN10Erw9vUN/O9vv
 e8mEL/N/eoMKyvAfsyPBta7rv7t0Vr2sJcf7Pjzfh9qmLNettX0bGFJsHniJjb1fxccO+u
 +alAVylku6gG+0FM6i0ogmgSw7+azKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683112809;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=23e4mSLXy44MCn20HBTLYOmb197X5UhA0/1y0TRzz48=;
 b=v7pOXXUgFHFl9a0dnVmfP4odZGMggZJQrk6fajaYmG7bTSRjftRmF9nUK0Ym3e8mR8XjF6
 tLOK5IlZTYS2t4AQ==
Received: from hawking.suse.de (unknown [10.168.4.11])
 by relay2.suse.de (Postfix) with ESMTP id 4BDDF2C141;
 Wed,  3 May 2023 11:20:09 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
 id 39D2E4AAD8C; Wed,  3 May 2023 13:20:09 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Add /proc/cpuinfo handler for RISC-V
X-Yow: ..  here I am in 53 B.C. and all I want is a dill pickle!!
Date: Wed, 03 May 2023 13:20:09 +0200
Message-ID: <mvmv8h93bme.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=schwab@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
v2: dynmically compute the isa string

 linux-user/syscall.c | 55 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 69f740ff98..6df138c8b6 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8231,7 +8231,8 @@ void target_exception_dump(CPUArchState *env, const char *fmt, int code)
 }
 
 #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
-    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
+    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA) || \
+    defined(TARGET_RISCV)
 static int is_proc(const char *filename, const char *entry)
 {
     return strcmp(filename, entry) == 0;
@@ -8309,6 +8310,56 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 }
 #endif
 
+#if defined(TARGET_RISCV)
+static int open_cpuinfo(CPUArchState *cpu_env, int fd)
+{
+    int i, num_cpus;
+    char isa[32];
+
+#if defined(TARGET_RISCV32)
+    strcpy (isa, "rv32");
+#endif
+#if defined(TARGET_RISCV64)
+    strcpy (isa, "rv64");
+#endif
+    i = strlen (isa);
+    if (riscv_has_ext (cpu_env, RVI))
+        isa[i++] = 'i';
+    if (riscv_has_ext (cpu_env, RVE))
+        isa[i++] = 'e';
+    if (riscv_has_ext (cpu_env, RVM))
+        isa[i++] = 'm';
+    if (riscv_has_ext (cpu_env, RVA))
+        isa[i++] = 'a';
+    if (riscv_has_ext (cpu_env, RVF))
+        isa[i++] = 'f';
+    if (riscv_has_ext (cpu_env, RVD))
+        isa[i++] = 'd';
+    if (riscv_has_ext (cpu_env, RVV))
+        isa[i++] = 'v';
+    if (riscv_has_ext (cpu_env, RVC))
+        isa[i++] = 'c';
+    isa[i] = 0;
+
+    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
+    for (i = 0; i < num_cpus; i++) {
+        dprintf(fd, "processor\t: %d\n", i);
+        dprintf(fd, "hart\t\t: %d\n", i);
+        dprintf(fd, "isa\t\t: %s\n", isa);
+#if defined(TARGET_RISCV32)
+        dprintf(fd, "mmu\t\t: sv32\n");
+#endif
+#if defined(TARGET_RISCV64)
+        dprintf(fd, "mmu\t\t: sv57\n");
+#endif
+        dprintf(fd, "mvendorid\t: 0x0\n");
+        dprintf(fd, "marchid\t\t: 0x0\n");
+        dprintf(fd, "mimpid\t\t: 0x0\n\n");
+    }
+    return 0;
+}
+#endif
+
 #if defined(TARGET_M68K)
 static int open_hardware(CPUArchState *cpu_env, int fd)
 {
@@ -8333,7 +8384,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
 #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
         { "/proc/net/route", open_net_route, is_proc },
 #endif
-#if defined(TARGET_SPARC) || defined(TARGET_HPPA)
+#if defined(TARGET_SPARC) || defined(TARGET_HPPA) || defined(TARGET_RISCV)
         { "/proc/cpuinfo", open_cpuinfo, is_proc },
 #endif
 #if defined(TARGET_M68K)
-- 
2.40.1


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

