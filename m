Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A5E619EE6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:37:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0cj-0000Mi-HB; Fri, 04 Nov 2022 13:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0ch-0000Ls-AM
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:36:55 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0ce-0003w4-H0
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:36:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id o4so8041108wrq.6
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N+83DGVTzGZnIoL+PWZmwCaL/Wjexo+oA9y1TGSpj+Y=;
 b=TiHz2TQNPQvcMplUXUSZZgHPYRtQ39YAmL0Z7xong3kRTMGXtw5v9HxHXrw1CiaiA1
 OrBuvlW1YcdKuxkiH6Q2D8+cOWXhzL3IQcdu3mgEmvzmcivEc8R9qNSPce6XtFCR0hKL
 TXT01QxQrSSvRvHBlKCJ18u8wtUmHsihD2H0ykX1nsVQBhCDsJrfG7jFod3JxcE/KfWf
 w9V2d3nXmvFUO+cDD8o/vUpjT4PEx+a4ewRFvD0YWYTaymisJ0ISY5iC6wxkDdo6AYEi
 SzE91R/vhKMWDm3S8pKBRSmMiltmN1GsTJ5bJH+St6u9CwYuSVW17VFy1bkG4km8YlAA
 f0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N+83DGVTzGZnIoL+PWZmwCaL/Wjexo+oA9y1TGSpj+Y=;
 b=Sz1RPLx/jRJb/BaDN2LqLyd4TjK2lwpHHaeeFCD4QWXzmqHHhLZAAgzj5b60CB2sVk
 qVmAVS/6+ARalRyMyGlPhgVxpEC2kMf975B4eOksS/Q1LwD0PDFHej+EwWx5NZhIHYjX
 z/L+TfYxXg8b5xomqEpBw1/Lf/kQtkt8VmSg83kgJXub9QfNjlw0JVkAx4sGMaSTnmJq
 fhZQbnVy9XUfcurnYAwv1NqGaPwcxzYBKegM6Z8mAbPeYw2qNko17/8lG+FOs9y1jF+a
 Al2+QVD4YqvVuXh32q98KaCMu5RCdaUbxkC8UtT5rM00FX9tOlfTYPMJSXs300oM9XW/
 Sikg==
X-Gm-Message-State: ACrzQf3cdAHVUGsaSesFESJ25TA66h2ApoQXDfhbMOR8BdxfpOLQfTcQ
 3TkmjoxKTA5p4YaLEE9MmpMHEgv9OC06xQ==
X-Google-Smtp-Source: AMsMyM5BkRR2kTbO775dgKM+64S9JNGPZLnfjhXLvIxcEOMbgbx+vgSeSHEeoiVvgiNltsmcOer0vQ==
X-Received: by 2002:adf:a348:0:b0:236:beb8:9698 with SMTP id
 d8-20020adfa348000000b00236beb89698mr19540285wrb.507.1667583410788; 
 Fri, 04 Nov 2022 10:36:50 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q5-20020adff945000000b0022ae0965a8asm3809663wrr.24.2022.11.04.10.36.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Nov 2022 10:36:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Drew DeVault <sir@cmpwn.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 3/5] linux-user/strace: Add output for execveat() syscall
Date: Fri,  4 Nov 2022 18:36:30 +0100
Message-Id: <20221104173632.1052-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104173632.1052-1-philmd@linaro.org>
References: <20221104173632.1052-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Drew DeVault <sir@cmpwn.com>

Signed-off-by: Drew DeVault <sir@cmpwn.com>
Message-Id: <20221104081015.706009-1-sir@cmpwn.com>
Suggested-by: Helge Deller <deller@gmx.de>
[PMD: Split of bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/strace.c    | 23 +++++++++++++++++++++++
 linux-user/strace.list |  2 +-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 3d11d2f759..7bccb4f0c0 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1104,6 +1104,16 @@ UNUSED static const struct flags clone_flags[] = {
     FLAG_END,
 };
 
+UNUSED static const struct flags execveat_flags[] = {
+#ifdef AT_EMPTY_PATH
+    FLAG_GENERIC(AT_EMPTY_PATH),
+#endif
+#ifdef AT_SYMLINK_NOFOLLOW
+    FLAG_GENERIC(AT_SYMLINK_NOFOLLOW),
+#endif
+    FLAG_END,
+};
+
 UNUSED static const struct flags msg_flags[] = {
     /* send */
     FLAG_GENERIC(MSG_CONFIRM),
@@ -1976,6 +1986,19 @@ print_execve(CPUArchState *cpu_env, const struct syscallname *name,
     print_syscall_epilogue(name);
 }
 
+static void
+print_execveat(CPUArchState *cpu_env, const struct syscallname *name,
+               abi_long arg1, abi_long arg2, abi_long arg3,
+               abi_long arg4, abi_long arg5, abi_long arg6)
+{
+    print_syscall_prologue(name);
+    print_at_dirfd(arg1, 0);
+    print_string(arg2, 0);
+    print_execve_argv(arg3, 0);
+    print_flags(execveat_flags, arg5, 1);
+    print_syscall_epilogue(name);
+}
+
 #if defined(TARGET_NR_faccessat) || defined(TARGET_NR_faccessat2)
 static void
 print_faccessat(CPUArchState *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 3a898e2532..bb21c05414 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -164,7 +164,7 @@
 { TARGET_NR_execve, "execve" , NULL, print_execve, NULL },
 #endif
 #ifdef TARGET_NR_execveat
-{ TARGET_NR_execveat, "execveat" , NULL, NULL, NULL },
+{ TARGET_NR_execveat, "execveat" , NULL, print_execveat, NULL },
 #endif
 #ifdef TARGET_NR_exec_with_loader
 { TARGET_NR_exec_with_loader, "exec_with_loader" , NULL, NULL, NULL },
-- 
2.38.1


