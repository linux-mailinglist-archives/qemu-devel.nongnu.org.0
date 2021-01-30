Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE95D309168
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 02:59:22 +0100 (CET)
Received: from localhost ([::1]:56868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5fXl-0007I6-TG
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 20:59:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRg-0007Kv-Mj; Fri, 29 Jan 2021 20:53:04 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRf-0000AC-8V; Fri, 29 Jan 2021 20:53:04 -0500
Received: by mail-wm1-x331.google.com with SMTP id s24so7991082wmj.0;
 Fri, 29 Jan 2021 17:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g1KU5IE9TGCZM/lU61E2LYHQF94GVZ2sjp5LehjcIJU=;
 b=mFXWLnEV2J7F5vMWemzgA7H5rDlvI6++w0fS0CrZkpYvnv+K+N3XgEO3GKqwwuaANV
 d0g2d43AkRHBIhnX13fL4uJHnEss03yuMlReAv0aU0IicAz94GcfWh5K7Snxt8N8VR2K
 m2+R3VOFvTNVyzdmxAUUMMumOrI7WSHzLPeDPs3BE1Awvg7fhIjOEoY+KbEEZ3F+6VdF
 6FPqa4w4nqQkxvEZACD/7lmP+n2g0PSuWwn57rp18al9fjHH4i5rs8wkEYgX4/S1vteX
 co1K1JfSZCh937LeyFh7KfxD9XXT2OfA3b5Ooc/YPg83R/j8K/T+OOmAzvb9jg4OXvX5
 t53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g1KU5IE9TGCZM/lU61E2LYHQF94GVZ2sjp5LehjcIJU=;
 b=pb+d6dAfGTL3/VtdGAtlkQpuOQI3CpyPIJbM35DDlrlwuKXKBLYVHIj+t89oRQCjoy
 cenJ7wCcXGD2z+Wkn24Fkc/u1Kof2A1k9SLzhpMqRwoQw4hGS49GT2mrn1yPpzGVzAna
 QJKdutcoJco4djgR1hzQv6WvjPeMyyilPKQSYkq4dQnA7uT6lSzt7+mVKTCDGkiMd9p9
 GUnD6E8elYeuDdrTyL4cwSxF8Ac/cQrnokhFbJuNOJiSjRXoo0w2XxM/mdsaKH1n8NyS
 iV7iALg7V4c0hIm0tDrme0enwsYl4i9r4jIo+qSjWX6t/nRNUQRbTFi3Z5kkXubRvtEg
 9mHg==
X-Gm-Message-State: AOAM530tFvBiK5P4W6e/mDLUROWj8XyZq1XLaMHDQOKExHOEO35xqn1Q
 xCAFkSPNDkqZgHwqkD+lv3pDXWNMs48=
X-Google-Smtp-Source: ABdhPJyA4Coz/8piVvaPk4EIcoOTmtcPznXjAqGGyUN4FELubBKdNdl58zv0jN7k1O/K2eCj4Luk0Q==
X-Received: by 2002:a1c:b78b:: with SMTP id h133mr6103963wmf.151.1611971581368; 
 Fri, 29 Jan 2021 17:53:01 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w25sm12591514wmc.42.2021.01.29.17.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:53:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/11] target/arm: Restrict ARMv7 R-profile cpus to TCG
 accel
Date: Sat, 30 Jan 2021 02:52:22 +0100
Message-Id: <20210130015227.4071332-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A KVM-only build won't be able to run R-profile cpus.

Only enable the following ARMv7 R-Profile CPUs when TCG is available:

  - Cortex-R5
  - Cortex-R5F

The following machine is no more built when TCG is disabled:

  - xlnx-zcu102          Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5Fs

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/aarch64-softmmu.mak | 1 -
 hw/arm/Kconfig                              | 7 +++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

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
index daab7081994..320428bf97e 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -11,6 +11,11 @@ config ARM_V6
     depends on TCG
     select ARM_COMPATIBLE_SEMIHOSTING
 
+config ARM_V7R
+    bool
+    depends on TCG
+    select ARM_COMPATIBLE_SEMIHOSTING
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -377,8 +382,10 @@ config STM32F405_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
+    default y if TCG
     select AHCI
     select ARM_GIC
+    select ARM_V7R
     select CADENCE
     select DDC
     select DPCD
-- 
2.26.2


