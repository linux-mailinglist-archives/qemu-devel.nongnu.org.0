Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58894AB6E5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:57:02 +0100 (CET)
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzpV-0004pl-CC
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:57:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyro-0005qv-5J
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:32 -0500
Received: from [2a00:1450:4864:20::32c] (port=34321
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrh-0001zC-V8
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:16 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so6873347wmb.1
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZQmsKcV4lDdhNynrPCvLrhHei6N11E8fzUtaypd1FmY=;
 b=Nb9ilO3HChfAPk20eSSSkMmxNXKFItJCwMeqRrf6Rlduf/mDpQLlzW4XizjxXmTI6P
 F1MhOFJPECjOd3ucfv90/lnhXHJes65EHa3imr6AQHiwU8mguzssn8gULLlFcYVOBZeY
 nipwN4QYz3rrwgjq++xfoqkqJWhmYlT0N/1u8Jtc3891wzE4GLrqsoXKgEJaE2vhtiXa
 ZWk4+aOfKhDXzdxovckRAcaSHXSfoAdzxjeIExy3manGmSCsnURNSYLWqOt8EAI6Um/T
 5iLcz+0UmqEsAnQmKjfr0DhKF7Sac6iU9f7HF5TA0JdoziEZIqUqB4WhL08Z+A0Ns5oj
 dntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZQmsKcV4lDdhNynrPCvLrhHei6N11E8fzUtaypd1FmY=;
 b=rAfkbFhAFsNqggKUxv8lYikRizzDCDcFXUAPfmxhEfUi2yzm0Rw3A+ZEz+kFBQpRPO
 h+a1ReJ2zRCNsTzeu1KFCcf7W8g2f5x7yruDxveyUsuarfZ9pkB+RQ4x1pU/zZWPl8/g
 NUVH+VJIp5H5jfCfvjSsCDNNTUF7TGmx89Zx/kUuXl4OfDp8joJdaQJGwQtNMU+ZjmuZ
 So2N3VDtYGHiAWogo1TnwOZNRvuzACyLEmZG+F9XzWhVYmR56dEKXVY96QihoYCL5ouS
 Rrltbrbiari8p588TRAAbkhDskRVvq35BozOaaIdcKzTT2Zf8vUKl5mc3OJcNSfvIw2A
 rthw==
X-Gm-Message-State: AOAM532gqRGpMGmJKFjGc2VAwuhUrZSRrvfLDhTvqMk1KSDXj12uQ3Md
 uzDM3h/pvpwlqFbZ/3OqmLidRIvvdWg=
X-Google-Smtp-Source: ABdhPJwJnazx6SDyGNjuQ2Tt2GJo2a9sYuCY8wDIiPs18T7OERJ/MZARQj0IY+3iUqg5JB3QtkoDZQ==
X-Received: by 2002:a7b:ce9a:: with SMTP id q26mr2766413wmj.141.1644220504587; 
 Sun, 06 Feb 2022 23:55:04 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id b15sm1421622wri.96.2022.02.06.23.55.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:55:04 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 08/21] accel/hax: Introduce CONFIG_HAX_IS_POSSIBLE
Date: Mon,  7 Feb 2022 08:54:13 +0100
Message-Id: <20220207075426.81934-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Mirror "sysemu/kvm.h" #ifdef'ry to define CONFIG_HAX_IS_POSSIBLE,
expose hax_allowed to hax_enabled() macro.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/stubs/hax-stub.c    |  2 ++
 include/sysemu/hax.h      | 18 ++++++++++++------
 target/i386/hax/hax-all.c |  7 +------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/accel/stubs/hax-stub.c b/accel/stubs/hax-stub.c
index 49077f88e3..2fe31aaa9a 100644
--- a/accel/stubs/hax-stub.c
+++ b/accel/stubs/hax-stub.c
@@ -16,6 +16,8 @@
 #include "qemu/osdep.h"
 #include "sysemu/hax.h"
 
+bool hax_allowed;
+
 int hax_sync_vcpus(void)
 {
     return 0;
diff --git a/include/sysemu/hax.h b/include/sysemu/hax.h
index 247f0661d1..bf8f99a824 100644
--- a/include/sysemu/hax.h
+++ b/include/sysemu/hax.h
@@ -25,17 +25,23 @@
 int hax_sync_vcpus(void);
 
 #ifdef NEED_CPU_H
+# ifdef CONFIG_HAX
+#  define CONFIG_HAX_IS_POSSIBLE
+# endif
+#else /* !NEED_CPU_H */
+# define CONFIG_HAX_IS_POSSIBLE
+#endif
 
-#ifdef CONFIG_HAX
+#ifdef CONFIG_HAX_IS_POSSIBLE
 
-int hax_enabled(void);
+extern bool hax_allowed;
 
-#else /* CONFIG_HAX */
+#define hax_enabled()               (hax_allowed)
 
-#define hax_enabled() (0)
+#else /* !CONFIG_HAX_IS_POSSIBLE */
 
-#endif /* CONFIG_HAX */
+#define hax_enabled()               (0)
 
-#endif /* NEED_CPU_H */
+#endif /* CONFIG_HAX_IS_POSSIBLE */
 
 #endif /* QEMU_HAX_H */
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index bf65ed6fa9..ccdcb6afab 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -49,18 +49,13 @@ const uint32_t hax_cur_version = 0x4; /* API v4: unmapping and MMIO moves */
 /* Minimum HAX kernel version */
 const uint32_t hax_min_version = 0x4; /* API v4: supports unmapping */
 
-static bool hax_allowed;
+bool hax_allowed;
 
 struct hax_state hax_global;
 
 static void hax_vcpu_sync_state(CPUArchState *env, int modified);
 static int hax_arch_get_registers(CPUArchState *env);
 
-int hax_enabled(void)
-{
-    return hax_allowed;
-}
-
 int valid_hax_tunnel_size(uint16_t size)
 {
     return size >= sizeof(struct hax_tunnel);
-- 
2.34.1


