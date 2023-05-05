Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C396F8646
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:55:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxke-0003Kh-Gh; Fri, 05 May 2023 11:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxkc-0003Ip-Pn
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:42 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxka-0008D0-Cg
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2fc3f1d6f8cso1328984f8f.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683302018; x=1685894018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PwmylO98fPza1KeBnyuNGb07zbktOjohayPxUd8NRjw=;
 b=kMqBJ3aSoK2JxBpKeOyv8zl5TZ/s89D8yIWkyV/7Gj8Joy8/7udTywJ/6BuoOtplBE
 fBh6sFwLEHIASImZpRW/WGILjtDdAJIsN4+Htv8UMDAcubxZavlDAQ4EK9gOr9mbUu4+
 OsihSwDk1TiOaTEJhK6uy9yH5nGqmTGPlC7i+ugvDSCJ5ePhZQ3HtupqsAph2/CB2Fsg
 bx4XakNzfv3I8kt7lXWPHNctkW6IR5kaFnc+FLmjxJyKvHzF6W0tMT8IJdCGIYWtPtEz
 +sXmV2fAoDpMZI52lA8KEHSlTR7mqIkytAgEJ73NEBosuZyF99mNfpF+HqvYn+KTBDKo
 Jb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683302018; x=1685894018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PwmylO98fPza1KeBnyuNGb07zbktOjohayPxUd8NRjw=;
 b=RkpTY7Rs7oT8iDsxX+Si/6eZJ7+4emM06QXyZoAPNxLrMrX5Bv47IXGNeiJZfzwZBd
 xj7RAy2+jKh2RnDlZY4kt/LBP1CiBOsnOTNoTHg5NZrdvlHBceaoLydubABe1SXxbVA4
 9kx04NuxZ27X9n9t5FV2KEeBxqi1wvaO04AJ+zeVfvjfuMAr7zlzSJ0WzFRbu7RgyjKX
 sXnMgd7nS+DI6faOY0iYpeD/k19C+3O0WoIUYdJESUaYujC9dy6K2ovR+eGIbcNXbSl5
 IzLmrYW4dswHtzsWUWEPHK/GN33kOViZHuPAasqhVCuxdeoe3MUkEpttGLNtDRgX2vVC
 p5Fg==
X-Gm-Message-State: AC+VfDz9Cfkdz5WkG5k5w0Kj15d1vOjCf+dQzicx6CIFTZgbD/TAw7Ki
 VGd3Ujv9a26WwsAhgrDXbLg+Eg==
X-Google-Smtp-Source: ACHHUZ57QLeaBu8yF4X/f72MbTtMJuOUGY5sy0WbA8TCAV7O8ZXRfERTsRUKjGQ1oER7FvlWM4tVlw==
X-Received: by 2002:adf:df0c:0:b0:307:5912:789 with SMTP id
 y12-20020adfdf0c000000b0030759120789mr1662967wrl.66.1683302018030; 
 Fri, 05 May 2023 08:53:38 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x7-20020adfffc7000000b002c7066a6f77sm2785851wrs.31.2023.05.05.08.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 08:53:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A5A211FFBC;
 Fri,  5 May 2023 16:53:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <michael.roth@amd.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 01/10] *-user: remove the guest_user_syscall tracepoints
Date: Fri,  5 May 2023 16:53:27 +0100
Message-Id: <20230505155336.137393-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230505155336.137393-1-alex.bennee@linaro.org>
References: <20230505155336.137393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is pure duplication now. Both bsd-user and linux-user have
builtin strace support and we can also track syscalls via the plugins
system.

Message-Id: <20230420150009.1675181-2-alex.bennee@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230503091756.1453057-2-alex.bennee@linaro.org>
---
 include/user/syscall-trace.h  |  4 ----
 bsd-user/freebsd/os-syscall.c |  2 --
 trace-events                  | 19 -------------------
 3 files changed, 25 deletions(-)

diff --git a/include/user/syscall-trace.h b/include/user/syscall-trace.h
index 90bda7631c..557f881a79 100644
--- a/include/user/syscall-trace.h
+++ b/include/user/syscall-trace.h
@@ -26,9 +26,6 @@ static inline void record_syscall_start(void *cpu, int num,
                                         abi_long arg5, abi_long arg6,
                                         abi_long arg7, abi_long arg8)
 {
-    trace_guest_user_syscall(cpu, num,
-                             arg1, arg2, arg3, arg4,
-                             arg5, arg6, arg7, arg8);
     qemu_plugin_vcpu_syscall(cpu, num,
                              arg1, arg2, arg3, arg4,
                              arg5, arg6, arg7, arg8);
@@ -36,7 +33,6 @@ static inline void record_syscall_start(void *cpu, int num,
 
 static inline void record_syscall_return(void *cpu, int num, abi_long ret)
 {
-    trace_guest_user_syscall_ret(cpu, num, ret);
     qemu_plugin_vcpu_syscall_ret(cpu, num, ret);
 }
 
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index c8f998ecec..b0ae43766f 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -531,7 +531,6 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     CPUState *cpu = env_cpu(cpu_env);
     abi_long ret;
 
-    trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
     if (do_strace) {
         print_freebsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
     }
@@ -541,7 +540,6 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     if (do_strace) {
         print_freebsd_syscall_ret(num, ret);
     }
-    trace_guest_user_syscall_ret(cpu, num, ret);
 
     return ret;
 }
diff --git a/trace-events b/trace-events
index b6b84b175e..691c3533e4 100644
--- a/trace-events
+++ b/trace-events
@@ -85,22 +85,3 @@ vcpu guest_cpu_exit(void)
 # Targets: all
 vcpu guest_cpu_reset(void)
 
-# include/user/syscall-trace.h
-
-# @num: System call number.
-# @arg*: System call argument value.
-#
-# Start executing a guest system call in syscall emulation mode.
-#
-# Mode: user
-# Targets: TCG(all)
-vcpu guest_user_syscall(uint64_t num, uint64_t arg1, uint64_t arg2, uint64_t arg3, uint64_t arg4, uint64_t arg5, uint64_t arg6, uint64_t arg7, uint64_t arg8) "num=0x%016"PRIx64" arg1=0x%016"PRIx64" arg2=0x%016"PRIx64" arg3=0x%016"PRIx64" arg4=0x%016"PRIx64" arg5=0x%016"PRIx64" arg6=0x%016"PRIx64" arg7=0x%016"PRIx64" arg8=0x%016"PRIx64
-
-# @num: System call number.
-# @ret: System call result value.
-#
-# Finish executing a guest system call in syscall emulation mode.
-#
-# Mode: user
-# Targets: TCG(all)
-vcpu guest_user_syscall_ret(uint64_t num, uint64_t ret) "num=0x%016"PRIx64" ret=0x%016"PRIx64
-- 
2.39.2


