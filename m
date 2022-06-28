Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE17855BF26
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:32:11 +0200 (CEST)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65hi-0001Tk-P6
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FS-0003BF-6h
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:50 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FQ-0008Km-Gd
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:49 -0400
Received: by mail-pl1-x634.google.com with SMTP id r1so10016460plo.10
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Xz6wzUwopMbPAdNCjdjT86fVDAwIGV9xu3XdWWd8EM=;
 b=UL6ebudZa+CwFmlFs6UTQiOWt7qDttWtQkbTBs8kXxSot0mS/5GV1xkSIelsL7Cd+O
 KIXY/dDzoITqabyRnFknjGLt3TVAzIoKIKblinqCHgevviwh9wlnS1jo2kUSAoCmMtXq
 x0up7hZT/FrDM8GpteKIOgAlJdb84rwaM6WunADpMbQdN0guGrmWufjVlEfNO3jDZs+k
 ZF3BygtKqviTfhlFwqAUpd5r3ZMLT25GrxBx5pjhHypm2QcG/G0q7PhKPdUOppksPuZ3
 I53YdLjezDwjrP6AnYxBToDLu37uQ9jjy8cOkdwkuK1Sv5fLpNF3mJ1ZKTNtZlldjohc
 Bi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Xz6wzUwopMbPAdNCjdjT86fVDAwIGV9xu3XdWWd8EM=;
 b=FuW7Qr6hsb7Czk6SexfLD22SRxp0HUbChbMGS9LgLqViuCWaY4LWzQvT/f0aR73L0/
 j+RHYxEsErwrdjew5U/pLzeH1adRv9uNRRSysxhWbyXLyEcmcOB8mqEZYXl4+5AIFY0j
 mtD/GHZXDFczohjxMN4gEJz+RGkNC0h58a6iMPNsxgsReJPTJQs4oVSGV3WBT1SEtPFL
 iPVE2+MyTlitEef/vCtfX63Tfpasa3JfcFQs6c+4u6i7sSIp2q7hKrgY54rcrIkMjKi6
 Z0qq+nEUlV5Htfy3wSe1COadYfZdCNUCdp46LwNtdEtX3407wu7CFn7u8Dq1l0UD0JNh
 VJ+g==
X-Gm-Message-State: AJIora86F+QZTS42HJ8weboAiAnivPzLOXxWz7XjfF7fS3ki7AmgDdD7
 ZdBwrDeABoxgnUKK30FHhcU/WC3VoOKHOw==
X-Google-Smtp-Source: AGRyM1v+7wbUwdzJSdrDXAADyKzMieVkjEcE3UDKt1PuJ1UMPEGyLFN/QmH7n4oZTttTgOAaC/5NXQ==
X-Received: by 2002:a17:902:9004:b0:16a:6808:e602 with SMTP id
 a4-20020a170902900400b0016a6808e602mr1825205plp.94.1656392086466; 
 Mon, 27 Jun 2022 21:54:46 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 16/60] include/exec: Move gdb open flags to gdbstub.h
Date: Tue, 28 Jun 2022 10:23:19 +0530
Message-Id: <20220628045403.508716-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

There were 3 copies of these flags.  Place them in the
file with gdb_do_syscall, with which they belong.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h        | 9 +++++++++
 semihosting/arm-compat-semi.c | 7 -------
 target/m68k/m68k-semi.c       | 8 --------
 target/nios2/nios2-semi.c     | 8 --------
 4 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index c35d7334b4..603e22ae80 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -10,6 +10,15 @@
 #define GDB_WATCHPOINT_READ      3
 #define GDB_WATCHPOINT_ACCESS    4
 
+/* For gdb file i/o remote protocol open flags. */
+#define GDB_O_RDONLY  0
+#define GDB_O_WRONLY  1
+#define GDB_O_RDWR    2
+#define GDB_O_APPEND  8
+#define GDB_O_CREAT   0x200
+#define GDB_O_TRUNC   0x400
+#define GDB_O_EXCL    0x800
+
 #ifdef NEED_CPU_H
 #include "cpu.h"
 
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 92c1375b15..abf543ce91 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -86,13 +86,6 @@
 #define O_BINARY 0
 #endif
 
-#define GDB_O_RDONLY  0x000
-#define GDB_O_WRONLY  0x001
-#define GDB_O_RDWR    0x002
-#define GDB_O_APPEND  0x008
-#define GDB_O_CREAT   0x200
-#define GDB_O_TRUNC   0x400
-
 static int gdb_open_modeflags[12] = {
     GDB_O_RDONLY,
     GDB_O_RDONLY,
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index a31db38fc3..475a6b13b7 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -69,14 +69,6 @@ struct gdb_timeval {
   uint64_t tv_usec;   /* microsecond */
 } QEMU_PACKED;
 
-#define GDB_O_RDONLY   0x0
-#define GDB_O_WRONLY   0x1
-#define GDB_O_RDWR     0x2
-#define GDB_O_APPEND   0x8
-#define GDB_O_CREAT  0x200
-#define GDB_O_TRUNC  0x400
-#define GDB_O_EXCL   0x800
-
 static int translate_openflags(int flags)
 {
     int hf;
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index 373e6b9436..0eec1f9a1c 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -71,14 +71,6 @@ struct gdb_timeval {
   uint64_t tv_usec;   /* microsecond */
 } QEMU_PACKED;
 
-#define GDB_O_RDONLY   0x0
-#define GDB_O_WRONLY   0x1
-#define GDB_O_RDWR     0x2
-#define GDB_O_APPEND   0x8
-#define GDB_O_CREAT  0x200
-#define GDB_O_TRUNC  0x400
-#define GDB_O_EXCL   0x800
-
 static int translate_openflags(int flags)
 {
     int hf;
-- 
2.34.1


