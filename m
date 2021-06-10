Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639D03A21A6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 02:54:54 +0200 (CEST)
Received: from localhost ([::1]:37066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr8yD-0002Mn-Ff
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 20:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lr8wE-0000Hf-Pz
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 20:52:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lr8wD-000621-48
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 20:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623286368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xz7gPKJi1P+S2bCEHZR3IyS2v9tqXbNNUKe6yuo2NRw=;
 b=HgzKAI9TGJhEoNNSOe12TazFLJ+RrpLjqOOQ84OiElGdijOOyEGGVxUZ+MeunB8z4B3Kg3
 LWHKzOF2MtRss+e3+ukB4ZZg9gMOpO0tXKGRpCxojXDBoShP5gf6ZmDaPrDa+zHzdXw6Qm
 ok9prRDyF6WuAFjsPXTDM5QRJ43thFs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-RG8p2FvpOASpSIFGc-OeSQ-1; Wed, 09 Jun 2021 20:52:47 -0400
X-MC-Unique: RG8p2FvpOASpSIFGc-OeSQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 2-20020a3709020000b02903aa9873df32so8643246qkj.15
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 17:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xz7gPKJi1P+S2bCEHZR3IyS2v9tqXbNNUKe6yuo2NRw=;
 b=bunJqJ1gU+WT4M2ivl4yP/fQ5uT1XVr3kKDxbU7Tawq/XYyVqRWttpG7bbnpZyvEtp
 S0fPHN5ps46Nb5iYQw3fSsFKSUgK3AgNZ+k7+SUCMshTbxsVSu1LiLCk9M1woFsPBfVD
 ybi56LiNdhdmdzXKlJ76XPsHuqoXVMaFF2B63ZZqOGXB1Mq07arTYRvmSAPQuT4xTqcR
 mFDj00ObG+AaXiM+JQ7Hfjx7XCYo99mV5IMmimRL1szM/bwS4o6504HxHCQ3IDVA1wQ4
 IU2H5IOV+Z5Zgwxq011pi/zj7tmtDC4YDxCNHVwPYdMj5RDRCjwpPnCHzyokxfYxnfUH
 thqw==
X-Gm-Message-State: AOAM533eV1WxZnvnjfvqCFpMeDJtqGCxXspI+hopMaiJiRtVyJuBdmmf
 OfoiQVmhWxDwIefa2z/YfrApbE2wQO/gPBqST+MP0pFMUQgJvFV7L52i2AVLueIgiBZQLGu9ti6
 F5n5wq6g29pOfsYRFRh8XKGT5yR3iasMg4RjdZegh7Dio+r5FXJ8s9jbkzDZ/G9jy
X-Received: by 2002:a37:dc82:: with SMTP id v124mr2427192qki.342.1623286366425; 
 Wed, 09 Jun 2021 17:52:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoDTrKI1er7am9ktn69pGTR6HS5IpjkptK1pKFIXel8pSauNPXrtsAqAbapH1RG9FZVJPKOw==
X-Received: by 2002:a37:dc82:: with SMTP id v124mr2427170qki.342.1623286366174; 
 Wed, 09 Jun 2021 17:52:46 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca. [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id x15sm1279045qkh.19.2021.06.09.17.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 17:52:45 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tests: migration-test: Add dirty ring test
Date: Wed,  9 Jun 2021 20:52:39 -0400
Message-Id: <20210610005239.265588-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610005239.265588-1-peterx@redhat.com>
References: <20210610005239.265588-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add dirty ring test if kernel supports it.  Add the dirty ring parameter on
source should be mostly enough, but let's change the dest too to make them
match always.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 51 +++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index d9225f58d4d..cc6e396d1a2 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -12,6 +12,7 @@
 
 #include "qemu/osdep.h"
 
+#include <linux/kvm.h>
 #include "libqos/libqtest.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
@@ -467,6 +468,8 @@ typedef struct {
     bool use_shmem;
     /* only launch the target process */
     bool only_target;
+    /* Use dirty ring if true; dirty logging otherwise */
+    bool use_dirty_ring;
     char *opts_source;
     char *opts_target;
 } MigrateStart;
@@ -573,11 +576,13 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         shmem_opts = g_strdup("");
     }
 
-    cmd_source = g_strdup_printf("-accel kvm -accel tcg%s%s "
+    cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
                                  "-name source,debug-threads=on "
                                  "-m %s "
                                  "-serial file:%s/src_serial "
                                  "%s %s %s %s",
+                                 args->use_dirty_ring ?
+                                 ",dirty-ring-size=4096" : "",
                                  machine_opts ? " -machine " : "",
                                  machine_opts ? machine_opts : "",
                                  memory_size, tmpfs,
@@ -587,12 +592,14 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         *from = qtest_init(cmd_source);
     }
 
-    cmd_target = g_strdup_printf("-accel kvm -accel tcg%s%s "
+    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
                                  "-name target,debug-threads=on "
                                  "-m %s "
                                  "-serial file:%s/dest_serial "
                                  "-incoming %s "
                                  "%s %s %s %s",
+                                 args->use_dirty_ring ?
+                                 ",dirty-ring-size=4096" : "",
                                  machine_opts ? " -machine " : "",
                                  machine_opts ? machine_opts : "",
                                  memory_size, tmpfs, uri,
@@ -785,12 +792,14 @@ static void test_baddest(void)
     test_migrate_end(from, to, false);
 }
 
-static void test_precopy_unix(void)
+static void test_precopy_unix_common(bool dirty_ring)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     MigrateStart *args = migrate_start_new();
     QTestState *from, *to;
 
+    args->use_dirty_ring = dirty_ring;
+
     if (test_migrate_start(&from, &to, uri, args)) {
         return;
     }
@@ -825,6 +834,18 @@ static void test_precopy_unix(void)
     test_migrate_end(from, to, true);
 }
 
+static void test_precopy_unix(void)
+{
+    /* Using default dirty logging */
+    test_precopy_unix_common(false);
+}
+
+static void test_precopy_unix_dirty_ring(void)
+{
+    /* Using dirty ring tracking */
+    test_precopy_unix_common(true);
+}
+
 #if 0
 /* Currently upset on aarch64 TCG */
 static void test_ignore_shared(void)
@@ -1369,6 +1390,25 @@ static void test_multifd_tcp_cancel(void)
     test_migrate_end(from, to2, true);
 }
 
+static bool kvm_dirty_ring_supported(void)
+{
+    int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
+
+    if (kvm_fd < 0) {
+        return false;
+    }
+
+    ret = ioctl(kvm_fd, KVM_CHECK_EXTENSION, KVM_CAP_DIRTY_LOG_RING);
+    close(kvm_fd);
+
+    /* We test with 4096 slots */
+    if (ret < 4096) {
+        return false;
+    }
+
+    return true;
+}
+
 int main(int argc, char **argv)
 {
     char template[] = "/tmp/migration-test-XXXXXX";
@@ -1438,6 +1478,11 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/multifd/tcp/zstd", test_multifd_tcp_zstd);
 #endif
 
+    if (kvm_dirty_ring_supported()) {
+        qtest_add_func("/migration/dirty_ring",
+                       test_precopy_unix_dirty_ring);
+    }
+
     ret = g_test_run();
 
     g_assert_cmpint(ret, ==, 0);
-- 
2.31.1


