Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC9C387157
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:37:11 +0200 (CEST)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisPm-00048b-7n
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKR-0006fX-Pi
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:39 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:34073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKQ-0006rx-1c
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:39 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M6m1g-1lq1Sl1ftm-008J43; Tue, 18
 May 2021 07:31:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/59] linux-user: strace now handles unshare syscall args
 correctly
Date: Tue, 18 May 2021 07:30:34 +0200
Message-Id: <20210518053131.87212-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2ejP3lxhC8GcLOmpXGyxdkjKL+zVCvb111roJaxIWq5zJIObRtk
 GL4D9ku/UFHHak9+1yYl6yUzZ3BpHmcmbO0f+0Zs6mv7dC478wd/s6Q9krQTLWcRLKUCv1y
 2KMo0L7/M0JAsNNDQdJ5DxfjyD1tWgDicP+0R/YfG8BhdVj3HAZlQyXglbREzhXeXLiP343
 O8JHt62/WItvToPZkQpxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:laiUJS9aQk8=:X/jB5lnn7WF2Y/8TC4JyvR
 IjbFDhqWLNq7l5vSFO7RL9+Qvf08N8xx86Mqdt6jgwKFsbUMGqu/pwRXa+cyBRprndXj+1U9+
 ntbkwr7pxxLkek/8/OUlEsYVnjy2WTxlG0rn9XddfD1z7iMGIX9/zlvKQj4oZ9YbmTwHRG0Vt
 vhohTogo1p8vMqqZUk73cQlc58oIe8boznKbPMbzrZfG7Ou0tGu3M1p0rSTSGI+nHq1e9eBpp
 +TYHnhxcboMWcAWyHYSnV5jfhKPlYANEkLFnSlFHgapG2AKgYk46E9+Dx/QMT2WwuauPgfRoF
 MBh4zQZ+FKwEiAiCy7kTALgLNzcrtwBOo5CwOHymR3pMczr64dWm7PwyagAL8WUfJNzd16IOs
 4/1Vjxq13KALxWcuNOb9fRyQDgTM0Nli0LUJ7WU6wK4xyikaKXcybZC1w7m22gb8vZPjtB2tw
 9l4Dyi9or7U9I8QeRXzi3j8KO07e/RrK3/jZQkdTCvxjy6qojCEsPBP6BbgTsNttNJB2CubNA
 XycPIlFjadBtOySOCWRO+U=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, Matus Kysel <mkysel@tachyum.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matus Kysel <mkysel@tachyum.com>

Syscall unshare did not have custom print function for strace, but it's argument is same as flags in clone syscall, so it can be easily implemented.
Also updated missing flags from clone_flags.

Signed-off-by: Matus Kysel <mkysel@tachyum.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210406144203.1020598-1-mkysel@tachyum.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c    | 18 ++++++++++++++++++
 linux-user/strace.list |  2 +-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index e969121b6cd7..1cadb6d50f2d 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1109,6 +1109,12 @@ UNUSED static struct flags clone_flags[] = {
 #if defined(CLONE_NEWNET)
     FLAG_GENERIC(CLONE_NEWNET),
 #endif
+#if defined(CLONE_NEWCGROUP)
+    FLAG_GENERIC(CLONE_NEWCGROUP),
+#endif
+#if defined(CLONE_NEWTIME)
+    FLAG_GENERIC(CLONE_NEWTIME),
+#endif
 #if defined(CLONE_IO)
     FLAG_GENERIC(CLONE_IO),
 #endif
@@ -3467,6 +3473,18 @@ print_unlinkat(void *cpu_env, const struct syscallname *name,
 }
 #endif
 
+#ifdef TARGET_NR_unshare
+static void
+print_unshare(void *cpu_env, const struct syscallname *name,
+              abi_long arg0, abi_long arg1, abi_long arg2,
+              abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_flags(clone_flags, arg0, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #ifdef TARGET_NR_utime
 static void
 print_utime(void *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 084048ab96dd..3b7c15578ca4 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1573,7 +1573,7 @@
 { TARGET_NR_unlinkat, "unlinkat" , NULL, print_unlinkat, NULL },
 #endif
 #ifdef TARGET_NR_unshare
-{ TARGET_NR_unshare, "unshare" , NULL, NULL, NULL },
+{ TARGET_NR_unshare, "unshare" , NULL, print_unshare, NULL },
 #endif
 #ifdef TARGET_NR_userfaultfd
 { TARGET_NR_userfaultfd, "userfaultfd" , NULL, NULL, NULL },
-- 
2.31.1


