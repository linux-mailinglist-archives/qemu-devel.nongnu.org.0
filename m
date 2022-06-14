Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA86154A330
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 02:46:13 +0200 (CEST)
Received: from localhost ([::1]:32966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0uhA-0003LB-R9
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 20:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udN-0008MZ-IA
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:17 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udL-000524-RP
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:17 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x17so9077773wrg.6
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 17:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bZVHqgriaQwh2dR9fDU2lwwmFQGBOo2dO3rG0EeQBO4=;
 b=eqRYwDRrL+ctyRiz9/NvsfDzqVpXl+cVpj/2s/fGXw0uN0Q88YPqQ7wyXbmYX4YO1C
 HYRxGsURYFQI9AzKfKjXYvs0G49Y3cPdHNPSPpKWmUYmyo90QXMIqUIwYQnaPtYq9EW5
 jEubi/qGBYhtwTa5jYEJDfHncH7zYI+y+YsvTldqy5ma9A32YWfjohYlh0KAOv/KezI/
 s9jd2j4HUhAQIy+Te5uuIkanX6VYxkwLUNda/RhglTMnjZoznDdZjLNJRfNjGvYetkWn
 fHMjmfr9CpjN0woyLNPJCGsDCP8/fgeSPetm5QkfoUIR2v+dOA2/+OrPrCqgbJiQVrl9
 ipiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bZVHqgriaQwh2dR9fDU2lwwmFQGBOo2dO3rG0EeQBO4=;
 b=wshis3PXSy/27dQy3bJTTPb4sJ87jW9VmFmX3cF4J+k7+he8wMyraXWrTF0dBEbR3j
 OGSpGgGrNELRwK5DbWQvNEpQa4uHqh7cMxwyrLelDFOHg0rOmCUIT0f54ODUAEuewiHf
 tZpKy5jzF0ZMmxzTOfxxm4NYqyjE4Xr1JNQJEpiD4pCcWxPVCSZq7jS4pkxJW/z4ljVq
 nec+4nbr5KYKdo2COcuXjpSzKIlFx3GFLTTDIhsvCLJZVqyqlAJ1ZtJfvt1CR5132m2p
 UERQUEnCXqvbjwPoKSZ7P38gt8DDDsKkXy1o+2EA0JBlcYLm16gyIC2l/0Ml11taTixR
 q+UQ==
X-Gm-Message-State: AJIora93wEeU5wyn/qukntwpNXyY+CCydesZufTXmX3HizmE0bvMnN6O
 bdoHEH6dxlQJNPI03NsL149aig==
X-Google-Smtp-Source: AGRyM1ss5KV6J/MfA+gn85cpHcAtsIej3B0H6+CV25PAgaIrc+EMP8vLa90KNGhVrfGW9AVXE/pF4g==
X-Received: by 2002:a5d:4601:0:b0:20d:53a:2f39 with SMTP id
 t1-20020a5d4601000000b0020d053a2f39mr2081124wrq.347.1655167333046; 
 Mon, 13 Jun 2022 17:42:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c4e8600b0039c6ce32a2dsm17754732wmq.33.2022.06.13.17.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:42:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 41C301FFBA;
 Tue, 14 Jun 2022 01:42:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 2/7] tests/tcg/i386: Use explicit suffix on fist insns
Date: Tue, 14 Jun 2022 01:42:04 +0100
Message-Id: <20220614004209.1970284-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614004209.1970284-1-alex.bennee@linaro.org>
References: <20220614004209.1970284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Message-Id: <20220613171258.1905715-3-alex.bennee@linaro.org>

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


