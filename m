Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2913DD583
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:19:02 +0200 (CEST)
Received: from localhost ([::1]:35230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWuL-0001vr-Ie
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaT-0000mx-D3
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaR-0003dO-Is
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:29 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b11so15836089wrx.6
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9Zd5jGrXd/MszzUgD83YI5QFWhpJS0mgO3uwRqRD1nw=;
 b=J+QW6OiABTPIpuUTV8cWhVYJ5Amzp2gRnQihTrVaN5HwqgUREHqDkwM+sryejkT5MZ
 oMYWeWkOFxunaa0+U5FZ9Wb2UH4PlsLbsUmx8ItvGlr9RYnbrhh2nfvgEykprU4kTsnB
 8wgxIp7ybFtiEerAbsOW+YjRQG6RGnzeAjhNaX/Me4AXwVGROC4bzSB9XJyvZIdz/A3i
 +E5Y6O2N6cXqxF6iFyJqa3F4I4wXzymhawxFelYAiMctLo9rsdg42RWDUlHfX3GJAmJG
 dIulohDFWFmW+AOnzgmsNGeqpFgLpK2ViB6jRi7VbfxCqthx4/F7S8FX0PLt9t6bUMza
 Y0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Zd5jGrXd/MszzUgD83YI5QFWhpJS0mgO3uwRqRD1nw=;
 b=VosJoaFl6bTDNA0ZtgWJ0WacqLn2Ld4viQJf7HwhWuZZ19OnAp20PoVtv+orwiEhAW
 0qIvI8SRhPnCGiE1RkbqMD2Zq92EiO3wE2zn/ZVZylCAQ0FuVXq1IzRn7HYVRwUkJW0T
 SMm+sy+mr0QBWpBBFwFw5hN+0vpAvhnlhxOi6qYvSuGJBmNfwv0dWXJnkyE6N/kmQHyB
 7IQrBIrwAxhHDEh4vwXXbZ3eYI4ZSHP2HGc3yCq+5/6f0YV0lFp94ZvvW/MYt+g8VWan
 W1Bh20zrNHfVtZVNTyJGZmR0UxsTg/kfuKgt+qYmAsyyYFnc7K68L1TwEmmod0NhQqq5
 I/QQ==
X-Gm-Message-State: AOAM532WvK+Na578D0Ununm0/SI7znBT4DB/TvxpyWzUgWYFvmdE1x00
 axiXiLWpn3q1I4DBswWENtQKZe1g4T9lvA==
X-Google-Smtp-Source: ABdhPJzXz6vK962lHi8euVyJIHYBYJDjauRKL614poI8OpsZRCDwMtlwISay7ff+XbuS9LxJQeCamg==
X-Received: by 2002:adf:d1e4:: with SMTP id g4mr3834468wrd.371.1627905506178; 
 Mon, 02 Aug 2021 04:58:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/21] hw/arm/boot: Report error if there is no fw_cfg device
 in the machine
Date: Mon,  2 Aug 2021 12:58:08 +0100
Message-Id: <20210802115812.10731-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

If the user provides both a BIOS/firmware image and also a guest
kernel filename, arm_setup_firmware_boot() will pass the
kernel image to the firmware via the fw_cfg device. However we
weren't checking whether there really was a fw_cfg device present,
and if there wasn't we would crash.

This crash can be provoked with a command line such as
 qemu-system-aarch64 -M raspi3 -kernel /dev/null -bios /dev/null -display none

It is currently only possible on the raspi3 machine, because unless
the machine sets info->firmware_loaded we won't call
arm_setup_firmware_boot(), and the only machines which set that are:
 * virt (has a fw-cfg device)
 * sbsa-ref (checks itself for kernel_filename && firmware_loaded)
 * raspi3 (crashes)

But this is an unfortunate beartrap to leave for future machine
model implementors, so we should handle this situation in boot.c.

Check in arm_setup_firmware_boot() whether the fw-cfg device exists
before trying to load files into it, and if it doesn't exist then
exit with a hopefully helpful error message.

Because we now handle this check in a machine-agnostic way, we
can remove the check from sbsa-ref.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/503
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210726163351.32086-1-peter.maydell@linaro.org
---
 hw/arm/boot.c     | 9 +++++++++
 hw/arm/sbsa-ref.c | 7 -------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d7b059225e6..57efb61ee41 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1243,6 +1243,15 @@ static void arm_setup_firmware_boot(ARMCPU *cpu, struct arm_boot_info *info)
         bool try_decompressing_kernel;
 
         fw_cfg = fw_cfg_find();
+
+        if (!fw_cfg) {
+            error_report("This machine type does not support loading both "
+                         "a guest firmware/BIOS image and a guest kernel at "
+                         "the same time. You should change your QEMU command "
+                         "line to specify one or the other, but not both.");
+            exit(1);
+        }
+
         try_decompressing_kernel = arm_feature(&cpu->env,
                                                ARM_FEATURE_AARCH64);
 
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 43c19b49234..c1629df6031 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -691,13 +691,6 @@ static void sbsa_ref_init(MachineState *machine)
 
     firmware_loaded = sbsa_firmware_init(sms, sysmem, secure_sysmem);
 
-    if (machine->kernel_filename && firmware_loaded) {
-        error_report("sbsa-ref: No fw_cfg device on this machine, "
-                     "so -kernel option is not supported when firmware loaded, "
-                     "please load OS from hard disk instead");
-        exit(1);
-    }
-
     /*
      * This machine has EL3 enabled, external firmware should supply PSCI
      * implementation, so the QEMU's internal PSCI is disabled.
-- 
2.20.1


