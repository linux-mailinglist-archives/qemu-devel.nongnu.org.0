Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C173330915C
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 02:54:36 +0100 (CET)
Received: from localhost ([::1]:39744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5fT9-0000CK-PS
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 20:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRR-0006kF-4L; Fri, 29 Jan 2021 20:52:49 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRP-00004w-Lz; Fri, 29 Jan 2021 20:52:48 -0500
Received: by mail-wm1-x332.google.com with SMTP id i9so8542671wmq.1;
 Fri, 29 Jan 2021 17:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vcCVSF3XdYkCqqZi7utKwViQKx4YjOvtKjolDPxsZVA=;
 b=uuOQE2bVc/AXhQEPhQ6gdsToWOMtR7/LcnPqZ5MlFP7kxA9NkXZRlPLIuIGcDAICaH
 ssfdEX74NQKHWvbMKF1O0arKgDrgBDsd8FqdoI/5wNZzzclE5eRj9Kpm6bGoGr5+cZdI
 Jg5zG6cmCMmNVfGLW3zUisi7sd7SUqp60e7Hpum16Q1olADlzRwBFv2K8f8X18j8D47y
 58iyx4+nB5prF66v4obJKkL3bwkP1u0ZTkyuBYVj1LfX8505z2oyoDPPp1zNI+EnKisD
 o5O/sJHYTlK/TxPX7i+7nbbtSy/f7B6U9/cTk8WL2l7kXtk/9VzZhNismcBX99UrM8es
 TVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vcCVSF3XdYkCqqZi7utKwViQKx4YjOvtKjolDPxsZVA=;
 b=Zg3uu+5myc/fzr0l3DUaSSXqKCmUpKOo/SP0fSmKqERsvAokR6t5n/4MMMy5SbdifA
 cBLAXANY9/GW22eV9kjO7ONITjfUx7jQbTTF0aPIgFfpKob7PLDDBSGW8dqxG75kH2ia
 lQAX6Hx4CT1XjRfvSsUEtT8CXX0cPvhiKny+BzX6onie081N4tKNA6S6KDQcdOuGHJiQ
 NZeTUVnxJxFHSOmS/HnXKVrw+OHyGlfzxxEp41y2tfzszStST+2HGGoTKRXcEgWHnhex
 o9udw+/RJSp/S4RNUrOQr/lziCLtWjW5NXXwi27lQ+LrJIzT+8+Tb5TrNV/Ruds2xUl/
 F9aA==
X-Gm-Message-State: AOAM532GiD3YO8F5SOqLUV6d5VnVcqTmNX3bGqziazM2O8gNlVZWJ/r/
 efQC7yGq4kCVJT8IzAAEytdYPbpKuXI=
X-Google-Smtp-Source: ABdhPJxjjNgvntexhnAMkjHR5dHZDBe4a6Ehpw1OZ8B2xG9qLvuQMF7WDg1InhxkhCshzCAD0AspzA==
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr6167686wmg.46.1611971565884; 
 Fri, 29 Jan 2021 17:52:45 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b4sm15215041wrn.12.2021.01.29.17.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:52:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
Date: Sat, 30 Jan 2021 02:52:19 +0100
Message-Id: <20210130015227.4071332-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

KVM requires a cpu based on (at least) the ARMv7 architecture.

Only enable the following ARMv4 CPUs when TCG is available:

  - StrongARM (SA1100/1110)
  - OMAP1510 (TI925T)

The following machines are no more built when TCG is disabled:

  - cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
  - sx1                  Siemens SX1 (OMAP310) V2
  - sx1-v1               Siemens SX1 (OMAP310) V1

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak | 2 --
 hw/arm/Kconfig                          | 8 ++++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 341d439de6f..8a53e637d23 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -14,8 +14,6 @@ CONFIG_INTEGRATOR=y
 CONFIG_FSL_IMX31=y
 CONFIG_MUSICPAL=y
 CONFIG_MUSCA=y
-CONFIG_CHEETAH=y
-CONFIG_SX1=y
 CONFIG_NSERIES=y
 CONFIG_STELLARIS=y
 CONFIG_REALVIEW=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 223016bb4e8..7126d82f6ce 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,3 +1,7 @@
+config ARM_V4
+    bool
+    depends on TCG
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -31,6 +35,8 @@ config ARM_VIRT
 
 config CHEETAH
     bool
+    default y if TCG
+    select ARM_V4
     select OMAP
     select TSC210X
 
@@ -249,6 +255,8 @@ config COLLIE
 
 config SX1
     bool
+    default y if TCG
+    select ARM_V4
     select OMAP
 
 config VERSATILE
-- 
2.26.2


