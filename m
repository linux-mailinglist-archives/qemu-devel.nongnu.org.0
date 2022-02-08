Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4374ADACE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:07:32 +0100 (CET)
Received: from localhost ([::1]:53662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHR9X-0004OB-3q
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:07:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-0000l7-No
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:08 -0500
Received: from [2a00:1450:4864:20::436] (port=38572
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqm-00025w-KT
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:04 -0500
Received: by mail-wr1-x436.google.com with SMTP id s10so27592396wra.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pWyIdAyiNvL5aeMyV/2dz6HORKREdSQ7gC9teOnHGYE=;
 b=qADBOkj9jv4Fee3l4jFHPE+B0o+ZM3dEI5l82FzN27PIcBmmD5fDS8zkI3IVeXY41M
 o/hJTrzTg76pcPthPntcuSJHznkChjrqzxRBr3azqlXqn+h4IR40T1RzvI7Ektz/q5pc
 FaKvSTaYKLf1/IxSvNaNEKEGcFCDwtFcF9JzyCSScm75LHi5KHfIk+yKuivzq66Y/JKj
 d9LiXv++7UI2w1rOuH0185vNiWBJY1s/w2bHKoMqjdhlg9i7NB+xC/GY70fKkNwWr44D
 5+MJbVjtywsNz4ZEjZoshgEGUdMAbNzXT/hL9//TLYH1XjFbbHf74JYG2K9ELSG403+Z
 UULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pWyIdAyiNvL5aeMyV/2dz6HORKREdSQ7gC9teOnHGYE=;
 b=WE9GKpEptWgcnrH1v9P7NjriApeKQ3yjh0JGY13d7ucW7hOkeWs3KocBldzKWgDo0B
 UL38e+0AP6zDcmOi/bJ3bKBiOb87rFz5+TlPqirv5VVLG0Db1fV5FNWOhUoDNLimQoGN
 6//QYRIUbNsTQJlkeUz/JGM3meD7ayrtBGDOPhpsuAueg0YIgUKVdhBq6vhM8jETBwbm
 eg9A9Wt+msoZT7f4gtFMMFUZwWhGJcJuwAtEe9SjzRMZststKORfsXR8ffD2FGcwKAqL
 GGmR5VmuK7R2JZZwKazoNnDmEFg4CHQ9r8WsMhKXItPCzLbv6pf98blcsEkfPQJ6WO5w
 drWQ==
X-Gm-Message-State: AOAM531E+xJ3RrpnnRvSK7ddOLn2Or1F4mIpeFqBsOpGgfks4pmJe0sE
 PKAFCR5vJHebizq9NYg+LMmTR2m58RCShw==
X-Google-Smtp-Source: ABdhPJz5EUS3taFK5q1bwnt3qML8cgI4tT82LDGdWIR4TroBWIuwhLwNcfG0meyQlyLFrTao91Oqug==
X-Received: by 2002:a5d:64e9:: with SMTP id g9mr3209948wri.341.1644320399335; 
 Tue, 08 Feb 2022 03:39:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/39] hw/arm: highbank: For EL3 guests, don't enable PSCI,
 start all cores
Date: Tue,  8 Feb 2022 11:39:23 +0000
Message-Id: <20220208113948.3217356-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Change the highbank/midway boards to use the new boot.c functionality
to allow us to enable psci-conduit only if the guest is being booted
in EL1 or EL2, so that if the user runs guest EL3 firmware code our
PSCI emulation doesn't get in its way.

To do this we stop setting the psci-conduit and start-powered-off
properties on the CPU objects in the board code, and instead set the
psci_conduit field in the arm_boot_info struct to tell the common
boot loader code that we'd like PSCI if the guest is starting at an
EL that it makes sense with (in which case it will set these
properties).

This means that when running guest code at EL3, all the cores
will start execution at once on poweron. This matches the
real hardware behaviour. (A brief description of the hardware
boot process is in the u-boot documentation for these boards:
https://u-boot.readthedocs.io/en/latest/board/highbank/highbank.html#boot-process
 -- in theory one might run the 'a9boot'/'a15boot' secure monitor
code in QEMU, though we probably don't emulate enough for that.)

This affects the highbank and midway boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20220127154639.2090164-10-peter.maydell@linaro.org
---
 hw/arm/highbank.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 4210894d814..048f8550cb9 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -271,12 +271,6 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         object_property_set_int(cpuobj, "psci-conduit", QEMU_PSCI_CONDUIT_SMC,
                                 &error_abort);
 
-        if (n) {
-            /* Secondary CPUs start in PSCI powered-down state */
-            object_property_set_bool(cpuobj, "start-powered-off", true,
-                                     &error_abort);
-        }
-
         if (object_property_find(cpuobj, "reset-cbar")) {
             object_property_set_int(cpuobj, "reset-cbar", MPCORE_PERIPHBASE,
                                     &error_abort);
@@ -397,6 +391,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
     highbank_binfo.write_board_setup = hb_write_board_setup;
     highbank_binfo.secure_board_setup = true;
+    highbank_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
 
     arm_load_kernel(ARM_CPU(first_cpu), machine, &highbank_binfo);
 }
-- 
2.25.1


