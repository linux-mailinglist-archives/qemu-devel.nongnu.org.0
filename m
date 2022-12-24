Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A0C655BDB
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:01:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOU-0002I3-Mo; Sat, 24 Dec 2022 18:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOR-0002H7-CJ
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:31 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOO-0006Gm-Cd
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:31 -0500
Received: by mail-pj1-x1034.google.com with SMTP id o2so2441876pjh.4
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xe4xTZh/olelEWsm0lJjRBAP0V+vxyo3x0yWKfVII3Q=;
 b=h1kVdroJSwJIV1AkSI6veOISP63t/B3O6U+UC34DFd91+tzVC//v3p2V8TaqP3Z/4c
 r0N2qoPZ3IDmO2LtlvQlLoBVb7UYj4fj5s6lXHiFWaIOShO47cdA5tUVv21vzbThPIKQ
 GgCtDhGBUDh8Fz/0aoCBaAkEFSZ1LhGVZWxlz3cQj4xTe5iTEiUxBL0d1nNEM/AdemF5
 yzI0BQ0fexEUaJs0EqpBR3VuSIPQk+cb+h82ZzYYRsQy3gPKt3UzHU+SLyY5nqkxG9XG
 TLLRKuUNwJPlGk5JB2Cdv/QFwTbpdomI4X815DKe4b5sDsWyuqBMXxaZzuyyD+gfZWbi
 /EAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xe4xTZh/olelEWsm0lJjRBAP0V+vxyo3x0yWKfVII3Q=;
 b=Ye9hnPCpjVn/ezpr+2TBBPc/tyKFOsnyadcNKSDBPa577oqoHkDJRYEhBnuM2IdEUm
 Kq9oZL/IBs6AwqnoTwx/ZVtFAVfdvI6lxoYZ2zXj5UWvHg9AZV7NnoxKIyxyBYLnxU1D
 0UDcKQAaycw2Ii78ZP8ISP6aFyJuuZM9BcOlqO2q0wdF2NFB9sFBjHALDtuaDU6Nldm3
 dCm0GYeptwmt22cAvYtBIM95xPuWH+fNGwQkQ6dtPVhEPMF1kgWGP9q5l0jhfJqHcrFh
 gnewrYVTWr4k7EfY2hFtFs3DNwzFQjn7lCmzt9YZhaHhPyLekr8U1F22QhCrMNOMPhsf
 M0PQ==
X-Gm-Message-State: AFqh2krb+Fx1x6ElCUKtncxHde7QUmgp/sHqNhzaqss1CtxnM196ERib
 ryr04ZdcASGoeLoK3SpEqlkWjqze0HgOTtyD
X-Google-Smtp-Source: AMrXdXulksGFpUslGV/+uQSB3c/U7uz2kWX02TfRH9wTjtuPa3qnMK9uWD00oBWiugp5zwndgQ7xGA==
X-Received: by 2002:a17:902:aa86:b0:188:f5de:891f with SMTP id
 d6-20020a170902aa8600b00188f5de891fmr31864662plr.11.1671926246973; 
 Sat, 24 Dec 2022 15:57:26 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 05/43] qemu/main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD
Date: Sat, 24 Dec 2022 15:56:42 -0800
Message-Id: <20221224235720.842093-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Create a wrapper for locking/unlocking the iothread lock.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/main-loop.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 3c9a9a982d..c25f390696 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -343,6 +343,35 @@ void qemu_mutex_lock_iothread_impl(const char *file, int line);
  */
 void qemu_mutex_unlock_iothread(void);
 
+/**
+ * QEMU_IOTHREAD_LOCK_GUARD
+ *
+ * Wrap a block of code in a conditional qemu_mutex_{lock,unlock}_iothread.
+ */
+typedef struct IOThreadLockAuto IOThreadLockAuto;
+
+static inline IOThreadLockAuto *qemu_iothread_auto_lock(const char *file,
+                                                        int line)
+{
+    if (qemu_mutex_iothread_locked()) {
+        return NULL;
+    }
+    qemu_mutex_lock_iothread_impl(file, line);
+    /* Anything non-NULL causes the cleanup function to be called */
+    return (IOThreadLockAuto *)(uintptr_t)1;
+}
+
+static inline void qemu_iothread_auto_unlock(IOThreadLockAuto *l)
+{
+    qemu_mutex_unlock_iothread();
+}
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(IOThreadLockAuto, qemu_iothread_auto_unlock)
+
+#define QEMU_IOTHREAD_LOCK_GUARD() \
+    g_autoptr(IOThreadLockAuto) _iothread_lock_auto __attribute__((unused)) \
+        = qemu_iothread_auto_lock(__FILE__, __LINE__)
+
 /*
  * qemu_cond_wait_iothread: Wait on condition for the main loop mutex
  *
-- 
2.34.1


