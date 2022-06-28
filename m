Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4FA55BF57
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:09:46 +0200 (CEST)
Received: from localhost ([::1]:44156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66I5-0001xa-DI
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63GM-00044C-AC
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:46 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63GK-0000Gd-GU
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:45 -0400
Received: by mail-pl1-x629.google.com with SMTP id o18so10051393plg.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M4lQss5y82kxG4apGz3RTK5qy0uFL1fGo6xWNcOCvdA=;
 b=NpwZbdKAbrfdvxQa8vRd1u8VBP7l9+5lwmnI1U5RR0yEkq9OG4x804nI5dXro9cQqm
 W+LAZ90IIDMl75rYLEoE1KwuhyWG1Bfsbu2n2M4v9i4N8hTsxi+V500LXDjFpdUGtfLK
 mnnSj7nKsmTphd48ifZ3PgsHgW2RYdl7dAkx7kpmC7VyhHxGpypDXC1O3QTVT3Fm0QVP
 Mkvej/eCQ4en65u2u84lpVlCFAlFniAzymQz6/ijDew82V0KUeXff26UXuDltQe+aSRV
 HCORIIj6MkFyKovyNkmwf2xQ6JzLosTcgEhtzFm9oekFOU9JDovDvDAY9cLoNkQJfu1g
 TIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M4lQss5y82kxG4apGz3RTK5qy0uFL1fGo6xWNcOCvdA=;
 b=nVhRvrekodqBFRHHp3VIRPe+BCpyhRkxKIrlv7/oWvf/ygf/np+8Y4B0FZUErcHvNR
 HgfeJZ+9f/YWzl9q+cM/Ea3wT9ejn/Ei78XKqNP6XYnOmIJpLsVrjVFUkVXLhjiaJpb3
 s4R0A35tW1KV1WlPOCppnp92Y4MpPvI+8hnZZ5GugnvxwN8q3WKAU0qPfr7tyTN8knfQ
 YVQe4I6+Jewtvnfw14N85TarSJ7a3L3qpN6FnWIYqCyEHhpNw6yZXcI7W/kGY2rt7Blt
 aZdbxdTVAqPCucZuy/iA1wqtl29vMRGHbBLCy8W3/fdc/2xJAnKrLnjue4lnuICRRPxD
 ucxA==
X-Gm-Message-State: AJIora8AZb/i8yZF8khnwdsCu22oISVjpmTJmYostFXOtuQ9B46uuHMr
 U1klkcm6/jA8nBheFu4JoSrEVQPnCaJbVw==
X-Google-Smtp-Source: AGRyM1sSmaWkS9IXaeBkltuT/y3JFAJ+mfqMJXH0K/IwJ7fnSBHS+8VJT5GqVhqWpeqFECtUIWsSwQ==
X-Received: by 2002:a17:902:e809:b0:16a:22dc:d23a with SMTP id
 u9-20020a170902e80900b0016a22dcd23amr1833255plg.119.1656392143560; 
 Mon, 27 Jun 2022 21:55:43 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 39/60] semihosting: Create semihost_sys_gettimeofday
Date: Tue, 28 Jun 2022 10:23:42 +0530
Message-Id: <20220628045403.508716-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
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


