Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C9D12466D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:05:45 +0100 (CET)
Received: from localhost ([::1]:53159 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihY5H-000866-Q1
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44151)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY2e-0005ur-Me
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY2d-0007kp-4d
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:00 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35501)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY2c-0007hF-SB
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:02:59 -0500
Received: by mail-wm1-x32d.google.com with SMTP id p17so1618794wmb.0
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BLttWc7xIfiVJzAzVWvbxazDo12fWqVBLMv/5vrUv30=;
 b=K+XJm6HNnf5lU1sEDWYXI1c0KD/VUpWBRPNW1dk2EfO77fR4UG2fAlPvibeY5FU4fJ
 lH/Yey/fYdDCC60dLDRoRR26mnEewoOtWZ03cxmzNIwM2870o/OFm4jbtKPHMOFsfgIf
 0QrlqoQPxMv4IKAPxK5t2LU6NKPvL2hponkkdVsaWkDz3nQobYFcYMkCNE3cDWTfM9Un
 nwAGiFUmd2z+s/AKU1py8ZQZaTEmdBtvS1LrHL82+FyMlpa8qOr510GoxqJ+jbK+1UcP
 ty0YP02H0RRJLR510KQ7xKZ/6GSAKKOGlc8fPi8j8xA9QhXZBVmooG+8BDTSLWPHLAIj
 n5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=BLttWc7xIfiVJzAzVWvbxazDo12fWqVBLMv/5vrUv30=;
 b=Bt1PNrsxhW2KNoFW3QukXriUTjXTM1NrhWjfqEeSl4bPlPrWcq02c9yrRlotNpmMKb
 6bOV1HA6JMZtdJDUMz5Xg853c5gpcmydN1jrtY03PH0CIBive3Gv+KD3K6bgjwP+h2FO
 5PBHS0MHRIl9gvOQMwJ1dpxDDuDu2FzNZ7c7VSTdBmSrSXuxBKPfs2c5Trf711rjLU78
 YI5tnuZ/csv/0BMGIASa+q/RIP6mHzsz5G83reEKt3Y1JfneW9W48JpxJ2izGVGeYRAv
 MP2KFmzLOXmS56npgw1xCCbtxcukPsvVJBVxKgE7gxhOn1bmVNBzJok3Yk+g9pGRfhFn
 bR3g==
X-Gm-Message-State: APjAAAWLFlTzzlzMguVsi7YfPBBoH/cMKU223ImxQ1h5REBsJDJJ5wi5
 hkTifj2WB28ZGxl3C3+/0eGMpMu7
X-Google-Smtp-Source: APXvYqypAuJP/R2x7XQZo/1L8qbed3Ah/IF79bSDN3kFPU6Mto8fGmhmHjflCD02uFkJwZO4C5lPsw==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr2791082wmc.132.1576670577385; 
 Wed, 18 Dec 2019 04:02:57 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.02.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:02:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/87] migration-test: Create cmd_soure and cmd_target
Date: Wed, 18 Dec 2019 13:01:28 +0100
Message-Id: <1576670573-48048-3-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32d
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
Cc: Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

