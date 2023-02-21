Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE49869E146
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 14:28:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUSgB-0000wb-I7; Tue, 21 Feb 2023 08:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUSg9-0000wB-FC
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:27:33 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUSg7-00076r-CT
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:27:33 -0500
Received: by mail-wr1-x434.google.com with SMTP id j2so4249873wrh.9
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 05:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DXWyAZOjBENgHFaImp6FCzJ0ZsPQFfHuupNRHASXHFU=;
 b=ewzo4FO6CKt3Hb7i4uG4463+HLpYxWe3cn0WgbmHtVMTENbbmU48LiJNqVchgMWRgI
 q+YFmjuyMyyuw5Rcn6/PhBjFjBUO4kNfMIN7u5sc0mJIcLR+0Lu6TWttOE9qpl8jDjyq
 lp6JKpLGwa42l9/2x/G5VP0TRJOy59ksM4QwAWmdArbnpCtK+4EBUV/nF3vq0Ewdd1y2
 k0SpzkiIE/XPdUkuTZmUcDwtyOZ19tyuU3cXY+jcsL4OR5KH87zPm3uU/Jnnb15Dp9P9
 C5DRog6aPZjSpnS8apM3m+o/9xlxjtphftOROPl4XGDRYppSMiQohrlEMDinie+aJ4H3
 IDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DXWyAZOjBENgHFaImp6FCzJ0ZsPQFfHuupNRHASXHFU=;
 b=lZ1gjiLbhg6r7mOK7AoVulIhsAnXR5W8egvfesc+f77+jZtpymyWZrtDBOIhSQfJbt
 121Ifdtdny5bnWW9O8ntKh7AQex8l7+cPrui06lBvabdgIVxYyTGwiJE0mtx3qhnN/IT
 hAeFvxqan+3TlJETr3l/eeWVxc4jL6ox48EBe2LHA1P/FpiSbXJF1/dNGBV5QFwYqd5o
 ceDMEqVXTrBQOQ/7aljo0q/T4ZKc19uJh3ewD0098t+uEG7rm9glVCEJ7mWFIILQzBOa
 mwBSigNtfF6zjZhWDscD6oXusZ/BFu/nQE/cd32UUZyY/aZqrVPQdmk4CfizbLZ2TbOE
 YsHw==
X-Gm-Message-State: AO0yUKUqvCwV/3GkBibBgnu5Y2YNvddDTpwhju8J8+CheBc/iaykz3x7
 eMj39lzVPxd4YUGbaZcIR6ldyX0jVaYSY8RL
X-Google-Smtp-Source: AK7set9SdLQyN3XN8tiyhKGreLlRt+UwZI7myR8sa+Xe1TF1b3c5nvoW5RNkdhNuKa9NwWJS+SSmrw==
X-Received: by 2002:adf:f94d:0:b0:2c5:4c7c:6aad with SMTP id
 q13-20020adff94d000000b002c54c7c6aadmr3976186wrr.8.1676986048432; 
 Tue, 21 Feb 2023 05:27:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a5d51cb000000b002c5804b6afasm1460824wrv.67.2023.02.21.05.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 05:27:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH] tests: Disable migration-test
Date: Tue, 21 Feb 2023 13:27:26 +0000
Message-Id: <20230221132726.2892383-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

The migration-test is annoyingly flaky. Examples:

https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
(a FreeBSD job)
  32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR

on a local macos x86 box:
▶  34/621 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_
str_equal(status, "failed")) ERROR
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
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

I've seen this on other CI jobs as well, but Gitlab's UI makes it
pretty much impossible to re-find failed jobs, since you can't
search for them by failure reason at all.

I've also seen this fail on the OpenBSD vm build.

I've seen the migration-test hang on the s390 private CI runner
in such a way that even though the CI job has timed out, the
stale QEMU and migration-test processes are still lying around on
the host.

I've complained about these before, but nobody has either investigated
or suggested improvements to the test program that would let us gather
more information about what's happening when these fail.
 https://lore.kernel.org/qemu-devel/CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com/

So this is the big hammer: disable the test entirely, so that we
don't keep getting CI job intermittent failures because of it.
When somebody has time to investigate, we can fix the underlying
cause and reenable the job.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is an "if you don't want this, propose something else" patch :-)
---
 tests/qtest/meson.build | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 29a4efb4c24..0e362fcb1e0 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -11,6 +11,12 @@ slow_qtests = {
   'test-hmp' : 120,
 }
 
+# Temporarily disabled tests can be listed here
+qtests_disabled = [
+  # This test is currently flaky and fails intermittently
+  'migration-test',
+]
+
 qtests_generic = [
   'cdrom-test',
   'device-introspect-test',
@@ -343,6 +349,9 @@ foreach dir : target_dirs
   endif
 
   foreach test : target_qtests
+    if test in qtests_disabled
+      continue
+    endif
     # Executables are shared across targets, declare them only the first time we
     # encounter them
     if not qtest_executables.has_key(test)
-- 
2.34.1


