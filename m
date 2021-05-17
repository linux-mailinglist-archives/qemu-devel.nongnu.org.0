Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8A4382B9A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:57:49 +0200 (CEST)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libsa-0006Jg-Hp
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqf-0003ca-19
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:55:49 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqd-0002pR-Fi
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:55:48 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x8so6068956wrq.9
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ALNUiIR9f1KnIIz0k1dSE1UPa7kOz9dgBqDIcEEWFkM=;
 b=sv75uBQxRceb49/L+N584zI9iqSsBxaMYo+nxqmp4mG1ub+PR392LSr9kMxWr4rxZp
 jElCbrh3A1/wqIpZA04joUK6A5ysnKx0zocUSaVFEazZSJj6klBtGwKUePbXmRjeH6QT
 Gt12hbqeMDnkOJwTVR/Sb89RCoM6fddoxOD/YBkJaz/pIzoZa1tjO/eZPgvNCXhif04a
 5BrTDDEeKBVmSEpY7sctRPDt6qtDPwrB0A9SX7uZsJq4HWDnq6OeKy8W4tmkwcbg8E5/
 3wD0rrb30Avntjxhxaaq0SE+kGCudV9iDvG2adoDr1HU1heg5ueBGG/TWtGC7w6nqrKu
 IUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ALNUiIR9f1KnIIz0k1dSE1UPa7kOz9dgBqDIcEEWFkM=;
 b=BlX8fOCdBxPpXBqQczUz3IKul5IDuYEyfC5Mf8TO4UIPDlBQPWKy0/r/PnhBnIS9NH
 CvEP/x7sAYOuVwoT2xG943TlbcdAECrPHcGwkKy1JIlPPMxaeQ4n/wbfj576mMPHlPep
 5zch0l6VhN1jIITe5WGOECDpr+j27wV59iyY8sAb6u7aEieCf1vc9qnghIYPkUPFIin8
 Qe6nsXJfMzhPQqEkQfRj4qYL+1Z4AX8c5Hx815VdwbuwcZO/DSHaiqU4ZxqXJYQTQEjB
 sqtR/myp0z0PUuzlEKF0vwTbLFzxDKtbS+N7BNP51LnYgWI3MNT9BPG4VF9uGKdvJKoj
 o5Nw==
X-Gm-Message-State: AOAM532lNGmsim4QVp34nlFXgJNGKB670pJY/oxdBz+UizAglAlqUNcK
 XWDIlTdjW4xITN4wHDur9HdAw5DHMv6gLQ==
X-Google-Smtp-Source: ABdhPJwCiJv/0v0LPkNcvYs3C6DR2V5P9kLaNr1pGRzHPiAqXP+bnir/FWuGFOa0VMHAOu1yQzTZNA==
X-Received: by 2002:a5d:6041:: with SMTP id j1mr72142092wrt.374.1621252542332; 
 Mon, 17 May 2021 04:55:42 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b62sm14554343wmc.39.2021.05.17.04.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:55:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 03/15] accel/hax: Simplify #ifdef'ry
Date: Mon, 17 May 2021 13:55:13 +0200
Message-Id: <20210517115525.1088693-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hax_enabled() is called from:

- qemu_init_board() in softmmu/vl.c
- qemu_wait_io_event() in softmmu/cpus.c
- apic_common_realize() in hw/intc/apic_common.c

By converting macros to a function, we can remove the
NEED_CPU_H dependency and build softmmu/cpus.c once
for all targets.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/hax.h      | 14 +-------------
 accel/stubs/hax-stub.c    |  5 +++++
 target/i386/hax/hax-all.c |  2 +-
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/include/sysemu/hax.h b/include/sysemu/hax.h
index 247f0661d12..bc165b23ae6 100644
--- a/include/sysemu/hax.h
+++ b/include/sysemu/hax.h
@@ -24,18 +24,6 @@
 
 int hax_sync_vcpus(void);
 
-#ifdef NEED_CPU_H
-
-#ifdef CONFIG_HAX
-
-int hax_enabled(void);
-
-#else /* CONFIG_HAX */
-
-#define hax_enabled() (0)
-
-#endif /* CONFIG_HAX */
-
-#endif /* NEED_CPU_H */
+bool hax_enabled(void);
 
 #endif /* QEMU_HAX_H */
diff --git a/accel/stubs/hax-stub.c b/accel/stubs/hax-stub.c
index 49077f88e3c..1a0370a4362 100644
--- a/accel/stubs/hax-stub.c
+++ b/accel/stubs/hax-stub.c
@@ -16,6 +16,11 @@
 #include "qemu/osdep.h"
 #include "sysemu/hax.h"
 
+bool hax_enabled(void)
+{
+    return false;
+}
+
 int hax_sync_vcpus(void)
 {
     return 0;
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index bf65ed6fa92..d99feef21d4 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -56,7 +56,7 @@ struct hax_state hax_global;
 static void hax_vcpu_sync_state(CPUArchState *env, int modified);
 static int hax_arch_get_registers(CPUArchState *env);
 
-int hax_enabled(void)
+bool hax_enabled(void)
 {
     return hax_allowed;
 }
-- 
2.26.3


