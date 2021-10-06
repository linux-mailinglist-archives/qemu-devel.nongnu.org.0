Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADC242442A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:29:01 +0200 (CEST)
Received: from localhost ([::1]:51252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAiy-0007M5-Ev
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdY-0007B0-GN
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:24 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdT-0007zX-DM
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:22 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 oa6-20020a17090b1bc600b0019ffc4b9c51so4899041pjb.2
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eJ+wJefCdMJmIu/RwRl7kn50pASE45sQkJpM6CsJn0E=;
 b=aw3o5OlcE/QkPV710bqC5hS3BnQqpwJYVVF15QFTFhGhCXHJNE3p4JeGI3aMTUu8O/
 kmiDg8ZlOiGw5vrmPya+dm32kyDye3XNv/UDiOOj/Fe/Krsp7f+yPoTgGOk3iTgQdZD/
 YGIk/zcI57tsz2CZn8U+0/6TgVzi0S3tL92YigwsJdOMuhAPVBsHyk6P4ZPvEH2OY8hk
 XelBWTMBzQpkX0waI52Vj1MB3EmRX0v6TV0kouoy8me3qBtdbmr7HPnJFaAqAJv7BhSE
 0MmnE6NGpKMIJu8MgohJhE1w8SJf0ingm2+N8gHwfynRsw5exxkwtId193t2sXEFBB/A
 0V3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eJ+wJefCdMJmIu/RwRl7kn50pASE45sQkJpM6CsJn0E=;
 b=rC0hN8pIGkpdPBzlwuZNbqfOt2IaiCOIP3Pop3BQW2Or40uGScAr+MZVENfsVIKvvY
 HToOG7KjfserbBJH25sbGsDpAq9w79sSwzmTeNMyBJD1tbUHDFynGdQHyavPRyH7Pt3q
 fQljYjxqxY76B4D3nm5ygJ6IKRGNgseYZYtqOLjXKm7jpSGKhCV0baOkph3OFMJtaUlo
 dTJUBrItYX9KSjxa31vr1gpVSPpGOIJoEDx3UmY/xyCors3CWNvRxwnPIk16Q58mX4V/
 Lk2dpn4iK36Q4ppckADAr5HKqS0ko09CdHVCJB8wpanx5uIi2+cim2IVMAqxu08Pv67+
 4dxw==
X-Gm-Message-State: AOAM533XYlJGG384OTXXOlnw4RmORqv0d67CYRypkPqZ2rVt5infKwpN
 z1wsJ5rA2peFxfSjb2tQ/J+JAI2K3pmEHw==
X-Google-Smtp-Source: ABdhPJxMWYTHRhNj1jSR/28OADgUG285617d3Gr7ps/nwNlWK9nP6ZmXMzhUcC5Vcez/5AKd9tG/Yg==
X-Received: by 2002:a17:90a:f287:: with SMTP id
 fs7mr12584839pjb.98.1633540996033; 
 Wed, 06 Oct 2021 10:23:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/41] linux-user/host/alpha: Populate host_signal.h
Date: Wed,  6 Oct 2021 10:22:35 -0700
Message-Id: <20211006172307.780893-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
index 49f9292ab3..efc0239007 100644
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


