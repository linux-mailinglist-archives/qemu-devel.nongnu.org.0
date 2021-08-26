Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834B13F8CFA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:27:24 +0200 (CEST)
Received: from localhost ([::1]:57456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJ9v-00050a-Il
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImq-0005ah-52
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:32 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImo-0008SD-8d
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:31 -0400
Received: by mail-wr1-x432.google.com with SMTP id u16so6173223wrn.5
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lGvmFfdtSs7YGgPJ+UvDEX8ttejeZpWGK6v4y8O9lpE=;
 b=DT/OmsOzZ0OGiNF+pcWDtxOHCi1rwcq+fmJzhV8beuyq1FrIcEOWuZirVzKE34f+fK
 BO+0yv4aulgDM4OtSFxBMcOR/PB+/i0I4LRJIf9a8pg/qCqh6Lvi/G9RFwTFXgVqroV9
 9GJvgEFUE9zrkVJdVp5IP+2V5AcRmWhecvoPjxz22kX7fbQ3aunVXQY20lIqk8+pK82v
 +WGwcCi9kbZdWtwr6EqwfdvqQLXvKOIgLEVGRAYcEsrKgUMT+43NMk5bJ9zQKbctWXEX
 SNCTNxEOKw/Vi1Uz3pNwdWuqu9yuYN/lJ7kPCz5geaUkWi7LnPBSW8YQAH7Z8ZzzROFa
 7pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lGvmFfdtSs7YGgPJ+UvDEX8ttejeZpWGK6v4y8O9lpE=;
 b=Xef9GpiyLeFvejxdWXUxlBpL7aAHYp/wbav98Eh1h1vlMXetyVZKDRVSnpmi7kfn/2
 OOCmfszQ2jsFQ14bge+6bwudpeVxR4qqvwZqKGZXVvrWf70igZztk3tTLPM4EeAR8o/w
 /T/STW5iD5J8FVw/s9/opqOaJHt5MFAKr8fe2QmS0VyqTML+4GBJfffGi3VDUtLhGTf+
 1axi/O+yBoB0H6yBCLBtRLcvk7nssbXYEmfvNaBwrVsjIi0bUbw7D8MSL6uDlQM9KWgw
 sxuHPqqw2z12PFsT8FgKUELAa7s6sbuPZf1+QzHhUoYPFWL3pFWVfLExt41qviouGfg1
 1H0Q==
X-Gm-Message-State: AOAM530ssTTED4QerAxaNIXSgw3/jAVRuSYLzqIL8g5uJTsUjC46x8YH
 6WwlGEKRX8lI1JXO8rYDXavg9wKeG4Sb1Q==
X-Google-Smtp-Source: ABdhPJy7augtv27QxHL0puOMqKnxsBzDfzH15TgOlbj/4XUiP7y+IAnZP/F0rw5DO8zq8voisRuZFA==
X-Received: by 2002:a5d:690a:: with SMTP id t10mr5368767wru.304.1629997408891; 
 Thu, 26 Aug 2021 10:03:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/37] meson.build: Define QEMU_ARCH in config-target.h
Date: Thu, 26 Aug 2021 18:02:48 +0100
Message-Id: <20210826170307.27733-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using an ifdef ladder in arch_init.c (which we then have
to manually update every time we add or remove a target
architecture), have meson.build put "#define QEMU_ARCH QEMU_ARCH_FOO"
in the config-target.h file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210730105947.28215-5-peter.maydell@linaro.org
---
 meson.build         |  2 ++
 softmmu/arch_init.c | 41 -----------------------------------------
 2 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/meson.build b/meson.build
index b3e7ec0e92d..bf637848125 100644
--- a/meson.build
+++ b/meson.build
@@ -1625,6 +1625,8 @@ foreach target : target_dirs
       config_target_data.set(k, v)
     endif
   endforeach
+  config_target_data.set('QEMU_ARCH',
+                         'QEMU_ARCH_' + config_target['TARGET_BASE_ARCH'].to_upper())
   config_target_h += {target: configure_file(output: target + '-config-target.h',
                                                configuration: config_target_data)}
 
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 91cbf883e28..8919405c7b2 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -38,45 +38,4 @@ int graphic_height = 600;
 int graphic_depth = 32;
 #endif
 
-
-#if defined(TARGET_ALPHA)
-#define QEMU_ARCH QEMU_ARCH_ALPHA
-#elif defined(TARGET_ARM)
-#define QEMU_ARCH QEMU_ARCH_ARM
-#elif defined(TARGET_CRIS)
-#define QEMU_ARCH QEMU_ARCH_CRIS
-#elif defined(TARGET_HPPA)
-#define QEMU_ARCH QEMU_ARCH_HPPA
-#elif defined(TARGET_I386)
-#define QEMU_ARCH QEMU_ARCH_I386
-#elif defined(TARGET_M68K)
-#define QEMU_ARCH QEMU_ARCH_M68K
-#elif defined(TARGET_MICROBLAZE)
-#define QEMU_ARCH QEMU_ARCH_MICROBLAZE
-#elif defined(TARGET_MIPS)
-#define QEMU_ARCH QEMU_ARCH_MIPS
-#elif defined(TARGET_NIOS2)
-#define QEMU_ARCH QEMU_ARCH_NIOS2
-#elif defined(TARGET_OPENRISC)
-#define QEMU_ARCH QEMU_ARCH_OPENRISC
-#elif defined(TARGET_PPC)
-#define QEMU_ARCH QEMU_ARCH_PPC
-#elif defined(TARGET_RISCV)
-#define QEMU_ARCH QEMU_ARCH_RISCV
-#elif defined(TARGET_RX)
-#define QEMU_ARCH QEMU_ARCH_RX
-#elif defined(TARGET_S390X)
-#define QEMU_ARCH QEMU_ARCH_S390X
-#elif defined(TARGET_SH4)
-#define QEMU_ARCH QEMU_ARCH_SH4
-#elif defined(TARGET_SPARC)
-#define QEMU_ARCH QEMU_ARCH_SPARC
-#elif defined(TARGET_TRICORE)
-#define QEMU_ARCH QEMU_ARCH_TRICORE
-#elif defined(TARGET_XTENSA)
-#define QEMU_ARCH QEMU_ARCH_XTENSA
-#elif defined(TARGET_AVR)
-#define QEMU_ARCH QEMU_ARCH_AVR
-#endif
-
 const uint32_t arch_type = QEMU_ARCH;
-- 
2.20.1


