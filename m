Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A03674F63
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:25:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImgp-0004fl-LE; Fri, 20 Jan 2023 03:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgl-0004ch-W0
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:23:57 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgk-0004Yl-F1
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:23:55 -0500
Received: by mail-wm1-x32d.google.com with SMTP id k16so3391185wms.2
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=96awe59Bl1JmrEDLbt0RIPfUyUqBQm6nbi4HGeicux4=;
 b=SiTX1VhsgcvxE1cKCro2n5Mi9jtOQaep9/ODJ5g0I8+IccdsjcoIpUGTPMAivMl57Q
 OaRxlXCu+tR9/p3M1Y5Tud8mXI0nVmo2kgJ7S9qBnKY0dh0PqQkuHEZr0TcmC86xsd3O
 4vPMCgQSXG+msdPBFmNTR4OJiiTutJ8O5KeQhuE9R6jza0UaWXZJgdSGX/BxJRsEq2v3
 zHeGDMqOrRGAFzDaVmAjOAMRiLxz/ubqnvgCGANAgh+oH9hQNlzHMkYNTOX/M8PcxeGj
 tESNWrq6K+XPjPacohfOGBXxO86UDMcXnYxAgVjbfs/+2nztFZLYBjfjjNkAO29ceibc
 KMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=96awe59Bl1JmrEDLbt0RIPfUyUqBQm6nbi4HGeicux4=;
 b=OqMpDgTkXkh5Mxn2bBvbbWL+gJUosAZvUsB6K363yhHmk4jy3yvYj33bLVG3wJo/7V
 GHT900zwVyvAZEQnVpsuJc0v+5BddtrcXYuGOQv67MGehbDPdz10o5d4gDMUxTi3fzm3
 QJITXtQkL97TvGKld4YtbIePw3a9vqvYs+vDS7y1VHySuNd4MvwSgiJB8tF74ODBg2cE
 oygTaIAb7q/NDyRhOkVh6BuTGKCc3xhb+raY8nxFyBstAlJ/b0U7qq8rvaI3XGBXHC/D
 VPiIF8Hn44e0XZ4Nu2ra0MBE8g2HIIAmH0XYhkCnpI0t7RpY/zLXrwrCVh8mW/zkhCZ+
 pY9A==
X-Gm-Message-State: AFqh2ko1d81ZQVvnSsDHbikrpIlBXlcOqDkshh9WlTPHaDw1xTGtHPrK
 MIDiQ3re+yZjXCbqpGicSfbRvCSpv8LrxbIA
X-Google-Smtp-Source: AMrXdXvZKVn3PP4bk4JFVqH76dfRfGKrYtbK1mNI5XHgKTuM4WPasLKaop3eYYXhvIPFIm1Ecu3gTg==
X-Received: by 2002:a05:600c:3d9b:b0:3db:1afd:ac36 with SMTP id
 bi27-20020a05600c3d9b00b003db1afdac36mr6977627wmb.32.1674203033493; 
 Fri, 20 Jan 2023 00:23:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b003db0647645fsm1571932wmq.48.2023.01.20.00.23.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:23:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 02/11] tests/qtest/boot-serial-test: Simplify
 test_machine() a bit
Date: Fri, 20 Jan 2023 09:23:32 +0100
Message-Id: <20230120082341.59913-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Slighly modify test_machine() to simplify next commit review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/boot-serial-test.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3aef3a97a9..3a854b0174 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -227,7 +227,6 @@ static void test_machine(const void *data)
     g_autofree char *serialtmp = NULL;
     g_autofree char *codetmp = NULL;
     const char *codeparam = "";
-    const uint8_t *code = NULL;
     QTestState *qts;
     int ser_fd;
 
@@ -235,21 +234,13 @@ static void test_machine(const void *data)
     g_assert(ser_fd != -1);
     close(ser_fd);
 
-    if (test->kernel) {
-        code = test->kernel;
-        codeparam = "-kernel";
-    } else if (test->bios) {
-        code = test->bios;
-        codeparam = "-bios";
-    }
-
-    if (code) {
+    if (test->kernel || test->bios) {
         ssize_t wlen;
         int code_fd;
 
         code_fd = g_file_open_tmp("qtest-boot-serial-cXXXXXX", &codetmp, NULL);
         g_assert(code_fd != -1);
-        wlen = write(code_fd, code, test->codesize);
+        wlen = write(code_fd, test->kernel ? : test->bios, test->codesize);
         g_assert(wlen == test->codesize);
         close(code_fd);
     }
@@ -258,12 +249,14 @@ static void test_machine(const void *data)
      * Make sure that this test uses tcg if available: It is used as a
      * fast-enough smoketest for that.
      */
-    qts = qtest_initf("%s %s -M %s -no-shutdown "
+    qts = qtest_initf("%s %s %s -M %s -no-shutdown "
                       "-chardev file,id=serial0,path=%s "
                       "-serial chardev:serial0 -accel tcg -accel kvm %s",
-                      codeparam, code ? codetmp : "", test->machine,
+                      codeparam,
+                      test->kernel ? "-kernel " : test->bios ? "-bios " : "",
+                      codetmp ? : "", test->machine,
                       serialtmp, test->extra);
-    if (code) {
+    if (codetmp) {
         unlink(codetmp);
     }
 
-- 
2.38.1


