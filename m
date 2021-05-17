Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A70382AB0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:15:25 +0200 (CEST)
Received: from localhost ([::1]:36116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libDY-0003Hh-Oe
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lib9e-0003IW-4N
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:22 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lib9c-0000FQ-Cw
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id y14so3848533wrm.13
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qLQOffQ56ChDwPDQFXqHDh81gYGsb+M4QlmmpdLP3i4=;
 b=Vo5Vt2dbdbXNYc9WMveoBlJmneNxjKtdXnDRcE377/DACZhD5x5z7GpXtZ9hL6yHDh
 wOTD6h1MfBWrIBX8+VMAKyPQ3II+u1n4+z3ZSLY+M9pZgotdYqDKnYiaLFAuC5s+aKzb
 kfO5Fe8cN6tKIuzwFKg8MPuUbpsFEhjZlMBgzQShhoT59acuVdJk6TXARZjc+NVezTmH
 0YUerYK7wkoEJaMVzZ/pvgMTDWLPaFBBg7UY7gZlUJtr+eH4SFd9mLogiZLgtyxs7nsE
 L5SvgVnqM5+RFr94bPrCso+gVNwknp8P3DxOX2EvbNgXWLdQdix/FHXgD9zMmoKwJGXJ
 nM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qLQOffQ56ChDwPDQFXqHDh81gYGsb+M4QlmmpdLP3i4=;
 b=baKFi4kEgnSEScHI+Sw+CSaRePkjpBuDv5qqWrfLs1MN3tNqVmxOMaRReK8QZiaRL4
 Gpkc5C5KQBUF3sUVf8ee1NIYWYX1t7YdmD5TP+VLwpu3Qf3AcCm8ZxFRcGieG6I5iJso
 MV77761+Gncv3qdbAZyHgPH8DD6/3gGFAPEPRGAU5LOgBXDX1CqX61llITCuUe2cnGWd
 Ou2AMMvwrsNubJXFsETovMVgnUNELdaYDjGT0pgkrWzWe7XGIgUUKLoC2rZkpummEt9i
 ti1cpzykHiFX2/XrMoPKUm8Dct0y/BNq3JinTEeaj4HrdEud9yjK9LjOsw40l5WfExYV
 FEMA==
X-Gm-Message-State: AOAM532tVkv/IF9uvHxSlKD/wDsddUZvstbRZhRvWKwSk00lLGRqd+LB
 2uv33ZFxm0ca4gRbbGxGWHGbSxUmJnauVw==
X-Google-Smtp-Source: ABdhPJw4RMM9/56YpVLS5fJwZEI6nXt4KzjwQ1kgrkiXBYV2RczYV3F6N/AL8g0IQXpbIiMSZI4XkA==
X-Received: by 2002:a5d:650b:: with SMTP id x11mr38157311wru.186.1621249878899; 
 Mon, 17 May 2021 04:11:18 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x13sm6986619wro.31.2021.05.17.04.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:11:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] NOTFORMERGE target/arm: Restrict KVM files to softmmu
Date: Mon, 17 May 2021 13:11:01 +0200
Message-Id: <20210517111111.1068153-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517111111.1068153-1-f4bug@amsat.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following patches require the "arm cleanup experiment for
kvm-only build" [*] series with split various user/sysemu and
tcg/kvm code from the target/arm/ directory.

To be able to build the following patches waiting the series
get merged, simply restrict the KVM files to the softmmu source
set.

[*] https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02908.html

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c       | 2 +-
 target/arm/cpu64.c     | 2 +-
 target/arm/meson.build | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f29649ecba7..e443cfb3d96 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -35,10 +35,10 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
 #include "hw/boards.h"
+#include "kvm_arm.h"
 #endif
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
-#include "kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c..08fba3ec29a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -27,9 +27,9 @@
 #include "qemu/module.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
+#include "kvm_arm.h"
 #endif
 #include "sysemu/kvm.h"
-#include "kvm_arm.h"
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
 
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 09802ba1a17..6143e736079 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -35,8 +35,6 @@
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
-
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c',
@@ -49,6 +47,8 @@
 
 arm_softmmu_ss = ss.source_set()
 
+arm_softmmu_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
+
 arm_softmmu_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'mte_helper.c',
 ))
-- 
2.26.3


