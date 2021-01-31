Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3026309BC0
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:59:08 +0100 (CET)
Received: from localhost ([::1]:43576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6BNj-000890-OM
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BG2-0002N6-VN; Sun, 31 Jan 2021 06:51:13 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BFt-0005Wx-Ge; Sun, 31 Jan 2021 06:51:09 -0500
Received: by mail-wm1-x32b.google.com with SMTP id j18so10241371wmi.3;
 Sun, 31 Jan 2021 03:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=55M93vKE1ahVgefWyZvIGcKvoJvAwdKqopFIoeHKkkA=;
 b=freBR3tIPtKMjI2+MuKbji7ZAmhWoqg3OKGAyKpW5xTZpNL67hf8t/x55QZPJTsMKz
 yEgpK6BA74aoPJ3neWrEuMTCkKXHqYvDm8EEuhQyQq+J9Qdipr6EZ9TB9ia301pTOoz9
 vv9A7BlPEvFHTRQ3M8w0tWlUePeXhLMgnZjd3JfMdtm30/IKP2UnSGsQS5fQkz5uSsxt
 ceUquXDjHUU1rTo7hKFajd/mUnA7Mi6K/dt+TtlgJYUl86XLQH7/EFyjqFqD7mwzCzQ0
 iT9EJe0qFQ90dsHDB1V8YvULyo5X3sBy5qnHmUGWDwe8TzgD3Z9yRx6ltBfOJRZHPZow
 zY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=55M93vKE1ahVgefWyZvIGcKvoJvAwdKqopFIoeHKkkA=;
 b=QKAkMHqmtxS0LFer8WNUs6ZRqubr2D6ADtjmI4dG8AZ4dytq2r6W4DrY1SbxzbqGFG
 vUoStxzfNjZQNORlFN27J9ohRJ0/pgr5sWgepdEgIQakSZxNFSb7jpzma7jwZpbWtlG6
 hA83ehS+jPr5qQ5nF0vobPoIxz//d75dBxHp3cqgIbWc9Hpfor1bAlNBInAWvDQRIGdC
 mpe6+Re0htximF6jOe/2jyPgUQyg6GYUC2X6zY/owKk8DVXQRPUkzKNSCKgkLVHcDwGm
 nH/KVnrqJM+fDY3dJDUbe+xu1HINRNOblROuuur5r1AwN/WapI+QKWC64wqjB5WO1EMi
 mSvQ==
X-Gm-Message-State: AOAM5305l2JrM86H3YIPhEFeJXAprRmRlDiZaL8EwtwtqNQxEYxACjWM
 uItWFEP0KWSVM8xpBrxfZHEVwygK6Ow=
X-Google-Smtp-Source: ABdhPJwJ9hes8lhe7OgVqiDeXshE4pGmaMbjuBMuK73ScXw3dz3Zg0MEOl283XRP7LZaLbEaQLBqZA==
X-Received: by 2002:a1c:a406:: with SMTP id n6mr10935564wme.53.1612093858925; 
 Sun, 31 Jan 2021 03:50:58 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id u5sm18602187wmg.9.2021.01.31.03.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:50:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/11] target/arm: Restrict ARMv7 R-profile cpus to TCG
 accel
Date: Sun, 31 Jan 2021 12:50:17 +0100
Message-Id: <20210131115022.242570-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM requires the target cpu to be at least ARMv8 architecture
(support on ARMv7 has been dropped in commit 82bf7ae84ce:
"target/arm: Remove KVM support for 32-bit Arm hosts").

Beside, KVM only supports A-profile, thus won't be able to run
R-profile cpus.

Only enable the following ARMv7 R-Profile CPUs when TCG is available:

  - Cortex-R5
  - Cortex-R5F

The following machine is no more built when TCG is disabled:

  - xlnx-zcu102          Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5Fs

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/aarch64-softmmu.mak | 1 -
 hw/arm/Kconfig                              | 2 ++
 target/arm/Kconfig                          | 4 ++++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/default-configs/devices/aarch64-softmmu.mak b/default-configs/devices/aarch64-softmmu.mak
index 958b1e08e40..a4202f56817 100644
--- a/default-configs/devices/aarch64-softmmu.mak
+++ b/default-configs/devices/aarch64-softmmu.mak
@@ -3,6 +3,5 @@
 # We support all the 32 bit boards so need all their config
 include arm-softmmu.mak
 
-CONFIG_XLNX_ZYNQMP_ARM=y
 CONFIG_XLNX_VERSAL=y
 CONFIG_SBSA_REF=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 6c4bce4d637..4baf1f97694 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -360,8 +360,10 @@ config STM32F405_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
+    default y if TCG && ARM
     select AHCI
     select ARM_GIC
+    select ARM_V7R
     select CADENCE
     select DDC
     select DPCD
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index fbb7bba9018..4dc96c46520 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -18,6 +18,10 @@ config ARM_V6
     bool
     depends on TCG && ARM
 
+config ARM_V7R
+    bool
+    depends on TCG && ARM
+
 config ARM_V7M
     bool
     select PTIMER
-- 
2.26.2


