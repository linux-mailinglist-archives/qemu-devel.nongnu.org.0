Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86954674F5D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:25:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImh3-0004i7-Io; Fri, 20 Jan 2023 03:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgs-0004ga-Dx
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:03 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgq-0004aU-Ai
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:02 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d14so446574wrr.9
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1A5XESI7TZ+yAtbO2UTL/bHexDg6E6J3DUKnc81TIsg=;
 b=sij4FTf8IkBYLrd8CAQVgE2UQ7XoNGnRjyz4CuHxqJ5axll55NYvvPM++dJGCBMbW7
 gQLLsZ4bjPl3pTq7+7ASYx7fZ2tWD35dIhf4w1QqU0eaqdpWdun/3DrDEypBIDcb9BNE
 dzuVHpYP5D+toXTbos1pgLwNQLlz9hZMpRwcE5SDOFUwPPDqvPfyLN1Gg/Kahpxnvw2Q
 rWh/nzhKEo61zV/Y/lDcbo+MlsyVSsDOXkoCqDYDiIJq6TrN0IBwIo0MJw9QmLm9+eH4
 bAgSHRwY5yIg+BGbTBuZQpP81fhAeRFcwJBH5woEBNuZtH881ww9zI1xkcYfs/xMOZEV
 WGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1A5XESI7TZ+yAtbO2UTL/bHexDg6E6J3DUKnc81TIsg=;
 b=ntr4v7udm1uTcKrk/yqtYQ+GF7REhmD8krhAMImDMIgo8VzoE0tYyzgLsd/YAFx/fq
 yZMbQPRSB1SU8lDT2/MtMW0Z+SyV3J7atzdqjhoKRXok11S9mmxyBEPQGISVez7/+auH
 vds56kFJndCr70GOQEDC8QzYvMwncVCrXjqE4fsjqTGZ+EEZsdnGcKRADKPZRlt/c0Vu
 zviWC9QlcEx3vWzZWaL13PpCJ+GhNY6WvY0SKwFAakGnEGn8eO3hOBwiCKBzplPcbEzL
 nSdW+3u3hP+JkXhvcOtpGnAmtcBBuS2laA1h2krJ6VPO+wmLe23Rp6QexkC8HT5a6tv0
 fAIw==
X-Gm-Message-State: AFqh2kpU1rFSB8rvVaUrRgbdn3Y8soHH2uw1V8bn65n2FvkZeM0yA3gJ
 rwDJEy1S1ICw4xVJHrkTZuIOsgqlc8z7TIwb
X-Google-Smtp-Source: AMrXdXvm7fQhQCgW5HA6O5z7zQJve6GqD5VYOdHhabI3S2jJBJxpA2cTd88yuaZp/aZkQxEBYUt2YA==
X-Received: by 2002:a5d:4842:0:b0:2bd:eccd:7ea4 with SMTP id
 n2-20020a5d4842000000b002bdeccd7ea4mr12256356wrs.47.1674203038501; 
 Fri, 20 Jan 2023 00:23:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w5-20020adfcd05000000b002bdc914a139sm26774409wrm.108.2023.01.20.00.23.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:23:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 03/11] tests/qtest/boot-serial-test: Build command line
 using GString API
Date: Fri, 20 Jan 2023 09:23:33 +0100
Message-Id: <20230120082341.59913-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/boot-serial-test.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3a854b0174..92890b409d 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -226,14 +226,17 @@ static void test_machine(const void *data)
     const testdef_t *test = data;
     g_autofree char *serialtmp = NULL;
     g_autofree char *codetmp = NULL;
-    const char *codeparam = "";
     QTestState *qts;
     int ser_fd;
+    g_autoptr(GString) cmd = g_string_new("");
 
     ser_fd = g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL);
     g_assert(ser_fd != -1);
     close(ser_fd);
 
+    g_string_append_printf(cmd, "-M %s ", test->machine);
+    g_string_append(cmd, "-no-shutdown ");
+
     if (test->kernel || test->bios) {
         ssize_t wlen;
         int code_fd;
@@ -243,19 +246,23 @@ static void test_machine(const void *data)
         wlen = write(code_fd, test->kernel ? : test->bios, test->codesize);
         g_assert(wlen == test->codesize);
         close(code_fd);
+        g_string_append_printf(cmd, "%s %s ",
+                               test->kernel ? "-kernel " : "-bios ", codetmp);
     }
 
+    g_string_append_printf(cmd, "-chardev file,id=serial0,path=%s "
+                                "-serial chardev:serial0 ", serialtmp);
+
     /*
      * Make sure that this test uses tcg if available: It is used as a
      * fast-enough smoketest for that.
      */
-    qts = qtest_initf("%s %s %s -M %s -no-shutdown "
-                      "-chardev file,id=serial0,path=%s "
-                      "-serial chardev:serial0 -accel tcg -accel kvm %s",
-                      codeparam,
-                      test->kernel ? "-kernel " : test->bios ? "-bios " : "",
-                      codetmp ? : "", test->machine,
-                      serialtmp, test->extra);
+    g_string_append(cmd, "-accel tcg ");
+    g_string_append(cmd, "-accel kvm ");
+    g_string_append(cmd, test->extra);
+
+    qts = qtest_init(cmd->str);
+
     if (codetmp) {
         unlink(codetmp);
     }
-- 
2.38.1


