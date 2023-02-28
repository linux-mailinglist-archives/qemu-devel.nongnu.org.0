Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023BE6A5F44
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:08:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5Jz-0002ON-Tq; Tue, 28 Feb 2023 14:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jb-0002G7-SE
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:15 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JR-0002nD-8P
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:02 -0500
Received: by mail-wr1-x436.google.com with SMTP id g3so1995567wri.6
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzNbeKwIel9LjJg1sGOYSKULJS+0zOsIf4KMX2V7u0g=;
 b=ph5Nho2sEe83aXr1/LNDSkwlWK4g1QTqP/Aa7o09f41oBWoOr0B4CxuPk414LLcJqG
 Ggq6pSJz23UBoJb9YWZoHdDT3s3OFmCnUfD9BtR5BOvtFP63ma70bp6SEV7aLX6gsOzx
 bmpDgWdlvAhxPCMOiFE7DZ5iB93ok2x8hO/d5vAeGMKIPKkhUFd7UP34dw2X8OpLXrHZ
 U7Lsh14Rd4/QPia4ryOL1YtL2sWCoiuvLZupI7mGDckdOmPlPISwAhhchN0yODD+91pi
 vlyoGkPiHDDK+der+P0xe6+OW4PJ+sEcCD2ZNEjs/cd4wpWEqpx2+z5qfLVkO8Ojbl5g
 e5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzNbeKwIel9LjJg1sGOYSKULJS+0zOsIf4KMX2V7u0g=;
 b=2GLYz9U2Q6Y3LRfKD3YP13OrPlUSc5jT5xmFc+pH2Gwi7JDT005cGGyVBFLdL07vnY
 zoESkp96ZjQVvZbVC1yyBdNUyJixpIZWrwsLSvpTr6cnt47UVa8MMbaHlauIvWPHCmzs
 BXx7DaV2jqrcWEwvw0WunlX718tYpAUUbAuO6fFxErzQsfJ+9juLGumkJq7jhgL2n+by
 4+BmW/HOE//38zAFuxst3TX/bjHiBHxAXtz0HpzhWwxygJFvnqywEIQTEVC4165Rn25y
 TORoI6nIO7IZk4YDqzQZPYUkDOQUWNb8tCVdN3z15+/FlL0czsTHVdQOzwH/n95Aa1c9
 BXbA==
X-Gm-Message-State: AO0yUKXCuXdrDevW0FtJuFJA2KWsbGJqwVQnS1/12rBXBBGTSs5FYzkK
 a+acKAVCiVZbIKKtEJXzzWYQQg==
X-Google-Smtp-Source: AK7set+xkxA4Hz2udElM9xcSvWoWYWaCXHK6AI1Y66wMGDxyn6ZXsX6C9Zw9ip2yvv/mISpXwXbHRQ==
X-Received: by 2002:adf:ce10:0:b0:2c7:e05:2d1b with SMTP id
 p16-20020adfce10000000b002c70e052d1bmr3155429wrn.50.1677611215768; 
 Tue, 28 Feb 2023 11:06:55 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a5d6a0f000000b002c707785da4sm10345454wru.107.2023.02.28.11.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:06:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB21A1FFBC;
 Tue, 28 Feb 2023 19:06:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 04/24] tests: make fp-test less chatty when running from
 test suite
Date: Tue, 28 Feb 2023 19:06:33 +0000
Message-Id: <20230228190653.1602033-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

As we like to run tests under CI with V=1 flags the softfloat tests
can add up to a fair amount of extra log lines. With an update to the
testfloat library we can now call fp-test with the -q flag and reduce
the output to a terse one line per function tested.

  make check-softfloat V=1 | wc -l
  759

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230221094558.2864616-6-alex.bennee@linaro.org>
---
 tests/fp/fp-test.c            | 19 ++++++++++++++-----
 tests/fp/berkeley-testfloat-3 |  2 +-
 tests/fp/meson.build          |  2 +-
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 35829ad5f7..36b5712cda 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -106,7 +106,8 @@ static const char commands_string[] =
     " -l = thoroughness level (1 (default), 2)\n"
     " -r = rounding mode (even (default), zero, down, up, tieaway, odd)\n"
     "      Set to 'all' to test all rounding modes, if applicable\n"
-    " -s = stop when a test fails";
+    " -s = stop when a test fails\n"
+    " -q = minimise noise when testing, just show each function being tested";
 
 static void usage_complete(int argc, char *argv[])
 {
@@ -190,9 +191,11 @@ static void do_testfloat(int op, int rmode, bool exact)
     ab_f128M_z_bool true_ab_f128M_z_bool;
     ab_f128M_z_bool subj_ab_f128M_z_bool;
 
-    fputs(">> Testing ", stderr);
-    verCases_writeFunctionName(stderr);
-    fputs("\n", stderr);
+    if (verCases_verbosity) {
+        fputs(">> Testing ", stderr);
+        verCases_writeFunctionName(stderr);
+        fputs("\n", stderr);
+    }
 
     if (!is_allowed(op, rmode)) {
         not_implemented();
@@ -837,7 +840,7 @@ static void parse_args(int argc, char *argv[])
     int c;
 
     for (;;) {
-        c = getopt(argc, argv, "he:f:l:r:s");
+        c = getopt(argc, argv, "he:f:l:r:sq");
         if (c < 0) {
             break;
         }
@@ -874,9 +877,15 @@ static void parse_args(int argc, char *argv[])
                 }
             }
             break;
+        /*
+         * The following flags are declared in testfloat/source/verCases_common.c
+         */
         case 's':
             verCases_errorStop = true;
             break;
+        case 'q':
+            verCases_verbosity = 0;
+            break;
         case '?':
             /* invalid option or missing argument; getopt prints error info */
             exit(EXIT_FAILURE);
diff --git a/tests/fp/berkeley-testfloat-3 b/tests/fp/berkeley-testfloat-3
index 5a59dcec19..40619cbb3b 160000
--- a/tests/fp/berkeley-testfloat-3
+++ b/tests/fp/berkeley-testfloat-3
@@ -1 +1 @@
-Subproject commit 5a59dcec19327396a011a17fd924aed4fec416b3
+Subproject commit 40619cbb3bf32872df8c53cc457039229428a263
diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 312a4d301f..f9ca6a93b4 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -609,7 +609,7 @@ softfloat_tests = {
 # The full test suite can take a bit of time, default to a quick run
 # "-l 2 -r all" can take more than a day for some operations and is best
 # run manually
-fptest_args = ['-s', '-l', '1']
+fptest_args = ['-q', '-s', '-l', '1']
 fptest_rounding_args = ['-r', 'all']
 
 # Conversion Routines:
-- 
2.39.2


