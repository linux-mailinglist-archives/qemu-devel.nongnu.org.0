Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E78366488F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:12:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIb9-0003Xv-FL; Tue, 10 Jan 2023 12:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb6-0003WF-C4
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:40 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb2-0001D1-7m
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:40 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso6022297wms.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ETifGALS4KmBJlNwYTjtra3baBU/IlLzVll0TgmEm7I=;
 b=B1yQ1/Vb+V9nZz4lyn28CsVZ2MTvvEpdfNjN4RJjJRUkcPlvcMT7OvZxUPZy8FpCBs
 t0WDlz6K+Q5OBroVFTarm4KodBhr641oYu1BDfFoNEzZQwN2oSuzaxC5qWOmOh6jbhuE
 NI5WC5DppwOoo9iRmNLQaH5c6YdOFlT1rDDrln53mmYOYSJUmrpHr0yuFMrV6PTgxb3V
 LO9rNbl942g7sFxffX3TPccR3GKvCKkdeFZl+IulNbr4YYtlQHNji6b+bghPF588BZdQ
 INxDniwgAycmd546D88n7bY/VSj4L8s03bbq/8WKGYIl84EOJrsicXhG3oXeyYm89IaF
 7T2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETifGALS4KmBJlNwYTjtra3baBU/IlLzVll0TgmEm7I=;
 b=4E4a9jG0kKJcyzUjtz6yAiZeWWS26Ok+2xqyfo71JcWSgykScCaDvZb3cST1qXzq9t
 cBdAIBKrnM5HM/CKUs9kNXoYYy9Xm0AY9MHnx4BjJPid3by2rtzDzFdK0EiESxGe46uQ
 QbQjLa4q/06c3MTvRgIj0NLq4Ox0uLAF8IcnlmnBxvkr5H6ian/K6F3xxxxD8/zlXYwp
 CZkOx9oNo8Fff6E1d3ZtlvMW9HIo1+INPfDvIZG5BvESRsR2QnTb2uTs4krlPWM8w5Vb
 is6n/m7MMiUiMKgVDWA5uB8PQoh0Z4z5XlK35wyoM7+9uTZr5juYexaDQqOmz71IQx11
 bb2g==
X-Gm-Message-State: AFqh2kqMUL289XKl5jmrqklZFIl51ZBjGPucHZ5BBFTPP3X32ZZ5mWZC
 7yeydSLxQC2uKXnkmdA6/eg/yA==
X-Google-Smtp-Source: AMrXdXs2sqAeBdMMPl2BwcgE6722Y8w5kfeegGA0iUGE/nnm3L+nfASHWMA6yIKCFA18klwWrupSeQ==
X-Received: by 2002:a05:600c:229a:b0:3d9:ec70:befc with SMTP id
 26-20020a05600c229a00b003d9ec70befcmr7543365wmf.13.1673372375520; 
 Tue, 10 Jan 2023 09:39:35 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bo30-20020a056000069e00b0027a57c1a6fbsm11891959wrb.22.2023.01.10.09.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B123C1FFBA;
 Tue, 10 Jan 2023 17:39:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH 14/26] semihosting: add O_BINARY flag in host_open for NT
 compatibility
Date: Tue, 10 Jan 2023 17:39:10 +0000
Message-Id: <20230110173922.265055-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>

Windows open(2) implementation opens files in text mode by default and
needs a Windows-only O_BINARY flag to open files as binary. QEMU already
knows about that flag in osdep and it is defined to 0 on non-Windows,
so we can just add it to the host_flags for better compatibility.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/syscalls.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index ba28194b59..e89992cf90 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -253,7 +253,7 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
 {
     CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
     char *p;
-    int ret, host_flags;
+    int ret, host_flags = O_BINARY;
 
     ret = validate_lock_user_string(&p, cs, fname, fname_len);
     if (ret < 0) {
@@ -262,11 +262,11 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     if (gdb_flags & GDB_O_WRONLY) {
-        host_flags = O_WRONLY;
+        host_flags |= O_WRONLY;
     } else if (gdb_flags & GDB_O_RDWR) {
-        host_flags = O_RDWR;
+        host_flags |= O_RDWR;
     } else {
-        host_flags = O_RDONLY;
+        host_flags |= O_RDONLY;
     }
     if (gdb_flags & GDB_O_CREAT) {
         host_flags |= O_CREAT;
-- 
2.34.1


