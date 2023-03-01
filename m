Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8F26A6F21
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:17:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOBl-0008Aw-Ql; Wed, 01 Mar 2023 10:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBh-00087o-Ms
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:14 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBc-0007bU-6j
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:13 -0500
Received: by mail-wr1-x436.google.com with SMTP id l25so13607708wrb.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jrpKaOFJWkJoO+xUUwZmjGHPgIS1O//HocxWyw4nUaQ=;
 b=AckvEHT7KPdDOo5jdS6dNBCHdYx96tTeaxufK8+uQUFZ0m/6iucvjmp1yjl6+76lfG
 K7+YApECe+52E1UuHPE2Cf/1rHl0iUt+aCw9hotAH2O1LgtCEKe4HKhnNXfhmr2Y9MjF
 zS+FuHj2H/tVNqzx38WAokcHkJL5BK0c8/Ryu8d8+kgXvKOXB7dzLyPRNRiIydfkHWT5
 R+fa8sa3sLMskNo1UyQTIPvPCQWmwrcfygIjHz2/r0eSFM48jg2I+ui5Flj2c5X09LXk
 4SWHdS44eZjkSzPHBKCXzBEF1j2//9gfH7OXODlrhpGTzQrw07g6cGGp927zo0dpA1c8
 DW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jrpKaOFJWkJoO+xUUwZmjGHPgIS1O//HocxWyw4nUaQ=;
 b=RdN/xO6M9v0pZFO3ydrpN2HlSIrQq9BoMKSN1jZ+q99VnEe36+wD3HdRV4+3TgqhPL
 thsPzjdgkN+JiP4tjo+FMPGlhb37fSsDlrNk69KV/4C5+32WuOAK5Y088PctHv1ckUHe
 UKDCeiTE4NFniXCJLeueCHdeG1epQB5Gk1mBgyHg4Cj0Ce/DXSxxDvT1A1vtzxJPmLub
 IDoC2jdx0XRyUIkEmSFjX1EpI5DCJqbWgLq6obJY2s/ktqOuxOjOiT19j6J0ll0aSRHl
 Ql5hVdBP6M+m2bf+azY7+R8tJZoGvPp68E+nYMTUbfGhh1r6z9f2bAC9akauPN1eAsQL
 APnw==
X-Gm-Message-State: AO0yUKXZyUZycPuYyPDDkpvEtRUnzfDQEGDbG57lBlyX98Q8v/8mVqH8
 nJNQF46+zPe4aPOiFwHVlArTHQ==
X-Google-Smtp-Source: AK7set/0+FwEG2+5OnzuEDiQDAUYsSqnmmXCRsdvAE1rhjFSny5fJkiCNjtgko+Sw94CKq4nrWGmAA==
X-Received: by 2002:a5d:648b:0:b0:2c5:532a:98c4 with SMTP id
 o11-20020a5d648b000000b002c5532a98c4mr12256772wri.33.1677683766810; 
 Wed, 01 Mar 2023 07:16:06 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a056000005200b002c54c7153f0sm13128116wrx.1.2023.03.01.07.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:16:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1DF411FFBC;
 Wed,  1 Mar 2023 15:16:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PULL v2 04/24] tests: make fp-test less chatty when running from
 test suite
Date: Wed,  1 Mar 2023 15:15:44 +0000
Message-Id: <20230301151604.1948813-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
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

As we like to run tests under CI with V=1 flags the softfloat tests
can add up to a fair amount of extra log lines. With an update to the
testfloat library we can now call fp-test with the -q flag and reduce
the output to a terse one line per function tested.

  make check-softfloat V=1 | wc -l
  759

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230228190653.1602033-5-alex.bennee@linaro.org>

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


