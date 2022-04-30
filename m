Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A234515DA3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:35:09 +0200 (CEST)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknFc-0005Dz-BY
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAV-0004lz-PV
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:56 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAS-0006Fs-Cw
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:50 -0400
Received: by mail-pg1-x536.google.com with SMTP id x12so8498853pgj.7
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sRa3I/Ez0AmhRV5BtAXtTCzSb0MQ7Gt+C1fZfKVXMvs=;
 b=RfzRtCxsH4IeaViGLfCWF0KTgOoEuxAP7jHVJjcXz4dUV3sxHB33M427pKAzwQfSqU
 jWgkq+fO4hYsOkOld6pMdes03z1ZtdRZXPsNwPGcnnoFhgOvu29/U2gmCeujCassedda
 f+Cmp2QZ3Hps5hKZjYXC+TpN9ZwnM7+LSLnoA8f7uhavNKXGobDmkiwUZAtOoglUDd8Q
 rhCqa9OqoX+rkrguEXZaf4Y1O0r8+EZBH21BC7Bn0n+AJR4//uPa5ZJSHmQ3aOWgGTGB
 SsX8DMlN4hUuxn7JBXj92A1fOV56K8wgHfeE6jXfe69/Yi6Sd2h1ykbOqtvQf2EkiCyi
 uRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sRa3I/Ez0AmhRV5BtAXtTCzSb0MQ7Gt+C1fZfKVXMvs=;
 b=Gt6v3GkJ3LLwZIScbxuEwlFs168U96XUPql+ltKS4KrHvI+YsvHZ9kd5wl2RtoNIIE
 W1VRCduqsZjo2B2yb9fDAPTsiHN8xthBE+JMsCrENr/DPNVgW6qUouSHC7Gbvq4rkSWz
 toQ7idR5S+JLcBP2HhuDYSXknsKEDhDBo1TEwEhAq0Lmgr8Jgt+P6zns/RGUfLtheuJc
 inFToKIQ1eVyGK6djLku7n8BKyFPSHOlBc+g3c9s7fOlf6Igx2HPWRgKNb8xMPpih5nz
 r8L7+UcIVSIF3mwk33OgTl8kopDNOnQ29kfN119RgOCNGrmOuYFP6iPqnT44LNYxYBKY
 +p5A==
X-Gm-Message-State: AOAM530qZFcKxb+6Q27Gfq4qCmbybHPrIivJtd4nvyoSEDEsqBiVbxsz
 W63YG1YQkb44EqwPg2VkSHDiPuI8EyDBsw==
X-Google-Smtp-Source: ABdhPJwnCdm81vpwZ53kPx3WzpaXxY87f+NWWvoSsmweXNFAJvvUJ3XKW17duuZHQmyaQAynCUWzTg==
X-Received: by 2002:a63:2b45:0:b0:3ab:971b:be5e with SMTP id
 r66-20020a632b45000000b003ab971bbe5emr3074271pgr.265.1651325386172; 
 Sat, 30 Apr 2022 06:29:46 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/43] include/exec: Move gdb open flags to gdbstub.h
Date: Sat, 30 Apr 2022 06:29:01 -0700
Message-Id: <20220430132932.324018-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There were 3 copies of these flags.  Place them in the
file with gdb_do_syscall, with which they belong.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h        | 10 ++++++++++
 semihosting/arm-compat-semi.c |  8 --------
 target/m68k/m68k-semi.c       |  8 --------
 target/nios2/nios2-semi.c     |  8 --------
 4 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index c35d7334b4..2aaba9c723 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -10,6 +10,16 @@
 #define GDB_WATCHPOINT_READ      3
 #define GDB_WATCHPOINT_ACCESS    4
 
+/* For gdb file i/o remote protocol open flags. */
+#define GDB_O_BINARY  0
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
index 18664b1c47..a1fc4ea039 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -86,14 +86,6 @@
 #define O_BINARY 0
 #endif
 
-#define GDB_O_RDONLY  0x000
-#define GDB_O_WRONLY  0x001
-#define GDB_O_RDWR    0x002
-#define GDB_O_APPEND  0x008
-#define GDB_O_CREAT   0x200
-#define GDB_O_TRUNC   0x400
-#define GDB_O_BINARY  0
-
 static int gdb_open_modeflags[12] = {
     GDB_O_RDONLY,
     GDB_O_RDONLY | GDB_O_BINARY,
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


