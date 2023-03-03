Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D1A6A8F88
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:00:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcv-0007cL-MN; Thu, 02 Mar 2023 21:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcu-0007c7-7g
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:32 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcs-0001qG-8P
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:31 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so967885pjp.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpo/p9yzI64Tx7SaKYcCkvRfvTqYOcBW+5MSbV4gbos=;
 b=I6fkVpJUcgLB0yPqniPC8TiaQMFcnbl/WJ/GKCyxW/t+JwQOLwnlJXg1rGYcKsYiQT
 NK1E1KxHEOCUkKEK2son5OOPX4XdMtatq+Ot1wPsihtOtYDZiuuLeLcs4ckvR7S7IBja
 B8LWpnh6gAmNkv69ff2icYijrGhCm+xMe7PEvQ5626CnzAWufGydPe2nqa2+VlgkB1jg
 9bTDjyUq0K+oDtHdL5649a2w44cBEUdrf6y4m3viTc8pk4Rdfh0X8mjpOCKq+3IM6BYM
 4ahS9ZMYUAjx95SCLrft8gpKapTHF7Z8JR/iQjk/YQf5u66J6GFk7Rx5mVIUV0l7AFKP
 a8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kpo/p9yzI64Tx7SaKYcCkvRfvTqYOcBW+5MSbV4gbos=;
 b=HEzygRGDh/dhtw8p5yl4kqewsCiY0+Z9n7LgdgzWOlT6kps0u0fQ7N+MIDlKEtOdwp
 Cxep17CEZ9L97Dz0tEV5c2xRaUMQBBNuCEASMWsTgLXNl79RwDHVcPJ1iqAk9Q7uTskD
 WoxvQxJsfwjDYoIGZTGKRA6mdiRPYAet3gD1pUmMM8bFsBsKSNkfiKLSqy8nOwnNkane
 S63FnFjy70ibHZYfMmcSt1Ftm6EDo2v4cVloEIQx02A6z5mONCqnFvcZw0T9WnC7rUR5
 dK8tvb8Tl5pMh128sM4NIQ+wCewkr8XqDvRVrFUw91n7sI4p9npBmdmlFNpqbXOF29K9
 z+Tw==
X-Gm-Message-State: AO0yUKUxbn+e/M8UthftnNpc4ndFtpWTnLH7FFLIzbeIKTVWFqWOtx78
 kMrljcpIiCHMWFS9PtLA2akDiyNMaelUZMW8GV4=
X-Google-Smtp-Source: AK7set+7R1Wr1z5Sp3h1IUokP/iByz9YqafmmyADgLnR1SbmDsnsfLtsczeaGlQeWLa6YKpVjuo78g==
X-Received: by 2002:a17:902:c10a:b0:19e:7b09:bd4d with SMTP id
 10-20020a170902c10a00b0019e7b09bd4dmr447039pli.47.1677812309490; 
 Thu, 02 Mar 2023 18:58:29 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 27/29] gdbstub: Adjust gdb_do_syscall to only use
 uint32_t and uint64_t
Date: Thu,  2 Mar 2023 18:58:03 -0800
Message-Id: <20230303025805.625589-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Pass %x as uint32_t and %lx as uint64_t; pass the address
of %s as uint64_t and the length as uint32_t.

Add casts in semihosting/syscalls.c from target_ulong to
uint64_t; add casts from int to uint32_t for clarity.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 gdbstub/syscalls.c     | 12 ++++++------
 semihosting/syscalls.c | 34 ++++++++++++++++++++--------------
 2 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/gdbstub/syscalls.c b/gdbstub/syscalls.c
