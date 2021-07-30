Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D03DB789
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 13:03:24 +0200 (CEST)
Received: from localhost ([::1]:34982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9QIV-0003B2-QY
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 07:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QFA-0008Tn-6m
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:56 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QF8-0002Wc-Hd
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q3so10852859wrx.0
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 03:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RsHqQzhMnNyF8S9+GK7laO6hiG/HlpjDGIbIoWLeMbg=;
 b=K0ObMVVOQq03E9p/YE2RRhfwHHxjOsf1Ug8jzdm4jKxPAJbB4kIEkPPUZ0pqLNBeAV
 gmZ1XBiPbo6zWnNh+ttMsie/lugtuhd9WwkU3OfJCJSzXVnmDN+SjOgJcKZKq6f7BHjK
 gqFPTyaVnWHiR7196osu1ZFHN4s2ym5ss+KQgZRcuX8pYTr8cxm46XhCS1PnDX3GFvhJ
 fzbtROtLHqES6Aa2/O9eJsdkjjntwhTZMBXZinU2T0USp7Nzs0cQI+513otxiSja9ier
 97qPRsIvSWTNg1mTRY3qNqWEBuZBpe9o61uWbABJrf7YOe/plhr8L/1EtBITi3I/ld5A
 XS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RsHqQzhMnNyF8S9+GK7laO6hiG/HlpjDGIbIoWLeMbg=;
 b=U0Po7fHWhdAqORkPmz78lsBuE8tDRRGSPQcW434iXWWSNfTagDa+8bKEKOwHWoDh9x
 T9ox2uRbfWllt8TsptA9thFX/bWEsGJlwTpDCXbLLd1gecUSjlqZCd2CjLyRVUoHsm+I
 2DUyUzil7NpD0uu19fn1b916ah4hIOSLnVkakzkwlNG6F0vm6XNmTaqZ4tTFFDHjf42w
 MQzI8y8HMxboczTvLbfIB0unTy2hs280NggWfgxG2bPJsLEEPbSXErzbL5VcE1zG5l8s
 FbROBnfqfSQcD/76DYKw0gfBybrDeBhJgzr3g0kCNQnuAEp+WlnnU7vCssHCnhtjGxnU
 Ns6Q==
X-Gm-Message-State: AOAM5338kAjDGcScEMjL0+IPCg9uiMGw6P0RtaQhMTPdwtYKPtwXhgTt
 prOsDLRMm+6B7PCV/gK+sBiaGYcbrmUdfg==
X-Google-Smtp-Source: ABdhPJyZ5jaGSfTR84omXADOkntoXSzdkxcRWacjkro1fHB0WrePbEkrJbQcTy6ZHEcgerJUHOiB8w==
X-Received: by 2002:a05:6000:1625:: with SMTP id
 v5mr2395194wrb.80.1627642793254; 
 Fri, 30 Jul 2021 03:59:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p2sm1349697wrr.21.2021.07.30.03.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 03:59:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 4/8] meson.build: Define QEMU_ARCH in config-target.h
Date: Fri, 30 Jul 2021 11:59:43 +0100
Message-Id: <20210730105947.28215-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210730105947.28215-1-peter.maydell@linaro.org>
References: <20210730105947.28215-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using an ifdef ladder in arch_init.c (which we then have
to manually update every time we add or remove a target
architecture), have meson.build put "#define QEMU_ARCH QEMU_ARCH_FOO"
in the config-target.h file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 meson.build         |  2 ++
 softmmu/arch_init.c | 41 -----------------------------------------
 2 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/meson.build b/meson.build
index f2e148eaf98..861965c286b 100644
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


