Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A1D36DE1A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:20:36 +0200 (CEST)
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnrX-0007Du-In
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncv-0008HL-Fd
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:29 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbnct-00068v-T1
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:29 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x7so63794462wrw.10
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sZBW30FOGnAuhkbH2UFK9YLL45nz87Al8a/KOWE0Q44=;
 b=dvtzMWZ4MZslUc0oVHLASB1hI6oxKmEL/3NHLMUaELU50dD2xIjub/dASUQNH1lTJ7
 lWS19v8TWpKYSb6dDNSyjKcGMGWGtJA91/HDnQ4EITl8jbvMvP2j+ZNgU0/AwVCXYI9u
 u3CJw4JP94g/POe9t5pjf0iS1yuAWEuZA8pRTpBlQ4hyU/oA95oiwKcA6sQpM4+/Nu50
 mWR+AZXhwQR9H+mB7LowQtFc0it8HQJw28roggkQECO1cHuN8pLsOBRSZFcESa6zGNl+
 qizYFrdnv2qrh6AZD18jrr8NBARCqhR9S8thAZwgy4KHtCxo6mz2O8eWhiKlt8t2IjG/
 3tpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sZBW30FOGnAuhkbH2UFK9YLL45nz87Al8a/KOWE0Q44=;
 b=BDNmpqK82zBGqvgPj04521g/xIFbwXsYoiMULMGxAHTM9crxfSHFOVGJRMg78beRR4
 VNPJdg9lrQAogswFKe+PyDS7+mj8m7QtQKgDxd1QCpKTAtAj64uWujlH3Jr8PjVZvJuo
 MRw6v2rhTRvdoiO3E4ez+S4KMkeVbt4GXl6IwicmhKnTCHxMB3HwbB38R9wg0g9RhRSX
 YeNt7kkSZ6qULUC4wkvfZQLfqg8QA3zptdzpHTPnV5mpuJhqUWidbEzJ0QMtw11Kn83X
 cKqcPWJ8iwQvG8pSn5uDjQZyFfVxfj2WaqOQP6vLiMR3vgbxlqK3yHa3q80jh1nLMcmD
 +Thg==
X-Gm-Message-State: AOAM533BXKYWBB8A5/BRumMkMfDSpbEkkA3oVU9sk/sKLQqpIzl9Wbiq
 CxuwkdgM4AoR3FZ+0stVGHw2C0+/Ex5BEQ==
X-Google-Smtp-Source: ABdhPJxyxD6fDOXcltF3ejLDUKYOIiCjYjakrmwZ7crNXSDOO1z7EHYsmLxgqHVePVdPVDRosV8dpQ==
X-Received: by 2002:adf:e40c:: with SMTP id g12mr825079wrm.11.1619629526292;
 Wed, 28 Apr 2021 10:05:26 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t206sm382523wmb.11.2021.04.28.10.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:05:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/30] meson: Introduce meson_user_arch source set for
 arch-specific user-mode
Date: Wed, 28 Apr 2021 19:03:51 +0200
Message-Id: <20210428170410.479308-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to the 'target_softmmu_arch' source set which allows
to restrict target-specific sources to system emulation, add
the equivalent 'target_user_arch' set for user emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meson.build b/meson.build
index d8bb1ec5aa9..1ffdc9e6c4e 100644
--- a/meson.build
+++ b/meson.build
@@ -1751,6 +1751,7 @@
 hw_arch = {}
 target_arch = {}
 target_softmmu_arch = {}
+target_user_arch = {}
 
 ###############
 # Trace files #
@@ -2168,6 +2169,11 @@
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
     qemu_target_name = 'qemu-' + target_name
+    if arch in target_user_arch
+      t = target_user_arch[arch].apply(config_target, strict: false)
+      arch_srcs += t.sources()
+      arch_deps += t.dependencies()
+    endif
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
       target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
-- 
2.26.3


