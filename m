Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C69852F72B
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:57:00 +0200 (CEST)
Received: from localhost ([::1]:39002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDQR-00018T-H6
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbw-0008Bc-5O
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:56 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbX-000404-Gj
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:45 -0400
Received: by mail-pg1-x536.google.com with SMTP id r71so9015625pgr.0
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6dWKfH8zSLvUN3M0oH8qZ8MqlB5qlfA1EdENsRW07Xc=;
 b=Lq3A4/Qea0Y/E2qZy4Y4sz9PnWUBch6iJ5XMAP5aGt6KAeXccYgeY0Y1n04KMXFybt
 7qXTL9ZHhTqB6wRJ1w0+EFRc1d/x+K+JZSCg19ZVCOImC5G+MgoLMhtPV6yQ9bWFxHpk
 4icY1UUNvU869A37rcIZPxLxkg2yyw8mThlmODvYw3GYOGkdj4xKZW+zjWCh7La1N/Ts
 +0Z97GFDyeE/0EVpJ7ihW1iF1XxmGRjqP1GMhUDIV8/VBRRFTqnSzz/ibQ6Vl2vIc5Sb
 SEAAUiXCJIwNhqAdReyNnouQHAm0HzqP9kpjkoPeyyn/YwJZsERjaxZSRbT93seURcNp
 1WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6dWKfH8zSLvUN3M0oH8qZ8MqlB5qlfA1EdENsRW07Xc=;
 b=H2ISrSFfAXOr2vd3+CrOMl1fyPHcpdIfZJLvRWwQIrKQPZd/DAS1HBZTnErtxyTHPs
 1XeYhqGpfKfvTDdfdt/dClwh5KPVyddnUXaOCj3cc/LGn58T4VuMntTO19XLk2PmNLHK
 m8ww9UWbC+niojsiuozL1hgypFBQB0XTAMNpe2JSS+CokELYYNPXmjx+Zeswg4Lt/dt6
 17gWJ4KaQU4QDuJxdNIqw4dymhvhChneH0MwWdkk4bk/PLJl53geZL8j3EhHuViJlybi
 ShnUXkwUzj4SPPEZ2++CiCMzZMjmcuLXbSE+FVr21MWJIruBPyjjPnqXopaa8En9UisM
 WHEw==
X-Gm-Message-State: AOAM533/GYzDHi/TiS767a4tFwGHwSolT6RS0VaiYX6ycRoGqeDl0QHL
 /LTbafn0yzTcJjDhkhyRATvNYmePk10RAQ==
X-Google-Smtp-Source: ABdhPJwiODPxdTxvnVKavL3N7qOLUmUFwwJ046nxMSENy2MYx6Nj0TPZRGHyClhcxU1/uVz0isuAbA==
X-Received: by 2002:a63:d908:0:b0:3c1:f140:c1a4 with SMTP id
 r8-20020a63d908000000b003c1f140c1a4mr10458498pgg.393.1653091459272; 
 Fri, 20 May 2022 17:04:19 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 14/49] include/exec: Move gdb open flags to gdbstub.h
Date: Fri, 20 May 2022 17:03:25 -0700
Message-Id: <20220521000400.454525-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index 7b56bae7db..2e0e7febb1 100644
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


