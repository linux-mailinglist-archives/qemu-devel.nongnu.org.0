Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6A52F736
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:59:58 +0200 (CEST)
Received: from localhost ([::1]:43214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDTJ-00045M-Vo
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCc8-0008Cf-BR
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:05:01 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCby-00042b-Na
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:58 -0400
Received: by mail-pl1-x631.google.com with SMTP id bh5so8560536plb.6
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bust6mppvMbdx6gzfuXbL5YS3wUCsmb4mW+3d0C8Dpw=;
 b=tnBWdMIOBpml/OZsk2CnHbv0WVbl+fOG+e4KlC1smReheAPN1bL1GPT11jmhnFCs3M
 IvDZQCoLIFW+LX6bGIbhY2AnzR2vpBJL5M8aLT5MbbRQquvHGDBGL9LEJEAJ+X8pXLK0
 XkQUwFtcCa+Ppc8jgln5J3oEojolWSwyy2ETAo+GaMp+ph0OJCd14gewruKN4b0+wUVX
 Ztg2uywNBg5LrC+qV/yQ8WjMcBYgcVx6w+psxEMYZSHD34hQM3odNjyCQR5B74qnrLFR
 XYePugXlmj+EggMfC4t4w46SjkKJ6znl09DRykPIsjTWkHqsGVG6tMpQr0EBk5+bfAnJ
 afnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bust6mppvMbdx6gzfuXbL5YS3wUCsmb4mW+3d0C8Dpw=;
 b=noVwNCQw1Dz1qg4sg087hCfluQOnJEg/Dr3D7xhZsBTQBE64ymc2bfxdzqvYPXQz3t
 l2LDG1ukKmOVRRpnj8/AYzSF2snYmHXp6sPE7ftVs1eUgFZQUq7u3QNSHAUn/o+l+hrU
 /qLEBZkhxzxaypVE2s6FLMlpIWEk9dNiU6msessaTLtwvzgOLQ1ywEo5NlyexQs1XpFl
 Y7WgesqGAoCZVqSwHafSCisUzSJETTC42C7/6f0pRWog2dDkMVLXToTcVR1Ea+ZB68ts
 xZncAK+0gGpwVKcK6McODb12/bmtxe7M87xF8aoFXehF7uuzihqDEwagOLbfMHebD+WQ
 aprQ==
X-Gm-Message-State: AOAM531pEg1o362Nyf0wjShrtLK7WJo2ff6WFt9FsU7zbPjjcNbDvymk
 fDlhT4f6cd0Dln9DkCN+srZjgbt2rCO1NA==
X-Google-Smtp-Source: ABdhPJwmjilcanHDyxerhqbVQQac9R8yWNlveoCEPrcNUZwVHHYqHrWVCb66MwPxmkGLS1rmQKcJOw==
X-Received: by 2002:a17:902:8c92:b0:161:e861:861f with SMTP id
 t18-20020a1709028c9200b00161e861861fmr7965542plo.33.1653091480761; 
 Fri, 20 May 2022 17:04:40 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 35/49] semihosting: Create semihost_sys_gettimeofday
Date: Fri, 20 May 2022 17:03:46 -0700
Message-Id: <20220521000400.454525-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
index 7bc2640512..269f750d98 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -266,6 +266,12 @@ static void gdb_system(CPUState *cs, gdb_syscall_complete_cb complete,
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
@@ -517,6 +523,32 @@ static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
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
+        complete(cs, -1, GDB_EINVAL);
+        return;
+    }
+
+    p = lock_user(VERIFY_WRITE, tv_addr, sizeof(struct gdb_timeval), 0);
+    if (!p) {
+        complete(cs, -1, GDB_EFAULT);
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
@@ -826,3 +858,13 @@ void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
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


