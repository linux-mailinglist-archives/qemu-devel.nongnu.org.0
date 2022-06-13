Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0999554999F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 19:16:53 +0200 (CEST)
Received: from localhost ([::1]:42606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0ngJ-0003qp-R9
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 13:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0ncg-0001Fr-6A
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:06 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:46948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0ncd-0006vv-NB
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:05 -0400
Received: by mail-ej1-x632.google.com with SMTP id v1so12344884ejg.13
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 10:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YWeJX520ndLsECRd6DQvhI+4IrssS8/6uaptuhISi24=;
 b=WofdNKnJWMZRbYdLw6QAf2EuI2nc57MCU+VQGakMKz+6j7rXHz6TvYrATWqGHigwzj
 U2xgXuOf9P4EpGFw3mdGU+5DlrJomSIeb/pA/fOdP/Gj5t79fBKooJZSQV1ZehG3m7P1
 npyBlhQlow5ZaUfs2dVt1nDsBhZyvdM0GdIWErdDhKCpMcK8+E2DeH1xcHLk/WDWLu/+
 E8AJQND3QNN+eqpLn8NPDmRxtbokoQlp7Y/dhpQSUCv4lR0TcUb906v+V2FdHaCs27oL
 lZIszy5m5wse2fywM973an9H5WydAxlZCt9pfTK2J5P5WriiLbVmdHoiqN5C4fvAsVGw
 FY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YWeJX520ndLsECRd6DQvhI+4IrssS8/6uaptuhISi24=;
 b=boJYPMdcBUZsUgqSmG86B7d+Y+DXC4wVXQIQGRM2BDMhwDgDZzM/RUmSrWDEE0SKFh
 3IsBlkBcJ3Q8JbkwNLIqz/f4Oth8BrCzNIi8d1RznoAQHs07oO9tc8S9cXogRWZy5wFc
 nOP6E0P1crrtREAUgEQe64TBU6XR6qnB/fIX1yarRNpyO4AFnv9zP215se1O9KOXLnkU
 ByGXbYndYCGLZ2/vLIvM11avoSKs8TX9fped61ZXACeUNz2W8fjMvajpJZm2sQYAQT7K
 EYPK0D8RKfm3Cac+NXMWgdS5kUZBONBvTNUc0XzE5eelP9imYyWYzEjs7v9PuTK+D8Kv
 6fLw==
X-Gm-Message-State: AOAM530DYcAJ1PWvzdSYdxPOCWUUaSizIBq5+Au45EvfxQ2TL5UuuMJ5
 D+yvfTY98SlAKO0MZvgBotncjQ==
X-Google-Smtp-Source: ABdhPJzaUCKjGuC31Uxz5ttaiXoYJJK0HQuvQBKmZdEYQMVhgriWtH+/C4SAECBvh5DpQ2wvaLyPPg==
X-Received: by 2002:a17:906:73d2:b0:712:2fed:3473 with SMTP id
 n18-20020a17090673d200b007122fed3473mr681881ejl.361.1655140382391; 
 Mon, 13 Jun 2022 10:13:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a1709063bc100b006febeb51cd5sm4068668ejf.174.2022.06.13.10.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:12:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 378991FFBA;
 Mon, 13 Jun 2022 18:12:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH  v1 2/7] tests/tcg/i386: Use explicit suffix on fist insns
Date: Mon, 13 Jun 2022 18:12:53 +0100
Message-Id: <20220613171258.1905715-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220613171258.1905715-1-alex.bennee@linaro.org>
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Fixes a number of assembler warnings of the form:

test-i386.c: Assembler messages:
test-i386.c:869: Warning: no instruction mnemonic suffix given
  and no register operands; using default for `fist'

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220527171143.168276-1-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/i386/test-i386-fp-exceptions.c | 24 ++++++++++++------------
 tests/tcg/i386/test-i386.c               |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/tcg/i386/test-i386-fp-exceptions.c b/tests/tcg/i386/test-i386-fp-exceptions.c
index dfb7117c17..d445f13c33 100644
--- a/tests/tcg/i386/test-i386-fp-exceptions.c
+++ b/tests/tcg/i386/test-i386-fp-exceptions.c
@@ -423,35 +423,35 @@ int main(void)
     }
 
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fistp %0" : "=m" (res_16) : "t" (1.5L) : "st");
+    __asm__ volatile ("fistps %0" : "=m" (res_16) : "t" (1.5L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != PE) {
         printf("FAIL: fistp inexact\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fistp %0" : "=m" (res_16) : "t" (32767.5L) : "st");
+    __asm__ volatile ("fistps %0" : "=m" (res_16) : "t" (32767.5L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fistp 32767.5\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fistp %0" : "=m" (res_16) : "t" (-32768.51L) : "st");
+    __asm__ volatile ("fistps %0" : "=m" (res_16) : "t" (-32768.51L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fistp -32768.51\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fistp %0" : "=m" (res_16) : "t" (ld_nan) : "st");
+    __asm__ volatile ("fistps %0" : "=m" (res_16) : "t" (ld_nan) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fistp nan\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fistp %0" : "=m" (res_16) : "t" (ld_invalid_1.ld) :
+    __asm__ volatile ("fistps %0" : "=m" (res_16) : "t" (ld_invalid_1.ld) :
                       "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
@@ -538,49 +538,49 @@ int main(void)
     }
 
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (1.5L) : "st");
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (1.5L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != PE) {
         printf("FAIL: fisttp inexact\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (32768.0L) : "st");
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (32768.0L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fisttp 32768\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (32768.5L) : "st");
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (32768.5L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fisttp 32768.5\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (-32769.0L) : "st");
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (-32769.0L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fisttp -32769\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (-32769.5L) : "st");
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (-32769.5L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fisttp -32769.5\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (ld_nan) : "st");
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (ld_nan) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fisttp nan\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (ld_invalid_1.ld) :
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (ld_invalid_1.ld) :
                       "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
index 18d5609665..ac8d5a3c1f 100644
--- a/tests/tcg/i386/test-i386.c
+++ b/tests/tcg/i386/test-i386.c
@@ -866,7 +866,7 @@ void test_fcvt(double a)
         uint16_t val16;
         val16 = (fpuc & ~0x0c00) | (i << 10);
         asm volatile ("fldcw %0" : : "m" (val16));
-        asm volatile ("fist %0" : "=m" (wa) : "t" (a));
+        asm volatile ("fists %0" : "=m" (wa) : "t" (a));
         asm volatile ("fistl %0" : "=m" (ia) : "t" (a));
         asm volatile ("fistpll %0" : "=m" (lla) : "t" (a) : "st");
         asm volatile ("frndint ; fstl %0" : "=m" (ra) : "t" (a));
-- 
2.30.2


