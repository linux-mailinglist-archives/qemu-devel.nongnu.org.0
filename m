Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A78F518EB5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:29:03 +0200 (CEST)
Received: from localhost ([::1]:42510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlz8o-0006vL-KL
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWT-0002Gk-Bd
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:28 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWN-0003cS-DH
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:23 -0400
Received: by mail-pg1-x532.google.com with SMTP id q76so11750698pgq.10
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Bust6mppvMbdx6gzfuXbL5YS3wUCsmb4mW+3d0C8Dpw=;
 b=fALOPF3Q+6TIwbPSmDw4ZFH8+9IY+UTCec4JKD7MfyPrp/v32MqcHpDwF5Nj8/Ehfr
 jbKqksT+Zf+3BsUqk07NtiUMLJqaSNGKeezm4zE/m/3G7717CDWqDp2jxbqHWfmUx2qX
 UWvEc+aUCbY3jPNg4iXTFsBGGoATLo6Bvi0YqvLeeSynFD5tdiC6hnm/2kIYinvfQJiW
 7w0fkd7MSVyJu4d/ByhcWjdZd7tCjprcUMO2kxufaikJHpEVkOROhqpthbi4GV0uxkiW
 8zUd/yjkknFe2XNwGow1PR1EKkXANpToq3Jhot4YZ6iickOONLRrpMtyH8DWENNG/aeM
 HrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bust6mppvMbdx6gzfuXbL5YS3wUCsmb4mW+3d0C8Dpw=;
 b=lsSmmgjQx6qGIc8z6q5WTApvup3VSAJCbtP79WewGr40pHDYPj8ZY1cUeyAw2/bXMX
 k7n2oZ59vOKBBA6Xxwen+QRhrEROvR6i3aJDTrGlQ0WFNjomCBF78KYk479GudX+7kDM
 wCpieb+DaFOkuhgE+L44nxDtBO0Efw5Kj4SXjq52vIaT6J0UM9icGcwy5lcadxkPCEjB
 cPT0OP2e6e0DxUHeAy6IDZUgw8VHAMdxCXc3bUCMMvNCYDnuAcNMKq/IjcVAaSssrN3/
 0ph4hZJSR85B1WEq3FUJUeWw6369FEuaL239+FjYP6MB3/rwCHv6JbRDjkFn579GRe0e
 Ei5g==
X-Gm-Message-State: AOAM531UwpYqPsSTFZe+/upBj/p/oFV3WHJUS+m4yRACbUC0MG6WYObQ
 JBvVvHKim/b2EpyDit1zZ3DxjtGyEdBYIA==
X-Google-Smtp-Source: ABdhPJx7gqkOTIhQWOAzKNWCjQGwOl59k/JbOkTK60eNUryuBgOZQ/pK7gya38y81FHMzdl0BI7pRw==
X-Received: by 2002:a63:1113:0:b0:3ab:a3fc:1d8 with SMTP id
 g19-20020a631113000000b003aba3fc01d8mr15121040pgl.450.1651607358046; 
 Tue, 03 May 2022 12:49:18 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/74] semihosting: Create semihost_sys_gettimeofday
Date: Tue,  3 May 2022 12:48:02 -0700
Message-Id: <20220503194843.1379101-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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


