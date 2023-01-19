Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7418673540
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:15:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRou-0004YP-AX; Thu, 19 Jan 2023 05:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRo1-0003s9-0m
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:01 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRnx-0005Em-O3
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:00 -0500
Received: by mail-wm1-x333.google.com with SMTP id m15so1068436wms.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+5bluXdjaCn3oQ9NGGs572QWlIZ5/vAONfTlGZhWE+Q=;
 b=F+7rMfdusOTDEJWqznE7TFHET01XE7DRIr9/IbCv9G5KPTdOOs+doMC8ySkQESTR5x
 j4qR0TKSQYNXDwgFkfjxL7+MTouMfUnUrDjQiMTgdHJZdF14l9XDnBijwieTyDbA2LID
 5819HK+hko25zPbJcqlTKbTY4t4PKufJ2Cci0di6fCa4uSZ1eqJz/ybOQ20AI7Eu/579
 fP8JoPVLfyMhq3R7cLZMBEeF8qziTRaO+iEqM8prkB8IO4oL7ccAvkY7kvhO1jefp3xz
 mmbQrhJKCI2rQdC63fdBU0LK9XFXVHBz7hd2snSdqRgEGqGNU6cW3R3mZO9ArseCoDlX
 PucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+5bluXdjaCn3oQ9NGGs572QWlIZ5/vAONfTlGZhWE+Q=;
 b=MFpG64uNF3r9ATOfkwBC6VmZOD4nvWaA7R9V2CilD9Y1flSCBBMnSUUmvsq4fRN1iX
 0UIfz1Td4gg6z6q90nHR6exh0zmlBCMjNUvqBqf//k9JyrG0XX7RXqIEy49RdmGk9xPL
 BkLcMrBNERa3Eig1YQ++KBwLxxe2USsGMz3Bpy/XIKw5F7DbudUB40CMoNWcFGif6jue
 JGMnTnl2pxc5HPA3bRuL1GSQj4ax4+6I2KhOzzgrWjHD7aUI8yDj3+KQ4z+RLbtS/UEd
 BD+6fiMuH7aNo8zCa/q+ak4Kw6a/hRBGpYOo6858sl4MnoC9zOUXdgrfrhnADZHfvxKm
 Uz1Q==
X-Gm-Message-State: AFqh2kqlWOE7Mm1fobbFbVfV2gYJAeXQHXzG5C8Fjn9/u7JB3TNkcQwe
 1KRJZcjdEaGFGSDHVuK9yRoyMS1x4MoDnHK6
X-Google-Smtp-Source: AMrXdXvv6+5GG/Ke9hkq10ef9xEmE4FkAl2QmS1po8OugWP/MKuej0+khbtDuTrSev0E7HPSrM/5FQ==
X-Received: by 2002:a05:600c:3555:b0:3da:f4d4:4c2 with SMTP id
 i21-20020a05600c355500b003daf4d404c2mr9572214wmq.37.1674122754363; 
 Thu, 19 Jan 2023 02:05:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a05600c350100b003d990372dd5sm4563111wmq.20.2023.01.19.02.05.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:05:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/8] tests/qtest/boot-serial-test: Only use available
 accelerators
Date: Thu, 19 Jan 2023 11:05:32 +0100
Message-Id: <20230119100537.5114-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119100537.5114-1-philmd@linaro.org>
References: <20230119100537.5114-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

For example, avoid when TCG is disabled:

  $ make check-qtest-aarch64
  ...
  18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
  qemu-system-aarch64: -accel tcg: invalid accelerator tcg

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/boot-serial-test.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index fccf706f99..f8d0c684c2 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -17,6 +17,9 @@
 #include "libqtest.h"
 #include "libqos/libqos-spapr.h"
 
+static bool has_tcg;
+static bool has_kvm;
+
 static const uint8_t bios_avr[] = {
     0x88, 0xe0,             /* ldi r24, 0x08   */
     0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
@@ -264,8 +267,12 @@ static void test_machine(const void *data)
      * Make sure that this test uses tcg if available: It is used as a
      * fast-enough smoketest for that.
      */
-    g_string_append(cmd, "-accel tcg ");
-    g_string_append(cmd, "-accel kvm ");
+    if (has_tcg) {
+        g_string_append(cmd, "-accel tcg ");
+    }
+    if (has_kvm) {
+        g_string_append(cmd, "-accel kvm ");
+    }
     g_string_append(cmd, test->extra);
 
     qts = qtest_init(cmd->str);
@@ -292,6 +299,9 @@ int main(int argc, char *argv[])
     const char *arch = qtest_get_arch();
     int i;
 
+    has_tcg = qtest_has_accel("tcg");
+    has_kvm = qtest_has_accel("kvm");
+
     g_test_init(&argc, &argv, NULL);
 
     for (i = 0; tests[i].arch != NULL; i++) {
-- 
2.38.1


