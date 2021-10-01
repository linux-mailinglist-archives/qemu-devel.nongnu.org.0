Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D9B41F31F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:29:01 +0200 (CEST)
Received: from localhost ([::1]:60364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMLE-0006XR-2t
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4t-0004gu-Px
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:07 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:44987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4q-00050S-H1
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:07 -0400
Received: by mail-qt1-x82f.google.com with SMTP id r16so9588788qtw.11
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lavEGkgqky/ZtxbH6vUwcfGBAKCbGr33b9BznRGO5aU=;
 b=zARl9BpORiMdLKBoL9tIxF920e/AQULOqqM9vtZqXgmsIurF6AA/as5mLLVXlJ9yHg
 eTKuhftoW4epbDwDINPGSCndyrV31PM+URBPDeMmYV51pT9b1avsHkfeqCXIozUa8bd0
 +GJShsRrzuKpTknwmZW9KtiGeUUDQ3D1yN5Aa/AfX6472qzgqK14DJruB7nN18yNSUz7
 Nsgq2GIOal8MxIfScptaHQm/HPj6uZbNz4f1AHWlyIaz9rWXya6EgEEiaHSXx+ymZk7O
 SR9yUqo6nEzQ7bhK1fSqwhavoRhNfhhIG3VHA4zsPq9Dt0RdfBnFpHHQeeLW+bmwVSgt
 EXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lavEGkgqky/ZtxbH6vUwcfGBAKCbGr33b9BznRGO5aU=;
 b=Jxxtxlp8keWfT+4YKYr5rmwxlVYYx2QSQkFULT8pqET+4bVCtUZhXSgfa7CKoloqAL
 An4oHSZWHCo6A+7x9ygt4CHpswFsbbzRNKb8r5gwyGpbXKmhBBHGpP/sevawy1KpOUJi
 BRziomtmvbx+7/RgkQPBY7adoqY2n/ZQQlQrCQyoH6aa8iGUcSIMATokojbqBgGqMqVq
 6SaNt+9ksmn9iC13vtmL74ymyWv1XTu+dAiv97QbQzw4vz3RjPBHqKH1lXIC4FCFvCGB
 BDRBspO6nWf4rEUYYqLddNBhIAf03MvtAojJFzqC3pjeqwvCKPVZbgM40/8lwu9pHRQo
 duMA==
X-Gm-Message-State: AOAM532ss27jGt0Llzllg2ZpXI0VS2+cM4/ejWAERZLNCCE+bGJOlaJE
 HouLHMK409i8g7NywFgPHQtBh/nN9go8zQ==
X-Google-Smtp-Source: ABdhPJw62XuAkRyWBp5HmHG8Ga7OZi5soKt+KMF6UhB9M0+B0/e8oQWseAktDpSeoCnU9YBT6tlxqw==
X-Received: by 2002:a05:622a:130c:: with SMTP id
 v12mr14129936qtk.315.1633108321361; 
 Fri, 01 Oct 2021 10:12:01 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/41] linux-user/host/alpha: Populate host_signal.h
Date: Fri,  1 Oct 2021 13:11:19 -0400
Message-Id: <20211001171151.1739472-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/alpha/host-signal.h | 41 +++++++++++++++++++++++++++++
 accel/tcg/user-exec.c               | 31 +---------------------
 2 files changed, 42 insertions(+), 30 deletions(-)
 create mode 100644 linux-user/host/alpha/host-signal.h

diff --git a/linux-user/host/alpha/host-signal.h b/linux-user/host/alpha/host-signal.h
new file mode 100644
index 0000000000..e27704d832
--- /dev/null
+++ b/linux-user/host/alpha/host-signal.h
@@ -0,0 +1,41 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef ALPHA_HOST_SIGNAL_H
+#define ALPHA_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.sc_pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    uint32_t *pc = (uint32_t *)host_signal_pc(uc);
+    uint32_t insn = *pc;
+
+    /* XXX: need kernel patch to get write flag faster */
+    switch (insn >> 26) {
+    case 0x0d: /* stw */
+    case 0x0e: /* stb */
+    case 0x0f: /* stq_u */
+    case 0x24: /* stf */
+    case 0x25: /* stg */
+    case 0x26: /* sts */
+    case 0x27: /* stt */
+    case 0x2c: /* stl */
+    case 0x2d: /* stq */
+    case 0x2e: /* stl_c */
+    case 0x2f: /* stq_c */
+        return true;
+    }
+    return false;
+}
+
+#endif
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index e9e530e2e1..b895b5c8bd 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -255,36 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__alpha__)
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                           void *puc)
-{
-    siginfo_t *info = pinfo;
-    ucontext_t *uc = puc;
-    uint32_t *pc = uc->uc_mcontext.sc_pc;
-    uint32_t insn = *pc;
-    int is_write = 0;
-
-    /* XXX: need kernel patch to get write flag faster */
-    switch (insn >> 26) {
-    case 0x0d: /* stw */
-    case 0x0e: /* stb */
-    case 0x0f: /* stq_u */
-    case 0x24: /* stf */
-    case 0x25: /* stg */
-    case 0x26: /* sts */
-    case 0x27: /* stt */
-    case 0x2c: /* stl */
-    case 0x2d: /* stq */
-    case 0x2e: /* stl_c */
-    case 0x2f: /* stq_c */
-        is_write = 1;
-    }
-
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-#elif defined(__sparc__)
+#if defined(__sparc__)
 
 int cpu_signal_handler(int host_signum, void *pinfo,
                        void *puc)
-- 
2.25.1


