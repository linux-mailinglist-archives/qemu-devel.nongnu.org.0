Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EFB515E07
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 16:07:27 +0200 (CEST)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknkr-0007zE-M0
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 10:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAn-00050E-2W
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:10 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:39927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAl-0006VW-9g
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:08 -0400
Received: by mail-pf1-x432.google.com with SMTP id y38so9057812pfa.6
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6GpLQ8ipNBATQfL4tdhE0DDcTIbaXhK4bLfdN035pIc=;
 b=WthsuyDjOyrZl9sL8Vz2XFwgflAVbWZcMmE2MtiiyEb39Rac9uJ+SL/W9SSL7dCNp1
 Zdo3WORuM6k9u8cXpBdevEGeb9ebWUw0m+wZrjKVMwsZAFM/3C3Aq7E9E5f52kTXp1kz
 6522H7kFbsXPT0fqqx+u1+q3Fg/DNP2/dy8+t5VbO/EfJST718vjOOn9PMg4zYZU8vax
 qkGpVD1IDxdgELVvGHLkgsMb/OUY2HkXSqnW1JCFXrPHh+dZadwHWW4TYgXbNdV6lZZT
 SHakTKbRcOr3Cysv1OI4q4lgb9n6mDPYdSp6CVM1nRbR43xbQGiWyTCbyPDBPORFhkfx
 VSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6GpLQ8ipNBATQfL4tdhE0DDcTIbaXhK4bLfdN035pIc=;
 b=jLeRRaNq8j6rTLhtk3Qb901M+oekU9kiPXVrKc7gBZS/Klw0MWZJcF3uya6xrtim2a
 bpXZSd+uwl2BzPEPcFkpr92zL2EF2EUXwfB3SXnE6MQT6HjyU6zvfuc3RxhFoMmOQFby
 h6I5o5WMR2qGnOt09fD0YP1I4+743x4USNR2xjXdK/otZx3elgcrWrrilmCWK+PlhWKp
 T3salYgce5HIRM+6jHzqPIYqK3aNbJjroxO1g9WwoFjKAhwB8RKKAoyoVJIjmltFwYpk
 tZcMKKt7ipSgfkvQ+JJBGCXNiJSAe1LQzJGVxVsDshbyg1jHH2GWvkHc8xLMNEwshIB7
 1jpQ==
X-Gm-Message-State: AOAM533UlzB/DJly02cflgHJ26SOcPCtR9S5hHPjGzDPzuTvhrVVZqtA
 c32d1y9hsEXjWpgyU1jEGIjeyzsM+7HEoA==
X-Google-Smtp-Source: ABdhPJzoT4Jt8mcEdYHwzoRCWX/78nsT3ZuLq5gVmFxXajbQ8sMHkDtS5pwJyTw/8JqQoWGCd5SU0A==
X-Received: by 2002:a63:7702:0:b0:3ab:4d62:b68b with SMTP id
 s2-20020a637702000000b003ab4d62b68bmr3248383pgc.452.1651325405516; 
 Sat, 30 Apr 2022 06:30:05 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:30:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 32/43] semihosting: Create semihost_sys_gettimeofday
Date: Sat, 30 Apr 2022 06:29:21 -0700
Message-Id: <20220430132932.324018-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

This syscall will be used by m68k and nios2 semihosting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h |  3 +++
 semihosting/guestfd.c         | 42 +++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index 315cac1c44..5b0ed1b472 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -89,4 +89,7 @@ void semihost_sys_stat(CPUState *cs, gdb_syscall_complete_cb complete,
                        target_ulong fname, target_ulong fname_len,
                        target_ulong addr);
 
+void semihost_sys_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
+                               target_ulong tv_addr, target_ulong tz_addr);
+
 #endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index c182d5b7e6..cb9eab9587 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -891,3 +891,45 @@ void semihost_sys_stat(CPUState *cs, gdb_syscall_complete_cb complete,
         host_stat(cs, complete, fname, fname_len, addr);
     }
 }
+
+static void gdb_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
+                             target_ulong tv_addr, target_ulong tz_addr)
+{
+    gdb_do_syscall(complete, "gettimeofday,%s,%x", tv_addr, tz_addr);
+}
+
+static void host_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
+                              target_ulong tv_addr, target_ulong tz_addr)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    struct gdb_timeval *p;
+    int64_t rt;
+
+    /* GDB fails on non-null TZ, so be consistent. */
+    if (tz_addr != 0) {
+        complete(cs, -1, EINVAL);
+        return;
+    }
+
+    p = lock_user(VERIFY_WRITE, tv_addr, sizeof(struct gdb_timeval), 0);
+    if (!p) {
+        complete(cs, -1, EFAULT);
+        return;
+    }
+
+    /* TODO: Like stat, gdb always produces big-endian results; match it. */
+    rt = g_get_real_time();
+    p->tv_sec = cpu_to_be32(rt / G_USEC_PER_SEC);
+    p->tv_usec = cpu_to_be64(rt % G_USEC_PER_SEC);
+    unlock_user(p, tv_addr, sizeof(struct gdb_timeval));
+}
+
+void semihost_sys_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
+                               target_ulong tv_addr, target_ulong tz_addr)
+{
+    if (use_gdb_syscalls()) {
+        gdb_gettimeofday(cs, complete, tv_addr, tz_addr);
+    } else {
+        host_gettimeofday(cs, complete, tv_addr, tz_addr);
+    }
+}
-- 
2.34.1