We are repeating almost everything for each machine while creating the
command line for migration.  And once for source and another for
destination.  We start putting there opts_src and opts_dst.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Tested-by: Cornelia Huck <cohuck@redhat.com> #s390x
Tested-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/migration-test.c | 44 +++++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/tests/migration-test.c b/tests/migration-test.c
index a5343fd..fbddcf2 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -557,6 +557,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
                                const char *opts_dst)
 {
     gchar *cmd_src, *cmd_dst;
+    gchar *cmd_source, *cmd_target;
     char *bootpath = NULL;
     char *extra_opts = NULL;
     char *shmem_path = NULL;
@@ -584,16 +585,16 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         cmd_src = g_strdup_printf("-machine accel=%s -m 150M"
                                   " -name source,debug-threads=on"
                                   " -serial file:%s/src_serial"
-                                  " -drive file=%s,format=raw %s %s",
+                                  " -drive file=%s,format=raw %s",
                                   accel, tmpfs, bootpath,
-                                  extra_opts ? extra_opts : "", opts_src);
+                                  extra_opts ? extra_opts : "");
         cmd_dst = g_strdup_printf("-machine accel=%s -m 150M"
                                   " -name target,debug-threads=on"
                                   " -serial file:%s/dest_serial"
                                   " -drive file=%s,format=raw"
-                                  " -incoming %s %s %s",
+                                  " -incoming %s %s",
                                   accel, tmpfs, bootpath, uri,
-                                  extra_opts ? extra_opts : "", opts_dst);
+                                  extra_opts ? extra_opts : "");
         start_address = X86_TEST_MEM_START;
         end_address = X86_TEST_MEM_END;
     } else if (g_str_equal(arch, "s390x")) {
@@ -601,15 +602,15 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         extra_opts = use_shmem ? get_shmem_opts("128M", shmem_path) : NULL;
         cmd_src = g_strdup_printf("-machine accel=%s -m 128M"
                                   " -name source,debug-threads=on"
-                                  " -serial file:%s/src_serial -bios %s %s %s",
+                                  " -serial file:%s/src_serial -bios %s %s",
                                   accel, tmpfs, bootpath,
-                                  extra_opts ? extra_opts : "", opts_src);
+                                  extra_opts ? extra_opts : "");
         cmd_dst = g_strdup_printf("-machine accel=%s -m 128M"
                                   " -name target,debug-threads=on"
                                   " -serial file:%s/dest_serial -bios %s"
-                                  " -incoming %s %s %s",
+                                  " -incoming %s %s",
                                   accel, tmpfs, bootpath, uri,
-                                  extra_opts ? extra_opts : "", opts_dst);
+                                  extra_opts ? extra_opts : "");
         start_address = S390_TEST_MEM_START;
         end_address = S390_TEST_MEM_END;
     } else if (strcmp(arch, "ppc64") == 0) {
@@ -620,15 +621,14 @@ static int test_migrate_start(QTestState **from, QTestState **to,
                                   " -prom-env 'use-nvramrc?=true' -prom-env "
                                   "'nvramrc=hex .\" _\" begin %x %x "
                                   "do i c@ 1 + i c! 1000 +loop .\" B\" 0 "
-                                  "until' %s %s",  accel, tmpfs, end_address,
-                                  start_address, extra_opts ? extra_opts : "",
-                                  opts_src);
+                                  "until' %s",  accel, tmpfs, end_address,
+                                  start_address, extra_opts ? extra_opts : "");
         cmd_dst = g_strdup_printf("-machine accel=%s,vsmt=8 -m 256M"
                                   " -name target,debug-threads=on"
                                   " -serial file:%s/dest_serial"
-                                  " -incoming %s %s %s",
+                                  " -incoming %s %s",
                                   accel, tmpfs, uri,
-                                  extra_opts ? extra_opts : "", opts_dst);
+                                  extra_opts ? extra_opts : "");
 
         start_address = PPC_TEST_MEM_START;
         end_address = PPC_TEST_MEM_END;
@@ -638,16 +638,16 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         cmd_src = g_strdup_printf("-machine virt,accel=%s,gic-version=max "
                                   "-name vmsource,debug-threads=on -cpu max "
                                   "-m 150M -serial file:%s/src_serial "
-                                  "-kernel %s %s %s",
+                                  "-kernel %s %s",
                                   accel, tmpfs, bootpath,
-                                  extra_opts ? extra_opts : "", opts_src);
+                                  extra_opts ? extra_opts : "");
         cmd_dst = g_strdup_printf("-machine virt,accel=%s,gic-version=max "
                                   "-name vmdest,debug-threads=on -cpu max "
                                   "-m 150M -serial file:%s/dest_serial "
                                   "-kernel %s "
-                                  "-incoming %s %s %s",
+                                  "-incoming %s %s",
                                   accel, tmpfs, bootpath, uri,
-                                  extra_opts ? extra_opts : "", opts_dst);
+                                  extra_opts ? extra_opts : "");
 
         start_address = ARM_TEST_MEM_START;
         end_address = ARM_TEST_MEM_END;
@@ -671,11 +671,17 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         cmd_dst = tmp;
     }
 
-    *from = qtest_init(cmd_src);
+    cmd_source = g_strdup_printf("%s %s",
+                                 cmd_src, opts_src);
     g_free(cmd_src);
+    *from = qtest_init(cmd_source);
+    g_free(cmd_source);
 
-    *to = qtest_init(cmd_dst);
+    cmd_target = g_strdup_printf("%s %s",
+                                 cmd_dst, opts_dst);
     g_free(cmd_dst);
+    *to = qtest_init(cmd_target);
+    g_free(cmd_target);
 
     /*
      * Remove shmem file immediately to avoid memory leak in test failed case.
-- 
1.8.3.1



