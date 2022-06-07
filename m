Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1267D541F30
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:47:52 +0200 (CEST)
Received: from localhost ([::1]:40560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhzL-0005QS-6O
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg61-0007tD-6T
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:37 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5z-0001ad-Ev
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:36 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso16489286pjg.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FnzvM/sQxHwEqBkmHkvKY5R9IWVzHt0oowSE7ql1V5E=;
 b=hJ+UBtgMIUeJC+fy/Q9v8W3bsW4grgL3DRpSiA8VPy/yJnHJYk9WPSUZU6058HzC0F
 2c6/iYnaOtEtES5zd3UOJ04Nojpvh/dJLFmqAPxKX4fV7CaH98rNyL7zBOwWelEWM/sT
 TRE3X4nBKCFN6TIY2AzFmsI0dU+9EDbyKVsPGzqJv/33wn3JQxD3UtFowjGrd8ajDz8b
 s42JCm5al7yvPSkXFh70mLACw/DQfhVxU63uUodifJwT7IuYmWwySb0D6TOAGJquwdA/
 ydHyUbH7drWMBNqA3G/jUzNK2z+j2sJ5oTm9ys9Cpj98twK9AjhG9hOVBuc6Az8Pxe2Z
 d0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnzvM/sQxHwEqBkmHkvKY5R9IWVzHt0oowSE7ql1V5E=;
 b=6KGQeMriI4QHQmMEXjXyHjlqFnvs/0vuM1dEmtUrQFhVoJAiHI5oPCQhqiPtlzrSDB
 yzcCRH6pijiMwoDUbFHFABIJKXSuhLbVVr4Zww1XC5R5Pexb5Xy0ajl5fS40m/7L65TH
 B/qICFAddHUVk5Xqxlc9FYWg86reDrO9OtwIoG9akskitaCOwT1paWEwPerq5yi40EZj
 3/dkDmv0Bn898vi7MhD0wmAGrtvITUpI5zGeGFNnuWik3pZELacEkNejFzTAvBSa+ZT4
 WEymdnbkDNyLzoqc5iZbZFLRXC32gQdIIXeGOldnxjyaV52VZeB+7n1VErNgHCSQ2/yD
 vENQ==
X-Gm-Message-State: AOAM532OqVpo3pxaUeWh30SZO5kHUnMyhyhsBOqZKKnXOgzxOH43ALWa
 /6u9IzMlV0G6Y9vjzytgzUaG6vj0po0uRA==
X-Google-Smtp-Source: ABdhPJytVuaZWIXl6HU7iqI3VU5zz7mVg/GwVs88zzfFwozF/XOWnZVpRcZBIoP+wVhTgbBIy44G4w==
X-Received: by 2002:a17:90b:4a4c:b0:1e4:dcfc:e688 with SMTP id
 lb12-20020a17090b4a4c00b001e4dcfce688mr38600499pjb.38.1654634794186; 
 Tue, 07 Jun 2022 13:46:34 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 39/53] semihosting: Create semihost_sys_gettimeofday
Date: Tue,  7 Jun 2022 13:45:43 -0700
Message-Id: <20220607204557.658541-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

This syscall will be used by m68k and nios2 semihosting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |  3 +++
 semihosting/syscalls.c         | 42 ++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index ecc97751a9..347200cb9f 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -66,4 +66,7 @@ void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
                          target_ulong cmd, target_ulong cmd_len);
 
+void semihost_sys_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
+                               target_ulong tv_addr, target_ulong tz_addr);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index d21064716d..db1e9f6cc9 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -236,6 +236,12 @@ static void gdb_system(CPUState *cs, gdb_syscall_complete_cb complete,
     gdb_do_syscall(complete, "system,%s", cmd, len);
 }
 
+static void gdb_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
+                             target_ulong tv_addr, target_ulong tz_addr)
+{
+    gdb_do_syscall(complete, "gettimeofday,%x,%x", tv_addr, tz_addr);
+}
+
 /*
  * Host semihosting syscall implementations.
  */
@@ -487,6 +493,32 @@ static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
     unlock_user(p, cmd, 0);
 }
 
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
 /*
  * Static file semihosting syscall implementations.
  */
@@ -796,3 +828,13 @@ void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
         host_system(cs, complete, cmd, cmd_len);
     }
 }
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


