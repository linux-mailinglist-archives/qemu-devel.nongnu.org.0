Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0FA5F429D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 14:06:26 +0200 (CEST)
Received: from localhost ([::1]:35614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofggq-00079a-Mq
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 08:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofgbc-0004mJ-7f
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 08:01:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofgbY-0005Qe-7u
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 08:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664884854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1OKdKa0BPyNZN/qO95A/qJRyBmoC+8HlBqHXCOjX1Zg=;
 b=IAVhCrMTanycmqrwGyUQ0ybjMatpQ5FH6qt3lIJ3Ef/+tRQRP9tDNuYOnsXpXERRkbbxDJ
 +tLLqOUCljHeHv+KZ7gOkYyH7inVtBm8CjgmO3Je6BepSRiIuddrY9RYLAqCS7/loCMy7g
 RJMbv8Fjs+KZuEL7MIOOYbitWQMLiKE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-qhmhW5U4PJCqNvUUoNpMuA-1; Tue, 04 Oct 2022 08:00:51 -0400
X-MC-Unique: qhmhW5U4PJCqNvUUoNpMuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E812285A583;
 Tue,  4 Oct 2022 12:00:50 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FF7E40C6EC2;
 Tue,  4 Oct 2022 12:00:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, ncopa@alpinelinux.org,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] linux-user,bsd-user: re-exec with G_SLICE=always-malloc
Date: Tue,  4 Oct 2022 13:00:47 +0100
Message-Id: <20221004120047.857591-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The g_slice custom allocator is not async signal safe with its
mutexes. When a multithreaded program running in the qemu user
emulator forks, it can end up deadlocking in the g_slice
allocator

  Thread 1:
  #0 syscall () at ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
  #1 0x00007f54e190c77c in g_mutex_lock_slowpath (mutex=mutex@entry=0x7f54e1dc7600 <allocator+96>) at ../glib/gthread-posix.c:1462
  #2 0x00007f54e190d222 in g_mutex_lock (mutex=mutex@entry=0x7f54e1dc7600 <allocator+96>) at ../glib/gthread-posix.c:1486
  #3 0x00007f54e18e39f2 in magazine_cache_pop_magazine (countp=0x7f54280e6638, ix=2) at ../glib/gslice.c:769
  #4 thread_memory_magazine1_reload (ix=2, tmem=0x7f54280e6600) at ../glib/gslice.c:845
  #5 g_slice_alloc (mem_size=mem_size@entry=40) at ../glib/gslice.c:1058
  #6 0x00007f54e18f06fa in g_tree_node_new (value=0x7f54d4066540 <code_gen_buffer+419091>, key=0x7f54d4066560 <code_gen_buffer+419123>) at ../glib/gtree.c:517
  #7 g_tree_insert_internal (tree=0x555556aed800, key=0x7f54d4066560 <code_gen_buffer+419123>, value=0x7f54d4066540 <code_gen_buffer+419091>, replace=0) at ../glib/gtree.c:517
  #8 0x00007f54e186b755 in tcg_tb_insert (tb=0x7f54d4066540 <code_gen_buffer+419091>) at ../tcg/tcg.c:534
  #9 0x00007f54e1820545 in tb_gen_code (cpu=0x7f54980b4b60, pc=274906407438, cs_base=0, flags=24832, cflags=-16252928) at ../accel/tcg/translate-all.c:2118
  #10 0x00007f54e18034a5 in tb_find (cpu=0x7f54980b4b60, last_tb=0x7f54d4066440 <code_gen_buffer+418835>, tb_exit=0, cf_mask=524288) at ../accel/tcg/cpu-exec.c:462
  #11 0x00007f54e1803bd9 in cpu_exec (cpu=0x7f54980b4b60) at ../accel/tcg/cpu-exec.c:818
  #12 0x00007f54e1735a4c in cpu_loop (env=0x7f54980bce40) at ../linux-user/riscv/cpu_loop.c:37
  #13 0x00007f54e1844b22 in clone_func (arg=0x7f5402f3b080) at ../linux-user/syscall.c:6422
  #14 0x00007f54e191950a in start_thread (arg=<optimized out>) at pthread_create.c:477
  #15 0x00007f54e19a52a3 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

The only known workaround for this problem is to disable the g_slice
custom allocator, in favor of system malloc which is believed to be
async signal safe on all platforms QEMU officially targets.

g_slice uses a one-time initializer to check the G_SLICE env variable
making it hard for QEMU to set the env before any GLib API call has
triggered the initializer. Even attribute((constructor)) is not
sufficient as QEMU has many constructors and there is no ordering
guarantee between them.

This patch attempts to workaround this by re-exec()ing the QEMU user
emulators if the G_SLICE env variable is not already set. This means
the env variable will be inherited down the process tree spawned
from there onwards. There is a possibility this could have unexpected
consequences, but this has to be balanced against the real known
problem of QEMU user emulators randomly deadlocking.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/285
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---

Can't say I especially like this but I'm out of other ideas for how
to guarantee a solution. Users can't set env vars prior to launching
QEMU user emulators when using binfmt.

NB, I tested the linux-user impl and it stops the hangs in my
testing. I've not even compiled tested the bsd-user impl, just
blindly copied the linux-user code.

 bsd-user/main.c   | 20 ++++++++++++++++++++
 linux-user/main.c | 20 ++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 6f09180d65..c816ab80b3 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -284,6 +284,26 @@ int main(int argc, char **argv)
     envlist_t *envlist = NULL;
     char *argv0 = NULL;
 
+    /*
+     * Historically the g_slice custom allocator was not async
+     * signal safe with its mutexes, causing deadlocks when a
+     * threaded program forks. Setting G_SLICE=always-malloc
+     * forces use of system malloc which is generally safe.
+     *
+     * https://gitlab.com/qemu-project/qemu/-/issues/285
+     *
+     * Remove if we ever bump min GLib to a version that
+     * drops g_slice's custom allocator:
+     *
+     * https://gitlab.gnome.org/GNOME/glib/-/issues/1079
+     */
+    if (getenv("G_SLICE") == NULL) {
+        setenv("G_SLICE", "always-malloc", 1);
+        execvp(argv[0], argv);
+        perror("execvep");
+        abort();
+    }
+
     adjust_ssize();
 
     if (argc <= 1) {
diff --git a/linux-user/main.c b/linux-user/main.c
index 88fccfe261..62391b9d32 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -654,6 +654,26 @@ int main(int argc, char **argv, char **envp)
     unsigned long max_reserved_va;
     bool preserve_argv0;
 
+    /*
+     * Historically the g_slice custom allocator was not async
+     * signal safe with its mutexes, causing deadlocks when a
+     * threaded program forks. Setting G_SLICE=always-malloc
+     * forces use of system malloc which is generally safe.
+     *
+     * https://gitlab.com/qemu-project/qemu/-/issues/285
+     *
+     * Remove if we ever bump min GLib to a version that
+     * drops g_slice's custom allocator:
+     *
+     * https://gitlab.gnome.org/GNOME/glib/-/issues/1079
+     */
+    if (getenv("G_SLICE") == NULL) {
+        setenv("G_SLICE", "always-malloc", 1);
+        execvp(argv[0], argv);
+        perror("execvep");
+        abort();
+    }
+
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_cpu_list();
-- 
2.37.3


