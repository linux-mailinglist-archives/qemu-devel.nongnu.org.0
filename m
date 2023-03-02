Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AF96A87D0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 18:23:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXmdi-0005eH-P1; Thu, 02 Mar 2023 12:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXmdf-0005Zw-Fi
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:22:43 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXmdd-00021f-6E
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:22:43 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p16so95396wmq.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 09:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677777734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hgCkzz65aBOY+2JuhLPHaEOGjI4ymGEYSa63Lt1tzW8=;
 b=abmVCTdp5CFpGxOGlLwJGu/qC2A7KvujiNDfHXKirvKCVJ7rbCxvHc/1dPQR76NrMr
 4ZNFjMj3DDhAej3ReRKstBLAAyfsnyljebGFrKkfJC5s97nwnGH5Lq/K7n2zMXyBO+EC
 x6vIzJRM33aPG9A9UL3kOY96JE6uVRyS018U9NQBAR8cP9hIUC8JoLp3+nAlTlMn6YA0
 le1eUQI4l0uD0e3cEQW/GPaShuYR/zzW0cBr/VNm9sGD3NeNgHwiZnbSOKT5lLy7Z0w6
 ZbZp5UziXJljQL3FRXn1uoWOZUFLiTe6MN68cy88415G+aazc6baji85ACgXQUlsZixz
 6qKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677777734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hgCkzz65aBOY+2JuhLPHaEOGjI4ymGEYSa63Lt1tzW8=;
 b=bXsWPnb1g6e+ICBItgQVxol4ZTIY1GpFls8tnudbp4iz0l4jF+nyeWjS/Bawl2cWWG
 nY68CavQ3oc+HtPn04zXBadA2C24RNs4wnUmbnhnuOGqtJ2GngiOvN4i2kNI46F424n4
 mZ0sCL1H2YtVlMYmPacS/NVUHDKcxeCjuPYK//YEdEYo8MIwEuVYX6ZdKc4N+mlY8knb
 DruFBWLywhapC9LY+hSfXFDvDUDDwk/294cqs97uMee+WFZEdBDuDeoDDWFwPO3VVV4j
 D2BG/WRYTwpTiiDb+MoK4Qh9VLNSvq1faS6e34bwiaRnMbKuOte8jYz+0KrjKhnL+alL
 1UpA==
X-Gm-Message-State: AO0yUKXFDgrvdoiT39W62sr8sh/IOPcT00mbLxm4l00oiS5kd4pKgo8H
 /f0iyoabJWb/cY+cr4XsL5hABKmFr19L5lsm
X-Google-Smtp-Source: AK7set+yJDGKV30JR+JBAwDBzN1J7IpNpfPyskSggenHF9asMoyPxGEJbdjLewhz65oDRs51GP+hLw==
X-Received: by 2002:a05:600c:358f:b0:3e9:9fc5:2c6d with SMTP id
 p15-20020a05600c358f00b003e99fc52c6dmr8475604wmq.14.1677777734208; 
 Thu, 02 Mar 2023 09:22:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c425400b003dc47d458cdsm163019wmm.15.2023.03.02.09.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 09:22:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Date: Thu,  2 Mar 2023 17:22:11 +0000
Message-Id: <20230302172211.4146376-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

migration-test has been flaky for a long time, both in CI and
otherwise:

https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
(a FreeBSD job)
  32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR

on a local macos x86 box:
▶  34/621 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed")) ERROR
 34/621 qemu:qtest+qtest-i386 / qtest-i386/migration-test                         ERROR          168.12s   killed by signal 6 SIGABRT
――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
stderr:
qemu-system-i386: Failed to peek at channel
query-migrate shows failed migration: Unable to write to socket: Broken pipe
**
ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed"))

(test program exited with status code -6)
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

▶  37/621 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed")) ERROR
 37/621 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test                     ERROR          174.37s   killed by signal 6 SIGABRT
――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
stderr:
query-migrate shows failed migration: Unable to write to socket: Broken pipe
**
ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed"))

(test program exited with status code -6)

In the cases where I've looked at the underlying log, this seems to
be in the migration/multifd/tcp/plain/cancel subtest.  Disable that
specific subtest by default until somebody can track down the
underlying cause. Enthusiasts can opt back in by setting
QEMU_TEST_FLAKY_TESTS=1 in their environment.

We might need to disable more parts of this test if this isn't
sufficient to fix the flakiness.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is a slightly more targeted variation on my original
modest proposal.
---
 tests/qtest/migration-test.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 109bc8e7b13..d4ab3934ed2 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2572,8 +2572,14 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/auto_converge", test_migrate_auto_converge);
     qtest_add_func("/migration/multifd/tcp/plain/none",
                    test_multifd_tcp_none);
-    qtest_add_func("/migration/multifd/tcp/plain/cancel",
-                   test_multifd_tcp_cancel);
+    /*
+     * This test is flaky and sometimes fails in CI and otherwise:
+     * don't run unless user opts in via environment variable.
+     */
+    if (getenv("QEMU_TEST_FLAKY_TESTS")) {
+        qtest_add_func("/migration/multifd/tcp/plain/cancel",
+                       test_multifd_tcp_cancel);
+    }
     qtest_add_func("/migration/multifd/tcp/plain/zlib",
                    test_multifd_tcp_zlib);
 #ifdef CONFIG_ZSTD
-- 
2.34.1


