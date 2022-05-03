Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0B3518E3B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:10:03 +0200 (CEST)
Received: from localhost ([::1]:59394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyqQ-0007wG-EN
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW7-0001QW-Vk
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:04 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW4-0003Xw-G8
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:03 -0400
Received: by mail-pj1-x102a.google.com with SMTP id fv2so16237021pjb.4
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sRa3I/Ez0AmhRV5BtAXtTCzSb0MQ7Gt+C1fZfKVXMvs=;
 b=fECEga2VAgTlWdGXRWCSw7ZJomvFAD+c/TlMFmWimvRjhPGcxFomTF5Zz+iTSRrhNC
 Ug/Lo5d2Uqx1na8FQjvQjWOgfZFuH6adBfWP196GukXo1p2hHLpQHVd8p7wy+PPzIcWt
 zBqq/fMXbgifKBHQGIAEHHnM+2S6DQiP7xpcGcgqRjo1Qp3X0u9A+JuNjCDv4L3UZ39a
 7bh9m2rri9IzS5c3JGE2/W4E/kGxB7FQ16xE4MgWFM8Ie+zwatrqlb0dOK8CLcMSrwl7
 nI/8tbyAG3kHXwoeq1dO9DTzEI0RVwXm601IIFEutdlI7LMWJOg4eOoDptr7gjeH3i6Q
 5xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sRa3I/Ez0AmhRV5BtAXtTCzSb0MQ7Gt+C1fZfKVXMvs=;
 b=qy7M9t7fqkmakEkPWveHJ2dViVnntBsiYhbxeiK6AryOlN2W9L9PaXJLZ2uM6BbjCT
 bMPqVf7CxGup+6UDpHaJwKScnCYagE+2Mwz585PXhow1OI+8gMZJe3/aIj7CPZWqtrml
 TB/XcekF3U/fTvwHo3lyCwAx2OG6GWTjahUfRSPtYwqgQWzl0AwyCwlC3AXaMcth1m31
 hWw/hNQiAFG9YBwkQ7Z/0N42R3rMzYNHlSAO8nB8wKznGx04BjafxFM93owet+bqrwC8
 HJ6X/26CEqGq/UokzYktjP6qayUGbn64fyYPlM8CniUDkvu/Cv6wFnomAI1Oa1YoJefy
 V2gQ==
X-Gm-Message-State: AOAM531t3bwchK6p/eJ5+/TUoaGX77Z/yFp7Xq1I4Yv/pQ/hELuGhtt/
 SNOJcaDJvV5aKlOatyBqw7J7dCVFHYnSDg==
X-Google-Smtp-Source: ABdhPJw3GoIPycILuOOfjEs3DglVzz0RoX6JZDCIhWl71LVbw0CtTUXZ0jLoslieC//vUj38CqnRCg==
X-Received: by 2002:a17:902:b416:b0:15d:7f2:b19b with SMTP id
 x22-20020a170902b41600b0015d07f2b19bmr17988514plr.93.1651607337758; 
 Tue, 03 May 2022 12:48:57 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:48:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/74] include/exec: Move gdb open flags to gdbstub.h
Date: Tue,  3 May 2022 12:47:41 -0700
Message-Id: <20220503194843.1379101-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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


