Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE73541DCD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:22:19 +0200 (CEST)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhac-0004Hv-Hg
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5i-0007Gb-4c
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:21 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5f-0001MZ-69
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:17 -0400
Received: by mail-pj1-x1033.google.com with SMTP id a10so16678680pju.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Xz6wzUwopMbPAdNCjdjT86fVDAwIGV9xu3XdWWd8EM=;
 b=LvGCXFSx5Ydt0+i3bT9OWIxQblSrj0qBB7svNQJUy1PsdZA6qMCxw05PdAHM3iaO3i
 xRCysyecZ7aTHJu82Xrw/2pH9RB2fpRlQ2Rt+1mbmHzMjH5SJ8IHvZIvL6r1/q60vY8p
 IVKSepQmC4wjQjl1+YiAl2kzPC+p4I26DlhK2IwOkUjY3dW2Dn+7zDvQrfa5TnphKauj
 q4fS7+gkHMGzZjVBL0m/c6Xo0jYkNpwbTcTQHCZqAAWRWw4pPIOjiK+Z9pRo6pKgkhB5
 CKysTEFQ7laGGPQ8EECvKFTiCXqYd2IxLNbyWgO9WnjXn8avP71ilUA4yBbmJ25/Pryc
 yVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Xz6wzUwopMbPAdNCjdjT86fVDAwIGV9xu3XdWWd8EM=;
 b=ax+93+I8QPBvNSPCKeA8uxdr6/4EkzrOleLgdzMINGBib/bRaqynvea++dxrkXCF+z
 +fc5l4kWD57NM1N7aeCAo2JDMX1avOu6140ir8G/JEWM8FqVODN1EmOuFiyqImZ0se8M
 cU7QBPw97jU+FzOc4LeLJcTzMyfkgN4AgE9RThXCGK8tkw7xyPpZWpa/dtF5CmxqWhk+
 PxCln0AsAkJtjtC8M+7kVkNYblWPipySDMiVzJ6Zqpbeh4rzdSDtf/5gXC+8ncKaR16c
 AGBzQ3TqLKzCrxvnV5MZyKjTW+sleeSazSmnmp2z31fDjKEwBlqtCnGKPu+MIC9FbO5V
 ho9Q==
X-Gm-Message-State: AOAM533F97h0uu5psKmYtOGqfug8c+D4ZEphF0dzki8RYLy/Q7azZbS9
 xtG7eOPgK6ecGhbszu6ayttsE+QDnyip3Q==
X-Google-Smtp-Source: ABdhPJy1Fk7YAm5bVqEgUMJcVAxb/OZ3P6pz582l/rB/c1gnZVMTVocrE8279XIDqe210+VCkOQAEg==
X-Received: by 2002:a17:903:1103:b0:167:839e:7ba1 with SMTP id
 n3-20020a170903110300b00167839e7ba1mr10168500plh.136.1654634773851; 
 Tue, 07 Jun 2022 13:46:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 16/53] include/exec: Move gdb open flags to gdbstub.h
Date: Tue,  7 Jun 2022 13:45:20 -0700
Message-Id: <20220607204557.658541-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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