index af42e244f9..b7d85c41c7 100644
--- a/gdbstub/syscalls.c
+++ b/gdbstub/syscalls.c
@@ -109,14 +109,14 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
     *(p++) = 'F';
     while (*fmt) {
         if (*fmt == '%') {
-            target_ulong addr;
             uint64_t i64;
+            uint32_t i32;
 
             fmt++;
             switch (*fmt++) {
             case 'x':
-                addr = va_arg(va, target_ulong);
-                p += snprintf(p, p_end - p, TARGET_FMT_lx, addr);
+                i32 = va_arg(va, uint32_t);
+                p += snprintf(p, p_end - p, "%" PRIx32, i32);
                 break;
             case 'l':
                 if (*(fmt++) != 'x') {
@@ -126,9 +126,9 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
                 p += snprintf(p, p_end - p, "%" PRIx64, i64);
                 break;
             case 's':
-                addr = va_arg(va, target_ulong);
-                p += snprintf(p, p_end - p, TARGET_FMT_lx "/%x",
-                              addr, va_arg(va, int));
+                i64 = va_arg(va, uint64_t);
+                i32 = va_arg(va, uint32_t);
+                p += snprintf(p, p_end - p, "%" PRIx64 "/%x" PRIx32, i64, i32);
                 break;
             default:
             bad_format:
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 42080ffdda..68899ebb1c 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -139,46 +139,48 @@ static void gdb_open(CPUState *cs, gdb_syscall_complete_cb complete,
 
     gdb_open_complete = complete;
     gdb_do_syscall(gdb_open_cb, "open,%s,%x,%x",
-                   fname, len, (target_ulong)gdb_flags, (target_ulong)mode);
+                   (uint64_t)fname, (uint32_t)len,
+                   (uint32_t)gdb_flags, (uint32_t)mode);
 }
 
 static void gdb_close(CPUState *cs, gdb_syscall_complete_cb complete,
                       GuestFD *gf)
 {
-    gdb_do_syscall(complete, "close,%x", (target_ulong)gf->hostfd);
+    gdb_do_syscall(complete, "close,%x", (uint32_t)gf->hostfd);
 }
 
 static void gdb_read(CPUState *cs, gdb_syscall_complete_cb complete,
                      GuestFD *gf, target_ulong buf, target_ulong len)
 {
-    gdb_do_syscall(complete, "read,%x,%x,%x",
-                   (target_ulong)gf->hostfd, buf, len);
+    gdb_do_syscall(complete, "read,%x,%lx,%lx",
+                   (uint32_t)gf->hostfd, (uint64_t)buf, (uint64_t)len);
 }
 
 static void gdb_write(CPUState *cs, gdb_syscall_complete_cb complete,
                       GuestFD *gf, target_ulong buf, target_ulong len)
 {
-    gdb_do_syscall(complete, "write,%x,%x,%x",
-                   (target_ulong)gf->hostfd, buf, len);
+    gdb_do_syscall(complete, "write,%x,%lx,%lx",
+                   (uint32_t)gf->hostfd, (uint64_t)buf, (uint64_t)len);
 }
 
 static void gdb_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
                       GuestFD *gf, int64_t off, int gdb_whence)
 {
     gdb_do_syscall(complete, "lseek,%x,%lx,%x",
-                   (target_ulong)gf->hostfd, off, (target_ulong)gdb_whence);
+                   (uint32_t)gf->hostfd, off, (uint32_t)gdb_whence);
 }
 
 static void gdb_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
                        GuestFD *gf)
 {
-    gdb_do_syscall(complete, "isatty,%x", (target_ulong)gf->hostfd);
+    gdb_do_syscall(complete, "isatty,%x", (uint32_t)gf->hostfd);
 }
 
 static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
                       GuestFD *gf, target_ulong addr)
 {
-    gdb_do_syscall(complete, "fstat,%x,%x", (target_ulong)gf->hostfd, addr);
+    gdb_do_syscall(complete, "fstat,%x,%lx",
+                   (uint32_t)gf->hostfd, (uint64_t)addr);
 }
 
 static void gdb_stat(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -191,7 +193,8 @@ static void gdb_stat(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
 
-    gdb_do_syscall(complete, "stat,%s,%x", fname, len, addr);
+    gdb_do_syscall(complete, "stat,%s,%lx",
+                   (uint64_t)fname, (uint32_t)len, (uint64_t)addr);
 }
 
 static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -203,7 +206,7 @@ static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
 
-    gdb_do_syscall(complete, "unlink,%s", fname, len);
+    gdb_do_syscall(complete, "unlink,%s", (uint64_t)fname, (uint32_t)len);
 }
 
 static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -223,7 +226,9 @@ static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
 
-    gdb_do_syscall(complete, "rename,%s,%s", oname, olen, nname, nlen);
+    gdb_do_syscall(complete, "rename,%s,%s",
+                   (uint64_t)oname, (uint32_t)olen,
+                   (uint64_t)nname, (uint32_t)nlen);
 }
 
 static void gdb_system(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -235,13 +240,14 @@ static void gdb_system(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
 
-    gdb_do_syscall(complete, "system,%s", cmd, len);
+    gdb_do_syscall(complete, "system,%s", (uint64_t)cmd, (uint32_t)len);
 }
 
 static void gdb_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
                              target_ulong tv_addr, target_ulong tz_addr)
 {
-    gdb_do_syscall(complete, "gettimeofday,%x,%x", tv_addr, tz_addr);
+    gdb_do_syscall(complete, "gettimeofday,%lx,%lx",
+                   (uint64_t)tv_addr, (uint64_t)tz_addr);
 }
 
 /*
-- 
2.34.1


