Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAD46A0D6E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:00:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDyN-00009v-Cf; Thu, 23 Feb 2023 10:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyK-0008QC-D3
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:28 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyG-0004ig-Td
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:28 -0500
Received: by mail-wr1-x430.google.com with SMTP id bt28so4393665wrb.8
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yuFDrfczrLdYohvzSOy/QjHAPPmsuwWUGOxoTTLBq+M=;
 b=cE0jxZIEtUHqeqY8OlVvNgSbiO38Jz8If3KjyYohM2uhRcYoWg6DIZ5XxgUD9BJYSd
 qfgMrLmJoLGnDTQItvaqGcCa0wMSGtPS/hZZEmN0+wDDtRkZvEYfw/5vCtrgssqGY/vq
 9+t3TkRBN/BemRGhtkfWEtbQpXT6vNVP5qxKmaQ9uZhqo5wpg1DUy2lCiw0/0HCQvQaV
 1EsS40W+UlRUgeo65m9YL2nbsV7jKatVz2YTnFxUPeUh4hFIEazuGrFOjI7kdS9/T+VC
 /FWC9fPsjo1iC0EfRH9UWKwNpzS8hp8Qjpo0Ub1lt7JuFXfCIBS2flWhS1FmtUMU2lNJ
 5g0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yuFDrfczrLdYohvzSOy/QjHAPPmsuwWUGOxoTTLBq+M=;
 b=R8wfJ+fu9ucfLQp82ti0vC9Efc9tlvDvZeKrT/R4bkLNcUHW7am+06Njj31oBltto6
 9KFkL+f97Kuw1ouP7cqwDZcA3o8x8pVokbFRsILyFfn5d/pWXhKkZKJ/n+jzOZwpifUP
 bQyAGquFMO+9lxDECgIp1imjJFzxzlv3g2FMh9IlZUccQEb7Qbgr40QxfJ2hUjjiY/Uz
 FfxOiE26W99TRgtDHxF9UnWw0pb1n3+uTW7JU8XJ+AqsjlvC+VrhZcrc3VM5ZQDmKioG
 sgVhr0mTMQfpdjVkU2wZ6/7es8Q0VWj43vMNYs2PJrW5TRpZB7m3waC/YjQHxUkfwF7r
 anzA==
X-Gm-Message-State: AO0yUKW+oaUfpR57lPcWrET0Wv+yWdvof1tdQ90CXnPg00j0Y92uBhJI
 XgMatBk7Ba2sussqhVMmLKuv/g==
X-Google-Smtp-Source: AK7set/38j/cK+ia9dK2b4b3AuedsdJmcff/g4oTjfwhzOo+WBnnJDsHEg8yHpR7ghnffAiwn+HMDA==
X-Received: by 2002:adf:ed11:0:b0:2c5:5ff8:6b02 with SMTP id
 a17-20020adfed11000000b002c55ff86b02mr9096109wro.0.1677167843257; 
 Thu, 23 Feb 2023 07:57:23 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a5d654e000000b002c5801aa9b0sm10986103wrv.40.2023.02.23.07.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:57:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB2621FFBC;
 Thu, 23 Feb 2023 15:57:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: [PULL 04/13] tests: make fp-test less chatty when running from test
 suite
Date: Thu, 23 Feb 2023 15:57:11 +0000
Message-Id: <20230223155720.310593-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223155720.310593-1-alex.bennee@linaro.org>
References: <20230223155720.310593-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Message-Id: <20230221094558.2864616-6-alex.bennee@linaro.org>

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
2.39.1


