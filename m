Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6058E4ADADC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:11:21 +0100 (CET)
Received: from localhost ([::1]:34210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRDE-0001ym-BS
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:11:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqp-0000kw-Dx
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:08 -0500
Received: from [2a00:1450:4864:20::429] (port=41971
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqm-00024d-IT
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:02 -0500
Received: by mail-wr1-x429.google.com with SMTP id k1so13650596wrd.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fwoBiexU45XLKaINWWKJ9pyjhIoo7bPekJWNYGgC67I=;
 b=GtygNhjHA/S+GLJxsVoDOq29eGHHG0+do2eX2nP8GDdmWrFqOkXot3/BpX4Rfacyiz
 egV1j7ZnmxAIEtqNSCKFiqEaCxD13AKBZzjhVldylGrVe8IzTUcPmwlo6uAFE8S9iOf4
 Df/jPRswFQIEdWd0LHxVHgTv2oNkE2ljBg6OfvGfAfPijAVQWWELE+DBwhbBDjncZ4BD
 1gn2K58lGaS6SOOu5YF4zs25BlVT5aLEDgu+hrHQue8iav/iWxcc1+QP3ArUlHWKqP3h
 /cAOghpC/YfM/WsN9N4QN4iHNa0Z9YtV49f7EXHAYIwtTmMhbPOaOkxSLkFuWIhun3FW
 p9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwoBiexU45XLKaINWWKJ9pyjhIoo7bPekJWNYGgC67I=;
 b=5e5cgNDjff2jEsis3LwQ5KL3NY6GEV4t2za/fNqonsMRutOJnF9gVWbaLY6W0mNvfP
 /3n2EnamdzbFdqyyMl9XGPGLBB1/JJGoDlyXR1ushcNq7GCKH2+A9jdgY01Tc3dRbf+k
 8VvVoPzaPQ7y3eR/6pwKiPinLEDUxViXcSlfKID/UJktgR6FO8kIcdl35HMC8YtQI+ij
 D2Zu15NtkPCUSZmC0AxFDmV3qjGeTKq0JUTFSbKzkNtDjPRE578YYAV+BEVYMSZMkmZs
 imn34Fbn0Htd3bW9Y1zr/n+QGU5+ISDjVqhUCw+Dh1ka29rDvd8aF3pDVyn0TU8xhymS
 kMJg==
X-Gm-Message-State: AOAM530/AtDy/cdqvTwLH9/cuXycQwOaTH0ZiI9hZQY6e5uhqjcWZYxU
 sH0D323P0nFhRPesHiCztvnwRsYBvu6vMg==
X-Google-Smtp-Source: ABdhPJxF+bUiwbTW7zxxOMYsFvKSJoguFYGvhWJghVTfJGPkt8HLPOnxeVIa4HTzULLKpacD8dfRCw==
X-Received: by 2002:adf:d183:: with SMTP id v3mr3238782wrc.538.1644320398635; 
 Tue, 08 Feb 2022 03:39:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/39] hw/arm/virt: Let boot.c handle PSCI enablement
Date: Tue,  8 Feb 2022 11:39:22 +0000
Message-Id: <20220208113948.3217356-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Instead of setting the CPU psci-conduit and start-powered-off
properties in the virt board code, set the arm_boot_info psci_conduit
field so that the boot.c code can do it.

This will fix a corner case where we were incorrectly enabling PSCI
emulation when booting guest code into EL3 because it was an ELF file
passed to -kernel or to the generic loader.  (EL3 guest code started
via -bios or -pflash was already being run with PSCI emulation
disabled.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20220127154639.2090164-9-peter.maydell@linaro.org
---
 hw/arm/virt.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 141350bf215..398145a7180 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2088,17 +2088,6 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "has_el2", false, NULL);
         }
 
-        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
-            object_property_set_int(cpuobj, "psci-conduit", vms->psci_conduit,
-                                    NULL);
-
-            /* Secondary CPUs start in PSCI powered-down state */
-            if (n > 0) {
-                object_property_set_bool(cpuobj, "start-powered-off", true,
-                                         NULL);
-            }
-        }
-
         if (vmc->kvm_no_adjvtime &&
             object_property_find(cpuobj, "kvm-no-adjvtime")) {
             object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NULL);
@@ -2246,6 +2235,7 @@ static void machvirt_init(MachineState *machine)
     vms->bootinfo.get_dtb = machvirt_dtb;
     vms->bootinfo.skip_dtb_autoload = true;
     vms->bootinfo.firmware_loaded = firmware_loaded;
+    vms->bootinfo.psci_conduit = vms->psci_conduit;
     arm_load_kernel(ARM_CPU(first_cpu), machine, &vms->bootinfo);
 
     vms->machine_done.notify = virt_machine_done;
-- 
2.25.1


