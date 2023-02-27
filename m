Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F616A41D7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:41:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcno-00043w-42; Mon, 27 Feb 2023 07:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcnR-0003Xv-2k
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:40:09 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcnJ-0001Hg-3Z
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:39:59 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so3723036wmi.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFJBWkOMCsiWl7Sxau1Mv58g5Ilkt0suSW8cPE3/PLs=;
 b=cNGP6sJvClcEUgzWLGADREdbHRTWuJw1n6++9Rkz0XjoVbC/Wir9JVIGM3bIB+0XS4
 XVBfLoKDHQJfgws2IrUVtWHQxWKf/a+ye3dc2ClxrTSaOrYKkdE34isYVUjOHWQgoVzq
 BaDZoIJNkKZ0T+2KiXwufkLk91PmMqSlYeqb4/mz1c/DyccCuGJ4SvW55zg6Hm1ZeSVc
 MCXa2bugLj/0QP8kE+/0wziOThXZEfrP5bEICs66cnJPXqsnDIILAhH5ort4UB+SsbsC
 KMYZn7T7Yf+BdzLlX86ysScXUshPzlAHbLCZ7sO5g8RUozRxFn9UDLnvep+vfzHQYrpk
 P1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XFJBWkOMCsiWl7Sxau1Mv58g5Ilkt0suSW8cPE3/PLs=;
 b=67f+Da8J3mOF8NVGgqy9tPdDXfrj2OzpUuQI5QZcetonDT2YKQdd/ISWjOv3RKKDES
 rWqpah9TcXXzov4hfXU5cohixubuWHRRWrnc36F2GVjQdx/mgloLimPfMTV3vxo5DUOG
 vMkI4SV12qiZJSxhwPcyyIp0WNw4vvOT+YYnZx5Ap2oT7XqECPi4P+OopYOvshQV9Won
 dXqIAe3JDm0gh0i6tDoj9UFtRYhv/rcaa1MOxRNeHp+7wKmP2pY1tAUqZh5zD30f89aL
 Dy38E0pcxR6ujTzmwzWo0lJq+l1WVL6C4jcJGcrg3dzldiH+RmKZ8q9aKEuQjzBBpuOP
 fs7Q==
X-Gm-Message-State: AO0yUKWE6n0NQlKvwPKZrWB7oNtsmdtkGRjgivvakQ2sKW7jUS+MG20T
 +7kXKWruwUs/x2OuxQPp10TsFLL1GbQJ97ia
X-Google-Smtp-Source: AK7set+/6V/F10htiQnpCdWf32wUZfjsTcx/BMWr9pafTj3UHKo01tgUqxmFxDr+U/HiIifvAawO6w==
X-Received: by 2002:a05:600c:2183:b0:3ea:edd7:1f24 with SMTP id
 e3-20020a05600c218300b003eaedd71f24mr9386014wme.39.1677501590651; 
 Mon, 27 Feb 2023 04:39:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a1ced01000000b003ea57808179sm12317016wmh.38.2023.02.27.04.39.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 04:39:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 009/123] target/i386: Remove x86_cpu_dump_local_apic_state()
 dead stub
Date: Mon, 27 Feb 2023 13:36:53 +0100
Message-Id: <20230227123847.27110-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227123847.27110-1-philmd@linaro.org>
References: <20230227123847.27110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

x86_cpu_dump_local_apic_state() is called from monitor.c which
is only compiled for system emulation since commit bf95728400
("monitor: remove target-specific code from monitor.c").

Interestingly this stub was added few weeks later in commit
1f871d49e3 ("hmp: added local apic dump state") and was not
necessary by that time.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221216220158.6317-5-philmd@linaro.org>
---
 target/i386/cpu-dump.c | 5 +----
 target/i386/cpu.h      | 4 ++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
index 08ac957e99..40697064d9 100644
--- a/target/i386/cpu-dump.c
+++ b/target/i386/cpu-dump.c
@@ -335,10 +335,7 @@ void x86_cpu_dump_local_apic_state(CPUState *cs, int flags)
     }
     qemu_printf(" PPR 0x%02x\n", apic_get_ppr(s));
 }
-#else
-void x86_cpu_dump_local_apic_state(CPUState *cs, int flags)
-{
-}
+
 #endif /* !CONFIG_USER_ONLY */
 
 #define DUMP_CODE_BYTES_TOTAL    50
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9824b7f8f2..32d048f326 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2355,12 +2355,16 @@ typedef int X86CPUVersion;
  */
 void x86_cpu_set_default_version(X86CPUVersion version);
 
+#ifndef CONFIG_USER_ONLY
+
 #define APIC_DEFAULT_ADDRESS 0xfee00000
 #define APIC_SPACE_SIZE      0x100000
 
 /* cpu-dump.c */
 void x86_cpu_dump_local_apic_state(CPUState *cs, int flags);
 
+#endif
+
 /* cpu.c */
 bool cpu_is_bsp(X86CPU *cpu);
 
-- 
2.38.1


