Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33213673541
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:15:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRot-0004S8-1U; Thu, 19 Jan 2023 05:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRns-0003oP-Ja
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:05:56 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRnq-0005EU-W0
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:05:52 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e3so1287199wru.13
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v+iwPL/+lazU1m0c8bSWGnJ+URBRewNqB8GAi6Kwffk=;
 b=Nq7u/Qo4W40eyvdv//o6DL9EP9Euu+vodYC6DL6cT5Of/a4f6bpjXsPBwWREzX92Tt
 XPjKnju8UmiSQ+QKO/zUBX7EDN0LVBUiUVLgtnSyTzoAxgI26R10E+GjZldNtipruZQt
 o3a0Ynb9+b8jytB1lu0IVWHKhXK/qPCq15hyhMYV/rHaKe0swajYOFOEg0+98IJUN+6o
 Lq96cjnEvQ+F+r9pep5ALEq/jyFAjh5fd3F+IU4OgFQc7Th9ShZMwxWgnjw5dQrTlSEY
 1+JwErMT2aff63ibi/cs87uMdxzUBrSf1O+WW8tWeVPiNei2INqwNWmQxhbaEi9XNImv
 6RKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v+iwPL/+lazU1m0c8bSWGnJ+URBRewNqB8GAi6Kwffk=;
 b=fPlWkvX3l4woU/hmegRyPLMHnsiTnQF4Lc4E6fpjYteHb3eYka5SBPutgcY+W5AeZR
 qyvJqridXVaO8bfmz8ERbDEhc5gv3H1Kv/Qrlo7zBa7JnAvTh7+j2+bUTVFvU1PhDwYE
 UrnAztveScEBfoO5VMWHFYEeFMcTtHVYMXki2UJG91kQ4OX77uR39Ysgv+xmO+CHsrdF
 CWCHP7Y7wz0cAythLQNQiqSBkaSNLvsg8qkids6qW382Gc5Kfe//sNVekB/vV7KnzxFN
 zbJIuNgRuzGjqAhw13Ck0xYHQwvS4cGQWtjQbFGNZZWZ10uUmqCRyFAU05ZLEav+HstS
 agoA==
X-Gm-Message-State: AFqh2kr8KRqiY4OIpKfhohp1s+/GxuIvt7ddbxRV/9kfjUj5tCOBdb9c
 JhpStcT8xJea1X+OtN3VTCKn0awOP/C1DNHF
X-Google-Smtp-Source: AMrXdXu4qlQvGOa/xTST3eXM8w38hSBxSwTQrCZg+erpZpUIIodoONeukjASMmu2u7osMe0Nkdp67Q==
X-Received: by 2002:adf:f4c6:0:b0:2be:34f5:df7 with SMTP id
 h6-20020adff4c6000000b002be34f50df7mr4138112wrp.46.1674122749405; 
 Thu, 19 Jan 2023 02:05:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600003cd00b002be07cbefb2sm11556919wrg.18.2023.01.19.02.05.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:05:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/8] tests/qtest/boot-serial-test: Build command line using
 GString API
Date: Thu, 19 Jan 2023 11:05:31 +0100
Message-Id: <20230119100537.5114-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119100537.5114-1-philmd@linaro.org>
References: <20230119100537.5114-1-philmd@linaro.org>
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
---
 tests/qtest/boot-serial-test.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3aef3a97a9..fccf706f99 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -226,23 +226,25 @@ static void test_machine(const void *data)
     const testdef_t *test = data;
     g_autofree char *serialtmp = NULL;
     g_autofree char *codetmp = NULL;
-    const char *codeparam = "";
     const uint8_t *code = NULL;
     QTestState *qts;
     int ser_fd;
+    g_autoptr(GString) cmd = g_string_new("");
 
     ser_fd = g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL);
     g_assert(ser_fd != -1);
     close(ser_fd);
 
+    g_string_append_printf(cmd, "-M %s ", test->machine);
+    g_string_append(cmd, "-no-shutdown ");
+
     if (test->kernel) {
         code = test->kernel;
-        codeparam = "-kernel";
+        g_string_append(cmd, "-kernel ");
     } else if (test->bios) {
         code = test->bios;
-        codeparam = "-bios";
+        g_string_append(cmd, "-bios ");
     }
-
     if (code) {
         ssize_t wlen;
         int code_fd;
@@ -252,17 +254,22 @@ static void test_machine(const void *data)
         wlen = write(code_fd, code, test->codesize);
         g_assert(wlen == test->codesize);
         close(code_fd);
+        g_string_append_printf(cmd, "%s ", codetmp);
     }
 
+    g_string_append_printf(cmd, "-chardev file,id=serial0,path=%s "
+                                "-serial chardev:serial0 ", serialtmp);
+
     /*
      * Make sure that this test uses tcg if available: It is used as a
      * fast-enough smoketest for that.
      */
-    qts = qtest_initf("%s %s -M %s -no-shutdown "
-                      "-chardev file,id=serial0,path=%s "
-                      "-serial chardev:serial0 -accel tcg -accel kvm %s",
-                      codeparam, code ? codetmp : "", test->machine,
-                      serialtmp, test->extra);
+    g_string_append(cmd, "-accel tcg ");
+    g_string_append(cmd, "-accel kvm ");
+    g_string_append(cmd, test->extra);
+
+    qts = qtest_init(cmd->str);
+
     if (code) {
         unlink(codetmp);
     }
-- 
2.38.1


