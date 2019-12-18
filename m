Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0776812467B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:08:51 +0100 (CET)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihY8H-0004gT-MI
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY2o-00063x-CA
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY2k-0008Hv-65
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:10 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39620)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY2j-0008DS-UI
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:06 -0500
Received: by mail-wr1-x42a.google.com with SMTP id y11so2002064wrt.6
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Gj+EHCblifh5MMn3itLSDnoZXL5PyxBzL8vDQC39wXs=;
 b=qDWtq3qr6BfXGg3qZlv8Z5pOH/cljN/w38ndHGVqzhaYIdW07ITG3ir2z/fiS6c7P7
 TvWznhQJs+SRmJsAB3ch4RqnmROPi9hD6hqL3plC+uX989dARYx4jDGtOB+EDKFAWKyX
 Ip9TPBGCltwICdGn/3NmhfzPdBLE59rrjwu90K385uzCRbu0DKZqEt29caOhd+jl1JJl
 Xg7bKpsywtbUah+oBUV7mbZUsLDKEV4JEdAtWYwoIg9qbiiMr0bkYk8kQoyQ2w8meazl
 r+4Zm88yZoWxLsTh9FFVFj5W21DrKGUZ3rktwTW3oj0zxeuw3vys7NSR569COaBxqF+6
 3nMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=Gj+EHCblifh5MMn3itLSDnoZXL5PyxBzL8vDQC39wXs=;
 b=f9cMF/Jv8b/Pv+pXG3/KmzNejAiGaE0G20ywbr8GyAS2I9Umtqa2tcFOntq4Dd/jis
 xEsMwcrVsjcigSsca68wdlkGgMYiuWIchf+NnB4ZCxcHiSAeZB3pODQRRF7ajMSZ69Rx
 C2UsvotQ/p4iq+jGjvxWBNR346D68gC9E8NzQbTWFdHjclyGty11TPrXJkVhdk/xffil
 gpECW+zgg+v+Hye+rJuoWIk6j1pbMBFnI4KCHwTqRxdlLr7bQ2kwejuF+HMeQW0eBhPx
 pWlz646EVS9I+OTuJdBvckXCjMWSFbnmMPqHrs/be1pJMPC7G4LNT/ixrNrvXk00jyPS
 BFxw==
X-Gm-Message-State: APjAAAX8lk46xc92aTIZFhelvI7WUtmNHx/pLYp2cd2pL7odKDdH8a24
 p0OEnn9pRtTwolnxFSEH9d2xFjoa
X-Google-Smtp-Source: APXvYqzaJEK04tFi6qV8oYnDTnzcYe84a/m4v8i5sy8Er09QFPscZ5mFxTEBObO4woIdrBr1zeGJyQ==
X-Received: by 2002:a05:6000:11c3:: with SMTP id
 i3mr2431079wrx.244.1576670584579; 
 Wed, 18 Dec 2019 04:03:04 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.03.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:03:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/87] migration-test: Move -incomming handling to common
 commandline
Date: Wed, 18 Dec 2019 13:01:35 +0100
Message-Id: <1576670573-48048-10-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42a
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
Tested-by: Cornelia Huck <cohuck@redhat.com> #s390x
Tested-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/migration-test.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/tests/migration-test.c b/tests/migration-test.c
index e1304d7..14f2ce3 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -580,9 +580,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         machine_args = "";
         memory_size = "150M";
         cmd_src = g_strdup_printf("-drive file=%s,format=raw", bootpath);
-        cmd_dst = g_strdup_printf("-drive file=%s,format=raw"
-                                  " -incoming %s",
-                                  bootpath, uri);
+        cmd_dst = g_strdup(cmd_src);
         start_address = X86_TEST_MEM_START;
         end_address = X86_TEST_MEM_END;
     } else if (g_str_equal(arch, "s390x")) {
@@ -591,9 +589,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         machine_args = "";
         memory_size = "128M";
         cmd_src = g_strdup_printf("-bios %s", bootpath);
-        cmd_dst = g_strdup_printf("-bios %s"
-                                  " -incoming %s",
-                                  bootpath, uri);
+        cmd_dst = g_strdup(cmd_src);
         start_address = S390_TEST_MEM_START;
         end_address = S390_TEST_MEM_END;
     } else if (strcmp(arch, "ppc64") == 0) {
@@ -605,7 +601,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
                                   "'nvramrc=hex .\" _\" begin %x %x "
                                   "do i c@ 1 + i c! 1000 +loop .\" B\" 0 "
                                   "until'", end_address, start_address);
-        cmd_dst = g_strdup_printf(" -incoming %s", uri);
+        cmd_dst = g_strdup("");
         start_address = PPC_TEST_MEM_START;
         end_address = PPC_TEST_MEM_END;
     } else if (strcmp(arch, "aarch64") == 0) {
@@ -616,11 +612,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         cmd_src = g_strdup_printf("-cpu max "
                                   "-kernel %s",
                                   bootpath);
-        cmd_dst = g_strdup_printf("-cpu max "
-                                  "-kernel %s "
-                                  "-incoming %s",
-                                  bootpath, uri);
-
+        cmd_dst = g_strdup(cmd_src);
         start_address = ARM_TEST_MEM_START;
         end_address = ARM_TEST_MEM_END;
 
@@ -650,11 +642,11 @@ static int test_migrate_start(QTestState **from, QTestState **to,
 
     cmd_source = g_strdup_printf("-machine %saccel=kvm:tcg%s "
                                  "-name source,debug-threads=on "
-                                 "-serial file:%s/src_serial "
                                  "-m %s "
+                                 "-serial file:%s/src_serial "
                                  "%s %s %s %s",
                                  machine_type, machine_args,
-                                 tmpfs, memory_size,
+                                 memory_size, tmpfs,
                                  cmd_src, shmem_opts, opts_src, ignore_stderr);
     g_free(cmd_src);
     *from = qtest_init(cmd_source);
@@ -664,9 +656,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
                                  "-name target,debug-threads=on "
                                  "-m %s "
                                  "-serial file:%s/dest_serial "
+                                 "-incoming %s "
                                  "%s %s %s %s",
                                  machine_type, machine_args,
-                                 tmpfs, memory_size,
+                                 memory_size, tmpfs, uri,
                                  cmd_dst, shmem_opts, opts_dst, ignore_stderr);
     g_free(cmd_dst);
     *to = qtest_init(cmd_target);
-- 
1.8.3.1



