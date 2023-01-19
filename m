Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061BF673CF6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:01:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWNX-0006CE-Oa; Thu, 19 Jan 2023 09:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNW-0006BK-Kx
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:58:58 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNV-0003Y7-1x
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:58:58 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso3152905wmb.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=es3Dw8MLiqLXATzoVsMpPJx/0iri3aBMV7qIVLaAL/4=;
 b=s0S64k3YCGevc0R0oTZIH8fIMdDLMa6BHjCYopC0QoEYw3dMbRGT2SJkPn2oxAS29S
 5pgEK/hzdaM3N0gsH93FntPpHWRMX82EeqE0lCxAI2SPdHDeNVc58iPG0ZJGtvYelZop
 1BEuzraGBDQXNsM7Sw8QBMHAt/Edu+h1OKQ+0opkndkrNh9FEhRhJxq0zG9GZ0i9bJN0
 aXrxlghJiCzsjgRBeHAsDkyaGL7kHdiOmxUeVcENUvBEi78eTe4mo2Auw2gRm/0YBuqN
 M3G8d4NO7r6PG8vZU8QU8TGcGc52y0AlU/Ttjm4Xf92iyeI/wYYMlHcDYNTtlf1aEBRs
 jFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=es3Dw8MLiqLXATzoVsMpPJx/0iri3aBMV7qIVLaAL/4=;
 b=5rtbWy6sVNNRNMjhFiOePv/Tns3D1xjDaVVxA8wTIycC4h3H5Ve+uncRB2D2AY0Dp6
 qM0bnX3PGXqg2qOs5uTswMqSqam/fscxDYqlc6FQHZMRvZ6wAxSVV73/qqVxZ5Wb3mft
 wlDyTeKZY0DBCvwAlJEU2rWkG4PVRAhOGEt81b9HxpKFA6wx3PRipehPN0LA7izCHTIH
 /7PnVkY9r1GuAqI9g/hbUY1RNzGEXhcpjzjpGOkWZarb6x9LUJQUryhB1n2ZAmD6+WFc
 MbQyVeWmhZkGZ1dWVf8VOuyePGLEK2oot6jpBTBTQ1cqEbAJUHCK0DTo+vpHMVpMmfmM
 sj6w==
X-Gm-Message-State: AFqh2krmgHqb9T44hi5k+TmrpoXooX63DTqOXoddY5mU/5tju1QANIqW
 8ibRWQYp3qq+bkdmS0BfJBKaA/u5V+kufL3I
X-Google-Smtp-Source: AMrXdXt/xVdtHaHj611XoLi6fwLUx5kTFQwwrwE2Mdj6MfzU9yOl+cf8V0AqkYuMe2uhzDpt0/IL3Q==
X-Received: by 2002:a05:600c:198e:b0:3db:1d7e:c429 with SMTP id
 t14-20020a05600c198e00b003db1d7ec429mr3422988wmq.40.1674140335259; 
 Thu, 19 Jan 2023 06:58:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c35c100b003db06493ee7sm5425204wmq.47.2023.01.19.06.58.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:58:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 03/11] tests/qtest/boot-serial-test: Build command line
 using GString API
Date: Thu, 19 Jan 2023 15:58:30 +0100
Message-Id: <20230119145838.41835-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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


