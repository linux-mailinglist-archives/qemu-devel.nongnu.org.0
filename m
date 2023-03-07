Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97B46AF7A5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:31:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZesG-0004lM-Dp; Tue, 07 Mar 2023 16:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZesD-0004k7-IS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:29 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZesA-0000wf-Uc
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:29 -0500
Received: by mail-wr1-x42c.google.com with SMTP id f11so13513097wrv.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RFnVylggrOveF5TL9UqBJAa3Obk9uRQsQNg6W7LMavU=;
 b=ajwaVXPTDXDf9yGrGniWwTaVimiBz5bCkqIj+VBKed1lQnPqXKHrclJsXcjinKCHHC
 7W3oquYqr8gErKZBrp1LoLv2FP4X2sJz6Kkf26AZ5yGGqtP3cITrgLvUb07TsGi2mv8S
 wUGP85IqGPbt9p2ziBkauYZDjWxUhOGUBfLJSp1mlzdJqSRAYcJ3WHtsJR8VZBkGyNKC
 IEZb+0WUsE9JQhBmmuG6/KkrxQYd8IxLBGoxQdbatnW/QISLtEOLDhK1G5PhTHlWCt2o
 T8xHxyJ2uDB3MwdqJ31t481eKWKpuklUF1gLBogtdvFf2Ji38hXZKfjCH7PgezqpnNPP
 Cykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RFnVylggrOveF5TL9UqBJAa3Obk9uRQsQNg6W7LMavU=;
 b=AIJF3E1hQ5MLQT8UKX6T1sGur3hcXB5/gpdv4Js8gnfy3FapdTZkuggx3dYdL1+vo+
 lO28UN69SfprAd8m42maiEbwOANUMKGak7wFmAnMRZ5jRNcr0ZoaP0xyvPWYzty04Qqe
 yuz1pb/laMfWUq/1C/jg6gwEdyZe53Hx1yjZuQbRm0HifJjlHpOwbRC6xVKE+wZTEOI+
 XVchVUgfqMbUzUoaKAd4Fgm3tTHcEG0wMFucaYosSwA9GWmM/f/urcBvAyaUXW9S1OI4
 TCzAn89QVVsiOgVENIWUR1TLxpvDfEQKjH8/PRBSDLnyjGfoPY+6W/2/14fLqbAPAxR+
 AlPw==
X-Gm-Message-State: AO0yUKVd52SiY1pbMVCzwGeoTH3z+GbF04zM46ahCocltmFadhyX56l7
 YFCMAk5679FFS/bVVPsyvNVGTA==
X-Google-Smtp-Source: AK7set88t4MJESm8ZhT6OtYl+3/La0DYOUuuuIvYD/MTzqXmMmneOkOFAT/I8Lv0dAAr+VX6mIPqYg==
X-Received: by 2002:a5d:4892:0:b0:2c9:640f:635b with SMTP id
 g18-20020a5d4892000000b002c9640f635bmr8797017wrq.56.1678224565175; 
 Tue, 07 Mar 2023 13:29:25 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a5d60c9000000b002c70d97af78sm13232934wrt.85.2023.03.07.13.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:29:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 271D71FFD4;
 Tue,  7 Mar 2023 21:21:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 27/30] gdbstub: Adjust gdb_do_syscall to only use uint32_t and
 uint64_t
Date: Tue,  7 Mar 2023 21:21:36 +0000
Message-Id: <20230307212139.883112-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Pass %x as uint32_t and %lx as uint64_t; pass the address
of %s as uint64_t and the length as uint32_t.

Add casts in semihosting/syscalls.c from target_ulong to
uint64_t; add casts from int to uint32_t for clarity.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-28-richard.henderson@linaro.org>

diff --git a/gdbstub/syscalls.c b/gdbstub/syscalls.c
index fdc68e452a..9f479010b1 100644
--- a/gdbstub/syscalls.c
+++ b/gdbstub/syscalls.c
@@ -110,14 +110,14 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
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
@@ -127,9 +127,9 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
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
2.39.2


